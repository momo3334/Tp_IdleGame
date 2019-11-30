--CREATING DATA BASE
CREATE DATABASE BD_IdleGame
 CONTAINMENT = NONE
 ON PRIMARY
 ( NAME = N'IdleGame', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\IdleGame.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON
 ( NAME = N'IdleGame_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\IdleGame_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 GO

 USE BD_IdleGame
 --DONE CREATING DB


--CREATING TABLES
 CREATE TABLE Characters --This table creates characters with stats, equipment, level, etc...
(
   CharID int IDENTITY(1,1), 
   CharRaceID int NOT NULL,
   CharClassID int NOT NULL,
   CharName nvarchar(50) ,
   CharLevel int NOT NULL,
   CharExp int NOT NULL,
   CharGP int NOT NULL,
   CharQuestProgression int NOT NULL,
   CharHP int NOT NULL,
   CharMaxHP int NOT NULL,
   CharHPRegen int NOT NULL,
   CharMP int NOT NULL,
   CharMaxMP int NOT NULL,
   CharMPRegen int NOT NULL,
   CharStr int NOT NULL,
   CharCon int NOT NULL,
   CharDex int NOT NULL,
   CharInt int NOT NULL,
   CharWis int NOT NULL,
   CharLck int NOT NULL,
   CharHead bit NOT NULL,
   CharTorso bit NOT NULL,
   CharLegs bit NOT NULL,
   CharBoots bit NOT NULL,
   CharGloves bit NOT NULL,
   CharWeap1 bit NOT NULL,
   CharWeap2 bit NOT NULL,
   CharNeckLace bit NOT NULL,
   CharRing1 bit NOT NULL,
   CharRing2 bit NOT NULL,
)
GO

 CREATE TABLE Races --This table set the character's races
(
   RaceID int IDENTITY(1,1),
   RaceName nvarchar(50) NOT NULL,
)
GO

 CREATE TABLE Classes --This table set the character's Classes
(
   ClassID int IDENTITY(1,1),
   ClassName nvarchar(50) NOT NULL,
)
GO

 CREATE TABLE Kills
(
   KillsID int IDENTITY(1,1),
   KillsCharacterID int NOT NULL,
   KillsDungeonID int NOT NULL,
   KillsMonsterID int NOT NULL,
   KillsQty int NOT NULL,
)
GO

 CREATE TABLE Monsters --This table keeps all possible monsters
(
   MonsterID int IDENTITY(1,1),
   MonsterName nvarchar(50) NOT NULL,
   MonsterLevel int NOT NULL,
   MonsterHP int NOT NULL,
   MonsterDmg int NOT NULL,
)
GO

 CREATE TABLE Quests --This table keep the quests, quest reward, which dungeon is linked to the quest, etc...
(
   QuestID int IDENTITY(1,1),
   QuestDungeonID int NOT NULL,
   QuestName nvarchar(50),
   QuestReward int NOT NULL
)
GO

 CREATE TABLE QuestJournal --This table keep track of which quest is done
(
   QuestJournalID int IDENTITY(1,1),
   QuestJournalCharacterID int NOT NULL,
   QuestJournalQuestID int NOT NULL,
   QuestJournalCompletion bit NOT NULL
)
GO

 CREATE TABLE Dungeons --This table keeps track of dungeon and which "MonsterBundle" is associated with it
(
   DungeonID int IDENTITY(1,1),
   DungeonName nvarchar(50),
   DungeonLevel int NOT NULL
)
GO

 CREATE TABLE MonsterBundle --This table creates a bundle that the user has to fight in order to progress (Complete dungeon)
(
   MonsterBundleID int IDENTITY(1,1),
   MonsterBundleMonsterID int NOT NULL,
   MonsterBundleDungeonID int NOT NULL,
   MonsterQty int NOT NULL
)
GO

CREATE TABLE Loots --This table has all possible loot
(
   LootID int IDENTITY(1,1),
   LootName nvarchar(50),
   LootValue int
)
GO

CREATE TABLE CharLoot --This table has the character loot inventory
(
   CharLootID int IDENTITY(1,1),
   CharLootCharacterID int,
   CharLootLootID int,
   CharLootQty int
)
GO

CREATE TABLE ConsumType --This table keeps track the possible types of consummable
(
   ConsumTypeID int IDENTITY(1,1),
   ConsumTypeName nvarchar(50)
)
GO

CREATE TABLE Consummables --This table keeps the possible consummable
(
   ConsumID int IDENTITY(1,1),
   ConsumConsumTypeID int,
   ConsumName nvarchar(50),
   ConsumRestore int
)
GO

CREATE TABLE CharConsum --This table keeps the character's consummable
(
   CharConsumID int IDENTITY(1,1),
   CharConsumCharacterID int,
   CharConsumConsumID int,
   CharConsumQty int
)
GO

CREATE TABLE EquipType --This table keeps the possible equipment type
(
   EquipTypeID int IDENTITY(1,1),
   EquipTypeName nvarchar(50)
)
GO

CREATE TABLE Equipements --This table keeps all possible equipment
(
   EquipID int IDENTITY(1,1),
   EquipEquipTypeID int,
   EquipName nvarchar(50),
   EquipValue int
)
GO

CREATE TABLE CharEquip --This table keeps the charatcer's equipment
(
   CharEquipID int IDENTITY(1,1),
   CharEquipCharacterID int,
   CharEquipEquipID int,
   CharEquipQty int
)
GO

CREATE TABLE Spells --This table keeps track of all possible spells
(
   SpellsID int IDENTITY(1,1),
   SpellMana int,
   SpellName nvarchar(50),
   SpellDamage int
)
GO

CREATE TABLE CharSpells --This table keeps the character's spells
(
   CharSpellsID int IDENTITY(1,1),
   CharSpellsCharacterID int,
   CharSpellsSpellID int
)
GO
--DONE CREATING TABLES


--ADDING PRIMARY KEYS
ALTER TABLE Loots ADD PRIMARY KEY (LootID)
GO
ALTER TABLE CharLoot ADD PRIMARY KEY (CharLootID)
GO
ALTER TABLE Characters ADD PRIMARY KEY (CharID)
GO
ALTER TABLE ConsumType ADD PRIMARY KEY (ConsumTypeID)
GO
ALTER TABLE Consummables ADD PRIMARY KEY (ConsumID)
GO
ALTER TABLE CharConsum ADD PRIMARY KEY (CharConsumID)
GO
ALTER TABLE EquipType ADD PRIMARY KEY (EquipTypeID)
GO
ALTER TABLE Equipements ADD PRIMARY KEY (EquipID)
GO
ALTER TABLE CharEquip ADD PRIMARY KEY (CharEquipID)
GO
ALTER TABLE Spells ADD PRIMARY KEY (SpellsID)
GO
ALTER TABLE CharSpells ADD PRIMARY KEY (CharSpellsID)
GO
ALTER TABLE QuestJournal ADD PRIMARY KEY (QuestJournalID)
GO
ALTER TABLE Quests ADD PRIMARY KEY (QuestID)
GO
ALTER TABLE Dungeons ADD PRIMARY KEY (DungeonID)
GO
ALTER TABLE Races ADD PRIMARY KEY (RaceID)
GO
ALTER TABLE Kills ADD PRIMARY KEY (KillsID)
GO
ALTER TABLE MonsterBundle ADD PRIMARY KEY (MonsterBundleID)
GO
ALTER TABLE Classes ADD PRIMARY KEY (ClassID)
GO
ALTER TABLE Monsters ADD PRIMARY KEY (MonsterID)
GO
--DONE ADDING PRIMARY KEYS

--**ADDING BASE DATA**

--*ADDING RACES*
INSERT INTO Races (RaceName)
VALUES 
('Elfe des Montagnes'),
('Argonien'),
('Elfe des For�ts'),
('Elfe de l''ombre'),
('Orque'),
('Nordique'),
('Rougegarde'),
('Khajiit'),
('Br�ton'),
('Imp�rial')
;
--*DONE ADDING RACES*

--*ADDING CLASSES*
INSERT INTO Classes(ClassName)
VALUES 
('Guerrier'),
('Archer'),
('Mage'),
('Berserk'),
('Assassin'),
('Paladin')
;
--*DONE ADDING CLASSES*

--*ADDING SPELLS*
INSERT INTO Spells(SpellMana,SpellName,SpellDamage)
VALUES
(10,'Flammes',25),
(10,'Froid mordant',25),
(20,'�clair enflamm�',50),
(20,'�clair foudroyant',50),
(15,'�clairs multiples',40),
(20,'Boule de feu',40),
(30,'Incin�ration',60)
;
--*DONE ADDING SPELLS*

--*ADDING CONSUMMABLES TYPES*
INSERT INTO ConsumType(ConsumTypeName)
VALUES
('Potion de soin'),
('Potion de mana'),
('Potion de force'),
('Potion d''intelligence')
;
--*DONE ADDING CONSUMMABLES TYPES*

--*ADDING CONSUMMABLES*
INSERT INTO Consummables(ConsumConsumTypeID,ConsumName,ConsumRestore)
VALUES
(1,'Petite potion de Regain  de sant�',25),
(1,'Potion de Regain  de sant�',25),
(2,'Potion de restauration de sant�',50),
(2,'Petite potion de Regain  de mana',100),
(2,'Potion de Regain de Mana',50),
(2,'Potion de restauration de Mana',100),
(3,'Potion de Renfort de force',10),
(4,'Potion d''intelligence',10)
;
--*DONE ADDING CONSUMMABLES*

--**DONE ADDING BASE DATA**

--ADDING FOREIN KEYS CONSTRAINT
ALTER TABLE Characters ADD CONSTRAINT CHK_CharHP CHECK (CharHP >= 0);
GO
ALTER TABLE Characters ADD CONSTRAINT FK_Characters_Race FOREIGN KEY (CharRaceID) REFERENCES Races(RaceID)
GO
ALTER TABLE Characters ADD CONSTRAINT FK_Characters_Class FOREIGN KEY (CharClassID) REFERENCES Classes(ClassID)
GO
ALTER TABLE CharLoot ADD CONSTRAINT FK_CharLoot_Characters FOREIGN KEY (CharLootCharacterID) REFERENCES Characters(CharID)
GO
ALTER TABLE CharLoot ADD CONSTRAINT FK_CharLoot_Loot FOREIGN KEY (CharLootLootID) REFERENCES Loots(LootID)
GO
ALTER TABLE Consummables ADD CONSTRAINT FK_Consum_ConsumType FOREIGN KEY (ConsumConsumTypeID) REFERENCES ConsumType(ConsumTypeID)
GO
ALTER TABLE CharConsum ADD CONSTRAINT FK_CharConsum_Consum FOREIGN KEY (CharConsumConsumID) REFERENCES Consummables(ConsumID)
GO
ALTER TABLE CharConsum ADD CONSTRAINT FK_CharConsum_Characters FOREIGN KEY (CharConsumCharacterID) REFERENCES Characters(CharID)
GO
ALTER TABLE Equipements ADD CONSTRAINT FK_Equip_EquipType FOREIGN KEY (EquipEquipTypeID) REFERENCES EquipType(EquipTypeID)
GO
ALTER TABLE CharEquip ADD CONSTRAINT FK_CharEquip_Equip FOREIGN KEY (CharEquipEquipID) REFERENCES Equipements(EquipID)
GO
ALTER TABLE CharEquip ADD CONSTRAINT FK_CharEquip_Characters FOREIGN KEY (CharEquipCharacterID) REFERENCES Characters(CharID)
GO
ALTER TABLE CharSpells ADD CONSTRAINT FK_CharSpells_Spells FOREIGN KEY (CharSpellsSpellID) REFERENCES Spells(SpellsID)
GO
ALTER TABLE CharSpells ADD CONSTRAINT FK_CharSpells_Characters FOREIGN KEY (CharSpellsCharacterID) REFERENCES Characters(CharID)
GO
ALTER TABLE QuestJournal ADD CONSTRAINT FK_QuestJournal_Characters FOREIGN KEY (QuestJournalCharacterID) REFERENCES Characters(CharID)
GO
ALTER TABLE QuestJournal ADD CONSTRAINT FK_QuestJournal_Quests FOREIGN KEY (QuestJournalQuestID) REFERENCES Quests(QuestID)
GO
ALTER TABLE Quests ADD CONSTRAINT FK_Quests_Dungeons FOREIGN KEY (QuestDungeonID) REFERENCES Dungeons(DungeonID)
GO
ALTER TABLE Kills ADD CONSTRAINT FK_Kills_Characters FOREIGN KEY (KillsCharacterID) REFERENCES Characters(CharID)
GO
ALTER TABLE Kills ADD CONSTRAINT FK_Kills_Dungeons FOREIGN KEY (KillsDungeonID) REFERENCES Dungeons(DungeonID)
GO
ALTER TABLE Kills ADD CONSTRAINT FK_Kills_Monsters FOREIGN KEY (KillsMonsterID) REFERENCES Monsters(MonsterID)
GO
ALTER TABLE MonsterBundle ADD CONSTRAINT FK_MonsterBundle_Dungeons FOREIGN KEY (MonsterBundleDungeonID) REFERENCES Dungeons(DungeonID)
GO
ALTER TABLE MonsterBundle ADD CONSTRAINT FK_MonsterBundle_Monsters FOREIGN KEY (MonsterBundleMonsterID) REFERENCES Monsters(MonsterID)
GO
--DONE ADDING FOREIGN KEY CONSTRAINT

--ADDING PROCEDURES
CREATE FUNCTION fnGetAllLoot() RETURNS TABLE
AS
RETURN SELECT * FROM Loots
GO

CREATE FUNCTION fnGetCharFromID
(@id INTEGER) 
RETURNS TABLE
AS
RETURN SELECT * FROM Characters WHERE CharID = @id
GO

CREATE FUNCTION fnGetLootFromID
(@id INTEGER) 
RETURNS TABLE
AS
RETURN SELECT * FROM Loots WHERE LootID = @id
GO

CREATE FUNCTION fnGetAllCharacters()
	RETURNS TABLE
AS
	RETURN 
		SELECT DISTINCT CharID AS ID, 
		CharName AS Name, 
		CharRaceID AS Race, 
		CharClassID AS Class, 
		CharLevel AS Level,
		CharGP AS Gold,
		CharHP AS HP,
		CharMaxHP AS MaxHP,
		CharHPRegen AS HPReg,
		CharMP AS MP,
		CharMaxMP AS MaxMP,
		CharMPRegen AS MPReg,
		CharStr AS Str,
		CharCon AS Cons,
		CharDex AS Dex,
		CharInt AS Intel,
		CharLck AS Luck,
		CharWis AS Wis	
		FROM Characters
GO

CREATE FUNCTION fnGetAllClasses ()
	RETURNS TABLE
AS
	RETURN 
		SELECT DISTINCT Classes.ClassID AS ID, Classes.ClassName AS Name FROM Classes
GO

CREATE FUNCTION fnGetAllMonsters ()
	RETURNS TABLE
AS
	RETURN 
		SELECT DISTINCT Monsters.MonsterID as ID, Monsters.MonsterLevel as Level, Monsters.MonsterName as Name, Monsters.MonsterHP as HP, Monsters.MonsterDmg as Dmg FROM Monsters
GO

CREATE FUNCTION fnGetAllRaces ()
	RETURNS TABLE
AS
	RETURN 
		SELECT DISTINCT Races.RaceID AS ID, Races.RaceName AS Name FROM Races
GO

CREATE FUNCTION fnGetBundleFromDunID
(@id INTEGER) 
RETURNS TABLE
AS
RETURN SELECT * FROM MonsterBundle WHERE MonsterBundle.MonsterBundleDungeonID = @id
GO

CREATE FUNCTION fnGetAllDungeons ()
RETURNS TABLE
AS
RETURN SELECT * FROM Dungeons
GO

CREATE FUNCTION fnGetAllQuests() RETURNS TABLE
AS
RETURN SELECT QuestID, QuestName as questName, DungeonName AS dunName, LootName as lootName FROM ((Quests INNER JOIN Dungeons ON QuestDungeonID = DungeonID) 
INNER JOIN Loots ON QuestReward = LootID)
GO

CREATE PROCEDURE spCreateCharacter
@race integer, @class integer, @name nvarchar(50), @level integer, @gold integer, @hp integer, @hpMax integer, 
@hpRegen integer, @mana integer, @maxMana integer, @manaRegen integer, @str integer, @cons integer, @dex integer, 
@int integer, @luck integer, @wisdom integer
AS
INSERT INTO Characters
VALUES(@race, @class, @name, @level, 0, @gold, 0, @hp, @hpMax, @hpRegen, @mana, @maxMana, @manaRegen, @str, @cons, @dex, @int, @wisdom, @luck, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO

CREATE PROCEDURE spCreateDungeon
@name NVARCHAR(50), @lvl integer
AS
INSERT INTO Dungeons
VALUES(@name, @lvl)
GO

CREATE PROCEDURE spCreateLoot
@name nvarchar(50), @value INTEGER
AS
INSERT INTO Loots
VALUES (@name, @value)
GO

CREATE PROCEDURE spCreateMonster
@level INTEGER, @hp INTEGER, @dmg INTEGER, @name NVARCHAR(50)
AS
INSERT INTO Monsters
VALUES (@name, @level, @hp, @dmg)
GO

CREATE PROCEDURE spDeleteCharacter
@id INTEGER
AS
DELETE FROM Characters WHERE Characters.CharID = @id
GO

CREATE PROCEDURE spDeleteDungeon
@id INTEGER
AS
DELETE FROM Dungeons
WHERE DungeonID = @id
GO

CREATE PROCEDURE spDeleteLoot
@id INTEGER
AS
DELETE FROM Loots
WHERE Loots.LootID= @id
GO

CREATE PROCEDURE spDeleteMonster
@id INTEGER
AS
DELETE FROM Monsters
WHERE Monsters.MonsterID = @id
GO

CREATE PROCEDURE spUpdateCharacter
@id integer ,@name nvarchar(50), @class nvarchar(50), @race nvarchar(50), @level integer, @gold integer, @hp integer, 
@hpMax integer, @hpRegen integer, @mana integer, @maxMana integer, @manaRegen integer, @str integer, @cons integer, 
@dex integer, @int integer, @luck integer, @wisdom integer
AS
UPDATE Characters
SET CharName = @name, CharClassID = @class, CharRaceID = @race, CharLevel = @level, CharGP = @gold, CharHP = @hp, CharMaxHP = @hpMax,
CharHPRegen = @hpRegen, CharMP = @mana, CharMaxMP = @maxMana, CharMPRegen = @manaRegen, CharStr = @str, CharCon = @cons,
CharDex = @dex, CharInt = @int, CharLck = @luck, Charwis = @wisdom
WHERE Characters.CharID = @id
GO



CREATE PROCEDURE spUpdateLoot
@id integer, @name nvarchar(50), @value integer
AS
UPDATE Loots
SET LootName = @name, LootValue = @value
WHERE Loots.LootID = @id
GO

CREATE PROCEDURE spUpdateMonster
(@id INTEGER, @lvl INTEGER, @hp INTEGER, @dmg INTEGER, @name NVARCHAR(50))
AS
UPDATE Monsters
SET MonsterDmg = @dmg, MonsterHP = @hp, MonsterLevel = @lvl, MonsterName = @name
WHERE MonsterID = @id
GO

CREATE PROCEDURE spDeleteBundle
@id INTEGER
AS
DELETE FROM MonsterBundle
WHERE MonsterBundleID = @id
GO

CREATE PROCEDURE spCreateBundle 
@dunID integer, @monsID integer, @qty integer
AS
INSERT INTO MonsterBundle
VALUES(@monsID, @dunID, @qty)
GO

CREATE PROCEDURE spCreateQuest
@name nvarchar(50), @dunID int, @lootID int, @lootQte int
AS
INSERT INTO Quests
VALUES (@dunID, @name, @lootID)
GO

CREATE PROCEDURE spUpdateDungeon
(@id integer, @name NVARCHAR(50), @lvl INTEGER )
AS
UPDATE Dungeons
SET DungeonName = @name, DungeonLevel = @lvl
WHERE DungeonID = @id
GO


CREATE PROCEDURE spDeleteQuest
@id INTEGER
AS
DELETE FROM Quests
WHERE QuestID = @id
GO

CREATE VIEW viewAllDungeons
AS

SELECT * FROM Dungeons
GO

CREATE VIEW viewAllLoots AS SELECT * FROM Loots
GO

USE [BD_IdleGame]
GO

CREATE VIEW [dbo].[viewFillCharacterCombo]
AS
SELECT Characters.CharID as ID, Characters.CharName as Name, Characters.CharLevel as Level, Classes.ClassName as Class, Races.RaceName as Race
FROM ((Characters
INNER JOIN Classes ON Characters.CharClassID = Classes.ClassID)
INNER JOIN Races ON Characters.CharRaceID = races.RaceID)
GO

CREATE VIEW viewExistingBundles
AS
SELECT MonsterBundleID, DungeonName,  MonsterName, MonsterQty FROM 
((MonsterBundle INNER JOIN Dungeons ON MonsterBundleDungeonID = DungeonID)
INNER JOIN Monsters ON MonsterBundleMonsterID = MonsterID)
GO

--DONE ADDING PROCEDURES