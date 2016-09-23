

CREATE TABLE [dbo].[PlanResult](
	[Id] [INT] IDENTITY(1,1) NOT NULL,
	[PlanId] [INT] NOT NULL,
	[Result] [INT] NOT NULL,
	[Summary] [NTEXT] NULL,
 CONSTRAINT [PK__PlanResu__3214EC07300424B4] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

ALTER TABLE [dbo].[PlanResult] ADD  CONSTRAINT [DF__PlanResul__Resul__31EC6D26]  DEFAULT ((1)) FOR [Result]
GO



---------------------------------------------

CREATE TABLE [dbo].[Roles](
	[RoleID] [INT] IDENTITY(1,1) NOT NULL,
	[Name] [NVARCHAR](20) NOT NULL,
	[Description] [NVARCHAR](1000) NULL,
 CONSTRAINT [PK_dbo.Roles] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


--------------------------------------------------




CREATE TABLE [dbo].[UserPlan](
	[Id] [INT] IDENTITY(1,1) NOT NULL,
	[UserId] [INT] NOT NULL,
	[Importance] [INT] NOT NULL,
	[Tag] [VARCHAR](50) NOT NULL,
	[Detail] [VARCHAR](500) NOT NULL,
	[IsRemind] [BIT] NOT NULL,
	[PerRemind] [BIT] NOT NULL,
	[perRemindTime] [INT] NOT NULL,
	[HappenTime] [DATETIME] NOT NULL,
	[UseTime] [INT] NOT NULL,
	[CreateTime] [DATETIME] NOT NULL,
	[UpdateTime] [DATETIME] NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[UserPlan] ADD  CONSTRAINT [DF_testTable_UserId]  DEFAULT ((1)) FOR [UserId]
GO

ALTER TABLE [dbo].[UserPlan] ADD  CONSTRAINT [DF_Plans_Importance]  DEFAULT ((1)) FOR [Importance]
GO

ALTER TABLE [dbo].[UserPlan] ADD  CONSTRAINT [DF_testTable_IsRemind]  DEFAULT ((1)) FOR [IsRemind]
GO

ALTER TABLE [dbo].[UserPlan] ADD  CONSTRAINT [DF_testTable_PerRemind]  DEFAULT ((1)) FOR [PerRemind]
GO

ALTER TABLE [dbo].[UserPlan] ADD  CONSTRAINT [DF_testTable_perRemindTime]  DEFAULT ((10)) FOR [perRemindTime]
GO

ALTER TABLE [dbo].[UserPlan] ADD  CONSTRAINT [DF_testTable_CreateTime]  DEFAULT (GETDATE()) FOR [CreateTime]
GO

ALTER TABLE [dbo].[UserPlan] ADD  CONSTRAINT [DF_Plans_UpdateTime]  DEFAULT (GETDATE()) FOR [UpdateTime]
GO







--------------------------------------------------



CREATE TABLE [dbo].[Users](
	[UserID] [INT] IDENTITY(1,1) NOT NULL,
	[RoleID] [INT] NOT NULL,
	[UserName] [NVARCHAR](50) NULL,
	[Name] [NVARCHAR](20) NULL,
	[Sex] [INT] NOT NULL,
	[PassWord] [NVARCHAR](256) NULL,
	[Email] [NVARCHAR](50) NULL,
	[LastLoginTime] [DATETIME] NULL,
	[LastLoginIP] [NVARCHAR](MAX) NULL,
	[RegTime] [DATETIME] NOT NULL,
 CONSTRAINT [PK_dbo.Users] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Users_dbo.Roles_RoleID] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Roles] ([RoleID])
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_dbo.Users_dbo.Roles_RoleID]
GO


---------------------------------------------



CREATE TABLE [dbo].[Note](
	[Id] [INT] IDENTITY(1,1) NOT NULL,
	[UserId] [INT] NOT NULL,
	[Note] [NTEXT] NOT NULL,
	[CreateTime] [DATETIME] NOT NULL,
	[UdateTime] [DATETIME] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

ALTER TABLE [dbo].[Note] ADD  CONSTRAINT [DF_Note_CreateTime]  DEFAULT (GETDATE()) FOR [CreateTime]
GO

ALTER TABLE [dbo].[Note] ADD  CONSTRAINT [DF_Note_UdateTime]  DEFAULT (GETDATE()) FOR [UdateTime]
GO






----------------------------------------------



CREATE TABLE [dbo].[Weekly](
	[Id] [INT] IDENTITY(1,1) NOT NULL,
	[UserId] [INT] NOT NULL,
	[WeekDate] [DATE] NOT NULL,
	[Summary] [NTEXT] NOT NULL,
	[CreateTime] [DATETIME] NOT NULL,
	[UpdateTime] [DATETIME] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

ALTER TABLE [dbo].[Weekly] ADD  CONSTRAINT [DF_Weekly_WeekDate]  DEFAULT (GETDATE()) FOR [WeekDate]
GO

ALTER TABLE [dbo].[Weekly] ADD  CONSTRAINT [DF_Weekly_CreateTime]  DEFAULT (GETDATE()) FOR [CreateTime]
GO

ALTER TABLE [dbo].[Weekly] ADD  CONSTRAINT [DF_Weekly_UpdateTime]  DEFAULT (GETDATE()) FOR [UpdateTime]
GO




