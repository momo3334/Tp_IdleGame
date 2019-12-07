SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE spMonsterHit @charID INT, @monsterID INT
AS
BEGIN
	DECLARE @charCurrentHP INT
	DECLARE @monsterDamage INT

	SET @charCurrentHP = (SELECT CharHP FROM Characters WHERE(CharID = @charID))
	SET @monsterDamage = (SELECT MonsterDmg FROM Monsters WHERE (MonsterID = @monsterID))

	IF ((@charCurrentHP - @monsterDamage) < 0)
	BEGIN
		SET @charCurrentHP = 0
	END
	ELSE
	BEGIN
		SET @charCurrentHP = (@charCurrentHP - @monsterDamage)
	END

	UPDATE Characters SET CharHP = @charCurrentHP WHERE CharID = @charID
END