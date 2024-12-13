USE Doomsday
GO;

-- Count the number of viruses for each danger rating.
CREATE VIEW view_VirusCountForEachDangerRating 
AS
SELECT virusDangerRating AS DangerRating,
	COUNT(virusKey) AS NumOfViruses
FROM Virus
GROUP BY virusDangerRating
GO

-- Count the number of viruses for each transmission method.
CREATE VIEW view_VirusCountForEachTransmission
AS
SELECT t.transmissionMethodKey AS TransmissionID,
	t.transmissionMethod AS TransmissionMethod,
	COUNT(vt.virusKey) AS NumOfViruses
FROM VirusTransmission AS t
LEFT JOIN VirusTransmissionDetails AS vt
	ON t.transmissionMethodKey = vt.transmissionMethodKey
GROUP BY t.transmissionMethodKey,
	t.transmissionMethod
GO

-- Determine the water source rating of all location.
-- Best water source means the average value between safety and abundance rating is 10.
CREATE VIEW view_WaterSourceRating
AS
SELECT w.waterName AS WaterSource,
		w.locationKey AS LocationID,
		l.locationName AS LocationName,
		w.waterSafetyRating AS SafetyRating,
		w.waterAbundanceRating AS AbundanceRating,
		CAST(((w.waterSafetyRating + w.waterAbundanceRating) / 2.0) AS DECIMAL(3, 1)) AS SourceRating
FROM water AS w
INNER JOIN locations AS l
	ON w.locationKey = l.locationKey
GO

-- Lodgings from safe locations.
CREATE VIEW view_SafeLodgings
AS
SELECT lg.locationKey AS LocationID,
	lc.locationName AS LocationName,
	lg.lodgingKey AS LodgingID,
	lg.lodgingName AS LodgingName,
	lg.lodgingComfortRating AS ComfortRating
FROM Lodging AS lg
INNER JOIN Locations AS lc
	ON lg.locationKey = lc.locationKey
WHERE lc.locationSafe = 1
GO
