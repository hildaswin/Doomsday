USE Doomsday
GO;

-- Count the number of viruses for each danger rating.
CREATE VIEW view_VirusCountForEachDangerRating 
AS
SELECT virusDangerRating AS DangerRating,
	COUNT(virusKey) AS NumOfViruses
FROM Virus
GROUP BY virusDangerRating;
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
	t.transmissionMethod;
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
	ON w.locationKey = l.locationKey;
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
WHERE lc.locationSafe = 1;
GO

-- Top 10 most dangerous virus
SELECT TOP 10
	virusKey AS VirusID,
	virusName AS VirusName,
	virusEffect AS Effect,
	virusDangerRating AS DangerRating
FROM Virus
ORDER BY virusDangerRating DESC;
GO;

-- Top 10 best lodgings.
-- Only includes lodgings from safe locations.
SELECT TOP 10
	lg.locationKey AS LocationID,
	lc.locationName AS LocationName,
	lg.lodgingKey AS LodgingID,
	lg.lodgingName AS LodgingName,
	lg.lodgingComfortRating AS ComfortRating
FROM Lodging AS lg
INNER JOIN Locations AS lc
	ON lg.locationKey = lc.locationKey
WHERE lc.locationSafe = 1
ORDER BY lg.lodgingComfortRating DESC;
GO;

-- Resources Shared Between Factions
-- identifies shared items among multiple factions.

SELECT 
    inv.itemKey AS ItemID,
    i.itemName AS ItemName,
    COUNT(DISTINCT inv.factionKey) AS NumFactions
FROM Inventory inv
INNER JOIN Items i ON inv.itemKey = i.itemKey
GROUP BY inv.itemKey, i.itemName
HAVING COUNT(DISTINCT inv.factionKey) > 1
ORDER BY NumFactions DESC;
GO;

--Find Locations with Most Resources
--locations with the most variety of items in their inventory.

SELECT 
    l.locationKey AS LocationID,
    l.locationName AS LocationName,
    COUNT(DISTINCT i.itemKey) AS TotalItems
FROM Locations l
INNER JOIN Factions f ON l.locationKey = f.locationKey
INNER JOIN Inventory inv ON f.factionKey = inv.factionKey
INNER JOIN Items i ON inv.itemKey = i.itemKey
GROUP BY l.locationKey, l.locationName
ORDER BY TotalItems DESC;
GO;

-- Retrieves all viruses without any recorded transmission methods.
CREATE VIEW view_VirusWithoutTransmission
AS
SELECT v.virusKey,
	v.virusName,
	v.virusDangerRating
FROM Virus AS v
LEFT JOIN VirusTransmissionDetails AS vt
	ON v.virusKey = vt.virusKey
WHERE vt.transmissionMethodKey IS NULL;
GO
	
-- Retrieves all locations without any recorded water sources.
CREATE VIEW view_LocationWithoutWater
AS
SELECT lc.locationKey,
	lc.locationName,
	w.waterKey
FROM Locations AS lc
LEFT JOIN Water AS w
	ON lc.locationKey = w.locationKey
WHERE w.waterKey IS NULL;
GO
	
-- Retrieves all locations without any recorded lodgings.
CREATE VIEW view_LocationWithoutLodging
AS
SELECT lc.locationKey,
	lc.locationName,
	lg.lodgingKey
FROM Locations AS lc
LEFT JOIN Lodging AS lg
	ON lc.locationKey = lg.locationKey
WHERE lg.locationKey IS NULL;
GO
