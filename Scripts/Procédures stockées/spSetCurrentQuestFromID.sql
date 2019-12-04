SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE dbo.spSetCurrentQuestFromID
@questID INT,
@charID INT
AS
BEGIN
	INSERT INTO QuestJournal (QuestJournalQuestID, QuestJournalCharacterID, QuestJournalCompletion) VALUES (@questID, @charID, 0)
END