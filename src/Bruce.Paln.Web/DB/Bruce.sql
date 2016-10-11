USE [master]
GO
/****** Object:  Database [Bruce]    Script Date: 10/11/2016 10:37:35 ******/
CREATE DATABASE [Bruce] ON  PRIMARY 
( NAME = N'Bruce', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\Bruce.mdf' , SIZE = 18432KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Bruce_log', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\Bruce_log.ldf' , SIZE = 69760KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Bruce] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Bruce].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Bruce] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [Bruce] SET ANSI_NULLS OFF
GO
ALTER DATABASE [Bruce] SET ANSI_PADDING OFF
GO
ALTER DATABASE [Bruce] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [Bruce] SET ARITHABORT OFF
GO
ALTER DATABASE [Bruce] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [Bruce] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [Bruce] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [Bruce] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [Bruce] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [Bruce] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [Bruce] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [Bruce] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [Bruce] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [Bruce] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [Bruce] SET  DISABLE_BROKER
GO
ALTER DATABASE [Bruce] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [Bruce] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [Bruce] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [Bruce] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [Bruce] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [Bruce] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [Bruce] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [Bruce] SET  READ_WRITE
GO
ALTER DATABASE [Bruce] SET RECOVERY FULL
GO
ALTER DATABASE [Bruce] SET  MULTI_USER
GO
ALTER DATABASE [Bruce] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [Bruce] SET DB_CHAINING OFF
GO
EXEC sys.sp_db_vardecimal_storage_format N'Bruce', N'ON'
GO
USE [Bruce]
GO
/****** Object:  Table [dbo].[UserPlan]    Script Date: 10/11/2016 10:37:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserPlan](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[Importance] [int] NOT NULL,
	[Tag] [varchar](50) NOT NULL,
	[Detail] [varchar](500) NOT NULL,
	[IsRemind] [bit] NOT NULL,
	[PerRemind] [bit] NOT NULL,
	[perRemindTime] [int] NOT NULL,
	[HappenTime] [datetime] NOT NULL,
	[UseTime] [int] NOT NULL,
	[CreateTime] [datetime] NOT NULL,
	[UpdateTime] [datetime] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 10/11/2016 10:37:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](20) NOT NULL,
	[Description] [nvarchar](1000) NULL,
 CONSTRAINT [PK_dbo.Roles] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PlanResult]    Script Date: 10/11/2016 10:37:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlanResult](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PlanId] [int] NOT NULL,
	[Result] [int] NOT NULL,
	[Summary] [ntext] NULL,
 CONSTRAINT [PK__PlanResu__3214EC07300424B4] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Note]    Script Date: 10/11/2016 10:37:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Note](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[Title] [nvarchar](64) NOT NULL,
	[Note] [ntext] NOT NULL,
	[CreateTime] [datetime] NOT NULL,
	[UpdateTime] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[FUN_GETDATESTR]    Script Date: 10/11/2016 10:37:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[FUN_GETDATESTR](@date DATETIME)
RETURNS VARCHAR(8)
BEGIN
    RETURN (CAST(YEAR(@date) AS VARCHAR)+RIGHT('00'+CAST(MONTH(@date) AS VARCHAR),2)+RIGHT('00'+CAST(DAY(@date) AS VARCHAR),2))
END
GO
/****** Object:  UserDefinedFunction [dbo].[FUN_CURGETDATESTR]    Script Date: 10/11/2016 10:37:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[FUN_CURGETDATESTR]()
RETURNS VARCHAR(8)
AS
BEGIN
    RETURN (CAST(YEAR(GETDATE()) AS VARCHAR)+RIGHT('00'+CAST(MONTH(GETDATE()) AS VARCHAR),2)+RIGHT('00'+CAST(DAY(GETDATE()) AS VARCHAR),2))
END
GO
/****** Object:  Table [dbo].[Daily]    Script Date: 10/11/2016 10:37:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Daily](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[DailyDate] [date] NOT NULL,
	[Title] [nvarchar](64) NOT NULL,
	[Summary] [ntext] NOT NULL,
	[CreateTime] [datetime] NOT NULL,
	[UpdateTime] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Administrators]    Script Date: 10/11/2016 10:37:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Administrators](
	[AdministratorID] [int] IDENTITY(1,1) NOT NULL,
	[Accounts] [nvarchar](30) NOT NULL,
	[Password] [nvarchar](256) NOT NULL,
	[LoginIP] [nvarchar](max) NULL,
	[LoginTime] [datetime] NULL,
	[CreateTime] [datetime] NOT NULL,
 CONSTRAINT [PK_dbo.Administrators] PRIMARY KEY CLUSTERED 
(
	[AdministratorID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 10/11/2016 10:37:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Weekly]    Script Date: 10/11/2016 10:37:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Weekly](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[WeekDate] [date] NOT NULL,
	[Title] [nvarchar](64) NOT NULL,
	[Summary] [ntext] NOT NULL,
	[CreateTime] [datetime] NOT NULL,
	[UpdateTime] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[VIEW_UserPlan]    Script Date: 10/11/2016 10:37:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VIEW_UserPlan]
AS
SELECT up.[Id],up.[UserId],up.[Tag],up.[Detail],up.[IsRemind],up.[PerRemind],up.[perRemindTime],up.[Importance],
       up.[HappenTime],
       up.[UseTime],
       YEAR(up.[HappenTime]) AS HappenYear,
       MONTH(up.[HappenTime]) AS HappenMonth,
       DAY(up.[HappenTime]) AS HappenDay,
       DATEPART(HOUR,up.[HappenTime]) AS HappenHour,
       DATEPART(MINUTE,up.[HappenTime]) AS HappenMinute,
       [CreateTime],[UpdateTime],
       pl.Result,
       pl.Summary FROM UserPlan up LEFT JOIN dbo.PlanResult pl ON up.Id = pl.PlanId WHERE HappenTime > DATEADD(YEAR,-1,GETDATE())
GO
/****** Object:  Table [dbo].[Users]    Script Date: 10/11/2016 10:37:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[RoleID] [int] NOT NULL,
	[UserName] [nvarchar](50) NULL,
	[Name] [nvarchar](20) NULL,
	[Sex] [int] NOT NULL,
	[PassWord] [nvarchar](256) NULL,
	[Email] [nvarchar](50) NULL,
	[LastLoginTime] [datetime] NULL,
	[LastLoginIP] [nvarchar](max) NULL,
	[RegTime] [datetime] NOT NULL,
 CONSTRAINT [PK_dbo.Users] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_RoleID] ON [dbo].[Users] 
(
	[RoleID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Default [DF_testTable_UserId]    Script Date: 10/11/2016 10:37:36 ******/
ALTER TABLE [dbo].[UserPlan] ADD  CONSTRAINT [DF_testTable_UserId]  DEFAULT ((1)) FOR [UserId]
GO
/****** Object:  Default [DF_Plans_Importance]    Script Date: 10/11/2016 10:37:36 ******/
ALTER TABLE [dbo].[UserPlan] ADD  CONSTRAINT [DF_Plans_Importance]  DEFAULT ((1)) FOR [Importance]
GO
/****** Object:  Default [DF_testTable_IsRemind]    Script Date: 10/11/2016 10:37:36 ******/
ALTER TABLE [dbo].[UserPlan] ADD  CONSTRAINT [DF_testTable_IsRemind]  DEFAULT ((1)) FOR [IsRemind]
GO
/****** Object:  Default [DF_testTable_PerRemind]    Script Date: 10/11/2016 10:37:36 ******/
ALTER TABLE [dbo].[UserPlan] ADD  CONSTRAINT [DF_testTable_PerRemind]  DEFAULT ((1)) FOR [PerRemind]
GO
/****** Object:  Default [DF_testTable_perRemindTime]    Script Date: 10/11/2016 10:37:36 ******/
ALTER TABLE [dbo].[UserPlan] ADD  CONSTRAINT [DF_testTable_perRemindTime]  DEFAULT ((10)) FOR [perRemindTime]
GO
/****** Object:  Default [DF_testTable_CreateTime]    Script Date: 10/11/2016 10:37:36 ******/
ALTER TABLE [dbo].[UserPlan] ADD  CONSTRAINT [DF_testTable_CreateTime]  DEFAULT (getdate()) FOR [CreateTime]
GO
/****** Object:  Default [DF_Plans_UpdateTime]    Script Date: 10/11/2016 10:37:36 ******/
ALTER TABLE [dbo].[UserPlan] ADD  CONSTRAINT [DF_Plans_UpdateTime]  DEFAULT (getdate()) FOR [UpdateTime]
GO
/****** Object:  Default [DF__PlanResul__Resul__31EC6D26]    Script Date: 10/11/2016 10:37:36 ******/
ALTER TABLE [dbo].[PlanResult] ADD  CONSTRAINT [DF__PlanResul__Resul__31EC6D26]  DEFAULT ((1)) FOR [Result]
GO
/****** Object:  Default [DF_Note_CreateTime]    Script Date: 10/11/2016 10:37:36 ******/
ALTER TABLE [dbo].[Note] ADD  CONSTRAINT [DF_Note_CreateTime]  DEFAULT (getdate()) FOR [CreateTime]
GO
/****** Object:  Default [DF_Note_UdateTime]    Script Date: 10/11/2016 10:37:36 ******/
ALTER TABLE [dbo].[Note] ADD  CONSTRAINT [DF_Note_UdateTime]  DEFAULT (getdate()) FOR [UpdateTime]
GO
/****** Object:  Default [DF_Daily_DailyDate]    Script Date: 10/11/2016 10:37:37 ******/
ALTER TABLE [dbo].[Daily] ADD  CONSTRAINT [DF_Daily_DailyDate]  DEFAULT (getdate()) FOR [DailyDate]
GO
/****** Object:  Default [DF_Daily_CreateTime]    Script Date: 10/11/2016 10:37:37 ******/
ALTER TABLE [dbo].[Daily] ADD  CONSTRAINT [DF_Daily_CreateTime]  DEFAULT (getdate()) FOR [CreateTime]
GO
/****** Object:  Default [DF_Daily_UpdateTime]    Script Date: 10/11/2016 10:37:37 ******/
ALTER TABLE [dbo].[Daily] ADD  CONSTRAINT [DF_Daily_UpdateTime]  DEFAULT (getdate()) FOR [UpdateTime]
GO
/****** Object:  Default [DF_Weekly_WeekDate]    Script Date: 10/11/2016 10:37:37 ******/
ALTER TABLE [dbo].[Weekly] ADD  CONSTRAINT [DF_Weekly_WeekDate]  DEFAULT (getdate()) FOR [WeekDate]
GO
/****** Object:  Default [DF_Weekly_CreateTime]    Script Date: 10/11/2016 10:37:37 ******/
ALTER TABLE [dbo].[Weekly] ADD  CONSTRAINT [DF_Weekly_CreateTime]  DEFAULT (getdate()) FOR [CreateTime]
GO
/****** Object:  Default [DF_Weekly_UpdateTime]    Script Date: 10/11/2016 10:37:37 ******/
ALTER TABLE [dbo].[Weekly] ADD  CONSTRAINT [DF_Weekly_UpdateTime]  DEFAULT (getdate()) FOR [UpdateTime]
GO
/****** Object:  ForeignKey [FK_dbo.Users_dbo.Roles_RoleID]    Script Date: 10/11/2016 10:37:37 ******/
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Users_dbo.Roles_RoleID] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Roles] ([RoleID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_dbo.Users_dbo.Roles_RoleID]
GO
