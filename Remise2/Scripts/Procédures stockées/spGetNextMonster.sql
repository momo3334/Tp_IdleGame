USE [BD_IdleGame]
GO
/****** Object:  StoredProcedure [dbo].[spGetNextMonster]    Script Date: 2019-12-03 22:57:17 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[spGetNextMonster]
@charID INT,
@dungeonID INT
AS
BEGIN
	SELECT MonsterBundleMonsterID AS [MonsterBundleMonsterID], MonsterQty AS [MonsterQty] INTO #Temp FROM MonsterBundle WHERE MonsterBundleDungeonID = @dungeonID

	

	ALTER TABLE #Temp ADD row_id INT IDENTITY(1,1)
	 

	DECLARE @count INT
	DECLARE @row INT
	SET @row = 1
	SET @count = (SELECT COUNT(row_id) FROM #Temp)
	WHILE (@row <= @count)
	BEGIN
		DECLARE @monsterRow INT
		DECLARE @monsterNumber INT
		DECLARE @monsterID INT
		DECLARE @monsterHP INT
		SET @monsterRow = 1
		SET @monsterNumber = (SELECT MonsterQty FROM #Temp WHERE row_id = @row)
		SET @monsterID = (SELECT MonsterBundleMonsterID FROM #Temp WHERE row_id = @row)
		WHILE (@monsterRow <= @monsterNumber)  
			BEGIN 
				SET @monsterHP = 10
				INSERT INTO Fights(FightMonsterID, FightMonsterHP, FightCharID) VALUES (@monsterID, @monsterHP, @charID)
				SET @monsterRow += 1
			END
		SET @row += 1
	END

	

END
