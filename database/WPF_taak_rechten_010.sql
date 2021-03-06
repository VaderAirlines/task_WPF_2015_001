USE [master]
GO
/****** Object:  Database [WPF_menu_rights]    Script Date: 04/04/2016 22:49:00 ******/
CREATE DATABASE [WPF_menu_rights] ON  PRIMARY 
( NAME = N'WPF_menu_rights', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\WPF_menu_rights.mdf' , SIZE = 7168KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'WPF_menu_rights_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\WPF_menu_rights_log.ldf' , SIZE = 69760KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
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
/****** Object:  Table [dbo].[tbl_Users]    Script Date: 04/04/2016 22:49:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[login] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
	[groupID] [int] NOT NULL,
	[emailAddress] [nvarchar](50) NOT NULL,
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
INSERT [dbo].[tbl_Users] ([id], [login], [password], [groupID], [emailAddress]) VALUES (2, N'login', N'paswoord', 1, N'dennisbellinkx@gmail.com')
INSERT [dbo].[tbl_Users] ([id], [login], [password], [groupID], [emailAddress]) VALUES (8, N'logistiek', N'logistiek', 5, N'dennisbellinkx@gmail.com')
INSERT [dbo].[tbl_Users] ([id], [login], [password], [groupID], [emailAddress]) VALUES (11, N'tester', N'tester', 6, N'tester')
SET IDENTITY_INSERT [dbo].[tbl_Users] OFF
/****** Object:  Table [dbo].[tbl_UserGroups]    Script Date: 04/04/2016 22:49:02 ******/
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
INSERT [dbo].[tbl_UserGroups] ([id], [name]) VALUES (5, N'logistiek')
INSERT [dbo].[tbl_UserGroups] ([id], [name]) VALUES (6, N'testers')
SET IDENTITY_INSERT [dbo].[tbl_UserGroups] OFF
/****** Object:  Table [dbo].[tbl_UserGroupRights]    Script Date: 04/04/2016 22:49:02 ******/
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
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (145988, 1, 19, N'111111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (145989, 1, 20, N'111111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (145990, 1, 21, N'111111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (145991, 1, 22, N'111111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (145992, 1, 23, N'111111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (145993, 1, 24, N'111111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (145994, 1, 25, N'111111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (145995, 1, 26, N'111111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (145996, 1, 27, N'111111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (145997, 1, 28, N'111111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (145998, 1, 29, N'111111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (145999, 1, 30, N'111111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146000, 1, 31, N'111111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146001, 1, 32, N'111111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146002, 1, 33, N'111111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146003, 1, 34, N'111111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146004, 1, 35, N'111111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146005, 1, 36, N'111111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146006, 1, 37, N'111111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146007, 1, 38, N'111111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146008, 1, 39, N'111111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146009, 1, 40, N'111111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146010, 1, 41, N'111111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146011, 1, 42, N'111111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146012, 1, 43, N'111111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146013, 1, 44, N'111111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146014, 1, 45, N'111111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146015, 1, 46, N'111111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146016, 1, 47, N'111111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146017, 1, 48, N'111111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146018, 1, 49, N'111111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146019, 1, 50, N'111111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146020, 1, 51, N'111111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146021, 1, 52, N'111111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146022, 1, 53, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146023, 1, 54, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146024, 1, 55, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146025, 1, 56, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146026, 1, 57, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146027, 1, 58, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146028, 1, 59, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146029, 1, 60, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146030, 1, 61, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146031, 1, 62, N'000000000')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146032, 1, 63, N'111111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146033, 1, 64, N'111111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146034, 1, 65, N'111111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146035, 1, 66, N'111111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146036, 1, 67, N'111111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146037, 1, 68, N'111111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146038, 1, 69, N'111111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146039, 1, 70, N'111111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146040, 1, 71, N'111111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146041, 1, 72, N'111111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146042, 1, 73, N'111111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146043, 1, 74, N'111111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146044, 1, 75, N'111111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146045, 1, 76, N'111111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146046, 1, 77, N'111111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146047, 1, 78, N'111111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146048, 1, 79, N'111111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146049, 1, 80, N'111111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146050, 1, 81, N'111111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146051, 1, 82, N'111111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146052, 1, 83, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146053, 1, 84, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146054, 1, 85, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146055, 1, 86, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146056, 1, 87, N'111111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146057, 1, 88, N'111111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146058, 1, 89, N'111111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146059, 1, 90, N'111111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146060, 1, 91, N'111111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146061, 1, 92, N'111111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146062, 1, 93, N'111111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146063, 1, 94, N'111111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146064, 1, 95, N'111111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146065, 1, 96, N'111111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146066, 1, 97, N'111111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146067, 1, 98, N'111111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146068, 1, 99, N'111111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146069, 1, 100, N'111111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146070, 1, 101, N'111111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146071, 1, 102, N'111111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146072, 1, 103, N'111111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146073, 1, 104, N'111111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146074, 1, 105, N'111111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146075, 1, 106, N'111111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146076, 1, 107, N'111111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146077, 1, 108, N'111111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146078, 1, 109, N'111111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146079, 1, 110, N'111111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146080, 1, 111, N'111111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146081, 1, 112, N'111111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146082, 1, 113, N'111111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146083, 1, 114, N'111111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146084, 1, 115, N'111111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146085, 1, 116, N'111111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146086, 1, 117, N'111111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146087, 1, 118, N'111111111')
GO
print 'Processed 100 total records'
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146088, 1, 119, N'111111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146089, 1, 120, N'111111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146090, 1, 121, N'111111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146091, 1, 122, N'111111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146092, 1, 123, N'111111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146093, 1, 124, N'111111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146094, 1, 125, N'111111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146095, 1, 126, N'111111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146096, 1, 127, N'111111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146097, 1, 128, N'111111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146098, 1, 129, N'111111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146099, 1, 130, N'111111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146100, 1, 131, N'111111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146101, 1, 132, N'111111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146102, 1, 133, N'111111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146103, 1, 134, N'111111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146104, 1, 135, N'111111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146105, 1, 136, N'111111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146106, 1, 137, N'111111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146107, 1, 138, N'111111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146108, 1, 139, N'111111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146109, 1, 140, N'111111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146110, 1, 141, N'111111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146111, 1, 142, N'111111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146112, 1, 143, N'111111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146113, 1, 144, N'111111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146114, 1, 145, N'111111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146115, 1, 146, N'111111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146116, 1, 147, N'111111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146117, 1, 148, N'111111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146118, 1, 149, N'111111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146119, 1, 150, N'111111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146120, 1, 151, N'111111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146121, 1, 152, N'111111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146122, 1, 153, N'111111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146123, 1, 154, N'111111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146124, 1, 155, N'111111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146125, 1, 156, N'111111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146126, 1, 157, N'111111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146127, 1, 158, N'111111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146128, 1, 159, N'111111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146129, 1, 160, N'111111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146130, 5, 19, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146131, 5, 20, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146132, 5, 21, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146133, 5, 22, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146134, 5, 23, N'111111110')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146135, 5, 24, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146136, 5, 25, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146137, 5, 26, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146138, 5, 27, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146139, 5, 28, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146140, 5, 29, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146141, 5, 30, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146142, 5, 31, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146143, 5, 32, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146144, 5, 33, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146145, 5, 34, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146146, 5, 35, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146147, 5, 36, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146148, 5, 37, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146149, 5, 38, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146150, 5, 39, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146151, 5, 40, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146152, 5, 41, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146153, 5, 42, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146154, 5, 43, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146155, 5, 44, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146156, 5, 45, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146157, 5, 46, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146158, 5, 47, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146159, 5, 48, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146160, 5, 49, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146161, 5, 50, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146162, 5, 51, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146163, 5, 52, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146164, 5, 53, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146165, 5, 54, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146166, 5, 55, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146167, 5, 56, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146168, 5, 57, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146169, 5, 58, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146170, 5, 59, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146171, 5, 60, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146172, 5, 61, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146173, 5, 62, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146174, 5, 63, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146175, 5, 64, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146176, 5, 65, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146177, 5, 66, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146178, 5, 67, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146179, 5, 68, N'111111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146180, 5, 69, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146181, 5, 70, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146182, 5, 71, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146183, 5, 72, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146184, 5, 73, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146185, 5, 74, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146186, 5, 75, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146187, 5, 76, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146188, 5, 77, N'011111111')
GO
print 'Processed 200 total records'
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146189, 5, 78, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146190, 5, 79, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146191, 5, 80, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146192, 5, 81, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146193, 5, 82, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146194, 5, 83, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146195, 5, 84, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146196, 5, 85, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146197, 5, 86, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146198, 5, 87, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146199, 5, 88, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146200, 5, 89, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146201, 5, 90, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146202, 5, 91, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146203, 5, 92, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146204, 5, 93, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146205, 5, 94, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146206, 5, 95, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146207, 5, 96, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146208, 5, 97, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146209, 5, 98, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146210, 5, 99, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146211, 5, 100, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146212, 5, 101, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146213, 5, 102, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146214, 5, 103, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146215, 5, 104, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146216, 5, 105, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146217, 5, 106, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146218, 5, 107, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146219, 5, 108, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146220, 5, 109, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146221, 5, 110, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146222, 5, 111, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146223, 5, 112, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146224, 5, 113, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146225, 5, 114, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146226, 5, 115, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146227, 5, 116, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146228, 5, 117, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146229, 5, 118, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146230, 5, 119, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146231, 5, 120, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146232, 5, 121, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146233, 5, 122, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146234, 5, 123, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146235, 5, 124, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146236, 5, 125, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146237, 5, 126, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146238, 5, 127, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146239, 5, 128, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146240, 5, 129, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146241, 5, 130, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146242, 5, 131, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146243, 5, 132, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146244, 5, 133, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146245, 5, 134, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146246, 5, 135, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146247, 5, 136, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146248, 5, 137, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146249, 5, 138, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146250, 5, 139, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146251, 5, 140, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146252, 5, 141, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146253, 5, 142, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146254, 5, 143, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146255, 5, 144, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146256, 5, 145, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146257, 5, 146, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146258, 5, 147, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146259, 5, 148, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146260, 5, 149, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146261, 5, 150, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146262, 5, 151, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146263, 5, 152, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146264, 5, 153, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146265, 5, 154, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146266, 5, 155, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146267, 5, 156, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146268, 5, 157, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146269, 5, 158, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146270, 5, 159, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146271, 5, 160, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146272, 6, 19, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146273, 6, 20, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146274, 6, 21, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146275, 6, 22, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146276, 6, 23, N'111111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146277, 6, 24, N'111111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146278, 6, 25, N'111111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146279, 6, 26, N'111111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146280, 6, 27, N'111111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146281, 6, 28, N'111111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146282, 6, 29, N'111111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146283, 6, 30, N'111111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146284, 6, 31, N'111111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146285, 6, 32, N'111111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146286, 6, 33, N'111111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146287, 6, 34, N'111111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146288, 6, 35, N'111111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146289, 6, 36, N'111111111')
GO
print 'Processed 300 total records'
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146290, 6, 37, N'111111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146291, 6, 38, N'111111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146292, 6, 39, N'111111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146293, 6, 40, N'111111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146294, 6, 41, N'111111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146295, 6, 42, N'111111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146296, 6, 43, N'111111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146297, 6, 44, N'111111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146298, 6, 45, N'111111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146299, 6, 46, N'111111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146300, 6, 47, N'111111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146301, 6, 48, N'111111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146302, 6, 49, N'111111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146303, 6, 50, N'111111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146304, 6, 51, N'111111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146305, 6, 52, N'111111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146306, 6, 53, N'111111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146307, 6, 54, N'111111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146308, 6, 55, N'111111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146309, 6, 56, N'111111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146310, 6, 57, N'111111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146311, 6, 58, N'111111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146312, 6, 59, N'111111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146313, 6, 60, N'111111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146314, 6, 61, N'111111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146315, 6, 62, N'111111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146316, 6, 63, N'111111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146317, 6, 64, N'111111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146318, 6, 65, N'111111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146319, 6, 66, N'111111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146320, 6, 67, N'111111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146321, 6, 68, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146322, 6, 69, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146323, 6, 70, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146324, 6, 71, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146325, 6, 72, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146326, 6, 73, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146327, 6, 74, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146328, 6, 75, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146329, 6, 76, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146330, 6, 77, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146331, 6, 78, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146332, 6, 79, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146333, 6, 80, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146334, 6, 81, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146335, 6, 82, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146336, 6, 83, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146337, 6, 84, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146338, 6, 85, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146339, 6, 86, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146340, 6, 87, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146341, 6, 88, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146342, 6, 89, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146343, 6, 90, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146344, 6, 91, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146345, 6, 92, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146346, 6, 93, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146347, 6, 94, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146348, 6, 95, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146349, 6, 96, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146350, 6, 97, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146351, 6, 98, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146352, 6, 99, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146353, 6, 100, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146354, 6, 101, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146355, 6, 102, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146356, 6, 103, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146357, 6, 104, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146358, 6, 105, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146359, 6, 106, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146360, 6, 107, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146361, 6, 108, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146362, 6, 109, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146363, 6, 110, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146364, 6, 111, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146365, 6, 112, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146366, 6, 113, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146367, 6, 114, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146368, 6, 115, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146369, 6, 116, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146370, 6, 117, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146371, 6, 118, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146372, 6, 119, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146373, 6, 120, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146374, 6, 121, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146375, 6, 122, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146376, 6, 123, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146377, 6, 124, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146378, 6, 125, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146379, 6, 126, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146380, 6, 127, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146381, 6, 128, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146382, 6, 129, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146383, 6, 130, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146384, 6, 131, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146385, 6, 132, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146386, 6, 133, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146387, 6, 134, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146388, 6, 135, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146389, 6, 136, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146390, 6, 137, N'011111111')
GO
print 'Processed 400 total records'
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146391, 6, 138, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146392, 6, 139, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146393, 6, 140, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146394, 6, 141, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146395, 6, 142, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146396, 6, 143, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146397, 6, 144, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146398, 6, 145, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146399, 6, 146, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146400, 6, 147, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146401, 6, 148, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146402, 6, 149, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146403, 6, 150, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146404, 6, 151, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146405, 6, 152, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146406, 6, 153, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146407, 6, 154, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146408, 6, 155, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146409, 6, 156, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146410, 6, 157, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146411, 6, 158, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146412, 6, 159, N'011111111')
INSERT [dbo].[tbl_UserGroupRights] ([id], [groupID], [menuItemID], [rights]) VALUES (146413, 6, 160, N'011111111')
SET IDENTITY_INSERT [dbo].[tbl_UserGroupRights] OFF
/****** Object:  Table [dbo].[tbl_Settings]    Script Date: 04/04/2016 22:49:02 ******/
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
/****** Object:  Table [dbo].[tbl_MenuItems]    Script Date: 04/04/2016 22:49:02 ******/
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
INSERT [dbo].[tbl_MenuItems] ([id], [parentid], [text], [pagename], [orderNrInParent]) VALUES (160, 19, N'set usergroup rights', N'treeview', 400)
SET IDENTITY_INSERT [dbo].[tbl_MenuItems] OFF
/****** Object:  StoredProcedure [dbo].[updateItemRightsForGroup]    Script Date: 04/04/2016 22:49:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ====================================================
-- Author:		Dennis Bellinkx
-- Create date: 2016-03-02
-- Description:	Creates a right entry for a given group
-- ====================================================
create PROCEDURE [dbo].[updateItemRightsForGroup]
	@groupID int
  , @menuItemID int
  , @rights nvarchar(20)

AS
	update	tbl_UserGroupRights
	set		rights = @rights
	where	groupID = @groupID and menuItemID = @menuItemID
GO
/****** Object:  StoredProcedure [dbo].[restoreAdminRights]    Script Date: 04/04/2016 22:49:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[restoreAdminRights]
	@adminGroupID int
AS
BEGIN
	DELETE FROM dbo.tbl_UserGroupRights WHERE groupID = @adminGroupID;

	DECLARE @itemID int;
	DECLARE @allRights int;
	set @allRights = '111111111';

	DECLARE MY_CURSOR CURSOR 
	  LOCAL STATIC READ_ONLY FORWARD_ONLY
	FOR 
		SELECT ID FROM dbo.tbl_MenuItems

	OPEN MY_CURSOR
	FETCH NEXT FROM MY_CURSOR INTO @itemID
	WHILE @@FETCH_STATUS = 0
	BEGIN 
		INSERT INTO dbo.tbl_UserGroupRights (groupID, menuItemID, rights)
		VALUES (@adminGroupID, @itemID, @allRights);
		FETCH NEXT FROM MY_CURSOR INTO @itemID
	END
	CLOSE MY_CURSOR
	DEALLOCATE MY_CURSOR
END
GO
/****** Object:  StoredProcedure [dbo].[getUserGroups]    Script Date: 04/04/2016 22:49:05 ******/
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
/****** Object:  StoredProcedure [dbo].[getUserGroup]    Script Date: 04/04/2016 22:49:05 ******/
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
/****** Object:  StoredProcedure [dbo].[getUser]    Script Date: 04/04/2016 22:49:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =================================================
-- Author:		Dennis Bellinkx
-- Create date: 2015-11-06
-- Description:	get a user on login/password combo
-- =================================================
CREATE PROCEDURE [dbo].[getUser]
	@login		nvarchar(50)
  , @password	nvarchar(50)
AS
	select	id, emailAddress, groupID
	from	tbl_Users
	where	login = @login
		and password = @password
GO
/****** Object:  StoredProcedure [dbo].[getItemsForGroup]    Script Date: 04/04/2016 22:49:05 ******/
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
/****** Object:  StoredProcedure [dbo].[getAllUsersForGroup]    Script Date: 04/04/2016 22:49:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =================================================
-- Author:		Dennis Bellinkx
-- Create date: 2016-04-04
-- Description:	gets all user for given groupId
-- =================================================
CREATE PROCEDURE [dbo].[getAllUsersForGroup]
	@groupID int
AS
	select	id, [login], emailAddress
	from	tbl_Users
	where	groupID = @groupID;
GO
/****** Object:  StoredProcedure [dbo].[getAllItems]    Script Date: 04/04/2016 22:49:05 ******/
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
/****** Object:  StoredProcedure [dbo].[deleteAllRightsForGroup]    Script Date: 04/04/2016 22:49:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ===================================================
-- Author:		Dennis Bellinkx
-- Create date: 2016-03-01
-- Description:	deletes all items for given group (ID)
-- ===================================================
create PROCEDURE [dbo].[deleteAllRightsForGroup] 
	@groupID int
AS
	delete		
	from		tbl_UserGroupRights
	where		groupID = @groupID
GO
/****** Object:  StoredProcedure [dbo].[createUserGroup]    Script Date: 04/04/2016 22:49:05 ******/
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
						values (@groupname);
						
	declare @newID int = SCOPE_IDENTITY();
	
	insert	into tbl_UserGroupRights (groupID, menuItemID, rights)
	select	@newID, id, '111010111'
	from	tbl_MenuItems;
	
	--update	tbl_UserGroupRights
	--set		rights = '10000'
	--where	menuItemID in (select	top(1) id
	--					   from		tbl_MenuItems
	--					   where	pagename = 'logout')
	--    and groupID = @newID;
GO
/****** Object:  StoredProcedure [dbo].[createUser]    Script Date: 04/04/2016 22:49:05 ******/
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
  , @email nvarchar(50)
  , @groupID int

AS
	insert into	tbl_Users (login, password, emailAddress, groupID)
				   values (@login, @password, @email, @groupID)
GO
/****** Object:  StoredProcedure [dbo].[createRightsForGroup]    Script Date: 04/04/2016 22:49:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ====================================================
-- Author:		Dennis Bellinkx
-- Create date: 2015-11-17
-- Description:	Creates a right entry for a given group
-- ====================================================
create PROCEDURE [dbo].[createRightsForGroup]
	@groupID int
  , @menuItemID int
  , @rights nvarchar(20)

AS
	insert into tbl_UserGroupRights (groupID, menuItemID, rights)
	select	@groupID, menuItemID, rights
	from	tbl_UserGroupRights
GO
/****** Object:  StoredProcedure [dbo].[createMenuItem]    Script Date: 04/04/2016 22:49:05 ******/
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
	-- insert new menu item
	declare @newItemID int;
	declare @adminGroupID int;
	
	insert into	tbl_MenuItems ([text], parentid, orderNrInParent, pagename)
					   values (@text, @parentID, @orderNrInParent, @pageName);

	set @newItemID = SCOPE_IDENTITY();
	
	-- give admins full rights
	set @adminGroupID = (select id from tbl_UserGroups where name = 'administrators');
	
	insert into	tbl_UserGroupRights (groupID, menuItemID, rights)
							 values (@adminGroupID, @newItemID, 11111);
						
	-- insert this item for all usergroups (except for admins), without rights
	DECLARE @groupID int;						 
	DECLARE @stdRights int;
	set @stdRights = '111010111';

	DECLARE MY_CURSOR CURSOR 
	  LOCAL STATIC READ_ONLY FORWARD_ONLY
	FOR 
		SELECT ID FROM dbo.tbl_UserGroups
		WHERE name <> 'administrators'

	OPEN MY_CURSOR
	FETCH NEXT FROM MY_CURSOR INTO @groupID
	WHILE @@FETCH_STATUS = 0
	BEGIN 
		INSERT INTO dbo.tbl_UserGroupRights (groupID, menuItemID, rights)
		VALUES (@groupID, @newItemID, @stdRights);
		FETCH NEXT FROM MY_CURSOR INTO @groupID
	END
	CLOSE MY_CURSOR
	DEALLOCATE MY_CURSOR
GO
/****** Object:  StoredProcedure [dbo].[createCopyOfGroup]    Script Date: 04/04/2016 22:49:05 ******/
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
/****** Object:  StoredProcedure [dbo].[checkIfUserNameAlreadyExists]    Script Date: 04/04/2016 22:49:05 ******/
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
