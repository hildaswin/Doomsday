USE Doomsday
GO;


-- Triggers when a new virus or an old virus has been added/updated with a
-- danger rating of 10.
CREATE TRIGGER trg_TriggerWhenNewDeadlyVirusDetected
ON Virus
AFTER INSERT, UPDATE
AS
BEGIN
	DECLARE @virusKey VARCHAR(8);
	DECLARE @virusName VARCHAR(50);
	
	SELECT @virusKey = i.virusKey FROM inserted AS i;
	SELECT @virusName = i.virusName FROM inserted AS i;

	IF EXISTS (SELECT 1 FROM inserted AS i WHERE i.virusDangerRating = 10)
	BEGIN
		DECLARE @message VARCHAR(200) = 'Virus with a danger rating of 10 has been detected. VirusID: ' +
										@virusKey + ' - VirusName: ' + @virusName;

		RAISERROR(@message, 16, 1);
	END
END;
GO
