SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE dbo.spGetMonsterMaxHP
@CharID INT,
@monsterHP INT OUTPUT
AS
BEGIN
	DECLARE @fightID INT
	SET @fightID = (SELECT dbo.fnGetCurrentMonsterHPFromID(@CharID))
	SET @monsterHP = (SELECT TOP 1 FightMonsterHP FROM Fights WHERE (FightID = @fightID))
END