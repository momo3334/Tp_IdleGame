SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE spBuyItems @charID INT
AS
BEGIN
	DECLARE @equipID INT
	DECLARE @equipType INT
	DECLARE @equipTypeName NVARCHAR(50)
	SET @equipID = (SELECT TOP 1 EquipID FROM Equipements ORDER BY NEWID())
	SET @equipType = (SELECT Equipements.EquipEquipTypeID FROM Equipements WHERE (EquipID = @equipID))
	SET @equipTypeName = (SELECT EquipTypeName FROM Equipements INNER JOIN EquipType ON EquipEquipTypeID = EquipTypeID WHERE (EquipID = @equipID))
	
	IF @equipTypeName = 'Casque'
	BEGIN
		UPDATE Characters SET CharHead = 1 WHERE (@charID = CharID)
	END
	ELSE IF @equipTypeName = 'Gants'
	BEGIN
		UPDATE Characters SET CharGloves = 1 WHERE (@charID = CharID)
	END
	ELSE IF @equipTypeName = 'Bottes'
	BEGIN
		UPDATE Characters SET CharBoots = 1 WHERE (@charID = CharID)
	END
	ELSE IF @equipTypeName = 'Arme'
	BEGIN
		UPDATE Characters SET CharWeap1 = 1 WHERE (@charID = CharID)
	END
	
END
