ALTER PROCEDURE spLoadBundleIntoFight
@charID INT,
@dungeonID INT
AS
SELECT MonsterBundleMonsterID AS [MonsterBundleMonsterID], MonsterQty AS [MonsterQty] INTO #Temp FROM MonsterBundle WHERE MonsterBundleDungeonID = @dungeonID

ALTER TABLE #Temp ADD rowID INT IDENTITY(1,1)
BEGIN



	DECLARE @count INT
	DECLARE @row INT
	SET @row = 1
	SET @count = (SELECT COUNT(rowID) FROM #Temp)
	WHILE (@row <= @count)
	BEGIN

		DECLARE @monsterRow INT
		DECLARE @monsterNumber INT
		DECLARE @monsterID INT
		DECLARE @monsterHP INT
		SET @monsterRow = 1
		SET @monsterNumber = (SELECT MonsterQty FROM #Temp WHERE rowID = @row)
		SET @monsterID = (SELECT MonsterBundleMonsterID FROM #Temp WHERE rowID = @row)
		SET @monsterHP = (SELECT MonsterHP FROM Monsters INNER JOIN #Temp ON MonsterBundleMonsterID = Monsters.MonsterID WHERE rowID = @row)
		WHILE (@monsterRow <= @monsterNumber)  
			BEGIN 
				INSERT INTO Fights(FightMonsterID, FightMonsterHP, FightCharID) VALUES (@monsterID, @monsterHP, @charID)
				SET @monsterRow += 1
			END
		SET @row += 1
	
	END
END