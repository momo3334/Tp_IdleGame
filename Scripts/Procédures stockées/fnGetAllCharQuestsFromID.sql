SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION fnGetAllCharQuestsFromID(@CharID INT)
RETURNS TABLE
AS
RETURN SELECT QuestName, QuestJournalCompletion FROM Quests INNER JOIN QuestJournal ON QuestID = QuestJournalQuestID WHERE (QuestJournalCharacterID = @CharID)
