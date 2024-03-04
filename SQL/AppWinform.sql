USE [AppWinform]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[InsertUser]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[InsertUser]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_tb_users_tb_roles]') AND parent_object_id = OBJECT_ID(N'[dbo].[tb_users]'))
ALTER TABLE [dbo].[tb_users] DROP CONSTRAINT [FK_tb_users_tb_roles]
GO
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[tb_roles]') AND name = N'PK_tb_role')
ALTER TABLE [dbo].[tb_roles] DROP CONSTRAINT [PK_tb_role]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tb_users]') AND type in (N'U'))
DROP TABLE [dbo].[tb_users]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tb_roles]') AND type in (N'U'))
DROP TABLE [dbo].[tb_roles]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_roles](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[type] [varchar](50) NULL
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[password] [varchar](100) NOT NULL,
	[role_id] [int] NULL,
 CONSTRAINT [PK_tb_users] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tb_roles] ON 

INSERT [dbo].[tb_roles] ([id], [type]) VALUES (1, N'root')
INSERT [dbo].[tb_roles] ([id], [type]) VALUES (2, N'user')
INSERT [dbo].[tb_roles] ([id], [type]) VALUES (3, N'mod')
SET IDENTITY_INSERT [dbo].[tb_roles] OFF
GO
SET IDENTITY_INSERT [dbo].[tb_users] ON 

INSERT [dbo].[tb_users] ([id], [name], [password], [role_id]) VALUES (1, N'admin', N'123456', 1)
INSERT [dbo].[tb_users] ([id], [name], [password], [role_id]) VALUES (2, N'prism', N'123456', 2)
INSERT [dbo].[tb_users] ([id], [name], [password], [role_id]) VALUES (3, N'fiction9a', N'123456', 3)
INSERT [dbo].[tb_users] ([id], [name], [password], [role_id]) VALUES (4, N'reptiler', N'123456', 2)
INSERT [dbo].[tb_users] ([id], [name], [password], [role_id]) VALUES (5, N'zoo_vocong', N'123456', 2)
INSERT [dbo].[tb_users] ([id], [name], [password], [role_id]) VALUES (6, N'tuong', N'123456', 1)
INSERT [dbo].[tb_users] ([id], [name], [password], [role_id]) VALUES (7, N'dinhmanhtuong', N'123456', 1)
INSERT [dbo].[tb_users] ([id], [name], [password], [role_id]) VALUES (8, N'hanoo', N'1naichuoi9', 1)
INSERT [dbo].[tb_users] ([id], [name], [password], [role_id]) VALUES (9, N'klesk', N'123456', 1)
SET IDENTITY_INSERT [dbo].[tb_users] OFF
GO
ALTER TABLE [dbo].[tb_roles] ADD  CONSTRAINT [PK_tb_role] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tb_users]  WITH CHECK ADD  CONSTRAINT [FK_tb_users_tb_roles] FOREIGN KEY([role_id])
REFERENCES [dbo].[tb_roles] ([id])
GO
ALTER TABLE [dbo].[tb_users] CHECK CONSTRAINT [FK_tb_users_tb_roles]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertUser]
    @Username NVARCHAR(50),
    @Password NVARCHAR(50),
    @Role INT = 1
AS
BEGIN
    INSERT INTO tb_users (name, password, role_id)
    VALUES (@Username, @Password, @Role);
END;
GO
