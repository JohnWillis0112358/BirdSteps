USE [master]
GO
/****** Object:  Database [BirdSteps]    Script Date: 8/4/2015 6:51:12 AM ******/
CREATE DATABASE [BirdSteps]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BirdSteps', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQL2014\MSSQL\DATA\BirdSteps.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'BirdSteps_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQL2014\MSSQL\DATA\BirdSteps_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [BirdSteps] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BirdSteps].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BirdSteps] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BirdSteps] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BirdSteps] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BirdSteps] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BirdSteps] SET ARITHABORT OFF 
GO
ALTER DATABASE [BirdSteps] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BirdSteps] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BirdSteps] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BirdSteps] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BirdSteps] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BirdSteps] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BirdSteps] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BirdSteps] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BirdSteps] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BirdSteps] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BirdSteps] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BirdSteps] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BirdSteps] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BirdSteps] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BirdSteps] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BirdSteps] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BirdSteps] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BirdSteps] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BirdSteps] SET  MULTI_USER 
GO
ALTER DATABASE [BirdSteps] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BirdSteps] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BirdSteps] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BirdSteps] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [BirdSteps] SET DELAYED_DURABILITY = DISABLED 
GO
USE [BirdSteps]
GO
/****** Object:  Table [dbo].[Answers]    Script Date: 8/4/2015 6:51:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Answers](
	[AnswerID] [int] IDENTITY(1,1) NOT NULL,
	[Answer] [nvarchar](max) NOT NULL,
	[QuestionID] [int] NOT NULL,
	[IsCorrect] [int] NOT NULL,
 CONSTRAINT [PK_Answers] PRIMARY KEY CLUSTERED 
(
	[AnswerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Questions]    Script Date: 8/4/2015 6:51:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Questions](
	[QuestionID] [int] IDENTITY(1,1) NOT NULL,
	[Question] [nvarchar](250) NOT NULL,
 CONSTRAINT [PK_Questions] PRIMARY KEY CLUSTERED 
(
	[QuestionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Answers] ON 

INSERT [dbo].[Answers] ([AnswerID], [Answer], [QuestionID], [IsCorrect]) VALUES (1, N'Blue', 1, 1)
INSERT [dbo].[Answers] ([AnswerID], [Answer], [QuestionID], [IsCorrect]) VALUES (2, N'Red', 1, 0)
INSERT [dbo].[Answers] ([AnswerID], [Answer], [QuestionID], [IsCorrect]) VALUES (3, N'Purple', 2, 1)
INSERT [dbo].[Answers] ([AnswerID], [Answer], [QuestionID], [IsCorrect]) VALUES (4, N'Doge', 3, 1)
INSERT [dbo].[Answers] ([AnswerID], [Answer], [QuestionID], [IsCorrect]) VALUES (5, N'Radiskull', 3, 0)
SET IDENTITY_INSERT [dbo].[Answers] OFF
SET IDENTITY_INSERT [dbo].[Questions] ON 

INSERT [dbo].[Questions] ([QuestionID], [Question]) VALUES (1, N'Is there a sky?')
INSERT [dbo].[Questions] ([QuestionID], [Question]) VALUES (2, N'Is there a dog?')
INSERT [dbo].[Questions] ([QuestionID], [Question]) VALUES (3, N'How many cats in eleventy?')
SET IDENTITY_INSERT [dbo].[Questions] OFF
ALTER TABLE [dbo].[Answers]  WITH CHECK ADD  CONSTRAINT [FK_Answers_Questions] FOREIGN KEY([QuestionID])
REFERENCES [dbo].[Questions] ([QuestionID])
GO
ALTER TABLE [dbo].[Answers] CHECK CONSTRAINT [FK_Answers_Questions]
GO
/****** Object:  StoredProcedure [dbo].[GetAnswers]    Script Date: 8/4/2015 6:51:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[GetAnswers] 
(
	@QuestionID int
)
AS

	SELECT *
	FROM Answers
	WHERE QuestionID = @QuestionID
	

GO
/****** Object:  StoredProcedure [dbo].[GetQuestions]    Script Date: 8/4/2015 6:51:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[GetQuestions]
AS

	SELECT *
	FROM Questions 
	

GO
USE [master]
GO
ALTER DATABASE [BirdSteps] SET  READ_WRITE 
GO
