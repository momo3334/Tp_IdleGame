SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE spSetQuestCompletion
	@CharID INT,
	@QuestID INT,
	@Status BIT
AS
BEGIN
	UPDATE QuestJournal SET QuestJournalCompletion = @Status WHERE (QuestJournalCharacterID = @CharID AND QuestJournalQuestID = @QuestID)
END
