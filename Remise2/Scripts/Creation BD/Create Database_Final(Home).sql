USE [master]
GO
/****** Object:  Database [BD_IdleGame]    Script Date: 2019-12-04 04:17:01 ******/
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
/****** Object:  UserDefinedFunction [dbo].[fnGetCharGoldPiece]    Script Date: 2019-12-04 04:17:01 ******/
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
/****** Object:  UserDefinedFunction [dbo].[fnGetCharWeight]    Script Date: 2019-12-04 04:17:01 ******/
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
/****** Object:  UserDefinedFunction [dbo].[fnGetCurrentQuest]    Script Date: 2019-12-04 04:17:01 ******/
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
/****** Object:  Table [dbo].[Dungeons]    Script Date: 2019-12-04 04:17:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dungeons](
	[DungeonID] [int] IDENTITY(1,1) NOT NULL,
	[DungeonName] [nvarchar](50) NULL,
	[DungeonLevel] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[DungeonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[viewAllDungeons]    Script Date: 2019-12-04 04:17:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[viewAllDungeons]
AS

SELECT * FROM Dungeons
GO
/****** Object:  Table [dbo].[Loots]    Script Date: 2019-12-04 04:17:01 ******/
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
/****** Object:  View [dbo].[viewAllLoots]    Script Date: 2019-12-04 04:17:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[viewAllLoots] AS SELECT * FROM Loots
GO
/****** Object:  Table [dbo].[Characters]    Script Date: 2019-12-04 04:17:01 ******/
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
/****** Object:  Table [dbo].[Races]    Script Date: 2019-12-04 04:17:01 ******/
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
/****** Object:  Table [dbo].[Classes]    Script Date: 2019-12-04 04:17:01 ******/
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
/****** Object:  View [dbo].[viewFillCharacterCombo]    Script Date: 2019-12-04 04:17:01 ******/
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
/****** Object:  Table [dbo].[Monsters]    Script Date: 2019-12-04 04:17:01 ******/
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
/****** Object:  Table [dbo].[MonsterBundle]    Script Date: 2019-12-04 04:17:01 ******/
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
/****** Object:  View [dbo].[viewExistingBundles]    Script Date: 2019-12-04 04:17:01 ******/
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
/****** Object:  UserDefinedFunction [dbo].[fnGetAllLoot]    Script Date: 2019-12-04 04:17:01 ******/
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
/****** Object:  UserDefinedFunction [dbo].[fnGetCharFromID]    Script Date: 2019-12-04 04:17:01 ******/
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
/****** Object:  UserDefinedFunction [dbo].[fnGetLootFromID]    Script Date: 2019-12-04 04:17:01 ******/
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
/****** Object:  UserDefinedFunction [dbo].[fnGetAllCharacters]    Script Date: 2019-12-04 04:17:01 ******/
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
/****** Object:  UserDefinedFunction [dbo].[fnGetAllClasses]    Script Date: 2019-12-04 04:17:01 ******/
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
/****** Object:  UserDefinedFunction [dbo].[fnGetAllMonsters]    Script Date: 2019-12-04 04:17:01 ******/
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
/****** Object:  UserDefinedFunction [dbo].[fnGetAllRaces]    Script Date: 2019-12-04 04:17:01 ******/
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
/****** Object:  UserDefinedFunction [dbo].[fnGetBundleFromDunID]    Script Date: 2019-12-04 04:17:01 ******/
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
/****** Object:  UserDefinedFunction [dbo].[fnGetAllDungeons]    Script Date: 2019-12-04 04:17:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[fnGetAllDungeons] ()
RETURNS TABLE
AS
RETURN SELECT * FROM Dungeons
GO
/****** Object:  Table [dbo].[Quests]    Script Date: 2019-12-04 04:17:01 ******/
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
/****** Object:  UserDefinedFunction [dbo].[fnGetAllQuests]    Script Date: 2019-12-04 04:17:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[fnGetAllQuests]() RETURNS TABLE
AS
RETURN SELECT * FROM Quests;
GO
/****** Object:  Table [dbo].[CharConsum]    Script Date: 2019-12-04 04:17:01 ******/
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
/****** Object:  Table [dbo].[CharEquip]    Script Date: 2019-12-04 04:17:01 ******/
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
/****** Object:  Table [dbo].[CharLoot]    Script Date: 2019-12-04 04:17:01 ******/
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
/****** Object:  Table [dbo].[CharSpells]    Script Date: 2019-12-04 04:17:01 ******/
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
/****** Object:  Table [dbo].[Consummables]    Script Date: 2019-12-04 04:17:01 ******/
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
/****** Object:  Table [dbo].[ConsumType]    Script Date: 2019-12-04 04:17:01 ******/
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
/****** Object:  Table [dbo].[Equipements]    Script Date: 2019-12-04 04:17:01 ******/
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
/****** Object:  Table [dbo].[EquipType]    Script Date: 2019-12-04 04:17:01 ******/
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
/****** Object:  Table [dbo].[Fights]    Script Date: 2019-12-04 04:17:01 ******/
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
/****** Object:  Table [dbo].[Kills]    Script Date: 2019-12-04 04:17:01 ******/
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
/****** Object:  Table [dbo].[QuestJournal]    Script Date: 2019-12-04 04:17:01 ******/
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
/****** Object:  Table [dbo].[Spells]    Script Date: 2019-12-04 04:17:01 ******/
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
ALTER TABLE [dbo].[QuestJournal]  WITH CHECK ADD  CONSTRAINT [FK_QuestJournal_Quests] FOREIGN KEY([QuestJournalQuestID])
REFERENCES [dbo].[Quests] ([QuestID])
GO
ALTER TABLE [dbo].[QuestJournal] CHECK CONSTRAINT [FK_QuestJournal_Quests]
GO
ALTER TABLE [dbo].[Characters]  WITH CHECK ADD  CONSTRAINT [CHK_CharHP] CHECK  (([CharHP]>=(0)))
GO
ALTER TABLE [dbo].[Characters] CHECK CONSTRAINT [CHK_CharHP]
GO
/****** Object:  StoredProcedure [dbo].[spCreateBundle]    Script Date: 2019-12-04 04:17:01 ******/
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
/****** Object:  StoredProcedure [dbo].[spCreateDungeon]    Script Date: 2019-12-04 04:17:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spCreateDungeon]
@name NVARCHAR(50), @lvl integer
AS
INSERT INTO Dungeons
VALUES(@name, @lvl)
GO
/****** Object:  StoredProcedure [dbo].[spCreateLoot]    Script Date: 2019-12-04 04:17:01 ******/
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
/****** Object:  StoredProcedure [dbo].[spCreateMonster]    Script Date: 2019-12-04 04:17:01 ******/
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
/****** Object:  StoredProcedure [dbo].[spCreateQuest]    Script Date: 2019-12-04 04:17:01 ******/
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
/****** Object:  StoredProcedure [dbo].[spDeleteBundle]    Script Date: 2019-12-04 04:17:01 ******/
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
/****** Object:  StoredProcedure [dbo].[spDeleteCharacter]    Script Date: 2019-12-04 04:17:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spDeleteCharacter]
@id INTEGER
AS
DELETE FROM Characters WHERE Characters.CharID = @id
GO
/****** Object:  StoredProcedure [dbo].[spDeleteDungeon]    Script Date: 2019-12-04 04:17:01 ******/
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
/****** Object:  StoredProcedure [dbo].[spDeleteLoot]    Script Date: 2019-12-04 04:17:01 ******/
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
/****** Object:  StoredProcedure [dbo].[spDeleteMonster]    Script Date: 2019-12-04 04:17:01 ******/
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
/****** Object:  StoredProcedure [dbo].[spDeleteQuest]    Script Date: 2019-12-04 04:17:01 ******/
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
/****** Object:  StoredProcedure [dbo].[spGenerateRandomQuestID]    Script Date: 2019-12-04 04:17:01 ******/
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
/****** Object:  StoredProcedure [dbo].[spGetNextMonster]    Script Date: 2019-12-04 04:17:01 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spGetNextMonster]
@charID INT,
@monsterID INT OUTPUT
AS
BEGIN
	SET @monsterID = (SELECT TOP 1 FightID FROM Fights WHERE (FightMonsterHP < FightMonsterMaxHP))

	IF @monsterID = NULL
	BEGIN
		SET @monsterID = (SELECT TOP 1 FightID FROM Fights ORDER BY NEWID())
	END

	RETURN @monsterID
END
GO
/****** Object:  StoredProcedure [dbo].[spLoadBundleIntoFight]    Script Date: 2019-12-04 04:17:01 ******/
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
/****** Object:  StoredProcedure [dbo].[spSetCharStatus]    Script Date: 2019-12-04 04:17:01 ******/
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
/****** Object:  StoredProcedure [dbo].[spSetCurrentQuestFromID]    Script Date: 2019-12-04 04:17:01 ******/
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
/****** Object:  StoredProcedure [dbo].[spSpin]    Script Date: 2019-12-04 04:17:01 ******/
SET ANSI_NULLS OFF
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
			--SET @actionString = 'Besoin d''une quete..'
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
					--SET @actionString = @currentQuestName
				SELECT ''
			END
	END

	ELSE IF (@charStatus = 'Quete')
	BEGIN
		DECLARE @monsterID INT
		EXECUTE dbo.spGetNextMonster 1,@monsterID = @monsterID OUTPUT
		SELECT ''
	END
END
GO
/****** Object:  StoredProcedure [dbo].[spUpdateCharacter]    Script Date: 2019-12-04 04:17:01 ******/
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
/****** Object:  StoredProcedure [dbo].[spUpdateDungeon]    Script Date: 2019-12-04 04:17:01 ******/
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
/****** Object:  StoredProcedure [dbo].[spUpdateLoot]    Script Date: 2019-12-04 04:17:01 ******/
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
/****** Object:  StoredProcedure [dbo].[spUpdateMonster]    Script Date: 2019-12-04 04:17:01 ******/
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
