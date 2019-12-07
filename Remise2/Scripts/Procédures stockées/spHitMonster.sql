SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE spHitMonster
@fightID integer, @charID integer
AS
BEGIN
	DECLARE @monsterCurrentHP INT
	DECLARE @charDamage INT

	SET @monsterCurrentHP = (SELECT FightMonsterHP FROM Fights WHERE(FightID = @fightID))
	SET @charDamage = (SELECT CharStr FROM Characters WHERE (CharID = @charID))

	IF ((@monsterCurrentHP - @charDamage) < 0)
	BEGIN
		SET @monsterCurrentHP = 0
	END
	ELSE
	BEGIN
		SET @monsterCurrentHP = (@monsterCurrentHP - @charDamage)
	END

	UPDATE Fights SET FightMonsterHP = @monsterCurrentHP WHERE FightID = @fightID;
END
