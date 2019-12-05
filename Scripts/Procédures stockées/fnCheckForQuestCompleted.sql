USE [BD_IdleGame]
GO
/****** Object:  UserDefinedFunction [dbo].[fnCheckIfQuestCompleted]    Script Date: 2019-12-04 13:48:25 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION fnCheckForQuestCompleted(@CharID INT)
RETURNS INT
AS
BEGIN
	DECLARE @questCompleted BIT
	DECLARE @monsterLeftInDungeon INT
	SET @monsterLeftInDungeon = (SELECT COUNT(FightID) FROM (SELECT FightID FROM Fights WHERE (FightCharID = @CharID)) t)

	--If theres no more monster to fight in the current dungeon
	IF (@monsterLeftInDungeon = 0)
	BEGIN
		SET @questCompleted = 1
	END
	--If theres still monsters to fight in the current dungeon
	ELSE
	BEGIN
		SET @questCompleted = 0
	END

	RETURN @questCompleted
END
