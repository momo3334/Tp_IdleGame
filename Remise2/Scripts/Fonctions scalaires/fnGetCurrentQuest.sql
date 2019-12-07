SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION fnGetCurrentQuest(@CharID INT)
RETURNS INT
AS
BEGIN
	DECLARE @currentQuest INT
	SET @currentQuest = (SELECT Quests.QuestID FROM Quests INNER JOIN (Characters INNER JOIN QuestJournal ON Characters.CharID = QuestJournal.QuestJournalCharacterID) ON QuestID = QuestJournal.QuestJournalQuestID WHERE (QuestJournal.QuestJournalCompletion = 0 AND CharID = @CharID))
	RETURN @currentQuest
END
