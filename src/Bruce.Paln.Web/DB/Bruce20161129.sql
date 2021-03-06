USE [master]
GO
/****** Object:  Database [Bruce]    Script Date: 11/29/2016 19:18:05 ******/
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
/****** Object:  Table [dbo].[UserPlan]    Script Date: 11/29/2016 19:18:06 ******/
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
SET IDENTITY_INSERT [dbo].[UserPlan] ON
INSERT [dbo].[UserPlan] ([Id], [UserId], [Importance], [Tag], [Detail], [IsRemind], [PerRemind], [perRemindTime], [HappenTime], [UseTime], [CreateTime], [UpdateTime]) VALUES (1, 12, 2, N'测试任务添加', N'1. 界面样式
2. 登录功能
3. 反应速度', 1, 1, 10, CAST(0x0000A688015A9E60 AS DateTime), 20, CAST(0x0000A688015B2BE7 AS DateTime), CAST(0x0000A688015BC49A AS DateTime))
INSERT [dbo].[UserPlan] ([Id], [UserId], [Importance], [Tag], [Detail], [IsRemind], [PerRemind], [perRemindTime], [HappenTime], [UseTime], [CreateTime], [UpdateTime]) VALUES (2, 12, 1, N'测试添加过期任务', N'测试添加过期任务', 1, 1, 10, CAST(0x0000A688014A23A0 AS DateTime), 30, CAST(0x0000A688015B5DEF AS DateTime), CAST(0x0000A688015B5DEF AS DateTime))
INSERT [dbo].[UserPlan] ([Id], [UserId], [Importance], [Tag], [Detail], [IsRemind], [PerRemind], [perRemindTime], [HappenTime], [UseTime], [CreateTime], [UpdateTime]) VALUES (3, 12, 1, N'测试添加未来任务', N'测试添加未来任务', 1, 1, 10, CAST(0x0000A688016B1920 AS DateTime), 60, CAST(0x0000A688015B78CA AS DateTime), CAST(0x0000A688015BB660 AS DateTime))
INSERT [dbo].[UserPlan] ([Id], [UserId], [Importance], [Tag], [Detail], [IsRemind], [PerRemind], [perRemindTime], [HappenTime], [UseTime], [CreateTime], [UpdateTime]) VALUES (4, 12, 1, N'Review车型库后台', N'1. 逻辑测试
2. 代码检查', 1, 1, 10, CAST(0x0000A689009C8E20 AS DateTime), 60, CAST(0x0000A68900911EDF AS DateTime), CAST(0x0000A68900911EDF AS DateTime))
INSERT [dbo].[UserPlan] ([Id], [UserId], [Importance], [Tag], [Detail], [IsRemind], [PerRemind], [perRemindTime], [HappenTime], [UseTime], [CreateTime], [UpdateTime]) VALUES (5, 12, 2, N'Docker', N'1. Docker 基本使用
2. Linux命令', 1, 1, 10, CAST(0x0000A68900B28720 AS DateTime), 60, CAST(0x0000A68900917675 AS DateTime), CAST(0x0000A68900917675 AS DateTime))
INSERT [dbo].[UserPlan] ([Id], [UserId], [Importance], [Tag], [Detail], [IsRemind], [PerRemind], [perRemindTime], [HappenTime], [UseTime], [CreateTime], [UpdateTime]) VALUES (6, 12, 1, N'今日新闻', N'浏览', 1, 1, 10, CAST(0x0000A68900914B50 AS DateTime), 30, CAST(0x0000A6890091AAF5 AS DateTime), CAST(0x0000A6890091AAF5 AS DateTime))
INSERT [dbo].[UserPlan] ([Id], [UserId], [Importance], [Tag], [Detail], [IsRemind], [PerRemind], [perRemindTime], [HappenTime], [UseTime], [CreateTime], [UpdateTime]) VALUES (7, 12, 1, N'Review车型库后台', N'1. 代码检查', 1, 1, 10, CAST(0x0000A68900E975A0 AS DateTime), 60, CAST(0x0000A6890092013A AS DateTime), CAST(0x0000A6890092013A AS DateTime))
INSERT [dbo].[UserPlan] ([Id], [UserId], [Importance], [Tag], [Detail], [IsRemind], [PerRemind], [perRemindTime], [HappenTime], [UseTime], [CreateTime], [UpdateTime]) VALUES (8, 12, 1, N'Docker', N'Docker命令练习', 1, 1, 10, CAST(0x0000A68900FF6EA0 AS DateTime), 60, CAST(0x0000A68900923AD5 AS DateTime), CAST(0x0000A68900EE2C58 AS DateTime))
INSERT [dbo].[UserPlan] ([Id], [UserId], [Importance], [Tag], [Detail], [IsRemind], [PerRemind], [perRemindTime], [HappenTime], [UseTime], [CreateTime], [UpdateTime]) VALUES (9, 12, 1, N'前端网站浏览', N'HTML+CSS经典书籍', 1, 1, 10, CAST(0x0000A689010FE960 AS DateTime), 60, CAST(0x0000A68900929291 AS DateTime), CAST(0x0000A68900929291 AS DateTime))
INSERT [dbo].[UserPlan] ([Id], [UserId], [Importance], [Tag], [Detail], [IsRemind], [PerRemind], [perRemindTime], [HappenTime], [UseTime], [CreateTime], [UpdateTime]) VALUES (10, 12, 2, N'新的改动', N'1. 周记录总结，在下拉菜单中加入新项。
2. 便签，记录新的想法和改动。', 1, 1, 10, CAST(0x0000A6890131B1D0 AS DateTime), 30, CAST(0x0000A68900B09B94 AS DateTime), CAST(0x0000A68900B09B94 AS DateTime))
INSERT [dbo].[UserPlan] ([Id], [UserId], [Importance], [Tag], [Detail], [IsRemind], [PerRemind], [perRemindTime], [HappenTime], [UseTime], [CreateTime], [UpdateTime]) VALUES (13, 12, 1, N'阿拉丁360百科', N'新的XML文件开发', 1, 1, 10, CAST(0x0000A68A00AA49C0 AS DateTime), 60, CAST(0x0000A68A00A7D1C5 AS DateTime), CAST(0x0000A68A00A7D1C5 AS DateTime))
INSERT [dbo].[UserPlan] ([Id], [UserId], [Importance], [Tag], [Detail], [IsRemind], [PerRemind], [perRemindTime], [HappenTime], [UseTime], [CreateTime], [UpdateTime]) VALUES (14, 12, 1, N'继续优化本程序', N'继续优化本程序，
每日总结，
声音和alert便可以提示
session过期时间问题，最好用Cookie，参开后台项目', 1, 1, 10, CAST(0x0000A68A00BD83A0 AS DateTime), 30, CAST(0x0000A68A00A811F7 AS DateTime), CAST(0x0000A68A00B40CB7 AS DateTime))
INSERT [dbo].[UserPlan] ([Id], [UserId], [Importance], [Tag], [Detail], [IsRemind], [PerRemind], [perRemindTime], [HappenTime], [UseTime], [CreateTime], [UpdateTime]) VALUES (15, 12, 1, N'车型库后台renview', N'车型库后台renview', 1, 1, 10, CAST(0x0000A68A00F73140 AS DateTime), 120, CAST(0x0000A68A00A842FF AS DateTime), CAST(0x0000A68A01132900 AS DateTime))
INSERT [dbo].[UserPlan] ([Id], [UserId], [Importance], [Tag], [Detail], [IsRemind], [PerRemind], [perRemindTime], [HappenTime], [UseTime], [CreateTime], [UpdateTime]) VALUES (16, 12, 1, N'Docker实验', N'熟悉各种命令。', 1, 1, 10, CAST(0x0000A68A011826C0 AS DateTime), 30, CAST(0x0000A68A00A8B51B AS DateTime), CAST(0x0000A68A0118A0B2 AS DateTime))
INSERT [dbo].[UserPlan] ([Id], [UserId], [Importance], [Tag], [Detail], [IsRemind], [PerRemind], [perRemindTime], [HappenTime], [UseTime], [CreateTime], [UpdateTime]) VALUES (17, 12, 1, N'前端两篇文章要看', N'看完，并理解各种概念。', 1, 1, 10, CAST(0x0000A68A0128A180 AS DateTime), 30, CAST(0x0000A68A00A9101B AS DateTime), CAST(0x0000A68A00A9101B AS DateTime))
INSERT [dbo].[UserPlan] ([Id], [UserId], [Importance], [Tag], [Detail], [IsRemind], [PerRemind], [perRemindTime], [HappenTime], [UseTime], [CreateTime], [UpdateTime]) VALUES (18, 12, 1, N'阿拉丁', N'完成', 1, 1, 10, CAST(0x0000A68D00A20C60 AS DateTime), 120, CAST(0x0000A68D00A2181C AS DateTime), CAST(0x0000A68D00A2181C AS DateTime))
INSERT [dbo].[UserPlan] ([Id], [UserId], [Importance], [Tag], [Detail], [IsRemind], [PerRemind], [perRemindTime], [HappenTime], [UseTime], [CreateTime], [UpdateTime]) VALUES (19, 12, 1, N'后台Review（阿拉丁未完成继续阿拉丁）', N'后台Review（阿拉丁未完成继续阿拉丁）', 1, 1, 10, CAST(0x0000A68D00E975A0 AS DateTime), 120, CAST(0x0000A68D00A25469 AS DateTime), CAST(0x0000A68D00EE959F AS DateTime))
INSERT [dbo].[UserPlan] ([Id], [UserId], [Importance], [Tag], [Detail], [IsRemind], [PerRemind], [perRemindTime], [HappenTime], [UseTime], [CreateTime], [UpdateTime]) VALUES (20, 12, 1, N'plan', N'plan', 1, 1, 10, CAST(0x0000A68D010FE960 AS DateTime), 60, CAST(0x0000A68D00A28D54 AS DateTime), CAST(0x0000A68D00A28D54 AS DateTime))
INSERT [dbo].[UserPlan] ([Id], [UserId], [Importance], [Tag], [Detail], [IsRemind], [PerRemind], [perRemindTime], [HappenTime], [UseTime], [CreateTime], [UpdateTime]) VALUES (21, 12, 1, N'车型库重构Review', N'车型库重构Review', 1, 1, 10, CAST(0x0000A69100A8A3E0 AS DateTime), 120, CAST(0x0000A69100A8D0C2 AS DateTime), CAST(0x0000A69100A8D0C2 AS DateTime))
INSERT [dbo].[UserPlan] ([Id], [UserId], [Importance], [Tag], [Detail], [IsRemind], [PerRemind], [perRemindTime], [HappenTime], [UseTime], [CreateTime], [UpdateTime]) VALUES (22, 12, 1, N'车型库重构Review', N'车型库重构Review', 1, 1, 10, CAST(0x0000A69100F73140 AS DateTime), 60, CAST(0x0000A69100A8F1F8 AS DateTime), CAST(0x0000A69100A8F1F8 AS DateTime))
INSERT [dbo].[UserPlan] ([Id], [UserId], [Importance], [Tag], [Detail], [IsRemind], [PerRemind], [perRemindTime], [HappenTime], [UseTime], [CreateTime], [UpdateTime]) VALUES (23, 12, 1, N'技术分享', N'技术分享', 1, 1, 10, CAST(0x0000A6910107AC00 AS DateTime), 90, CAST(0x0000A69100A9109C AS DateTime), CAST(0x0000A69100A9109C AS DateTime))
INSERT [dbo].[UserPlan] ([Id], [UserId], [Importance], [Tag], [Detail], [IsRemind], [PerRemind], [perRemindTime], [HappenTime], [UseTime], [CreateTime], [UpdateTime]) VALUES (24, 12, 2, N'车型库后台Review', N'车型库后台Review，后端逻辑检查。', 1, 1, 10, CAST(0x0000A69900FB09A0 AS DateTime), 100, CAST(0x0000A69900FB7B49 AS DateTime), CAST(0x0000A69900FB7B49 AS DateTime))
INSERT [dbo].[UserPlan] ([Id], [UserId], [Importance], [Tag], [Detail], [IsRemind], [PerRemind], [perRemindTime], [HappenTime], [UseTime], [CreateTime], [UpdateTime]) VALUES (25, 12, 1, N'车型库前端逻辑检查', N'车型库前端逻辑检查，查看前端逻辑以及写法是否可靠。', 1, 1, 10, CAST(0x0000A699011826C0 AS DateTime), 30, CAST(0x0000A69900FBD3DA AS DateTime), CAST(0x0000A69900FBD3DA AS DateTime))
INSERT [dbo].[UserPlan] ([Id], [UserId], [Importance], [Tag], [Detail], [IsRemind], [PerRemind], [perRemindTime], [HappenTime], [UseTime], [CreateTime], [UpdateTime]) VALUES (26, 12, 1, N'测试声音', N'测试声音', 1, 1, 10, CAST(0x0000A69A013BDB60 AS DateTime), 54, CAST(0x0000A69A013BC3C5 AS DateTime), CAST(0x0000A69A014A960F AS DateTime))
INSERT [dbo].[UserPlan] ([Id], [UserId], [Importance], [Tag], [Detail], [IsRemind], [PerRemind], [perRemindTime], [HappenTime], [UseTime], [CreateTime], [UpdateTime]) VALUES (27, 12, 1, N'测试', N'测试', 1, 1, 10, CAST(0x0000A69A014AF690 AS DateTime), 1, CAST(0x0000A69A01455CEB AS DateTime), CAST(0x0000A69A014AA52A AS DateTime))
INSERT [dbo].[UserPlan] ([Id], [UserId], [Importance], [Tag], [Detail], [IsRemind], [PerRemind], [perRemindTime], [HappenTime], [UseTime], [CreateTime], [UpdateTime]) VALUES (28, 12, 1, N'车型库后台Review', N'车型库后台Review', 1, 1, 10, CAST(0x0000A69B00A20C60 AS DateTime), 90, CAST(0x0000A69B009C15A3 AS DateTime), CAST(0x0000A69B009C15A3 AS DateTime))
INSERT [dbo].[UserPlan] ([Id], [UserId], [Importance], [Tag], [Detail], [IsRemind], [PerRemind], [perRemindTime], [HappenTime], [UseTime], [CreateTime], [UpdateTime]) VALUES (30, 12, 1, N'测试提醒', N'测试提醒', 1, 1, 10, CAST(0x0000A69B015752A0 AS DateTime), 1, CAST(0x0000A69B014163B5 AS DateTime), CAST(0x0000A69B01574CC2 AS DateTime))
INSERT [dbo].[UserPlan] ([Id], [UserId], [Importance], [Tag], [Detail], [IsRemind], [PerRemind], [perRemindTime], [HappenTime], [UseTime], [CreateTime], [UpdateTime]) VALUES (31, 12, 1, N'车型库后台代码逻辑', N'看看车型库后台代码和逻辑', 1, 1, 10, CAST(0x0000A69C00AD08E0 AS DateTime), 60, CAST(0x0000A69C00ADCE98 AS DateTime), CAST(0x0000A69C00ADCE98 AS DateTime))
INSERT [dbo].[UserPlan] ([Id], [UserId], [Importance], [Tag], [Detail], [IsRemind], [PerRemind], [perRemindTime], [HappenTime], [UseTime], [CreateTime], [UpdateTime]) VALUES (32, 12, 1, N'车型库后台代码逻辑', N'车型库后台代码逻辑', 1, 1, 10, CAST(0x0000A69C00F73140 AS DateTime), 60, CAST(0x0000A69C00F595C2 AS DateTime), CAST(0x0000A69C00F595C2 AS DateTime))
INSERT [dbo].[UserPlan] ([Id], [UserId], [Importance], [Tag], [Detail], [IsRemind], [PerRemind], [perRemindTime], [HappenTime], [UseTime], [CreateTime], [UpdateTime]) VALUES (33, 12, 1, N'车型库后台代码逻辑', N'车型库后台代码逻辑', 1, 1, 10, CAST(0x0000A69C010A6B20 AS DateTime), 60, CAST(0x0000A69C00F5ACA1 AS DateTime), CAST(0x0000A69C011B4095 AS DateTime))
INSERT [dbo].[UserPlan] ([Id], [UserId], [Importance], [Tag], [Detail], [IsRemind], [PerRemind], [perRemindTime], [HappenTime], [UseTime], [CreateTime], [UpdateTime]) VALUES (34, 12, 0, N'test', N'test', 1, 1, 10, CAST(0x0000A69C014D6F60 AS DateTime), 1, CAST(0x0000A69C014A509E AS DateTime), CAST(0x0000A69C014D4846 AS DateTime))
INSERT [dbo].[UserPlan] ([Id], [UserId], [Importance], [Tag], [Detail], [IsRemind], [PerRemind], [perRemindTime], [HappenTime], [UseTime], [CreateTime], [UpdateTime]) VALUES (37, 12, 1, N'问题解决', N'1. 登录时间问题。
2. 提醒两次问题。
3. 天气，雾霾是重点。', 1, 1, 10, CAST(0x0000A69D0128A180 AS DateTime), 160, CAST(0x0000A69D00A7A572 AS DateTime), CAST(0x0000A69D014CFF2E AS DateTime))
INSERT [dbo].[UserPlan] ([Id], [UserId], [Importance], [Tag], [Detail], [IsRemind], [PerRemind], [perRemindTime], [HappenTime], [UseTime], [CreateTime], [UpdateTime]) VALUES (42, 12, 1, N'车型库后台Review', N'车型库后台Review', 1, 1, 10, CAST(0x0000A69E00A20C60 AS DateTime), 100, CAST(0x0000A69E009A250A AS DateTime), CAST(0x0000A69E009A250A AS DateTime))
INSERT [dbo].[UserPlan] ([Id], [UserId], [Importance], [Tag], [Detail], [IsRemind], [PerRemind], [perRemindTime], [HappenTime], [UseTime], [CreateTime], [UpdateTime]) VALUES (43, 12, 1, N'Bug修正', N'1. 登录时间设置
2. 天气', 1, 1, 10, CAST(0x0000A69E0128A180 AS DateTime), 60, CAST(0x0000A69E009A61E2 AS DateTime), CAST(0x0000A69E009A7FFF AS DateTime))
INSERT [dbo].[UserPlan] ([Id], [UserId], [Importance], [Tag], [Detail], [IsRemind], [PerRemind], [perRemindTime], [HappenTime], [UseTime], [CreateTime], [UpdateTime]) VALUES (45, 12, 1, N'bug确认', N'bug确认（上市时间）', 1, 1, 10, CAST(0x0000A69F009F4D40 AS DateTime), 30, CAST(0x0000A69F008EF729 AS DateTime), CAST(0x0000A69F00A379BB AS DateTime))
INSERT [dbo].[UserPlan] ([Id], [UserId], [Importance], [Tag], [Detail], [IsRemind], [PerRemind], [perRemindTime], [HappenTime], [UseTime], [CreateTime], [UpdateTime]) VALUES (46, 12, 2, N'车型库后台Review', N'车型库后台Review', 1, 1, 10, CAST(0x0000A69F00AA49C0 AS DateTime), 60, CAST(0x0000A69F00901D4C AS DateTime), CAST(0x0000A69F00901D4C AS DateTime))
INSERT [dbo].[UserPlan] ([Id], [UserId], [Importance], [Tag], [Detail], [IsRemind], [PerRemind], [perRemindTime], [HappenTime], [UseTime], [CreateTime], [UpdateTime]) VALUES (47, 12, 1, N'车展架构看看', N'车展架构看看', 1, 1, 10, CAST(0x0000A6A200E6B680 AS DateTime), 60, CAST(0x0000A6A200C20625 AS DateTime), CAST(0x0000A6A201084E8F AS DateTime))
INSERT [dbo].[UserPlan] ([Id], [UserId], [Importance], [Tag], [Detail], [IsRemind], [PerRemind], [perRemindTime], [HappenTime], [UseTime], [CreateTime], [UpdateTime]) VALUES (49, 12, 1, N'车展项目', N'车展项目', 1, 1, 10, CAST(0x0000A6A3009C8E20 AS DateTime), 60, CAST(0x0000A6A300979128 AS DateTime), CAST(0x0000A6A300979128 AS DateTime))
INSERT [dbo].[UserPlan] ([Id], [UserId], [Importance], [Tag], [Detail], [IsRemind], [PerRemind], [perRemindTime], [HappenTime], [UseTime], [CreateTime], [UpdateTime]) VALUES (50, 12, 1, N'车展项目看看', N'车展项目看看', 1, 1, 10, CAST(0x0000A6A300AFC800 AS DateTime), 60, CAST(0x0000A6A300AECC18 AS DateTime), CAST(0x0000A6A300AECC18 AS DateTime))
INSERT [dbo].[UserPlan] ([Id], [UserId], [Importance], [Tag], [Detail], [IsRemind], [PerRemind], [perRemindTime], [HappenTime], [UseTime], [CreateTime], [UpdateTime]) VALUES (53, 12, 1, N'科目一', N'科目一', 1, 1, 10, CAST(0x0000A6A30130DEE0 AS DateTime), 90, CAST(0x0000A6A30134EAC6 AS DateTime), CAST(0x0000A6A30134EAC6 AS DateTime))
INSERT [dbo].[UserPlan] ([Id], [UserId], [Importance], [Tag], [Detail], [IsRemind], [PerRemind], [perRemindTime], [HappenTime], [UseTime], [CreateTime], [UpdateTime]) VALUES (60, 12, 1, N'车展项目看看', N'车展项目看看', 1, 1, 10, CAST(0x0000A6A4009C8E20 AS DateTime), 120, CAST(0x0000A6A400A13EAB AS DateTime), CAST(0x0000A6A400A13EAB AS DateTime))
INSERT [dbo].[UserPlan] ([Id], [UserId], [Importance], [Tag], [Detail], [IsRemind], [PerRemind], [perRemindTime], [HappenTime], [UseTime], [CreateTime], [UpdateTime]) VALUES (61, 12, 1, N'车型库后台代码review', N'车型库后台代码review', 1, 1, 10, CAST(0x0000A6A5009F4D40 AS DateTime), 60, CAST(0x0000A6A5008DEA27 AS DateTime), CAST(0x0000A6A5008DEA27 AS DateTime))
INSERT [dbo].[UserPlan] ([Id], [UserId], [Importance], [Tag], [Detail], [IsRemind], [PerRemind], [perRemindTime], [HappenTime], [UseTime], [CreateTime], [UpdateTime]) VALUES (62, 12, 1, N'车展项目', N'车展项目', 1, 1, 10, CAST(0x0000A6A500AFC800 AS DateTime), 60, CAST(0x0000A6A5008E161C AS DateTime), CAST(0x0000A6A5008E161C AS DateTime))
INSERT [dbo].[UserPlan] ([Id], [UserId], [Importance], [Tag], [Detail], [IsRemind], [PerRemind], [perRemindTime], [HappenTime], [UseTime], [CreateTime], [UpdateTime]) VALUES (63, 12, 1, N'车型库后台review', N'车型库后台review', 1, 1, 10, CAST(0x0000A6A500EEF3E0 AS DateTime), 120, CAST(0x0000A6A500F08958 AS DateTime), CAST(0x0000A6A500F08958 AS DateTime))
INSERT [dbo].[UserPlan] ([Id], [UserId], [Importance], [Tag], [Detail], [IsRemind], [PerRemind], [perRemindTime], [HappenTime], [UseTime], [CreateTime], [UpdateTime]) VALUES (64, 12, 1, N'车型库后台Review', N'车型库后台Review', 1, 1, 10, CAST(0x0000A6A6009C8E20 AS DateTime), 120, CAST(0x0000A6A600969E40 AS DateTime), CAST(0x0000A6A600969E40 AS DateTime))
INSERT [dbo].[UserPlan] ([Id], [UserId], [Importance], [Tag], [Detail], [IsRemind], [PerRemind], [perRemindTime], [HappenTime], [UseTime], [CreateTime], [UpdateTime]) VALUES (65, 12, 1, N'内存优化', N'KeyCount内存优化', 1, 1, 10, CAST(0x0000A6A600EEF3E0 AS DateTime), 30, CAST(0x0000A6A600E585CF AS DateTime), CAST(0x0000A6A600E585CF AS DateTime))
INSERT [dbo].[UserPlan] ([Id], [UserId], [Importance], [Tag], [Detail], [IsRemind], [PerRemind], [perRemindTime], [HappenTime], [UseTime], [CreateTime], [UpdateTime]) VALUES (68, 12, 2, N'test', N'container-fluid', 1, 1, 10, CAST(0x0000A6A9014159A0 AS DateTime), 10, CAST(0x0000A6A9014165CB AS DateTime), CAST(0x0000A6A901417669 AS DateTime))
INSERT [dbo].[UserPlan] ([Id], [UserId], [Importance], [Tag], [Detail], [IsRemind], [PerRemind], [perRemindTime], [HappenTime], [UseTime], [CreateTime], [UpdateTime]) VALUES (71, 12, 0, N'富贵发达国', N'巍峨个地方', 1, 1, 10, CAST(0x0000A6A9014159A0 AS DateTime), 0, CAST(0x0000A6A901419801 AS DateTime), CAST(0x0000A6A901419801 AS DateTime))
INSERT [dbo].[UserPlan] ([Id], [UserId], [Importance], [Tag], [Detail], [IsRemind], [PerRemind], [perRemindTime], [HappenTime], [UseTime], [CreateTime], [UpdateTime]) VALUES (74, 12, 1, N'车展项目C#', N'车展项目C#，大致逻辑。', 1, 1, 10, CAST(0x0000A6AA00E975A0 AS DateTime), 60, CAST(0x0000A6AA00B90193 AS DateTime), CAST(0x0000A6AA00EED751 AS DateTime))
INSERT [dbo].[UserPlan] ([Id], [UserId], [Importance], [Tag], [Detail], [IsRemind], [PerRemind], [perRemindTime], [HappenTime], [UseTime], [CreateTime], [UpdateTime]) VALUES (75, 12, 1, N'车展前端Js', N'前端引用的Js逻辑，左侧树菜单。', 1, 1, 10, CAST(0x0000A6AA00FF6EA0 AS DateTime), 120, CAST(0x0000A6AA00EEBA9C AS DateTime), CAST(0x0000A6AA00EEBA9C AS DateTime))
INSERT [dbo].[UserPlan] ([Id], [UserId], [Importance], [Tag], [Detail], [IsRemind], [PerRemind], [perRemindTime], [HappenTime], [UseTime], [CreateTime], [UpdateTime]) VALUES (76, 12, 1, N'车展项目测试', N'新建车展在后台添加数据后，在前台添加。', 1, 1, 10, CAST(0x0000A6AC00A4CB80 AS DateTime), 100, CAST(0x0000A6AC00AAEB16 AS DateTime), CAST(0x0000A6AC00B73238 AS DateTime))
INSERT [dbo].[UserPlan] ([Id], [UserId], [Importance], [Tag], [Detail], [IsRemind], [PerRemind], [perRemindTime], [HappenTime], [UseTime], [CreateTime], [UpdateTime]) VALUES (77, 12, 1, N'车展项目', N'车展还是不能正常生成页面。', 1, 1, 10, CAST(0x0000A6AC00EEF3E0 AS DateTime), 120, CAST(0x0000A6AC00F7917E AS DateTime), CAST(0x0000A6AC00F7917E AS DateTime))
INSERT [dbo].[UserPlan] ([Id], [UserId], [Importance], [Tag], [Detail], [IsRemind], [PerRemind], [perRemindTime], [HappenTime], [UseTime], [CreateTime], [UpdateTime]) VALUES (78, 12, 1, N'车展项目', N'车展C#源码逻辑。。。', 1, 1, 10, CAST(0x0000A6AD00A4CB80 AS DateTime), 100, CAST(0x0000A6AD00A7615A AS DateTime), CAST(0x0000A6AD00A7615A AS DateTime))
INSERT [dbo].[UserPlan] ([Id], [UserId], [Importance], [Tag], [Detail], [IsRemind], [PerRemind], [perRemindTime], [HappenTime], [UseTime], [CreateTime], [UpdateTime]) VALUES (80, 12, 2, N'杜老二的后台', N'杜老二的后台', 1, 1, 10, CAST(0x0000A6AF00AD08E0 AS DateTime), 90, CAST(0x0000A6AF00AB8922 AS DateTime), CAST(0x0000A6AF00AB8922 AS DateTime))
INSERT [dbo].[UserPlan] ([Id], [UserId], [Importance], [Tag], [Detail], [IsRemind], [PerRemind], [perRemindTime], [HappenTime], [UseTime], [CreateTime], [UpdateTime]) VALUES (81, 12, 1, N'车展项目', N'车展项目后台逻辑，重点是XML文件的解析', 1, 1, 10, CAST(0x0000A6B0009C8E20 AS DateTime), 120, CAST(0x0000A6B0009B5059 AS DateTime), CAST(0x0000A6B0009B5059 AS DateTime))
INSERT [dbo].[UserPlan] ([Id], [UserId], [Importance], [Tag], [Detail], [IsRemind], [PerRemind], [perRemindTime], [HappenTime], [UseTime], [CreateTime], [UpdateTime]) VALUES (82, 12, 1, N'车展项目页面逻辑', N'车展项目页面逻辑，前端Js后端代码。', 1, 1, 10, CAST(0x0000A6B000EEF3E0 AS DateTime), 120, CAST(0x0000A6B000F016D8 AS DateTime), CAST(0x0000A6B000F016D8 AS DateTime))
INSERT [dbo].[UserPlan] ([Id], [UserId], [Importance], [Tag], [Detail], [IsRemind], [PerRemind], [perRemindTime], [HappenTime], [UseTime], [CreateTime], [UpdateTime]) VALUES (84, 12, 1, N'车展项目', N'后台代码逻辑。。', 1, 1, 10, CAST(0x0000A6B1009C8E20 AS DateTime), 120, CAST(0x0000A6B1009AB732 AS DateTime), CAST(0x0000A6B1011C93BA AS DateTime))
INSERT [dbo].[UserPlan] ([Id], [UserId], [Importance], [Tag], [Detail], [IsRemind], [PerRemind], [perRemindTime], [HappenTime], [UseTime], [CreateTime], [UpdateTime]) VALUES (85, 12, 1, N'车展项目', N'导入新的前端模板。', 1, 1, 10, CAST(0x0000A6B100EEF3E0 AS DateTime), 180, CAST(0x0000A6B1011C6A8D AS DateTime), CAST(0x0000A6B1011C6A8D AS DateTime))
INSERT [dbo].[UserPlan] ([Id], [UserId], [Importance], [Tag], [Detail], [IsRemind], [PerRemind], [perRemindTime], [HappenTime], [UseTime], [CreateTime], [UpdateTime]) VALUES (86, 12, 1, N'杜二爷的破事', N'杜二爷的破事，DTcms开始二次开发', 1, 1, 10, CAST(0x0000A6B10128A180 AS DateTime), 120, CAST(0x0000A6B10120A860 AS DateTime), CAST(0x0000A6B10120A860 AS DateTime))
INSERT [dbo].[UserPlan] ([Id], [UserId], [Importance], [Tag], [Detail], [IsRemind], [PerRemind], [perRemindTime], [HappenTime], [UseTime], [CreateTime], [UpdateTime]) VALUES (87, 12, 1, N'车展项目', N'继续修正模板页', 1, 1, 10, CAST(0x0000A6B2009C8E20 AS DateTime), 120, CAST(0x0000A6B2009E0F63 AS DateTime), CAST(0x0000A6B200AD3AAA AS DateTime))
INSERT [dbo].[UserPlan] ([Id], [UserId], [Importance], [Tag], [Detail], [IsRemind], [PerRemind], [perRemindTime], [HappenTime], [UseTime], [CreateTime], [UpdateTime]) VALUES (96, 12, 1, N'车展项目移动端', N'车展项目移动端，小细节完善。', 1, 1, 10, CAST(0x0000A6B4009C8E20 AS DateTime), 120, CAST(0x0000A6B4009CD822 AS DateTime), CAST(0x0000A6B4009CD822 AS DateTime))
INSERT [dbo].[UserPlan] ([Id], [UserId], [Importance], [Tag], [Detail], [IsRemind], [PerRemind], [perRemindTime], [HappenTime], [UseTime], [CreateTime], [UpdateTime]) VALUES (29, 12, 2, N'提醒js修改', N'提醒js修改', 1, 1, 10, CAST(0x0000A69B009C8E20 AS DateTime), 19, CAST(0x0000A69B009C4F70 AS DateTime), CAST(0x0000A69B00A18A97 AS DateTime))
INSERT [dbo].[UserPlan] ([Id], [UserId], [Importance], [Tag], [Detail], [IsRemind], [PerRemind], [perRemindTime], [HappenTime], [UseTime], [CreateTime], [UpdateTime]) VALUES (66, 12, 1, N'车型库后台优化', N'车型库后台优化', 1, 1, 10, CAST(0x0000A6A600F9F060 AS DateTime), 120, CAST(0x0000A6A600F75A38 AS DateTime), CAST(0x0000A6A600F75A38 AS DateTime))
INSERT [dbo].[UserPlan] ([Id], [UserId], [Importance], [Tag], [Detail], [IsRemind], [PerRemind], [perRemindTime], [HappenTime], [UseTime], [CreateTime], [UpdateTime]) VALUES (88, 12, 1, N'车展项目品牌页面模板', N'车展项目品牌页面模板', 1, 1, 10, CAST(0x0000A6B200EC34C0 AS DateTime), 180, CAST(0x0000A6B200EAE5A0 AS DateTime), CAST(0x0000A6B200EAE5A0 AS DateTime))
INSERT [dbo].[UserPlan] ([Id], [UserId], [Importance], [Tag], [Detail], [IsRemind], [PerRemind], [perRemindTime], [HappenTime], [UseTime], [CreateTime], [UpdateTime]) VALUES (35, 12, 1, N'车型库后台Review', N'车型库后台Review，代码和逻辑', 1, 1, 10, CAST(0x0000A69D009F4D40 AS DateTime), 120, CAST(0x0000A69D009BAE22 AS DateTime), CAST(0x0000A69D009BAE22 AS DateTime))
INSERT [dbo].[UserPlan] ([Id], [UserId], [Importance], [Tag], [Detail], [IsRemind], [PerRemind], [perRemindTime], [HappenTime], [UseTime], [CreateTime], [UpdateTime]) VALUES (36, 12, 1, N'LeetCode题目', N'LeetCode题目，做题。', 1, 1, 10, CAST(0x0000A69D00C042C0 AS DateTime), 10, CAST(0x0000A69D009BE088 AS DateTime), CAST(0x0000A69D009C0981 AS DateTime))
INSERT [dbo].[UserPlan] ([Id], [UserId], [Importance], [Tag], [Detail], [IsRemind], [PerRemind], [perRemindTime], [HappenTime], [UseTime], [CreateTime], [UpdateTime]) VALUES (89, 12, 1, N'杜老二操蛋', N'杜老二操蛋，争取把后台套完。', 1, 1, 10, CAST(0x0000A6B20128A180 AS DateTime), 180, CAST(0x0000A6B2011E0612 AS DateTime), CAST(0x0000A6B20149E50F AS DateTime))
INSERT [dbo].[UserPlan] ([Id], [UserId], [Importance], [Tag], [Detail], [IsRemind], [PerRemind], [perRemindTime], [HappenTime], [UseTime], [CreateTime], [UpdateTime]) VALUES (94, 12, 1, N'清空购物车', N'111111111，买衣服，买保暖设备，买玩具', 1, 1, 10, CAST(0x0000A6B301232340 AS DateTime), 30, CAST(0x0000A6B300FBD991 AS DateTime), CAST(0x0000A6B3010768ED AS DateTime))
INSERT [dbo].[UserPlan] ([Id], [UserId], [Importance], [Tag], [Detail], [IsRemind], [PerRemind], [perRemindTime], [HappenTime], [UseTime], [CreateTime], [UpdateTime]) VALUES (95, 12, 1, N'杜老二的操蛋事情', N'杜老二的操蛋事情', 1, 1, 10, CAST(0x0000A6B30130DEE0 AS DateTime), 120, CAST(0x0000A6B3012B87B0 AS DateTime), CAST(0x0000A6B3012B87B0 AS DateTime))
INSERT [dbo].[UserPlan] ([Id], [UserId], [Importance], [Tag], [Detail], [IsRemind], [PerRemind], [perRemindTime], [HappenTime], [UseTime], [CreateTime], [UpdateTime]) VALUES (97, 12, 1, N'车展项目继续改bug', N'车展项目继续改bug', 1, 1, 10, CAST(0x0000A6B400EEF3E0 AS DateTime), 180, CAST(0x0000A6B4010EC1E3 AS DateTime), CAST(0x0000A6B4011110AD AS DateTime))
INSERT [dbo].[UserPlan] ([Id], [UserId], [Importance], [Tag], [Detail], [IsRemind], [PerRemind], [perRemindTime], [HappenTime], [UseTime], [CreateTime], [UpdateTime]) VALUES (44, 12, 0, N'test', N'阿斯顿发撒旦发生的', 1, 1, 10, CAST(0x0000A69E01487DC0 AS DateTime), 1, CAST(0x0000A69E01485282 AS DateTime), CAST(0x0000A69E01489915 AS DateTime))
INSERT [dbo].[UserPlan] ([Id], [UserId], [Importance], [Tag], [Detail], [IsRemind], [PerRemind], [perRemindTime], [HappenTime], [UseTime], [CreateTime], [UpdateTime]) VALUES (67, 12, 1, N'车展项目', N'车展项目源码', 1, 1, 10, CAST(0x0000A6A9009F4D40 AS DateTime), 120, CAST(0x0000A6A9009E2848 AS DateTime), CAST(0x0000A6A9009E2848 AS DateTime))
INSERT [dbo].[UserPlan] ([Id], [UserId], [Importance], [Tag], [Detail], [IsRemind], [PerRemind], [perRemindTime], [HappenTime], [UseTime], [CreateTime], [UpdateTime]) VALUES (72, 12, 1, N'车展项目', N'争取页面能渲染成功。', 1, 1, 10, CAST(0x0000A6AA009C8E20 AS DateTime), 60, CAST(0x0000A6AA009437DE AS DateTime), CAST(0x0000A6AA009437DE AS DateTime))
INSERT [dbo].[UserPlan] ([Id], [UserId], [Importance], [Tag], [Detail], [IsRemind], [PerRemind], [perRemindTime], [HappenTime], [UseTime], [CreateTime], [UpdateTime]) VALUES (73, 12, 1, N'车展项目', N'产看配置文件的具体作用', 1, 1, 10, CAST(0x0000A6AA00B28720 AS DateTime), 60, CAST(0x0000A6AA00947406 AS DateTime), CAST(0x0000A6AA00947406 AS DateTime))
INSERT [dbo].[UserPlan] ([Id], [UserId], [Importance], [Tag], [Detail], [IsRemind], [PerRemind], [perRemindTime], [HappenTime], [UseTime], [CreateTime], [UpdateTime]) VALUES (83, 12, 1, N'杜二爷的操蛋程序', N'WinForm签入浏览器尝试', 1, 1, 10, CAST(0x0000A6B001206420 AS DateTime), 60, CAST(0x0000A6B001269E55 AS DateTime), CAST(0x0000A6B001269E55 AS DateTime))
INSERT [dbo].[UserPlan] ([Id], [UserId], [Importance], [Tag], [Detail], [IsRemind], [PerRemind], [perRemindTime], [HappenTime], [UseTime], [CreateTime], [UpdateTime]) VALUES (90, 12, 1, N'车展项目', N'继续嵌入模板，上午要大致嵌套完成。', 1, 1, 10, CAST(0x0000A6B3009C8E20 AS DateTime), 120, CAST(0x0000A6B30098BF08 AS DateTime), CAST(0x0000A6B30098BF08 AS DateTime))
INSERT [dbo].[UserPlan] ([Id], [UserId], [Importance], [Tag], [Detail], [IsRemind], [PerRemind], [perRemindTime], [HappenTime], [UseTime], [CreateTime], [UpdateTime]) VALUES (91, 12, 1, N'车展项目完善', N'在上午的基础上解决剩余的小问题。', 1, 1, 10, CAST(0x0000A6B300EEF3E0 AS DateTime), 120, CAST(0x0000A6B300991062 AS DateTime), CAST(0x0000A6B300991062 AS DateTime))
INSERT [dbo].[UserPlan] ([Id], [UserId], [Importance], [Tag], [Detail], [IsRemind], [PerRemind], [perRemindTime], [HappenTime], [UseTime], [CreateTime], [UpdateTime]) VALUES (92, 12, 2, N'WebBroswer', N'WebBroswer可行性研究。加入插件等问题。', 1, 1, 10, CAST(0x0000A6B3010FE960 AS DateTime), 30, CAST(0x0000A6B3009975EF AS DateTime), CAST(0x0000A6B3009975EF AS DateTime))
INSERT [dbo].[UserPlan] ([Id], [UserId], [Importance], [Tag], [Detail], [IsRemind], [PerRemind], [perRemindTime], [HappenTime], [UseTime], [CreateTime], [UpdateTime]) VALUES (93, 12, 1, N'车展项目前端Js', N'继续完善车展项目前端Js', 1, 1, 10, CAST(0x0000A6B3011826C0 AS DateTime), 60, CAST(0x0000A6B30099B0E5 AS DateTime), CAST(0x0000A6B30099B0E5 AS DateTime))
SET IDENTITY_INSERT [dbo].[UserPlan] OFF
/****** Object:  Table [dbo].[Roles]    Script Date: 11/29/2016 19:18:06 ******/
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
SET IDENTITY_INSERT [dbo].[Roles] ON
INSERT [dbo].[Roles] ([RoleID], [Name], [Description]) VALUES (1, N'普通用户', N'普通用户')
INSERT [dbo].[Roles] ([RoleID], [Name], [Description]) VALUES (2, N'高级用户', N'高级用户')
INSERT [dbo].[Roles] ([RoleID], [Name], [Description]) VALUES (3, N'管理员', N'管理员')
SET IDENTITY_INSERT [dbo].[Roles] OFF
/****** Object:  Table [dbo].[PlanResult]    Script Date: 11/29/2016 19:18:06 ******/
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
SET IDENTITY_INSERT [dbo].[PlanResult] ON
INSERT [dbo].[PlanResult] ([Id], [PlanId], [Result], [Summary]) VALUES (1, 4, 1, N'效果不好，没心思看！')
INSERT [dbo].[PlanResult] ([Id], [PlanId], [Result], [Summary]) VALUES (2, 5, 1, N'新来一个需求然后就耽误了半个小时。
Docker知识才看了不到一半，差不多1/3。')
INSERT [dbo].[PlanResult] ([Id], [PlanId], [Result], [Summary]) VALUES (3, 7, 1, N'就看了一个函数，还没看完。')
INSERT [dbo].[PlanResult] ([Id], [PlanId], [Result], [Summary]) VALUES (4, 8, 1, N'直接没看，在看.Net的Socket。（发现自己现在做事都是看心情来干，以后不能这样）')
INSERT [dbo].[PlanResult] ([Id], [PlanId], [Result], [Summary]) VALUES (5, 9, 1, N'我也不知道自己到底干啥了。')
INSERT [dbo].[PlanResult] ([Id], [PlanId], [Result], [Summary]) VALUES (6, 10, 1, N'现在才开始看前端')
INSERT [dbo].[PlanResult] ([Id], [PlanId], [Result], [Summary]) VALUES (7, 13, 1, N'仅仅完成一点，感觉还是有效率的。')
INSERT [dbo].[PlanResult] ([Id], [PlanId], [Result], [Summary]) VALUES (8, 14, 1, N'只是将领域和服务层写完，其他都还没写。')
INSERT [dbo].[PlanResult] ([Id], [PlanId], [Result], [Summary]) VALUES (9, 15, 1, N'效率太低，延长时间。。。')
INSERT [dbo].[PlanResult] ([Id], [PlanId], [Result], [Summary]) VALUES (10, 16, 1, N'已经不需要熟悉了。擦。。。')
INSERT [dbo].[PlanResult] ([Id], [PlanId], [Result], [Summary]) VALUES (11, 18, 2, N'没思路，干点别的。')
INSERT [dbo].[PlanResult] ([Id], [PlanId], [Result], [Summary]) VALUES (12, 25, 2, N'跟班就不可能')
INSERT [dbo].[PlanResult] ([Id], [PlanId], [Result], [Summary]) VALUES (13, 24, 2, N'跟班就不可能')
INSERT [dbo].[PlanResult] ([Id], [PlanId], [Result], [Summary]) VALUES (14, 31, 2, N'自己都不知道自己干啥了')
INSERT [dbo].[PlanResult] ([Id], [PlanId], [Result], [Summary]) VALUES (15, 32, 1, N'还行')
INSERT [dbo].[PlanResult] ([Id], [PlanId], [Result], [Summary]) VALUES (16, 33, 1, N'净改bug了')
INSERT [dbo].[PlanResult] ([Id], [PlanId], [Result], [Summary]) VALUES (17, 47, 1, N'去bug了')
INSERT [dbo].[PlanResult] ([Id], [PlanId], [Result], [Summary]) VALUES (18, 67, 2, N'经他妈的瞎搞了,配个shadowsocks还没配置好.')
INSERT [dbo].[PlanResult] ([Id], [PlanId], [Result], [Summary]) VALUES (19, 72, 1, N'刚刚完成！')
INSERT [dbo].[PlanResult] ([Id], [PlanId], [Result], [Summary]) VALUES (20, 73, 1, N'配置文件大致已经看过，接下来看看C#代码，理解一下程序的整体逻辑。')
INSERT [dbo].[PlanResult] ([Id], [PlanId], [Result], [Summary]) VALUES (21, 74, 1, NULL)
INSERT [dbo].[PlanResult] ([Id], [PlanId], [Result], [Summary]) VALUES (22, 75, 2, N'乱了')
INSERT [dbo].[PlanResult] ([Id], [PlanId], [Result], [Summary]) VALUES (23, 76, 2, N'自己都不知道自己干啥了。')
INSERT [dbo].[PlanResult] ([Id], [PlanId], [Result], [Summary]) VALUES (24, 77, 1, N'差不多，这个小问题已经解决，但是感觉必须要全部了解一下程序的逻辑。')
INSERT [dbo].[PlanResult] ([Id], [PlanId], [Result], [Summary]) VALUES (25, 84, 1, N'低效')
INSERT [dbo].[PlanResult] ([Id], [PlanId], [Result], [Summary]) VALUES (26, 85, 1, N'完成的还可以毕竟是两个周的时间干的事。')
INSERT [dbo].[PlanResult] ([Id], [PlanId], [Result], [Summary]) VALUES (27, 86, 1, N'还行，正在逐渐熟悉')
INSERT [dbo].[PlanResult] ([Id], [PlanId], [Result], [Summary]) VALUES (28, 87, 1, N'低效')
INSERT [dbo].[PlanResult] ([Id], [PlanId], [Result], [Summary]) VALUES (29, 88, 1, N'效率太低，中间干别的事情了，可能是这段时间太长了。')
INSERT [dbo].[PlanResult] ([Id], [PlanId], [Result], [Summary]) VALUES (30, 90, 1, N'虽然效率低，但是任务少。。。')
SET IDENTITY_INSERT [dbo].[PlanResult] OFF
/****** Object:  Table [dbo].[Note]    Script Date: 11/29/2016 19:18:06 ******/
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
SET IDENTITY_INSERT [dbo].[Note] ON
INSERT [dbo].[Note] ([Id], [UserId], [Title], [Note], [CreateTime], [UpdateTime]) VALUES (2, 12, N'大事发生大幅阿房宫东风', N'是大法师大法大发撒旦发撒旦发拂过低声飞过', CAST(0x0000A69101193362 AS DateTime), CAST(0x0000A691011BB6A5 AS DateTime))
INSERT [dbo].[Note] ([Id], [UserId], [Title], [Note], [CreateTime], [UpdateTime]) VALUES (3, 12, N'阿斯发倒萨发生大发干活', N'发撒旦发撒旦发上的阿斯顿发撒旦发撒旦打算阿斯大法发撒旦发', CAST(0x0000A691011B4F30 AS DateTime), CAST(0x0000A691011C9DAB AS DateTime))
INSERT [dbo].[Note] ([Id], [UserId], [Title], [Note], [CreateTime], [UpdateTime]) VALUES (4, 12, N'LeetCode每日一题', N'LeetCode每日一题：
题目：
中文题目：https://leetcode.com/problems/two-sum/
使用C#/Python/Javascript回答
答案参考：http://blog.csdn.net/nomasp
http://blog.csdn.net/lanxu_yy/article/details/17848219
http://www.cnblogs.com/moondark/p/3402936.html
https://www.zhihu.com/question/32322023
https://www.zhihu.com/question/26580300
http://www.udpwork.com/item/13778.html
https://github.com/pezy/LeetCode
http://c4fun.cn/blog/2014/03/18/leetcode-solution-01/?utm_source=tuicool&utm_medium=referral', CAST(0x0000A69B00AE7040 AS DateTime), CAST(0x0000A69B00B0CB2C AS DateTime))
INSERT [dbo].[Note] ([Id], [UserId], [Title], [Note], [CreateTime], [UpdateTime]) VALUES (5, 12, N'2016-10-24', N'免费试用的可以试试，微软云存储，买衣服，LeetCode和List功能(应当改变布局了，逐步增加新的功能，表单校验也要加上)，爬取网页小游戏源码。', CAST(0x0000A6A9009ED5E8 AS DateTime), CAST(0x0000A6BE00C175A1 AS DateTime))
SET IDENTITY_INSERT [dbo].[Note] OFF
/****** Object:  Table [dbo].[Leet_StatStatusPair]    Script Date: 11/29/2016 19:18:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Leet_StatStatusPair](
	[status] [nvarchar](50) NULL,
	[is_favor] [bit] NULL,
	[paid_only] [bit] NULL,
	[frequency] [int] NULL,
	[progress] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Leet_Stat]    Script Date: 11/29/2016 19:18:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Leet_Stat](
	[total_acs] [int] NULL,
	[question__title] [nvarchar](50) NULL,
	[question__article__slug] [nvarchar](50) NULL,
	[total_submitted] [int] NULL,
	[question__title_slug] [nvarchar](50) NULL,
	[question__article__live] [bit] NULL,
	[question__hide] [bit] NULL,
	[question_id] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Leet_Question]    Script Date: 11/29/2016 19:18:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Leet_Question](
	[TotalAcs] [int] NULL,
	[QuestionTitle] [nvarchar](300) NULL,
	[QuestionArticleSlug] [nvarchar](300) NULL,
	[TotalSubmitted] [int] NULL,
	[QuestionTitleSlug] [nvarchar](300) NULL,
	[QuestionArticleLive] [bit] NULL,
	[QuestionHide] [bit] NULL,
	[QuestionId] [int] NULL,
	[Level] [int] NULL,
	[PaidOnly] [bit] NULL,
	[Frequency] [int] NULL,
	[Progress] [int] NULL
) ON [PRIMARY]
GO
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (439, N'K-th Smallest in Lexicographical Order', NULL, 2938, N'k-th-smallest-in-lexicographical-order', NULL, 0, 440, 3, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (810, N'Ternary Expression Parser', NULL, 1752, N'ternary-expression-parser', NULL, 0, 439, 2, 1, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (1975, N'Find All Anagrams in a String', NULL, 5728, N'find-all-anagrams-in-a-string', NULL, 0, 438, 1, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (2105, N'Path Sum III', NULL, 5782, N'path-sum-iii', NULL, 0, 437, 1, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (806, N'Word Squares', NULL, 2198, N'word-squares', NULL, 0, 425, 3, 1, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (1927, N'Longest Repeating Character Replacement', NULL, 5380, N'longest-repeating-character-replacement', NULL, 0, 424, 2, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (2151, N'Reconstruct Original Digits from English', NULL, 5363, N'reconstruct-original-digits-from-english', NULL, 0, 423, 2, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (2079, N'Valid Word Square', NULL, 5591, N'valid-word-square', NULL, 0, 422, 1, 1, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (1994, N'Maximum XOR of Two Numbers in an Array', NULL, 6265, N'maximum-xor-of-two-numbers-in-an-array', NULL, 0, 421, 2, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (327, N'Strong Password Checker', NULL, 1681, N'strong-password-checker', NULL, 0, 420, 3, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (2750, N'Battleships in a Board', NULL, 4550, N'battleships-in-a-board', NULL, 0, 419, 2, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (1500, N'Sentence Screen Fitting', NULL, 6010, N'sentence-screen-fitting', NULL, 0, 418, 2, 1, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (2998, N'Pacific Atlantic Water Flow', NULL, 9796, N'pacific-atlantic-water-flow', NULL, 0, 417, 2, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (5477, N'Partition Equal Subset Sum', NULL, 14812, N'partition-equal-subset-sum', NULL, 0, 416, 2, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (7704, N'Add Strings', NULL, 18447, N'add-strings', NULL, 0, 415, 1, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (3833, N'Third Maximum Number', NULL, 14594, N'third-maximum-number', NULL, 0, 414, 1, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (3006, N'Arithmetic Slices', NULL, 5623, N'arithmetic-slices', NULL, 0, 413, 2, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (7627, N'Fizz Buzz', NULL, 13203, N'fizz-buzz', NULL, 0, 412, 1, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (984, N'Minimum Unique Word Abbreviation', NULL, 3385, N'minimum-unique-word-abbreviation', NULL, 0, 411, 3, 1, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (2648, N'Split Array Largest Sum', NULL, 9449, N'split-array-largest-sum', NULL, 0, 410, 3, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (10508, N'Longest Palindrome', NULL, 23753, N'longest-palindrome', NULL, 0, 409, 1, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (2743, N'Valid Word Abbreviation', NULL, 10461, N'valid-word-abbreviation', NULL, 0, 408, 1, 1, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (2427, N'Trapping Rain Water II', NULL, 7194, N'trapping-rain-water-ii', NULL, 0, 407, 3, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (6634, N'Queue Reconstruction by Height', NULL, 12345, N'queue-reconstruction-by-height', NULL, 0, 406, 2, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (6900, N'Convert a Number to Hexadecimal', NULL, 16771, N'convert-a-number-to-hexadecimal', NULL, 0, 405, 1, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (15290, N'Sum of Left Leaves', NULL, 33496, N'sum-of-left-leaves', NULL, 0, 404, 1, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (5511, N'Frog Jump', NULL, 18322, N'frog-jump', NULL, 0, 403, 3, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (6476, N'Remove K Digits', NULL, 25333, N'remove-k-digits', NULL, 0, 402, 2, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (9522, N'Binary Watch', NULL, 22276, N'binary-watch', NULL, 0, 401, 1, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (7543, N'Nth Digit', NULL, 25077, N'nth-digit', NULL, 0, 400, 1, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (4823, N'Evaluate Division', NULL, 12891, N'evaluate-division', NULL, 0, 399, 2, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (6303, N'Random Pick Index', NULL, 17415, N'random-pick-index', NULL, 0, 398, 2, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (8461, N'Integer Replacement', NULL, 29996, N'integer-replacement', NULL, 0, 397, 2, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (9019, N'Rotate Function', NULL, 30932, N'rotate-function', NULL, 0, 396, 1, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (5452, N'Longest Substring with At Least K Repeating Characters', NULL, 15967, N'longest-substring-with-at-least-k-repeating-characters', NULL, 0, 395, 2, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (9270, N'Decode String', NULL, 23459, N'decode-string', NULL, 0, 394, 2, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (4868, N'UTF-8 Validation', NULL, 13974, N'utf-8-validation', NULL, 0, 393, 2, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (13442, N'Is Subsequence', NULL, 30718, N'is-subsequence', NULL, 0, 392, 2, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (3913, N'Perfect Rectangle', NULL, 19048, N'perfect-rectangle', NULL, 0, 391, 3, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (3728, N'Elimination Game', NULL, 11031, N'elimination-game', NULL, 0, 390, 2, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (30535, N'Find the Difference', NULL, 61261, N'find-the-difference', NULL, 0, 389, 1, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (10026, N'Longest Absolute File Path', NULL, 30833, N'longest-absolute-file-path', NULL, 0, 388, 2, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (23902, N'First Unique Character in a String', NULL, 54029, N'first-unique-character-in-a-string', NULL, 0, 387, 1, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (8331, N'Lexicographical Numbers', NULL, 22534, N'lexicographical-numbers', NULL, 0, 386, 2, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (6943, N'Mini Parser', NULL, 23862, N'mini-parser', NULL, 0, 385, 2, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (11895, N'Shuffle an Array', NULL, 26788, N'shuffle-an-array', NULL, 0, 384, 2, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (25658, N'Ransom Note', NULL, 56622, N'ransom-note', NULL, 0, 383, 1, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (13166, N'Linked List Random Node', NULL, 28883, N'linked-list-random-node', NULL, 0, 382, 2, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (5702, N'Insert Delete GetRandom O(1) - Duplicates allowed', NULL, 21439, N'insert-delete-getrandom-o1-duplicates-allowed', NULL, 0, 381, 3, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (9873, N'Insert Delete GetRandom O(1)', NULL, 27258, N'insert-delete-getrandom-o1', NULL, 0, 380, 3, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (4006, N'Design Phone Directory', NULL, 14603, N'design-phone-directory', NULL, 0, 379, 2, 1, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (16928, N'Kth Smallest Element in a Sorted Matrix', NULL, 39940, N'kth-smallest-element-in-a-sorted-matrix', NULL, 0, 378, 2, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (16439, N'Combination Sum IV', NULL, 40372, N'combination-sum-iv', NULL, 0, 377, 2, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (12911, N'Wiggle Subsequence', N'wiggle-subsequence', 37620, N'wiggle-subsequence', 1, 0, 376, 2, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (10482, N'Guess Number Higher or Lower II', NULL, 31382, N'guess-number-higher-or-lower-ii', NULL, 0, 375, 2, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (26706, N'Guess Number Higher or Lower', N'guess-number-higher-or-lower', 81758, N'guess-number-higher-or-lower', 1, 0, 374, 1, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (14611, N'Find K Pairs with Smallest Sums', NULL, 50841, N'find-k-pairs-with-smallest-sums', NULL, 0, 373, 2, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (9352, N'Super Pow', NULL, 28956, N'super-pow', NULL, 0, 372, 2, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (42034, N'Sum of Two Integers', NULL, 81379, N'sum-of-two-integers', NULL, 0, 371, 1, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (5600, N'Range Addition', N'range-addition', 10794, N'range-addition', 1, 0, 370, 2, 1, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (6953, N'Plus One Linked List', NULL, 13552, N'plus-one-linked-list', NULL, 0, 369, 2, 1, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (13276, N'Largest Divisible Subset', NULL, 41122, N'largest-divisible-subset', NULL, 0, 368, 2, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (20901, N'Valid Perfect Square', NULL, 56785, N'valid-perfect-square', NULL, 0, 367, 2, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (7276, N'Find Leaves of Binary Tree', NULL, 13068, N'find-leaves-of-binary-tree', NULL, 0, 366, 2, 1, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (8481, N'Water and Jug Problem', NULL, 33375, N'water-and-jug-problem', NULL, 0, 365, 2, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (5839, N'Nested List Weight Sum II', NULL, 11919, N'nested-list-weight-sum-ii', NULL, 0, 364, 2, 1, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (7035, N'Max Sum of Rectangle No Larger Than K', NULL, 22733, N'max-sum-of-sub-matrix-no-larger-than-k', NULL, 0, 363, 3, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (6467, N'Design Hit Counter', NULL, 12621, N'design-hit-counter', NULL, 0, 362, 2, 1, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (5954, N'Bomb Enemy', NULL, 15789, N'bomb-enemy', NULL, 0, 361, 2, 1, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (5133, N'Sort Transformed Array', NULL, 12273, N'sort-transformed-array', NULL, 0, 360, 2, 1, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (7260, N'Logger Rate Limiter', NULL, 12748, N'logger-rate-limiter', NULL, 0, 359, 1, 1, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (4494, N'Rearrange String k Distance Apart', NULL, 14559, N'rearrange-string-k-distance-apart', NULL, 0, 358, 3, 1, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (19711, N'Count Numbers with Unique Digits', NULL, 44408, N'count-numbers-with-unique-digits', NULL, 0, 357, 2, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (5239, N'Line Reflection', NULL, 18141, N'line-reflection', NULL, 0, 356, 2, 1, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (9499, N'Design Twitter', NULL, 39965, N'design-twitter', NULL, 0, 355, 2, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (11189, N'Russian Doll Envelopes', NULL, 36363, N'russian-doll-envelopes', NULL, 0, 354, 3, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (4252, N'Design Snake Game', NULL, 17265, N'design-snake-game', NULL, 0, 353, 2, 1, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (7527, N'Data Stream as Disjoint Intervals', NULL, 19634, N'data-stream-as-disjoint-intervals', NULL, 0, 352, 3, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (6056, N'Android Unlock Patterns', N'android-unlock-patterns', 14866, N'android-unlock-patterns', 1, 0, 351, 2, 1, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (38909, N'Intersection of Two Arrays II', NULL, 90881, N'intersection-of-two-arrays-ii', NULL, 0, 350, 1, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (55066, N'Intersection of Two Arrays', NULL, 122683, N'intersection-of-two-arrays', NULL, 0, 349, 1, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (6209, N'Design Tic-Tac-Toe', NULL, 13863, N'design-tic-tac-toe', NULL, 0, 348, 2, 1, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (35943, N'Top K Frequent Elements', NULL, 80420, N'top-k-frequent-elements', NULL, 0, 347, 2, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (10609, N'Moving Average from Data Stream', NULL, 18904, N'moving-average-from-data-stream', NULL, 0, 346, 1, 1, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (50472, N'Reverse Vowels of a String', NULL, 137565, N'reverse-vowels-of-a-string', NULL, 0, 345, 1, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (101385, N'Reverse String', NULL, 174574, N'reverse-string', NULL, 0, 344, 1, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (29146, N'Integer Break', NULL, 65917, N'integer-break', NULL, 0, 343, 2, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (43277, N'Power of Four', NULL, 117482, N'power-of-four', NULL, 0, 342, 1, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (19411, N'Flatten Nested List Iterator', NULL, 53232, N'flatten-nested-list-iterator', NULL, 0, 341, 2, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (9571, N'Longest Substring with At Most K Distinct Characters', NULL, 24349, N'longest-substring-with-at-most-k-distinct-characters', NULL, 0, 340, 3, 1, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (10647, N'Nested List Weight Sum', N'nested-list-weight-sum', 18137, N'nested-list-weight-sum', 1, 0, 339, 1, 1, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (51437, N'Counting Bits', NULL, 87376, N'counting-bits', NULL, 0, 338, 2, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (27905, N'House Robber III', NULL, 68793, N'house-robber-iii', NULL, 0, 337, 2, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (14671, N'Palindrome Pairs', NULL, 62992, N'palindrome-pairs', NULL, 0, 336, 3, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (10087, N'Self Crossing', NULL, 43773, N'self-crossing', NULL, 0, 335, 3, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (26498, N'Increasing Triplet Subsequence', NULL, 71628, N'increasing-triplet-subsequence', NULL, 0, 334, 2, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (8394, N'Largest BST Subtree', NULL, 28849, N'largest-bst-subtree', NULL, 0, 333, 2, 1, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (21567, N'Reconstruct Itinerary', NULL, 79500, N'reconstruct-itinerary', NULL, 0, 332, 2, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (24096, N'Verify Preorder Serialization of a Binary Tree', NULL, 70338, N'verify-preorder-serialization-of-a-binary-tree', NULL, 0, 331, 2, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (16143, N'Patching Array', NULL, 52253, N'patching-array', NULL, 0, 330, 3, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (23874, N'Longest Increasing Path in a Matrix', NULL, 69591, N'longest-increasing-path-in-a-matrix', NULL, 0, 329, 3, 0, 0, 0)
GO
print 'Processed 100 total records'
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (48286, N'Odd Even Linked List', N'odd-even-linked-list', 117466, N'odd-even-linked-list', 1, 0, 328, 2, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (12015, N'Count of Range Sum', NULL, 43021, N'count-of-range-sum', NULL, 0, 327, 3, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (70499, N'Power of Three', N'power-of-three', 181747, N'power-of-three', 1, 0, 326, 1, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (12694, N'Maximum Size Subarray Sum Equals k', NULL, 30614, N'maximum-size-subarray-sum-equals-k', NULL, 0, 325, 2, 1, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (18932, N'Wiggle Sort II', NULL, 77249, N'wiggle-sort-ii', NULL, 0, 324, 2, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (15301, N'Number of Connected Components in an Undirected Graph', NULL, 33675, N'number-of-connected-components-in-an-undirected-graph', NULL, 0, 323, 2, 1, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (39912, N'Coin Change', N'coin-change', 154370, N'coin-change', 1, 0, 322, 2, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (12177, N'Create Maximum Number', NULL, 52505, N'create-maximum-number', NULL, 0, 321, 3, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (12871, N'Generalized Abbreviation', NULL, 30543, N'generalized-abbreviation', NULL, 0, 320, 2, 1, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (30271, N'Bulb Switcher', NULL, 72796, N'bulb-switcher', NULL, 0, 319, 2, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (36290, N'Maximum Product of Word Lengths', NULL, 87441, N'maximum-product-of-word-lengths', NULL, 0, 318, 2, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (8760, N'Shortest Distance from All Buildings', NULL, 27101, N'shortest-distance-from-all-buildings', NULL, 0, 317, 3, 1, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (21286, N'Remove Duplicate Letters', NULL, 76622, N'remove-duplicate-letters', NULL, 0, 316, 3, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (20743, N'Count of Smaller Numbers After Self', NULL, 63146, N'count-of-smaller-numbers-after-self', NULL, 0, 315, 3, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (12702, N'Binary Tree Vertical Order Traversal', NULL, 37527, N'binary-tree-vertical-order-traversal', NULL, 0, 314, 2, 1, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (25611, N'Super Ugly Number', NULL, 70276, N'super-ugly-number', NULL, 0, 313, 2, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (17306, N'Burst Balloons', NULL, 42437, N'burst-balloons', NULL, 0, 312, 3, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (13076, N'Sparse Matrix Multiplication', NULL, 26372, N'sparse-matrix-multiplication', NULL, 0, 311, 2, 1, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (22090, N'Minimum Height Trees', NULL, 78875, N'minimum-height-trees', NULL, 0, 310, 2, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (28072, N'Best Time to Buy and Sell Stock with Cooldown', NULL, 71816, N'best-time-to-buy-and-sell-stock-with-cooldown', NULL, 0, 309, 2, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (7736, N'Range Sum Query 2D - Mutable', NULL, 38372, N'range-sum-query-2d-mutable', NULL, 0, 308, 3, 1, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (21800, N'Range Sum Query - Mutable', N'range-sum-query-mutable', 118007, N'range-sum-query-mutable', 1, 0, 307, 2, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (17709, N'Additive Number', NULL, 65834, N'additive-number', NULL, 0, 306, 2, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (12500, N'Number of Islands II', NULL, 33794, N'number-of-islands-ii', NULL, 0, 305, 3, 1, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (22458, N'Range Sum Query 2D - Immutable', N'range-sum-query-2d-immutable', 99087, N'range-sum-query-2d-immutable', 1, 0, 304, 2, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (48326, N'Range Sum Query - Immutable', N'range-sum-query-immutable', 185884, N'range-sum-query-immutable', 1, 0, 303, 1, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (8809, N'Smallest Rectangle Enclosing Black Pixels', NULL, 20911, N'smallest-rectangle-enclosing-black-pixels', NULL, 0, 302, 3, 1, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (23101, N'Remove Invalid Parentheses', NULL, 67854, N'remove-invalid-parentheses', NULL, 0, 301, 3, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (51215, N'Longest Increasing Subsequence', NULL, 139826, N'longest-increasing-subsequence', NULL, 0, 300, 2, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (45715, N'Bulls and Cows', NULL, 140841, N'bulls-and-cows', NULL, 0, 299, 1, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (16895, N'Binary Tree Longest Consecutive Sequence', N'binary-tree-longest-consecutive-sequence', 43420, N'binary-tree-longest-consecutive-sequence', 1, 0, 298, 2, 1, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (34982, N'Serialize and Deserialize Binary Tree', NULL, 114912, N'serialize-and-deserialize-binary-tree', NULL, 0, 297, 3, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (8189, N'Best Meeting Point', N'best-meeting-point', 16560, N'best-meeting-point', 1, 0, 296, 3, 1, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (27170, N'Find Median from Data Stream', NULL, 118151, N'find-median-from-data-stream', NULL, 0, 295, 3, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (15791, N'Flip Game II', NULL, 35969, N'flip-game-ii', NULL, 0, 294, 2, 1, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (15242, N'Flip Game', NULL, 28924, N'flip-game', NULL, 0, 293, 1, 1, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (105465, N'Nim Game', N'nim-game', 193988, N'nim-game', 1, 0, 292, 1, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (9472, N'Word Pattern II', NULL, 25692, N'word-pattern-ii', NULL, 0, 291, 3, 1, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (56167, N'Word Pattern', NULL, 178903, N'word-pattern', NULL, 0, 290, 1, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (31414, N'Game of Life', NULL, 87460, N'game-of-life', NULL, 0, 289, 2, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (17795, N'Unique Word Abbreviation', N'unique-word-abbreviation', 115713, N'unique-word-abbreviation', 1, 0, 288, 1, 1, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (44079, N'Find the Duplicate Number', NULL, 107278, N'find-the-duplicate-number', NULL, 0, 287, 3, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (17974, N'Walls and Gates', N'walls-and-gates', 44038, N'walls-and-gates', 1, 0, 286, 2, 1, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (16853, N'Inorder Successor in BST', NULL, 46416, N'inorder-successor-in-bst', NULL, 0, 285, 2, 1, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (30936, N'Peeking Iterator', NULL, 89018, N'peeking-iterator', NULL, 0, 284, 2, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (128467, N'Move Zeroes', N'move-zeroes', 274667, N'move-zeroes', 1, 0, 283, 1, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (18999, N'Expression Add Operators', NULL, 69202, N'expression-add-operators', NULL, 0, 282, 3, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (16090, N'Zigzag Iterator', NULL, 34630, N'zigzag-iterator', NULL, 0, 281, 2, 1, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (17834, N'Wiggle Sort', N'wiggle-sort', 33338, N'wiggle-sort', 1, 0, 280, 2, 1, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (54596, N'Perfect Squares', NULL, 158683, N'perfect-squares', NULL, 0, 279, 2, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (68311, N'First Bad Version', N'first-bad-version', 286215, N'first-bad-version', 1, 0, 278, 1, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (14794, N'Find the Celebrity', NULL, 41654, N'find-the-celebrity', NULL, 0, 277, 2, 1, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (14979, N'Paint Fence', NULL, 45199, N'paint-fence', NULL, 0, 276, 1, 1, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (34841, N'H-Index II', NULL, 104676, N'h-index-ii', NULL, 0, 275, 2, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (52259, N'H-Index', N'h-index', 166239, N'h-index', 1, 0, 274, 2, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (23575, N'Integer to English Words', NULL, 114984, N'integer-to-english-words', NULL, 0, 273, 3, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (10880, N'Closest Binary Search Tree Value II', NULL, 29969, N'closest-binary-search-tree-value-ii', NULL, 0, 272, 3, 1, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (12764, N'Encode and Decode Strings', NULL, 47505, N'encode-and-decode-strings', NULL, 0, 271, 2, 1, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (21353, N'Closest Binary Search Tree Value', NULL, 57900, N'closest-binary-search-tree-value', NULL, 0, 270, 1, 1, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (15061, N'Alien Dictionary', NULL, 63660, N'alien-dictionary', NULL, 0, 269, 3, 1, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (76417, N'Missing Number', NULL, 178918, N'missing-number', NULL, 0, 268, 2, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (9095, N'Palindrome Permutation II', NULL, 30009, N'palindrome-permutation-ii', NULL, 0, 267, 2, 1, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (20144, N'Palindrome Permutation', NULL, 37366, N'palindrome-permutation', NULL, 0, 266, 1, 1, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (12744, N'Paint House II', NULL, 34797, N'paint-house-ii', NULL, 0, 265, 3, 1, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (44458, N'Ugly Number II', NULL, 143813, N'ugly-number-ii', NULL, 0, 264, 2, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (79405, N'Ugly Number', NULL, 208538, N'ugly-number', NULL, 0, 263, 1, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (21630, N'Graph Valid Tree', NULL, 61197, N'graph-valid-tree', NULL, 0, 261, 2, 1, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (51260, N'Single Number III', NULL, 106656, N'single-number-iii', NULL, 0, 260, 2, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (15780, N'3Sum Smaller', N'3sum-smaller', 39592, N'3sum-smaller', 1, 0, 259, 2, 1, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (132978, N'Add Digits', NULL, 266678, N'add-digits', NULL, 0, 258, 1, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (73690, N'Binary Tree Paths', NULL, 222336, N'binary-tree-paths', NULL, 0, 257, 1, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (13441, N'Paint House', NULL, 29788, N'paint-house', NULL, 0, 256, 2, 1, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (13078, N'Verify Preorder Sequence in Binary Search Tree', NULL, 34346, N'verify-preorder-sequence-in-binary-search-tree', NULL, 0, 255, 2, 1, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (15154, N'Factor Combinations', NULL, 39000, N'factor-combinations', NULL, 0, 254, 2, 1, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (20484, N'Meeting Rooms II', NULL, 54611, N'meeting-rooms-ii', NULL, 0, 253, 2, 1, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (18172, N'Meeting Rooms', N'meeting-rooms', 41006, N'meeting-rooms', 1, 0, 252, 1, 1, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (15816, N'Flatten 2D Vector', NULL, 42306, N'flatten-2d-vector', NULL, 0, 251, 2, 1, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (10258, N'Count Univalue Subtrees', NULL, 25923, N'count-univalue-subtrees', NULL, 0, 250, 2, 1, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (15986, N'Group Shifted Strings', NULL, 43803, N'group-shifted-strings', NULL, 0, 249, 1, 1, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (6517, N'Strobogrammatic Number III', NULL, 21981, N'strobogrammatic-number-iii', NULL, 0, 248, 3, 1, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (13906, N'Strobogrammatic Number II', NULL, 37691, N'strobogrammatic-number-ii', NULL, 0, 247, 2, 1, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (16335, N'Strobogrammatic Number', NULL, 42911, N'strobogrammatic-number', NULL, 0, 246, 1, 1, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (12617, N'Shortest Word Distance III', NULL, 26052, N'shortest-word-distance-iii', NULL, 0, 245, 2, 1, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (13353, N'Shortest Word Distance II', NULL, 38263, N'shortest-word-distance-ii', NULL, 0, 244, 2, 1, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (18922, N'Shortest Word Distance', N'shortest-word-distance', 38147, N'shortest-word-distance', 1, 0, 243, 1, 1, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (117280, N'Valid Anagram', N'valid-anagram', 265771, N'valid-anagram', 1, 0, 242, 1, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (32623, N'Different Ways to Add Parentheses', NULL, 81812, N'different-ways-to-add-parentheses', NULL, 0, 241, 2, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (53926, N'Search a 2D Matrix II', NULL, 145464, N'search-a-2d-matrix-ii', NULL, 0, 240, 2, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (40262, N'Sliding Window Maximum', NULL, 132325, N'sliding-window-maximum', NULL, 0, 239, 3, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (67601, N'Product of Array Except Self', NULL, 147356, N'product-of-array-except-self', NULL, 0, 238, 2, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (114261, N'Delete Node in a Linked List', N'delete-node-linked-list', 254299, N'delete-node-in-a-linked-list', 1, 0, 237, 1, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (66302, N'Lowest Common Ancestor of a Binary Tree', NULL, 226797, N'lowest-common-ancestor-of-a-binary-tree', NULL, 0, 236, 2, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (100260, N'Lowest Common Ancestor of a Binary Search Tree', NULL, 265441, N'lowest-common-ancestor-of-a-binary-search-tree', NULL, 0, 235, 1, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (72060, N'Palindrome Linked List', NULL, 233715, N'palindrome-linked-list', NULL, 0, 234, 1, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (24031, N'Number of Digit One', NULL, 89899, N'number-of-digit-one', NULL, 0, 233, 3, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (61575, N'Implement Queue using Stacks', N'implement-queue-using-stacks', 177193, N'implement-queue-using-stacks', 1, 0, 232, 1, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (105054, N'Power of Two', NULL, 270909, N'power-of-two', NULL, 0, 231, 1, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (70682, N'Kth Smallest Element in a BST', NULL, 172463, N'kth-smallest-element-in-a-bst', NULL, 0, 230, 2, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (40559, N'Majority Element II', NULL, 148728, N'majority-element-ii', NULL, 0, 229, 2, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (61022, N'Summary Ranges', N'summary-ranges', 225460, N'summary-ranges', 1, 0, 228, 2, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (33347, N'Basic Calculator II', NULL, 121750, N'basic-calculator-ii', NULL, 0, 227, 2, 0, 0, 0)
GO
print 'Processed 200 total records'
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (129969, N'Invert Binary Tree', N'invert-binary-tree', 266145, N'invert-binary-tree', 1, 0, 226, 1, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (55121, N'Implement Stack using Queues', N'implement-stack-using-queues', 177974, N'implement-stack-using-queues', 1, 0, 225, 1, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (37664, N'Basic Calculator', NULL, 153069, N'basic-calculator', NULL, 0, 224, 3, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (50260, N'Rectangle Area', NULL, 159853, N'rectangle-area', NULL, 0, 223, 1, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (46764, N'Count Complete Tree Nodes', NULL, 175769, N'count-complete-tree-nodes', NULL, 0, 222, 2, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (43462, N'Maximal Square', N'maximal-square', 166077, N'maximal-square', 1, 0, 221, 2, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (40321, N'Contains Duplicate III', N'contains-duplicate-iii', 207643, N'contains-duplicate-iii', 1, 0, 220, 2, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (82130, N'Contains Duplicate II', N'contains-duplicate-ii', 264783, N'contains-duplicate-ii', 1, 0, 219, 1, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (27592, N'The Skyline Problem', NULL, 111697, N'the-skyline-problem', NULL, 0, 218, 3, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (123397, N'Contains Duplicate', N'contains-duplicate', 287537, N'contains-duplicate', 1, 0, 217, 1, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (48413, N'Combination Sum III', NULL, 119607, N'combination-sum-iii', NULL, 0, 216, 2, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (86182, N'Kth Largest Element in an Array', NULL, 237127, N'kth-largest-element-in-an-array', NULL, 0, 215, 2, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (28883, N'Shortest Palindrome', NULL, 130408, N'shortest-palindrome', NULL, 0, 214, 3, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (41755, N'House Robber II', NULL, 128080, N'house-robber-ii', NULL, 0, 213, 2, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (30872, N'Word Search II', NULL, 143499, N'word-search-ii', NULL, 0, 212, 3, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (36767, N'Add and Search Word - Data structure design', NULL, 182917, N'add-and-search-word-data-structure-design', NULL, 0, 211, 2, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (41175, N'Course Schedule II', NULL, 170230, N'course-schedule-ii', NULL, 0, 210, 2, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (56926, N'Minimum Size Subarray Sum', NULL, 202410, N'minimum-size-subarray-sum', NULL, 0, 209, 2, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (52537, N'Implement Trie (Prefix Tree)', N'implement-trie-prefix-tree', 205530, N'implement-trie-prefix-tree', 1, 0, 208, 2, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (57781, N'Course Schedule', NULL, 195473, N'course-schedule', NULL, 0, 207, 2, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (157545, N'Reverse Linked List', N'reverse-linked-list', 370633, N'reverse-linked-list', 1, 0, 206, 1, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (79482, N'Isomorphic Strings', NULL, 249920, N'isomorphic-strings', NULL, 0, 205, 1, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (86567, N'Count Primes', NULL, 336167, N'count-primes', NULL, 0, 204, 1, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (85790, N'Remove Linked List Elements', NULL, 281345, N'remove-linked-list-elements', NULL, 0, 203, 1, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (95033, N'Happy Number', NULL, 246329, N'happy-number', NULL, 0, 202, 1, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (45084, N'Bitwise AND of Numbers Range', NULL, 137828, N'bitwise-and-of-numbers-range', NULL, 0, 201, 2, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (69977, N'Number of Islands', NULL, 225554, N'number-of-islands', NULL, 0, 200, 2, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (58906, N'Binary Tree Right Side View', NULL, 156007, N'binary-tree-right-side-view', NULL, 0, 199, 2, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (99198, N'House Robber', N'house-robber', 270131, N'house-robber', 1, 0, 198, 1, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (118824, N'Number of 1 Bits', N'number-1-bits', 311541, N'number-of-1-bits', 1, 0, 191, 1, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (81500, N'Reverse Bits', NULL, 275940, N'reverse-bits', NULL, 0, 190, 1, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (96657, N'Rotate Array', N'rotate-array', 421536, N'rotate-array', 1, 0, 189, 1, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (35302, N'Best Time to Buy and Sell Stock IV', NULL, 150188, N'best-time-to-buy-and-sell-stock-iv', NULL, 0, 188, 3, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (58215, N'Repeated DNA Sequences', NULL, 203903, N'repeated-dna-sequences', NULL, 0, 187, 2, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (16283, N'Reverse Words in a String II', NULL, 56428, N'reverse-words-in-a-string-ii', NULL, 0, 186, 2, 1, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (58971, N'Largest Number', NULL, 281834, N'largest-number', NULL, 0, 179, 2, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (31186, N'Dungeon Game', NULL, 138877, N'dungeon-game', NULL, 0, 174, 3, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (65606, N'Binary Search Tree Iterator', NULL, 173697, N'binary-search-tree-iterator', NULL, 0, 173, 2, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (75047, N'Factorial Trailing Zeroes', NULL, 218293, N'factorial-trailing-zeroes', NULL, 0, 172, 1, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (104416, N'Excel Sheet Column Number', NULL, 234777, N'excel-sheet-column-number', NULL, 0, 171, 1, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (18170, N'Two Sum III - Data structure design', NULL, 80474, N'two-sum-iii-data-structure-design', NULL, 0, 170, 1, 1, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (151465, N'Majority Element', NULL, 344559, N'majority-element', NULL, 0, 169, 1, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (79510, N'Excel Sheet Column Title', NULL, 334318, N'excel-sheet-column-title', NULL, 0, 168, 1, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (33774, N'Two Sum II - Input array is sorted', N'two-sum-ii-input-array-sorted', 70320, N'two-sum-ii-input-array-is-sorted', 1, 0, 167, 2, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (40721, N'Fraction to Recurring Decimal', N'fraction-recurring-decimal', 247734, N'fraction-to-recurring-decimal', 1, 0, 166, 2, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (69424, N'Compare Version Numbers', NULL, 368605, N'compare-version-numbers', NULL, 0, 165, 1, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (39393, N'Maximum Gap', NULL, 139938, N'maximum-gap', NULL, 0, 164, 3, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (18744, N'Missing Ranges', NULL, 62897, N'missing-ranges', NULL, 0, 163, 2, 1, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (86891, N'Find Peak Element', NULL, 247640, N'find-peak-element', NULL, 0, 162, 2, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (20019, N'One Edit Distance', NULL, 67052, N'one-edit-distance', NULL, 0, 161, 2, 1, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (97070, N'Intersection of Two Linked Lists', N'intersection-two-linked-lists', 319586, N'intersection-of-two-linked-lists', 1, 0, 160, 1, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (18136, N'Longest Substring with At Most Two Distinct Characters', NULL, 47271, N'longest-substring-with-at-most-two-distinct-characters', NULL, 0, 159, 3, 1, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (15569, N'Read N Characters Given Read4 II - Call multiple times', NULL, 64132, N'read-n-characters-given-read4-ii-call-multiple-times', NULL, 0, 158, 3, 1, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (19315, N'Read N Characters Given Read4', NULL, 65648, N'read-n-characters-given-read4', NULL, 0, 157, 1, 1, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (16621, N'Binary Tree Upside Down', NULL, 40336, N'binary-tree-upside-down', NULL, 0, 156, 2, 1, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (96328, N'Min Stack', NULL, 381979, N'min-stack', NULL, 0, 155, 1, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (63405, N'Find Minimum in Rotated Sorted Array II', NULL, 177463, N'find-minimum-in-rotated-sorted-array-ii', NULL, 0, 154, 3, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (117599, N'Find Minimum in Rotated Sorted Array', NULL, 308954, N'find-minimum-in-rotated-sorted-array', NULL, 0, 153, 2, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (76796, N'Maximum Product Subarray', NULL, 322034, N'maximum-product-subarray', NULL, 0, 152, 2, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (125671, N'Reverse Words in a String', NULL, 799338, N'reverse-words-in-a-string', NULL, 0, 151, 2, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (76925, N'Evaluate Reverse Polish Notation', NULL, 304204, N'evaluate-reverse-polish-notation', NULL, 0, 150, 2, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (67762, N'Max Points on a Line', NULL, 445298, N'max-points-on-a-line', NULL, 0, 149, 3, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (85931, N'Sort List', NULL, 321853, N'sort-list', NULL, 0, 148, 2, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (84954, N'Insertion Sort List', NULL, 272458, N'insertion-sort-list', NULL, 0, 147, 2, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (94510, N'LRU Cache', NULL, 596530, N'lru-cache', NULL, 0, 146, 3, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (116813, N'Binary Tree Postorder Traversal', NULL, 310557, N'binary-tree-postorder-traversal', NULL, 0, 145, 3, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (147857, N'Binary Tree Preorder Traversal', NULL, 349686, N'binary-tree-preorder-traversal', NULL, 0, 144, 2, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (77483, N'Reorder List', NULL, 320073, N'reorder-list', NULL, 0, 143, 2, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (92381, N'Linked List Cycle II', NULL, 296034, N'linked-list-cycle-ii', NULL, 0, 142, 2, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (138394, N'Linked List Cycle', N'linked-list-cycle', 383502, N'linked-list-cycle', 1, 0, 141, 1, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (70144, N'Word Break II', NULL, 326649, N'word-break-ii', NULL, 0, 140, 3, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (110543, N'Word Break', NULL, 404663, N'word-break', NULL, 0, 139, 2, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (80955, N'Copy List with Random Pointer', NULL, 308370, N'copy-list-with-random-pointer', NULL, 0, 138, 3, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (100204, N'Single Number II', NULL, 253144, N'single-number-ii', NULL, 0, 137, 2, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (167009, N'Single Number', NULL, 320654, N'single-number', NULL, 0, 136, 1, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (59904, N'Candy', NULL, 253882, N'candy', NULL, 0, 135, 3, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (72042, N'Gas Station', NULL, 254675, N'gas-station', NULL, 0, 134, 2, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (84871, N'Clone Graph', NULL, 340388, N'clone-graph', NULL, 0, 133, 2, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (59764, N'Palindrome Partitioning II', NULL, 259371, N'palindrome-partitioning-ii', NULL, 0, 132, 3, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (78464, N'Palindrome Partitioning', NULL, 262391, N'palindrome-partitioning', NULL, 0, 131, 2, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (66105, N'Surrounded Regions', NULL, 386976, N'surrounded-regions', NULL, 0, 130, 2, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (92498, N'Sum Root to Leaf Numbers', NULL, 267754, N'sum-root-to-leaf-numbers', NULL, 0, 129, 2, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (81674, N'Longest Consecutive Sequence', NULL, 237112, N'longest-consecutive-sequence', NULL, 0, 128, 3, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (96132, N'Word Ladder', NULL, 496572, N'word-ladder', NULL, 0, 127, 2, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (54567, N'Word Ladder II', NULL, 399469, N'word-ladder-ii', NULL, 0, 126, 3, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (126039, N'Valid Palindrome', NULL, 505646, N'valid-palindrome', NULL, 0, 125, 1, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (78377, N'Binary Tree Maximum Path Sum', NULL, 318747, N'binary-tree-maximum-path-sum', NULL, 0, 124, 3, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (70218, N'Best Time to Buy and Sell Stock III', NULL, 252796, N'best-time-to-buy-and-sell-stock-iii', NULL, 0, 123, 3, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (109796, N'Best Time to Buy and Sell Stock II', N'best-time-buy-and-sell-stock-ii', 245536, N'best-time-to-buy-and-sell-stock-ii', 1, 0, 122, 2, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (139782, N'Best Time to Buy and Sell Stock', N'best-time-buy-and-sell-stock', 365342, N'best-time-to-buy-and-sell-stock', 1, 0, 121, 1, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (85284, N'Triangle', NULL, 267319, N'triangle', NULL, 0, 120, 2, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (92865, N'Pascal''s Triangle II', NULL, 270722, N'pascals-triangle-ii', NULL, 0, 119, 1, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (104677, N'Pascal''s Triangle', NULL, 291961, N'pascals-triangle', NULL, 0, 118, 1, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (74699, N'Populating Next Right Pointers in Each Node II', NULL, 224940, N'populating-next-right-pointers-in-each-node-ii', NULL, 0, 117, 3, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (106828, N'Populating Next Right Pointers in Each Node', NULL, 290775, N'populating-next-right-pointers-in-each-node', NULL, 0, 116, 2, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (60077, N'Distinct Subsequences', NULL, 198876, N'distinct-subsequences', NULL, 0, 115, 3, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (101400, N'Flatten Binary Tree to Linked List', NULL, 307948, N'flatten-binary-tree-to-linked-list', NULL, 0, 114, 2, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (100425, N'Path Sum II', NULL, 329239, N'path-sum-ii', NULL, 0, 113, 2, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (128732, N'Path Sum', NULL, 396462, N'path-sum', NULL, 0, 112, 1, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (133162, N'Minimum Depth of Binary Tree', NULL, 417986, N'minimum-depth-of-binary-tree', NULL, 0, 111, 1, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (139148, N'Balanced Binary Tree', NULL, 389784, N'balanced-binary-tree', NULL, 0, 110, 1, 0, 0, 0)
GO
print 'Processed 300 total records'
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (85946, N'Convert Sorted List to Binary Search Tree', NULL, 267358, N'convert-sorted-list-to-binary-search-tree', NULL, 0, 109, 2, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (93793, N'Convert Sorted Array to Binary Search Tree', NULL, 236401, N'convert-sorted-array-to-binary-search-tree', NULL, 0, 108, 2, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (101715, N'Binary Tree Level Order Traversal II', NULL, 276818, N'binary-tree-level-order-traversal-ii', NULL, 0, 107, 1, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (68577, N'Construct Binary Tree from Inorder and Postorder Traversal', NULL, 224968, N'construct-binary-tree-from-inorder-and-postorder-traversal', NULL, 0, 106, 2, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (79897, N'Construct Binary Tree from Preorder and Inorder Traversal', NULL, 263987, N'construct-binary-tree-from-preorder-and-inorder-traversal', NULL, 0, 105, 2, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (187522, N'Maximum Depth of Binary Tree', NULL, 374450, N'maximum-depth-of-binary-tree', NULL, 0, 104, 1, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (76938, N'Binary Tree Zigzag Level Order Traversal', NULL, 246319, N'binary-tree-zigzag-level-order-traversal', NULL, 0, 103, 2, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (132494, N'Binary Tree Level Order Traversal', NULL, 370016, N'binary-tree-level-order-traversal', NULL, 0, 102, 1, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (137063, N'Symmetric Tree', N'symmetric-tree', 378999, N'symmetric-tree', 1, 0, 101, 1, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (162167, N'Same Tree', NULL, 362612, N'same-tree', NULL, 0, 100, 1, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (61946, N'Recover Binary Search Tree', NULL, 219907, N'recover-binary-search-tree', NULL, 0, 99, 3, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (120821, N'Validate Binary Search Tree', NULL, 550954, N'validate-binary-search-tree', NULL, 0, 98, 2, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (59169, N'Interleaving String', NULL, 250542, N'interleaving-string', NULL, 0, 97, 3, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (100095, N'Unique Binary Search Trees', NULL, 255200, N'unique-binary-search-trees', NULL, 0, 96, 2, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (67763, N'Unique Binary Search Trees II', NULL, 224779, N'unique-binary-search-trees-ii', NULL, 0, 95, 2, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (156682, N'Binary Tree Inorder Traversal', NULL, 367345, N'binary-tree-inorder-traversal', NULL, 0, 94, 2, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (69107, N'Restore IP Addresses', NULL, 273831, N'restore-ip-addresses', NULL, 0, 93, 2, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (88136, N'Reverse Linked List II', NULL, 299815, N'reverse-linked-list-ii', NULL, 0, 92, 2, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (90571, N'Decode Ways', NULL, 490424, N'decode-ways', NULL, 0, 91, 2, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (85176, N'Subsets II', NULL, 258438, N'subsets-ii', NULL, 0, 90, 2, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (73622, N'Gray Code', NULL, 190527, N'gray-code', NULL, 0, 89, 2, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (126806, N'Merge Sorted Array', NULL, 408818, N'merge-sorted-array', NULL, 0, 88, 1, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (54466, N'Scramble String', NULL, 195499, N'scramble-string', NULL, 0, 87, 3, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (80751, N'Partition List', NULL, 259834, N'partition-list', NULL, 0, 86, 2, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (52289, N'Maximal Rectangle', NULL, 207125, N'maximal-rectangle', NULL, 0, 85, 3, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (73386, N'Largest Rectangle in Histogram', NULL, 290218, N'largest-rectangle-in-histogram', NULL, 0, 84, 3, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (146071, N'Remove Duplicates from Sorted List', N'remove-duplicates-sorted-list', 381407, N'remove-duplicates-from-sorted-list', 1, 0, 83, 1, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (88662, N'Remove Duplicates from Sorted List II', NULL, 313881, N'remove-duplicates-from-sorted-list-ii', NULL, 0, 82, 2, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (76192, N'Search in Rotated Sorted Array II', NULL, 233073, N'search-in-rotated-sorted-array-ii', NULL, 0, 81, 2, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (93173, N'Remove Duplicates from Sorted Array II', NULL, 271123, N'remove-duplicates-from-sorted-array-ii', NULL, 0, 80, 2, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (96154, N'Word Search', NULL, 388879, N'word-search', NULL, 0, 79, 2, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (123010, N'Subsets', NULL, 349798, N'subsets', NULL, 0, 78, 2, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (94285, N'Combinations', NULL, 254414, N'combinations', NULL, 0, 77, 2, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (76385, N'Minimum Window Substring', NULL, 332312, N'minimum-window-substring', NULL, 0, 76, 3, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (124237, N'Sort Colors', NULL, 343502, N'sort-colors', NULL, 0, 75, 2, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (98582, N'Search a 2D Matrix', NULL, 279422, N'search-a-2d-matrix', NULL, 0, 74, 2, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (81628, N'Set Matrix Zeroes', NULL, 235039, N'set-matrix-zeroes', NULL, 0, 73, 2, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (71002, N'Edit Distance', NULL, 235722, N'edit-distance', NULL, 0, 72, 3, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (66228, N'Simplify Path', NULL, 281875, N'simplify-path', NULL, 0, 71, 2, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (137281, N'Climbing Stairs', NULL, 359802, N'climbing-stairs', NULL, 0, 70, 1, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (116904, N'Sqrt(x)', NULL, 441841, N'sqrtx', NULL, 0, 69, 2, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (42307, N'Text Justification', NULL, 242646, N'text-justification', NULL, 0, 68, 3, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (109421, N'Add Binary', NULL, 369141, N'add-binary', NULL, 0, 67, 1, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (131392, N'Plus One', NULL, 363758, N'plus-one', NULL, 0, 66, 1, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (55968, N'Valid Number', NULL, 448150, N'valid-number', NULL, 0, 65, 3, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (89157, N'Minimum Path Sum', NULL, 242985, N'minimum-path-sum', NULL, 0, 64, 2, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (82086, N'Unique Paths II', NULL, 268809, N'unique-paths-ii', NULL, 0, 63, 2, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (109622, N'Unique Paths', NULL, 285337, N'unique-paths', NULL, 0, 62, 2, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (86225, N'Rotate List', NULL, 362394, N'rotate-list', NULL, 0, 61, 2, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (67713, N'Permutation Sequence', NULL, 254622, N'permutation-sequence', NULL, 0, 60, 2, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (65995, N'Spiral Matrix II', NULL, 177072, N'spiral-matrix-ii', NULL, 0, 59, 2, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (116199, N'Length of Last Word', NULL, 378631, N'length-of-last-word', NULL, 0, 58, 1, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (73041, N'Insert Interval', NULL, 285488, N'insert-interval', NULL, 0, 57, 3, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (89098, N'Merge Intervals', NULL, 323510, N'merge-intervals', NULL, 0, 56, 3, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (97588, N'Jump Game', N'jump-game', 336090, N'jump-game', 1, 0, 55, 2, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (77072, N'Spiral Matrix', NULL, 320335, N'spiral-matrix', NULL, 0, 54, 2, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (144042, N'Maximum Subarray', NULL, 377571, N'maximum-subarray', NULL, 0, 53, 2, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (52760, N'N-Queens II', NULL, 125927, N'n-queens-ii', NULL, 0, 52, 3, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (65411, N'N-Queens', NULL, 231790, N'n-queens', NULL, 0, 51, 3, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (116130, N'Pow(x, n)', NULL, 426451, N'powx-n', NULL, 0, 50, 2, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (98900, N'Group Anagrams', NULL, 322383, N'anagrams', NULL, 0, 49, 2, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (85253, N'Rotate Image', NULL, 233687, N'rotate-image', NULL, 0, 48, 2, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (91788, N'Permutations II', NULL, 304331, N'permutations-ii', NULL, 0, 47, 2, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (127251, N'Permutations', NULL, 325419, N'permutations', NULL, 0, 46, 2, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (76820, N'Jump Game II', NULL, 296860, N'jump-game-ii', NULL, 0, 45, 3, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (72869, N'Wildcard Matching', NULL, 392079, N'wildcard-matching', NULL, 0, 44, 3, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (79019, N'Multiply Strings', NULL, 312369, N'multiply-strings', NULL, 0, 43, 2, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (85929, N'Trapping Rain Water', NULL, 249300, N'trapping-rain-water', NULL, 0, 42, 3, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (78937, N'First Missing Positive', NULL, 319538, N'first-missing-positive', NULL, 0, 41, 3, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (88144, N'Combination Sum II', NULL, 291393, N'combination-sum-ii', NULL, 0, 40, 2, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (120489, N'Combination Sum', NULL, 349609, N'combination-sum', NULL, 0, 39, 2, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (103821, N'Count and Say', NULL, 328259, N'count-and-say', NULL, 0, 38, 1, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (60676, N'Sudoku Solver', NULL, 222854, N'sudoku-solver', NULL, 0, 37, 3, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (95611, N'Valid Sudoku', NULL, 289237, N'valid-sudoku', NULL, 0, 36, 1, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (128943, N'Search Insert Position', NULL, 334063, N'search-insert-position', NULL, 0, 35, 2, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (105696, N'Search for a Range', NULL, 346968, N'search-for-a-range', NULL, 0, 34, 2, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (128330, N'Search in Rotated Sorted Array', NULL, 407529, N'search-in-rotated-sorted-array', NULL, 0, 33, 3, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (77220, N'Longest Valid Parentheses', NULL, 336825, N'longest-valid-parentheses', NULL, 0, 32, 3, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (85413, N'Next Permutation', N'next-permutation', 307062, N'next-permutation', 1, 0, 31, 2, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (66094, N'Substring with Concatenation of All Words', NULL, 307546, N'substring-with-concatenation-of-all-words', NULL, 0, 30, 3, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (81719, N'Divide Two Integers', NULL, 513764, N'divide-two-integers', NULL, 0, 29, 2, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (136843, N'Implement strStr()', NULL, 518224, N'implement-strstr', NULL, 0, 28, 1, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (152584, N'Remove Element', N'remove-element', 421958, N'remove-element', 1, 0, 27, 1, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (169675, N'Remove Duplicates from Sorted Array', N'remove-duplicates-sorted-array', 485866, N'remove-duplicates-from-sorted-array', 1, 0, 26, 1, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (73652, N'Reverse Nodes in k-Group', NULL, 252471, N'reverse-nodes-in-k-group', NULL, 0, 25, 3, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (128851, N'Swap Nodes in Pairs', NULL, 350729, N'swap-nodes-in-pairs', NULL, 0, 24, 1, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (111715, N'Merge k Sorted Lists', NULL, 442236, N'merge-k-sorted-lists', NULL, 0, 23, 3, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (112909, N'Generate Parentheses', NULL, 278514, N'generate-parentheses', NULL, 0, 22, 2, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (165565, N'Merge Two Sorted Lists', NULL, 443521, N'merge-two-sorted-lists', NULL, 0, 21, 1, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (142845, N'Valid Parentheses', NULL, 455681, N'valid-parentheses', NULL, 0, 20, 1, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (139655, N'Remove Nth Node From End of List', N'remove-nth-node-end-list', 442640, N'remove-nth-node-from-end-of-list', 1, 0, 19, 1, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (91993, N'4Sum', NULL, 365629, N'4sum', NULL, 0, 18, 2, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (106923, N'Letter Combinations of a Phone Number', NULL, 340668, N'letter-combinations-of-a-phone-number', NULL, 0, 17, 2, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (99218, N'3Sum Closest', NULL, 328112, N'3sum-closest', NULL, 0, 16, 2, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (155517, N'3Sum', NULL, 765336, N'3sum', NULL, 0, 15, 2, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (130328, N'Longest Common Prefix', N'longest-common-prefix', 434125, N'longest-common-prefix', 1, 0, 14, 1, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (111574, N'Roman to Integer', NULL, 262242, N'roman-to-integer', NULL, 0, 13, 1, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (81781, N'Integer to Roman', NULL, 195018, N'integer-to-roman', NULL, 0, 12, 2, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (100694, N'Container With Most Water', N'container-most-water', 281164, N'container-with-most-water', 1, 0, 11, 2, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (104422, N'Regular Expression Matching', NULL, 450974, N'regular-expression-matching', NULL, 0, 10, 3, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (159322, N'Palindrome Number', NULL, 474742, N'palindrome-number', NULL, 0, 9, 1, 0, 0, 0)
GO
print 'Processed 400 total records'
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (131561, N'String to Integer (atoi)', NULL, 954710, N'string-to-integer-atoi', NULL, 0, 8, 1, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (178937, N'Reverse Integer', NULL, 754588, N'reverse-integer', NULL, 0, 7, 1, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (116733, N'ZigZag Conversion', NULL, 457309, N'zigzag-conversion', NULL, 0, 6, 1, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (142703, N'Longest Palindromic Substring', N'longest-palindromic-substring', 595660, N'longest-palindromic-substring', 1, 0, 5, 2, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (124272, N'Median of Two Sorted Arrays', NULL, 612596, N'median-of-two-sorted-arrays', NULL, 0, 4, 3, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (205285, N'Longest Substring Without Repeating Characters', N'longest-substring-without-repeating-characters', 878463, N'longest-substring-without-repeating-characters', 1, 0, 3, 2, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (200132, N'Add Two Numbers', N'add-two-numbers', 785149, N'add-two-numbers', 1, 0, 2, 2, 0, 0, 0)
INSERT [dbo].[Leet_Question] ([TotalAcs], [QuestionTitle], [QuestionArticleSlug], [TotalSubmitted], [QuestionTitleSlug], [QuestionArticleLive], [QuestionHide], [QuestionId], [Level], [PaidOnly], [Frequency], [Progress]) VALUES (334647, N'Two Sum', N'two-sum', 1197235, N'two-sum', 1, 0, 1, 1, 0, 0, 0)
/****** Object:  Table [dbo].[Leet_LeetCode]    Script Date: 11/29/2016 19:18:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Leet_LeetCode](
	[frequency_mid] [int] NOT NULL,
	[num_solved] [int] NOT NULL,
	[category_slug] [nvarchar](50) NOT NULL,
	[is_paid] [bit] NOT NULL,
	[frequency_high] [int] NULL,
	[user_name] [nvarchar](50) NOT NULL,
	[num_total] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Leet_Difficulty]    Script Date: 11/29/2016 19:18:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Leet_Difficulty](
	[level] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Leet_Answer]    Script Date: 11/29/2016 19:18:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Leet_Answer](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[LeetCodeId] [int] NOT NULL,
	[Status] [int] NULL,
	[Answer] [nvarchar](50) NULL,
	[CreateTime] [datetime] NOT NULL,
	[UpdateTime] [datetime] NOT NULL,
 CONSTRAINT [PK_Leet_Answer] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LeetCodeId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KeyCount]    Script Date: 11/29/2016 19:18:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KeyCount](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[WorkId] [nchar](100) NOT NULL,
	[MacAddr] [nchar](50) NOT NULL,
	[Day] [date] NOT NULL,
	[TimeStamp] [datetime] NOT NULL,
	[KCount] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[AddTime] [datetime] NOT NULL,
	[UpdateTime] [datetime] NOT NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[KeyCount] ON
INSERT [dbo].[KeyCount] ([Id], [WorkId], [MacAddr], [Day], [TimeStamp], [KCount], [UserId], [AddTime], [UpdateTime]) VALUES (1, N'8d67beff-a703-41ed-af7f-f73bdc4f8821                                                                ', N'98:90:96:E1:BB:34                                 ', CAST(0x003C0B00 AS Date), CAST(0x0000A6A5014F1798 AS DateTime), 146, 12, CAST(0x0000A6AD008C1F18 AS DateTime), CAST(0x0000A6AD008C1F18 AS DateTime))
INSERT [dbo].[KeyCount] ([Id], [WorkId], [MacAddr], [Day], [TimeStamp], [KCount], [UserId], [AddTime], [UpdateTime]) VALUES (2, N'92a614f1-d657-46b2-8bd6-6a1e770a1fc5                                                                ', N'98:90:96:E1:BB:34                                 ', CAST(0x013C0B00 AS Date), CAST(0x0000A6A600A0C314 AS DateTime), 11350, 12, CAST(0x0000A6AD008C1F18 AS DateTime), CAST(0x0000A6AD008C1F18 AS DateTime))
INSERT [dbo].[KeyCount] ([Id], [WorkId], [MacAddr], [Day], [TimeStamp], [KCount], [UserId], [AddTime], [UpdateTime]) VALUES (3, N'78be4520-1813-4c3c-a891-8e01493c04ef                                                                ', N'98:90:96:E1:BB:34                                 ', CAST(0x023C0B00 AS Date), CAST(0x0000A6A700023988 AS DateTime), 0, 12, CAST(0x0000A6AD008C1F18 AS DateTime), CAST(0x0000A6AD008C1F18 AS DateTime))
INSERT [dbo].[KeyCount] ([Id], [WorkId], [MacAddr], [Day], [TimeStamp], [KCount], [UserId], [AddTime], [UpdateTime]) VALUES (4, N'78be4520-1813-4c3c-a891-8e01493c04ef                                                                ', N'98:90:96:E1:BB:34                                 ', CAST(0x033C0B00 AS Date), CAST(0x0000A6A800023AB4 AS DateTime), 0, 12, CAST(0x0000A6AD008C1F18 AS DateTime), CAST(0x0000A6AD008C1F18 AS DateTime))
INSERT [dbo].[KeyCount] ([Id], [WorkId], [MacAddr], [Day], [TimeStamp], [KCount], [UserId], [AddTime], [UpdateTime]) VALUES (5, N'78be4520-1813-4c3c-a891-8e01493c04ef                                                                ', N'98:90:96:E1:BB:34                                 ', CAST(0x043C0B00 AS Date), CAST(0x0000A6A900023BE0 AS DateTime), 18011, 12, CAST(0x0000A6AD008C1F18 AS DateTime), CAST(0x0000A6AD008C1F18 AS DateTime))
INSERT [dbo].[KeyCount] ([Id], [WorkId], [MacAddr], [Day], [TimeStamp], [KCount], [UserId], [AddTime], [UpdateTime]) VALUES (6, N'78be4520-1813-4c3c-a891-8e01493c04ef                                                                ', N'98:90:96:E1:BB:34                                 ', CAST(0x053C0B00 AS Date), CAST(0x0000A6AA00023BE0 AS DateTime), 17158, 12, CAST(0x0000A6AD008C1F18 AS DateTime), CAST(0x0000A6AD008C1F18 AS DateTime))
INSERT [dbo].[KeyCount] ([Id], [WorkId], [MacAddr], [Day], [TimeStamp], [KCount], [UserId], [AddTime], [UpdateTime]) VALUES (7, N'78be4520-1813-4c3c-a891-8e01493c04ef                                                                ', N'98:90:96:E1:BB:34                                 ', CAST(0x063C0B00 AS Date), CAST(0x0000A6AB00023AB4 AS DateTime), 13966, 12, CAST(0x0000A6AD008C1F18 AS DateTime), CAST(0x0000A6AD008C1F18 AS DateTime))
INSERT [dbo].[KeyCount] ([Id], [WorkId], [MacAddr], [Day], [TimeStamp], [KCount], [UserId], [AddTime], [UpdateTime]) VALUES (8, N'78be4520-1813-4c3c-a891-8e01493c04ef                                                                ', N'98:90:96:E1:BB:34                                 ', CAST(0x073C0B00 AS Date), CAST(0x0000A6AC00023BE0 AS DateTime), 14766, 12, CAST(0x0000A6AD008C1F18 AS DateTime), CAST(0x0000A6AD008C1F18 AS DateTime))
INSERT [dbo].[KeyCount] ([Id], [WorkId], [MacAddr], [Day], [TimeStamp], [KCount], [UserId], [AddTime], [UpdateTime]) VALUES (9, N'78be4520-1813-4c3c-a891-8e01493c04ef                                                                ', N'98:90:96:E1:BB:34                                 ', CAST(0x083C0B00 AS Date), CAST(0x0000A6AD00023E38 AS DateTime), 5991, 12, CAST(0x0000A6AD008C1F18 AS DateTime), CAST(0x0000A6AD008C1F18 AS DateTime))
INSERT [dbo].[KeyCount] ([Id], [WorkId], [MacAddr], [Day], [TimeStamp], [KCount], [UserId], [AddTime], [UpdateTime]) VALUES (10, N'78be4520-1813-4c3c-a891-8e01493c04ef                                                                ', N'98:90:96:E1:BB:34                                 ', CAST(0x093C0B00 AS Date), CAST(0x0000A6AE00000000 AS DateTime), 0, 12, CAST(0x0000A6B00098DE6B AS DateTime), CAST(0x0000A6B000BDB933 AS DateTime))
INSERT [dbo].[KeyCount] ([Id], [WorkId], [MacAddr], [Day], [TimeStamp], [KCount], [UserId], [AddTime], [UpdateTime]) VALUES (11, N'78be4520-1813-4c3c-a891-8e01493c04ef                                                                ', N'98:90:96:E1:BB:34                                 ', CAST(0x0A3C0B00 AS Date), CAST(0x0000A6AF00000000 AS DateTime), 4745, 12, CAST(0x0000A6B00098DE6D AS DateTime), CAST(0x0000A6B000BDB935 AS DateTime))
INSERT [dbo].[KeyCount] ([Id], [WorkId], [MacAddr], [Day], [TimeStamp], [KCount], [UserId], [AddTime], [UpdateTime]) VALUES (12, N'78be4520-1813-4c3c-a891-8e01493c04ef                                                                ', N'98:90:96:E1:BB:34                                 ', CAST(0x0B3C0B00 AS Date), CAST(0x0000A6B000000000 AS DateTime), 8824, 12, CAST(0x0000A6B00098DE6F AS DateTime), CAST(0x0000A6B1009A47E0 AS DateTime))
INSERT [dbo].[KeyCount] ([Id], [WorkId], [MacAddr], [Day], [TimeStamp], [KCount], [UserId], [AddTime], [UpdateTime]) VALUES (13, N'8d8311ac-57b3-483e-a30f-4bb37762ef38                                                                ', N'98:90:96:E1:BB:34                                 ', CAST(0x0C3C0B00 AS Date), CAST(0x0000A6B100012624 AS DateTime), 11428, 12, CAST(0x0000A6B1009A4801 AS DateTime), CAST(0x0000A6B2009E53DE AS DateTime))
INSERT [dbo].[KeyCount] ([Id], [WorkId], [MacAddr], [Day], [TimeStamp], [KCount], [UserId], [AddTime], [UpdateTime]) VALUES (14, N'a32eaa30-ee08-47cd-99bb-d9ba3257b140                                                                ', N'98:90:96:E1:BB:34                                 ', CAST(0x0D3C0B00 AS Date), CAST(0x0000A6B2000078B4 AS DateTime), 14133, 12, CAST(0x0000A6B2009E53E7 AS DateTime), CAST(0x0000A6B30096A176 AS DateTime))
INSERT [dbo].[KeyCount] ([Id], [WorkId], [MacAddr], [Day], [TimeStamp], [KCount], [UserId], [AddTime], [UpdateTime]) VALUES (15, N'a32eaa30-ee08-47cd-99bb-d9ba3257b140                                                                ', N'98:90:96:E1:BB:34                                 ', CAST(0x0E3C0B00 AS Date), CAST(0x0000A6B3000078B4 AS DateTime), 13673, 12, CAST(0x0000A6B30096A186 AS DateTime), CAST(0x0000A6B4009C7CC5 AS DateTime))
INSERT [dbo].[KeyCount] ([Id], [WorkId], [MacAddr], [Day], [TimeStamp], [KCount], [UserId], [AddTime], [UpdateTime]) VALUES (16, N'a32eaa30-ee08-47cd-99bb-d9ba3257b140                                                                ', N'98:90:96:E1:BB:34                                 ', CAST(0x0F3C0B00 AS Date), CAST(0x0000A6B4000078B4 AS DateTime), 9933, 12, CAST(0x0000A6B4009C7CCB AS DateTime), CAST(0x0000A6B7008E1D3E AS DateTime))
INSERT [dbo].[KeyCount] ([Id], [WorkId], [MacAddr], [Day], [TimeStamp], [KCount], [UserId], [AddTime], [UpdateTime]) VALUES (17, N'a32eaa30-ee08-47cd-99bb-d9ba3257b140                                                                ', N'98:90:96:E1:BB:34                                 ', CAST(0x103C0B00 AS Date), CAST(0x0000A6B5000079E0 AS DateTime), 1243, 12, CAST(0x0000A6B7008E1D44 AS DateTime), CAST(0x0000A6B7008E1D44 AS DateTime))
INSERT [dbo].[KeyCount] ([Id], [WorkId], [MacAddr], [Day], [TimeStamp], [KCount], [UserId], [AddTime], [UpdateTime]) VALUES (18, N'a32eaa30-ee08-47cd-99bb-d9ba3257b140                                                                ', N'98:90:96:E1:BB:34                                 ', CAST(0x113C0B00 AS Date), CAST(0x0000A6B6000079E0 AS DateTime), 36, 12, CAST(0x0000A6B7008E1D50 AS DateTime), CAST(0x0000A6B7008E1D50 AS DateTime))
INSERT [dbo].[KeyCount] ([Id], [WorkId], [MacAddr], [Day], [TimeStamp], [KCount], [UserId], [AddTime], [UpdateTime]) VALUES (19, N'a32eaa30-ee08-47cd-99bb-d9ba3257b140                                                                ', N'98:90:96:E1:BB:34                                 ', CAST(0x123C0B00 AS Date), CAST(0x0000A6B7000079E0 AS DateTime), 10769, 12, CAST(0x0000A6B7008E1D58 AS DateTime), CAST(0x0000A6B9008BF551 AS DateTime))
INSERT [dbo].[KeyCount] ([Id], [WorkId], [MacAddr], [Day], [TimeStamp], [KCount], [UserId], [AddTime], [UpdateTime]) VALUES (23, N'a32eaa30-ee08-47cd-99bb-d9ba3257b140                                                                ', N'98:90:96:E1:BB:34                                 ', CAST(0x163C0B00 AS Date), CAST(0x0000A6BB0000B928 AS DateTime), 12890, 12, CAST(0x0000A6BB00905F5C AS DateTime), CAST(0x0000A6BE00B811FC AS DateTime))
INSERT [dbo].[KeyCount] ([Id], [WorkId], [MacAddr], [Day], [TimeStamp], [KCount], [UserId], [AddTime], [UpdateTime]) VALUES (24, N'a32eaa30-ee08-47cd-99bb-d9ba3257b140                                                                ', N'98:90:96:E1:BB:34                                 ', CAST(0x173C0B00 AS Date), CAST(0x0000A6BC0000B928 AS DateTime), 52, 12, CAST(0x0000A6BE00B81204 AS DateTime), CAST(0x0000A6BE00B81204 AS DateTime))
INSERT [dbo].[KeyCount] ([Id], [WorkId], [MacAddr], [Day], [TimeStamp], [KCount], [UserId], [AddTime], [UpdateTime]) VALUES (25, N'a32eaa30-ee08-47cd-99bb-d9ba3257b140                                                                ', N'98:90:96:E1:BB:34                                 ', CAST(0x183C0B00 AS Date), CAST(0x0000A6BD0000B928 AS DateTime), 2458, 12, CAST(0x0000A6BE00B81225 AS DateTime), CAST(0x0000A6BE00B81225 AS DateTime))
INSERT [dbo].[KeyCount] ([Id], [WorkId], [MacAddr], [Day], [TimeStamp], [KCount], [UserId], [AddTime], [UpdateTime]) VALUES (26, N'a32eaa30-ee08-47cd-99bb-d9ba3257b140                                                                ', N'98:90:96:E1:BB:34                                 ', CAST(0x193C0B00 AS Date), CAST(0x0000A6BE0000BA54 AS DateTime), 30169, 12, CAST(0x0000A6BE00B81229 AS DateTime), CAST(0x0000A6BF00B1D7B1 AS DateTime))
INSERT [dbo].[KeyCount] ([Id], [WorkId], [MacAddr], [Day], [TimeStamp], [KCount], [UserId], [AddTime], [UpdateTime]) VALUES (20, N'a32eaa30-ee08-47cd-99bb-d9ba3257b140                                                                ', N'98:90:96:E1:BB:34                                 ', CAST(0x133C0B00 AS Date), CAST(0x0000A6B800007B0C AS DateTime), 19629, 12, CAST(0x0000A6B9008BF72F AS DateTime), CAST(0x0000A6B9008BF72F AS DateTime))
INSERT [dbo].[KeyCount] ([Id], [WorkId], [MacAddr], [Day], [TimeStamp], [KCount], [UserId], [AddTime], [UpdateTime]) VALUES (21, N'a32eaa30-ee08-47cd-99bb-d9ba3257b140                                                                ', N'98:90:96:E1:BB:34                                 ', CAST(0x143C0B00 AS Date), CAST(0x0000A6B900007B0C AS DateTime), 12307, 12, CAST(0x0000A6B9008BF78B AS DateTime), CAST(0x0000A6BA00BF280F AS DateTime))
INSERT [dbo].[KeyCount] ([Id], [WorkId], [MacAddr], [Day], [TimeStamp], [KCount], [UserId], [AddTime], [UpdateTime]) VALUES (22, N'a32eaa30-ee08-47cd-99bb-d9ba3257b140                                                                ', N'98:90:96:E1:BB:34                                 ', CAST(0x153C0B00 AS Date), CAST(0x0000A6BA0000B7FC AS DateTime), 12037, 12, CAST(0x0000A6BA00BF282A AS DateTime), CAST(0x0000A6BB00905F44 AS DateTime))
INSERT [dbo].[KeyCount] ([Id], [WorkId], [MacAddr], [Day], [TimeStamp], [KCount], [UserId], [AddTime], [UpdateTime]) VALUES (27, N'a32eaa30-ee08-47cd-99bb-d9ba3257b140                                                                ', N'98:90:96:E1:BB:34                                 ', CAST(0x1A3C0B00 AS Date), CAST(0x0000A6BF0000BA54 AS DateTime), 20875, 12, CAST(0x0000A6BF00B1D7D2 AS DateTime), CAST(0x0000A6C000A44FB4 AS DateTime))
INSERT [dbo].[KeyCount] ([Id], [WorkId], [MacAddr], [Day], [TimeStamp], [KCount], [UserId], [AddTime], [UpdateTime]) VALUES (29, N'a32eaa30-ee08-47cd-99bb-d9ba3257b140                                                                ', N'98:90:96:E1:BB:34                                 ', CAST(0x1C3C0B00 AS Date), CAST(0x0000A6C10000BA54 AS DateTime), 20286, 12, CAST(0x0000A6C10155AEB2 AS DateTime), CAST(0x0000A6C2008D6325 AS DateTime))
INSERT [dbo].[KeyCount] ([Id], [WorkId], [MacAddr], [Day], [TimeStamp], [KCount], [UserId], [AddTime], [UpdateTime]) VALUES (30, N'd5b28ff1-f287-4ce5-9eb3-792a23aaf376                                                                ', N'98:90:96:E1:BB:34                                 ', CAST(0x1D3C0B00 AS Date), CAST(0x0000A6C20001DE20 AS DateTime), 12782, 12, CAST(0x0000A6C2008D633B AS DateTime), CAST(0x0000A6C600A4CE29 AS DateTime))
INSERT [dbo].[KeyCount] ([Id], [WorkId], [MacAddr], [Day], [TimeStamp], [KCount], [UserId], [AddTime], [UpdateTime]) VALUES (31, N'd5b28ff1-f287-4ce5-9eb3-792a23aaf376                                                                ', N'98:90:96:E1:BB:34                                 ', CAST(0x1E3C0B00 AS Date), CAST(0x0000A6C30001DF4C AS DateTime), 2270, 12, CAST(0x0000A6C600A4CE4F AS DateTime), CAST(0x0000A6C600A4CE4F AS DateTime))
INSERT [dbo].[KeyCount] ([Id], [WorkId], [MacAddr], [Day], [TimeStamp], [KCount], [UserId], [AddTime], [UpdateTime]) VALUES (32, N'd5b28ff1-f287-4ce5-9eb3-792a23aaf376                                                                ', N'98:90:96:E1:BB:34                                 ', CAST(0x1F3C0B00 AS Date), CAST(0x0000A6C40001E078 AS DateTime), 0, 12, CAST(0x0000A6C600A4CE66 AS DateTime), CAST(0x0000A6C600A4CE66 AS DateTime))
INSERT [dbo].[KeyCount] ([Id], [WorkId], [MacAddr], [Day], [TimeStamp], [KCount], [UserId], [AddTime], [UpdateTime]) VALUES (35, N'd5b28ff1-f287-4ce5-9eb3-792a23aaf376                                                                ', N'98:90:96:E1:BB:34                                 ', CAST(0x223C0B00 AS Date), CAST(0x0000A6C70001DE20 AS DateTime), 17643, 12, CAST(0x0000A6C7009762F3 AS DateTime), CAST(0x0000A6C80098D828 AS DateTime))
INSERT [dbo].[KeyCount] ([Id], [WorkId], [MacAddr], [Day], [TimeStamp], [KCount], [UserId], [AddTime], [UpdateTime]) VALUES (36, N'd5b28ff1-f287-4ce5-9eb3-792a23aaf376                                                                ', N'98:90:96:E1:BB:34                                 ', CAST(0x233C0B00 AS Date), CAST(0x0000A6C80001DF4C AS DateTime), 24209, 12, CAST(0x0000A6C80098D843 AS DateTime), CAST(0x0000A6C900A61EBF AS DateTime))
INSERT [dbo].[KeyCount] ([Id], [WorkId], [MacAddr], [Day], [TimeStamp], [KCount], [UserId], [AddTime], [UpdateTime]) VALUES (38, N'd5b28ff1-f287-4ce5-9eb3-792a23aaf376                                                                ', N'98:90:96:E1:BB:34                                 ', CAST(0x253C0B00 AS Date), CAST(0x0000A6CA0001E1A4 AS DateTime), 0, 12, CAST(0x0000A6CC0090709D AS DateTime), CAST(0x0000A6CC0090709D AS DateTime))
INSERT [dbo].[KeyCount] ([Id], [WorkId], [MacAddr], [Day], [TimeStamp], [KCount], [UserId], [AddTime], [UpdateTime]) VALUES (39, N'd5b28ff1-f287-4ce5-9eb3-792a23aaf376                                                                ', N'98:90:96:E1:BB:34                                 ', CAST(0x263C0B00 AS Date), CAST(0x0000A6CB0001E078 AS DateTime), 0, 12, CAST(0x0000A6CC009070A3 AS DateTime), CAST(0x0000A6CC009070A3 AS DateTime))
INSERT [dbo].[KeyCount] ([Id], [WorkId], [MacAddr], [Day], [TimeStamp], [KCount], [UserId], [AddTime], [UpdateTime]) VALUES (40, N'd5b28ff1-f287-4ce5-9eb3-792a23aaf376                                                                ', N'98:90:96:E1:BB:34                                 ', CAST(0x273C0B00 AS Date), CAST(0x0000A6CC0001E1A4 AS DateTime), 9907, 12, CAST(0x0000A6CC009070A3 AS DateTime), CAST(0x0000A6CD00BC68AB AS DateTime))
INSERT [dbo].[KeyCount] ([Id], [WorkId], [MacAddr], [Day], [TimeStamp], [KCount], [UserId], [AddTime], [UpdateTime]) VALUES (28, N'a32eaa30-ee08-47cd-99bb-d9ba3257b140                                                                ', N'98:90:96:E1:BB:34                                 ', CAST(0x1B3C0B00 AS Date), CAST(0x0000A6C00000BA54 AS DateTime), 13900, 12, CAST(0x0000A6C000A44FD4 AS DateTime), CAST(0x0000A6C10155AC7A AS DateTime))
INSERT [dbo].[KeyCount] ([Id], [WorkId], [MacAddr], [Day], [TimeStamp], [KCount], [UserId], [AddTime], [UpdateTime]) VALUES (33, N'd5b28ff1-f287-4ce5-9eb3-792a23aaf376                                                                ', N'98:90:96:E1:BB:34                                 ', CAST(0x203C0B00 AS Date), CAST(0x0000A6C50001E1A4 AS DateTime), 19285, 12, CAST(0x0000A6C600A4CE66 AS DateTime), CAST(0x0000A6C600A4CE66 AS DateTime))
INSERT [dbo].[KeyCount] ([Id], [WorkId], [MacAddr], [Day], [TimeStamp], [KCount], [UserId], [AddTime], [UpdateTime]) VALUES (34, N'd5b28ff1-f287-4ce5-9eb3-792a23aaf376                                                                ', N'98:90:96:E1:BB:34                                 ', CAST(0x213C0B00 AS Date), CAST(0x0000A6C60001E1A4 AS DateTime), 22670, 12, CAST(0x0000A6C600A4CE74 AS DateTime), CAST(0x0000A6C7009762AD AS DateTime))
INSERT [dbo].[KeyCount] ([Id], [WorkId], [MacAddr], [Day], [TimeStamp], [KCount], [UserId], [AddTime], [UpdateTime]) VALUES (37, N'd5b28ff1-f287-4ce5-9eb3-792a23aaf376                                                                ', N'98:90:96:E1:BB:34                                 ', CAST(0x243C0B00 AS Date), CAST(0x0000A6C90001E2D0 AS DateTime), 9979, 12, CAST(0x0000A6C900A61EFB AS DateTime), CAST(0x0000A6CC0090705F AS DateTime))
INSERT [dbo].[KeyCount] ([Id], [WorkId], [MacAddr], [Day], [TimeStamp], [KCount], [UserId], [AddTime], [UpdateTime]) VALUES (41, N'd5b28ff1-f287-4ce5-9eb3-792a23aaf376                                                                ', N'98:90:96:E1:BB:34                                 ', CAST(0x283C0B00 AS Date), CAST(0x0000A6CD0001E078 AS DateTime), 4279, 12, CAST(0x0000A6CD00BC68DA AS DateTime), CAST(0x0000A6CD011D5851 AS DateTime))
SET IDENTITY_INSERT [dbo].[KeyCount] OFF
/****** Object:  UserDefinedFunction [dbo].[FUN_GETDATESTR]    Script Date: 11/29/2016 19:18:07 ******/
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
/****** Object:  UserDefinedFunction [dbo].[FUN_CURGETDATESTR]    Script Date: 11/29/2016 19:18:07 ******/
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
/****** Object:  Table [dbo].[Daily]    Script Date: 11/29/2016 19:18:07 ******/
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
SET IDENTITY_INSERT [dbo].[Daily] ON
INSERT [dbo].[Daily] ([Id], [UserId], [DailyDate], [Title], [Summary], [CreateTime], [UpdateTime]) VALUES (1, 12, CAST(0xE13B0B00 AS Date), N'Linux 系统目录结构', N'test', CAST(0x0000A68B00FB574F AS DateTime), CAST(0x0000A68B00FB574F AS DateTime))
INSERT [dbo].[Daily] ([Id], [UserId], [DailyDate], [Title], [Summary], [CreateTime], [UpdateTime]) VALUES (2, 12, CAST(0xE23B0B00 AS Date), N'Linux 远程登录', N'test', CAST(0x0000A68B00FB574F AS DateTime), CAST(0x0000A68B00FB574F AS DateTime))
INSERT [dbo].[Daily] ([Id], [UserId], [DailyDate], [Title], [Summary], [CreateTime], [UpdateTime]) VALUES (3, 12, CAST(0xE33B0B00 AS Date), N'Linux 忘记密码解决方法Linux 忘记密码解决方法Linux 忘记密码解决方法', N'阿斯顿发生大法撒旦发撒旦发上的', CAST(0x0000A68B00FB574F AS DateTime), CAST(0x0000A69100B2B840 AS DateTime))
INSERT [dbo].[Daily] ([Id], [UserId], [DailyDate], [Title], [Summary], [CreateTime], [UpdateTime]) VALUES (4, 12, CAST(0xE43B0B00 AS Date), N'重启linux系统', N'test', CAST(0x0000A68B00FB574F AS DateTime), CAST(0x0000A68B00FB574F AS DateTime))
INSERT [dbo].[Daily] ([Id], [UserId], [DailyDate], [Title], [Summary], [CreateTime], [UpdateTime]) VALUES (5, 12, CAST(0xE53B0B00 AS Date), N'系统已经挂载到了/mnt/sysimage中。', N'test', CAST(0x0000A68B00FB574F AS DateTime), CAST(0x0000A68B00FB574F AS DateTime))
INSERT [dbo].[Daily] ([Id], [UserId], [DailyDate], [Title], [Summary], [CreateTime], [UpdateTime]) VALUES (6, 12, CAST(0xE63B0B00 AS Date), N'Linux 忘记密码解决方法', N'test', CAST(0x0000A68B00FB574F AS DateTime), CAST(0x0000A68B00FB574F AS DateTime))
INSERT [dbo].[Daily] ([Id], [UserId], [DailyDate], [Title], [Summary], [CreateTime], [UpdateTime]) VALUES (7, 12, CAST(0xE03B0B00 AS Date), N'其实也可以到rescue模式下更改root的密码的', N'飞洒副是大法师大法撒旦的发撒旦发撒旦发上的啊撒旦发撒旦发士大夫撒旦发撒旦发上的撒旦发撒旦发上的', CAST(0x0000A68B00FB574F AS DateTime), CAST(0x0000A69100B2AA7E AS DateTime))
INSERT [dbo].[Daily] ([Id], [UserId], [DailyDate], [Title], [Summary], [CreateTime], [UpdateTime]) VALUES (8, 12, CAST(0xDF3B0B00 AS Date), N'Linux 忘记密码解决方法', N'所发生的看了凤姐啊收到了；放假啊收到了发生的房间阿斯顿离开房间阿斯顿离开房间阿斯顿良凤江阿斯顿老库附近阿斯顿离开房间拉萨打开附近阿斯利康东方骏啊数量的开始里卡多房间里刷卡', CAST(0x0000A68B00FB574F AS DateTime), CAST(0x0000A68D013F3410 AS DateTime))
INSERT [dbo].[Daily] ([Id], [UserId], [DailyDate], [Title], [Summary], [CreateTime], [UpdateTime]) VALUES (9, 12, CAST(0xE63B0B00 AS Date), N'撒旦发撒旦发士大夫', N'撒旦发撒旦发撒旦发', CAST(0x0000A68B013CCE8B AS DateTime), CAST(0x0000A68B013CCE8B AS DateTime))
INSERT [dbo].[Daily] ([Id], [UserId], [DailyDate], [Title], [Summary], [CreateTime], [UpdateTime]) VALUES (10, 12, CAST(0xDE3B0B00 AS Date), N'国付笛声高飞狗', N'广东省东莞市风格', CAST(0x0000A68C00BB44A3 AS DateTime), CAST(0x0000A68C00BB44A3 AS DateTime))
INSERT [dbo].[Daily] ([Id], [UserId], [DailyDate], [Title], [Summary], [CreateTime], [UpdateTime]) VALUES (11, 12, CAST(0xE73B0B00 AS Date), N'其实也可以到rescue模式下更改root的密码的', N'test撒旦发的撒发撒旦发撒旦发撒旦发撒旦发士大夫撒旦发撒旦发但是发生的风声大
是大法师大法是的', CAST(0x0000A68C0166FC74 AS DateTime), CAST(0x0000A68C0166FC74 AS DateTime))
INSERT [dbo].[Daily] ([Id], [UserId], [DailyDate], [Title], [Summary], [CreateTime], [UpdateTime]) VALUES (12, 12, CAST(0xE83B0B00 AS Date), N'哈哈哈哈', N'哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈发的事发生哈哈哈哈哈哈哈哈哈哈哈', CAST(0x0000A68D01414D20 AS DateTime), CAST(0x0000A68D0151E423 AS DateTime))
SET IDENTITY_INSERT [dbo].[Daily] OFF
/****** Object:  Table [dbo].[Administrators]    Script Date: 11/29/2016 19:18:07 ******/
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
SET IDENTITY_INSERT [dbo].[Administrators] ON
INSERT [dbo].[Administrators] ([AdministratorID], [Accounts], [Password], [LoginIP], [LoginTime], [CreateTime]) VALUES (4, N'ADMIN', N'jZae727K08KaOmKSgOaGzww/XVqGr/PKEgIMkjrcbJI=', N'::1', CAST(0x0000A5EF00C56C85 AS DateTime), CAST(0x0000A5EF00000000 AS DateTime))
SET IDENTITY_INSERT [dbo].[Administrators] OFF
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 11/29/2016 19:18:07 ******/
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
/****** Object:  Table [dbo].[Weekly]    Script Date: 11/29/2016 19:18:07 ******/
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
SET IDENTITY_INSERT [dbo].[Weekly] ON
INSERT [dbo].[Weekly] ([Id], [UserId], [WeekDate], [Title], [Summary], [CreateTime], [UpdateTime]) VALUES (1, 12, CAST(0xEC3B0B00 AS Date), N'qwert', N'qwert', CAST(0x0000A69100FCA832 AS DateTime), CAST(0x0000A69100FCA832 AS DateTime))
INSERT [dbo].[Weekly] ([Id], [UserId], [WeekDate], [Title], [Summary], [CreateTime], [UpdateTime]) VALUES (2, 12, CAST(0xE43B0B00 AS Date), N'asdff', N'qwert', CAST(0x0000A69100FCA832 AS DateTime), CAST(0x0000A69100FCA832 AS DateTime))
INSERT [dbo].[Weekly] ([Id], [UserId], [WeekDate], [Title], [Summary], [CreateTime], [UpdateTime]) VALUES (3, 12, CAST(0xDE3B0B00 AS Date), N'zxcvzxc', N'qwert', CAST(0x0000A69100FCA832 AS DateTime), CAST(0x0000A69100FCA832 AS DateTime))
INSERT [dbo].[Weekly] ([Id], [UserId], [WeekDate], [Title], [Summary], [CreateTime], [UpdateTime]) VALUES (4, 12, CAST(0xD63B0B00 AS Date), N'tyuryu', N'qwert', CAST(0x0000A69100FCA832 AS DateTime), CAST(0x0000A69100FCA832 AS DateTime))
INSERT [dbo].[Weekly] ([Id], [UserId], [WeekDate], [Title], [Summary], [CreateTime], [UpdateTime]) VALUES (5, 12, CAST(0xCF3B0B00 AS Date), N'khjggh', N'qwert', CAST(0x0000A69100FCA832 AS DateTime), CAST(0x0000A69100FCA832 AS DateTime))
SET IDENTITY_INSERT [dbo].[Weekly] OFF
/****** Object:  View [dbo].[VIEW_UserPlan]    Script Date: 11/29/2016 19:18:07 ******/
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
/****** Object:  Table [dbo].[Users]    Script Date: 11/29/2016 19:18:07 ******/
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
SET IDENTITY_INSERT [dbo].[Users] ON
INSERT [dbo].[Users] ([UserID], [RoleID], [UserName], [Name], [Sex], [PassWord], [Email], [LastLoginTime], [LastLoginIP], [RegTime]) VALUES (2, 1, N'1234', N'1234', 1, N'e10adc3949ba59abbe56e057f20f883e', N'1234', CAST(0x0000A5EF00000000 AS DateTime), N'::1', CAST(0x0000A5EF00000000 AS DateTime))
INSERT [dbo].[Users] ([UserID], [RoleID], [UserName], [Name], [Sex], [PassWord], [Email], [LastLoginTime], [LastLoginIP], [RegTime]) VALUES (7, 1, N'admin123', N'123', 0, N'e10adc3949ba59abbe56e057f20f883e', N'hpwtaun@foxmail.com', NULL, NULL, CAST(0x0000A5EF011F9BDF AS DateTime))
INSERT [dbo].[Users] ([UserID], [RoleID], [UserName], [Name], [Sex], [PassWord], [Email], [LastLoginTime], [LastLoginIP], [RegTime]) VALUES (8, 2, N'admin123456', N'123', 0, N'e10adc3949ba59abbe56e057f20f883e', N'hpwtaun@foxmail.com', NULL, NULL, CAST(0x0000A5EF011FE016 AS DateTime))
INSERT [dbo].[Users] ([UserID], [RoleID], [UserName], [Name], [Sex], [PassWord], [Email], [LastLoginTime], [LastLoginIP], [RegTime]) VALUES (12, 1, N'Bruce', N'张思安Bruce', 1, N'e10adc3949ba59abbe56e057f20f883e', N'sadfsda', NULL, NULL, CAST(0x0000A68800000000 AS DateTime))
SET IDENTITY_INSERT [dbo].[Users] OFF
/****** Object:  Default [DF_testTable_UserId]    Script Date: 11/29/2016 19:18:06 ******/
ALTER TABLE [dbo].[UserPlan] ADD  CONSTRAINT [DF_testTable_UserId]  DEFAULT ((1)) FOR [UserId]
GO
/****** Object:  Default [DF_Plans_Importance]    Script Date: 11/29/2016 19:18:06 ******/
ALTER TABLE [dbo].[UserPlan] ADD  CONSTRAINT [DF_Plans_Importance]  DEFAULT ((1)) FOR [Importance]
GO
/****** Object:  Default [DF_testTable_IsRemind]    Script Date: 11/29/2016 19:18:06 ******/
ALTER TABLE [dbo].[UserPlan] ADD  CONSTRAINT [DF_testTable_IsRemind]  DEFAULT ((1)) FOR [IsRemind]
GO
/****** Object:  Default [DF_testTable_PerRemind]    Script Date: 11/29/2016 19:18:06 ******/
ALTER TABLE [dbo].[UserPlan] ADD  CONSTRAINT [DF_testTable_PerRemind]  DEFAULT ((1)) FOR [PerRemind]
GO
/****** Object:  Default [DF_testTable_perRemindTime]    Script Date: 11/29/2016 19:18:06 ******/
ALTER TABLE [dbo].[UserPlan] ADD  CONSTRAINT [DF_testTable_perRemindTime]  DEFAULT ((10)) FOR [perRemindTime]
GO
/****** Object:  Default [DF_testTable_CreateTime]    Script Date: 11/29/2016 19:18:06 ******/
ALTER TABLE [dbo].[UserPlan] ADD  CONSTRAINT [DF_testTable_CreateTime]  DEFAULT (getdate()) FOR [CreateTime]
GO
/****** Object:  Default [DF_Plans_UpdateTime]    Script Date: 11/29/2016 19:18:06 ******/
ALTER TABLE [dbo].[UserPlan] ADD  CONSTRAINT [DF_Plans_UpdateTime]  DEFAULT (getdate()) FOR [UpdateTime]
GO
/****** Object:  Default [DF__PlanResul__Resul__31EC6D26]    Script Date: 11/29/2016 19:18:06 ******/
ALTER TABLE [dbo].[PlanResult] ADD  CONSTRAINT [DF__PlanResul__Resul__31EC6D26]  DEFAULT ((1)) FOR [Result]
GO
/****** Object:  Default [DF_Note_CreateTime]    Script Date: 11/29/2016 19:18:06 ******/
ALTER TABLE [dbo].[Note] ADD  CONSTRAINT [DF_Note_CreateTime]  DEFAULT (getdate()) FOR [CreateTime]
GO
/****** Object:  Default [DF_Note_UdateTime]    Script Date: 11/29/2016 19:18:06 ******/
ALTER TABLE [dbo].[Note] ADD  CONSTRAINT [DF_Note_UdateTime]  DEFAULT (getdate()) FOR [UpdateTime]
GO
/****** Object:  Default [DF_Leet_Answer_Status]    Script Date: 11/29/2016 19:18:06 ******/
ALTER TABLE [dbo].[Leet_Answer] ADD  CONSTRAINT [DF_Leet_Answer_Status]  DEFAULT ((1)) FOR [Status]
GO
/****** Object:  Default [DF_Leet_Answer_CreateTime]    Script Date: 11/29/2016 19:18:06 ******/
ALTER TABLE [dbo].[Leet_Answer] ADD  CONSTRAINT [DF_Leet_Answer_CreateTime]  DEFAULT (getdate()) FOR [CreateTime]
GO
/****** Object:  Default [DF_Leet_Answer_UpdateTime]    Script Date: 11/29/2016 19:18:06 ******/
ALTER TABLE [dbo].[Leet_Answer] ADD  CONSTRAINT [DF_Leet_Answer_UpdateTime]  DEFAULT (getdate()) FOR [UpdateTime]
GO
/****** Object:  Default [DF_KeyCount_WorkId]    Script Date: 11/29/2016 19:18:06 ******/
ALTER TABLE [dbo].[KeyCount] ADD  CONSTRAINT [DF_KeyCount_WorkId]  DEFAULT ('') FOR [WorkId]
GO
/****** Object:  Default [DF_KeyCount_MacAddr]    Script Date: 11/29/2016 19:18:06 ******/
ALTER TABLE [dbo].[KeyCount] ADD  CONSTRAINT [DF_KeyCount_MacAddr]  DEFAULT ('') FOR [MacAddr]
GO
/****** Object:  Default [DF_KeyCount_AddTime]    Script Date: 11/29/2016 19:18:06 ******/
ALTER TABLE [dbo].[KeyCount] ADD  CONSTRAINT [DF_KeyCount_AddTime]  DEFAULT (getdate()) FOR [AddTime]
GO
/****** Object:  Default [DF_KeyCount_UpdateTime]    Script Date: 11/29/2016 19:18:06 ******/
ALTER TABLE [dbo].[KeyCount] ADD  CONSTRAINT [DF_KeyCount_UpdateTime]  DEFAULT (getdate()) FOR [UpdateTime]
GO
/****** Object:  Default [DF_Daily_DailyDate]    Script Date: 11/29/2016 19:18:07 ******/
ALTER TABLE [dbo].[Daily] ADD  CONSTRAINT [DF_Daily_DailyDate]  DEFAULT (getdate()) FOR [DailyDate]
GO
/****** Object:  Default [DF_Daily_CreateTime]    Script Date: 11/29/2016 19:18:07 ******/
ALTER TABLE [dbo].[Daily] ADD  CONSTRAINT [DF_Daily_CreateTime]  DEFAULT (getdate()) FOR [CreateTime]
GO
/****** Object:  Default [DF_Daily_UpdateTime]    Script Date: 11/29/2016 19:18:07 ******/
ALTER TABLE [dbo].[Daily] ADD  CONSTRAINT [DF_Daily_UpdateTime]  DEFAULT (getdate()) FOR [UpdateTime]
GO
/****** Object:  Default [DF_Weekly_WeekDate]    Script Date: 11/29/2016 19:18:07 ******/
ALTER TABLE [dbo].[Weekly] ADD  CONSTRAINT [DF_Weekly_WeekDate]  DEFAULT (getdate()) FOR [WeekDate]
GO
/****** Object:  Default [DF_Weekly_CreateTime]    Script Date: 11/29/2016 19:18:07 ******/
ALTER TABLE [dbo].[Weekly] ADD  CONSTRAINT [DF_Weekly_CreateTime]  DEFAULT (getdate()) FOR [CreateTime]
GO
/****** Object:  Default [DF_Weekly_UpdateTime]    Script Date: 11/29/2016 19:18:07 ******/
ALTER TABLE [dbo].[Weekly] ADD  CONSTRAINT [DF_Weekly_UpdateTime]  DEFAULT (getdate()) FOR [UpdateTime]
GO
/****** Object:  ForeignKey [FK_dbo.Users_dbo.Roles_RoleID]    Script Date: 11/29/2016 19:18:07 ******/
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Users_dbo.Roles_RoleID] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Roles] ([RoleID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_dbo.Users_dbo.Roles_RoleID]
GO
