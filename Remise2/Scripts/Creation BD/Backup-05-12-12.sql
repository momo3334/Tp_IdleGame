USE [master]
GO
/****** Object:  Database [BD_IdleGame]    Script Date: 2019-12-05 03:26:18 ******/
CREATE DATABASE [BD_IdleGame]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'IdleGame', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\IdleGame.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'IdleGame_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\IdleGame_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [BD_IdleGame] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BD_IdleGame].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BD_IdleGame] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BD_IdleGame] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BD_IdleGame] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BD_IdleGame] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BD_IdleGame] SET ARITHABORT OFF 
GO
ALTER DATABASE [BD_IdleGame] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BD_IdleGame] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BD_IdleGame] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BD_IdleGame] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BD_IdleGame] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BD_IdleGame] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BD_IdleGame] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BD_IdleGame] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BD_IdleGame] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BD_IdleGame] SET  ENABLE_BROKER 
GO
ALTER DATABASE [BD_IdleGame] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BD_IdleGame] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BD_IdleGame] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BD_IdleGame] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BD_IdleGame] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BD_IdleGame] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BD_IdleGame] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BD_IdleGame] SET RECOVERY FULL 
GO
ALTER DATABASE [BD_IdleGame] SET  MULTI_USER 
GO
ALTER DATABASE [BD_IdleGame] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BD_IdleGame] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BD_IdleGame] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BD_IdleGame] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BD_IdleGame] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'BD_IdleGame', N'ON'
GO
ALTER DATABASE [BD_IdleGame] SET QUERY_STORE = OFF
GO
USE [BD_IdleGame]
GO
/****** Object:  UserDefinedFunction [dbo].[fnCheckForQuestCompleted]    Script Date: 2019-12-05 03:26:18 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[fnCheckForQuestCompleted](@CharID INT)
RETURNS INT
AS
BEGIN
	DECLARE @questCompleted BIT
	DECLARE @monsterLeftInDungeon INT
	SET @monsterLeftInDungeon = (SELECT COUNT(FightID) FROM (SELECT FightID FROM Fights WHERE (FightCharID = @CharID)) t)

	--If theres no more monster to fight in the current dungeon
	IF (@monsterLeftInDungeon = 0)
	BEGIN
		SET @questCompleted = 1
	END
	--If theres still monsters to fight in the current dungeon
	ELSE
	BEGIN
		SET @questCompleted = 0
	END

	RETURN @questCompleted
END
GO
/****** Object:  UserDefinedFunction [dbo].[fnGetCharGoldPiece]    Script Date: 2019-12-05 03:26:18 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[fnGetCharGoldPiece](@CharID INT)
RETURNS INT
AS
BEGIN
	DECLARE @currentGP INT
	SET @currentGP = (SELECT CharGP FROM Characters WHERE (CharID = @CharID))
	RETURN @currentGP
END
GO
/****** Object:  UserDefinedFunction [dbo].[fnGetCharHP]    Script Date: 2019-12-05 03:26:18 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[fnGetCharHP](@CharID INT)
RETURNS INT
AS
BEGIN
	DECLARE @currentHP INT
	SET @currentHP = (SELECT CharHP FROM Characters WHERE (CharID = @CharID))
	RETURN @currentHP
END
GO
/****** Object:  UserDefinedFunction [dbo].[fnGetCharMaxHP]    Script Date: 2019-12-05 03:26:18 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[fnGetCharMaxHP](@CharID INT)
RETURNS INT
AS
BEGIN
	DECLARE @maxHP INT
	SET @maxHP = (SELECT CharMaxHP FROM Characters WHERE (CharID = @CharID))
	RETURN @maxHP
END
GO
/****** Object:  UserDefinedFunction [dbo].[fnGetCharWeight]    Script Date: 2019-12-05 03:26:18 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[fnGetCharWeight](@CharID INT)
RETURNS INT
AS
BEGIN
	DECLARE @currentWeight INT
	SET @currentWeight = (SELECT CharWeight FROM Characters WHERE (CharID = @CharID))
	RETURN @currentWeight
END
GO
/****** Object:  UserDefinedFunction [dbo].[fnGetCurrentMonsterHPFromID]    Script Date: 2019-12-05 03:26:18 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[fnGetCurrentMonsterHPFromID](@fightID INT)
RETURNS INT
AS
BEGIN
	DECLARE @currentHP INT
	SET @currentHP = (SELECT FightMonsterHP FROM Fights WHERE (FightID = @fightID))
	RETURN @currentHP
END
GO
/****** Object:  UserDefinedFunction [dbo].[fnGetCurrentQuest]    Script Date: 2019-12-05 03:26:18 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[fnGetCurrentQuest](@CharID INT)
RETURNS INT
AS
BEGIN
	DECLARE @currentQuest INT
	SET @currentQuest = (SELECT Quests.QuestID FROM Quests INNER JOIN (Characters INNER JOIN QuestJournal ON Characters.CharID = QuestJournal.QuestJournalCharacterID) ON QuestID = QuestJournal.QuestJournalQuestID WHERE (QuestJournal.QuestJournalCompletion = 0 AND CharID = @CharID))
	RETURN @currentQuest
END
GO
/****** Object:  Table [dbo].[Quests]    Script Date: 2019-12-05 03:26:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Quests](
	[QuestID] [int] IDENTITY(1,1) NOT NULL,
	[QuestName] [nvarchar](50) NULL,
	[QuestReward] [int] NOT NULL,
	[QuestRewardQty] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[QuestID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QuestJournal]    Script Date: 2019-12-05 03:26:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuestJournal](
	[QuestJournalID] [int] IDENTITY(1,1) NOT NULL,
	[QuestJournalCharacterID] [int] NOT NULL,
	[QuestJournalQuestID] [int] NOT NULL,
	[QuestJournalCompletion] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[QuestJournalID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[fnGetAllCharQuestsFromID]    Script Date: 2019-12-05 03:26:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[fnGetAllCharQuestsFromID](@CharID INT)
RETURNS TABLE
AS
RETURN SELECT QuestName, QuestJournalCompletion FROM Quests INNER JOIN QuestJournal ON QuestID = QuestJournalQuestID WHERE (QuestJournalCharacterID = @CharID)
GO
/****** Object:  Table [dbo].[Dungeons]    Script Date: 2019-12-05 03:26:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dungeons](
	[DungeonID] [int] IDENTITY(1,1) NOT NULL,
	[DungeonName] [nvarchar](50) NULL,
	[DungeonLevel] [int] NOT NULL,
	[DungeonQuestID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[DungeonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[viewAllDungeons]    Script Date: 2019-12-05 03:26:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[viewAllDungeons]
AS

SELECT * FROM Dungeons
GO
/****** Object:  Table [dbo].[Loots]    Script Date: 2019-12-05 03:26:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Loots](
	[LootID] [int] IDENTITY(1,1) NOT NULL,
	[LootName] [nvarchar](50) NULL,
	[LootValue] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[LootID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[viewAllLoots]    Script Date: 2019-12-05 03:26:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[viewAllLoots] AS SELECT * FROM Loots
GO
/****** Object:  Table [dbo].[Characters]    Script Date: 2019-12-05 03:26:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Characters](
	[CharID] [int] IDENTITY(1,1) NOT NULL,
	[CharRaceID] [int] NOT NULL,
	[CharClassID] [int] NOT NULL,
	[CharName] [nvarchar](50) NULL,
	[CharLevel] [int] NOT NULL,
	[CharExp] [int] NOT NULL,
	[CharGP] [int] NOT NULL,
	[CharQuestProgression] [int] NOT NULL,
	[CharHP] [int] NOT NULL,
	[CharMaxHP] [int] NOT NULL,
	[CharHPRegen] [int] NOT NULL,
	[CharMP] [int] NOT NULL,
	[CharMaxMP] [int] NOT NULL,
	[CharMPRegen] [int] NOT NULL,
	[CharStr] [int] NOT NULL,
	[CharCon] [int] NOT NULL,
	[CharDex] [int] NOT NULL,
	[CharInt] [int] NOT NULL,
	[CharWis] [int] NOT NULL,
	[CharLck] [int] NOT NULL,
	[CharHead] [bit] NOT NULL,
	[CharTorso] [bit] NOT NULL,
	[CharLegs] [bit] NOT NULL,
	[CharBoots] [bit] NOT NULL,
	[CharGloves] [bit] NOT NULL,
	[CharWeap1] [bit] NOT NULL,
	[CharWeap2] [bit] NOT NULL,
	[CharNeckLace] [bit] NOT NULL,
	[CharRing1] [bit] NOT NULL,
	[CharRing2] [bit] NOT NULL,
	[CharStatus] [nvarchar](50) NULL,
	[CharWeight] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[CharID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Races]    Script Date: 2019-12-05 03:26:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Races](
	[RaceID] [int] IDENTITY(1,1) NOT NULL,
	[RaceName] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RaceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Classes]    Script Date: 2019-12-05 03:26:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Classes](
	[ClassID] [int] IDENTITY(1,1) NOT NULL,
	[ClassName] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ClassID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[viewFillCharacterCombo]    Script Date: 2019-12-05 03:26:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[viewFillCharacterCombo]
AS
SELECT Characters.CharID as ID, Characters.CharName as Name, Characters.CharLevel as Level, Classes.ClassName as Class, Races.RaceName as Race
FROM ((Characters
INNER JOIN Classes ON Characters.CharClassID = Classes.ClassID)
INNER JOIN Races ON Characters.CharRaceID = races.RaceID)
GO
/****** Object:  Table [dbo].[Monsters]    Script Date: 2019-12-05 03:26:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Monsters](
	[MonsterID] [int] IDENTITY(1,1) NOT NULL,
	[MonsterName] [nvarchar](50) NOT NULL,
	[MonsterLevel] [int] NOT NULL,
	[MonsterHP] [int] NOT NULL,
	[MonsterDmg] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MonsterID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MonsterBundle]    Script Date: 2019-12-05 03:26:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MonsterBundle](
	[MonsterBundleID] [int] IDENTITY(1,1) NOT NULL,
	[MonsterBundleMonsterID] [int] NOT NULL,
	[MonsterBundleDungeonID] [int] NOT NULL,
	[MonsterQty] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MonsterBundleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[viewExistingBundles]    Script Date: 2019-12-05 03:26:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[viewExistingBundles]
AS
SELECT MonsterBundleID, DungeonName,  MonsterName, MonsterQty FROM 
((MonsterBundle INNER JOIN Dungeons ON MonsterBundleDungeonID = DungeonID)
INNER JOIN Monsters ON MonsterBundleMonsterID = MonsterID)
GO
/****** Object:  UserDefinedFunction [dbo].[fnGetAllLoot]    Script Date: 2019-12-05 03:26:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--DONE ADDING FOREIGN KEY CONSTRAINT

--ADDING PROCEDURES
CREATE FUNCTION [dbo].[fnGetAllLoot]() RETURNS TABLE
AS
RETURN SELECT * FROM Loots
GO
/****** Object:  UserDefinedFunction [dbo].[fnGetCharFromID]    Script Date: 2019-12-05 03:26:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[fnGetCharFromID]
(@id INTEGER) 
RETURNS TABLE
AS
RETURN SELECT * FROM Characters WHERE CharID = @id
GO
/****** Object:  UserDefinedFunction [dbo].[fnGetLootFromID]    Script Date: 2019-12-05 03:26:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[fnGetLootFromID]
(@id INTEGER) 
RETURNS TABLE
AS
RETURN SELECT * FROM Loots WHERE LootID = @id
GO
/****** Object:  UserDefinedFunction [dbo].[fnGetAllCharacters]    Script Date: 2019-12-05 03:26:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[fnGetAllCharacters]()
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
/****** Object:  UserDefinedFunction [dbo].[fnGetAllClasses]    Script Date: 2019-12-05 03:26:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[fnGetAllClasses] ()
	RETURNS TABLE
AS
	RETURN 
		SELECT DISTINCT Classes.ClassID AS ID, Classes.ClassName AS Name FROM Classes
GO
/****** Object:  UserDefinedFunction [dbo].[fnGetAllMonsters]    Script Date: 2019-12-05 03:26:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[fnGetAllMonsters] ()
	RETURNS TABLE
AS
	RETURN 
		SELECT DISTINCT Monsters.MonsterID as ID, Monsters.MonsterLevel as Level, Monsters.MonsterName as Name, Monsters.MonsterHP as HP, Monsters.MonsterDmg as Dmg FROM Monsters
GO
/****** Object:  UserDefinedFunction [dbo].[fnGetAllRaces]    Script Date: 2019-12-05 03:26:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[fnGetAllRaces] ()
	RETURNS TABLE
AS
	RETURN 
		SELECT DISTINCT Races.RaceID AS ID, Races.RaceName AS Name FROM Races
GO
/****** Object:  UserDefinedFunction [dbo].[fnGetBundleFromDunID]    Script Date: 2019-12-05 03:26:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[fnGetBundleFromDunID]
(@id INTEGER) 
RETURNS TABLE
AS
RETURN SELECT * FROM MonsterBundle WHERE MonsterBundle.MonsterBundleDungeonID = @id
GO
/****** Object:  UserDefinedFunction [dbo].[fnGetAllDungeons]    Script Date: 2019-12-05 03:26:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[fnGetAllDungeons] ()
RETURNS TABLE
AS
RETURN SELECT * FROM Dungeons
GO
/****** Object:  UserDefinedFunction [dbo].[fnGetAllQuests]    Script Date: 2019-12-05 03:26:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[fnGetAllQuests]() RETURNS TABLE
AS
RETURN SELECT * FROM Quests;
GO
/****** Object:  Table [dbo].[CharConsum]    Script Date: 2019-12-05 03:26:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CharConsum](
	[CharConsumID] [int] IDENTITY(1,1) NOT NULL,
	[CharConsumCharacterID] [int] NULL,
	[CharConsumConsumID] [int] NULL,
	[CharConsumQty] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[CharConsumID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CharEquip]    Script Date: 2019-12-05 03:26:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CharEquip](
	[CharEquipID] [int] IDENTITY(1,1) NOT NULL,
	[CharEquipCharacterID] [int] NULL,
	[CharEquipEquipID] [int] NULL,
	[CharEquipQty] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[CharEquipID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CharLoot]    Script Date: 2019-12-05 03:26:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CharLoot](
	[CharLootID] [int] IDENTITY(1,1) NOT NULL,
	[CharLootCharacterID] [int] NULL,
	[CharLootLootID] [int] NULL,
	[CharLootQty] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[CharLootID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CharSpells]    Script Date: 2019-12-05 03:26:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CharSpells](
	[CharSpellsID] [int] IDENTITY(1,1) NOT NULL,
	[CharSpellsCharacterID] [int] NULL,
	[CharSpellsSpellID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[CharSpellsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Consummables]    Script Date: 2019-12-05 03:26:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Consummables](
	[ConsumID] [int] IDENTITY(1,1) NOT NULL,
	[ConsumConsumTypeID] [int] NULL,
	[ConsumName] [nvarchar](50) NULL,
	[ConsumRestore] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ConsumID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ConsumType]    Script Date: 2019-12-05 03:26:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConsumType](
	[ConsumTypeID] [int] IDENTITY(1,1) NOT NULL,
	[ConsumTypeName] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ConsumTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Equipements]    Script Date: 2019-12-05 03:26:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Equipements](
	[EquipID] [int] IDENTITY(1,1) NOT NULL,
	[EquipEquipTypeID] [int] NULL,
	[EquipName] [nvarchar](50) NULL,
	[EquipValue] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[EquipID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EquipType]    Script Date: 2019-12-05 03:26:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EquipType](
	[EquipTypeID] [int] IDENTITY(1,1) NOT NULL,
	[EquipTypeName] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[EquipTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Fights]    Script Date: 2019-12-05 03:26:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fights](
	[FightID] [int] IDENTITY(1,1) NOT NULL,
	[FightMonsterID] [int] NOT NULL,
	[FightCharID] [int] NOT NULL,
	[FightMonsterHP] [int] NOT NULL,
	[FightMonsterMaxHP] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[FightID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Kills]    Script Date: 2019-12-05 03:26:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kills](
	[KillsID] [int] IDENTITY(1,1) NOT NULL,
	[KillsCharacterID] [int] NOT NULL,
	[KillsDungeonID] [int] NOT NULL,
	[KillsMonsterID] [int] NOT NULL,
	[KillsQty] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[KillsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Spells]    Script Date: 2019-12-05 03:26:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Spells](
	[SpellsID] [int] IDENTITY(1,1) NOT NULL,
	[SpellMana] [int] NULL,
	[SpellName] [nvarchar](50) NULL,
	[SpellDamage] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[SpellsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Characters] ON 

INSERT [dbo].[Characters] ([CharID], [CharRaceID], [CharClassID], [CharName], [CharLevel], [CharExp], [CharGP], [CharQuestProgression], [CharHP], [CharMaxHP], [CharHPRegen], [CharMP], [CharMaxMP], [CharMPRegen], [CharStr], [CharCon], [CharDex], [CharInt], [CharWis], [CharLck], [CharHead], [CharTorso], [CharLegs], [CharBoots], [CharGloves], [CharWeap1], [CharWeap2], [CharNeckLace], [CharRing1], [CharRing2], [CharStatus], [CharWeight]) VALUES (1, 1, 1, N'Marc', 1, 0, 10, 0, 0, 50, 5, 5, 5, 1, 3, 3, 1, 2, 6, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'CoupMonstre', 0)
INSERT [dbo].[Characters] ([CharID], [CharRaceID], [CharClassID], [CharName], [CharLevel], [CharExp], [CharGP], [CharQuestProgression], [CharHP], [CharMaxHP], [CharHPRegen], [CharMP], [CharMaxMP], [CharMPRegen], [CharStr], [CharCon], [CharDex], [CharInt], [CharWis], [CharLck], [CharHead], [CharTorso], [CharLegs], [CharBoots], [CharGloves], [CharWeap1], [CharWeap2], [CharNeckLace], [CharRing1], [CharRing2], [CharStatus], [CharWeight]) VALUES (2, 2, 2, N'random', 1, 0, 0, 0, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0)
SET IDENTITY_INSERT [dbo].[Characters] OFF
SET IDENTITY_INSERT [dbo].[Classes] ON 

INSERT [dbo].[Classes] ([ClassID], [ClassName]) VALUES (1, N'Guerrier')
INSERT [dbo].[Classes] ([ClassID], [ClassName]) VALUES (2, N'Archer')
INSERT [dbo].[Classes] ([ClassID], [ClassName]) VALUES (3, N'Mage')
INSERT [dbo].[Classes] ([ClassID], [ClassName]) VALUES (4, N'Berserk')
INSERT [dbo].[Classes] ([ClassID], [ClassName]) VALUES (5, N'Assassin')
INSERT [dbo].[Classes] ([ClassID], [ClassName]) VALUES (6, N'Paladin')
SET IDENTITY_INSERT [dbo].[Classes] OFF
SET IDENTITY_INSERT [dbo].[Consummables] ON 

INSERT [dbo].[Consummables] ([ConsumID], [ConsumConsumTypeID], [ConsumName], [ConsumRestore]) VALUES (1, 1, N'Petite potion de Regain  de sant?', 25)
INSERT [dbo].[Consummables] ([ConsumID], [ConsumConsumTypeID], [ConsumName], [ConsumRestore]) VALUES (2, 1, N'Potion de Regain  de sant?', 25)
INSERT [dbo].[Consummables] ([ConsumID], [ConsumConsumTypeID], [ConsumName], [ConsumRestore]) VALUES (3, 2, N'Potion de restauration de sant?', 50)
INSERT [dbo].[Consummables] ([ConsumID], [ConsumConsumTypeID], [ConsumName], [ConsumRestore]) VALUES (4, 2, N'Petite potion de Regain  de mana', 100)
INSERT [dbo].[Consummables] ([ConsumID], [ConsumConsumTypeID], [ConsumName], [ConsumRestore]) VALUES (5, 2, N'Potion de Regain de Mana', 50)
INSERT [dbo].[Consummables] ([ConsumID], [ConsumConsumTypeID], [ConsumName], [ConsumRestore]) VALUES (6, 2, N'Potion de restauration de Mana', 100)
INSERT [dbo].[Consummables] ([ConsumID], [ConsumConsumTypeID], [ConsumName], [ConsumRestore]) VALUES (7, 3, N'Potion de Renfort de force', 10)
INSERT [dbo].[Consummables] ([ConsumID], [ConsumConsumTypeID], [ConsumName], [ConsumRestore]) VALUES (8, 4, N'Potion d''intelligence', 10)
SET IDENTITY_INSERT [dbo].[Consummables] OFF
SET IDENTITY_INSERT [dbo].[ConsumType] ON 

INSERT [dbo].[ConsumType] ([ConsumTypeID], [ConsumTypeName]) VALUES (1, N'Potion de soin')
INSERT [dbo].[ConsumType] ([ConsumTypeID], [ConsumTypeName]) VALUES (2, N'Potion de mana')
INSERT [dbo].[ConsumType] ([ConsumTypeID], [ConsumTypeName]) VALUES (3, N'Potion de force')
INSERT [dbo].[ConsumType] ([ConsumTypeID], [ConsumTypeName]) VALUES (4, N'Potion d''intelligence')
SET IDENTITY_INSERT [dbo].[ConsumType] OFF
SET IDENTITY_INSERT [dbo].[Dungeons] ON 

INSERT [dbo].[Dungeons] ([DungeonID], [DungeonName], [DungeonLevel], [DungeonQuestID]) VALUES (1, N'le Donjon du Corbeau Conquis', 1, 1)
INSERT [dbo].[Dungeons] ([DungeonID], [DungeonName], [DungeonLevel], [DungeonQuestID]) VALUES (2, N'les Cavernes du Moine d''Ombre', 2, 2)
INSERT [dbo].[Dungeons] ([DungeonID], [DungeonName], [DungeonLevel], [DungeonQuestID]) VALUES (3, N'les Catacombes du Sorcier Infernal', 3, 3)
INSERT [dbo].[Dungeons] ([DungeonID], [DungeonName], [DungeonLevel], [DungeonQuestID]) VALUES (4, N'les Grottes de la Chauve-Souris Mythique', 4, 4)
INSERT [dbo].[Dungeons] ([DungeonID], [DungeonName], [DungeonLevel], [DungeonQuestID]) VALUES (5, N'la Cave Ésotérique', 5, 5)
INSERT [dbo].[Dungeons] ([DungeonID], [DungeonName], [DungeonLevel], [DungeonQuestID]) VALUES (6, N'le Repaire Immobile', 6, 6)
INSERT [dbo].[Dungeons] ([DungeonID], [DungeonName], [DungeonLevel], [DungeonQuestID]) VALUES (7, N'les Cryptes Silencieuses', 7, 7)
INSERT [dbo].[Dungeons] ([DungeonID], [DungeonName], [DungeonLevel], [DungeonQuestID]) VALUES (8, N'le Terrier Infini', 8, 8)
INSERT [dbo].[Dungeons] ([DungeonID], [DungeonName], [DungeonLevel], [DungeonQuestID]) VALUES (9, N'la Caverne undefined', 9, 9)
INSERT [dbo].[Dungeons] ([DungeonID], [DungeonName], [DungeonLevel], [DungeonQuestID]) VALUES (10, N'les Oubliettes d''Hurlement', 10, 10)
SET IDENTITY_INSERT [dbo].[Dungeons] OFF
SET IDENTITY_INSERT [dbo].[Fights] ON 

INSERT [dbo].[Fights] ([FightID], [FightMonsterID], [FightCharID], [FightMonsterHP], [FightMonsterMaxHP]) VALUES (18812, 3, 1, 35, 35)
INSERT [dbo].[Fights] ([FightID], [FightMonsterID], [FightCharID], [FightMonsterHP], [FightMonsterMaxHP]) VALUES (18813, 3, 1, 35, 35)
INSERT [dbo].[Fights] ([FightID], [FightMonsterID], [FightCharID], [FightMonsterHP], [FightMonsterMaxHP]) VALUES (18814, 3, 1, 35, 35)
INSERT [dbo].[Fights] ([FightID], [FightMonsterID], [FightCharID], [FightMonsterHP], [FightMonsterMaxHP]) VALUES (18815, 3, 1, 35, 35)
INSERT [dbo].[Fights] ([FightID], [FightMonsterID], [FightCharID], [FightMonsterHP], [FightMonsterMaxHP]) VALUES (18816, 3, 1, 35, 35)
INSERT [dbo].[Fights] ([FightID], [FightMonsterID], [FightCharID], [FightMonsterHP], [FightMonsterMaxHP]) VALUES (18817, 3, 1, 35, 35)
INSERT [dbo].[Fights] ([FightID], [FightMonsterID], [FightCharID], [FightMonsterHP], [FightMonsterMaxHP]) VALUES (18818, 3, 1, 35, 35)
INSERT [dbo].[Fights] ([FightID], [FightMonsterID], [FightCharID], [FightMonsterHP], [FightMonsterMaxHP]) VALUES (18819, 3, 1, 35, 35)
INSERT [dbo].[Fights] ([FightID], [FightMonsterID], [FightCharID], [FightMonsterHP], [FightMonsterMaxHP]) VALUES (18820, 3, 1, 35, 35)
INSERT [dbo].[Fights] ([FightID], [FightMonsterID], [FightCharID], [FightMonsterHP], [FightMonsterMaxHP]) VALUES (18821, 3, 1, 35, 35)
INSERT [dbo].[Fights] ([FightID], [FightMonsterID], [FightCharID], [FightMonsterHP], [FightMonsterMaxHP]) VALUES (18822, 1, 1, 50, 50)
INSERT [dbo].[Fights] ([FightID], [FightMonsterID], [FightCharID], [FightMonsterHP], [FightMonsterMaxHP]) VALUES (18823, 1, 1, 50, 50)
INSERT [dbo].[Fights] ([FightID], [FightMonsterID], [FightCharID], [FightMonsterHP], [FightMonsterMaxHP]) VALUES (18824, 1, 1, 50, 50)
INSERT [dbo].[Fights] ([FightID], [FightMonsterID], [FightCharID], [FightMonsterHP], [FightMonsterMaxHP]) VALUES (18826, 1, 1, 50, 50)
SET IDENTITY_INSERT [dbo].[Fights] OFF
SET IDENTITY_INSERT [dbo].[Loots] ON 

INSERT [dbo].[Loots] ([LootID], [LootName], [LootValue]) VALUES (1, N'Roche', 5)
INSERT [dbo].[Loots] ([LootID], [LootName], [LootValue]) VALUES (2, N'Diamants', 15)
SET IDENTITY_INSERT [dbo].[Loots] OFF
SET IDENTITY_INSERT [dbo].[MonsterBundle] ON 

INSERT [dbo].[MonsterBundle] ([MonsterBundleID], [MonsterBundleMonsterID], [MonsterBundleDungeonID], [MonsterQty]) VALUES (1, 3, 1, 10)
INSERT [dbo].[MonsterBundle] ([MonsterBundleID], [MonsterBundleMonsterID], [MonsterBundleDungeonID], [MonsterQty]) VALUES (2, 1, 1, 5)
SET IDENTITY_INSERT [dbo].[MonsterBundle] OFF
SET IDENTITY_INSERT [dbo].[Monsters] ON 

INSERT [dbo].[Monsters] ([MonsterID], [MonsterName], [MonsterLevel], [MonsterHP], [MonsterDmg]) VALUES (1, N'Chaurus', 12, 50, 10)
INSERT [dbo].[Monsters] ([MonsterID], [MonsterName], [MonsterLevel], [MonsterHP], [MonsterDmg]) VALUES (2, N'Dragon de Glace', 10, 250, 30)
INSERT [dbo].[Monsters] ([MonsterID], [MonsterName], [MonsterLevel], [MonsterHP], [MonsterDmg]) VALUES (3, N'Falmer', 9, 35, 10)
SET IDENTITY_INSERT [dbo].[Monsters] OFF
SET IDENTITY_INSERT [dbo].[QuestJournal] ON 

INSERT [dbo].[QuestJournal] ([QuestJournalID], [QuestJournalCharacterID], [QuestJournalQuestID], [QuestJournalCompletion]) VALUES (20, 1, 1, 0)
INSERT [dbo].[QuestJournal] ([QuestJournalID], [QuestJournalCharacterID], [QuestJournalQuestID], [QuestJournalCompletion]) VALUES (21, 1, 8, 0)
SET IDENTITY_INSERT [dbo].[QuestJournal] OFF
SET IDENTITY_INSERT [dbo].[Quests] ON 

INSERT [dbo].[Quests] ([QuestID], [QuestName], [QuestReward], [QuestRewardQty]) VALUES (1, N'Quete#1', 2, 10)
INSERT [dbo].[Quests] ([QuestID], [QuestName], [QuestReward], [QuestRewardQty]) VALUES (2, N'Quete#2', 2, 20)
INSERT [dbo].[Quests] ([QuestID], [QuestName], [QuestReward], [QuestRewardQty]) VALUES (3, N'Quete#3', 2, 30)
INSERT [dbo].[Quests] ([QuestID], [QuestName], [QuestReward], [QuestRewardQty]) VALUES (4, N'Quete#4', 2, 40)
INSERT [dbo].[Quests] ([QuestID], [QuestName], [QuestReward], [QuestRewardQty]) VALUES (5, N'Quete#5', 2, 50)
INSERT [dbo].[Quests] ([QuestID], [QuestName], [QuestReward], [QuestRewardQty]) VALUES (6, N'Quete#6', 2, 60)
INSERT [dbo].[Quests] ([QuestID], [QuestName], [QuestReward], [QuestRewardQty]) VALUES (7, N'Quete#7', 2, 70)
INSERT [dbo].[Quests] ([QuestID], [QuestName], [QuestReward], [QuestRewardQty]) VALUES (8, N'Quete#8', 2, 80)
INSERT [dbo].[Quests] ([QuestID], [QuestName], [QuestReward], [QuestRewardQty]) VALUES (9, N'Quete#9', 2, 90)
INSERT [dbo].[Quests] ([QuestID], [QuestName], [QuestReward], [QuestRewardQty]) VALUES (10, N'Quete#10', 2, 100)
SET IDENTITY_INSERT [dbo].[Quests] OFF
SET IDENTITY_INSERT [dbo].[Races] ON 

INSERT [dbo].[Races] ([RaceID], [RaceName]) VALUES (1, N'Elfe des Montagnes')
INSERT [dbo].[Races] ([RaceID], [RaceName]) VALUES (2, N'Argonien')
INSERT [dbo].[Races] ([RaceID], [RaceName]) VALUES (3, N'Elfe des For?ts')
INSERT [dbo].[Races] ([RaceID], [RaceName]) VALUES (4, N'Elfe de l''ombre')
INSERT [dbo].[Races] ([RaceID], [RaceName]) VALUES (5, N'Orque')
INSERT [dbo].[Races] ([RaceID], [RaceName]) VALUES (6, N'Nordique')
INSERT [dbo].[Races] ([RaceID], [RaceName]) VALUES (7, N'Rougegarde')
INSERT [dbo].[Races] ([RaceID], [RaceName]) VALUES (8, N'Khajiit')
INSERT [dbo].[Races] ([RaceID], [RaceName]) VALUES (9, N'Br?ton')
INSERT [dbo].[Races] ([RaceID], [RaceName]) VALUES (10, N'Imp?rial')
SET IDENTITY_INSERT [dbo].[Races] OFF
SET IDENTITY_INSERT [dbo].[Spells] ON 

INSERT [dbo].[Spells] ([SpellsID], [SpellMana], [SpellName], [SpellDamage]) VALUES (1, 10, N'Flammes', 25)
INSERT [dbo].[Spells] ([SpellsID], [SpellMana], [SpellName], [SpellDamage]) VALUES (2, 10, N'Froid mordant', 25)
INSERT [dbo].[Spells] ([SpellsID], [SpellMana], [SpellName], [SpellDamage]) VALUES (3, 20, N'?clair enflamm?', 50)
INSERT [dbo].[Spells] ([SpellsID], [SpellMana], [SpellName], [SpellDamage]) VALUES (4, 20, N'?clair foudroyant', 50)
INSERT [dbo].[Spells] ([SpellsID], [SpellMana], [SpellName], [SpellDamage]) VALUES (5, 15, N'?clairs multiples', 40)
INSERT [dbo].[Spells] ([SpellsID], [SpellMana], [SpellName], [SpellDamage]) VALUES (6, 20, N'Boule de feu', 40)
INSERT [dbo].[Spells] ([SpellsID], [SpellMana], [SpellName], [SpellDamage]) VALUES (7, 30, N'Incin?ration', 60)
SET IDENTITY_INSERT [dbo].[Spells] OFF
ALTER TABLE [dbo].[Characters]  WITH CHECK ADD  CONSTRAINT [FK_Characters_Class] FOREIGN KEY([CharClassID])
REFERENCES [dbo].[Classes] ([ClassID])
GO
ALTER TABLE [dbo].[Characters] CHECK CONSTRAINT [FK_Characters_Class]
GO
ALTER TABLE [dbo].[Characters]  WITH CHECK ADD  CONSTRAINT [FK_Characters_Race] FOREIGN KEY([CharRaceID])
REFERENCES [dbo].[Races] ([RaceID])
GO
ALTER TABLE [dbo].[Characters] CHECK CONSTRAINT [FK_Characters_Race]
GO
ALTER TABLE [dbo].[CharConsum]  WITH CHECK ADD  CONSTRAINT [FK_CharConsum_Characters] FOREIGN KEY([CharConsumCharacterID])
REFERENCES [dbo].[Characters] ([CharID])
GO
ALTER TABLE [dbo].[CharConsum] CHECK CONSTRAINT [FK_CharConsum_Characters]
GO
ALTER TABLE [dbo].[CharConsum]  WITH CHECK ADD  CONSTRAINT [FK_CharConsum_Consum] FOREIGN KEY([CharConsumConsumID])
REFERENCES [dbo].[Consummables] ([ConsumID])
GO
ALTER TABLE [dbo].[CharConsum] CHECK CONSTRAINT [FK_CharConsum_Consum]
GO
ALTER TABLE [dbo].[CharEquip]  WITH CHECK ADD  CONSTRAINT [FK_CharEquip_Characters] FOREIGN KEY([CharEquipCharacterID])
REFERENCES [dbo].[Characters] ([CharID])
GO
ALTER TABLE [dbo].[CharEquip] CHECK CONSTRAINT [FK_CharEquip_Characters]
GO
ALTER TABLE [dbo].[CharEquip]  WITH CHECK ADD  CONSTRAINT [FK_CharEquip_Equip] FOREIGN KEY([CharEquipEquipID])
REFERENCES [dbo].[Equipements] ([EquipID])
GO
ALTER TABLE [dbo].[CharEquip] CHECK CONSTRAINT [FK_CharEquip_Equip]
GO
ALTER TABLE [dbo].[CharLoot]  WITH CHECK ADD  CONSTRAINT [FK_CharLoot_Characters] FOREIGN KEY([CharLootCharacterID])
REFERENCES [dbo].[Characters] ([CharID])
GO
ALTER TABLE [dbo].[CharLoot] CHECK CONSTRAINT [FK_CharLoot_Characters]
GO
ALTER TABLE [dbo].[CharLoot]  WITH CHECK ADD  CONSTRAINT [FK_CharLoot_Loot] FOREIGN KEY([CharLootLootID])
REFERENCES [dbo].[Loots] ([LootID])
GO
ALTER TABLE [dbo].[CharLoot] CHECK CONSTRAINT [FK_CharLoot_Loot]
GO
ALTER TABLE [dbo].[CharSpells]  WITH CHECK ADD  CONSTRAINT [FK_CharSpells_Characters] FOREIGN KEY([CharSpellsCharacterID])
REFERENCES [dbo].[Characters] ([CharID])
GO
ALTER TABLE [dbo].[CharSpells] CHECK CONSTRAINT [FK_CharSpells_Characters]
GO
ALTER TABLE [dbo].[CharSpells]  WITH CHECK ADD  CONSTRAINT [FK_CharSpells_Spells] FOREIGN KEY([CharSpellsSpellID])
REFERENCES [dbo].[Spells] ([SpellsID])
GO
ALTER TABLE [dbo].[CharSpells] CHECK CONSTRAINT [FK_CharSpells_Spells]
GO
ALTER TABLE [dbo].[Consummables]  WITH CHECK ADD  CONSTRAINT [FK_Consum_ConsumType] FOREIGN KEY([ConsumConsumTypeID])
REFERENCES [dbo].[ConsumType] ([ConsumTypeID])
GO
ALTER TABLE [dbo].[Consummables] CHECK CONSTRAINT [FK_Consum_ConsumType]
GO
ALTER TABLE [dbo].[Dungeons]  WITH CHECK ADD  CONSTRAINT [FK_Dungeons_Quests] FOREIGN KEY([DungeonQuestID])
REFERENCES [dbo].[Quests] ([QuestID])
GO
ALTER TABLE [dbo].[Dungeons] CHECK CONSTRAINT [FK_Dungeons_Quests]
GO
ALTER TABLE [dbo].[Equipements]  WITH CHECK ADD  CONSTRAINT [FK_Equip_EquipType] FOREIGN KEY([EquipEquipTypeID])
REFERENCES [dbo].[EquipType] ([EquipTypeID])
GO
ALTER TABLE [dbo].[Equipements] CHECK CONSTRAINT [FK_Equip_EquipType]
GO
ALTER TABLE [dbo].[Kills]  WITH CHECK ADD  CONSTRAINT [FK_Kills_Characters] FOREIGN KEY([KillsCharacterID])
REFERENCES [dbo].[Characters] ([CharID])
GO
ALTER TABLE [dbo].[Kills] CHECK CONSTRAINT [FK_Kills_Characters]
GO
ALTER TABLE [dbo].[Kills]  WITH CHECK ADD  CONSTRAINT [FK_Kills_Dungeons] FOREIGN KEY([KillsDungeonID])
REFERENCES [dbo].[Dungeons] ([DungeonID])
GO
ALTER TABLE [dbo].[Kills] CHECK CONSTRAINT [FK_Kills_Dungeons]
GO
ALTER TABLE [dbo].[Kills]  WITH CHECK ADD  CONSTRAINT [FK_Kills_Monsters] FOREIGN KEY([KillsMonsterID])
REFERENCES [dbo].[Monsters] ([MonsterID])
GO
ALTER TABLE [dbo].[Kills] CHECK CONSTRAINT [FK_Kills_Monsters]
GO
ALTER TABLE [dbo].[MonsterBundle]  WITH CHECK ADD  CONSTRAINT [FK_MonsterBundle_Dungeons] FOREIGN KEY([MonsterBundleDungeonID])
REFERENCES [dbo].[Dungeons] ([DungeonID])
GO
ALTER TABLE [dbo].[MonsterBundle] CHECK CONSTRAINT [FK_MonsterBundle_Dungeons]
GO
ALTER TABLE [dbo].[MonsterBundle]  WITH CHECK ADD  CONSTRAINT [FK_MonsterBundle_Monsters] FOREIGN KEY([MonsterBundleMonsterID])
REFERENCES [dbo].[Monsters] ([MonsterID])
GO
ALTER TABLE [dbo].[MonsterBundle] CHECK CONSTRAINT [FK_MonsterBundle_Monsters]
GO
ALTER TABLE [dbo].[QuestJournal]  WITH CHECK ADD  CONSTRAINT [FK_QuestJournal_Characters] FOREIGN KEY([QuestJournalCharacterID])
REFERENCES [dbo].[Characters] ([CharID])
GO
ALTER TABLE [dbo].[QuestJournal] CHECK CONSTRAINT [FK_QuestJournal_Characters]
GO
ALTER TABLE [dbo].[Characters]  WITH CHECK ADD  CONSTRAINT [CHK_CharHP] CHECK  (([CharHP]>=(0)))
GO
ALTER TABLE [dbo].[Characters] CHECK CONSTRAINT [CHK_CharHP]
GO
/****** Object:  StoredProcedure [dbo].[spCreateBundle]    Script Date: 2019-12-05 03:26:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spCreateBundle] 
@dunID integer, @monsID integer, @qty integer
AS
INSERT INTO MonsterBundle
VALUES(@monsID, @dunID, @qty)
GO
/****** Object:  StoredProcedure [dbo].[spCreateLoot]    Script Date: 2019-12-05 03:26:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spCreateLoot]
@name nvarchar(50), @value INTEGER
AS
INSERT INTO Loots
VALUES (@name, @value)
GO
/****** Object:  StoredProcedure [dbo].[spCreateMonster]    Script Date: 2019-12-05 03:26:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spCreateMonster]
@level INTEGER, @hp INTEGER, @dmg INTEGER, @name NVARCHAR(50)
AS
INSERT INTO Monsters
VALUES (@name, @level, @hp, @dmg)
GO
/****** Object:  StoredProcedure [dbo].[spCreateQuest]    Script Date: 2019-12-05 03:26:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spCreateQuest]
@name nvarchar(50), @lootID int, @lootQte int
AS
INSERT INTO Quests(QuestName, QuestReward, QuestRewardQty)
VALUES (@name, @lootID, @lootQte)
GO
/****** Object:  StoredProcedure [dbo].[spDeleteBundle]    Script Date: 2019-12-05 03:26:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spDeleteBundle]
@id INTEGER
AS
DELETE FROM MonsterBundle
WHERE MonsterBundleID = @id
GO
/****** Object:  StoredProcedure [dbo].[spDeleteCharacter]    Script Date: 2019-12-05 03:26:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spDeleteCharacter]
@id INTEGER
AS
DELETE FROM Characters WHERE Characters.CharID = @id
GO
/****** Object:  StoredProcedure [dbo].[spDeleteDungeon]    Script Date: 2019-12-05 03:26:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spDeleteDungeon]
@id INTEGER
AS
DELETE FROM Dungeons
WHERE DungeonID = @id
GO
/****** Object:  StoredProcedure [dbo].[spDeleteLoot]    Script Date: 2019-12-05 03:26:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spDeleteLoot]
@id INTEGER
AS
DELETE FROM Loots
WHERE Loots.LootID= @id
GO
/****** Object:  StoredProcedure [dbo].[spDeleteMonster]    Script Date: 2019-12-05 03:26:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spDeleteMonster]
@id INTEGER
AS
DELETE FROM Monsters
WHERE Monsters.MonsterID = @id
GO
/****** Object:  StoredProcedure [dbo].[spDeleteQuest]    Script Date: 2019-12-05 03:26:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[spDeleteQuest]
@id INTEGER
AS
DELETE FROM Quests
WHERE QuestID = @id
GO
/****** Object:  StoredProcedure [dbo].[spGenerateRandomQuestID]    Script Date: 2019-12-05 03:26:18 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spGenerateRandomQuestID] 
@questID INT OUTPUT
AS
BEGIN
	SELECT @questID = (SELECT TOP 1 QuestID FROM Quests ORDER BY NEWID())
	RETURN @questID
END
GO
/****** Object:  StoredProcedure [dbo].[spGetNextMonster]    Script Date: 2019-12-05 03:26:18 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spGetNextMonster]
@charID INT,
@fightID INT OUTPUT
AS
BEGIN
	SET @fightID = (SELECT TOP 1 FightID FROM Fights WHERE (FightMonsterHP < FightMonsterMaxHP))

	IF @fightID = NULL
	BEGIN
		SET @fightID = (SELECT TOP 1 FightID FROM Fights ORDER BY NEWID())
	END

	RETURN @fightID
END
GO
/****** Object:  StoredProcedure [dbo].[spHealChar]    Script Date: 2019-12-05 03:26:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spHealChar] @charID INT
AS
UPDATE Characters SET CharHP = CharMaxHP WHERE CharID = @charID
GO
/****** Object:  StoredProcedure [dbo].[spHitMonster]    Script Date: 2019-12-05 03:26:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spHitMonster]
@fightID integer, @charID integer
AS
BEGIN
	DECLARE @monsterCurrentHP INT
	DECLARE @charDamage INT

	SET @monsterCurrentHP = (SELECT FightMonsterHP FROM Fights WHERE(FightID = @fightID))
	SET @charDamage = (SELECT CharStr FROM Characters WHERE (CharID = @charID))

	IF ((@monsterCurrentHP - @charDamage) < 0)
	BEGIN
		SET @monsterCurrentHP = 0
	END
	ELSE
	BEGIN
		SET @monsterCurrentHP = (@monsterCurrentHP - @charDamage)
	END

	UPDATE Fights SET FightMonsterHP = @monsterCurrentHP WHERE FightID = @fightID
END
GO
/****** Object:  StoredProcedure [dbo].[spLoadBundleIntoFight]    Script Date: 2019-12-05 03:26:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spLoadBundleIntoFight]
@charID INT,
@dungeonID INT
AS
SELECT MonsterBundleMonsterID AS [MonsterBundleMonsterID], MonsterBundleDungeonID As [MonsterBundleDungeonID], MonsterQty AS [MonsterQty] INTO #Temp FROM MonsterBundle WHERE MonsterBundleDungeonID = @dungeonID

ALTER TABLE #Temp ADD rowID INT IDENTITY(1,1)
BEGIN
	DECLARE @count INT
	DECLARE @row INT
	SET @row = 1
	SET @count = (SELECT COUNT(rowID) FROM #Temp)
	WHILE (@row <= @count)
	BEGIN

		DECLARE @monsterRow INT
		DECLARE @monsterNumber INT
		DECLARE @monsterID INT
		DECLARE @monsterHP INT
		SET @monsterRow = 1
		SET @monsterNumber = (SELECT MonsterQty FROM #Temp WHERE rowID = @row)
		SET @monsterID = (SELECT MonsterBundleMonsterID FROM #Temp WHERE rowID = @row)
		SET @monsterHP = (SELECT MonsterHP FROM Monsters INNER JOIN #Temp ON MonsterBundleMonsterID = Monsters.MonsterID WHERE rowID = @row)
		WHILE (@monsterRow <= @monsterNumber)  
			BEGIN 
				INSERT INTO Fights(FightMonsterID, FightMonsterHP, FightMonsterMaxHP, FightCharID) VALUES (@monsterID, @monsterHP, @monsterHP, @charID)
				SET @monsterRow += 1
			END
		SET @row += 1
	
	END
	DROP TABLE #Temp
END
GO
/****** Object:  StoredProcedure [dbo].[spMonsterHit]    Script Date: 2019-12-05 03:26:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spMonsterHit] @charID INT, @monsterID INT
AS
BEGIN
	DECLARE @charCurrentHP INT
	DECLARE @monsterDamage INT

	SET @charCurrentHP = (SELECT CharHP FROM Characters WHERE(CharID = @charID))
	SET @monsterDamage = (SELECT MonsterDmg FROM Monsters WHERE (MonsterID = @monsterID))

	IF ((@charCurrentHP - @monsterDamage) < 0)
	BEGIN
		SET @charCurrentHP = 0
	END
	ELSE
	BEGIN
		SET @charCurrentHP = (@charCurrentHP - @monsterDamage)
	END

	UPDATE Characters SET CharHP = @charCurrentHP WHERE CharID = @charID
END
GO
/****** Object:  StoredProcedure [dbo].[spSetCharStatus]    Script Date: 2019-12-05 03:26:18 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spSetCharStatus]
	@CharID INT,
	@Status NVARCHAR(50)
AS
BEGIN
	UPDATE Characters SET CharStatus = @Status WHERE CharID = @CharID
END
GO
/****** Object:  StoredProcedure [dbo].[spSetCurrentQuestFromID]    Script Date: 2019-12-05 03:26:18 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spSetCurrentQuestFromID]
@questID INT,
@charID INT
AS
BEGIN
	INSERT INTO QuestJournal (QuestJournalQuestID, QuestJournalCharacterID, QuestJournalCompletion) VALUES (@questID, @charID, 0)
END
GO
/****** Object:  StoredProcedure [dbo].[spSetQuestCompletion]    Script Date: 2019-12-05 03:26:18 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spSetQuestCompletion]
	@CharID INT,
	@QuestID INT,
	@Status BIT
AS
BEGIN
	UPDATE QuestJournal SET QuestJournalCompletion = @Status WHERE (QuestJournalCharacterID = @CharID AND QuestJournalQuestID = @QuestID)
END
GO
/****** Object:  StoredProcedure [dbo].[spSpin]    Script Date: 2019-12-05 03:26:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spSpin]
	@CharID INT,
	@actionString NVARCHAR(2048) OUTPUT
AS
BEGIN

	--Getting character status
	DECLARE @charStatus NVARCHAR(50)
	SET @charStatus = (SELECT CharStatus FROM Characters WHERE CharID = @CharID)

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
			SET @actionString = 'Jmen vas queter un quete'
		END
	END

	ELSE IF (@charStatus = 'BesoinQuete')
	BEGIN
		--Checking Current Quest
		DECLARE @currentQuestID INT SELECT @currentQuestID = dbo.fnGetCurrentQuest(@CharID)
		DECLARE @currentQuestName NVARCHAR(50)
		SET @currentQuestName = (SELECT TOP 1 QuestName FROM Quests)

			IF (@currentQuestName IS NOT NULL)
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
				SET @actionString = 'Jeu fini plus de quete disponible'
			END
	END

	ELSE IF (@charStatus = 'Quete')
	BEGIN
		DECLARE @fightID INT
		DECLARE @numbersOfFights INT
		DECLARE @currentDungeonID INT

		SET @currentQuestID = (SELECT dbo.fnGetCurrentQuest(@CharID))
		SET @currentDungeonID = (SELECT Dungeons.DungeonID FROM Dungeons INNER JOIN Quests ON DungeonQuestID = QuestID WHERE(QuestID = @currentQuestID))


		SET @numbersOfFights = (SELECT COUNT(*) FROM Fights WHERE (FightCharID = @CharID));
		IF(@numbersOfFights = 0)
		BEGIN
			EXECUTE dbo.spLoadBundleIntoFight @CharID, @currentDungeonID
		END
		EXECUTE dbo.spGetNextMonster 1, @fightID = @fightID OUTPUT

		EXEC dbo.spSetCharStatus @CharID, 'CoupMonstre'
		SET @actionString = 'Marche vers donjon'
	END
	
	ELSE IF (@charStatus = 'CoupMonstre')
	BEGIN
		EXECUTE dbo.spGetNextMonster 1, @fightID = @fightID OUTPUT

		DECLARE @monsterID INT
		SET @monsterID = (SELECT MonsterID FROM Fights INNER JOIN Monsters ON MonsterID = FightMonsterID WHERE (FightID = @fightID))

		EXEC dbo.spMonsterHit @CharID, @monsterID

		DECLARE @charCurrentHP INT
		DECLARE @charMaxHP INT
		SET @charCurrentHP = dbo.fnGetCharHP(@CharID)
		SET @charMaxHP = dbo.fnGetCharMaxHP(@CharID)

		IF(@charCurrentHP = 0)
		BEGIN
			EXEC dbo.spSetCharStatus @CharID, 'Mort'
		END
		EXEC dbo.spSetCharStatus @CharID, 'Coup'
		SET @actionString = 'Coup du monstre'
	END
		
	ELSE IF (@charStatus = 'Coup')
	BEGIN
		DECLARE @questCompleted BIT

		--Getting the current hp of the monster that we are fighting
		EXECUTE dbo.spGetNextMonster 1, @fightID = @fightID OUTPUT

		IF (@fightID IS NOT NULL)
		BEGIN
			DECLARE @monsterCurrentHP INT
			SET @monsterCurrentHP = dbo.fnGetCurrentMonsterHPFromID(@fightID)

			EXECUTE dbo.spHitMonster @fightID, @CharID
			
			--If we killed the monster
			IF (@monsterCurrentHP = 0)
			BEGIN
				--Remove the monster from the Fights table
				DELETE FROM Fights WHERE FightID = @fightID
				--Check if the current quest is completed
				SET @questCompleted = dbo.fnCheckForQuestCompleted(@CharID)
				--If the quest is not completed
				IF(@questCompleted != 0)
				BEGIN
					--Getting HP Values for the character
					
					SET @charCurrentHP = dbo.fnGetCharHP(@CharID)
					SET @charMaxHP = dbo.fnGetCharMaxHP(@CharID)

					--If the character healt is not full
					IF (@charCurrentHP < @charMaxHP)
					BEGIN
						EXEC dbo.spSetCharStatus @CharID, 'Recuperation'
						SET @actionString = 'Monstre tuer jme Heal'
					END
					--If the character healt is full
					ELSE
					BEGIN
						EXEC dbo.spSetCharStatus @CharID, 'CoupMonstre'
						SET @actionString = 'Monstre tuer je continue le donjon'
					END
				END

				--If the quest is completed
				ELSE
				BEGIN
					SET @currentQuestID = (SELECT dbo.fnGetCurrentQuest(@CharID))
					EXEC dbo.spSetQuestCompletion @CharID, @currentQuestID, @questCompleted
					EXEC dbo.spSetCharStatus @CharID, 'Village'
					SET @actionString = 'Retour Village Quete Complete'
				END
			END
			--If we did not kill the monster
			ELSE
			BEGIN
				EXEC dbo.spSetCharStatus @CharID, 'CoupMonstre'
				SET @actionString = 'Coup donner au monstre'
			END
		END
		ELSE
		BEGIN
			SET @currentQuestID = (SELECT dbo.fnGetCurrentQuest(@CharID))
			EXEC dbo.spSetQuestCompletion @CharID, @currentQuestID, 1
			EXEC dbo.spSetCharStatus @CharID, 'Village'
			SET @actionString = 'Retour Village Quete Complete'
		END
	END

	ELSE IF (@charStatus = 'Recuperation')
	BEGIN
		EXEC dbo.spHealChar @CharID
		EXEC dbo.spSetCharStatus @CharID, 'CoupMonstre'
		SET @actionString = 'Je continue le donjon'
	END
END
GO
/****** Object:  StoredProcedure [dbo].[spUpdateCharacter]    Script Date: 2019-12-05 03:26:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spUpdateCharacter]
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
/****** Object:  StoredProcedure [dbo].[spUpdateDungeon]    Script Date: 2019-12-05 03:26:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spUpdateDungeon]
(@id integer, @name NVARCHAR(50), @lvl INTEGER )
AS
UPDATE Dungeons
SET DungeonName = @name, DungeonLevel = @lvl
WHERE DungeonID = @id
GO
/****** Object:  StoredProcedure [dbo].[spUpdateLoot]    Script Date: 2019-12-05 03:26:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[spUpdateLoot]
@id integer, @name nvarchar(50), @value integer
AS
UPDATE Loots
SET LootName = @name, LootValue = @value
WHERE Loots.LootID = @id
GO
/****** Object:  StoredProcedure [dbo].[spUpdateMonster]    Script Date: 2019-12-05 03:26:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spUpdateMonster]
(@id INTEGER, @lvl INTEGER, @hp INTEGER, @dmg INTEGER, @name NVARCHAR(50))
AS
UPDATE Monsters
SET MonsterDmg = @dmg, MonsterHP = @hp, MonsterLevel = @lvl, MonsterName = @name
WHERE MonsterID = @id
GO
USE [master]
GO
ALTER DATABASE [BD_IdleGame] SET  READ_WRITE 
GO
