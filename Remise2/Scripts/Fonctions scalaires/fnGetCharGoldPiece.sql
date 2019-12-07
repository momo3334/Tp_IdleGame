SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION dbo.fnGetCharGoldPiece(@CharID INT)
RETURNS INT
AS
BEGIN
	DECLARE @currentGP INT
	SET @currentGP = (SELECT CharGP FROM Characters WHERE (CharID = @CharID))
	RETURN @currentGP
END
