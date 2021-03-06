USE [master]
GO
/****** Object:  Database [WPF_menu_rights]    Script Date: 12/01/2015 23:14:04 ******/
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
/****** Object:  Table [dbo].[tbl_Users]    Script Date: 12/01/2015 23:14:05 ******/
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
SET IDENTITY_INSERT [dbo].[tbl_Users] OFF
/****** Object:  Table [dbo].[tbl_UserGroups]    Script Date: 12/01/2015 23:14:05 ******/
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
INSERT [dbo].[tbl_UserGroups] ([id], [name]) VALUES (1, N'administrators')
SET IDENTITY_INSERT [dbo].[tbl_UserGroups] OFF
/****** Object:  Table [dbo].[tbl_UserGroupRights]    Script Date: 12/01/2015 23:14:05 ******/
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
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (34, 1, 19, N'1111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (35, 1, 20, N'1111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (36, 1, 21, N'1111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (37, 1, 22, N'1111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (38, 1, 23, N'1111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (39, 1, 24, N'1111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (40, 1, 25, N'1111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (41, 1, 26, N'1111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (42, 1, 27, N'1111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (43, 1, 28, N'1111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (44, 1, 29, N'1111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (45, 1, 30, N'1111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (46, 1, 31, N'1111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (47, 1, 32, N'1111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (48, 1, 33, N'1111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (49, 1, 34, N'1111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (50, 1, 35, N'1111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (51, 1, 36, N'1111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (52, 1, 37, N'1111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (53, 1, 38, N'1111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (54, 1, 39, N'1111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (55, 1, 40, N'1111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (56, 1, 41, N'1111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (57, 1, 42, N'1111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (58, 1, 43, N'1111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (59, 1, 44, N'1111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (60, 1, 45, N'1111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (61, 1, 46, N'1111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (62, 1, 47, N'1111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (63, 1, 48, N'1111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (64, 1, 49, N'1111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (65, 1, 50, N'1111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (66, 1, 51, N'1111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (67, 1, 52, N'1111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (68, 1, 53, N'1111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (69, 1, 54, N'1111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (70, 1, 55, N'1111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (71, 1, 56, N'1111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (72, 1, 57, N'1111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (73, 1, 58, N'1111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (74, 1, 59, N'1111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (75, 1, 60, N'1111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (76, 1, 61, N'1111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (77, 1, 62, N'1111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (78, 1, 63, N'1111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (79, 1, 64, N'1111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (80, 1, 65, N'1111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (81, 1, 66, N'1111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (82, 1, 67, N'1111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (83, 1, 68, N'1111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (84, 1, 69, N'1111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (85, 1, 70, N'1111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (86, 1, 71, N'1111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (87, 1, 72, N'1111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (88, 1, 73, N'1111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (89, 1, 74, N'1111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (90, 1, 75, N'1111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (91, 1, 76, N'1111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (92, 1, 77, N'1111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (93, 1, 78, N'1111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (94, 1, 79, N'1111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (95, 1, 80, N'1111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (96, 1, 81, N'1111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (97, 1, 82, N'1111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (98, 1, 83, N'1111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (99, 1, 84, N'1111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (100, 1, 85, N'1111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (101, 1, 86, N'1111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (102, 1, 87, N'1111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (103, 1, 88, N'1111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (104, 1, 89, N'1111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (105, 1, 90, N'1111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (106, 1, 91, N'1111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (107, 1, 92, N'1111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (108, 1, 93, N'1111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (109, 1, 94, N'1111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (110, 1, 95, N'1111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (111, 1, 96, N'1111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (112, 1, 97, N'1111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (113, 1, 98, N'1111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (114, 1, 99, N'1111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (115, 1, 100, N'1111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (116, 1, 101, N'1111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (117, 1, 102, N'1111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (118, 1, 103, N'1111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (119, 1, 104, N'1111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (120, 1, 105, N'1111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (121, 1, 106, N'1111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (122, 1, 107, N'1111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (123, 1, 108, N'1111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (124, 1, 109, N'1111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (125, 1, 110, N'1111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (126, 1, 111, N'1111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (127, 1, 112, N'1111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (128, 1, 113, N'1111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (129, 1, 114, N'1111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (130, 1, 115, N'1111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (131, 1, 116, N'1111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (132, 1, 117, N'1111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (133, 1, 118, N'1111')
GO
print 'Processed 100 total records'
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (134, 1, 119, N'1111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (135, 1, 120, N'1111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (136, 1, 121, N'1111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (137, 1, 122, N'1111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (138, 1, 123, N'1111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (139, 1, 124, N'1111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (140, 1, 125, N'1111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (141, 1, 126, N'1111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (142, 1, 127, N'1111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (143, 1, 128, N'1111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (144, 1, 129, N'1111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (145, 1, 130, N'1111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146, 1, 131, N'1111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (147, 1, 132, N'1111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (148, 1, 133, N'1111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (149, 1, 134, N'1111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (150, 1, 135, N'1111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (151, 1, 136, N'1111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (152, 1, 137, N'1111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (153, 1, 138, N'1111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (154, 1, 139, N'1111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (155, 1, 140, N'1111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (156, 1, 141, N'1111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (157, 1, 142, N'1111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (158, 1, 143, N'1111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (159, 1, 144, N'1111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (160, 1, 145, N'1111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (161, 1, 146, N'1111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (162, 1, 147, N'1111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (163, 1, 148, N'1111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (164, 1, 149, N'1111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (165, 1, 150, N'1111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (166, 1, 151, N'1111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (167, 1, 152, N'1111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (168, 1, 153, N'1111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (169, 1, 154, N'1111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (170, 1, 155, N'1111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (171, 1, 156, N'1111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (172, 1, 157, N'1111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (173, 1, 158, N'1111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (174, 1, 159, N'1111')
SET IDENTITY_INSERT [dbo].[tbl_UserGroupRights] OFF
/****** Object:  Table [dbo].[tbl_Settings]    Script Date: 12/01/2015 23:14:05 ******/
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
/****** Object:  Table [dbo].[tbl_MenuItems]    Script Date: 12/01/2015 23:14:05 ******/
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
INSERT [dbo].[tbl_MenuItems] ([id], [parentid], [text], [pagename], [orderNrInParent]) VALUES (19, 0, N'admin section', N'welcome', 1000)
INSERT [dbo].[tbl_MenuItems] ([id], [parentid], [text], [pagename], [orderNrInParent]) VALUES (20, 19, N'add new user', N'addUser', 1)
INSERT [dbo].[tbl_MenuItems] ([id], [parentid], [text], [pagename], [orderNrInParent]) VALUES (21, 19, N'add new group', N'addGroup', 2)
INSERT [dbo].[tbl_MenuItems] ([id], [parentid], [text], [pagename], [orderNrInParent]) VALUES (22, 19, N'add new menu item', N'addMenuItem', 3)
INSERT [dbo].[tbl_MenuItems] ([id], [parentid], [text], [pagename], [orderNrInParent]) VALUES (23, 0, N'log out', N'logout', 2000)
INSERT [dbo].[tbl_MenuItems] ([id], [parentid], [text], [pagename], [orderNrInParent]) VALUES (24, 0, N'Zorg', N'welcome', 100)
INSERT [dbo].[tbl_MenuItems] ([id], [parentid], [text], [pagename], [orderNrInParent]) VALUES (25, 24, N'Favorieten', N'welcome', 100)
INSERT [dbo].[tbl_MenuItems] ([id], [parentid], [text], [pagename], [orderNrInParent]) VALUES (26, 25, N'Contracten', N'welcome', 100)
INSERT [dbo].[tbl_MenuItems] ([id], [parentid], [text], [pagename], [orderNrInParent]) VALUES (27, 26, N'Per basisniveau', N'generic_buttons', 100)
INSERT [dbo].[tbl_MenuItems] ([id], [parentid], [text], [pagename], [orderNrInParent]) VALUES (28, 26, N'Per woonbuurt of dienst', N'generic_buttons', 200)
INSERT [dbo].[tbl_MenuItems] ([id], [parentid], [text], [pagename], [orderNrInParent]) VALUES (29, 26, N'Per campus', N'generic_buttons', 300)
INSERT [dbo].[tbl_MenuItems] ([id], [parentid], [text], [pagename], [orderNrInParent]) VALUES (30, 26, N'Ganse instelling', N'generic_buttons', 400)
INSERT [dbo].[tbl_MenuItems] ([id], [parentid], [text], [pagename], [orderNrInParent]) VALUES (31, 26, N'Functie Ter Heide', N'generic_buttons', 500)
INSERT [dbo].[tbl_MenuItems] ([id], [parentid], [text], [pagename], [orderNrInParent]) VALUES (32, 26, N'Functie VAPH', N'generic_buttons', 600)
INSERT [dbo].[tbl_MenuItems] ([id], [parentid], [text], [pagename], [orderNrInParent]) VALUES (33, 26, N'Opmerkingen i.v.m. gegevens', N'generic_buttons', 700)
INSERT [dbo].[tbl_MenuItems] ([id], [parentid], [text], [pagename], [orderNrInParent]) VALUES (34, 25, N'Tikklok', N'generic_buttons', 200)
INSERT [dbo].[tbl_MenuItems] ([id], [parentid], [text], [pagename], [orderNrInParent]) VALUES (35, 25, N'Stagiairs en vrijwilligers', N'generic_buttons', 300)
INSERT [dbo].[tbl_MenuItems] ([id], [parentid], [text], [pagename], [orderNrInParent]) VALUES (36, 25, N'Jaarkalender', N'generic_buttons', 400)
INSERT [dbo].[tbl_MenuItems] ([id], [parentid], [text], [pagename], [orderNrInParent]) VALUES (37, 24, N'Bewonersdossier', N'welcome', 200)
INSERT [dbo].[tbl_MenuItems] ([id], [parentid], [text], [pagename], [orderNrInParent]) VALUES (38, 37, N'Kine', N'generic_buttons', 100)
INSERT [dbo].[tbl_MenuItems] ([id], [parentid], [text], [pagename], [orderNrInParent]) VALUES (39, 37, N'Ergo', N'generic_buttons', 200)
INSERT [dbo].[tbl_MenuItems] ([id], [parentid], [text], [pagename], [orderNrInParent]) VALUES (40, 37, N'Logo', N'generic_buttons', 300)
INSERT [dbo].[tbl_MenuItems] ([id], [parentid], [text], [pagename], [orderNrInParent]) VALUES (41, 37, N'Sociaal-administratief', N'generic_buttons', 400)
INSERT [dbo].[tbl_MenuItems] ([id], [parentid], [text], [pagename], [orderNrInParent]) VALUES (42, 37, N'Medisch', N'generic_buttons', 500)
INSERT [dbo].[tbl_MenuItems] ([id], [parentid], [text], [pagename], [orderNrInParent]) VALUES (43, 37, N'Pedagogische', N'generic_buttons', 600)
INSERT [dbo].[tbl_MenuItems] ([id], [parentid], [text], [pagename], [orderNrInParent]) VALUES (44, 24, N'Teamoverleg', N'generic_buttons', 300)
INSERT [dbo].[tbl_MenuItems] ([id], [parentid], [text], [pagename], [orderNrInParent]) VALUES (45, 24, N'Leefgroepsamenstelling', N'welcome', 400)
INSERT [dbo].[tbl_MenuItems] ([id], [parentid], [text], [pagename], [orderNrInParent]) VALUES (46, 45, N'Rapporten', N'welcome', 100)
INSERT [dbo].[tbl_MenuItems] ([id], [parentid], [text], [pagename], [orderNrInParent]) VALUES (47, 46, N'Per woonbuurt', N'generic_buttons', 100)
INSERT [dbo].[tbl_MenuItems] ([id], [parentid], [text], [pagename], [orderNrInParent]) VALUES (48, 46, N'Individueel', N'generic_buttons', 200)
INSERT [dbo].[tbl_MenuItems] ([id], [parentid], [text], [pagename], [orderNrInParent]) VALUES (49, 45, N'Beheer', N'welcome', 200)
INSERT [dbo].[tbl_MenuItems] ([id], [parentid], [text], [pagename], [orderNrInParent]) VALUES (50, 49, N'Simulatie bezetting', N'generic_buttons', 100)
INSERT [dbo].[tbl_MenuItems] ([id], [parentid], [text], [pagename], [orderNrInParent]) VALUES (51, 49, N'THAK tabellen', N'generic_buttons', 200)
INSERT [dbo].[tbl_MenuItems] ([id], [parentid], [text], [pagename], [orderNrInParent]) VALUES (52, 24, N'Thuisverpleging', N'welcome', 500)
INSERT [dbo].[tbl_MenuItems] ([id], [parentid], [text], [pagename], [orderNrInParent]) VALUES (53, 52, N'Rapporten', N'welcome', 100)
INSERT [dbo].[tbl_MenuItems] ([id], [parentid], [text], [pagename], [orderNrInParent]) VALUES (54, 53, N'Historiek', N'generic_buttons', 100)
INSERT [dbo].[tbl_MenuItems] ([id], [parentid], [text], [pagename], [orderNrInParent]) VALUES (55, 53, N'Per basisniveau', N'generic_buttons', 200)
INSERT [dbo].[tbl_MenuItems] ([id], [parentid], [text], [pagename], [orderNrInParent]) VALUES (56, 53, N'Per woonbuurt', N'generic_buttons', 300)
INSERT [dbo].[tbl_MenuItems] ([id], [parentid], [text], [pagename], [orderNrInParent]) VALUES (57, 53, N'Per externe partner Historiek', N'generic_buttons', 400)
INSERT [dbo].[tbl_MenuItems] ([id], [parentid], [text], [pagename], [orderNrInParent]) VALUES (58, 53, N'Per basisniveau', N'generic_buttons', 500)
INSERT [dbo].[tbl_MenuItems] ([id], [parentid], [text], [pagename], [orderNrInParent]) VALUES (59, 53, N'Per woonbuurt', N'generic_buttons', 700)
INSERT [dbo].[tbl_MenuItems] ([id], [parentid], [text], [pagename], [orderNrInParent]) VALUES (60, 53, N'Per externe partner', N'generic_buttons', 800)
INSERT [dbo].[tbl_MenuItems] ([id], [parentid], [text], [pagename], [orderNrInParent]) VALUES (61, 52, N'Beheer', N'welcome', 200)
INSERT [dbo].[tbl_MenuItems] ([id], [parentid], [text], [pagename], [orderNrInParent]) VALUES (62, 61, N'Thuisverpleging', N'generic_buttons', 100)
INSERT [dbo].[tbl_MenuItems] ([id], [parentid], [text], [pagename], [orderNrInParent]) VALUES (63, 24, N'Protocollen', N'generic_buttons', 600)
INSERT [dbo].[tbl_MenuItems] ([id], [parentid], [text], [pagename], [orderNrInParent]) VALUES (64, 0, N'P & O', N'welcome', 200)
INSERT [dbo].[tbl_MenuItems] ([id], [parentid], [text], [pagename], [orderNrInParent]) VALUES (65, 64, N'Personeelspas', N'generic_buttons', 100)
INSERT [dbo].[tbl_MenuItems] ([id], [parentid], [text], [pagename], [orderNrInParent]) VALUES (66, 64, N'Export', N'welcome', 200)
INSERT [dbo].[tbl_MenuItems] ([id], [parentid], [text], [pagename], [orderNrInParent]) VALUES (67, 66, N'Export', N'generic_buttons', 100)
INSERT [dbo].[tbl_MenuItems] ([id], [parentid], [text], [pagename], [orderNrInParent]) VALUES (68, 0, N'Logistiek', N'generic_buttons', 300)
INSERT [dbo].[tbl_MenuItems] ([id], [parentid], [text], [pagename], [orderNrInParent]) VALUES (69, 0, N'Financiën', N'generic_buttons', 400)
INSERT [dbo].[tbl_MenuItems] ([id], [parentid], [text], [pagename], [orderNrInParent]) VALUES (70, 0, N'Administratie', N'generic_buttons', 500)
INSERT [dbo].[tbl_MenuItems] ([id], [parentid], [text], [pagename], [orderNrInParent]) VALUES (71, 0, N'ICT', N'welcome', 600)
INSERT [dbo].[tbl_MenuItems] ([id], [parentid], [text], [pagename], [orderNrInParent]) VALUES (72, 71, N'Beheer', N'welcome', 100)
INSERT [dbo].[tbl_MenuItems] ([id], [parentid], [text], [pagename], [orderNrInParent]) VALUES (73, 72, N'Plantype', N'generic_buttons', 100)
INSERT [dbo].[tbl_MenuItems] ([id], [parentid], [text], [pagename], [orderNrInParent]) VALUES (74, 72, N'Materiaaltype', N'generic_buttons', 200)
INSERT [dbo].[tbl_MenuItems] ([id], [parentid], [text], [pagename], [orderNrInParent]) VALUES (75, 72, N'Software', N'generic_buttons', 300)
INSERT [dbo].[tbl_MenuItems] ([id], [parentid], [text], [pagename], [orderNrInParent]) VALUES (76, 72, N'Toner', N'generic_buttons', 400)
INSERT [dbo].[tbl_MenuItems] ([id], [parentid], [text], [pagename], [orderNrInParent]) VALUES (77, 72, N'Gebruikers applicaties', N'generic_buttons', 500)
INSERT [dbo].[tbl_MenuItems] ([id], [parentid], [text], [pagename], [orderNrInParent]) VALUES (78, 72, N'Gebruikers applicaties toekennen', N'generic_buttons', 600)
INSERT [dbo].[tbl_MenuItems] ([id], [parentid], [text], [pagename], [orderNrInParent]) VALUES (79, 72, N'ICT contacten', N'generic_buttons', 700)
INSERT [dbo].[tbl_MenuItems] ([id], [parentid], [text], [pagename], [orderNrInParent]) VALUES (80, 72, N'Keuzenlijst type', N'generic_buttons', 800)
INSERT [dbo].[tbl_MenuItems] ([id], [parentid], [text], [pagename], [orderNrInParent]) VALUES (81, 72, N'Keuzelijst items', N'generic_buttons', 900)
INSERT [dbo].[tbl_MenuItems] ([id], [parentid], [text], [pagename], [orderNrInParent]) VALUES (82, 72, N'Drive mappings', N'generic_buttons', 1000)
INSERT [dbo].[tbl_MenuItems] ([id], [parentid], [text], [pagename], [orderNrInParent]) VALUES (83, 72, N'IP''s', N'welcome', 1100)
INSERT [dbo].[tbl_MenuItems] ([id], [parentid], [text], [pagename], [orderNrInParent]) VALUES (84, 83, N'IP-Ranges', N'generic_buttons', 100)
INSERT [dbo].[tbl_MenuItems] ([id], [parentid], [text], [pagename], [orderNrInParent]) VALUES (85, 83, N'IP-Subset', N'generic_buttons', 200)
INSERT [dbo].[tbl_MenuItems] ([id], [parentid], [text], [pagename], [orderNrInParent]) VALUES (86, 83, N'IP-Adressen', N'generic_buttons', 300)
INSERT [dbo].[tbl_MenuItems] ([id], [parentid], [text], [pagename], [orderNrInParent]) VALUES (87, 72, N'Checklists', N'welcome', 1200)
INSERT [dbo].[tbl_MenuItems] ([id], [parentid], [text], [pagename], [orderNrInParent]) VALUES (88, 87, N'Checklists', N'generic_buttons', 100)
INSERT [dbo].[tbl_MenuItems] ([id], [parentid], [text], [pagename], [orderNrInParent]) VALUES (89, 87, N'Checklist items', N'generic_buttons', 200)
INSERT [dbo].[tbl_MenuItems] ([id], [parentid], [text], [pagename], [orderNrInParent]) VALUES (90, 87, N'Checklist groups', N'generic_buttons', 300)
INSERT [dbo].[tbl_MenuItems] ([id], [parentid], [text], [pagename], [orderNrInParent]) VALUES (91, 87, N'Checklist procedures', N'generic_buttons', 400)
INSERT [dbo].[tbl_MenuItems] ([id], [parentid], [text], [pagename], [orderNrInParent]) VALUES (92, 87, N'Checklist input', N'generic_buttons', 500)
INSERT [dbo].[tbl_MenuItems] ([id], [parentid], [text], [pagename], [orderNrInParent]) VALUES (93, 71, N'Ligging', N'welcome', 200)
INSERT [dbo].[tbl_MenuItems] ([id], [parentid], [text], [pagename], [orderNrInParent]) VALUES (94, 93, N'Lokalen', N'generic_buttons', 100)
INSERT [dbo].[tbl_MenuItems] ([id], [parentid], [text], [pagename], [orderNrInParent]) VALUES (95, 93, N'Lokaalbestemming', N'generic_buttons', 200)
INSERT [dbo].[tbl_MenuItems] ([id], [parentid], [text], [pagename], [orderNrInParent]) VALUES (96, 93, N'Plannen', N'generic_buttons', 300)
INSERT [dbo].[tbl_MenuItems] ([id], [parentid], [text], [pagename], [orderNrInParent]) VALUES (97, 93, N'Hotspots', N'generic_buttons', 400)
INSERT [dbo].[tbl_MenuItems] ([id], [parentid], [text], [pagename], [orderNrInParent]) VALUES (98, 71, N'Inventaris', N'welcome', 300)
INSERT [dbo].[tbl_MenuItems] ([id], [parentid], [text], [pagename], [orderNrInParent]) VALUES (99, 98, N'Computer', N'generic_buttons', 100)
INSERT [dbo].[tbl_MenuItems] ([id], [parentid], [text], [pagename], [orderNrInParent]) VALUES (100, 98, N'Printer', N'generic_buttons', 200)
INSERT [dbo].[tbl_MenuItems] ([id], [parentid], [text], [pagename], [orderNrInParent]) VALUES (101, 98, N'Randapparatuur', N'generic_buttons', 300)
INSERT [dbo].[tbl_MenuItems] ([id], [parentid], [text], [pagename], [orderNrInParent]) VALUES (102, 98, N'Server', N'generic_buttons', 400)
INSERT [dbo].[tbl_MenuItems] ([id], [parentid], [text], [pagename], [orderNrInParent]) VALUES (103, 98, N'Switch', N'generic_buttons', 500)
INSERT [dbo].[tbl_MenuItems] ([id], [parentid], [text], [pagename], [orderNrInParent]) VALUES (104, 98, N'DVR', N'generic_buttons', 600)
INSERT [dbo].[tbl_MenuItems] ([id], [parentid], [text], [pagename], [orderNrInParent]) VALUES (105, 98, N'Bewakingscamera', N'generic_buttons', 700)
INSERT [dbo].[tbl_MenuItems] ([id], [parentid], [text], [pagename], [orderNrInParent]) VALUES (106, 71, N'Aankoopgegevens', N'welcome', 400)
INSERT [dbo].[tbl_MenuItems] ([id], [parentid], [text], [pagename], [orderNrInParent]) VALUES (107, 106, N'Aankoopfacturen', N'generic_buttons', 100)
INSERT [dbo].[tbl_MenuItems] ([id], [parentid], [text], [pagename], [orderNrInParent]) VALUES (108, 106, N'Leveranciers', N'generic_buttons', 200)
INSERT [dbo].[tbl_MenuItems] ([id], [parentid], [text], [pagename], [orderNrInParent]) VALUES (109, 106, N'Gemeenten', N'generic_buttons', 300)
INSERT [dbo].[tbl_MenuItems] ([id], [parentid], [text], [pagename], [orderNrInParent]) VALUES (110, 71, N'Rechten', N'welcome', 500)
INSERT [dbo].[tbl_MenuItems] ([id], [parentid], [text], [pagename], [orderNrInParent]) VALUES (111, 110, N'Rechten per functiegroep', N'generic_buttons', 100)
INSERT [dbo].[tbl_MenuItems] ([id], [parentid], [text], [pagename], [orderNrInParent]) VALUES (112, 110, N'AD rechten bepalen', N'generic_buttons', 200)
INSERT [dbo].[tbl_MenuItems] ([id], [parentid], [text], [pagename], [orderNrInParent]) VALUES (113, 110, N'Gebruikers', N'generic_buttons', 300)
INSERT [dbo].[tbl_MenuItems] ([id], [parentid], [text], [pagename], [orderNrInParent]) VALUES (114, 71, N'Helpdesk', N'welcome', 600)
INSERT [dbo].[tbl_MenuItems] ([id], [parentid], [text], [pagename], [orderNrInParent]) VALUES (115, 114, N'Helpdesk probleemsoort', N'generic_buttons', 100)
INSERT [dbo].[tbl_MenuItems] ([id], [parentid], [text], [pagename], [orderNrInParent]) VALUES (116, 114, N'Nieuw helpdesk ticket', N'generic_buttons', 200)
INSERT [dbo].[tbl_MenuItems] ([id], [parentid], [text], [pagename], [orderNrInParent]) VALUES (117, 114, N'Mijn helpdesk tickets', N'generic_buttons', 300)
INSERT [dbo].[tbl_MenuItems] ([id], [parentid], [text], [pagename], [orderNrInParent]) VALUES (118, 71, N'ICT tools', N'welcome', 700)
GO
print 'Processed 100 total records'
INSERT [dbo].[tbl_MenuItems] ([id], [parentid], [text], [pagename], [orderNrInParent]) VALUES (119, 118, N'AD tools', N'welcome', 100)
INSERT [dbo].[tbl_MenuItems] ([id], [parentid], [text], [pagename], [orderNrInParent]) VALUES (120, 119, N'AD tools 1', N'generic_buttons', 100)
INSERT [dbo].[tbl_MenuItems] ([id], [parentid], [text], [pagename], [orderNrInParent]) VALUES (121, 119, N'AD tools 2', N'generic_buttons', 200)
INSERT [dbo].[tbl_MenuItems] ([id], [parentid], [text], [pagename], [orderNrInParent]) VALUES (122, 119, N'Remote', N'welcome', 200)
INSERT [dbo].[tbl_MenuItems] ([id], [parentid], [text], [pagename], [orderNrInParent]) VALUES (123, 122, N'Remote installed printers', N'generic_buttons', 100)
INSERT [dbo].[tbl_MenuItems] ([id], [parentid], [text], [pagename], [orderNrInParent]) VALUES (124, 122, N'Remote installed mapped drives', N'generic_buttons', 200)
INSERT [dbo].[tbl_MenuItems] ([id], [parentid], [text], [pagename], [orderNrInParent]) VALUES (125, 122, N'Remote shared folders', N'generic_buttons', 300)
INSERT [dbo].[tbl_MenuItems] ([id], [parentid], [text], [pagename], [orderNrInParent]) VALUES (126, 122, N'Remote installed software', N'generic_buttons', 400)
INSERT [dbo].[tbl_MenuItems] ([id], [parentid], [text], [pagename], [orderNrInParent]) VALUES (127, 122, N'Remote CPU info', N'generic_buttons', 500)
INSERT [dbo].[tbl_MenuItems] ([id], [parentid], [text], [pagename], [orderNrInParent]) VALUES (128, 122, N'Remote desktop info', N'generic_buttons', 600)
INSERT [dbo].[tbl_MenuItems] ([id], [parentid], [text], [pagename], [orderNrInParent]) VALUES (129, 122, N'Remote NIC settings', N'generic_buttons', 700)
INSERT [dbo].[tbl_MenuItems] ([id], [parentid], [text], [pagename], [orderNrInParent]) VALUES (130, 122, N'Remote onboard devices', N'generic_buttons', 800)
INSERT [dbo].[tbl_MenuItems] ([id], [parentid], [text], [pagename], [orderNrInParent]) VALUES (131, 122, N'Remote OS info', N'generic_buttons', 900)
INSERT [dbo].[tbl_MenuItems] ([id], [parentid], [text], [pagename], [orderNrInParent]) VALUES (132, 122, N'Remote memory info', N'generic_buttons', 1000)
INSERT [dbo].[tbl_MenuItems] ([id], [parentid], [text], [pagename], [orderNrInParent]) VALUES (133, 122, N'Remote printer config info', N'generic_buttons', 1100)
INSERT [dbo].[tbl_MenuItems] ([id], [parentid], [text], [pagename], [orderNrInParent]) VALUES (134, 122, N'Remote computersystem info', N'generic_buttons', 1200)
INSERT [dbo].[tbl_MenuItems] ([id], [parentid], [text], [pagename], [orderNrInParent]) VALUES (135, 122, N'Remote win32 processen', N'generic_buttons', 1300)
INSERT [dbo].[tbl_MenuItems] ([id], [parentid], [text], [pagename], [orderNrInParent]) VALUES (136, 122, N'Remote user accounts', N'generic_buttons', 1400)
INSERT [dbo].[tbl_MenuItems] ([id], [parentid], [text], [pagename], [orderNrInParent]) VALUES (137, 118, N'TH-sync', N'generic_buttons', 300)
INSERT [dbo].[tbl_MenuItems] ([id], [parentid], [text], [pagename], [orderNrInParent]) VALUES (138, 118, N'Back-up databases', N'generic_buttons', 400)
INSERT [dbo].[tbl_MenuItems] ([id], [parentid], [text], [pagename], [orderNrInParent]) VALUES (139, 118, N'Restore databases', N'generic_buttons', 500)
INSERT [dbo].[tbl_MenuItems] ([id], [parentid], [text], [pagename], [orderNrInParent]) VALUES (140, 118, N'Clean exceptions', N'generic_buttons', 600)
INSERT [dbo].[tbl_MenuItems] ([id], [parentid], [text], [pagename], [orderNrInParent]) VALUES (141, 118, N'Clean logs', N'generic_buttons', 700)
INSERT [dbo].[tbl_MenuItems] ([id], [parentid], [text], [pagename], [orderNrInParent]) VALUES (142, 118, N'Ping', N'welcome', 800)
INSERT [dbo].[tbl_MenuItems] ([id], [parentid], [text], [pagename], [orderNrInParent]) VALUES (143, 142, N'Een bepaald aantal keren pingen', N'generic_buttons', 100)
INSERT [dbo].[tbl_MenuItems] ([id], [parentid], [text], [pagename], [orderNrInParent]) VALUES (144, 142, N'Ping-t', N'generic_buttons', 200)
INSERT [dbo].[tbl_MenuItems] ([id], [parentid], [text], [pagename], [orderNrInParent]) VALUES (145, 142, N'Een bepaalde tijd pingen', N'generic_buttons', 300)
INSERT [dbo].[tbl_MenuItems] ([id], [parentid], [text], [pagename], [orderNrInParent]) VALUES (146, 142, N'Een bepaalde range pingen', N'generic_buttons', 400)
INSERT [dbo].[tbl_MenuItems] ([id], [parentid], [text], [pagename], [orderNrInParent]) VALUES (147, 0, N'Applicaties', N'welcome', 700)
INSERT [dbo].[tbl_MenuItems] ([id], [parentid], [text], [pagename], [orderNrInParent]) VALUES (148, 147, N'Mijn applicaties', N'welcome', 100)
INSERT [dbo].[tbl_MenuItems] ([id], [parentid], [text], [pagename], [orderNrInParent]) VALUES (149, 148, N'Word', N'generic_buttons', 100)
INSERT [dbo].[tbl_MenuItems] ([id], [parentid], [text], [pagename], [orderNrInParent]) VALUES (150, 148, N'Excel', N'generic_buttons', 200)
INSERT [dbo].[tbl_MenuItems] ([id], [parentid], [text], [pagename], [orderNrInParent]) VALUES (151, 148, N'Access', N'generic_buttons', 300)
INSERT [dbo].[tbl_MenuItems] ([id], [parentid], [text], [pagename], [orderNrInParent]) VALUES (152, 148, N'Rekenmachine', N'generic_buttons', 400)
INSERT [dbo].[tbl_MenuItems] ([id], [parentid], [text], [pagename], [orderNrInParent]) VALUES (153, 147, N'Mijn snelkoppelingen', N'welcome', 200)
INSERT [dbo].[tbl_MenuItems] ([id], [parentid], [text], [pagename], [orderNrInParent]) VALUES (154, 153, N'Snelkoppeling 1', N'generic_buttons', 100)
INSERT [dbo].[tbl_MenuItems] ([id], [parentid], [text], [pagename], [orderNrInParent]) VALUES (155, 153, N'Snelkoppeling 2', N'generic_buttons', 200)
INSERT [dbo].[tbl_MenuItems] ([id], [parentid], [text], [pagename], [orderNrInParent]) VALUES (156, 153, N'Snelkoppeling 3', N'generic_buttons', 300)
INSERT [dbo].[tbl_MenuItems] ([id], [parentid], [text], [pagename], [orderNrInParent]) VALUES (157, 153, N'Snelkoppeling 4', N'generic_buttons', 400)
INSERT [dbo].[tbl_MenuItems] ([id], [parentid], [text], [pagename], [orderNrInParent]) VALUES (158, 147, N'Mijn snelkoppelingen beheer', N'generic_buttons', 300)
INSERT [dbo].[tbl_MenuItems] ([id], [parentid], [text], [pagename], [orderNrInParent]) VALUES (159, 0, N'Help', N'generic_buttons', 800)
SET IDENTITY_INSERT [dbo].[tbl_MenuItems] OFF
/****** Object:  StoredProcedure [dbo].[getUserGroups]    Script Date: 12/01/2015 23:14:07 ******/
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
/****** Object:  StoredProcedure [dbo].[getUserGroup]    Script Date: 12/01/2015 23:14:07 ******/
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
/****** Object:  StoredProcedure [dbo].[getUser]    Script Date: 12/01/2015 23:14:07 ******/
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
/****** Object:  StoredProcedure [dbo].[getItemsForGroup]    Script Date: 12/01/2015 23:14:07 ******/
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
	order by	items.parentid asc, items.orderNrInParent asc
GO
/****** Object:  StoredProcedure [dbo].[getAllItems]    Script Date: 12/01/2015 23:14:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Dennis Bellinkx
-- Create date: 2015-12-01
-- Description:	gets all existing items
-- =============================================
CREATE PROCEDURE [dbo].[getAllItems] 
AS
	select		id as id
			  , parentid as parentID
			  , [text] as itemText
			  , pagename as pageName
			  , orderNrInParent as orderNrInParent
	from		tbl_MenuItems
	order by	[text] asc, id asc
GO
/****** Object:  StoredProcedure [dbo].[createUserGroup]    Script Date: 12/01/2015 23:14:07 ******/
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
/****** Object:  StoredProcedure [dbo].[createUser]    Script Date: 12/01/2015 23:14:07 ******/
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
/****** Object:  StoredProcedure [dbo].[createMenuItem]    Script Date: 12/01/2015 23:14:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Dennis Bellinkx
-- Create date: 2015-11-17
-- Description:	Creates a new menuItem
-- =============================================
CREATE PROCEDURE [dbo].[createMenuItem]
	@text nvarchar(50)
  , @parentID int
  , @orderNrInParent int
  , @pageName nvarchar(50)

AS
	declare @newItemID int;
	declare @adminGroupID int;
	
	insert into	tbl_MenuItems ([text], parentid, orderNrInParent, pagename)
					   values (@text, @parentID, @orderNrInParent, @pageName);

	set @newItemID = SCOPE_IDENTITY();
	set @adminGroupID = (select id from tbl_UserGroups where name = 'administrators');
	
	insert into	tbl_UserGroupRights (groupID, menuItemID, rights)
							 values (@adminGroupID, @newItemID, 1111);
GO
/****** Object:  StoredProcedure [dbo].[createCopyOfGroup]    Script Date: 12/01/2015 23:14:07 ******/
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
/****** Object:  StoredProcedure [dbo].[checkIfUserNameAlreadyExists]    Script Date: 12/01/2015 23:14:08 ******/
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
