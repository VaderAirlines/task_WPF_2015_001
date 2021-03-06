USE [master]
GO
/****** Object:  Database [WPF_menu_rights]    Script Date: 11/17/2015 21:52:53 ******/
CREATE DATABASE [WPF_menu_rights] ON  PRIMARY 
( NAME = N'WPF_menu_rights', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\WPF_menu_rights.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'WPF_menu_rights_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\WPF_menu_rights_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [WPF_menu_rights] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [WPF_menu_rights].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [WPF_menu_rights] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [WPF_menu_rights] SET ANSI_NULLS OFF
GO
ALTER DATABASE [WPF_menu_rights] SET ANSI_PADDING OFF
GO
ALTER DATABASE [WPF_menu_rights] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [WPF_menu_rights] SET ARITHABORT OFF
GO
ALTER DATABASE [WPF_menu_rights] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [WPF_menu_rights] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [WPF_menu_rights] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [WPF_menu_rights] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [WPF_menu_rights] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [WPF_menu_rights] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [WPF_menu_rights] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [WPF_menu_rights] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [WPF_menu_rights] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [WPF_menu_rights] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [WPF_menu_rights] SET  DISABLE_BROKER
GO
ALTER DATABASE [WPF_menu_rights] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [WPF_menu_rights] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [WPF_menu_rights] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [WPF_menu_rights] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [WPF_menu_rights] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [WPF_menu_rights] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [WPF_menu_rights] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [WPF_menu_rights] SET  READ_WRITE
GO
ALTER DATABASE [WPF_menu_rights] SET RECOVERY FULL
GO
ALTER DATABASE [WPF_menu_rights] SET  MULTI_USER
GO
ALTER DATABASE [WPF_menu_rights] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [WPF_menu_rights] SET DB_CHAINING OFF
GO
EXEC sys.sp_db_vardecimal_storage_format N'WPF_menu_rights', N'ON'
GO
USE [WPF_menu_rights]
GO
/****** Object:  Table [dbo].[tbl_Users]    Script Date: 11/17/2015 21:52:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[login] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
	[groupID] [int] NOT NULL,
 CONSTRAINT [PK_tbl_Users] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [unique_user_login] UNIQUE NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tbl_Users] ON
INSERT [dbo].[tbl_Users] ([id], [login], [password], [groupID]) VALUES (2, N'login', N'paswoord', 1)
INSERT [dbo].[tbl_Users] ([id], [login], [password], [groupID]) VALUES (3, N'dennis', N'bellinkx', 1)
INSERT [dbo].[tbl_Users] ([id], [login], [password], [groupID]) VALUES (4, N'test001', N'test001', 2)
SET IDENTITY_INSERT [dbo].[tbl_Users] OFF
/****** Object:  Table [dbo].[tbl_UserGroups]    Script Date: 11/17/2015 21:52:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_UserGroups](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tbl_UserGroups] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tbl_UserGroups] ON
INSERT [dbo].[tbl_UserGroups] ([id], [name]) VALUES (1, N'eerste groep')
INSERT [dbo].[tbl_UserGroups] ([id], [name]) VALUES (2, N'newGroup1')
SET IDENTITY_INSERT [dbo].[tbl_UserGroups] OFF
/****** Object:  Table [dbo].[tbl_UserGroupRights]    Script Date: 11/17/2015 21:52:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_UserGroupRights](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[groupID] [int] NOT NULL,
	[menuItemID] [int] NOT NULL,
	[rights] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_tbl_UserGroupRights] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tbl_UserGroupRights] ON
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (2, 1, 2, N'1111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (5, 1, 5, N'1110')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (7, 1, 7, N'1100')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (8, 1, 8, N'1000')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (9, 1, 9, N'0000')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (10, 1, 10, N'0001')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (11, 1, 1, N'0000')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (12, 1, 3, N'0000')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (13, 1, 4, N'0000')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (14, 1, 6, N'0000')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (15, 1, 11, N'1111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (16, 1, 12, N'1111')
SET IDENTITY_INSERT [dbo].[tbl_UserGroupRights] OFF
/****** Object:  Table [dbo].[tbl_Settings]    Script Date: 11/17/2015 21:52:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Settings](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[value] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tbl_Settings] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_MenuItems]    Script Date: 11/17/2015 21:52:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_MenuItems](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[parentid] [int] NOT NULL,
	[text] [nvarchar](50) NOT NULL,
	[pagename] [nvarchar](50) NOT NULL,
	[orderNrInParent] [int] NOT NULL,
 CONSTRAINT [PK_tbl_MenuItems] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tbl_MenuItems] ON
INSERT [dbo].[tbl_MenuItems] ([id], [parentid], [text], [pagename], [orderNrInParent]) VALUES (1, 0, N'eerste item', N'treeview', 1)
INSERT [dbo].[tbl_MenuItems] ([id], [parentid], [text], [pagename], [orderNrInParent]) VALUES (2, 1, N'tweede item', N'generic_buttons', 1)
INSERT [dbo].[tbl_MenuItems] ([id], [parentid], [text], [pagename], [orderNrInParent]) VALUES (3, 0, N'derde item', N'treeview', 2)
INSERT [dbo].[tbl_MenuItems] ([id], [parentid], [text], [pagename], [orderNrInParent]) VALUES (4, 0, N'vierde item', N'generic_buttons', 3)
INSERT [dbo].[tbl_MenuItems] ([id], [parentid], [text], [pagename], [orderNrInParent]) VALUES (5, 3, N'vijfde item', N'treeview', 1)
INSERT [dbo].[tbl_MenuItems] ([id], [parentid], [text], [pagename], [orderNrInParent]) VALUES (6, 3, N'zesde item', N'generic_buttons', 2)
INSERT [dbo].[tbl_MenuItems] ([id], [parentid], [text], [pagename], [orderNrInParent]) VALUES (7, 3, N'zevende item', N'treeview', 3)
INSERT [dbo].[tbl_MenuItems] ([id], [parentid], [text], [pagename], [orderNrInParent]) VALUES (8, 6, N'achtste', N'generic_buttons', 1)
INSERT [dbo].[tbl_MenuItems] ([id], [parentid], [text], [pagename], [orderNrInParent]) VALUES (9, 6, N'negende', N'treeview', 3)
INSERT [dbo].[tbl_MenuItems] ([id], [parentid], [text], [pagename], [orderNrInParent]) VALUES (10, 0, N'add group', N'addGroup', 5)
INSERT [dbo].[tbl_MenuItems] ([id], [parentid], [text], [pagename], [orderNrInParent]) VALUES (11, 0, N'log out', N'logout', 6)
INSERT [dbo].[tbl_MenuItems] ([id], [parentid], [text], [pagename], [orderNrInParent]) VALUES (12, 0, N'add users', N'addUser', 4)
SET IDENTITY_INSERT [dbo].[tbl_MenuItems] OFF
/****** Object:  StoredProcedure [dbo].[getUserGroups]    Script Date: 11/17/2015 21:52:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =================================================
-- Author:		Dennis Bellinkx
-- Create date: 2015-11-17
-- Description:	gets all usergroups
-- =================================================
create PROCEDURE [dbo].[getUserGroups]
AS
	select	id, name		  
	from	tbl_UserGroups
GO
/****** Object:  StoredProcedure [dbo].[getUserGroup]    Script Date: 11/17/2015 21:52:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =================================================
-- Author:		Dennis Bellinkx
-- Create date: 2015-11-06
-- Description:	gets the name for a given group (ID)
-- =================================================
CREATE PROCEDURE [dbo].[getUserGroup] 
	@groupID int
AS
	select	name		  
	from	tbl_UserGroups
	where	id = @groupID
GO
/****** Object:  StoredProcedure [dbo].[getUser]    Script Date: 11/17/2015 21:52:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =================================================
-- Author:		Dennis Bellinkx
-- Create date: 2015-11-06
-- Description:	get a user on login/password combo
-- =================================================
create PROCEDURE [dbo].[getUser]
	@login		nvarchar(50)
  , @password	nvarchar(50)
AS
	select	id, groupID
	from	tbl_Users
	where	login = @login
		and password = @password
GO
/****** Object:  StoredProcedure [dbo].[getItemsForGroup]    Script Date: 11/17/2015 21:52:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Dennis Bellinkx
-- Create date: 2015-11-06
-- Description:	gets items for given group (ID)
-- =============================================
CREATE PROCEDURE [dbo].[getItemsForGroup] 
	@groupID int
AS
	select		items.id as id
			  , items.parentid as parentID
			  , items.[text] as itemText
			  , items.pagename as pageName
			  , items.orderNrInParent as orderNrInParent
			  , ugr.rights as rights
	from		tbl_UserGroupRights as ugr join tbl_MenuItems as items
				on ugr.menuItemID = items.id
	where		ugr.groupID = @groupID
	order by	items.parentid, items.orderNrInParent
GO
/****** Object:  StoredProcedure [dbo].[createUserGroup]    Script Date: 11/17/2015 21:52:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ===================================================
-- Author:		Dennis Bellinkx
-- Create date: 2015-11-17
-- Description:	Creates a new usergroup without rights
-- ===================================================
CREATE PROCEDURE [dbo].[createUserGroup]
	@groupname nvarchar(50)

AS
	insert into	tbl_UserGroups (name)
						values (@groupname)
						
	declare @newID int = SCOPE_IDENTITY();
	
	insert into tbl_UserGroupRights (groupID, menuItemID, rights)
	select	@newID, id, '0000'
	from	tbl_MenuItems
GO
/****** Object:  StoredProcedure [dbo].[createUser]    Script Date: 11/17/2015 21:52:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Dennis Bellinkx
-- Create date: 2015-11-17
-- Description:	Creates a new user
-- =============================================
CREATE PROCEDURE [dbo].[createUser]
	@login nvarchar(50)
  , @password nvarchar(50)
  , @groupID int

AS
	insert into	tbl_Users (login, password, groupID)
				   values (@login, @password, @groupID)
GO
/****** Object:  StoredProcedure [dbo].[createCopyOfGroup]    Script Date: 11/17/2015 21:52:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ===================================================
-- Author:		Dennis Bellinkx
-- Create date: 2015-11-17
-- Description:	Creates a copy of a usergroup
-- ===================================================
CREATE PROCEDURE [dbo].[createCopyOfGroup]
	@groupname nvarchar(50)
  , @groupToCopyID int

AS
	insert into	tbl_UserGroups (name)
						values (@groupname)
						
	declare @newID int = SCOPE_IDENTITY();
	
	insert into tbl_UserGroupRights (groupID, menuItemID, rights)
	select	@newID, menuItemID, rights
	from	tbl_UserGroupRights
	where	id = @groupToCopyID
GO
/****** Object:  StoredProcedure [dbo].[checkIfUserNameAlreadyExists]    Script Date: 11/17/2015 21:52:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ================================================
-- Author:		Dennis Bellinkx
-- Create date: 2015-11-17
-- Description:	Checks if a username already exists
-- ================================================
CREATE PROCEDURE [dbo].[checkIfUserNameAlreadyExists]
	@login nvarchar(50)

AS
	select	id
	from	tbl_Users
	where	login = @login
GO
