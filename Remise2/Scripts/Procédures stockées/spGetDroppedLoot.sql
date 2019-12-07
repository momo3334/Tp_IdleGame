CREATE PROCEDURE spGetDroppedLoot @charID INT
AS
BEGIN
	DECLARE @lootID INT
	DECLARE @charlootID INT
	SET @lootID = (SELECT TOP 1 LootID FROM Loots ORDER BY NEWID())
	SET @charlootID = (SELECT CharLootLootID FROM CharLoot WHERE (CharLootCharacterID = @charID AND CharLootLootID = @lootID))
	IF @charlootID IS NULL
	BEGIN
		INSERT INTO CharLoot(CharLootLootID,CharLootCharacterID,CharLootQty) VALUES (@charlootID,@charID, 1)
	END
	ELSE
	BEGIN
		DECLARE @charLootQty INT
		SET @charLootQty = @charLootQty + 1
		DELETE FROM CharLoot WHERE CharLootID = @charlootID
		INSERT INTO CharLoot(CharLootLootID,CharLootCharacterID,CharLootQty) VALUES (@charlootID,@CharID, 1)
	END
END