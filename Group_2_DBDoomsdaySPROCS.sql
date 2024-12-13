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



-- Updates the lastWatered column of a row in the Greenhouse
CREATE PROCEDURE sp_WaterPlant -- AB
@spotKey AS VARCHAR(8) = NULL
AS
BEGIN
	SET NOCOUNT ON;

	IF @spotkey IS NOT NULL
		AND EXISTS (SELECT * FROM Greenhouse WHERE spotKey = @spotKey)
	BEGIN
		UPDATE Greenhouse
		SET lastWatered = GETDATE()
		WHERE spotKey = @spotKey;
		PRINT 'Plant Watered Successfully';
	END
	ELSE PRINT 'Unable to water plant. Please check the input spotKey.'
END;
GO


-- Adds either a new weapon to the Items table, a new Ammo type to the Ammo table, or both.
-- If both are added, may also connect them via the WeaponAmmo table
CREATE PROCEDURE sp_AddWeaponAndOrAmmo -- AB
@addWeapon AS BIT = 0,
@weaponName AS VARCHAR(20),
@weaponInfo AS TEXT = NULL,

@addAmmo AS BIT = 0,
@ammoName AS VARCHAR(20),

@isAmmoForWeapon AS BIT = 0

AS
BEGIN
	SET NOCOUNT ON;

	-- Get the typeKey of the Weapon item type. This helps protect the procedure from future changes to the ItemType table.
	DECLARE @itemTypeWeapon AS VARCHAR(8) = (SELECT TOP 1 typeKey FROM ItemType WHERE typeName = 'Weapon');

	IF @addWeapon = 1
	BEGIN
		-- Establishes the itemKey of the new weapon
		DECLARE @newestItemKey AS VARCHAR(8) = (SELECT TOP 1 itemKey FROM Items ORDER BY itemKey DESC); -- Get the newest added itemKey from the Items table
		DECLARE @nextItemKeyNum AS INT = CAST(SUBSTRING(@newestItemKey, 3, LEN(@newestItemKey)) AS INT ) + 1; -- Get the number from the end of the newest itemKey
		-- Concat 'IT', trailing zeroes, and the number of the new key to form the full key
		DECLARE @weaponKey AS VARCHAR(8) = CONCAT('IT', REPLICATE('0', 4-LEN(@nextItemKeyNum)), @nextItemKeyNum);

		INSERT INTO Items(itemKey, typeKey, itemName, itemInfo)
		VALUES(@weaponKey, @itemTypeWeapon, @weaponName, @weaponInfo);

		PRINT CONCAT('Weapon "', @weaponName, '" added successfully');
	END

	IF @addAmmo = 1
	BEGIN
		-- Establishes the key of the new ammo
		DECLARE @newestAmmoKey AS VARCHAR(8) = (SELECT TOP 1 ammoKey FROM Ammo ORDER BY ammoKey DESC); -- Get the newest added ammoKey from the Ammo table
		DECLARE @nextAmmoKeyNum AS INT = CAST(SUBSTRING(@newestAmmoKey, 3, LEN(@newestAmmoKey)) AS INT ) + 1; -- Get the number from the end of the newest ammoKey
		-- Concat 'AM', trailing zeroes, and the number of the new key to form the full key
		DECLARE @ammoKey AS VARCHAR(8) = CONCAT('AM', REPLICATE('0', 4-LEN(@nextAmmoKeyNum)), @nextAmmoKeyNum);

		INSERT INTO Ammo(ammoKey, ammoName)
		VALUES(@ammoKey, @ammoName);

		PRINT CONCAT('Ammo type "', @ammoName, '" added successfully');
	END

	IF @isAmmoForWeapon = 1 AND @addAmmo = 1 AND @addWeapon = 1
	BEGIN
		INSERT INTO WeaponAmmo(itemKey, ammoKey)
		VALUES (@weaponKey, @ammoKey);
		PRINT ('Weapon and Ammo linked successfully.');
	END
END;
GO

