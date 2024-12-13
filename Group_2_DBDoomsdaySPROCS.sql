USE Doomsday
GO;

-- Retrieves the transmission methods for the specified virus,
-- passing the virus id or name.
CREATE PROCEDURE sp_VirusTransmissionMethods
	@virusKey VARCHAR(8) = Null,
	@virusName VARCHAR(50) = Null
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @sql NVARCHAR(MAX);

	SET @sql = 'SELECT v.virusKey AS VirusID,
					v.virusName AS VirusName,
					t.transmissionMethodKey AS TransmissionID,
					t.transmissionMethod AS TransmissionMethod
				FROM VirusTransmission AS t
				INNER JOIN VirusTransmissionDetails AS vt
					ON t.transmissionMethodKey = vt.transmissionMethodKey
				INNER JOIN Virus AS v
					ON vt.virusKey = v.virusKey
				WHERE 1=1';

	IF @virusKey IS NOT NULL
	BEGIN
		SET @sql += ' AND v.virusKey = @virusKey';
	END
	ELSE IF @virusName IS NOT NULL
	BEGIN
		SET @sql += ' AND v.virusName = @virusName';
	END
	ELSE
	BEGIN
		PRINT 'No Virus ID or Name Entered.';
		RETURN;
	END

	EXEC sp_executesql @sql, 
		N'@virusKey VARCHAR(8), 
		@virusName VARCHAR(50)', 
		@virusKey, 
		@virusName;
END;
GO

-- Updates the rating of a record in a table.
-- The rating column must contain the word 'rating', otherwise,
-- this SP can be used to update any column, which may not be rating related.
CREATE PROCEDURE sp_UpdateRating
	@tableName VARCHAR(50),
	@recordIDColumn VARCHAR(50),
	@recordIDValue VARCHAR(8),
	@ratingColumn VARCHAR(50),
	@ratingValue TINYINT
AS
BEGIN
	SET NOCOUNT ON;


	IF @ratingColumn LIKE '%rating%'
	BEGIN
		DECLARE @sql NVARCHAR(MAX);

		SET @sql = 'UPDATE ' + @tableName +
					' SET ' + @ratingColumn + ' = @ratingValue' +
					' WHERE ' + @recordIDColumn + ' = @recordIDValue';

		EXEC sp_executesql @sql, 
			N'@ratingValue TINYINT,
			@recordIDValue VARCHAR(8)',
			@ratingValue,
			@recordIDValue;
	END
	ELSE
	BEGIN
		PRINT 'The rating column must contain the word ''rating''.';
	END
END;
GO

-- Best water sources in a location,
-- where best source means the average value between the safety and abundance rating is 10.
CREATE PROCEDURE sp_BestWaterSources
	@locationKey VARCHAR(8) = NULL,
	@locationName VARCHAR(50) = NULL
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @sql NVARCHAR(MAX);

	SET @sql = 'SELECT w.waterName AS WaterSource,
						w.waterSafetyRating AS SafetyRating,
						w.waterAbundanceRating AS AbundanceRating,
						CAST(((w.waterSafetyRating + w.waterAbundanceRating) / 2.0) AS DECIMAL(3, 1)) AS SourceRating
				FROM water AS w
				INNER JOIN locations AS l
					ON w.locationKey = l.locationKey
				WHERE 1=1';

	IF @locationKey IS NOT NULL
	BEGIN
		 SET @sql += ' AND w.locationKey = @locationKey';
	END
	ELSE IF @locationName IS NOT NULL
	BEGIN
		SET @sql += ' AND l.locationName = @locationName';
	END
	ELSE
	BEGIN
		PRINT 'No location key or name entered.';
		RETURN;
	END

	SET @sql += ' ORDER BY CAST(((w.waterSafetyRating + w.waterAbundanceRating) / 2.0) AS DECIMAL(4, 2)) DESC';

	EXEC sp_executesql @sql, 
		N'@locationKey VARCHAR(8), 
		@locationName VARCHAR(50)', 
		@locationKey, 
		@locationName;
END;
GO

-- Most comfortable lodging in the specified location,
-- passing the locations id or name.
CREATE PROCEDURE sp_MostComfortableLodgingOfLocation
	@locationKey VARCHAR(8) = Null,
	@locationName VARCHAR(50) = Null
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @sql NVARCHAR(MAX);

	SET @sql = 'SELECT lg.lodgingKey AS LodgingID,
					lg.lodgingName AS LodgingName,
					lg.lodgingComfortRating AS ComfortRating
				FROM Lodging AS lg
				INNER JOIN Locations AS lc
					ON lg.locationKey = lc.locationKey
				WHERE 1=1';

	IF @locationKey IS NOT NULL
	BEGIN
		SET @sql += ' AND lg.locationKey = @locationKey';
	END
	ELSE IF @locationName IS NOT NULL
	BEGIN
		SET @sql += ' AND lc.locationName = @locationName';
	END
	ELSE
	BEGIN
		PRINT 'No Location ID or Name Entered.';
		RETURN;
	END

	SET @sql += ' ORDER BY lg.lodgingComfortRating DESC';

	EXEC sp_executesql @sql, 
		N'@locationKey VARCHAR(8), 
		@locationName VARCHAR(50)', 
		@locationKey, 
		@locationName;
END;
GO