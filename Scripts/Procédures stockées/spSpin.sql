SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE spSpin
	@CharID INT,
	@actionString NVARCHAR(2048) OUTPUT
AS
BEGIN

	--Getting character status
	DECLARE @charStatus NVARCHAR(50)
	SET @charStatus = (SELECT CharStatus FROM Characters WHERE CharID = @CharID)

	--If character is in his village
	IF (@charStatus = 'Village')
	BEGIN
		--Get character Weight
		DECLARE @charWeight INT
		SET @charWeight = (SELECT dbo.fnGetCharWeight(@CharID))
		
		--Get character GoldPieces
		DECLARE @charGold INT
		SET @charGold = (SELECT dbo.fnGetCharGoldPiece(@CharID))

		--If Character has something in his inventory --TODO CHECK FOR WEIGHT -> MINUS EQUIPEMENT WEIGHT
		IF (@charWeight > 0 AND @charGold > 0)
		BEGIN
			EXEC dbo.spSetCharStatus @CharID, 'Acheter'
			SET @actionString = 'j''achetes dequoi..'
		END
		ELSE 
		BEGIN
		EXEC dbo.spSetCharStatus @CharID, 'BesoinQuete'
			SET @actionString = 'Besoin d''une quete..'
		END
	END

	ELSE IF (@charStatus = 'BesoinQuete')
	BEGIN
		--Checking Current Quest
		DECLARE @currentQuestID INT SELECT @currentQuestID = dbo.fnGetCurrentQuest(@CharID)
		DECLARE @currentQuestName NVARCHAR(50)
		SET @currentQuestName = (SELECT QuestName FROM Quests WHERE QuestID = @currentQuestID)

			IF (@currentQuestName = NULL)
				BEGIN
					--Generating random quest ID
					DECLARE @questID INT; 
					EXECUTE dbo.spGenerateRandomQuestID @questID = @questID OUTPUT

					--Affecting the generated quest to the character
					EXECUTE dbo.spSetCurrentQuestFromID @questID, @charID
					EXEC dbo.spSetCharStatus @CharID, 'Quete'
					SET @actionString = (SELECT QuestName FROM Quests WHERE QuestID = @questID)
				END
			ELSE
				BEGIN
					SET @actionString = @currentQuestName
			END
	END
	--If character is about to hit an enemy
	ELSE IF (@charStatus = 'Coup')
	BEGIN
		SELECT ''
	END
	--If enemy is about to hit the character
	ELSE IF (@charStatus = 'CoupMonstre')
	BEGIN
		SELECT ''
	END
	--If character is in a quest
	ELSE IF (@charStatus = 'Quete')
	BEGIN
		SELECT ''
	END
END
GO
