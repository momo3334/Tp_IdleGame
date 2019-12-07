SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE dbo.spGetMonsterHP
@CharID INT,
@monsterHP INT OUTPUT,
@monsterMaxHP INT OUTPUT
AS
BEGIN
	DECLARE @fightID INT
	EXECUTE dbo.spGetNextMonster @CharID, @fightID = @fightID OUTPUT
	SET @monsterHP = (SELECT TOP 1 FightMonsterHP FROM Fights WHERE (FightID = @fightID))
	SET @monsterMaxHP = (SELECT TOP 1 FightMonsterMaxHP FROM Fights WHERE (FightID = @fightID))
END