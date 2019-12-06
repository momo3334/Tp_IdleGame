SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE spGenerateRandomQuestID 
@CharID INT,
@questID INT OUTPUT
AS
BEGIN
	SET @questID = (SELECT TOP 1 QuestID FROM Quests WHERE (QuestID NOT IN (SELECT QuestID FROM Quests INNER JOIN QuestJournal ON QuestJournalQuestID = QuestID WHERE (QuestJournalCharacterID = 1 AND QuestJournalCompletion = 1))) ORDER BY NEWID())
END
