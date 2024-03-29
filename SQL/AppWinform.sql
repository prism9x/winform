USE [master]
GO
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'AppWinform')
BEGIN
CREATE DATABASE [AppWinform]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'AppWinform', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\AppWinform.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'AppWinform_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\AppWinform_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
END
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AppWinform].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AppWinform] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AppWinform] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AppWinform] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AppWinform] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AppWinform] SET ARITHABORT OFF 
GO
ALTER DATABASE [AppWinform] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [AppWinform] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AppWinform] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AppWinform] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AppWinform] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [AppWinform] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AppWinform] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AppWinform] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AppWinform] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AppWinform] SET  DISABLE_BROKER 
GO
ALTER DATABASE [AppWinform] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AppWinform] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [AppWinform] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [AppWinform] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AppWinform] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AppWinform] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [AppWinform] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [AppWinform] SET RECOVERY FULL 
GO
ALTER DATABASE [AppWinform] SET  MULTI_USER 
GO
ALTER DATABASE [AppWinform] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [AppWinform] SET DB_CHAINING OFF 
GO
ALTER DATABASE [AppWinform] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [AppWinform] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [AppWinform] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'AppWinform', N'ON'
GO
USE [AppWinform]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tb_roles]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tb_roles](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[type] [varchar](50) NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tb_users]') AND type in (N'U'))
BEGIN
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
END
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
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[tb_roles]') AND name = N'PK_tb_role')
ALTER TABLE [dbo].[tb_roles] ADD  CONSTRAINT [PK_tb_role] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_tb_users_tb_roles]') AND parent_object_id = OBJECT_ID(N'[dbo].[tb_users]'))
ALTER TABLE [dbo].[tb_users]  WITH CHECK ADD  CONSTRAINT [FK_tb_users_tb_roles] FOREIGN KEY([role_id])
REFERENCES [dbo].[tb_roles] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_tb_users_tb_roles]') AND parent_object_id = OBJECT_ID(N'[dbo].[tb_users]'))
ALTER TABLE [dbo].[tb_users] CHECK CONSTRAINT [FK_tb_users_tb_roles]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DeleteUserById]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[DeleteUserById] AS' 
END
GO
ALTER PROCEDURE [dbo].[DeleteUserById]
    @UserId INT
AS
BEGIN
    DELETE FROM tb_users WHERE id = @UserId;
END;
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[InsertUser]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[InsertUser] AS' 
END
GO
ALTER PROCEDURE [dbo].[InsertUser]
    @Username NVARCHAR(50),
    @Password NVARCHAR(50),
    @Role INT = 1
AS
BEGIN
    INSERT INTO tb_users (name, password, role_id)
    VALUES (@Username, @Password, @Role);
END;
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SelectUserById]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[SelectUserById] AS' 
END
GO
ALTER PROCEDURE [dbo].[SelectUserById]
    @UserId INT
AS
BEGIN
    SELECT * FROM tb_users WHERE id = @UserId;
END;
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UpdateUserInfoById]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[UpdateUserInfoById] AS' 
END
GO
ALTER PROCEDURE [dbo].[UpdateUserInfoById]
    @UserId INT,
    @NewUsername NVARCHAR(50),
    @NewPassword NVARCHAR(50),
    @NewRoleId INT
AS
BEGIN
    UPDATE tb_users
    SET 
        name = @NewUsername,
        password = @NewPassword,
        role_id = @NewRoleId
    WHERE
        id = @UserId;
END;
GO
USE [master]
GO
ALTER DATABASE [AppWinform] SET  READ_WRITE 
GO
