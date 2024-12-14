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

-- View power structures that neeeds repair.
CREATE VIEW view_NeedRepairPowerStructures
AS
SELECT *
FROM Power
WHERE powerStatus LIKE 'Needs Repair';
GO

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
GO

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
GO

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

	
-- Retrieves all spots in the Greenhouse, the plants growing in them, the date they were last watered,
-- and calculates when next they should be watered.
CREATE VIEW view_GreenhouseNextWaterDate -- AB
AS
	SELECT gh.spotKey AS 'Spot Key',
		pl.plantWaterFrequency AS 'Water Frequency',
		pl.plantName AS 'Plant Name', 
		FORMAT(gh.lastWatered, 'd') AS 'Last Watered',
		FORMAT(DATEADD(DAY, pl.plantWaterFrequency, gh.lastWatered), 'd') AS 'Next Watering'
	FROM Greenhouse AS gh
	JOIN Plants AS pl ON pl.plantKey = gh.plantKey
	ORDER BY DATEADD(DAY, pl.plantWaterFrequency, gh.lastWatered) OFFSET 0 ROWS;
GO


-- Retrieves spots in the Greenhouse that need to be watered
-- Default lastWatered values are set in the year 2046, so this won't return any rows for another 22 years.
CREATE VIEW view_GreenhouseNeedsWatering -- AB
AS
	SELECT gh.spotKey AS Spot_Key,
		pl.plantWaterFrequency AS 'Water Frequency',
		pl.plantName AS 'Plant Name', 
		FORMAT(gh.lastWatered, 'd') AS 'Last Watered',
		DATEDIFF(Day, DATEADD(DAY, pl.plantWaterFrequency, gh.lastWatered), GETDATE()) AS 'Days Since Plant Needed Water'
	FROM Greenhouse AS gh
	JOIN Plants AS pl ON pl.plantKey = gh.plantKey
	WHERE DATEADD(DAY, pl.plantWaterFrequency, gh.lastWatered) <= GETDATE()
	ORDER BY DATEADD(DAY, pl.plantWaterFrequency, gh.lastWatered) OFFSET 0 ROWS;
GO

-- Retrieves everyone who isn't associated with a faction
CREATE VIEW view_NotAssociatedWFaction
AS
	SELECT * 
	FROM People AS pe
	WHERE pe.factionKey IS NULL;
GO

-- Retrieve currency total for each Faction by currency item
CREATE VIEW view_CurrencyByFaction
AS
	SELECT f.factionName AS Faction, it.itemName AS Currency, c.value AS Value, iv.inventoryQty AS Ounces, SUM(c.value * iv.inventoryQty) AS 'Total Value'
	FROM Currency AS c
	INNER JOIN Items as it ON c.itemKey = it.itemKey
	INNER JOIN Inventory AS iv ON c.itemKey = iv.itemKey
	INNER JOIN Factions AS f ON iv.factionKey = f.factionKey
	GROUP BY f.factionName, it.itemName, c.value, iv.inventoryQty;
GO
