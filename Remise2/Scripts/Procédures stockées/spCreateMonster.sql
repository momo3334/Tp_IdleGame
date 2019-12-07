CREATE PROCEDURE spCreateMonster
@level INTEGER, @hp INTEGER, @dmg INTEGER, @name NVARCHAR(50)
AS
INSERT INTO Monsters
VALUES (@name, @level, @hp, @dmg)