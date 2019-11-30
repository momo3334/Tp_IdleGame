CREATE PROCEDURE spCreateBundle 
@dunID integer, @monsID integer, @qty integer
AS
INSERT INTO MonsterBundle
VALUES(@monsID, @dunID, @qty)
GO