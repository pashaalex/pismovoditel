CREATE TABLE [dbo].[Status](
	[StatusId] [int] IDENTITY(1,1) NOT NULL,
	[StatusName] [nvarchar](50) NULL,
	[IsTerminal] [bit] NOT NULL,
	[IsInitial] [bit] NOT NULL,
 CONSTRAINT [PK_Status] PRIMARY KEY CLUSTERED 
(
	[StatusId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Status] ON
INSERT [dbo].[Status] ([StatusId], [StatusName], [IsTerminal], [IsInitial]) VALUES (1, N'Зарегистрирована', 0, 1)
INSERT [dbo].[Status] ([StatusId], [StatusName], [IsTerminal], [IsInitial]) VALUES (2, N'В обработке', 0, 0)
INSERT [dbo].[Status] ([StatusId], [StatusName], [IsTerminal], [IsInitial]) VALUES (4, N'Выполнена', 1, 0)
INSERT [dbo].[Status] ([StatusId], [StatusName], [IsTerminal], [IsInitial]) VALUES (5, N'Требуется согласование', 0, 0)
INSERT [dbo].[Status] ([StatusId], [StatusName], [IsTerminal], [IsInitial]) VALUES (6, N'Отменена', 1, 0)
INSERT [dbo].[Status] ([StatusId], [StatusName], [IsTerminal], [IsInitial]) VALUES (7, N'Закрыта', 1, 0)
SET IDENTITY_INSERT [dbo].[Status] OFF
/****** Object:  Table [dbo].[TaskEventLog]    Script Date: 05/15/2022 13:45:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TaskEventLog](
	[LogId] [int] IDENTITY(1,1) NOT NULL,
	[ChangeTime] [datetime] NOT NULL,
	[ActorId] [int] NOT NULL,
	[TaskId] [int] NOT NULL,
	[EventTypeId] [int] NOT NULL,
	[Date1] [datetime] NULL,
	[Date2] [datetime] NULL,
	[Int1] [int] NULL,
	[Int2] [int] NULL,
	[string1] [nvarchar](max) NULL,
	[string2] [nvarchar](max) NULL,
 CONSTRAINT [PK_TaskEventLog] PRIMARY KEY CLUSTERED 
(
	[LogId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[TaskEventLog] ON
INSERT [dbo].[TaskEventLog] ([LogId], [ChangeTime], [ActorId], [TaskId], [EventTypeId], [Date1], [Date2], [Int1], [Int2], [string1], [string2]) VALUES (1, CAST(0x0000AE8B010A836B AS DateTime), 3, 1, 6, NULL, NULL, 3, 3, NULL, NULL)
INSERT [dbo].[TaskEventLog] ([LogId], [ChangeTime], [ActorId], [TaskId], [EventTypeId], [Date1], [Date2], [Int1], [Int2], [string1], [string2]) VALUES (2, CAST(0x0000AE8B010A8371 AS DateTime), 3, 1, 7, NULL, NULL, 1, 2, NULL, NULL)
INSERT [dbo].[TaskEventLog] ([LogId], [ChangeTime], [ActorId], [TaskId], [EventTypeId], [Date1], [Date2], [Int1], [Int2], [string1], [string2]) VALUES (3, CAST(0x0000AE8C00A3A3C4 AS DateTime), 3, 1, 5, NULL, CAST(0x0000AE8D00000000 AS DateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[TaskEventLog] ([LogId], [ChangeTime], [ActorId], [TaskId], [EventTypeId], [Date1], [Date2], [Int1], [Int2], [string1], [string2]) VALUES (4, CAST(0x0000AE8C00A8C31C AS DateTime), 3, 1, 1, NULL, NULL, 1, 2, NULL, NULL)
INSERT [dbo].[TaskEventLog] ([LogId], [ChangeTime], [ActorId], [TaskId], [EventTypeId], [Date1], [Date2], [Int1], [Int2], [string1], [string2]) VALUES (5, CAST(0x0000AE8C00A8C31D AS DateTime), 3, 1, 4, NULL, NULL, NULL, 3, NULL, NULL)
INSERT [dbo].[TaskEventLog] ([LogId], [ChangeTime], [ActorId], [TaskId], [EventTypeId], [Date1], [Date2], [Int1], [Int2], [string1], [string2]) VALUES (6, CAST(0x0000AE8C00A8C31D AS DateTime), 3, 1, 5, CAST(0x0000AE8D00000000 AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[TaskEventLog] ([LogId], [ChangeTime], [ActorId], [TaskId], [EventTypeId], [Date1], [Date2], [Int1], [Int2], [string1], [string2]) VALUES (7, CAST(0x0000AE8C00A8C31D AS DateTime), 3, 1, 6, NULL, NULL, 3, 2, NULL, NULL)
INSERT [dbo].[TaskEventLog] ([LogId], [ChangeTime], [ActorId], [TaskId], [EventTypeId], [Date1], [Date2], [Int1], [Int2], [string1], [string2]) VALUES (8, CAST(0x0000AE8C00A8C31D AS DateTime), 3, 1, 7, NULL, NULL, 4, 5, NULL, NULL)
INSERT [dbo].[TaskEventLog] ([LogId], [ChangeTime], [ActorId], [TaskId], [EventTypeId], [Date1], [Date2], [Int1], [Int2], [string1], [string2]) VALUES (9, CAST(0x0000AE8D00AA99D5 AS DateTime), 3, 1, 7, NULL, NULL, 2, 4, NULL, NULL)
INSERT [dbo].[TaskEventLog] ([LogId], [ChangeTime], [ActorId], [TaskId], [EventTypeId], [Date1], [Date2], [Int1], [Int2], [string1], [string2]) VALUES (10, CAST(0x0000AE8D00AB0884 AS DateTime), 3, 1, 7, NULL, NULL, 4, 5, NULL, NULL)
INSERT [dbo].[TaskEventLog] ([LogId], [ChangeTime], [ActorId], [TaskId], [EventTypeId], [Date1], [Date2], [Int1], [Int2], [string1], [string2]) VALUES (11, CAST(0x0000AE8D00AB6FFC AS DateTime), 3, 1, 8, NULL, NULL, 5, 4, NULL, NULL)
INSERT [dbo].[TaskEventLog] ([LogId], [ChangeTime], [ActorId], [TaskId], [EventTypeId], [Date1], [Date2], [Int1], [Int2], [string1], [string2]) VALUES (12, CAST(0x0000AE9300A31945 AS DateTime), 3, 1, 5, NULL, CAST(0x0000AE9400000000 AS DateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[TaskEventLog] ([LogId], [ChangeTime], [ActorId], [TaskId], [EventTypeId], [Date1], [Date2], [Int1], [Int2], [string1], [string2]) VALUES (13, CAST(0x0000AE9300A46A94 AS DateTime), 3, 1, 5, CAST(0x0000AE9400000000 AS DateTime), CAST(0x0000AE9B00000000 AS DateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[TaskEventLog] ([LogId], [ChangeTime], [ActorId], [TaskId], [EventTypeId], [Date1], [Date2], [Int1], [Int2], [string1], [string2]) VALUES (14, CAST(0x0000AE9300A476DF AS DateTime), 3, 1, 5, CAST(0x0000AE9B00000000 AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[TaskEventLog] ([LogId], [ChangeTime], [ActorId], [TaskId], [EventTypeId], [Date1], [Date2], [Int1], [Int2], [string1], [string2]) VALUES (15, CAST(0x0000AE9300A4E47F AS DateTime), 3, 1, 5, NULL, CAST(0x0000AE9400000000 AS DateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[TaskEventLog] ([LogId], [ChangeTime], [ActorId], [TaskId], [EventTypeId], [Date1], [Date2], [Int1], [Int2], [string1], [string2]) VALUES (16, CAST(0x0000AE9600CA04CF AS DateTime), 3, 3, 4, NULL, NULL, NULL, 3, NULL, NULL)
INSERT [dbo].[TaskEventLog] ([LogId], [ChangeTime], [ActorId], [TaskId], [EventTypeId], [Date1], [Date2], [Int1], [Int2], [string1], [string2]) VALUES (17, CAST(0x0000AE9600D67873 AS DateTime), 3, 2, 3, NULL, NULL, NULL, NULL, N'dddddddddd', N'dddddddddd')
INSERT [dbo].[TaskEventLog] ([LogId], [ChangeTime], [ActorId], [TaskId], [EventTypeId], [Date1], [Date2], [Int1], [Int2], [string1], [string2]) VALUES (18, CAST(0x0000AE9600D67873 AS DateTime), 3, 2, 4, NULL, NULL, NULL, 3, NULL, NULL)
INSERT [dbo].[TaskEventLog] ([LogId], [ChangeTime], [ActorId], [TaskId], [EventTypeId], [Date1], [Date2], [Int1], [Int2], [string1], [string2]) VALUES (19, CAST(0x0000AE9600DB611F AS DateTime), 3, 3, 1, NULL, NULL, 1, 2, NULL, NULL)
INSERT [dbo].[TaskEventLog] ([LogId], [ChangeTime], [ActorId], [TaskId], [EventTypeId], [Date1], [Date2], [Int1], [Int2], [string1], [string2]) VALUES (20, CAST(0x0000AE9600DB6120 AS DateTime), 3, 3, 4, NULL, NULL, 3, NULL, NULL, NULL)
INSERT [dbo].[TaskEventLog] ([LogId], [ChangeTime], [ActorId], [TaskId], [EventTypeId], [Date1], [Date2], [Int1], [Int2], [string1], [string2]) VALUES (21, CAST(0x0000AE9600DBBFB8 AS DateTime), 3, 3, 4, NULL, NULL, NULL, 5, NULL, NULL)
INSERT [dbo].[TaskEventLog] ([LogId], [ChangeTime], [ActorId], [TaskId], [EventTypeId], [Date1], [Date2], [Int1], [Int2], [string1], [string2]) VALUES (22, CAST(0x0000AE9600DBC78B AS DateTime), 3, 3, 4, NULL, NULL, 5, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[TaskEventLog] OFF
/****** Object:  Table [dbo].[Workspace]    Script Date: 05/15/2022 13:45:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Workspace](
	[WorkspaceId] [int] IDENTITY(1,1) NOT NULL,
	[WorkspaceShortName] [nvarchar](50) NOT NULL,
	[WorkspaceName] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Workspace] PRIMARY KEY CLUSTERED 
(
	[WorkspaceId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Workspace] ON
INSERT [dbo].[Workspace] ([WorkspaceId], [WorkspaceShortName], [WorkspaceName]) VALUES (1, N'Default', N'Пространство по-умолчанию')
SET IDENTITY_INSERT [dbo].[Workspace] OFF
/****** Object:  Table [dbo].[User]    Script Date: 05/15/2022 13:45:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[User](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[Login] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[FIO] [nvarchar](max) NOT NULL,
	[PasswordMD5] [varchar](50) NOT NULL,
	[EmailConfirmGUID] [uniqueidentifier] NOT NULL,
	[RegistredTime] [datetime] NULL,
	[ConfirmationSendTime] [datetime] NULL,
	[WorkspaceId] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[IsWorkspaceAdmin] [bit] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON
INSERT [dbo].[User] ([UserId], [Login], [Email], [FIO], [PasswordMD5], [EmailConfirmGUID], [RegistredTime], [ConfirmationSendTime], [WorkspaceId], [IsActive], [IsWorkspaceAdmin]) VALUES (3, N'Admin', N'admin@site.com', N'Админ Даминович', N'5177657274793131', N'f5aa0fb7-884d-4835-a7aa-9b9715b023a7', CAST(0x0000AE8500000000 AS DateTime), NULL, 1, 1, 1)
INSERT [dbo].[User] ([UserId], [Login], [Email], [FIO], [PasswordMD5], [EmailConfirmGUID], [RegistredTime], [ConfirmationSendTime], [WorkspaceId], [IsActive], [IsWorkspaceAdmin]) VALUES (5, N'User', N'user2@site.com', N'Обычный Пользователь', N'313131', N'00000000-0000-0000-0000-000000000000', NULL, NULL, 1, 1, 1)
SET IDENTITY_INSERT [dbo].[User] OFF
/****** Object:  Table [dbo].[TaskType]    Script Date: 05/15/2022 13:45:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TaskType](
	[TaskTypeId] [int] IDENTITY(1,1) NOT NULL,
	[TaskTypeName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_TaskType] PRIMARY KEY CLUSTERED 
(
	[TaskTypeId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[TaskType] ON
INSERT [dbo].[TaskType] ([TaskTypeId], [TaskTypeName]) VALUES (1, N'Задание')
INSERT [dbo].[TaskType] ([TaskTypeId], [TaskTypeName]) VALUES (2, N'Ошибка')
INSERT [dbo].[TaskType] ([TaskTypeId], [TaskTypeName]) VALUES (3, N'Анализ')
INSERT [dbo].[TaskType] ([TaskTypeId], [TaskTypeName]) VALUES (4, N'Эпик')
SET IDENTITY_INSERT [dbo].[TaskType] OFF
/****** Object:  Table [dbo].[Priority]    Script Date: 05/15/2022 13:45:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Priority](
	[PriorityId] [int] IDENTITY(1,1) NOT NULL,
	[PriorityName] [nvarchar](50) NOT NULL,
	[IsDefault] [bit] NOT NULL,
 CONSTRAINT [PK_Priority] PRIMARY KEY CLUSTERED 
(
	[PriorityId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Priority] ON
INSERT [dbo].[Priority] ([PriorityId], [PriorityName], [IsDefault]) VALUES (1, N'Неотложная', 0)
INSERT [dbo].[Priority] ([PriorityId], [PriorityName], [IsDefault]) VALUES (2, N'Критическая', 0)
INSERT [dbo].[Priority] ([PriorityId], [PriorityName], [IsDefault]) VALUES (3, N'Серьезная', 0)
INSERT [dbo].[Priority] ([PriorityId], [PriorityName], [IsDefault]) VALUES (4, N'Обычная', 1)
INSERT [dbo].[Priority] ([PriorityId], [PriorityName], [IsDefault]) VALUES (5, N'Незначительная', 0)
INSERT [dbo].[Priority] ([PriorityId], [PriorityName], [IsDefault]) VALUES (6, N'Перспективная', 0)
SET IDENTITY_INSERT [dbo].[Priority] OFF
/****** Object:  Table [dbo].[Project]    Script Date: 05/15/2022 13:45:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Project](
	[ProjectId] [int] IDENTITY(1,1) NOT NULL,
	[ProjectShortName] [nvarchar](50) NOT NULL,
	[ProjectName] [nvarchar](max) NOT NULL,
	[WorkspaceId] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Project] PRIMARY KEY CLUSTERED 
(
	[ProjectId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Project] ON
INSERT [dbo].[Project] ([ProjectId], [ProjectShortName], [ProjectName], [WorkspaceId], [IsActive]) VALUES (1, N'DEF', N'Default project', 1, 1)
INSERT [dbo].[Project] ([ProjectId], [ProjectShortName], [ProjectName], [WorkspaceId], [IsActive]) VALUES (2, N'New1', N'Новый проект', 1, 1)
SET IDENTITY_INSERT [dbo].[Project] OFF
/****** Object:  Table [dbo].[Task]    Script Date: 05/15/2022 13:45:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Task](
	[TaskId] [int] IDENTITY(1,1) NOT NULL,
	[ProjectId] [int] NOT NULL,
	[TaskName] [nvarchar](max) NULL,
	[TaskBody] [nvarchar](max) NULL,
	[TaskCreatorId] [int] NOT NULL,
	[TaskExecutorId] [int] NULL,
	[CreateDate] [datetime] NULL,
	[TillDate] [datetime] NULL,
	[TaskTypeId] [int] NOT NULL,
	[PriorityId] [int] NULL,
	[StatusId] [int] NULL,
	[UpdateDate] [datetime] NULL,
 CONSTRAINT [PK_Task] PRIMARY KEY CLUSTERED 
(
	[TaskId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Task] ON
INSERT [dbo].[Task] ([TaskId], [ProjectId], [TaskName], [TaskBody], [TaskCreatorId], [TaskExecutorId], [CreateDate], [TillDate], [TaskTypeId], [PriorityId], [StatusId], [UpdateDate]) VALUES (1, 2, N'TestTask1', N'<p>task body <strong>11111</strong></p>
<p><strong>task body 11111</strong></p>
<p><strong>task body 11111</strong></p>
<p><strong>task body 11111</strong></p>
<p><strong>task body 11111</strong></p>
<p><strong>task body 11111</strong></p>
<p><strong>task body 11111</strong></p>
<p><strong>task body 11111</strong></p>
<p><strong>task body 11111</strong></p>
<p><strong>task body 11111</strong></p>', 3, 3, CAST(0x0000AE86013A88DA AS DateTime), CAST(0x0000AE9400000000 AS DateTime), 2, 5, 4, CAST(0x0000AE9300A4E483 AS DateTime))
INSERT [dbo].[Task] ([TaskId], [ProjectId], [TaskName], [TaskBody], [TaskCreatorId], [TaskExecutorId], [CreateDate], [TillDate], [TaskTypeId], [PriorityId], [StatusId], [UpdateDate]) VALUES (2, 1, N'dddddddddd', N'<p>aaaaaaaaaa</p>', 3, 3, CAST(0x0000AE86013C5452 AS DateTime), NULL, 1, 1, 1, CAST(0x0000AE9600D6787A AS DateTime))
INSERT [dbo].[Task] ([TaskId], [ProjectId], [TaskName], [TaskBody], [TaskCreatorId], [TaskExecutorId], [CreateDate], [TillDate], [TaskTypeId], [PriorityId], [StatusId], [UpdateDate]) VALUES (3, 2, N'44444', N'5555555555', 3, NULL, CAST(0x0000AE86014260C2 AS DateTime), CAST(0x0000AE8700000000 AS DateTime), 1, 1, 1, CAST(0x0000AE9600DBC78E AS DateTime))
SET IDENTITY_INSERT [dbo].[Task] OFF
/****** Object:  Table [dbo].[ProjectUser]    Script Date: 05/15/2022 13:45:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProjectUser](
	[ProjectId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[IsOwner] [bit] NOT NULL,
	[IsTeam] [bit] NOT NULL,
	[IsObserver] [bit] NOT NULL,
 CONSTRAINT [PK_ProjectUser] PRIMARY KEY CLUSTERED 
(
	[ProjectId] ASC,
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[ProjectUser] ([ProjectId], [UserId], [IsOwner], [IsTeam], [IsObserver]) VALUES (1, 3, 1, 1, 1)
INSERT [dbo].[ProjectUser] ([ProjectId], [UserId], [IsOwner], [IsTeam], [IsObserver]) VALUES (2, 3, 1, 1, 0)
INSERT [dbo].[ProjectUser] ([ProjectId], [UserId], [IsOwner], [IsTeam], [IsObserver]) VALUES (2, 5, 1, 1, 0)
/****** Object:  Table [dbo].[TaskLog]    Script Date: 05/15/2022 13:45:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TaskLog](
	[LogId] [int] IDENTITY(1,1) NOT NULL,
	[ChangeTime] [datetime] NOT NULL,
	[ActorId] [int] NULL,
	[TaskId] [int] NOT NULL,
	[ProjectId] [int] NOT NULL,
	[TaskName] [nvarchar](max) NULL,
	[TaskBody] [nvarchar](max) NULL,
	[TaskExecutorId] [int] NULL,
	[TillDate] [datetime] NULL,
	[TaskTypeId] [int] NOT NULL,
	[PriorityId] [int] NULL,
	[StatusId] [int] NULL,
 CONSTRAINT [PK_TaskLog] PRIMARY KEY CLUSTERED 
(
	[LogId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[TaskLog] ON
INSERT [dbo].[TaskLog] ([LogId], [ChangeTime], [ActorId], [TaskId], [ProjectId], [TaskName], [TaskBody], [TaskExecutorId], [TillDate], [TaskTypeId], [PriorityId], [StatusId]) VALUES (1, CAST(0x0000AE8901467EAA AS DateTime), 3, 0, 1, N'TestTask1', N'<p>task body <strong>11111</strong></p>', NULL, NULL, 3, 4, 1)
INSERT [dbo].[TaskLog] ([LogId], [ChangeTime], [ActorId], [TaskId], [ProjectId], [TaskName], [TaskBody], [TaskExecutorId], [TillDate], [TaskTypeId], [PriorityId], [StatusId]) VALUES (2, CAST(0x0000AE8B00B38CC0 AS DateTime), 3, 0, 1, N'TestTask1', N'<p>task body <strong>11111</strong></p>
<p><strong>task body 11111</strong></p>
<p><strong>task body 11111</strong></p>
<p><strong>task body 11111</strong></p>
<p><strong>task body 11111</strong></p>
<p><strong>task body 11111</strong></p>
<p><strong>task body 11111</strong></p>
<p><strong>task body 11111</strong></p>
<p><strong>task body 11111</strong></p>
<p><strong>task body 11111</strong></p>', NULL, NULL, 3, 4, 1)
INSERT [dbo].[TaskLog] ([LogId], [ChangeTime], [ActorId], [TaskId], [ProjectId], [TaskName], [TaskBody], [TaskExecutorId], [TillDate], [TaskTypeId], [PriorityId], [StatusId]) VALUES (3, CAST(0x0000AE9300A4E485 AS DateTime), 3, 0, 2, N'TestTask1', N'<p>task body <strong>11111</strong></p>
<p><strong>task body 11111</strong></p>
<p><strong>task body 11111</strong></p>
<p><strong>task body 11111</strong></p>
<p><strong>task body 11111</strong></p>
<p><strong>task body 11111</strong></p>
<p><strong>task body 11111</strong></p>
<p><strong>task body 11111</strong></p>
<p><strong>task body 11111</strong></p>
<p><strong>task body 11111</strong></p>', 3, CAST(0x0000AE9400000000 AS DateTime), 2, 5, 4)
INSERT [dbo].[TaskLog] ([LogId], [ChangeTime], [ActorId], [TaskId], [ProjectId], [TaskName], [TaskBody], [TaskExecutorId], [TillDate], [TaskTypeId], [PriorityId], [StatusId]) VALUES (4, CAST(0x0000AE9600D6787C AS DateTime), 3, 0, 1, N'dddddddddd', N'<p>aaaaaaaaaa</p>', 3, NULL, 1, 1, 1)
SET IDENTITY_INSERT [dbo].[TaskLog] OFF
/****** Object:  Table [dbo].[Comment]    Script Date: 05/15/2022 13:45:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Comment](
	[CommentId] [int] IDENTITY(1,1) NOT NULL,
	[TaskId] [int] NOT NULL,
	[ActorId] [int] NOT NULL,
	[CommentText] [nvarchar](max) NOT NULL,
	[CreateTime] [datetime] NULL,
 CONSTRAINT [PK_Comment] PRIMARY KEY CLUSTERED 
(
	[CommentId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Comment] ON
INSERT [dbo].[Comment] ([CommentId], [TaskId], [ActorId], [CommentText], [CreateTime]) VALUES (2, 1, 3, N'asdasda', CAST(0x0000AE89014ED1FD AS DateTime))
INSERT [dbo].[Comment] ([CommentId], [TaskId], [ActorId], [CommentText], [CreateTime]) VALUES (3, 1, 3, N'ddddddddd', CAST(0x0000AE89014ED4EB AS DateTime))
INSERT [dbo].[Comment] ([CommentId], [TaskId], [ActorId], [CommentText], [CreateTime]) VALUES (4, 1, 3, N'11111111', CAST(0x0000AE89014ED8F8 AS DateTime))
INSERT [dbo].[Comment] ([CommentId], [TaskId], [ActorId], [CommentText], [CreateTime]) VALUES (5, 1, 3, N'<p>Форматированный <strong>Текст</strong></p>', CAST(0x0000AE8B00AD8742 AS DateTime))
INSERT [dbo].[Comment] ([CommentId], [TaskId], [ActorId], [CommentText], [CreateTime]) VALUES (6, 1, 3, N'<p>rthjryjtyguhju</p>', CAST(0x0000AE8B010BDBEA AS DateTime))
SET IDENTITY_INSERT [dbo].[Comment] OFF
/****** Object:  Default [DF_User_IsActive]    Script Date: 05/15/2022 13:45:07 ******/
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
/****** Object:  Default [DF_User_IsWorkspaceAdmin]    Script Date: 05/15/2022 13:45:07 ******/
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_IsWorkspaceAdmin]  DEFAULT ((1)) FOR [IsWorkspaceAdmin]
GO
/****** Object:  Default [DF_Priority_IsDefault]    Script Date: 05/15/2022 13:45:07 ******/
ALTER TABLE [dbo].[Priority] ADD  CONSTRAINT [DF_Priority_IsDefault]  DEFAULT ((0)) FOR [IsDefault]
GO
/****** Object:  Default [DF_Project_IsActive]    Script Date: 05/15/2022 13:45:07 ******/
ALTER TABLE [dbo].[Project] ADD  CONSTRAINT [DF_Project_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
/****** Object:  Default [DF_Task_UpdateDate]    Script Date: 05/15/2022 13:45:07 ******/
ALTER TABLE [dbo].[Task] ADD  CONSTRAINT [DF_Task_UpdateDate]  DEFAULT (getdate()) FOR [UpdateDate]
GO
/****** Object:  ForeignKey [FK_Project_Workspace]    Script Date: 05/15/2022 13:45:07 ******/
ALTER TABLE [dbo].[Project]  WITH CHECK ADD  CONSTRAINT [FK_Project_Workspace] FOREIGN KEY([WorkspaceId])
REFERENCES [dbo].[Workspace] ([WorkspaceId])
GO
ALTER TABLE [dbo].[Project] CHECK CONSTRAINT [FK_Project_Workspace]
GO
/****** Object:  ForeignKey [FK_Task_Priority]    Script Date: 05/15/2022 13:45:07 ******/
ALTER TABLE [dbo].[Task]  WITH CHECK ADD  CONSTRAINT [FK_Task_Priority] FOREIGN KEY([PriorityId])
REFERENCES [dbo].[Priority] ([PriorityId])
GO
ALTER TABLE [dbo].[Task] CHECK CONSTRAINT [FK_Task_Priority]
GO
/****** Object:  ForeignKey [FK_Task_Project]    Script Date: 05/15/2022 13:45:07 ******/
ALTER TABLE [dbo].[Task]  WITH CHECK ADD  CONSTRAINT [FK_Task_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Project] ([ProjectId])
GO
ALTER TABLE [dbo].[Task] CHECK CONSTRAINT [FK_Task_Project]
GO
/****** Object:  ForeignKey [FK_Task_Status]    Script Date: 05/15/2022 13:45:07 ******/
ALTER TABLE [dbo].[Task]  WITH CHECK ADD  CONSTRAINT [FK_Task_Status] FOREIGN KEY([StatusId])
REFERENCES [dbo].[Status] ([StatusId])
GO
ALTER TABLE [dbo].[Task] CHECK CONSTRAINT [FK_Task_Status]
GO
/****** Object:  ForeignKey [FK_Task_TaskType]    Script Date: 05/15/2022 13:45:07 ******/
ALTER TABLE [dbo].[Task]  WITH CHECK ADD  CONSTRAINT [FK_Task_TaskType] FOREIGN KEY([TaskTypeId])
REFERENCES [dbo].[TaskType] ([TaskTypeId])
GO
ALTER TABLE [dbo].[Task] CHECK CONSTRAINT [FK_Task_TaskType]
GO
/****** Object:  ForeignKey [FK_Task_User]    Script Date: 05/15/2022 13:45:07 ******/
ALTER TABLE [dbo].[Task]  WITH CHECK ADD  CONSTRAINT [FK_Task_User] FOREIGN KEY([TaskCreatorId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[Task] CHECK CONSTRAINT [FK_Task_User]
GO
/****** Object:  ForeignKey [FK_Task_User1]    Script Date: 05/15/2022 13:45:07 ******/
ALTER TABLE [dbo].[Task]  WITH CHECK ADD  CONSTRAINT [FK_Task_User1] FOREIGN KEY([TaskExecutorId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[Task] CHECK CONSTRAINT [FK_Task_User1]
GO
/****** Object:  ForeignKey [FK_ProjectUser_Project]    Script Date: 05/15/2022 13:45:07 ******/
ALTER TABLE [dbo].[ProjectUser]  WITH CHECK ADD  CONSTRAINT [FK_ProjectUser_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Project] ([ProjectId])
GO
ALTER TABLE [dbo].[ProjectUser] CHECK CONSTRAINT [FK_ProjectUser_Project]
GO
/****** Object:  ForeignKey [FK_ProjectUser_User]    Script Date: 05/15/2022 13:45:07 ******/
ALTER TABLE [dbo].[ProjectUser]  WITH CHECK ADD  CONSTRAINT [FK_ProjectUser_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[ProjectUser] CHECK CONSTRAINT [FK_ProjectUser_User]
GO
/****** Object:  ForeignKey [FK_Task_Priority2]    Script Date: 05/15/2022 13:45:07 ******/
ALTER TABLE [dbo].[TaskLog]  WITH CHECK ADD  CONSTRAINT [FK_Task_Priority2] FOREIGN KEY([PriorityId])
REFERENCES [dbo].[Priority] ([PriorityId])
GO
ALTER TABLE [dbo].[TaskLog] CHECK CONSTRAINT [FK_Task_Priority2]
GO
/****** Object:  ForeignKey [FK_Task_Project2]    Script Date: 05/15/2022 13:45:07 ******/
ALTER TABLE [dbo].[TaskLog]  WITH CHECK ADD  CONSTRAINT [FK_Task_Project2] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Project] ([ProjectId])
GO
ALTER TABLE [dbo].[TaskLog] CHECK CONSTRAINT [FK_Task_Project2]
GO
/****** Object:  ForeignKey [FK_Task_Status2]    Script Date: 05/15/2022 13:45:07 ******/
ALTER TABLE [dbo].[TaskLog]  WITH CHECK ADD  CONSTRAINT [FK_Task_Status2] FOREIGN KEY([StatusId])
REFERENCES [dbo].[Status] ([StatusId])
GO
ALTER TABLE [dbo].[TaskLog] CHECK CONSTRAINT [FK_Task_Status2]
GO
/****** Object:  ForeignKey [FK_Task_TaskType2]    Script Date: 05/15/2022 13:45:07 ******/
ALTER TABLE [dbo].[TaskLog]  WITH CHECK ADD  CONSTRAINT [FK_Task_TaskType2] FOREIGN KEY([TaskTypeId])
REFERENCES [dbo].[TaskType] ([TaskTypeId])
GO
ALTER TABLE [dbo].[TaskLog] CHECK CONSTRAINT [FK_Task_TaskType2]
GO
/****** Object:  ForeignKey [FK_Task_User12]    Script Date: 05/15/2022 13:45:07 ******/
ALTER TABLE [dbo].[TaskLog]  WITH CHECK ADD  CONSTRAINT [FK_Task_User12] FOREIGN KEY([TaskExecutorId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[TaskLog] CHECK CONSTRAINT [FK_Task_User12]
GO
/****** Object:  ForeignKey [FK_TaskLog_User]    Script Date: 05/15/2022 13:45:07 ******/
ALTER TABLE [dbo].[TaskLog]  WITH CHECK ADD  CONSTRAINT [FK_TaskLog_User] FOREIGN KEY([ActorId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[TaskLog] CHECK CONSTRAINT [FK_TaskLog_User]
GO
/****** Object:  ForeignKey [FK_Comment_Task]    Script Date: 05/15/2022 13:45:07 ******/
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment_Task] FOREIGN KEY([TaskId])
REFERENCES [dbo].[Task] ([TaskId])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Comment_Task]
GO
/****** Object:  ForeignKey [FK_Comment_User]    Script Date: 05/15/2022 13:45:07 ******/
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment_User] FOREIGN KEY([ActorId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Comment_User]
GO
