USE [master]
GO
/****** Object:  Database [MangoPlatformDB]    Script Date: 2020-03-10 14:21:07 ******/
CREATE DATABASE [MangoPlatformDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MangoPlatformDB', FILENAME = N'/var/opt/mssql/data/MangoPlatformDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MangoPlatformDB_log', FILENAME = N'/var/opt/mssql/data/MangoPlatformDB_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MangoPlatformDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MangoPlatformDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MangoPlatformDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MangoPlatformDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MangoPlatformDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MangoPlatformDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [MangoPlatformDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MangoPlatformDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MangoPlatformDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MangoPlatformDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MangoPlatformDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MangoPlatformDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MangoPlatformDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MangoPlatformDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MangoPlatformDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MangoPlatformDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MangoPlatformDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MangoPlatformDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MangoPlatformDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MangoPlatformDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MangoPlatformDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MangoPlatformDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MangoPlatformDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MangoPlatformDB] SET RECOVERY FULL 
GO
ALTER DATABASE [MangoPlatformDB] SET  MULTI_USER 
GO
ALTER DATABASE [MangoPlatformDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MangoPlatformDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MangoPlatformDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MangoPlatformDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MangoPlatformDB] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'MangoPlatformDB', N'ON'
GO
ALTER DATABASE [MangoPlatformDB] SET QUERY_STORE = OFF
GO
USE [MangoPlatformDB]
GO
/****** Object:  Table [dbo].[m_Account]    Script Date: 2020-03-10 14:21:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[m_Account](
	[AccountId] [int] IDENTITY(1,1) NOT NULL,
	[AccountName] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
	[NickName] [nvarchar](20) NULL,
	[HeadUrl] [varchar](200) NULL,
	[StateCode] [int] NULL,
	[Phone] [varchar](20) NULL,
	[Email] [varchar](100) NULL,
	[RegisterDate] [datetime] NULL,
	[LastLoginDate] [datetime] NULL,
	[AddressInfo] [nvarchar](50) NULL,
	[Birthday] [varchar](30) NULL,
	[Tags] [nvarchar](300) NULL,
	[Sex] [nvarchar](10) NULL,
	[GroupId] [int] NULL,
 CONSTRAINT [PK_m_User] PRIMARY KEY CLUSTERED 
(
	[AccountId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[m_AccountGroup]    Script Date: 2020-03-10 14:21:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[m_AccountGroup](
	[GroupId] [int] IDENTITY(1,1) NOT NULL,
	[GroupName] [nvarchar](50) NOT NULL,
	[IsDefault] [bit] NULL,
 CONSTRAINT [PK_m_UserGroup] PRIMARY KEY CLUSTERED 
(
	[GroupId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[m_AccountGroupMenu]    Script Date: 2020-03-10 14:21:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[m_AccountGroupMenu](
	[MenuId] [int] IDENTITY(100,1) NOT NULL,
	[MenuName] [nvarchar](50) NULL,
	[AreaName] [varchar](50) NULL,
	[ControllerName] [varchar](50) NULL,
	[ActionName] [varchar](50) NULL,
	[ModuleId] [int] NULL,
	[ParentCode] [varchar](50) NULL,
 CONSTRAINT [PK_m_UserGroupMenu] PRIMARY KEY CLUSTERED 
(
	[MenuId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[m_AccountGroupPower]    Script Date: 2020-03-10 14:21:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[m_AccountGroupPower](
	[PId] [int] IDENTITY(1,1) NOT NULL,
	[MenuId] [int] NOT NULL,
	[GroupId] [int] NOT NULL,
 CONSTRAINT [PK_m_UserGroupPower] PRIMARY KEY CLUSTERED 
(
	[PId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[m_AccountPlusRecords]    Script Date: 2020-03-10 14:21:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[m_AccountPlusRecords](
	[RecordsId] [int] IDENTITY(1,1) NOT NULL,
	[ObjectId] [int] NULL,
	[AccountId] [int] NULL,
	[AppendTime] [datetime] NULL,
	[RecordsType] [int] NULL,
 CONSTRAINT [PK_m_PlusRecords] PRIMARY KEY CLUSTERED 
(
	[RecordsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[m_AppManager]    Script Date: 2020-03-10 14:21:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[m_AppManager](
	[AppId] [int] IDENTITY(1,1) NOT NULL,
	[AppName] [nvarchar](50) NULL,
	[RemarkText] [nvarchar](500) NULL,
	[IsOpen] [bit] NULL,
	[OpenUrl] [varchar](120) NULL,
	[OpenIP] [varchar](100) NULL,
	[AppKey] [varchar](50) NULL,
	[AppSecret] [varchar](80) NULL,
	[AppendTime] [datetime] NULL,
	[LastTime] [datetime] NULL,
 CONSTRAINT [PK_m_AppManager] PRIMARY KEY CLUSTERED 
(
	[AppId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[m_CmsAttention]    Script Date: 2020-03-10 14:21:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[m_CmsAttention](
	[AttentionId] [int] IDENTITY(1,1) NOT NULL,
	[ContentsId] [int] NULL,
	[AttentionTime] [datetime] NULL,
	[AccountId] [int] NULL,
 CONSTRAINT [PK_m_PostsAttention] PRIMARY KEY CLUSTERED 
(
	[AttentionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[m_CmsChannel]    Script Date: 2020-03-10 14:21:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[m_CmsChannel](
	[ChannelId] [int] IDENTITY(1,1) NOT NULL,
	[ChannelName] [nvarchar](30) NULL,
	[RemarkText] [nvarchar](500) NULL,
	[StateCode] [int] NULL,
	[AppendTime] [datetime] NULL,
	[SortCount] [int] NULL,
 CONSTRAINT [PK_m_PostsChannel] PRIMARY KEY CLUSTERED 
(
	[ChannelId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[m_CmsContents]    Script Date: 2020-03-10 14:21:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[m_CmsContents](
	[ContentsId] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NULL,
	[Contents] [nvarchar](max) NULL,
	[PostTime] [datetime] NULL,
	[LastTime] [datetime] NULL,
	[AccountId] [int] NULL,
	[PlusCount] [int] NULL,
	[ReadCount] [int] NULL,
	[StateCode] [int] NULL,
	[Tags] [nvarchar](100) NULL,
	[ImgUrl] [varchar](1000) NULL,
	[AnswerCount] [int] NULL,
	[ChannelId] [int] NULL,
 CONSTRAINT [PK_m_CmsContents] PRIMARY KEY CLUSTERED 
(
	[ContentsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[m_Docs]    Script Date: 2020-03-10 14:21:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[m_Docs](
	[DocsId] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NULL,
	[ShortTitle] [nvarchar](50) NULL,
	[Contents] [nvarchar](max) NULL,
	[AppendTime] [datetime] NULL,
	[LastTime] [datetime] NULL,
	[ThemeId] [int] NULL,
	[AccountId] [int] NULL,
	[ReadCount] [int] NULL,
	[PlusCount] [int] NULL,
	[Tags] [nvarchar](50) NULL,
	[VersionText] [text] NULL,
	[IsShow] [bit] NULL,
	[IsAudit] [bit] NULL,
 CONSTRAINT [PK_m_DocumentItems] PRIMARY KEY CLUSTERED 
(
	[DocsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[m_DocsTheme]    Script Date: 2020-03-10 14:21:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[m_DocsTheme](
	[ThemeId] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NULL,
	[Contents] [nvarchar](max) NULL,
	[AccountId] [int] NULL,
	[AppendTime] [datetime] NULL,
	[LastTime] [datetime] NULL,
	[ReadCount] [int] NULL,
	[PlusCount] [int] NULL,
	[Tags] [nvarchar](50) NULL,
	[VersionText] [varchar](500) NULL,
	[IsShow] [bit] NULL,
 CONSTRAINT [PK_m_Document] PRIMARY KEY CLUSTERED 
(
	[ThemeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[m_ManagerAccount]    Script Date: 2020-03-10 14:21:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[m_ManagerAccount](
	[AdminId] [int] IDENTITY(1,1) NOT NULL,
	[AdminName] [nvarchar](30) NULL,
	[Password] [varchar](50) NULL,
	[IsStatus] [bit] NULL,
	[RoleId] [int] NULL,
 CONSTRAINT [PK_m_ManagerAdmin] PRIMARY KEY CLUSTERED 
(
	[AdminId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[m_ManagerMenu]    Script Date: 2020-03-10 14:21:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[m_ManagerMenu](
	[MenuId] [int] IDENTITY(100,1) NOT NULL,
	[MenuName] [nvarchar](30) NOT NULL,
	[AreaName] [varchar](50) NULL,
	[ControllerName] [varchar](50) NULL,
	[ActionName] [varchar](50) NULL,
	[ParentId] [int] NULL,
	[IsPower] [bit] NULL,
 CONSTRAINT [PK_m_ManagerMenu] PRIMARY KEY CLUSTERED 
(
	[MenuId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[m_ManagerPower]    Script Date: 2020-03-10 14:21:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[m_ManagerPower](
	[PowerId] [int] IDENTITY(1,1) NOT NULL,
	[MenuId] [int] NOT NULL,
	[RoleId] [int] NOT NULL,
 CONSTRAINT [PK_m_ManagerPower] PRIMARY KEY CLUSTERED 
(
	[PowerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[m_ManagerRole]    Script Date: 2020-03-10 14:21:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[m_ManagerRole](
	[RoleId] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](30) NULL,
 CONSTRAINT [PK_m_ManagerRole] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[m_Message]    Script Date: 2020-03-10 14:21:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[m_Message](
	[MessageId] [int] IDENTITY(1,1) NOT NULL,
	[MessageType] [int] NULL,
	[Contents] [nvarchar](2000) NULL,
	[PostTime] [datetime] NULL,
	[AccountId] [int] NULL,
	[AppendAccountId] [int] NULL,
	[ObjectId] [int] NULL,
	[IsRead] [bit] NULL,
 CONSTRAINT [PK_m_Message] PRIMARY KEY CLUSTERED 
(
	[MessageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[m_Navigation]    Script Date: 2020-03-10 14:21:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[m_Navigation](
	[NavigationId] [int] IDENTITY(100,1) NOT NULL,
	[NavigationName] [nvarchar](50) NULL,
	[IsShow] [bit] NULL,
	[Remark] [nvarchar](500) NULL,
	[CId] [int] NULL,
	[NavigationUrl] [varchar](200) NULL,
	[ClickCount] [int] NULL,
 CONSTRAINT [PK_m_Navigation] PRIMARY KEY CLUSTERED 
(
	[NavigationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[m_NavigationClassify]    Script Date: 2020-03-10 14:21:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[m_NavigationClassify](
	[CId] [int] IDENTITY(1,1) NOT NULL,
	[ClassifyName] [nvarchar](50) NULL,
	[IsShow] [bit] NULL,
	[SortCount] [int] NULL,
 CONSTRAINT [PK_m_NavigationClassify] PRIMARY KEY CLUSTERED 
(
	[CId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[m_Sms]    Script Date: 2020-03-10 14:21:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[m_Sms](
	[SmsID] [int] IDENTITY(1,1) NOT NULL,
	[Phone] [varchar](100) NULL,
	[Contents] [nvarchar](2000) NULL,
	[SendTime] [datetime] NULL,
	[SendIP] [varchar](50) NULL,
	[IsOk] [bit] NULL,
 CONSTRAINT [PK_m_Sms] PRIMARY KEY CLUSTERED 
(
	[SmsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[m_WebSiteConfig]    Script Date: 2020-03-10 14:21:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[m_WebSiteConfig](
	[ConfigId] [int] NOT NULL,
	[WebSiteName] [nvarchar](50) NULL,
	[WebSiteUrl] [varchar](100) NULL,
	[WebSiteTitle] [nvarchar](100) NULL,
	[WebSiteKeyWord] [nvarchar](100) NULL,
	[WebSiteDescription] [nvarchar](200) NULL,
	[CopyrightText] [nvarchar](2000) NULL,
	[IsLogin] [bit] NULL,
	[IsRegister] [bit] NULL,
	[FilingNo] [nvarchar](50) NULL,
 CONSTRAINT [PK_m_WebSiteConfig] PRIMARY KEY CLUSTERED 
(
	[ConfigId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[m_WebSiteNavigation]    Script Date: 2020-03-10 14:21:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[m_WebSiteNavigation](
	[NavigationId] [int] IDENTITY(1,1) NOT NULL,
	[LinkUrl] [varchar](200) NULL,
	[NavigationName] [nvarchar](20) NULL,
	[IsTarget] [bit] NULL,
	[AppendTime] [datetime] NULL,
	[SortCount] [int] NULL,
	[IsShow] [bit] NULL,
 CONSTRAINT [PK_m_WebSiteNavigation] PRIMARY KEY CLUSTERED 
(
	[NavigationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[m_Account] ON 

INSERT [dbo].[m_Account] ([AccountId], [AccountName], [Password], [NickName], [HeadUrl], [StateCode], [Phone], [Email], [RegisterDate], [LastLoginDate], [AddressInfo], [Birthday], [Tags], [Sex], [GroupId]) VALUES (2, N'admin@51core.net', N'e10adc3949ba59abbe56e057f20f883e', N'测试账号', N'https://file.51core.net/2/2019/3/f65c7433f114416fb44e6170cdf0ce67.png', 1, N'18812345678', N'', CAST(N'2017-04-28T11:50:43.790' AS DateTime), CAST(N'2017-04-28T11:50:43.790' AS DateTime), N'深圳', N'', N'一枚.NET程序员', N'男', 100)
SET IDENTITY_INSERT [dbo].[m_AccountGroup] ON 

INSERT [dbo].[m_AccountGroup] ([GroupId], [GroupName], [IsDefault]) VALUES (0, N'游客', 1)
INSERT [dbo].[m_AccountGroup] ([GroupId], [GroupName], [IsDefault]) VALUES (1, N'普通用户', 0)
INSERT [dbo].[m_AccountGroup] ([GroupId], [GroupName], [IsDefault]) VALUES (100, N'系统管理员', 0)
INSERT [dbo].[m_AccountGroup] ([GroupId], [GroupName], [IsDefault]) VALUES (101, N'用户手机绑定组', 0)
SET IDENTITY_INSERT [dbo].[m_AccountGroup] OFF
SET IDENTITY_INSERT [dbo].[m_AccountGroupMenu] ON 

INSERT [dbo].[m_AccountGroupMenu] ([MenuId], [MenuName], [AreaName], [ControllerName], [ActionName], [ModuleId], [ParentCode]) VALUES (1181, N'验证码获取', N'Account', N'Authorization', N'SendEmailValidateCode', 1, N'1181')
INSERT [dbo].[m_AccountGroupMenu] ([MenuId], [MenuName], [AreaName], [ControllerName], [ActionName], [ModuleId], [ParentCode]) VALUES (1182, N'账号登录', N'Account', N'Login', N'Index', 1, N'1182')
INSERT [dbo].[m_AccountGroupMenu] ([MenuId], [MenuName], [AreaName], [ControllerName], [ActionName], [ModuleId], [ParentCode]) VALUES (1183, N'账号退出', N'Account', N'Login', N'OutLogin', 1, N'1183')
INSERT [dbo].[m_AccountGroupMenu] ([MenuId], [MenuName], [AreaName], [ControllerName], [ActionName], [ModuleId], [ParentCode]) VALUES (1184, N'个人中心-我的消息', N'Account', N'My', N'Message', 1, N'1184')
INSERT [dbo].[m_AccountGroupMenu] ([MenuId], [MenuName], [AreaName], [ControllerName], [ActionName], [ModuleId], [ParentCode]) VALUES (1185, N'个人中心-我的账号', N'Account', N'My', N'Info', 1, N'1185')
INSERT [dbo].[m_AccountGroupMenu] ([MenuId], [MenuName], [AreaName], [ControllerName], [ActionName], [ModuleId], [ParentCode]) VALUES (1186, N'个人中心-账号信息编辑', N'Account', N'My', N'Information', 1, N'1186')
INSERT [dbo].[m_AccountGroupMenu] ([MenuId], [MenuName], [AreaName], [ControllerName], [ActionName], [ModuleId], [ParentCode]) VALUES (1187, N'个人中心-账号密码修改', N'Account', N'My', N'Password', 1, N'1187')
INSERT [dbo].[m_AccountGroupMenu] ([MenuId], [MenuName], [AreaName], [ControllerName], [ActionName], [ModuleId], [ParentCode]) VALUES (1188, N'账号注册', N'Account', N'Register', N'Index', 1, N'1188')
INSERT [dbo].[m_AccountGroupMenu] ([MenuId], [MenuName], [AreaName], [ControllerName], [ActionName], [ModuleId], [ParentCode]) VALUES (1189, N'CMS全部频道', N'Cms', N'Channel', N'Index', 2, N'1189')
INSERT [dbo].[m_AccountGroupMenu] ([MenuId], [MenuName], [AreaName], [ControllerName], [ActionName], [ModuleId], [ParentCode]) VALUES (1190, N'CMS频道列表', N'Cms', N'Channel', N'List', 2, N'1190')
INSERT [dbo].[m_AccountGroupMenu] ([MenuId], [MenuName], [AreaName], [ControllerName], [ActionName], [ModuleId], [ParentCode]) VALUES (1191, N'CMS文章内容编辑', N'Cms', N'Edit', N'Index', 2, N'1191')
INSERT [dbo].[m_AccountGroupMenu] ([MenuId], [MenuName], [AreaName], [ControllerName], [ActionName], [ModuleId], [ParentCode]) VALUES (1192, N'CMS文章内容发布', N'Cms', N'Release', N'Index', 2, N'1192')
INSERT [dbo].[m_AccountGroupMenu] ([MenuId], [MenuName], [AreaName], [ControllerName], [ActionName], [ModuleId], [ParentCode]) VALUES (1193, N'CMS文章详情页', N'Cms', N'Read', N'Index', 2, N'1193')
INSERT [dbo].[m_AccountGroupMenu] ([MenuId], [MenuName], [AreaName], [ControllerName], [ActionName], [ModuleId], [ParentCode]) VALUES (1194, N'CMS文章内容+1', N'Cms', N'Plus', N'Add', 2, N'1194')
INSERT [dbo].[m_AccountGroupMenu] ([MenuId], [MenuName], [AreaName], [ControllerName], [ActionName], [ModuleId], [ParentCode]) VALUES (1195, N'文档主题编辑', N'Docs', N'Edit', N'Theme', 3, N'1195')
INSERT [dbo].[m_AccountGroupMenu] ([MenuId], [MenuName], [AreaName], [ControllerName], [ActionName], [ModuleId], [ParentCode]) VALUES (1196, N'文档编辑', N'Docs', N'Edit', N'Document', 3, N'1196')
INSERT [dbo].[m_AccountGroupMenu] ([MenuId], [MenuName], [AreaName], [ControllerName], [ActionName], [ModuleId], [ParentCode]) VALUES (1197, N'文档主题+1', N'Docs', N'Plus', N'Theme', 3, N'1197')
INSERT [dbo].[m_AccountGroupMenu] ([MenuId], [MenuName], [AreaName], [ControllerName], [ActionName], [ModuleId], [ParentCode]) VALUES (1198, N'文档+1', N'Docs', N'Plus', N'Docs', 3, N'1198')
INSERT [dbo].[m_AccountGroupMenu] ([MenuId], [MenuName], [AreaName], [ControllerName], [ActionName], [ModuleId], [ParentCode]) VALUES (1199, N'文档详情页', N'Docs', N'Read', N'Index', 3, N'1199')
INSERT [dbo].[m_AccountGroupMenu] ([MenuId], [MenuName], [AreaName], [ControllerName], [ActionName], [ModuleId], [ParentCode]) VALUES (1200, N'文档主题发布', N'Docs', N'Release', N'Theme', 3, N'1200')
INSERT [dbo].[m_AccountGroupMenu] ([MenuId], [MenuName], [AreaName], [ControllerName], [ActionName], [ModuleId], [ParentCode]) VALUES (1201, N'文档发布', N'Docs', N'Release', N'Document', 3, N'1201')
INSERT [dbo].[m_AccountGroupMenu] ([MenuId], [MenuName], [AreaName], [ControllerName], [ActionName], [ModuleId], [ParentCode]) VALUES (1202, N'文档主题列表', N'Docs', N'Theme', N'Index', 3, N'1202')
INSERT [dbo].[m_AccountGroupMenu] ([MenuId], [MenuName], [AreaName], [ControllerName], [ActionName], [ModuleId], [ParentCode]) VALUES (1204, N'获取用户消息列表', N'', N'Message', N'GetMessageList', 0, N'1204')
INSERT [dbo].[m_AccountGroupMenu] ([MenuId], [MenuName], [AreaName], [ControllerName], [ActionName], [ModuleId], [ParentCode]) VALUES (1205, N'更新用户消息状态', N'', N'Message', N'UpdateMessageReadState', 0, N'1205')
INSERT [dbo].[m_AccountGroupMenu] ([MenuId], [MenuName], [AreaName], [ControllerName], [ActionName], [ModuleId], [ParentCode]) VALUES (1206, N'获取用户消息数', N'', N'Message', N'GetMessageCount', 0, N'1206')
INSERT [dbo].[m_AccountGroupMenu] ([MenuId], [MenuName], [AreaName], [ControllerName], [ActionName], [ModuleId], [ParentCode]) VALUES (1207, N'用户发布的文章', N'Cms', N'My', N'Article', 2, N'1207')
INSERT [dbo].[m_AccountGroupMenu] ([MenuId], [MenuName], [AreaName], [ControllerName], [ActionName], [ModuleId], [ParentCode]) VALUES (1208, N'用户发布的文档主题列表', N'Docs', N'My', N'Theme', 3, N'1208')
INSERT [dbo].[m_AccountGroupMenu] ([MenuId], [MenuName], [AreaName], [ControllerName], [ActionName], [ModuleId], [ParentCode]) VALUES (1209, N'用户发布的文档列表', N'Docs', N'My', N'Document', 3, N'1209')
INSERT [dbo].[m_AccountGroupMenu] ([MenuId], [MenuName], [AreaName], [ControllerName], [ActionName], [ModuleId], [ParentCode]) VALUES (1210, N'文件上传', N'', N'File', N'UPYun', 0, N'1210')
SET IDENTITY_INSERT [dbo].[m_AccountGroupMenu] OFF
SET IDENTITY_INSERT [dbo].[m_AccountGroupPower] ON 

INSERT [dbo].[m_AccountGroupPower] ([PId], [MenuId], [GroupId]) VALUES (3085, 1181, 100)
INSERT [dbo].[m_AccountGroupPower] ([PId], [MenuId], [GroupId]) VALUES (3086, 1182, 100)
INSERT [dbo].[m_AccountGroupPower] ([PId], [MenuId], [GroupId]) VALUES (3087, 1183, 100)
INSERT [dbo].[m_AccountGroupPower] ([PId], [MenuId], [GroupId]) VALUES (3088, 1184, 100)
INSERT [dbo].[m_AccountGroupPower] ([PId], [MenuId], [GroupId]) VALUES (3089, 1185, 100)
INSERT [dbo].[m_AccountGroupPower] ([PId], [MenuId], [GroupId]) VALUES (3090, 1186, 100)
INSERT [dbo].[m_AccountGroupPower] ([PId], [MenuId], [GroupId]) VALUES (3091, 1187, 100)
INSERT [dbo].[m_AccountGroupPower] ([PId], [MenuId], [GroupId]) VALUES (3092, 1188, 100)
INSERT [dbo].[m_AccountGroupPower] ([PId], [MenuId], [GroupId]) VALUES (3093, 1189, 100)
INSERT [dbo].[m_AccountGroupPower] ([PId], [MenuId], [GroupId]) VALUES (3094, 1190, 100)
INSERT [dbo].[m_AccountGroupPower] ([PId], [MenuId], [GroupId]) VALUES (3095, 1191, 100)
INSERT [dbo].[m_AccountGroupPower] ([PId], [MenuId], [GroupId]) VALUES (3096, 1192, 100)
INSERT [dbo].[m_AccountGroupPower] ([PId], [MenuId], [GroupId]) VALUES (3097, 1193, 100)
INSERT [dbo].[m_AccountGroupPower] ([PId], [MenuId], [GroupId]) VALUES (3098, 1194, 100)
INSERT [dbo].[m_AccountGroupPower] ([PId], [MenuId], [GroupId]) VALUES (3099, 1195, 100)
INSERT [dbo].[m_AccountGroupPower] ([PId], [MenuId], [GroupId]) VALUES (3100, 1196, 100)
INSERT [dbo].[m_AccountGroupPower] ([PId], [MenuId], [GroupId]) VALUES (3101, 1197, 100)
INSERT [dbo].[m_AccountGroupPower] ([PId], [MenuId], [GroupId]) VALUES (3102, 1198, 100)
INSERT [dbo].[m_AccountGroupPower] ([PId], [MenuId], [GroupId]) VALUES (3103, 1199, 100)
INSERT [dbo].[m_AccountGroupPower] ([PId], [MenuId], [GroupId]) VALUES (3104, 1200, 100)
INSERT [dbo].[m_AccountGroupPower] ([PId], [MenuId], [GroupId]) VALUES (3105, 1201, 100)
INSERT [dbo].[m_AccountGroupPower] ([PId], [MenuId], [GroupId]) VALUES (3106, 1202, 100)
INSERT [dbo].[m_AccountGroupPower] ([PId], [MenuId], [GroupId]) VALUES (3107, 1181, 1)
INSERT [dbo].[m_AccountGroupPower] ([PId], [MenuId], [GroupId]) VALUES (3108, 1182, 1)
INSERT [dbo].[m_AccountGroupPower] ([PId], [MenuId], [GroupId]) VALUES (3109, 1183, 1)
INSERT [dbo].[m_AccountGroupPower] ([PId], [MenuId], [GroupId]) VALUES (3110, 1184, 1)
INSERT [dbo].[m_AccountGroupPower] ([PId], [MenuId], [GroupId]) VALUES (3111, 1185, 1)
INSERT [dbo].[m_AccountGroupPower] ([PId], [MenuId], [GroupId]) VALUES (3112, 1186, 1)
INSERT [dbo].[m_AccountGroupPower] ([PId], [MenuId], [GroupId]) VALUES (3113, 1187, 1)
INSERT [dbo].[m_AccountGroupPower] ([PId], [MenuId], [GroupId]) VALUES (3114, 1188, 1)
INSERT [dbo].[m_AccountGroupPower] ([PId], [MenuId], [GroupId]) VALUES (3115, 1189, 1)
INSERT [dbo].[m_AccountGroupPower] ([PId], [MenuId], [GroupId]) VALUES (3116, 1190, 1)
INSERT [dbo].[m_AccountGroupPower] ([PId], [MenuId], [GroupId]) VALUES (3117, 1191, 1)
INSERT [dbo].[m_AccountGroupPower] ([PId], [MenuId], [GroupId]) VALUES (3118, 1192, 1)
INSERT [dbo].[m_AccountGroupPower] ([PId], [MenuId], [GroupId]) VALUES (3119, 1193, 1)
INSERT [dbo].[m_AccountGroupPower] ([PId], [MenuId], [GroupId]) VALUES (3120, 1194, 1)
INSERT [dbo].[m_AccountGroupPower] ([PId], [MenuId], [GroupId]) VALUES (3121, 1195, 1)
INSERT [dbo].[m_AccountGroupPower] ([PId], [MenuId], [GroupId]) VALUES (3122, 1196, 1)
INSERT [dbo].[m_AccountGroupPower] ([PId], [MenuId], [GroupId]) VALUES (3123, 1197, 1)
INSERT [dbo].[m_AccountGroupPower] ([PId], [MenuId], [GroupId]) VALUES (3124, 1198, 1)
INSERT [dbo].[m_AccountGroupPower] ([PId], [MenuId], [GroupId]) VALUES (3125, 1199, 1)
INSERT [dbo].[m_AccountGroupPower] ([PId], [MenuId], [GroupId]) VALUES (3126, 1200, 1)
INSERT [dbo].[m_AccountGroupPower] ([PId], [MenuId], [GroupId]) VALUES (3127, 1201, 1)
INSERT [dbo].[m_AccountGroupPower] ([PId], [MenuId], [GroupId]) VALUES (3128, 1202, 1)
INSERT [dbo].[m_AccountGroupPower] ([PId], [MenuId], [GroupId]) VALUES (3129, 1181, 0)
INSERT [dbo].[m_AccountGroupPower] ([PId], [MenuId], [GroupId]) VALUES (3130, 1182, 0)
INSERT [dbo].[m_AccountGroupPower] ([PId], [MenuId], [GroupId]) VALUES (3131, 1188, 0)
INSERT [dbo].[m_AccountGroupPower] ([PId], [MenuId], [GroupId]) VALUES (3132, 1189, 0)
INSERT [dbo].[m_AccountGroupPower] ([PId], [MenuId], [GroupId]) VALUES (3133, 1190, 0)
INSERT [dbo].[m_AccountGroupPower] ([PId], [MenuId], [GroupId]) VALUES (3134, 1202, 0)
INSERT [dbo].[m_AccountGroupPower] ([PId], [MenuId], [GroupId]) VALUES (3135, 1199, 0)
INSERT [dbo].[m_AccountGroupPower] ([PId], [MenuId], [GroupId]) VALUES (3136, 1193, 0)
INSERT [dbo].[m_AccountGroupPower] ([PId], [MenuId], [GroupId]) VALUES (3137, 1204, 100)
INSERT [dbo].[m_AccountGroupPower] ([PId], [MenuId], [GroupId]) VALUES (3138, 1205, 100)
INSERT [dbo].[m_AccountGroupPower] ([PId], [MenuId], [GroupId]) VALUES (3139, 1204, 1)
INSERT [dbo].[m_AccountGroupPower] ([PId], [MenuId], [GroupId]) VALUES (3140, 1205, 1)
INSERT [dbo].[m_AccountGroupPower] ([PId], [MenuId], [GroupId]) VALUES (3141, 1206, 100)
INSERT [dbo].[m_AccountGroupPower] ([PId], [MenuId], [GroupId]) VALUES (3142, 1206, 1)
INSERT [dbo].[m_AccountGroupPower] ([PId], [MenuId], [GroupId]) VALUES (3143, 1207, 100)
INSERT [dbo].[m_AccountGroupPower] ([PId], [MenuId], [GroupId]) VALUES (3144, 1208, 100)
INSERT [dbo].[m_AccountGroupPower] ([PId], [MenuId], [GroupId]) VALUES (3145, 1209, 100)
INSERT [dbo].[m_AccountGroupPower] ([PId], [MenuId], [GroupId]) VALUES (3146, 1207, 1)
INSERT [dbo].[m_AccountGroupPower] ([PId], [MenuId], [GroupId]) VALUES (3147, 1208, 1)
INSERT [dbo].[m_AccountGroupPower] ([PId], [MenuId], [GroupId]) VALUES (3148, 1209, 1)
INSERT [dbo].[m_AccountGroupPower] ([PId], [MenuId], [GroupId]) VALUES (3149, 1210, 1)
INSERT [dbo].[m_AccountGroupPower] ([PId], [MenuId], [GroupId]) VALUES (3150, 1210, 100)
SET IDENTITY_INSERT [dbo].[m_AccountGroupPower] OFF
SET IDENTITY_INSERT [dbo].[m_AccountPlusRecords] ON 

INSERT [dbo].[m_AccountPlusRecords] ([RecordsId], [ObjectId], [AccountId], [AppendTime], [RecordsType]) VALUES (2, 3051, 2, CAST(N'2019-03-26T13:05:12.537' AS DateTime), 1)
INSERT [dbo].[m_AccountPlusRecords] ([RecordsId], [ObjectId], [AccountId], [AppendTime], [RecordsType]) VALUES (4, 2, 2, CAST(N'2019-03-26T13:10:42.193' AS DateTime), 5)
INSERT [dbo].[m_AccountPlusRecords] ([RecordsId], [ObjectId], [AccountId], [AppendTime], [RecordsType]) VALUES (31, 1, 2, CAST(N'2019-03-26T14:23:57.273' AS DateTime), 1)
INSERT [dbo].[m_AccountPlusRecords] ([RecordsId], [ObjectId], [AccountId], [AppendTime], [RecordsType]) VALUES (34, 4, 2, CAST(N'2019-03-26T14:24:04.567' AS DateTime), 1)
INSERT [dbo].[m_AccountPlusRecords] ([RecordsId], [ObjectId], [AccountId], [AppendTime], [RecordsType]) VALUES (48, 35, 2026, CAST(N'2020-03-02T11:17:28.140' AS DateTime), 1)
INSERT [dbo].[m_AccountPlusRecords] ([RecordsId], [ObjectId], [AccountId], [AppendTime], [RecordsType]) VALUES (76, 7, 2, CAST(N'2020-03-02T21:59:37.637' AS DateTime), 10)
INSERT [dbo].[m_AccountPlusRecords] ([RecordsId], [ObjectId], [AccountId], [AppendTime], [RecordsType]) VALUES (77, 5, 2, CAST(N'2020-03-02T21:59:41.010' AS DateTime), 11)
INSERT [dbo].[m_AccountPlusRecords] ([RecordsId], [ObjectId], [AccountId], [AppendTime], [RecordsType]) VALUES (78, 35, 2, CAST(N'2020-03-04T09:57:32.973' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[m_AccountPlusRecords] OFF
SET IDENTITY_INSERT [dbo].[m_AppManager] ON 

INSERT [dbo].[m_AppManager] ([AppId], [AppName], [RemarkText], [IsOpen], [OpenUrl], [OpenIP], [AppKey], [AppSecret], [AppendTime], [LastTime]) VALUES (1, N'51Core技术网', N'51Core技术网', 1, N'https://www.51core.net', N'127.0.0.1', N'ASDFDC124451212', N'ASDFDC124451212', CAST(N'2019-05-13T17:55:30.000' AS DateTime), CAST(N'2019-05-13T17:55:30.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[m_AppManager] OFF
SET IDENTITY_INSERT [dbo].[m_CmsChannel] ON 

INSERT [dbo].[m_CmsChannel] ([ChannelId], [ChannelName], [RemarkText], [StateCode], [AppendTime], [SortCount]) VALUES (1, N'头条', N'头条资讯', 1, CAST(N'2018-11-12T18:18:18.000' AS DateTime), 1)
INSERT [dbo].[m_CmsChannel] ([ChannelId], [ChannelName], [RemarkText], [StateCode], [AppendTime], [SortCount]) VALUES (2, N'有问', N'问答', 1, CAST(N'2018-11-12T18:18:18.000' AS DateTime), 2)
INSERT [dbo].[m_CmsChannel] ([ChannelId], [ChannelName], [RemarkText], [StateCode], [AppendTime], [SortCount]) VALUES (3, N'分享', N'资料分享', 1, CAST(N'2018-11-12T18:18:18.000' AS DateTime), 3)
INSERT [dbo].[m_CmsChannel] ([ChannelId], [ChannelName], [RemarkText], [StateCode], [AppendTime], [SortCount]) VALUES (4, N'教程', N'话题讨论', 1, CAST(N'2018-12-12T15:30:12.387' AS DateTime), 4)
INSERT [dbo].[m_CmsChannel] ([ChannelId], [ChannelName], [RemarkText], [StateCode], [AppendTime], [SortCount]) VALUES (5, N'有言', N'灌水', 1, CAST(N'2018-12-12T15:31:58.213' AS DateTime), 5)
SET IDENTITY_INSERT [dbo].[m_CmsChannel] OFF
SET IDENTITY_INSERT [dbo].[m_CmsContents] ON 

INSERT [dbo].[m_CmsContents] ([ContentsId], [Title], [Contents], [PostTime], [LastTime], [AccountId], [PlusCount], [ReadCount], [StateCode], [Tags], [ImgUrl], [AnswerCount], [ChannelId]) VALUES (1, N'TinyMCE编辑器发布测试', N'<p>TinyMCE编辑器发布测试TinyMCE编辑器发布测试TinyMCE编辑器发布测试TinyMCE编辑器发布测试TinyMCE编辑器发布测试</p>', CAST(N'2019-11-13T14:24:41.160' AS DateTime), CAST(N'2019-11-13T14:24:41.160' AS DateTime), 2, 0, 0, 1, N'', N'', 0, 1)
INSERT [dbo].[m_CmsContents] ([ContentsId], [Title], [Contents], [PostTime], [LastTime], [AccountId], [PlusCount], [ReadCount], [StateCode], [Tags], [ImgUrl], [AnswerCount], [ChannelId]) VALUES (2, N'在Windows系统中安装Redis缓存组件的教程', N'<p>在Windows系统中安装Redis缓存组件的教程</p>', CAST(N'2019-11-13T14:24:54.813' AS DateTime), CAST(N'2019-11-13T14:24:54.813' AS DateTime), 2, 0, 0, 1, N'', N'', 0, 1)
INSERT [dbo].[m_CmsContents] ([ContentsId], [Title], [Contents], [PostTime], [LastTime], [AccountId], [PlusCount], [ReadCount], [StateCode], [Tags], [ImgUrl], [AnswerCount], [ChannelId]) VALUES (3, N'新版本发布了66696858', N'<p>新版本发布了新版本发布了新版本发布了新版本发布了</p>
<p>新版本发布了3333</p>
<p>新版本发布了3333</p>
<p>新版本发布了3333</p>', CAST(N'2019-11-13T14:24:54.813' AS DateTime), CAST(N'2019-12-07T23:11:43.487' AS DateTime), 2026, 0, 0, 1, N'', N'', 0, 1)
INSERT [dbo].[m_CmsContents] ([ContentsId], [Title], [Contents], [PostTime], [LastTime], [AccountId], [PlusCount], [ReadCount], [StateCode], [Tags], [ImgUrl], [AnswerCount], [ChannelId]) VALUES (4, N'进行回答功能更新测试？', N'<p>是的测试这个贡呢能呢</p>', CAST(N'2018-11-28T12:15:44.957' AS DateTime), CAST(N'2018-06-09T12:15:44.957' AS DateTime), 2, 1, 602, 1, N'微服务,安装部署', N'', 0, 1)
INSERT [dbo].[m_CmsContents] ([ContentsId], [Title], [Contents], [PostTime], [LastTime], [AccountId], [PlusCount], [ReadCount], [StateCode], [Tags], [ImgUrl], [AnswerCount], [ChannelId]) VALUES (5, N'上传文件时如何获取到系统的根目录?', N'<p>如题</p>', CAST(N'2018-11-28T16:21:59.677' AS DateTime), CAST(N'2018-06-20T16:21:59.677' AS DateTime), 2, 2, 543, 1, N'Asp.Net Core MVC', N'', 0, 2)
INSERT [dbo].[m_CmsContents] ([ContentsId], [Title], [Contents], [PostTime], [LastTime], [AccountId], [PlusCount], [ReadCount], [StateCode], [Tags], [ImgUrl], [AnswerCount], [ChannelId]) VALUES (6, N'.NET Core 2.2 预览版P3发布了', N'<p>.NET Core 2.2 预览版P3发布了</p>', CAST(N'2018-11-28T16:46:44.580' AS DateTime), CAST(N'2018-11-13T16:46:44.577' AS DateTime), 2, 4, 213, 1, N'', N'', 0, 1)
INSERT [dbo].[m_CmsContents] ([ContentsId], [Title], [Contents], [PostTime], [LastTime], [AccountId], [PlusCount], [ReadCount], [StateCode], [Tags], [ImgUrl], [AnswerCount], [ChannelId]) VALUES (7, N'知乎趣味回复', N'<p>&nbsp; &nbsp; &nbsp; 上面的代码会筛选所有赞同大于 1000、字数小于 50 的回答，筛选出来的结果就是短小精辟的神回复。</p><p>　　以上是核心代码，完整代码已上传 github，大家可以在公众号后台回复知乎神回复获取地址。</p><p>　　<strong>知乎神回复</strong></p><p>　　<strong>代码写完了，可以运行下看看，这里就有 75 条筛选出来与程序员有关的神回复。</strong></p><p>　　<strong>Q:</strong> 码农们最常说的「谎言」有哪些？</p><p>　　A: //TODO</p><p>　　<strong>Q:</strong> 在 GitHub 上保持 365 天全绿是怎样一种体验？</p><p>　　A:&nbsp;曾经保持了 200 多天全绿，但是冷落了女朋友，一直绿到现在。</p><p>　　<strong>Q:</strong> 如何反驳「程序员离开电脑就是废物」这个观点？</p><p>　　A: 不不不，很多程序员在电脑前也是废物。</p><p>　　<strong>Q:</strong> 假如有一天所有的人都使用计算机语言说话，会是怎样的场景？</p><p>　　A:&nbsp;hello, world. 烫烫烫烫烫烫烫�d}��R�0:�v�?.</p><p>　　<strong>Q:</strong> 突然想开一家程序员主题的餐馆，名字就叫程序员的菜，菜名就叫各种语言中的关键字，各位指点一哈，有前途没？</p><p>　　A: 进门一个大大的 hello world&nbsp;，招牌菜叫“红烧产品经理”，一定会爆满的</p><p>　　<strong>Q:</strong> 什么是递归？</p><p>　　A: 「不宜公开讨论的政治内容」的定义和范畴本身也属于「不宜公开讨论的政治内容」</p><p>　　<strong>Q:</strong> 编程最基本的术语 “bug” 该怎么翻译？</p><p>　　A:&nbsp;幺蛾子，你的程序又出幺蛾子了。</p><p>　　<strong>Q:</strong> 编程的乐趣是什么？</p><p>　　A: 人的成就感来源于两样东西，创造和毁灭。</p><p>　　<strong>Q:</strong> 如何反驳「程序员离开电脑就是废物」这个观点？</p><p>　　A: 老实说跟这种女人都能聊下去你是不是想上她？</p><p>　　<strong>Q:</strong> 作为程序员，你在编程时吃了哪些数学的亏？</p><p>　　A: 看论文时候一个&quot;显然&quot;推了我一下午</p><p>　　<strong>Q:</strong> 土豪程序员的设备都有啥？</p><p>　　A: 女朋友。。。</p><p>　　<strong>Q:</strong> 祈求代码不出 bug 该拜哪个神仙？</p><p>　　A: 拜雍正，专治八阿哥。</p><p>　　<strong>Q:</strong> 考上好大学学 IT 是不是当今中国穷人家孩子晋级中产唯一的出路？</p><p>　　A: 对，就 4 条路：写代码；搞金融；在代码圈搞金融；在金融圈写代码</p><p>　　<strong>Q:</strong> 为什么程序员无论到哪儿都喜欢背电脑包，哪怕里面没有装电脑？</p><p>　　A: 因为他们没有别的包。</p><p>　　<strong>Q:</strong> 「Talk is cheap. Show me the code」怎么翻译比较好？</p><p>　　A: 屁话少说，放码过来。</p><p>　　Q: 为什么程序员的女朋友或老婆颜值普遍要高于男方很多？还是说程序员已经算是婚恋市场的优质股了？</p><p>　　A: 程序员女朋友颜值高，我是服的，因为随便问十个程序员他的女朋友是谁，有九个回答是新垣结衣</p><p>　　<strong>Q:</strong> 为什么一部分人宁可买几个机械键盘换着用，也不愿意给自己敷一下面膜？</p><p>　　A: 老子不靠脸吃饭。老子的辛辛苦苦挣来的钞票。老子想怎么花就怎么花。</p><p>　　<strong>Q:</strong> 程序员夫妻结婚戒指刻什么字好？</p><p>　　A: 0 error 0 warning</p><p>　　<strong>Q:</strong> IT 工程师被叫「码农」时是否会不舒服？</p><p>　　A: 我们好歹还是人，产品和设计已经是狗了……</p><p>　　<strong>Q:</strong> 为什么一个销售男（30 岁）会约我一个男程序员（24 岁）去小区附近的星巴克？</p><p>　　A: 根据哥多年的经验，他应该是有巨牛逼的 idea 然后只差程序员去实现了</p><p>　　<strong>Q:</strong> 怎么找到喜欢程序员的妹子做女友？</p><p>　　A: 看缘分，知乎上这么多用户，你关注到我就是缘分。</p><p>　　<strong>Q:</strong> 程序员女朋友如何给程序员男朋友过生日？</p><p>　　A: 告诉他，接口已经准备好了。</p><p>　　<strong>Q:</strong> 作为程序员，你是如何在工作以后找到女朋友的？</p><p>　　A: 题主作了这么久的程序员，还喜欢女孩子已经难能可贵了。</p><p>　　<strong>Q:</strong> 程序员转行烧烤需要做哪些准备，有哪些优势和劣势？</p><p>　　A: 你看，你连自己做烧烤都不知道优势劣势在哪里，所以，你还是需要一名产品经理。</p><p>　　<strong>Q:</strong> 哪些话可以惹火程序员？</p><p>　　A: 路过他电脑前时说一句，呦，又在写 bug 呢!</p><p>　　<strong>Q:</strong> 我的一位老师说，Java 适用于大型软件而 C# 适用中小型软件。这是真的么？</p><p>　　A: Java 有项天赋，就是能把中小型软件写成大型的。</p><p>　　<strong>Q:</strong> 为什么 2014 年程序员薪资那么高？</p><p>　　A: 时薪又不高</p><p>　　<strong>Q:</strong> 是不是大部分程序员都在抱怨工资低？</p><p>　　A:&nbsp;谁、谁在抱怨工资高？</p><p>　　<strong>Q:</strong> 单身程序狗解决了一个技术难题后没有妹子可以炫耀或夸一下自己怎么办？</p><p>　　A: 现在你明白了吧，为什么那么多程序员要写技术博客。</p><p>　　<strong>Q:</strong> 中国程序员是否偏爱「冲锋衣+牛仔裤+运动鞋」的衣着？如果是，为何会形成这样的潮流？</p><p>　　A: 穿那么好看给程序看吗？</p><p>　　<strong>Q:</strong> 作为 IT 从业人员，你觉得有什么工具大大提高了你的工作效率？</p><p>　　A:&nbsp;单身</p><p>　　<strong>Q:</strong> 为什么我认为程序员似乎大多不善言辞？</p><p>　　A: 你就当是我们情商低就好了，这样你开心，我们也开心。</p><p>　　<strong>Q:</strong> 在中国，年龄最大的程序员不过 40 岁左右，请问中国的程序员未来还可以做什么？</p><p>　　A:&nbsp;这跟为什么 90 后没人活过 30 岁是同一个原理</p><p>　　<strong>Q:</strong> 如何回复程序员发来的短信：「Hello world」？</p><p>　　A: Hello nerd.</p><p>　　<strong>Q:</strong> 怎么看出 IT 男喜欢一个女生？</p><p>　　A: 当他拼着自己早已养成的寡言少语的习惯去死命的跟你套近乎的时候</p><p>　　<strong>Q:</strong> 为什么程序员不应该会修电脑？</p><p>　　A: 范冰冰需要会修电视机吗？</p><p>　　<strong>Q:</strong> 同事说自己 C++ 水平全中国第一，怎么让他意识到自己没那么厉害？</p><p>　　A:&nbsp;实不相瞒，我也不是装逼：我的 C++ 水平全国第 0。</p><p>　　<strong>Q:</strong> 为什么 iPhone 删软件时，所有图标都要抖？</p><p>　　A: 第三方软件是吓得，系统自带软件是嘚瑟</p><p>　　<strong>Q:</strong> 左轮手枪装有一颗子弹，对着自己头开一枪奖励 10 万元，两枪 1 亿，三枪 2 亿，四枪 4 亿，5 枪 16 亿，值得吗？</p><p>　　A:&nbsp;只要不打要害，我告诉你，我能打到我们A站上市！！！！</p><p>　　<strong>Q:</strong> iPhone 处理器的性能按照现在每年翻一倍的节奏，是不是很快就能赶上甚至超过台式电脑的处理器？</p><p>　　A: 小时候我总觉得过两年我就能和大我两岁的哥哥一样大了。</p><p>　　<strong>Q:</strong> 知乎给你带来的最小限度的好处是什么？</p><p>　　A: 消磨时间还不觉得罪恶。</p><p>　　<strong>Q:</strong> 有哪些反人类的科技发明或设计？</p><p>　　A: 电脑连不上网，诊断以后它提示我要联网解决</p><p>　　<strong>Q:</strong> 为什么设计师不愿意被称为美工？</p><p>　　A: 只要工资开的高，叫我阿姨都行。</p><p>　　<strong>Q:</strong> 为什么有人认为网易云音乐是业界良心？</p><p>　　A: 有一天突然给我推送一条消息说我要的歌词找到了</p><p>　　<strong>Q:</strong> 为什么没有出现无人机自毁式攻击武器呢？恐怖分子用过吗？</p><p>　　A: 你是说导弹么？</p><p>　　<strong>Q:</strong> 既然思想是我的，那么为什么有时候我控制不了我的负面情绪？</p><p>　　A: 操作系统不会允许用户访问、修改及删除核心系统文件，因为这会损坏系统，导致运行异常。</p><p>　　<strong>Q:</strong> 鲁迅虽然很牛，但在这世界十大文豪里是不是凑数的？</p><p>　　A: 为什么文豪要为文盲排的榜买单？</p><p>　　<strong>Q:</strong> 人类的哪些科技已经接近瓶颈，很久没有重大突破了？</p><p>　　A: 烧开水</p><p>　　<strong>Q:</strong> 如何看待某些人下载软件喜欢到官网的偏好？</p><p>　　A: 同学你没中过百度全家桶吧？</p><p>　　<strong>Q:</strong> 为什么很多人买笔记本打游戏，而不用性能更好的台式机？</p><p>　　A: 因为买不起房子。。。</p><p>　　<strong>Q:</strong> 第一次听好耳机对你带来的震撼有多大？</p><p>　　A: 第一次听好耳机不会给人多大震撼，但是当换回普通耳机的时候，震撼就来了</p><p>　　<strong>Q:</strong> Chrome 真的很费电吗？</p><p>　　A: 不费电，我现在就在用 Chrome，用到现在这么久，笔记本电量还有 50%，我估讠</p><p>　　<strong>Q:</strong> MacBook 上安装 Windows 后的使用体验如何？</p><p>　　A: 像突然间有了软肋，并且还失去了铠甲。</p><p>　　<strong>Q:</strong> 家里所有有关产品都用苹果产品是一种什么体验？</p><p>　　A: 来个电话全家都响了起来</p><p>　　<strong>Q:</strong> 你为什么不买 iPhone X？</p><p>　　A: 日益增长的美好生活需要和贫穷的现实之间的矛盾</p><p>　　<strong>Q:</strong> 为什么有人愿意花几千元买 iPhone ，却不愿意花几十元买正版 iPhone 软件和游戏？</p><p>　　A: 因为他们下载不到 iPhone</p><p>　　<strong>Q:</strong> 有什么 App 取的名字特别惊艳？</p><p>　　A: 水表助手…是查快递的…</p><p>　　<strong>Q:</strong> 你为什么要买移动硬盘？</p><p>　　A: 条件好了也要给自己的女人们住舒适点啊</p><p>　　<strong>Q:</strong> 如何用 iPad 遥控 PC 关机？</p><p>　　A: 瞄准 PC 电源键扔过去</p><p>　　Q: 如何评价 2016 年 9 月 7 日的苹果发布会？</p><p>　　A: 为了新 MacBook Pro，半年看了三场发布会……</p><p>　　Q: 如何评价 Internet Explorer？</p><p>　　A: 下载其他浏览器的浏览器</p><p>　　-----一年后-----</p><p>　　IE8 以下好烂，做前端想哭的节奏。</p><p>　　<strong>Q:</strong> 爸妈让我攒钱买房，我却想买苹果电脑怎么办？</p><p>　　A: 你要真能 3 年攒 50 万的房子，差这 1 万 7 买个电脑么，大哥?</p><p>　　<strong>Q:</strong> 有哪些垃圾手机软件？</p><p>　　A: 短信拦截软件！ 拦截后告诉你它拦截了一条短信。 我相信 99% 的人会再去点进去看一下被拦截的短信！</p><p>　　<strong>Q:</strong> 一个完整的 PPT 做下来，最让你头疼的是什么？</p><p>　　A: 怎样向领导隐藏自己的实力。</p><p>　　<strong>Q:</strong> 什么是 Vim 可以做而 Emacs 做不到的？</p><p>　　A: 帮助乌干达的可怜儿童……</p><p>　　<strong>Q:</strong> 苹果用户为什么选择苹果？</p><p>　　A: 因为不用苹果的用户不是苹果用户。</p><p>　　<strong>Q:</strong> 计算机世界里有哪些经典谣言？</p><p>　　A: Windows 正在联机寻找解决方案。</p><p>　　<strong>Q:</strong> 有线鼠标会被无线鼠标取代吗？</p><p>　　A: 我觉得在网吧有线鼠标就不会被取代</p><p>　　<strong>Q:</strong> 计算机世界里有哪些经典谣言？</p><p>　　A: 我已阅读并同意该条款</p><p>　　<strong>Q:</strong> 计算机系的学生都有哪些口头禅？</p><p>　　A: 我电脑上运行的好好的啊⋯⋯</p><p>　　<strong>Q:</strong> 如何看待百度官博公开辟谣涉李彦宏家事传闻？</p><p>　　A：「中国人对隐私没那么敏感，愿意用隐私换取便利。」——李彦宏</p><p>　　<strong>Q:</strong> 在飞机上遇到了马云该怎么聊天？</p><p>　　A: Hello Jack, my name is Jackson.</p><p>　　<strong>Q:</strong> 如何理解马云说八年后房如葱？</p><p>　　A:&nbsp;赶紧买葱啊，葱要涨价了！！！</p><p>　　<strong>Q:</strong> 如何理解马云说的「把地主杀了，不等于你能富起来」这句话？</p><p>　　A: 他的意思是「别杀我」</p><p>　　<strong>Q:</strong> 如何看待百度在魏则西事件过去之后又悄悄的把承诺整改的广告提示颜色调淡了？</p><p>　　A: 请大家不要黑百度，我是做前端开发的，这是时间久了，网页 CSS 掉色了</p><p><br/></p>', CAST(N'2018-11-28T15:32:10.077' AS DateTime), CAST(N'2018-11-15T15:32:10.073' AS DateTime), 2, 1, 310, 1, N'', N'', 0, 4)
INSERT [dbo].[m_CmsContents] ([ContentsId], [Title], [Contents], [PostTime], [LastTime], [AccountId], [PlusCount], [ReadCount], [StateCode], [Tags], [ImgUrl], [AnswerCount], [ChannelId]) VALUES (8, N'解决MVC视图中的中文被html编码的问题', N'<p>在Startup类中加入如下代码</p><pre class="prettyprint"><code class="language-csharp">public void ConfigureServices(IServiceCollection services)
 {
 &nbsp; &nbsp; &nbsp; &nbsp; //加入此处代码
 &nbsp; &nbsp; &nbsp; &nbsp; services.Configure&lt;WebEncoderOptions&gt;(options =&gt;
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;{
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;options.TextEncoderSettings = new TextEncoderSettings(UnicodeRanges.All);
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}); &nbsp; &nbsp;
}</code></pre><p><br/></p>', CAST(N'2018-12-12T15:27:10.723' AS DateTime), CAST(N'2018-12-12T15:27:10.723' AS DateTime), 2, 1, 187, 1, N'', N'', 0, 3)
INSERT [dbo].[m_CmsContents] ([ContentsId], [Title], [Contents], [PostTime], [LastTime], [AccountId], [PlusCount], [ReadCount], [StateCode], [Tags], [ImgUrl], [AnswerCount], [ChannelId]) VALUES (9, N'百度umeditor富文本编辑器插件扩展', N'富文本编辑器在WEB开发中经常用到,个人比较喜欢用百度出的ueditor这款,ueditor这款本身支持插件扩展的,但是ueditor的mini版本 umeditor 就没有那么方便了,不过找了很多资料根据这些资料琢磨出了如果给umeditor添加插件,这个案例中将实现增加代码和附件插入.<br/><br/>准备工作:<br/><br/>1.umeditor下载:<br/><br/>&nbsp;&nbsp; https://github.com/fex-team/umeditor/releases<br/><br/>2.插件弹窗使用的是 layer:<br/><br/><p>&nbsp; http://layer.layui.com/?alone</p><p><br/></p><p><span style="font-size: 16px"><strong>如何创建插件?</strong></span></p><p><span style="font-size: 16px"><strong><img src="https://file.51core.net/2/2018/12/5c74b88a189f4e4694927cf1bfb6afee.png" style="max-width:650px;" alt="缩略图"/><br/></strong></span></p><p>第一步:我们在编辑器umeditor目录下创建一个plugins的文件夹,这里用来存放我们自定义的插件,如上图,我们定义了一个代码(code)以及附件(attachment)插件<br/><br/>第二步:创建plugins.js文件,这里用来封装我们插件的信息,代码如下</p><pre class="prettyprint"><code class="language-javascript">//定义插件容器
var plugins = new Array();
//注册插件
function registerPlugins() {
 &nbsp; &nbsp;//添加代码插件
 &nbsp; &nbsp;plugins[&#39;code&#39;] = new function () {
 &nbsp; &nbsp; &nbsp; &nbsp;//注册界面事件
 &nbsp; &nbsp; &nbsp; &nbsp;var result = new Object();
 &nbsp; &nbsp; &nbsp; &nbsp;result.CodeObj = {};
 &nbsp; &nbsp; &nbsp; &nbsp;//注册指定事件
 &nbsp; &nbsp; &nbsp; &nbsp;UM.registerUI(&#39;code&#39;,
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;function (name) {
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;var me = this;
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;var $btn = $.eduibutton({
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;icon: &#39;source&#39;,
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;click: function () {
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;var layIndex = layer.open({
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;type: 2,
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;title: &#39;源代码&#39;,
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;maxmin: false,
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;shadeClose: true, //点击遮罩关闭层
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;area: [&#39;620px&#39;, &#39;380px&#39;],
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;content: &#39;/lib/umeditor/plugins/code/code.html&#39;,
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;btn: [&#39;确定&#39;, &#39;取消&#39;],
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;btn1: function (index) {
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (result.CodeObj.codeContent != &#39;&#39;) {
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;//把内容插入编辑器
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;var html = &#39;&lt;pre &nbsp;class=&quot;prettyprint&quot;&gt;&lt;code class=&quot;language-&#39; + result.CodeObj.codeType + &#39;&quot;&gt;&#39; + result.CodeObj.codeContent + &#39;&lt;/code&gt;&lt;/pre&gt;&#39;;
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;me.execCommand(&#39;insertHtml&#39;, html);
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;//关闭弹窗并且清空当次内容
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;layer.close(layIndex);
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;result.CodeObj = {};
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;//UM.getEditor(&#39;container&#39;).setContent(html, true);
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;},
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;btn2: function (index) {
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;//关闭当前弹窗 并且清空当前数据容器
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;layer.close(layIndex);
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;result.CodeObj = {};
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;});
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;},
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;title: &#39;源代码&#39;
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;});
 
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;me.addListener(&#39;selectionchange&#39;, function () {
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;//切换为不可编辑时，把自己变灰
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;var state = this.queryCommandState(name);
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;$btn.edui().disabled(state == -1).active(state == 1)
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;});
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return $btn;
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}
 &nbsp; &nbsp; &nbsp; &nbsp;);
 &nbsp; &nbsp; &nbsp; &nbsp;return result;
 &nbsp; &nbsp;};
 &nbsp; &nbsp;//添加代码插件
 &nbsp; &nbsp;plugins[&#39;attachment&#39;] = new function () {
 &nbsp; &nbsp; &nbsp; &nbsp;//注册界面事件
 &nbsp; &nbsp; &nbsp; &nbsp;var result = new Object();
 &nbsp; &nbsp; &nbsp; &nbsp;result.DataObj = {};
 &nbsp; &nbsp; &nbsp; &nbsp;//注册指定事件
 &nbsp; &nbsp; &nbsp; &nbsp;UM.registerUI(&#39;attachment&#39;,
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;function (name) {
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;var me = this;
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;var $btn = $.eduibutton({
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;icon: &#39;attachment&#39;,
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;click: function () {
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;var layIndex = layer.open({
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;type: 2,
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;title: &#39;附件&#39;,
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;maxmin: false,
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;shadeClose: true, //点击遮罩关闭层
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;area: [&#39;600px&#39;, &#39;320px&#39;],
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;content: &#39;/lib/umeditor/plugins/attachment/attachment.html&#39;,
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;btn: [&#39;确定&#39;, &#39;取消&#39;],
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;btn1: function (index) {
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (result.DataObj.title != &quot;&quot; &amp;&amp; result.DataObj.url != &quot;&quot;) {
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;var html = &#39;&lt;div class=&quot;card&quot; style=&quot;margin-bottom:5px;padding:0px;&quot;&gt;&#39;;
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;html += &#39;&lt;div class=&quot;col-lg-12&quot; style = &quot;margin-top:10px;padding-left: 0px;&quot;&gt;&#39;;
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;html += &#39;&lt;div class=&quot;col-lg-3&quot; style=&quot;width:55px;&quot;&gt;&#39;;
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;html += &#39;&lt;img src=&quot;/images/download.png&quot; /&gt;&#39;;
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;html += &#39;&lt;/div&gt;&#39;;
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;html += &#39;&lt;div class=&quot;col-lg-8&quot;&gt;&#39;;
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;html += &#39;&lt;div class=&quot;row&quot;&gt;&#39;;
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;html += result.DataObj.title;
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;html += &#39;&lt;/div&gt;&#39;;
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;html += &#39;&lt;div class=&quot;row&quot;&gt;&#39;;
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;html += &#39;提取密码:&lt;strong&gt;&#39; + (result.DataObj.password != &quot;&quot; ? result.DataObj.password:&quot;&quot;)+&#39;&lt;/strong&gt;&#39;;
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;html += &#39;&lt;/div&gt;&#39;;
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;html += &#39;&lt;/div&gt;&#39;;
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;html += &#39;&lt;div class=&quot;col-sm-1&quot;&gt;&#39;;
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;html += &#39;&lt;a href=&quot;&#39; + result.DataObj.url + &#39;&quot; &nbsp;_href=&quot;&#39; + result.DataObj.url + &#39;&quot; class=&quot;btn btn-link&quot; &nbsp;target=&quot;_blank&quot;&gt; &lt;i class=&quot;icon icon-download-alt icon-2x&quot;&gt;&lt;/i&gt;&lt;/a&gt;&#39;;
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;html += &#39;&lt;/div&gt;&#39;;
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;html += &#39;&lt;/div&gt;&#39;;
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;html += &#39;&lt;/div&gt;&#39;;
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;me.execCommand(&#39;insertHtml&#39;, html);
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;//关闭当前弹窗 并且清空当前数据容器
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;layer.close(layIndex);
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;result.DataObj = {};
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;},
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;btn2: function (index) {
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;//关闭当前弹窗 并且清空当前数据容器
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;layer.close(layIndex);
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;result.DataObj = {};
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;});
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;},
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;title: &#39;附件&#39;
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;});
 
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;me.addListener(&#39;selectionchange&#39;, function () {
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;//切换为不可编辑时，把自己变灰
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;var state = this.queryCommandState(name);
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;$btn.edui().disabled(state == -1).active(state == 1)
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;});
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return $btn;
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}
 &nbsp; &nbsp; &nbsp; &nbsp;);
 &nbsp; &nbsp; &nbsp; &nbsp;return result;
 &nbsp; &nbsp;};
}</code></pre><p>第三步:因为例子中的插件是需要弹窗的,所以我们需要借助layer这个弹窗组建来实现,这里就以插入代码为说明吧<br/><br/>a.创建code文件夹<br/><br/>b.创建code.html文件</p><p><span style="font-size: 16px"><strong></strong></span></p><pre class="prettyprint"><code class="language-javascript">&lt;!DOCTYPE html&gt;
&lt;html&gt;
&lt;head&gt;
 &nbsp; &nbsp;&lt;meta charset=&quot;utf-8&quot; /&gt;
 &nbsp; &nbsp;&lt;title&gt;&lt;/title&gt;
 &nbsp; &nbsp;&lt;script src=&quot;/lib/jquery/jquery-3.2.0.min.js&quot;&gt;&lt;/script&gt;
 
 &nbsp; &nbsp;&lt;link href=&quot;/style/css/zui.min.css&quot; rel=&quot;stylesheet&quot; /&gt;
&lt;/head&gt;
&lt;body&gt;
 &nbsp; &nbsp;&lt;div class=&quot;container-fluid&quot;&gt;
 &nbsp; &nbsp; &nbsp; &nbsp;&lt;form class=&quot;form-horizontal &nbsp;form-condensed&quot; method=&quot;post&quot;&gt;
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&lt;div class=&quot;form-group&quot;&gt;
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&lt;div class=&quot;col-md-4&quot; style=&quot;width:620px;margin-top:10px;&quot;&gt;
 
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&lt;select class=&quot;form-control&quot; onchange=&quot;MonitorTypeChanage()&quot; &nbsp;style=&quot;height:30px;font-size:16px;&quot; id=&quot;CodeType&quot;&gt;
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&lt;option value=&quot;csharp&quot;&gt;C#&lt;/option&gt;
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&lt;option value=&quot;javascript&quot;&gt;JavaScript&lt;/option&gt;
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&lt;option value=&quot;html&quot;&gt;HTML&lt;/option&gt;
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&lt;option value=&quot;css&quot;&gt;CSS&lt;/option&gt;
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&lt;option value=&quot;SQL&quot;&gt;SQL&lt;/option&gt;
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&lt;/select&gt;
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&lt;/div&gt;
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&lt;/div&gt;
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&lt;div class=&quot;form-group&quot;&gt;
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&lt;div class=&quot;col-md-12&quot;&gt;
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&lt;textarea style=&quot;height:210px;width:600px;&quot; oninput=&quot;MonitorContentsInput()&quot; id=&quot;CodeContents&quot; &nbsp;name=&quot;CodeContents&quot; placeholder=&quot;请输入代码内容...&quot;&gt;&lt;/textarea&gt;
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&lt;/div&gt;
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&lt;/div&gt;
 &nbsp; &nbsp; &nbsp; &nbsp;&lt;/form&gt;
 &nbsp; &nbsp;&lt;/div&gt;
 &nbsp; &nbsp;&lt;script type=&quot;text/javascript&quot; src=&quot;code.js&quot;&gt;&lt;/script&gt;
&lt;/body&gt;
&lt;/html&gt;</code></pre><p>&nbsp;c.创建code.js文文件</p><p><span style="font-size: 16px"><strong></strong></span></p><pre class="prettyprint"><code class="language-csharp">var result = {
 &nbsp; &nbsp;codeType: &#39;csharp&#39;,
 &nbsp; &nbsp;codeContent:&#39;&#39;
}
window.onload = function () {
 &nbsp; &nbsp;parent.plugins[&#39;code&#39;].CodeObj = result;
}
//监听代码内容输入事件
function MonitorContentsInput() {
 &nbsp; &nbsp;result.codeContent = &nbsp;html2Escape($(&quot;#CodeContents&quot;).val());
 &nbsp; &nbsp;parent.plugins[&#39;code&#39;].CodeObj = result;
}
//监听代码类型选择事件
function MonitorTypeChanage() {
 &nbsp; &nbsp;result.codeType = $(&quot;#CodeType&quot;).val();
 &nbsp; &nbsp;parent.plugins[&#39;code&#39;].CodeObj = result;
}
function html2Escape(sHtml) {
 &nbsp; &nbsp;return sHtml.replace(/[&lt;&gt;&amp;&quot;]/g, function (c) { return { &#39;&lt;&#39;: &#39;&lt;&#39;, &#39;&gt;&#39;: &#39;&gt;&#39;, &#39;&amp;&#39;: &#39;&amp;&#39;, &#39;&quot;&#39;: &#39;&quot;&#39; }[c]; });
}</code></pre><p>&nbsp;d.弹窗组件中的功能写完了,我们需要在plugins.js文件中把刚刚增加的功能组件注册到umeditor对象中,完成这一步就完成一个插件功能,代码如下(plugins.js所有组件代码在第一步中)</p><p><span style="font-size: 16px"><strong></strong></span></p><pre class="prettyprint"><code class="language-javascript">plugins[&#39;code&#39;] = new function () {
 &nbsp; &nbsp; &nbsp; &nbsp;//注册界面事件
 &nbsp; &nbsp; &nbsp; &nbsp;var result = new Object();
 &nbsp; &nbsp; &nbsp; &nbsp;result.CodeObj = {};
 &nbsp; &nbsp; &nbsp; &nbsp;//注册指定事件
 &nbsp; &nbsp; &nbsp; &nbsp;UM.registerUI(&#39;code&#39;,
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;function (name) {
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;var me = this;
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;var $btn = $.eduibutton({
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;icon: &#39;source&#39;,
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;click: function () {
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;var layIndex = layer.open({
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;type: 2,
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;title: &#39;源代码&#39;,
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;maxmin: false,
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;shadeClose: true, //点击遮罩关闭层
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;area: [&#39;620px&#39;, &#39;380px&#39;],
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;content: &#39;/lib/umeditor/plugins/code/code.html&#39;,
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;btn: [&#39;确定&#39;, &#39;取消&#39;],
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;btn1: function (index) {
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (result.CodeObj.codeContent != &#39;&#39;) {
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;//把内容插入编辑器
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;var html = &#39;&lt;pre &nbsp;class=&quot;prettyprint&quot;&gt;&lt;code class=&quot;language-&#39; + result.CodeObj.codeType + &#39;&quot;&gt;&#39; + result.CodeObj.codeContent + &#39;&lt;/code&gt;&lt;/pre&gt;&#39;;
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;me.execCommand(&#39;insertHtml&#39;, html);
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;//关闭弹窗并且清空当次内容
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;layer.close(layIndex);
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;result.CodeObj = {};
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;//UM.getEditor(&#39;container&#39;).setContent(html, true);
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;},
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;btn2: function (index) {
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;//关闭当前弹窗 并且清空当前数据容器
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;layer.close(layIndex);
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;result.CodeObj = {};
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;});
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;},
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;title: &#39;源代码&#39;
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;});
 
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;me.addListener(&#39;selectionchange&#39;, function () {
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;//切换为不可编辑时，把自己变灰
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;var state = this.queryCommandState(name);
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;$btn.edui().disabled(state == -1).active(state == 1)
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;});
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return $btn;
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}
 &nbsp; &nbsp; &nbsp; &nbsp;);
 &nbsp; &nbsp; &nbsp; &nbsp;return result;
 &nbsp; &nbsp;};</code></pre><p>如何使用?<br/><br/>准备工作准备好以后我们新建一个页面,引入相关的样式以及JS文件,代码如下:</p><pre class="prettyprint"><code class="language-javascript">@{
 &nbsp; &nbsp;ViewData[&quot;Title&quot;] = &quot;umeditor富文本编辑器插件扩展案例&quot;;
}
@section Style{
 &nbsp; &nbsp;&lt;link href=&quot;~/lib/umeditor/themes/default/css/umeditor.min.css&quot; rel=&quot;stylesheet&quot; /&gt;
}
&lt;div class=&quot;container-fixed-md&quot;&gt;
 &nbsp; &nbsp;&lt;textarea style=&quot;height:300px;width:700px;&quot; id=&quot;Contents&quot; name=&quot;Contents&quot; placeholder=&quot;&quot;&gt;&lt;/textarea&gt;
&lt;/div&gt;
@section Scripts{
 &nbsp; &nbsp;&lt;script src=&quot;~/lib/layer/layer.min.js&quot;&gt;&lt;/script&gt;
 &nbsp; &nbsp;&lt;script src=&quot;~/lib/umeditor/umeditor.config.js&quot;&gt;&lt;/script&gt;
 &nbsp; &nbsp;&lt;script src=&quot;~/lib/umeditor/umeditor.min.js&quot;&gt;&lt;/script&gt;
 &nbsp; &nbsp;&lt;!--自定义插件文件导入--&gt;
 &nbsp; &nbsp;&lt;script src=&quot;~/lib/umeditor/plugins/plugins.js&quot;&gt;&lt;/script&gt;
 &nbsp; &nbsp;&lt;script type=&quot;text/javascript&quot;&gt;
 &nbsp; &nbsp; &nbsp; &nbsp;var um = UM.getEditor(&#39;Contents&#39;, {
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;toolbar: [
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&#39; bold italic underline | insertorderedlist removeformat |&#39;,
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&#39;link unlink | emotion image attachment code&#39;,
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&#39;| fullscreen&#39;, &#39;formula&#39;
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;]
 &nbsp; &nbsp; &nbsp; &nbsp;});
 &nbsp; &nbsp; &nbsp; &nbsp;//注册插件
 &nbsp; &nbsp; &nbsp; &nbsp;registerPlugins();
 &nbsp; &nbsp;&lt;/script&gt;
}</code></pre><p><strong><span style="font-size: 16px">运营效果?</span></strong></p><p><img src="https://file.51core.net/2/2018/12/2538941b3c29429ba30aebc792d4a8c1.png" style="max-width:650px;" alt="缩略图"/><img src="https://file.51core.net/2/2018/12/4a2760c7198841cfa524cf8b0731e23f.png" style="max-width:650px;" alt="缩略图"/></p>', CAST(N'2018-12-21T11:59:47.940' AS DateTime), CAST(N'2018-12-21T11:59:47.940' AS DateTime), 2, 0, 315, 1, N'', N'', 0, 3)
INSERT [dbo].[m_CmsContents] ([ContentsId], [Title], [Contents], [PostTime], [LastTime], [AccountId], [PlusCount], [ReadCount], [StateCode], [Tags], [ImgUrl], [AnswerCount], [ChannelId]) VALUES (10, N'使用Asp.Net Core MVC 开发项目实践教程开篇', N'<p>该系列教程基于51Core技术网项目源代码作为基础,教程主要讲解系统中用到的一些基础技术点.</p>
<p>该项目基于 Asp.Net Core 2.2版本,用到了Redis、SignalR、EF Core等...</p>
<p>项目源代码以及数据库脚本都已经开源到GITHUB.COM上了</p>
<p>下载地址:</p>
<p><a title="项目源代码下载" href="https://github.com/51core/mango-sns-open" target="_blank" rel="noopener">https://github.com/51core/mango-sns-open</a></p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>', CAST(N'2018-12-29T17:20:54.300' AS DateTime), CAST(N'2019-01-09T14:21:36.873' AS DateTime), 2, 0, 400, 1, N'', N'', 0, 4)
INSERT [dbo].[m_CmsContents] ([ContentsId], [Title], [Contents], [PostTime], [LastTime], [AccountId], [PlusCount], [ReadCount], [StateCode], [Tags], [ImgUrl], [AnswerCount], [ChannelId]) VALUES (11, N'使用Asp.Net Core MVC 开发项目实践[第一篇:项目结构说明]', N'<p>先从下图看整体项目结构:</p><p><img src="https://file.51core.net/2/2018/12/33399e37a9a34cf7a0e8d5636ad749a7.png" style="max-width:650px;" alt="缩略图"/></p><p>Mango.Manager:</p><p>为后台管理项目</p><p>Mango.Web:</p><p>为前台项目</p><p>Mango.Framework.Core:</p><p>为常用的基础操作类项目<br/></p><p>Mango.Framework.EFCore:</p><p>为基于EFCore封装以及相关扩展类库项目</p><p>Mango.Framework.Services:</p><p>注册服务管理类库项目，负责管理服务注入,调用等(比如说缓存服务)</p><p>Mango.Common:</p><p>通用功能的封装以及第三方组件调用的封装</p><p>Mango.Entity:</p><p>实体类类库,由生成工具生成</p><p>Mango.Models:</p><p>通用数据输出Model类</p><p>Mango.Repository:</p><p>仓储类库项目,负责数据库的操作</p><p><br/></p><p>PS:我只是提供一个简单项目,为想学习ASP.NET CORE MVC开发的人提供一个完整的项目实践案例...</p><p>下一篇会进入具体的开发技术点...<br/></p>', CAST(N'2018-12-29T17:45:13.510' AS DateTime), CAST(N'2018-12-29T17:45:13.510' AS DateTime), 2, 0, 300, 1, N'', N'', 0, 4)
INSERT [dbo].[m_CmsContents] ([ContentsId], [Title], [Contents], [PostTime], [LastTime], [AccountId], [PlusCount], [ReadCount], [StateCode], [Tags], [ImgUrl], [AnswerCount], [ChannelId]) VALUES (12, N'使用Asp.Net Core MVC 开发项目实践[第二篇:EF Core]', N'<p>在项目中使用EF Core还是比较容易的,在这里我们使用的版本是EF Core 2.2.</p><p>1.使用nuget获取EF Core包</p><p><img src="https://file.51core.net/2/2019/1/80929f62d1ef426693b3c08b75226275.png" style="max-width:650px;" alt="缩略图"/></p><p>这个示例项目使用的是SQLSERVER,所以还需要下载Microsoft.EntityFrameworkCore.SqlServer这个包</p><p>2.在Startup类的Configure方法中设置默认的数据库访问连接字符串</p><pre class="prettyprint"><code class="language-csharp"> //数据库连接字符串
Framework.Core.Configuration.AddItem(&quot;ConnectionStrings&quot;,Configuration.GetSection(&quot;ConnectionStrings&quot;).Value);</code></pre><p>PS：我这里并没有使用DI注入的方式去使用EFCORE的实例,还是使用传统的New的方式,所以并不需要在Startup中进行注入</p><p>3.在Mango.EFCore类库项目中创建一个EFDbContext类继承自DbContext我们就能在其它地方使用EFCore了,代码如下:<br/></p><pre class="prettyprint"><code class="language-csharp">using System;
using System.Collections.Generic;
using System.Text;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;
using Mango.Entity;
namespace Mango.Framework.EFCore
{
 &nbsp; &nbsp;public class EFDbContext : DbContext
 &nbsp; &nbsp;{
 &nbsp; &nbsp; &nbsp; &nbsp;public EFDbContext()
 &nbsp; &nbsp; &nbsp; &nbsp;{

 &nbsp; &nbsp; &nbsp; &nbsp;}

 &nbsp; &nbsp; &nbsp; &nbsp;public EFDbContext(DbContextOptions&lt;EFDbContext&gt; options): base(options)
 &nbsp; &nbsp; &nbsp; &nbsp;{
 &nbsp; &nbsp; &nbsp; &nbsp;}
 &nbsp; &nbsp; &nbsp; &nbsp;protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
 &nbsp; &nbsp; &nbsp; &nbsp;{
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (!optionsBuilder.IsConfigured)
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;{
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;optionsBuilder.UseSqlServer(Core.Configuration.GetItem(&quot;ConnectionStrings&quot;));
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}
 &nbsp; &nbsp; &nbsp; &nbsp;}
 &nbsp; &nbsp; &nbsp; &nbsp;#region Entity DbSet&lt;&gt;
 &nbsp; &nbsp; &nbsp; &nbsp;public virtual DbSet&lt;m_WebSiteConfig&gt; m_WebSiteConfig { get; set; }
 &nbsp; &nbsp; &nbsp; &nbsp;public virtual DbSet&lt;m_PostsRecords&gt; m_PostsRecords { get; set; }
 &nbsp; &nbsp; &nbsp; &nbsp;public virtual DbSet&lt;m_WebSiteNavigation&gt; m_WebSiteNavigation { get; set; }

 &nbsp; &nbsp; &nbsp; &nbsp;public virtual DbSet&lt;m_Sms&gt; m_Sms { get; set; }

 &nbsp; &nbsp; &nbsp; &nbsp;public virtual DbSet&lt;m_ManagerAccount&gt; m_ManagerAccount { get; set; }
 &nbsp; &nbsp; &nbsp; &nbsp;public virtual DbSet&lt;m_ManagerMenu&gt; m_ManagerMenu { get; set; }
 &nbsp; &nbsp; &nbsp; &nbsp;public virtual DbSet&lt;m_ManagerPower&gt; m_ManagerPower { get; set; }
 &nbsp; &nbsp; &nbsp; &nbsp;public virtual DbSet&lt;m_ManagerRole&gt; m_ManagerRole { get; set; }
 &nbsp; &nbsp; &nbsp; &nbsp;public virtual DbSet&lt;m_Message&gt; m_Message { get; set; }
 &nbsp; &nbsp; &nbsp; &nbsp;public virtual DbSet&lt;m_Navigation&gt; m_Navigation { get; set; }
 &nbsp; &nbsp; &nbsp; &nbsp;public virtual DbSet&lt;m_NavigationClassify&gt; m_NavigationClassify { get; set; }
 &nbsp; &nbsp; &nbsp; &nbsp;public virtual DbSet&lt;m_Posts&gt; m_Posts { get; set; }
 &nbsp; &nbsp; &nbsp; &nbsp;public virtual DbSet&lt;m_PostsChannel&gt; m_PostsChannel { get; set; }
 &nbsp; &nbsp; &nbsp; &nbsp;public virtual DbSet&lt;m_PostsAnswer&gt; m_PostsAnswer { get; set; }
 &nbsp; &nbsp; &nbsp; &nbsp;public virtual DbSet&lt;m_PostsAnswerRecords&gt; m_PostsAnswerRecords { get; set; }
 &nbsp; &nbsp; &nbsp; &nbsp;public virtual DbSet&lt;m_PostsAttention&gt; m_PostsAttention { get; set; }
 &nbsp; &nbsp; &nbsp; &nbsp;public virtual DbSet&lt;m_PostsComments&gt; m_PostsComments { get; set; }
 &nbsp; &nbsp; &nbsp; &nbsp;public virtual DbSet&lt;m_PostsCommentsRecords&gt; m_PostsCommentsRecords { get; set; }
 &nbsp; &nbsp; &nbsp; &nbsp;public virtual DbSet&lt;m_PostsTags&gt; m_PostsTags { get; set; }
 &nbsp; &nbsp; &nbsp; &nbsp;public virtual DbSet&lt;m_User&gt; m_User { get; set; }
 &nbsp; &nbsp; &nbsp; &nbsp;public virtual DbSet&lt;m_UserGroup&gt; m_UserGroup { get; set; }
 &nbsp; &nbsp; &nbsp; &nbsp;public virtual DbSet&lt;m_UserGroupMenu&gt; m_UserGroupMenu { get; set; }
 &nbsp; &nbsp; &nbsp; &nbsp;public virtual DbSet&lt;m_UserGroupPower&gt; m_UserGroupPower { get; set; }
 &nbsp; &nbsp; &nbsp; &nbsp;#endregion
 &nbsp; &nbsp;}
}</code></pre><p>4.接下来我们在Mango.Repository仓储类库项目中使用EFCore，代码示例如下:</p><pre class="prettyprint"><code class="language-csharp">using System;
using System.Collections.Generic;
using System.Text;
using System.Linq;
using Mango.Framework.EFCore;
using Microsoft.EntityFrameworkCore;
using System.Data.SqlClient;
namespace Mango.Repository
{
 &nbsp; &nbsp;public class AuthorizationRepository
 &nbsp; &nbsp;{
 &nbsp; &nbsp; &nbsp; &nbsp;private EFDbContext _dbContext = null;
 &nbsp; &nbsp; &nbsp; &nbsp;public AuthorizationRepository()
 &nbsp; &nbsp; &nbsp; &nbsp;{
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;_dbContext = new EFDbContext();
 &nbsp; &nbsp; &nbsp; &nbsp;}
 &nbsp; &nbsp; &nbsp; &nbsp;/// &lt;summary&gt;
 &nbsp; &nbsp; &nbsp; &nbsp;/// 根据用户组获取权限
 &nbsp; &nbsp; &nbsp; &nbsp;/// &lt;/summary&gt;
 &nbsp; &nbsp; &nbsp; &nbsp;/// &lt;param name=&quot;GroupId&quot;&gt;&lt;/param&gt;
 &nbsp; &nbsp; &nbsp; &nbsp;/// &lt;returns&gt;&lt;/returns&gt;
 &nbsp; &nbsp; &nbsp; &nbsp;public List&lt;Models.UserGroupPowerModel&gt; GetPowerData(int groupId)
 &nbsp; &nbsp; &nbsp; &nbsp;{
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;var query = from ugp in _dbContext.m_UserGroupPower
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;join ugm in _dbContext.m_UserGroupMenu
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;on ugp.MId equals ugm.MId
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;where ugp.GroupId == groupId
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;select new Models.UserGroupPowerModel()
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;{
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;GroupId=ugp.GroupId.Value,
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;MId=ugm.MId.Value,
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;MName=ugm.MName,
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;AreaName=ugm.AreaName,
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ControllerName=ugm.ControllerName,
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ActionName=ugm.ActionName
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;};
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return query.ToList();
 &nbsp; &nbsp; &nbsp; &nbsp;}
 &nbsp; &nbsp;}
}</code></pre><p>以上介绍了EFCore的基本使用示例,其实我们平常在项目中会将一些常用的增删改统一封装起来,我们创建一个CommonRepository类,代码如下:</p><pre class="prettyprint"><code class="language-csharp">using System;
using System.Reflection;
using System.Collections.Generic;
using System.Text;
using Mango.Framework.EFCore;
using Microsoft.EntityFrameworkCore;
using System.ComponentModel.DataAnnotations;
namespace Mango.Repository
{
 &nbsp; &nbsp;public class CommonRepository
 &nbsp; &nbsp;{
 &nbsp; &nbsp; &nbsp; &nbsp;private EFDbContext _dbContext = null;
 &nbsp; &nbsp; &nbsp; &nbsp;public CommonRepository()
 &nbsp; &nbsp; &nbsp; &nbsp;{
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;_dbContext = new EFDbContext();
 &nbsp; &nbsp; &nbsp; &nbsp;}
 &nbsp; &nbsp; &nbsp; &nbsp;/// &lt;summary&gt;
 &nbsp; &nbsp; &nbsp; &nbsp;/// 添加记录
 &nbsp; &nbsp; &nbsp; &nbsp;/// &lt;/summary&gt;
 &nbsp; &nbsp; &nbsp; &nbsp;/// &lt;typeparam name=&quot;TEntity&quot;&gt;&lt;/typeparam&gt;
 &nbsp; &nbsp; &nbsp; &nbsp;/// &lt;param name=&quot;entity&quot;&gt;&lt;/param&gt;
 &nbsp; &nbsp; &nbsp; &nbsp;/// &lt;returns&gt;&lt;/returns&gt;
 &nbsp; &nbsp; &nbsp; &nbsp;public bool Add&lt;TEntity&gt;(TEntity entity) where TEntity:class
 &nbsp; &nbsp; &nbsp; &nbsp;{
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;_dbContext.Add(entity);
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return _dbContext.SaveChanges() &gt; 0;
 &nbsp; &nbsp; &nbsp; &nbsp;}
 &nbsp; &nbsp; &nbsp; &nbsp;/// &lt;summary&gt;
 &nbsp; &nbsp; &nbsp; &nbsp;/// 根据Id获取指定记录
 &nbsp; &nbsp; &nbsp; &nbsp;/// &lt;/summary&gt;
 &nbsp; &nbsp; &nbsp; &nbsp;/// &lt;typeparam name=&quot;TEntity&quot;&gt;&lt;/typeparam&gt;
 &nbsp; &nbsp; &nbsp; &nbsp;/// &lt;param name=&quot;Id&quot;&gt;&lt;/param&gt;
 &nbsp; &nbsp; &nbsp; &nbsp;/// &lt;returns&gt;&lt;/returns&gt;
 &nbsp; &nbsp; &nbsp; &nbsp;public TEntity Find&lt;TEntity&gt;(int Id) where TEntity : class
 &nbsp; &nbsp; &nbsp; &nbsp;{
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return _dbContext.Find&lt;TEntity&gt;(Id);
 &nbsp; &nbsp; &nbsp; &nbsp;}
 &nbsp; &nbsp; &nbsp; &nbsp;/// &lt;summary&gt;
 &nbsp; &nbsp; &nbsp; &nbsp;/// 更新记录
 &nbsp; &nbsp; &nbsp; &nbsp;/// &lt;/summary&gt;
 &nbsp; &nbsp; &nbsp; &nbsp;/// &lt;typeparam name=&quot;TEntity&quot;&gt;&lt;/typeparam&gt;
 &nbsp; &nbsp; &nbsp; &nbsp;/// &lt;param name=&quot;entity&quot;&gt;&lt;/param&gt;
 &nbsp; &nbsp; &nbsp; &nbsp;/// &lt;param name=&quot;IsFind&quot;&gt;&lt;/param&gt;
 &nbsp; &nbsp; &nbsp; &nbsp;/// &lt;returns&gt;&lt;/returns&gt;
 &nbsp; &nbsp; &nbsp; &nbsp;public bool Update&lt;TEntity&gt;(TEntity entity, bool isFind) where TEntity : class
 &nbsp; &nbsp; &nbsp; &nbsp;{
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;_dbContext.Update(entity);

 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return _dbContext.SaveChanges() &gt; 0;
 &nbsp; &nbsp; &nbsp; &nbsp;}
 &nbsp; &nbsp; &nbsp; &nbsp;/// &lt;summary&gt;
 &nbsp; &nbsp; &nbsp; &nbsp;/// 更新记录(修改指定的列)
 &nbsp; &nbsp; &nbsp; &nbsp;/// &lt;/summary&gt;
 &nbsp; &nbsp; &nbsp; &nbsp;/// &lt;typeparam name=&quot;TEntity&quot;&gt;&lt;/typeparam&gt;
 &nbsp; &nbsp; &nbsp; &nbsp;/// &lt;param name=&quot;entity&quot;&gt;&lt;/param&gt;
 &nbsp; &nbsp; &nbsp; &nbsp;/// &lt;param name=&quot;properties&quot;&gt;&lt;/param&gt;
 &nbsp; &nbsp; &nbsp; &nbsp;/// &lt;returns&gt;&lt;/returns&gt;
 &nbsp; &nbsp; &nbsp; &nbsp;public bool Update&lt;TEntity&gt;(TEntity entity) where TEntity : class
 &nbsp; &nbsp; &nbsp; &nbsp;{
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;_dbContext.Entry(entity).State = EntityState.Unchanged;
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;//
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Type type= entity.GetType();
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;//处理实体类属性
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;PropertyInfo[] properties = type.GetProperties();
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;foreach (var property in properties)
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;{
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;object value = property.GetValue(entity, null);
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;var key = property.GetCustomAttribute&lt;KeyAttribute&gt;();
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (value != null&amp;&amp; key==null)
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;{
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;_dbContext.Entry(entity).Property(property.Name).IsModified = true;
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return _dbContext.SaveChanges() &gt; 0;
 &nbsp; &nbsp; &nbsp; &nbsp;}
 &nbsp; &nbsp; &nbsp; &nbsp;/// &lt;summary&gt;
 &nbsp; &nbsp; &nbsp; &nbsp;/// 删除记录
 &nbsp; &nbsp; &nbsp; &nbsp;/// &lt;/summary&gt;
 &nbsp; &nbsp; &nbsp; &nbsp;/// &lt;typeparam name=&quot;TEntity&quot;&gt;&lt;/typeparam&gt;
 &nbsp; &nbsp; &nbsp; &nbsp;/// &lt;param name=&quot;entity&quot;&gt;&lt;/param&gt;
 &nbsp; &nbsp; &nbsp; &nbsp;/// &lt;returns&gt;&lt;/returns&gt;
 &nbsp; &nbsp; &nbsp; &nbsp;public bool Delete&lt;TEntity&gt;(TEntity entity) where TEntity : class
 &nbsp; &nbsp; &nbsp; &nbsp;{
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;_dbContext.Remove(entity);
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return _dbContext.SaveChanges() &gt; 0;
 &nbsp; &nbsp; &nbsp; &nbsp;}
 &nbsp; &nbsp;}
}</code></pre><p>PS:这篇EFCore的基础使用就到此为止,详情请下载源代码查看,下一篇将讲解如何基于EFCore进行一些基础的扩展<br/></p>', CAST(N'2019-01-02T16:19:22.697' AS DateTime), CAST(N'2019-01-02T16:19:22.697' AS DateTime), 2, 1, 346, 1, N'', N'', 0, 4)
INSERT [dbo].[m_CmsContents] ([ContentsId], [Title], [Contents], [PostTime], [LastTime], [AccountId], [PlusCount], [ReadCount], [StateCode], [Tags], [ImgUrl], [AnswerCount], [ChannelId]) VALUES (13, N'使用Asp.Net Core MVC 开发项目实践[第三篇:基于EF Core的扩展]', N'<p>上篇我们说到了EFCore的基础使用,这篇我们将讲解下基于EFCore的扩展.</p><p>我们在Mango.Framework.EFCore类库项目中创建一个类名EFExtended的扩展类,并且引入相关的命名空间</p><pre class="prettyprint"><code class="language-csharp">using System;
using System.Reflection;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using System.Linq;
using System.Linq.Expressions;
namespace Mango.Framework.EFCore
{
 &nbsp; &nbsp;public static class EFExtended
 &nbsp; &nbsp;{}
}</code></pre><p>第一个扩展:基于传统DataTable(这个在2.0中才开始有)的返回</p><pre class="prettyprint"><code class="language-csharp">#region 查询返回DataTable的扩展
 &nbsp; &nbsp; &nbsp; &nbsp;
 &nbsp; &nbsp; &nbsp; &nbsp;///&nbsp; &nbsp; &nbsp; &nbsp;///&nbsp; &nbsp; &nbsp; &nbsp;///自定义SQL语句&nbsp; &nbsp; &nbsp; &nbsp;///参数&nbsp; &nbsp; &nbsp; &nbsp;///&nbsp; &nbsp; &nbsp; &nbsp;public static DataTable QueryDataTable(this DbContext context, string sql, params SqlParameter[] parameters)
 &nbsp; &nbsp; &nbsp; &nbsp;{
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;DbConnection connection = null;
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;DbCommand command = null;
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;try
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;{
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;connection = context.Database.GetDbConnection();
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (connection.State == ConnectionState.Closed)
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;{
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;connection.Open();
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;command = connection.CreateCommand();
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;command.CommandText = sql;
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;command.Parameters.AddRange(parameters);
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;DbDataReader reader = command.ExecuteReader();
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;var result= FillDataTable(reader);
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;//释放连接资源
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;command.Dispose();
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;connection.Close();
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;//
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return result;
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;catch (Exception ex)
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;{
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;throw ex;
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;finally
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;{
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;//释放连接资源
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (command != null)
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;{
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;command.Dispose();
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (connection != null)
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;{
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;connection.Close();
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}
 &nbsp; &nbsp; &nbsp; &nbsp;}
 &nbsp; &nbsp; &nbsp; &nbsp;///&nbsp; &nbsp; &nbsp; &nbsp;///&nbsp; &nbsp; &nbsp; &nbsp;///&nbsp; &nbsp; &nbsp; &nbsp;private static DataTable FillDataTable(DbDataReader reader)
 &nbsp; &nbsp; &nbsp; &nbsp;{
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;bool defined = false;

 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;DataTable table = new DataTable();
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;while (reader.Read())
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;{
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;object[] values = new object[reader.FieldCount];
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;//插入列信息
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (!defined)
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;{
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;for (int i = 0; i &lt; reader.FieldCount; i++)
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;{
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;DataColumn column = new DataColumn()
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;{
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ColumnName = reader.GetName(i),
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;DataType = reader.GetFieldType(i)
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;};

 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;table.Columns.Add(column);
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}

 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;defined = true;
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}

 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;//插入数据
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;reader.GetValues(values);
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;DataRow dataRow = table.NewRow();
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;for (int i = 0; i &lt; values.Length; i++)
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;{
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;dataRow[i] = values[i];
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;table.Rows.Add(dataRow);
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return table;
 &nbsp; &nbsp; &nbsp; &nbsp;}
 &nbsp; &nbsp; &nbsp; &nbsp;#endregion</code></pre><p>就是通过DbCommand类执行SQL语句返回DbDataReader的数据集合,将返回的数据集合填充到DataTable实例中去.</p><p>第二个扩展:基于SQL语句的查询返回指定的集合对象</p><pre class="prettyprint"><code class="language-csharp"> &nbsp; &nbsp; &nbsp; &nbsp;#region 查询返回Model的扩展
 &nbsp; &nbsp; &nbsp; &nbsp;///&nbsp; &nbsp; &nbsp; &nbsp;///&nbsp; &nbsp; &nbsp; &nbsp;///&nbsp; &nbsp; &nbsp; &nbsp;///&nbsp; &nbsp; &nbsp; &nbsp;///&nbsp; &nbsp; &nbsp; &nbsp;///&nbsp; &nbsp; &nbsp; &nbsp;public static List</code></pre><p>在这里我们还需要创建一个&nbsp;DbIdentity类来处理返回的数据中带有空值的情况</p><pre class="prettyprint"><code class="language-csharp">using System;
using System.Collections.Generic;
using System.Reflection;
using System.ComponentModel;
namespace Mango.Framework.EFCore
{
 &nbsp; &nbsp;public class DbIdentity
 &nbsp; &nbsp;{
 &nbsp; &nbsp; &nbsp; &nbsp;///&nbsp; &nbsp; &nbsp; &nbsp;///&nbsp; &nbsp; &nbsp; &nbsp;///&nbsp; &nbsp; &nbsp; &nbsp;///&nbsp; &nbsp; &nbsp; &nbsp;internal static object Change(object value, Type type)
 &nbsp; &nbsp; &nbsp; &nbsp;{
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (type.IsGenericParameter)
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;{
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (type.IsGenericParameter &amp;&amp; type.GetGenericTypeDefinition().Equals(typeof(Nullable&lt;&gt;)))
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;{
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (value == null)
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;{
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return null;
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;NullableConverter nullableConverter = new NullableConverter(type);
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;value = Convert.ChangeType(value, type);
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return value;
 &nbsp; &nbsp; &nbsp; &nbsp;}
 &nbsp; &nbsp;}</code><p><code class="language-csharp">}</code></p></pre>', CAST(N'2019-01-02T16:58:40.203' AS DateTime), CAST(N'2019-01-04T21:20:25.913' AS DateTime), 2, 1, 269, 1, N'', N'', 0, 4)
INSERT [dbo].[m_CmsContents] ([ContentsId], [Title], [Contents], [PostTime], [LastTime], [AccountId], [PlusCount], [ReadCount], [StateCode], [Tags], [ImgUrl], [AnswerCount], [ChannelId]) VALUES (14, N'分享一个腾讯的免费验证码使用', N'<p>腾讯提供的验证码服务,可以用来验证注册,内容发布验证等</p>
<p>官网地址:<a title="点击此处连接到官网" href="https://007.qq.com/product.html?ADTAG=index.foot" target="_blank" rel="noopener">https://007.qq.com/product.html?ADTAG=index.foot</a></p>
<p>接下来我们看看如何在项目中接入使用，这里我们以注册验证作为实例:</p>
<p><strong>第一步:</strong></p>
<p>申请注册验证码服务,并且拿到官方提供的appid以及AppSecretKey这两个数据并且把它们放到配置文件中,项目接入中需要使用到,这个过程就不再累述了.</p>
<p><strong>第二步：</strong></p>
<p>我们创建一个实体类用来接收腾讯验证返回的数据</p>
<pre class="language-csharp"><code>using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Mango.Web.Extensions
{
    public class TencentCaptchaResult
    {
        /// &lt;summary&gt;
        /// 1:验证成功，0:验证失败，100:AppSecretKey参数校验错误[required]
        /// &lt;/summary&gt;
        public int response { get; set; }
        /// &lt;summary&gt;
        /// [0,100]，恶意等级[optional]
        /// &lt;/summary&gt;
        public int evil_level { get; set; }
        /// &lt;summary&gt;
        /// 验证错误信息[optional]
        /// &lt;/summary&gt;
        public string err_msg { get; set; }
    }
}
</code></pre>
<p><strong>&nbsp;第三步：</strong></p>
<p>服务端创建一个方法调用腾讯提供的API,用来验证当前验证的操作是否有效</p>
<pre class="language-csharp"><code>        /// &lt;summary&gt;
        /// 腾讯验证码服务端验证
        /// &lt;/summary&gt;
        /// &lt;param name="ticket"&gt;&lt;/param&gt;
        /// &lt;param name="randstr"&gt;&lt;/param&gt;
        /// &lt;param name="userIP"&gt;&lt;/param&gt;
        /// &lt;returns&gt;&lt;/returns&gt;
        private bool TencentCaptcha(string ticket,string randstr,string userIP)
        {
            string aid = Framework.Core.Configuration.GetItem("Tencent_VerificationAppId");
            string appSecretKey = Framework.Core.Configuration.GetItem("Tencent_VerificationAppSecretKey");
            string url = "https://ssl.captcha.qq.com/ticket/verify";
            string p = string.Format("aid={0}&amp;AppSecretKey={1}&amp;Ticket={2}&amp;Randstr={3}&amp;UserIP={4}",aid,appSecretKey, ticket, randstr, userIP);
            Framework.Core.HttpWebRequestHelper http = new Framework.Core.HttpWebRequestHelper();
            string httpResult= http.HttpGet(string.Format("{0}?{1}", url, p));
            Extensions.TencentCaptchaResult tencentCaptchaResult = JsonConvert.DeserializeObject&lt;Extensions.TencentCaptchaResult&gt;(httpResult);
            return tencentCaptchaResult.response == 1 ? true : false;
        }</code></pre>
<p>PS:Framework.Core.Configuration.GetItem("Tencent_VerificationAppId")是我自己项目中获取从配置文件中拿到的配置信息项,大家在项目中使用的时候只需要替换成自己的就行.</p>
<p><strong>第四步：</strong></p>
<p>前端使用,我们将验证码触发绑定到按钮上,代码如下</p>
<pre class="language-markup"><code>&lt;button class="btn" id="TencentCaptcha" data-appid="@appId" data-cbfn="callback" type="button"&gt;获取注册验证码&lt;/button&gt;</code></pre>
<p>PS：控件ID最好以TencentCaptcha命名,data-appid=""为第一步申请的APPID,data-cbfn="callback"中的callback表示验证完成时的回调事件</p>
<pre class="language-markup"><code>window.callback = function (res) {
            console.log(res)
            // res（未通过验证）= {ret: 1, ticket: null}
            // res（验证成功） = {ret: 0, ticket: "String", randstr: "String"}
            if (res.ret === 0) {
                //验证通过时此处可加入自己项目的业务逻辑
                //alert(res.ticket)   // 票据
            }
        }</code></pre>
<p>第五步:</p>
<p>后台验证前端验证结果是否有效</p>
<pre class="language-csharp"><code>bool tencentCaptchaResult= TencentCaptcha(ticket, randstr, userIP);</code></pre>
<p>在后台调用第三部中我们定义的方法就能获取到当前的验证是否有效,true表示通过,false表示未通过.</p>
<p>到此为止腾讯验证码的基本接入已经完成,下面我们看看运行效果图:</p>
<p><img src="https://file.51core.net/2/2019/1/bd675dca297d4f64996214755eafa200.png" /></p>', CAST(N'2019-01-07T10:53:42.713' AS DateTime), CAST(N'2019-01-07T10:53:42.713' AS DateTime), 2, 0, 422, 1, N'', N'', 0, 3)
INSERT [dbo].[m_CmsContents] ([ContentsId], [Title], [Contents], [PostTime], [LastTime], [AccountId], [PlusCount], [ReadCount], [StateCode], [Tags], [ImgUrl], [AnswerCount], [ChannelId]) VALUES (15, N'GitHub重磅更新!私有代码库从此进入免费时代', N'<p>GitHub CEO&nbsp;Nat Friedman 今日<a href="https://blog.github.com/2019-01-07-new-year-new-github/" target="_blank" rel="noopener" data-cke-saved-href="https://blog.github.com/2019-01-07-new-year-new-github/">宣布</a>了两个重要更新：</p>
<p>一是 GitHub 私有库现在可免费使用，每个免费的存储库最多可以有3人协作，如果想要更多的协作者，则需要付费；</p>
<p>二是将 Enterprise Cloud （前身为 GitHub Business Cloud）和 Enterprise Server （前身为 GitHub Enterprise）统一为 GitHub Enterprise ，想要在云或自托管配置中灵活使用 GitHub 的组织现在只需付一个产品的价格就能同时使用这两项服务。</p>
<p><img src="https://file.51core.net/2/2019/1/3fa8e9c52c2b44579401f44e07a3ec35.png" /></p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>官方网址:<a title="github.com代码仓库" href="https://github.com/" target="_blank" rel="noopener">https://github.com/</a></p>', CAST(N'2019-01-08T15:09:31.347' AS DateTime), CAST(N'2019-01-08T15:09:31.347' AS DateTime), 2, 0, 224, 1, N'', N'', 0, 1)
INSERT [dbo].[m_CmsContents] ([ContentsId], [Title], [Contents], [PostTime], [LastTime], [AccountId], [PlusCount], [ReadCount], [StateCode], [Tags], [ImgUrl], [AnswerCount], [ChannelId]) VALUES (16, N'使用Asp.Net Core MVC 开发项目实践[第四篇:基于EF Core的扩展2]', N'<p>上篇我们说到了基于EFCore的基础扩展,这篇我们讲解下基于实体结合拉姆达表达式的自定义更新以及删除数据.</p>
<p>先说下原理:<strong>其实通过实体以及拉姆达表达式生成SQL语句去执行</strong></p>
<p><strong>第一种更新扩展:</strong></p>
<p>自定义更新字段以及自定义扩展条件,请看下面的代码</p>
<pre class="language-csharp"><code>        /// &lt;summary&gt;
        /// 自定义更新扩展
        /// &lt;/summary&gt;
        /// &lt;typeparam name="TEntity"&gt;&lt;/typeparam&gt;
        /// &lt;param name="context"&gt;&lt;/param&gt;
        /// &lt;param name="fields"&gt;更新字段&lt;/param&gt;
        /// &lt;param name="predicate"&gt;更新条件&lt;/param&gt;
        /// &lt;returns&gt;&lt;/returns&gt;
        public static bool MangoUpdate&lt;TEntity&gt;(this DbContext context, Expression&lt;Func&lt;TEntity, bool&gt;&gt; fields, Expression&lt;Func&lt;TEntity, bool&gt;&gt; predicate) where TEntity : class, new()
        {
            TSqlAssembledResult result = TSqlAssembled.Update&lt;TEntity&gt;(fields, predicate);
            context.Database.ExecuteSqlCommand(result.SqlStr);
            return context.SaveChanges() &gt; 0 ? true : false;
        }</code></pre>
<p>从上面的方法中我们看到几个参数,第一个参数不必说,扩展方法第一个参数必须要的,我们重点讲清楚一下第二个和第三个参数.</p>
<p>参数:</p>
<pre class="language-csharp"><code>Expression&lt;Func&lt;TEntity, bool&gt;&gt; fields </code></pre>
<p>表示实体中需要更新的字段,这里的参数要求的是一个拉姆达表达式,如下面的代码：</p>
<pre class="language-csharp"><code>m =&gt; m.ClickCount == m.ClickCount + 1</code></pre>
<p>这里就是更新字段ClickCount+1的功能.</p>
<p>参数:</p>
<pre class="language-csharp"><code>Expression&lt;Func&lt;TEntity, bool&gt;&gt; predicate</code></pre>
<p>表示更新条件,这个参数也是一个拉姆达表达式,如下面代码:</p>
<pre class="language-csharp"><code>m =&gt; m.NavigationId == navigationId</code></pre>
<p>这里表示更新条件 NavigationId指定值的数据库记录.</p>
<p>接下来我们看方法中的调用</p>
<p>&nbsp;TSqlAssembled.Update&lt;TEntity&gt;(fields, predicate);</p>
<p>这个方法表示将参数解析成SQL语句,我们看看这个方法的具体内容:</p>
<pre class="language-csharp"><code>        /// &lt;summary&gt;
        /// 更新语句组装
        /// &lt;/summary&gt;
        /// &lt;typeparam name="TEntity"&gt;&lt;/typeparam&gt;
        /// &lt;param name="fields"&gt;&lt;/param&gt;
        /// &lt;param name="predicate"&gt;&lt;/param&gt;
        /// &lt;returns&gt;&lt;/returns&gt;
        public static TSqlAssembledResult Update&lt;TEntity&gt;(Expression&lt;Func&lt;TEntity, bool&gt;&gt; fields, Expression&lt;Func&lt;TEntity, bool&gt;&gt; predicate) where TEntity : class, new()
        {
            try
            {
                StringBuilder strBuilder = new StringBuilder();
                strBuilder.Append("update ");
                strBuilder.Append(typeof(TEntity).Name);
                strBuilder.Append(" set ");
                //解析需要更新的字段值
                UpdateFieldBuilder updateFieldBuilder = new UpdateFieldBuilder();
                strBuilder.Append(updateFieldBuilder.Translate(fields));
                //解析条件
                ConditionBuilder conditionBuilder = new ConditionBuilder();
                strBuilder.Append(" where ");
                strBuilder.Append(conditionBuilder.Translate(predicate));
                //处理结果返回
                TSqlAssembledResult result = new TSqlAssembledResult();
                result.SqlParameters = null;
                result.SqlStr = strBuilder.ToString();
                return result;
            }
            catch(Exception ex)
            {
                return null;
                throw ex;
            }
        }</code></pre>
<p>PS：这个方法中用到的条件编译类以及字段编辑类我们将在文章底部贴出来.</p>
<p><strong>第二种更新扩展：</strong></p>
<pre class="language-csharp"><code>        /// &lt;summary&gt;
        /// 自定义更新扩展
        /// &lt;/summary&gt;
        /// &lt;typeparam name="TEntity"&gt;&lt;/typeparam&gt;
        /// &lt;param name="context"&gt;&lt;/param&gt;
        /// &lt;param name="entity"&gt;更新实体&lt;/param&gt;
        /// &lt;param name="predicate"&gt;更新条件&lt;/param&gt;
        /// &lt;returns&gt;&lt;/returns&gt;
        public static bool MangoUpdate&lt;TEntity&gt;(this DbContext context, TEntity entity, Expression&lt;Func&lt;TEntity, bool&gt;&gt; predicate) where TEntity:class,new()
        {
            TSqlAssembledResult result = TSqlAssembled.Update&lt;TEntity&gt;(entity, predicate);
            context.Database.ExecuteSqlCommand(result.SqlStr, result.SqlParameters);
            return context.SaveChanges() &gt; 0 ? true : false;
        }</code></pre>
<p>参数 TEntity entity表示需要更新的实体</p>
<p>参数 Expression&lt;Func&lt;TEntity, bool&gt;&gt; predicate 表示更新条件,示例如下:</p>
<pre class="language-csharp"><code>m =&gt; m.NavigationId == navigationId</code></pre>
<p>TSqlAssembled.Update&lt;TEntity&gt;(entity, predicate)</p>
<p>这个方法表示将参数解析成SQL语句,我们看看这个方法的具体内容:</p>
<pre class="language-csharp"><code>        /// &lt;summary&gt;
        /// 更新语句组装
        /// &lt;/summary&gt;
        /// &lt;typeparam name="TEntity"&gt;&lt;/typeparam&gt;
        /// &lt;param name="entity"&gt;&lt;/param&gt;
        /// &lt;param name="predicate"&gt;&lt;/param&gt;
        /// &lt;returns&gt;&lt;/returns&gt;
        public static TSqlAssembledResult Update&lt;TEntity&gt;(TEntity entity, Expression&lt;Func&lt;TEntity, bool&gt;&gt; predicate) where TEntity : class, new()
        {
            try
            {
                StringBuilder strBuilder = new StringBuilder();
                strBuilder.Append("update ");
                //
                Type type = entity.GetType();
                strBuilder.Append(type.Name);
                strBuilder.Append(" set ");
                //处理实体类属性
                PropertyInfo[] properties = type.GetProperties();
                int index = 0;
                List&lt;SqlParameter&gt; sqlParameter = new List&lt;SqlParameter&gt;();
                foreach (var property in properties)
                {
                    object value = property.GetValue(entity, null);
                    if (value != null)
                    {
                        if (index != 0)
                        {
                            strBuilder.Append(",");
                        }
                        strBuilder.Append(property.Name);
                        strBuilder.Append("=@");
                        strBuilder.Append(property.Name);

                        sqlParameter.Add(new SqlParameter(property.Name, value));
                        index++;
                    }
                }
                //编译条件
                ConditionBuilder conditionBuilder = new ConditionBuilder();
                strBuilder.Append(" where ");
                strBuilder.Append(conditionBuilder.Translate(predicate));
                //处理结果返回
                TSqlAssembledResult result = new TSqlAssembledResult();
                result.SqlParameters = sqlParameter.ToArray();
                result.SqlStr = strBuilder.ToString();
                return result;
            }
            catch (Exception ex)
            {
                return null;
                throw ex;
            }
        }</code></pre>
<p>PS：这里我们多了将实体反射获取需要更新的字段以及字段值.</p>
<p><strong>第三种删除扩展:</strong></p>
<p>自定删除条件,代码如下</p>
<pre class="language-csharp"><code>        /// &lt;summary&gt;
        /// 自定义删除扩展
        /// &lt;/summary&gt;
        /// &lt;typeparam name="TEntity"&gt;&lt;/typeparam&gt;
        /// &lt;param name="context"&gt;&lt;/param&gt;
        /// &lt;param name="predicate"&gt;删除条件&lt;/param&gt;
        /// &lt;returns&gt;&lt;/returns&gt;
        public static bool MangoRemove&lt;TEntity&gt;(this DbContext context,Expression&lt;Func&lt;TEntity, bool&gt;&gt; predicate) where TEntity : class,new()
        {
            TSqlAssembledResult result = TSqlAssembled.Delete&lt;TEntity&gt;(predicate);
            context.Database.ExecuteSqlCommand(result.SqlStr);
            return context.SaveChanges() &gt; 0 ? true : false;
        }</code></pre>
<p>参数Expression&lt;Func&lt;TEntity, bool&gt;&gt; predicate表示为自定义条件,示例如下:</p>
<pre class="language-csharp"><code>_dbContext.MangoRemove&lt;Entity.m_PostsAnswerRecords&gt;(m =&gt; m.AnswerId == model.AnswerId &amp;&amp; m.UserId == model.UserId);</code></pre>
<p>PS:此段代码表示根据指定条件删除m_PostsAnswerRecords表中的记录</p>
<p>TSqlAssembled.Delete&lt;TEntity&gt;(predicate)方法负责将指定条件编译成SQL语句,代码如下:</p>
<pre class="language-csharp"><code>        /// &lt;summary&gt;
        /// 删除语句组装
        /// &lt;/summary&gt;
        /// &lt;typeparam name="TEntity"&gt;&lt;/typeparam&gt;
        /// &lt;param name="predicate"&gt;&lt;/param&gt;
        /// &lt;returns&gt;&lt;/returns&gt;
        public static TSqlAssembledResult Delete&lt;TEntity&gt;(Expression&lt;Func&lt;TEntity, bool&gt;&gt; predicate) where TEntity:class,new()
        {
            try
            {
                string tableName = typeof(TEntity).Name;
                //条件编译
                ConditionBuilder conditionBuilder = new ConditionBuilder();
                string conditionStr = conditionBuilder.Translate(predicate);
                StringBuilder strBuilder = new StringBuilder();
                strBuilder.Append("delete from ");
                strBuilder.Append(tableName);
                strBuilder.Append(" where ");
                strBuilder.Append(conditionStr);
                //处理结果返回
                TSqlAssembledResult result = new TSqlAssembledResult();
                result.SqlParameters = null;
                result.SqlStr = strBuilder.ToString();
                return result;
            }
            catch(Exception ex)
            {
                throw ex;
            }
        }</code></pre>
<p>下面我们贴出字段以及条件的拉姆达表达式解析类:</p>
<p>条件解析类(ConditionBuilder)：</p>
<pre class="language-csharp"><code>using System;
using System.Collections.Generic;
using System.Text;
using System.Linq;
using System.Linq.Expressions;
using System.Reflection;
namespace Mango.Framework.EFCore
{
    public class ConditionBuilder : ExpressionVisitor
    {

        StringBuilder strBuilder;

        public ConditionBuilder()
        {
        }

        public string Translate(Expression expression)
        {
            this.strBuilder = new StringBuilder();
            this.Visit(expression);
            return this.strBuilder.ToString();
        }

        private static Expression StripQuotes(Expression e)
        {
            while (e.NodeType == ExpressionType.Quote)
            {
                e = ((UnaryExpression)e).Operand;
            }
            return e;
        }

        protected override Expression VisitBinary(BinaryExpression b)
        {
            strBuilder.Append("(");
            this.Visit(b.Left);
            switch (b.NodeType)
            {
                case ExpressionType.AndAlso:
                    strBuilder.Append(" and ");
                    break;
                case ExpressionType.OrElse:
                    strBuilder.Append(" or ");
                    break;
                case ExpressionType.Equal:
                    strBuilder.Append(" = ");
                    break;
                case ExpressionType.NotEqual:
                    strBuilder.Append(" &lt;&gt; ");
                    break;
                case ExpressionType.LessThan:
                    strBuilder.Append(" &lt; ");
                    break;
                case ExpressionType.LessThanOrEqual:
                    strBuilder.Append(" &lt;= ");
                    break;
                case ExpressionType.GreaterThan:
                    strBuilder.Append(" &gt; ");
                    break;
                case ExpressionType.GreaterThanOrEqual:
                    strBuilder.Append(" &gt;= ");
                    break;
                default:
                    throw new NotSupportedException(string.Format("运算符{0}不支持", b.NodeType));
            }
            if (b.Right.NodeType != ExpressionType.Parameter&amp;&amp; b.Right.NodeType == ExpressionType.MemberAccess)
            {
                LambdaExpression lambda = Expression.Lambda(b.Right);
                var fn = lambda.Compile();
                this.Visit(Expression.Constant(fn.DynamicInvoke(null), b.Right.Type));
            }
            else
            { 
                this.Visit(b.Right);
            }
            strBuilder.Append(")");
            return b;
        }

        protected override Expression VisitConstant(ConstantExpression c)
        {
            switch (Type.GetTypeCode(c.Value.GetType()))
            {
                case TypeCode.Boolean:
                    strBuilder.Append(((bool)c.Value) ? 1 : 0);
                    break;
                case TypeCode.String:
                    strBuilder.Append("''");
                    strBuilder.Append(c.Value);
                    strBuilder.Append("''");
                    break;
                case TypeCode.Object:
                    throw new NotSupportedException(string.Format("常量{0}不支持", c.Value));
                default:
                    strBuilder.Append(c.Value);
                    break;
            }
            return c;
        }

        protected override Expression VisitMember(MemberExpression m)
        {
            if (m.Expression != null &amp;&amp; m.Expression.NodeType == ExpressionType.Parameter)
            {
                strBuilder.Append(m.Member.Name);
                return m;
            }
            else if (m.Expression != null &amp;&amp; m.Expression.NodeType == ExpressionType.Constant)
            {
                LambdaExpression lambda = Expression.Lambda(m);
                var fn = lambda.Compile();
                this.Visit(Expression.Constant(fn.DynamicInvoke(null), m.Type));
                return m;
            }
            throw new NotSupportedException(string.Format("成员{0}不支持", m.Member.Name));
        }
    }
}
</code></pre>
<p>更新字段解析类(UpdateFieldBuilder):</p>
<pre class="language-csharp"><code>using System;
using System.Collections.Generic;
using System.Text;
using System.Linq;
using System.Linq.Expressions;
using System.Reflection;
namespace Mango.Framework.EFCore
{
    public class UpdateFieldBuilder : ExpressionVisitor
    {
        StringBuilder strBuilder;
        public string Translate(Expression expression)
        {
            this.strBuilder = new StringBuilder();
            this.Visit(expression);
            return this.strBuilder.ToString();
        }

        private static Expression StripQuotes(Expression e)
        {
            while (e.NodeType == ExpressionType.Quote)
            {
                e = ((UnaryExpression)e).Operand;
            }
            return e;
        }
        protected override Expression VisitBinary(BinaryExpression b)
        {
            //strBuilder.Append("(");
            this.Visit(b.Left);
            switch (b.NodeType)
            {
                case ExpressionType.Equal:
                    strBuilder.Append("=");
                    break;
                case ExpressionType.AndAlso:
                    strBuilder.Append(",");
                    break;
                case ExpressionType.Add:
                    strBuilder.Append("+");
                    break;
                case ExpressionType.Subtract:
                    strBuilder.Append("-");
                    break;
                default:
                    throw new NotSupportedException(string.Format("运算符{0}不支持", b.NodeType));
            }
            this.Visit(b.Right);
            //strBuilder.Append(")");
            return b;
        }

        protected override Expression VisitConstant(ConstantExpression c)
        {
            switch (Type.GetTypeCode(c.Value.GetType()))
            {
                case TypeCode.Boolean:
                    strBuilder.Append(((bool)c.Value) ? 1 : 0);
                    break;
                case TypeCode.String:
                    strBuilder.Append("''");
                    strBuilder.Append(c.Value);
                    strBuilder.Append("''");
                    break;
                case TypeCode.Object:
                    throw new NotSupportedException(string.Format("常量{0}不支持", c.Value));
                default:
                    strBuilder.Append(c.Value);
                    break;
            }
            return c;
        }

        protected override Expression VisitMember(MemberExpression m)
        {
            if (m.Expression != null &amp;&amp; m.Expression.NodeType == ExpressionType.Parameter)
            {
                strBuilder.Append(m.Member.Name);
                return m;
            }
            throw new NotSupportedException(string.Format("成员{0}不支持", m.Member.Name));
        }
    }
}
</code></pre>
<p>到此本篇章完成,更详细的代码请下载源代码查看.</p>
<p>&nbsp;</p>', CAST(N'2019-01-08T23:56:17.183' AS DateTime), CAST(N'2019-01-08T23:56:17.183' AS DateTime), 2, 0, 340, 1, N'', N'', 0, 4)
INSERT [dbo].[m_CmsContents] ([ContentsId], [Title], [Contents], [PostTime], [LastTime], [AccountId], [PlusCount], [ReadCount], [StateCode], [Tags], [ImgUrl], [AnswerCount], [ChannelId]) VALUES (17, N'在Windows系统中安装Redis缓存组件的教程', N'<p>关于在Windows系统中安装Redis缓存组件的教程分享</p>
<p>第一步:</p>
<p>安装Redis组件,在这里我们是基于Windows系统的Redis安装.从下面安装地址中下载安装</p>
<p><a id="739cdf821d85d88951b7fc45f3a69885-6b7e300cf8741f9c93f2b8e97aa434ef487f5f13" class="js-navigation-open" title="Redis-x64-3.2.100.msi" href="https://github.com/51core/mango-sns-open/blob/master/docs/Redis-x64-3.2.100.msi">https://github.com/51core/mango-sns-open/blob/master/docs/Redis-x64-3.2.100.msi</a></p>
<p>第二步:</p>
<p>1.双击该安装包,出现如下界面</p>
<p><img src="https://file.51core.net/2/2019/1/d7beec18f73341fb95a99fb9798a13ec.png" /></p>
<p>2.同意安装协议:</p>
<p><img src="https://file.51core.net/2/2019/1/5722cfd46e4d48d897a0156d164c09c6.png" /></p>
<p>3.选择安装目录,这里我使用了默认的安装目录.</p>
<p><img src="https://file.51core.net/2/2019/1/e26a747bdf2543678e044c4e38a2d4a3.png" /></p>
<p>4.设置端口号,我们这里把端口设置为9521(PS:端口可以自定义设置的)</p>
<p><img src="https://file.51core.net/2/2019/1/86fe003b026d40b980311e92584921cc.png" /></p>
<p>5.这一步设置占用内存大小,可以不选,这里我们设置为100MB</p>
<p><img src="https://file.51core.net/2/2019/1/65b08df1d0ea4cad8f8300b1675d47d8.png" /></p>
<p>6.点击下一步知道安装完成</p>
<p>第三步：</p>
<p>配置访问密码:</p>
<p>找到安装目录C:\Program Files\Redis并且打开该目录,右键编辑redis.windows-service.conf文件</p>
<p>查找#repquirepass 字符串定位到如下图所在位置,图中看到的 requirepass 123456 就是我们设定的密码 123456</p>
<p><img src="https://file.51core.net/2/2019/1/2f251fa507ca4899a1cb55b08cc07bb7.png" width="934" height="564" /></p>
<p>第四步：</p>
<p>重启redis服务</p>
<p><img src="https://file.51core.net/2/2019/1/0bde69b5e7e5470e9aa10ab1024ae122.png" /></p>
<p>到这里我们就完成了Redis在Windows系统中的安装了.</p>', CAST(N'2019-01-09T18:38:40.880' AS DateTime), CAST(N'2019-01-09T18:38:40.880' AS DateTime), 2, 1, 293, 1, N'', N'', 0, 3)
INSERT [dbo].[m_CmsContents] ([ContentsId], [Title], [Contents], [PostTime], [LastTime], [AccountId], [PlusCount], [ReadCount], [StateCode], [Tags], [ImgUrl], [AnswerCount], [ChannelId]) VALUES (18, N'使用Asp.Net Core MVC 开发项目实践[第五篇:缓存的使用]', N'<p>项目中我们常常会碰到一些数据,需要高频率用到但是又不会频繁变动的这类,我们就可以使用缓存把这些数据缓存起来(比如说本项目的导航数据,帖子频道数据).</p>
<p>我们项目中常用到有Asp.Net Core 本身提供的缓存组件MemoryCache以及第三方缓存组件Redis(当然这个不仅仅只用来做缓存工具用).</p>
<p><strong>MemoryCache组件的使用:</strong></p>
<p>第一步：我们在Startup类中ConfigureServices方法中添加缓存组件</p>
<pre class="language-csharp"><code>services.AddMemoryCache();</code></pre>
<p>第二步：我们就可以在项目中使用该缓存组件了</p>
<pre class="language-csharp"><code>using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Caching.Memory;
using MVCDemo.Core.Cache;
namespace MVCDemo.Web.Controllers
{
    public class CacheController : Controller
    {
        IMemoryCache _cache = null;
        public CacheController(IMemoryCache memoryCache)
        {
            _cache = memoryCache;
        }
        public IActionResult Index()
        {
            //MemoryCache示例
            string memoryCache = _cache.Get&lt;string&gt;("memoryCacheTest");
            if (string.IsNullOrEmpty(memoryCache))
            {
                //添加并且设置缓存
                _cache.Set&lt;string&gt;("memoryCacheTest", "我是memoryCacheTest缓存");
                memoryCache = _cache.Get&lt;string&gt;("memoryCacheTest");
            }
            ViewData["memoryCache"] = memoryCache;
            return View();
        }
    }
}</code></pre>
<p>PS:在这里我们使用的构造函数注入的方式获取到了MemoryCache的实例对象</p>
<p><strong>Redis缓存组件的使用:</strong></p>
<p>PS:我们使用的是Windows系统上安装的Redis组件,安装教程请查看<a title="在Windows上安装Redis" href="read/3048" target="_blank" rel="noopener">https://www.51core.net/posts/read/3048</a></p>
<p>第一步：使用Nuget添加Microsoft.Extensions.Caching.Redis组件</p>
<p><img src="https://file.51core.net/2/2019/1/fb6003c821be4b11b438f7cbf62ff669.png" /></p>
<p>第二步:将Redis常用方法封装成一个服务</p>
<p>1.创建一个ICacheService的接口,方便缓存组件的扩展</p>
<pre class="language-csharp"><code>using System;
using System.Collections.Generic;
using System.Text;

namespace Mango.Framework.Services.Cache
{
    public interface ICacheService
    {
        /// &lt;summary&gt;
        /// 获取缓存
        /// &lt;/summary&gt;
        /// &lt;typeparam name="T"&gt;泛型(返回的结果类型)&lt;/typeparam&gt;
        /// &lt;param name="key"&gt;缓存key&lt;/param&gt;
        /// &lt;returns&gt;&lt;/returns&gt;
        T Get&lt;T&gt;(string key) where T : new();
        /// &lt;summary&gt;
        /// 获取缓存
        /// &lt;/summary&gt;
        /// &lt;param name="key"&gt;缓存key&lt;/param&gt;
        /// &lt;returns&gt;&lt;/returns&gt;
        string Get(string key);
        /// &lt;summary&gt;
        /// 添加缓存
        /// &lt;/summary&gt;
        /// &lt;param name="key"&gt;缓存key&lt;/param&gt;
        /// &lt;param name="value"&gt;缓存值&lt;/param&gt;
        /// &lt;param name="ExpirationTime"&gt;绝对过期时间(分钟)&lt;/param&gt;
        void Add(string key, object value, int expirationTime = 20);
        /// &lt;summary&gt;
        /// 移除缓存
        /// &lt;/summary&gt;
        /// &lt;param name="key"&gt;&lt;/param&gt;
        void Remove(string key);
        /// &lt;summary&gt;
        /// 更新缓存
        /// &lt;/summary&gt;
        /// &lt;param name="key"&gt;&lt;/param&gt;
        /// &lt;param name="value"&gt;&lt;/param&gt;
        /// &lt;param name="ExpirationTime"&gt;&lt;/param&gt;
        void Replace(string key, object value, int expirationTime = 20);
    }
}
</code></pre>
<p>2.创建一个RedisCacheService类继承自ICacheService接口并且实现接口中的方法</p>
<pre class="language-csharp"><code>using System;
using System.Text;
using Microsoft.Extensions.Caching.Redis;
using Microsoft.Extensions.Caching.Distributed;
using Newtonsoft.Json;
namespace Mango.Framework.Services.Cache
{
    public class RedisCacheService:ICacheService
    {
        private RedisCache _redisCache = null;
        public RedisCacheService(RedisCacheOptions options)
        {
            _redisCache = new RedisCache(options);
        }
        /// &lt;summary&gt;
        /// 获取缓存
        /// &lt;/summary&gt;
        /// &lt;typeparam name="T"&gt;泛型(返回的结果类型)&lt;/typeparam&gt;
        /// &lt;param name="key"&gt;缓存key&lt;/param&gt;
        /// &lt;returns&gt;&lt;/returns&gt;
        public T Get&lt;T&gt;(string key) where T:new()
        {
            try
            {
                if (!string.IsNullOrEmpty(key))
                {
                    return JsonConvert.DeserializeObject&lt;T&gt;(Encoding.UTF8.GetString(_redisCache.Get(key)));
                }
                return default(T);
            }
            catch
            {
                return default(T);
            }
        }
        /// &lt;summary&gt;
        /// 获取缓存
        /// &lt;/summary&gt;
        /// &lt;param name="key"&gt;缓存key&lt;/param&gt;
        /// &lt;returns&gt;&lt;/returns&gt;
        public string Get(string key)
        {
            try
            {
                if (!string.IsNullOrEmpty(key))
                {
                    return Encoding.UTF8.GetString(_redisCache.Get(key));
                }
                return string.Empty;
            }
            catch
            {
                return null;
            }
        }
        /// &lt;summary&gt;
        /// 添加缓存
        /// &lt;/summary&gt;
        /// &lt;param name="key"&gt;缓存key&lt;/param&gt;
        /// &lt;param name="value"&gt;缓存值&lt;/param&gt;
        /// &lt;param name="ExpirationTime"&gt;绝对过期时间(分钟)&lt;/param&gt;
        public void Add(string key,object value,int expirationTime=20)
        {
            if (!string.IsNullOrEmpty(key))
            {
                _redisCache.Set(key, Encoding.UTF8.GetBytes(JsonConvert.SerializeObject(value)), new DistributedCacheEntryOptions()
                {
                    AbsoluteExpiration = DateTimeOffset.Now.AddMinutes(expirationTime)
                });
            }
        }
        /// &lt;summary&gt;
        /// 移除缓存
        /// &lt;/summary&gt;
        /// &lt;param name="key"&gt;缓存key&lt;/param&gt;
        public void Remove(string key)
        {
            if (!string.IsNullOrEmpty(key))
            {
                _redisCache.Remove(key);
            }
        }
        /// &lt;summary&gt;
        /// 更新缓存
        /// &lt;/summary&gt;
        /// &lt;param name="key"&gt;缓存key&lt;/param&gt;
        /// &lt;param name="value"&gt;缓存值&lt;/param&gt;
        /// &lt;param name="ExpirationTime"&gt;&lt;/param&gt;
        public void Replace(string key, object value, int expirationTime = 20)
        {
            if (!string.IsNullOrEmpty(key))
            {
                _redisCache.Remove(key);
                _redisCache.Set(key, Encoding.UTF8.GetBytes(JsonConvert.SerializeObject(value)), new DistributedCacheEntryOptions()
                {
                    AbsoluteExpiration = DateTimeOffset.Now.AddMinutes(expirationTime)
                });
            }
        }
    }
}

</code></pre>
<p>&nbsp;PS：该类中的构造函数负责创建Redis缓存的实例并且把相关的参数(连接字符串)传入进行连接</p>
<p>第三步：在Startup类中ConfigureServices添加封装的服务组件</p>
<pre class="language-csharp"><code>//注册自定义服务
services.AddSingleton(typeof(ICacheService), new RedisCacheService(new RedisCacheOptions()
{
      Configuration = Configuration.GetSection("Cache:ConnectionString").Value,
      InstanceName = Configuration.GetSection("Cache:InstanceName").Value
}));
//注册到全局服务控制类中以供其它项目的使用
Framework.Services.ServiceContext.RegisterServices(services);</code></pre>
<p>第四步:在项目中调用,示例代码如下</p>
<pre class="language-csharp"><code>ICacheService cacheService = ServiceContext.GetService&lt;ICacheService&gt;();
string cacheData = cacheService.Get("WebSiteConfigCache");</code></pre>
<p>到此ASP.NET CORE MVC项目中缓存的使用介绍已经完成.</p>
<p>&nbsp;</p>', CAST(N'2019-01-10T11:02:00.633' AS DateTime), CAST(N'2019-01-10T11:02:00.633' AS DateTime), 2, 1, 358, 1, N'', N'', 0, 4)
INSERT [dbo].[m_CmsContents] ([ContentsId], [Title], [Contents], [PostTime], [LastTime], [AccountId], [PlusCount], [ReadCount], [StateCode], [Tags], [ImgUrl], [AnswerCount], [ChannelId]) VALUES (19, N'使用Asp.Net Core MVC 开发项目实践[第六篇:TinyMCE富文本编辑器]', N'<p>本篇将介绍TinyMCE富文本编辑器的使用,本篇文章使用的版本是4.9.2版本</p>
<p>第一步:下载</p>
<p>官网下载地址:</p>
<p><a title="下载地址" href="https://www.tiny.cloud/get-tiny/self-hosted/" target="_blank" rel="noopener">https://www.tiny.cloud/get-tiny/self-hosted/</a></p>
<p><a title="语言包下载地址" href="https://www.tiny.cloud/get-tiny/language-packages/">https://www.tiny.cloud/get-tiny/language-packages/</a></p>
<p>把下载下来的文件拷贝到项目wwwroot/lib目录下</p>
<p><img src="https://file.51core.net/2/2019/1/5bb65fb83cb74a2abc0921b9299f38db.png" /></p>
<p><img src="https://file.51core.net/2/2019/1/755ce7623eef42c3a76f64c25898acc5.png" /></p>
<p>第二步:在页面中引入JS文件</p>
<pre class="language-javascript"><code>&lt;!--核心包文件--&gt;
&lt;script src="~/lib/tinymce/tinymce.min.js"&gt;&lt;/script&gt;
&lt;!--主题包文件--&gt;
&lt;script src="~/lib/tinymce/themes/modern/theme.min.js"&gt;&lt;/script&gt;
&lt;!--语言包文件--&gt;
&lt;script src="~/lib/tinymce/langs/zh_CN.js"&gt;&lt;/script&gt;
&lt;!--如果不是核心插件的话需要引入相关的插件包--&gt;
&lt;!--代码插件--&gt;
&lt;script src="~/lib/tinymce/plugins/codesample/plugin.min.js"&gt;&lt;/script&gt;
&lt;!--链接插件--&gt;
&lt;script src="~/lib/tinymce/plugins/link/plugin.min.js"&gt;&lt;/script&gt;
&lt;!--图片插件--&gt;
&lt;script src="~/lib/tinymce/plugins/image/plugin.min.js"&gt;&lt;/script&gt;
&lt;!--自定义图片上传插件--&gt;
&lt;script src="~/lib/tinymce/plugins/imageupload/upyun.plugin.min.js"&gt;&lt;/script&gt;</code></pre>
<p>第三步：配置编辑器</p>
<pre class="language-javascript"><code>&lt;script&gt;
        tinymce.init({
            selector: ''#Contents'',//指定的文本域控件ID
            language: "zh_CN",//指定语言包
            themes: "modern",//指定主题
            menubar: false,//是否显示菜单栏
            //设置工具栏
            toolbar: [
                ''removeformat | bold italic underline strikethrough | codesample link imageupload | alignleft aligncenter alignright'',
            ],
            //需要引入的插件
            plugins: [
                ''codesample'', ''link'', ''image'', ''imageupload''
            ],
            upload_image_url: ''这里配置图片上传地址'',
            file_server_url: ''这里配置图片服务器域名地址''
        });
&lt;/script&gt;</code></pre>
<p><strong>PS:在配置plugins参数时配置需要加载的插件的同时需要引入相关的插件JS包,要不然在toolbar参数中配置了也不会加载出来</strong></p>
<p>到这一步已经完成了TinyMCE富文本编辑器配置</p>
<pre class="language-javascript"><code>//获取编辑器的内容,更多API请查看官方文档
tinymce.get(''Contents'').getContent()</code></pre>
<p>更多配置项请查看官方文档:<a title="官方文档" href="https://www.tiny.cloud/docs/" target="_blank" rel="noopener">https://www.tiny.cloud/docs/</a></p>
<p><strong>自定义图片上传插件:</strong></p>
<p>第一步:在tinymce/plugins目录下创建一个imageupload目录,</p>
<p>第二步:创建一个plugin.js文件，代码如下</p>
<pre class="language-javascript"><code>/*
 图片上传组件
插件名称:imageupload 
 */
tinymce.PluginManager.add(''imageupload'', function (editor) {

    function selectLocalImages() {
        var dom = editor.dom;
        var input_f = $(''&lt;input type="file" name="file" accept="image/jpg,image/jpeg,image/png,image/gif"&gt;'');
        input_f.on(''change'', function () {
            var form = $("&lt;form/&gt;",
                {
                    action: editor.settings.upload_image_url, //设置上传图片的路由，配置在初始化时
                    style: ''display:none'',
                    method: ''post'',
                    enctype: ''multipart/form-data''
                }
            );
            form.append(input_f);
            //ajax提交表单
            form.ajaxSubmit({
                beforeSubmit: function () {
                    return true;
                },
                success: function (data) {
                    editor.selection.setContent(dom.createHTML(''img'', { src: data }));
                }
            });
        });

        input_f.click();
    }
    //添加执行命令
    editor.addCommand("mceUploadImageEditor", selectLocalImages);
    //添加工具栏图标以及事件绑定
    editor.addButton(''imageupload'', {
        icon: ''image'',
        tooltip: ''图片上传'',
        onclick: selectLocalImages
    });
    //添加菜单栏图标以及事件绑定
    editor.addMenuItem(''imageupload'', {
        icon: ''image'',
        text: ''图片上传'',
        context: ''tools'',
        onclick: selectLocalImages
    });
});</code></pre>
<p>PS：调用已经在上面的使用教程里有示例代码就不再累述了.</p>
<p>&nbsp;</p>', CAST(N'2019-01-10T18:36:19.700' AS DateTime), CAST(N'2019-01-10T18:36:19.700' AS DateTime), 2, 0, 650, 1, N'', N'', 0, 4)
INSERT [dbo].[m_CmsContents] ([ContentsId], [Title], [Contents], [PostTime], [LastTime], [AccountId], [PlusCount], [ReadCount], [StateCode], [Tags], [ImgUrl], [AnswerCount], [ChannelId]) VALUES (20, N'使用Asp.Net Core MVC 开发项目实践[第七篇:使用SignalR完成站内消息推送]', N'<p>这篇文章我们主要介绍如何使用SignalR通信组件完成站内消息实时推送功能.</p>
<p>第一步:在项目中引入相关的组件</p>
<p>1.使用nuget下载Microsoft.AspNetCore.SignalR组件,如下图</p>
<p><img src="https://file.51core.net/2/2019/2/bf760a898024420e957d4fdcabd64e0e.png" /></p>
<p>2.添加 SignalR 客户端库(这个微软官方有示例):</p>
<p><a title="添加 SignalR 客户端库" href="https://docs.microsoft.com/zh-cn/aspnet/core/tutorials/signalr?view=aspnetcore-2.1&amp;tabs=visual-studio#add-the-signalr-client-library" target="_blank" rel="noopener">https://docs.microsoft.com/zh-cn/aspnet/core/tutorials/signalr?view=aspnetcore-2.1&amp;tabs=visual-studio#add-the-signalr-client-library</a></p>
<p>第二步:后端代码的编写</p>
<p>1.创建一个用户信息类,用来存储用户连接信息</p>
<pre class="language-csharp"><code>using System;
using System.Collections.Generic;
using System.Linq;
namespace Mango.Web.Extensions
{
    public class SignalRUser
    {
        /// &lt;summary&gt;
        /// 用户ID
        /// &lt;/summary&gt;
        public string UserId { get; set; }
        /// &lt;summary&gt;
        /// SignalR连接ID
        /// &lt;/summary&gt;
        public string ConnectionId { get; set; }
    }
}
</code></pre>
<p>2.创建一个MessageHub类继承自Hub父类</p>
<pre class="language-csharp"><code>using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.SignalR;
using Microsoft.AspNetCore.Http;
using Mango.Framework.Services;
namespace Mango.Web.Extensions
{
    public class MessageHub:Hub
    {
        public MessageHub()
        {
           
        }

        public async Task SendMessage(string user, string message)
        {
            await Clients.All.SendAsync("ReceiveMessage", user, message);
        }
        /// &lt;summary&gt;
        /// 用户连接方法重写
        /// &lt;/summary&gt;
        /// &lt;returns&gt;&lt;/returns&gt;
        public override Task OnConnectedAsync()
        {
            IHttpContextAccessor httpContextAccessor = ServiceContext.GetService&lt;IHttpContextAccessor&gt;();
            string userId = string.Empty;
            if (httpContextAccessor.HttpContext.Session.GetString("UserId")!=null)
            {
                userId = httpContextAccessor.HttpContext.Session.GetString("UserId");
                
            }
            SignalRCore.AddUser(new SignalRUser()
            {
                UserId = userId,
                ConnectionId = Context.ConnectionId
            });
            //表示当前用户已经登录
            if (userId != string.Empty)
            {
                //推送指定消息记录
                SignalRCore.PushCurrentUserMessage(userId, this);
            }
            return base.OnConnectedAsync();
        }
        /// &lt;summary&gt;
        /// 用户断开连接方法重写
        /// &lt;/summary&gt;
        /// &lt;param name="exception"&gt;&lt;/param&gt;
        /// &lt;returns&gt;&lt;/returns&gt;
        public override Task OnDisconnectedAsync(Exception exception)
        {
            SignalRCore.RemoveUser(Context.ConnectionId);
            return base.OnDisconnectedAsync(exception);
        }
    }
}
</code></pre>
<p>PS:MessageHub中我们需要重写父类Hub中默认的监控用户连接的方法以及断开用户连接的方法,因为此处需要将连接的用户信息与当前登录的用户信息关联起来</p>
<p>3.创建一个消息推送处理类</p>
<pre class="language-csharp"><code>using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.SignalR;
namespace Mango.Web.Extensions
{
    public class SignalRCore
    {
        //public static SignalRGlobalHub&lt;MessageHub&gt; GlobalHub { get; set; }
        /// &lt;summary&gt;
        /// 存储在线用户信息
        /// &lt;/summary&gt;
        private static Lazy&lt;List&lt;SignalRUser&gt;&gt; _signalrUser = new Lazy&lt;List&lt;SignalRUser&gt;&gt;();
        /// &lt;summary&gt;
        /// 获取在线用户列表
        /// &lt;/summary&gt;
        public static List&lt;SignalRUser&gt; SignalRUsers
        {
            get { return _signalrUser.Value; }
        }
        /// &lt;summary&gt;
        /// 添加用户信息
        /// &lt;/summary&gt;
        /// &lt;param name="userId"&gt;&lt;/param&gt;
        /// &lt;param name="connectionId"&gt;&lt;/param&gt;
        public static void AddUser(SignalRUser signalRUser)
        {
            var queryResult = _signalrUser.Value.Where(x =&gt; x.ConnectionId == signalRUser.ConnectionId).FirstOrDefault();
            if (queryResult == null)
            {
                _signalrUser.Value.Add(signalRUser);
            }
        }
        /// &lt;summary&gt;
        /// 移除在线用户
        /// &lt;/summary&gt;
        /// &lt;param name="userId"&gt;&lt;/param&gt;
        public static void RemoveUser(string connectionId)
        {
            var queryResult = _signalrUser.Value.Where(x =&gt; x.ConnectionId == connectionId).FirstOrDefault();
            if (queryResult != null)
            {
                _signalrUser.Value.Remove(queryResult);
            }
        }
        /// &lt;summary&gt;
        /// 发送给新访问用户
        /// &lt;/summary&gt;
        /// &lt;param name="userId"&gt;&lt;/param&gt;
        /// &lt;param name="hub"&gt;&lt;/param&gt;
        public static void PushCurrentUserMessage(string userId, MessageHub hub)
        {
            //获取需要发送的数据
            Repository.MessageRepository repository = new Repository.MessageRepository();
            int count = repository.GetUserMessageByCount(int.Parse(userId));
            //
            var userList = SignalRUsers.Where(x =&gt; x.UserId == userId).ToList();
            foreach (SignalRUser user in userList)
            {
                hub.Clients.Client(user.ConnectionId).SendAsync("ReceiveMessage", count);
            }
        }
        /// &lt;summary&gt;
        /// 发送给指定用户
        /// &lt;/summary&gt;
        /// &lt;param name="userId"&gt;&lt;/param&gt;
        /// &lt;param name="context"&gt;&lt;/param&gt;
        public static void PushUserMessage(string userId, IHubContext&lt;MessageHub&gt; context)
        {
            Repository.MessageRepository repository = new Repository.MessageRepository();
            int count = repository.GetUserMessageByCount(int.Parse(userId));
            //
            var userList = SignalRUsers.Where(x =&gt; x.UserId == userId).ToList();
            foreach (SignalRUser user in userList)
            {
                context.Clients.Client(user.ConnectionId).SendAsync("ReceiveMessage", count);
            }
        }
    }
}
</code></pre>
<p>4.后端调用</p>
<p>PS:如果我们需要在控制器使用当前SignalR上下文,使用构造函数注入的方式得到SignalR上下文</p>
<pre class="language-csharp"><code>using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Http;
using Mango.Repository;
using Microsoft.AspNetCore.SignalR;
namespace Mango.Web.Controllers
{
    public class MessageController : Controller
    {
        private readonly IHubContext&lt;Extensions.MessageHub&gt; _messageHubContext;
        public MessageController(IHubContext&lt;Extensions.MessageHub&gt; messageHubContext)
        {
            _messageHubContext = messageHubContext;
        }
        /// &lt;summary&gt;
        /// 获取当前用户未读消息列表
        /// &lt;/summary&gt;
        /// &lt;returns&gt;&lt;/returns&gt;
        [HttpGet]
        public IActionResult GetMessageList()
        {
            if (HttpContext.Session.GetString("UserId") != null)
            {
                int userId = Framework.Core.Transform.GetInt(HttpContext.Session.GetString("UserId"),0);
                MessageRepository repository = new MessageRepository();
                var query= repository.GetMessageList();
                var queryResult = query.Where(m =&gt; m.UserId == userId &amp;&amp; m.IsRead == false).ToList();
                return Json(queryResult);
            }
            return Json(new { });
        }

        [HttpPost]
        public bool UpdateReadState()
        {
            if (HttpContext.Session.GetString("UserId") != null)
            {
                int userId = Framework.Core.Transform.GetInt(HttpContext.Session.GetString("UserId"), 0);
                MessageRepository repository = new MessageRepository();
                bool result= repository.UpdateMessageReadState(userId);
                if (result)
                {
                    //消息推送
                    Extensions.SignalRCore.PushUserMessage(userId.ToString(), _messageHubContext);
                }
                return result;
            }
            return false;
        }
    }
}</code></pre>
<p>第三步:前端代码的编写</p>
<p>1.创建一个message.js的脚本文件,并且写入如下代码</p>
<pre class="language-javascript"><code>/// &lt;reference path="../lib/signalr/dist/browser/signalr.min.js" /&gt;
//处理Signalr连接
var connection = new signalR.HubConnectionBuilder().withUrl("/MessageHub").build();
//绑定消息接收方法
connection.on("ReceiveMessage", function (message) {
    console.log(message);
    $("#msg_push_count").text(message);
});
//开始连接
connection.start().catch(function (err) {
    return console.error(err.toString());
});
</code></pre>
<p>2.在_Layout.cshtml文件中引入该脚本文件,并且进行推送消息的业务展示处理</p>
<pre class="language-javascript"><code> @if (Html.ViewContext.HttpContext.Session.GetString("UserId") != null)
    {
        &lt;script src="~/lib/signalr/dist/browser/signalr.min.js"&gt;&lt;/script&gt;
        &lt;script src="~/js/message.js"&gt;&lt;/script&gt;
        &lt;script type="text/javascript"&gt;
            $("#msg_push_showlist").click(function () {
                
                //加载数据
                $.ajax({
                    type: ''get'',
                    url: ''/message/GetMessageList'',
                    success: function (res) {
                        var html='''';
                        html += ''&lt;div class="list"  style="overflow-y:auto;" id="msg_push_list_data"&gt;'';
                        html += ''&lt;div class="items items-hover"&gt;'';
                        
                        $.each(res, function (i, item) {
                            console.log(item);
                            //html += ''&lt;li class="list-group-item"&gt;'' + item.contents + ''&lt;/li&gt;'';
                            html += ''&lt;div class="item"&gt;&lt;div class="item-heading"&gt;&lt;h4&gt;'' + item.contents + ''&lt;/h4&gt;&lt;/div&gt;&lt;/div&gt;'';
                        });
                        html += ''&lt;/div&gt;''
                        html += ''&lt;/div&gt;'';
                        var d = dialog({
                            title: ''新消息通知'',
                            content: html,
                            height: 300,
                            width: 500,
                            id:''msg_push_list_dialog''
                        });
                        d.show(document.getElementById("msg_push_showlist"));
                        $("#msg_push_list_data").parent().attr("style", $("#msg_push_list_data").parent().attr("style") + "overflow-y:scroll;");
                        $("#msg_push_count").text("0");
                        //更改未读消息状态
                        $.ajax({
                            type: ''post'',
                            url: ''/message/UpdateReadState'',
                            success: function (res) {
                                console.log(res);
                            }
                        });
                    }
                });
            });
        &lt;/script&gt;
    }</code></pre>
<p>第四步:查看运行效果</p>
<p><img src="https://file.51core.net/2/2019/2/cba2aa17f63046fe99043d18577cdd85.png" /></p>
<p>PS：到此使用SigalR完成消息推送的使用介绍完成,更详细的代码下载本站源代码进行查看.</p>', CAST(N'2019-02-18T15:38:58.357' AS DateTime), CAST(N'2019-02-18T15:38:58.357' AS DateTime), 2, 0, 600, 1, N'', N'', 0, 4)
INSERT [dbo].[m_CmsContents] ([ContentsId], [Title], [Contents], [PostTime], [LastTime], [AccountId], [PlusCount], [ReadCount], [StateCode], [Tags], [ImgUrl], [AnswerCount], [ChannelId]) VALUES (21, N'使用Asp.Net Core MVC 开发项目实践[第八篇:使用过滤器Filter实现权限控制]', N'<p>项目的权限设计也是一个系统中是非常重要的一环,在这个项目开发实践中我们将讲述如何使用全局过滤器实现前端访问的权限控制.</p>
<p>本案例采用的是比较常规的设计方案：</p>
<p><strong>用户--&gt;用户组--&gt;权限 <br /></strong></p>
<p>具体的表如下图(PS:具体的字段在这里我就不张贴了,可以去本项目开源地址下载):</p>
<p><img src="https://file.51core.net/2/2019/2/18e3271f99854001a1b80ce969756bd6.png" /></p>
<p>接下来我们讲解如何实现:</p>
<p>第一步：根据用户组ID获取权限数据，因为数据不经常变动我们把这些数据缓存到Redis中,以便提高第一次加载后的访问速度</p>
<pre class="language-csharp"><code>using System;
using System.Collections.Generic;
using System.Text;
using Mango.Repository;
using Mango.Framework.Services;
using Mango.Framework.Services.Cache;
using Newtonsoft.Json;
namespace Mango.Common
{
    public class Authorization
    {

        /// &lt;summary&gt;
        /// 用户组授权验证
        /// &lt;/summary&gt;
        /// &lt;param name="groupID"&gt;用户组ID&lt;/param&gt;
        /// &lt;param name="areaName"&gt;区域名称&lt;/param&gt;
        /// &lt;param name="controllerName"&gt;控制器名称&lt;/param&gt;
        /// &lt;param name="actionName"&gt;Action名称&lt;/param&gt;
        /// &lt;returns&gt;&lt;/returns&gt;
        public static bool GroupPowerAuthorization(int groupID,string areaName,string controllerName,string actionName)
        {
            bool Result = false;
            //加载权限数据
            List&lt;Models.UserGroupPowerModel&gt; list = GetPowerData(groupID);
            if (list != null)
            {
                //开始权限验证
                foreach (Models.UserGroupPowerModel m in list)
                {
                    if (m.GroupId == groupID &amp;&amp; m.AreaName == areaName &amp;&amp; m.ControllerName == controllerName &amp;&amp; m.ActionName == actionName)
                    {
                        //当匹配到权限时返回正确结果并且跳出循环
                        Result = true;
                        break;
                    }
                }
            }
            return Result;
        }
        /// &lt;summary&gt;
        /// 根据用户组获取权限
        /// &lt;/summary&gt;
        /// &lt;param name="groupID"&gt;&lt;/param&gt;
        /// &lt;returns&gt;&lt;/returns&gt;
        private static List&lt;Models.UserGroupPowerModel&gt; GetPowerData(int groupID)
        {
            List&lt;Models.UserGroupPowerModel&gt; Result = null;
            ICacheService CacheService = ServiceContext.GetService&lt;ICacheService&gt;();
            string PowerCache = CacheService.Get(string.Format("UserGroupPowerCache{0}", groupID));
            if (string.IsNullOrEmpty(PowerCache))
            {
                AuthorizationRepository repository = new AuthorizationRepository();
                Result = repository.GetPowerData(groupID);
                PowerCache = Convert.ToBase64String(Encoding.UTF8.GetBytes(JsonConvert.SerializeObject(Result)));
                //写入缓存
                CacheService.Add(string.Format("UserGroupPowerCache{0}", groupID), PowerCache);
            }
            else
            {
                PowerCache = Encoding.UTF8.GetString(Convert.FromBase64String(PowerCache.Replace("\"", "")));
                //从缓存中获取
                Result = JsonConvert.DeserializeObject&lt;List&lt;Models.UserGroupPowerModel&gt;&gt;(PowerCache);
            }
            return Result;
        }
    }
}
</code></pre>
<p>第二步:创建一个名为AuthorizationActionFilter的全局过滤器并且继承IActionFilter接口</p>
<pre class="language-csharp"><code>public class AuthorizationActionFilter :  IActionFilter</code></pre>
<p>第三步：我们创建一个白名单集合,以方便过滤一些不需要权限控制的访问</p>
<pre class="language-csharp"><code>using System;
using System.Collections.Generic;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc.Filters;
namespace Mango.Web.Extensions
{
    public class AuthorizationActionFilter :  IActionFilter
    {
        /// &lt;summary&gt;
        /// 过滤对象列表
        /// &lt;/summary&gt;
        private static List&lt;string[]&gt; _filterList { get; set; }
        public AuthorizationActionFilter()
        {
            if (_filterList == null)
            {
                _filterList = new List&lt;string[]&gt;();
                _filterList.Add(new string[] { "","authorization", "validatecode" });
                _filterList.Add(new string[] { "", "authorization", "sendphonevalidatecode" });
                _filterList.Add(new string[] { "", "navigation", "updateclickcount" });
                _filterList.Add(new string[] { "", "home", "message" });
                _filterList.Add(new string[] { "", "home", "error" });
                _filterList.Add(new string[] { "", "home", "test" });
            }
        }
        public void OnActionExecuting(ActionExecutingContext context)
        {
            
        }

        public void OnActionExecuted(ActionExecutedContext context)
        {
            // do something after the action executes
        }
        /// &lt;summary&gt;
        /// 过滤白名单
        /// &lt;/summary&gt;
        /// &lt;param name="controllerName"&gt;&lt;/param&gt;
        /// &lt;param name="actionName"&gt;&lt;/param&gt;
        /// &lt;returns&gt;&lt;/returns&gt;
        private bool QueryFilterName(string areaName,string controllerName, string actionName)
        {
            bool result = false;
            if (_filterList != null)
            {
                foreach (string[] str in _filterList)
                {
                    if (str[0] == areaName &amp;&amp; str[1] == controllerName &amp;&amp; str[2] == actionName)
                    {
                        result = true;
                        break;
                    }
                }
            }
            return result;
        }
    }
}
</code></pre>
<p>第四步：权限过滤</p>
<pre class="language-csharp"><code>using System;
using System.Collections.Generic;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc.Filters;
namespace Mango.Web.Extensions
{
    public class AuthorizationActionFilter :  IActionFilter
    {
        /// &lt;summary&gt;
        /// 过滤对象列表
        /// &lt;/summary&gt;
        private static List&lt;string[]&gt; _filterList { get; set; }
        public AuthorizationActionFilter()
        {
            if (_filterList == null)
            {
                _filterList = new List&lt;string[]&gt;();
                _filterList.Add(new string[] { "","authorization", "validatecode" });
                _filterList.Add(new string[] { "", "authorization", "sendphonevalidatecode" });
                _filterList.Add(new string[] { "", "navigation", "updateclickcount" });
                _filterList.Add(new string[] { "", "home", "message" });
                _filterList.Add(new string[] { "", "home", "error" });
                _filterList.Add(new string[] { "", "home", "test" });
            }
        }
        public void OnActionExecuting(ActionExecutingContext context)
        {
            //Action请求执行前处理事件
            //获取权限验证所需数据
            int groupId = 0;
            if (context.HttpContext.Session.GetString("GroupId") != null)
            {
                groupId = Framework.Core.Transform.GetInt(context.HttpContext.Session.GetString("GroupId"), 0);
            }
            string areaName = context.HttpContext.Request.Path.Value.Contains("user") ? "user" : "";
            string controllerName = context.RouteData.Values["controller"].ToString().ToLower();
            string actionName = context.RouteData.Values["action"].ToString().ToLower();
            //白名单筛选验证
            bool FilterResult= QueryFilterName(areaName, controllerName, actionName);
            if (!FilterResult)
            {
                //如果不在白名单则进行权限验证
                bool Result = Common.Authorization.GroupPowerAuthorization(groupId, areaName, controllerName, actionName);
                if (Result == false)
                {
                    bool ajaxRequest = false;
                    var xreq = context.HttpContext.Request.Headers.ContainsKey("x-requested-with");
                    if (xreq)
                    {
                        ajaxRequest = context.HttpContext.Request.Headers["x-requested-with"] == "XMLHttpRequest";
                    }
                    if (!ajaxRequest)
                    {
                        string fromUrl = context.HttpContext.Request.GetAbsoluteUri();
                        fromUrl = fromUrl.Contains("register") ? "/posts" : fromUrl;
                        context.Result = new RedirectResult(string.Format("/home/message?fromurl={0}", fromUrl));
                    }
                    else
                    {
                        context.Result = new ContentResult()
                        {
                            Content = "您的请求未得到授权!",
                            StatusCode = 401
                        };
                    }
                }
            }
        }

        public void OnActionExecuted(ActionExecutedContext context)
        {
            // do something after the action executes
        }
        /// &lt;summary&gt;
        /// 过滤白名单
        /// &lt;/summary&gt;
        /// &lt;param name="controllerName"&gt;&lt;/param&gt;
        /// &lt;param name="actionName"&gt;&lt;/param&gt;
        /// &lt;returns&gt;&lt;/returns&gt;
        private bool QueryFilterName(string areaName,string controllerName, string actionName)
        {
            bool result = false;
            if (_filterList != null)
            {
                foreach (string[] str in _filterList)
                {
                    if (str[0] == areaName &amp;&amp; str[1] == controllerName &amp;&amp; str[2] == actionName)
                    {
                        result = true;
                        break;
                    }
                }
            }
            return result;
        }
    }
}
</code></pre>
<p>PS:我们的权限过滤处理放在OnActionExecuting方法中去,这个方法会在Action执行之前执行</p>
<p>第五步:如果需要这个过滤器起到作用还需要在Startup.cs中的ConfigureServices方法中进行配置使用</p>
<pre class="language-csharp"><code>using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using System.Text.Encodings.Web;
using System.Text.Unicode;
using Mango.Framework.Services.Cache;
using Microsoft.Extensions.Caching.Redis;
using Microsoft.AspNetCore.SignalR;
namespace Mango.Web
{
    public class Startup
    {
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public IConfiguration Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {

            //添加SignalR
            services.AddSignalR();

            services.AddMvc(options =&gt; {
                options.Filters.Add(new Extensions.AuthorizationActionFilter());
            })
            .SetCompatibilityVersion(CompatibilityVersion.Version_2_2);
        }

    }
}
 </code></pre>
<p>到这一步我们的全局过滤器就能起到访问过滤的效果了,我们看下运行效果</p>
<p><img src="https://file.51core.net/2/2019/2/2fcc1221c0e24e069563fab2dfce959c.png" width="908" height="314" /></p>
<p>PS:到此使用过滤器实现访问权限控制已经完成</p>', CAST(N'2019-02-27T17:46:21.570' AS DateTime), CAST(N'2019-02-27T17:46:21.570' AS DateTime), 2, 0, 468, 1, N'', N'', 0, 4)
INSERT [dbo].[m_CmsContents] ([ContentsId], [Title], [Contents], [PostTime], [LastTime], [AccountId], [PlusCount], [ReadCount], [StateCode], [Tags], [ImgUrl], [AnswerCount], [ChannelId]) VALUES (22, N'.Net Core中基于完成端口(IOCP)封装好的SocketAsyncEventArgs实现高性能的的Socket服务器端', N'<p>这个文章我们将以一个DEMO案例实现基于SocketAsyncEventArgs的Socket服务器端.</p>
<p><strong>服务器端:</strong></p>
<p>第一步：创建所需基础类</p>
<p>1.BufferManager类,这个类负责byte[]数据的处理</p>
<pre class="language-csharp"><code>using System;
using System.Collections.Generic;
using System.Net.Sockets;
using System.Text;
namespace Mango.Network.Core.MSocket
{
    /// &lt;summary&gt;
    /// 动态缓存管理
    /// &lt;/summary&gt;
    public class BufferManager
    {
        /// &lt;summary&gt;
        /// 存放内存的数组
        /// &lt;/summary&gt;
        public byte[] Buffer { get; set; }

        /// &lt;summary&gt;
        /// 写入数据大小
        /// &lt;/summary&gt;
        public int DataCount { get; set; }

        /// &lt;summary&gt;
        /// 构造函数
        /// &lt;/summary&gt;
        /// &lt;param name="bufferSize"&gt;&lt;/param&gt;
        public BufferManager(int bufferSize)
        {
            DataCount = 0;
            Buffer = new byte[bufferSize];
        }

        /// &lt;summary&gt;
        /// 获得当前写入的字节数
        /// &lt;/summary&gt;
        /// &lt;returns&gt;&lt;/returns&gt;
        public int GetDataCount()
        {
            return DataCount;
        }
        /// &lt;summary&gt;
        /// 获得剩余的字节数
        /// &lt;/summary&gt;
        /// &lt;returns&gt;&lt;/returns&gt;
        public int GetReserveCount()
        {
            return Buffer.Length - DataCount;
        }

        public void Clear()
        {
            DataCount = 0;
            Array.Clear(Buffer, 0, Buffer.Length);
        }
        /// &lt;summary&gt;
        /// 清理指定大小的数据
        /// &lt;/summary&gt;
        /// &lt;param name="count"&gt;&lt;/param&gt;
        public void Clear(int count)
        {
            if (count &gt;= DataCount)//如果需要清理的数据大于现有数据大小，则全部清理
            {
                DataCount = 0;
            }
            else
            {
                for (int i = 0; i &lt; DataCount - count; i++)//否则后面的数据往前移
                {
                    Buffer[i] = Buffer[count + i];
                }
                DataCount = DataCount - count;
            }
        }

        /// &lt;summary&gt;
        /// 设置缓存大小
        /// &lt;/summary&gt;
        /// &lt;param name="size"&gt;&lt;/param&gt;
        public void SetBufferSize(int size)
        {
            if (Buffer.Length &lt; size)
            {
                byte[] tmpBuffer = new byte[size];
                Array.Copy(Buffer, 0, tmpBuffer, 0, DataCount); //复制以前的数据
                Buffer = tmpBuffer; //替换
            }
        }
        /// &lt;summary&gt;
        /// 写入数据
        /// &lt;/summary&gt;
        /// &lt;param name="buffer"&gt;&lt;/param&gt;
        /// &lt;param name="offset"&gt;&lt;/param&gt;
        /// &lt;param name="count"&gt;&lt;/param&gt;
        public void WriteBuffer(byte[] buffer, int offset, int count)
        {
            if (GetReserveCount() &gt;= count) //缓冲区空间够，不需要申请
            {
                Array.Copy(buffer, offset, Buffer, DataCount, count);
                DataCount = DataCount + count;
            }
            else //缓冲区空间不够，需要申请更大的内存，并进行移位
            {
                int totalSize = Buffer.Length + count - GetReserveCount(); //总大小-空余大小
                byte[] tmpBuffer = new byte[totalSize];
                Array.Copy(Buffer, 0, tmpBuffer, 0, DataCount); //复制以前的数据
                Array.Copy(buffer, offset, tmpBuffer, DataCount, count); //复制新写入的数据
                DataCount = DataCount + count;
                Buffer = tmpBuffer; //替换
            }
        }
        /// &lt;summary&gt;
        /// 写入数据
        /// &lt;/summary&gt;
        /// &lt;param name="buffer"&gt;&lt;/param&gt;
        public void WriteBuffer(byte[] buffer)
        {
            WriteBuffer(buffer, 0, buffer.Length);
        }

        public void WriteShort(short value, bool convert)
        {
            if (convert)
            {
                value = System.Net.IPAddress.HostToNetworkOrder(value); //NET是小头结构，网络字节是大头结构，需要客户端和服务器约定好
            }
            byte[] tmpBuffer = BitConverter.GetBytes(value);
            WriteBuffer(tmpBuffer);
        }

        public void WriteInt(int value, bool convert)
        {
            if (convert)
            {
                value = System.Net.IPAddress.HostToNetworkOrder(value); //NET是小头结构，网络字节是大头结构，需要客户端和服务器约定好
            }
            byte[] tmpBuffer = BitConverter.GetBytes(value);
            WriteBuffer(tmpBuffer);
        }

        public void WriteLong(long value, bool convert)
        {
            if (convert)
            {
                value = System.Net.IPAddress.HostToNetworkOrder(value); //NET是小头结构，网络字节是大头结构，需要客户端和服务器约定好
            }
            byte[] tmpBuffer = BitConverter.GetBytes(value);
            WriteBuffer(tmpBuffer);
        }

        public void WriteString(string value) //文本全部转成UTF8，UTF8兼容性好
        {
            byte[] tmpBuffer = Encoding.UTF8.GetBytes(value);
            WriteBuffer(tmpBuffer);
        }
    }
}
</code></pre>
<p>2.创建AsyncUserToken类,该类负责存储客户端连接资源以及数据存储,每个客户端连接都对应实例化的该类</p>
<pre class="language-csharp"><code>using System;
using System.Collections.Generic;
using System.Net.Sockets;

namespace Mango.Network.Core.MSocket
{
    public class AsyncUserToken
    {
        /// &lt;summary&gt;
        /// 用来接收数据的SocketAsyncEventArgs
        /// &lt;/summary&gt;
        public SocketAsyncEventArgs ReceiveEventArgs { get; set; }
        /// &lt;summary&gt;
        /// 用来发送数据的SocketAsyncEventArgs
        /// &lt;/summary&gt;
        public SocketAsyncEventArgs SendEventArgs { get; set; }
        /// &lt;summary&gt;
        /// 接收数据的缓冲区
        /// &lt;/summary&gt;
        public byte[] AsyncReceiveBuffer { get; set; }

        /// &lt;summary&gt;
        /// 发送数据的缓冲区
        /// &lt;/summary&gt;
        public byte[] AsyncSendBuffer { get; set; }
        /// &lt;summary&gt;
        /// 动态的接收缓冲区
        /// &lt;/summary&gt;
        public BufferManager ReceiveBuffer { get; set; }

        /// &lt;summary&gt;
        /// 动态的发送缓冲区
        /// &lt;/summary&gt;
        public BufferManager SendBuffer { get; set; }
        /// &lt;summary&gt;
        /// 连接的Socket对象
        /// &lt;/summary&gt;
        public Socket ConnectSocket { get; set; }
        /// &lt;summary&gt;
        /// 构造函数(初始化需要的对象)
        /// &lt;/summary&gt;
        public AsyncUserToken(int MacBufferSize)
        {
            //数据接收对象
            ReceiveEventArgs = new SocketAsyncEventArgs();
            ReceiveEventArgs.UserToken = this;
            AsyncReceiveBuffer = new byte[MacBufferSize];
            ReceiveEventArgs.SetBuffer(AsyncReceiveBuffer,0, AsyncReceiveBuffer.Length);
            ReceiveBuffer = new BufferManager(1024);
            //数据发送对象
            SendEventArgs = new SocketAsyncEventArgs();
            SendEventArgs.UserToken = this;
            AsyncSendBuffer = new byte[MacBufferSize];
            SendEventArgs.SetBuffer(AsyncSendBuffer,0, AsyncSendBuffer.Length);
            SendBuffer = new BufferManager(1024);
        }
    }
}
</code></pre>
<p>3.创建一个连接池管理类SocketAsyncEventArgsPool，该类负责对AsyncUserToken的对象的存储管理</p>
<pre class="language-csharp"><code>using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Mango.Network.Core.MSocket
{
    /// &lt;summary&gt;
    /// AsyncUserToken对象池（固定缓存设计）
    /// &lt;/summary&gt;
    public class SocketAsyncEventArgsPool
    {
        private Stack&lt;AsyncUserToken&gt; m_pool;

        public SocketAsyncEventArgsPool(int capacity)
        {
            m_pool = new Stack&lt;AsyncUserToken&gt;(capacity);
        }

        public void Push(AsyncUserToken item)
        {
            if (item == null) { throw new ArgumentNullException("Items added to a SocketAsyncEventArgsPool cannot be null"); }
            lock (m_pool)
            {
                m_pool.Push(item);
            }
        }

        // Removes a AsyncUserToken instance from the pool
        // and returns the object removed from the pool
        public AsyncUserToken Pop()
        {
            lock (m_pool)
            {
                return m_pool.Pop();
            }
        }

        // The number of AsyncUserToken instances in the pool
        public int Count
        {
            get { return m_pool.Count; }
        }
    }
}
</code></pre>
<p>4.创建事件管理类EventManager，该类负责消息接收订阅事件</p>
<pre class="language-csharp"><code>using System;
using System.Collections.Generic;
using System.Text;

namespace Mango.Network.Core.MSocket
{
    public class EventManager
    {
        /// &lt;summary&gt;
        /// 客户端连接事件
        /// &lt;/summary&gt;
        /// &lt;param name="asyncUserToken"&gt;&lt;/param&gt;
        /// &lt;param name="currentClientCount"&gt;&lt;/param&gt;
        public delegate void AcceptEventHandler(AsyncUserToken asyncUserToken,int currentClientCount);
        public event AcceptEventHandler Accept;
        public void OnAccept(AsyncUserToken asyncUserToken, int currentClientCount)
        {
            Accept?.Invoke(asyncUserToken, currentClientCount);
        }
        /// &lt;summary&gt;
        /// 消息接收事件
        /// &lt;/summary&gt;
        /// &lt;param name="asyncUserToken"&gt;&lt;/param&gt;
        public delegate void ReceiveEventHandler(AsyncUserToken asyncUserToken);
        public event ReceiveEventHandler Receive;
        public void OnReceive(AsyncUserToken asyncUserToken)
        {
            Receive?.Invoke(asyncUserToken);
        }
    }
}
</code></pre>
<p>第二步:创建客户端连接以及消息接收发送所需类</p>
<p>1.连接处理类AsyncAccept，该类负责客户端连接的监听</p>
<pre class="language-csharp"><code>using System;
using System.Collections.Generic;
using System.Text;
using System.Net.Sockets;
using System.Threading;
namespace Mango.Network.Core.MSocket
{
    public class AsyncAccept
    {
        private AsyncReceive _asyncReceive { get; set; }

        private EventManager _eventManager;
        public AsyncAccept(AsyncReceive asyncReceive,EventManager eventManager)
        {
            _asyncReceive = asyncReceive;
            _eventManager = eventManager;
        }
        /// &lt;summary&gt;
        /// 从客户端开始接受一个连接操作
        /// &lt;/summary&gt;
        public void StartAccept(SocketAsyncEventArgs AsyncEventArgs)
        {
            if (AsyncEventArgs == null)
            {
                AsyncEventArgs = new SocketAsyncEventArgs();
                AsyncEventArgs.Completed += new EventHandler&lt;SocketAsyncEventArgs&gt;(OnAcceptCompleted);
            }
            else
            {
                AsyncEventArgs.AcceptSocket = null;
            }
            ConfigData.MaxAcceptedClients.WaitOne();
            if (!ConfigData.ServerSocket.AcceptAsync(AsyncEventArgs))
            {
                ProcessAccept(AsyncEventArgs);
            }
        }

        /// &lt;summary&gt;
        /// accept 操作完成时回调函数
        /// &lt;/summary&gt;
        /// &lt;param name="sender"&gt;Object who raised the event.&lt;/param&gt;
        /// &lt;param name="e"&gt;SocketAsyncEventArg associated with the completed accept operation.&lt;/param&gt;
        public void OnAcceptCompleted(object sender, SocketAsyncEventArgs e)
        {
             ProcessAccept(e);
        }

        /// &lt;summary&gt;
        /// 监听Socket接受处理
        /// &lt;/summary&gt;
        /// &lt;param name="e"&gt;&lt;/param&gt;
        public void ProcessAccept(SocketAsyncEventArgs e)
        {
            if (e.SocketError == SocketError.Success)
            {
                Socket socket = e.AcceptSocket;//和客户端关联的socket
                if (socket.Connected)
                {
                    try
                    {
                        Interlocked.Increment(ref ConfigData.CurrentClientCount);//原子操作加1
                        AsyncUserToken userToken = ConfigData.UserTokenPool.Pop();
                        userToken.ConnectSocket = socket;
                        //调用连接事件
                        _eventManager.OnAccept(userToken, ConfigData.CurrentClientCount);
                        if (!socket.ReceiveAsync(userToken.ReceiveEventArgs))//投递接收请求
                        {
                            _asyncReceive.ProcessReceive(userToken.ReceiveEventArgs);
                        }
                    }
                    catch (SocketException ex)
                    {
                        throw ex;
                    }
                    //投递下一个接受请求
                    StartAccept(e);
                }
            }
        }
    }
}
</code></pre>
<p>2.消息接收处理类AsyncReceive，该类负责客户端消息的接收</p>
<pre class="language-csharp"><code>using System;
using System.Collections.Generic;
using System.Text;
using System.Net.Sockets;
namespace Mango.Network.Core.MSocket
{
    public class AsyncReceive
    {
        private EventManager _eventManager;
        public AsyncReceive(EventManager eventManager)
        {
            _eventManager = eventManager;
        }
        /// &lt;summary&gt;
        ///接收完成时处理函数
        /// &lt;/summary&gt;
        /// &lt;param name="e"&gt;与接收完成操作相关联的SocketAsyncEventArg对象&lt;/param&gt;
        public void ProcessReceive(SocketAsyncEventArgs e)
        {
            AsyncUserToken userToken = e.UserToken as AsyncUserToken;
            if (userToken.ReceiveEventArgs.BytesTransferred &gt; 0 &amp;&amp; userToken.ReceiveEventArgs.SocketError == SocketError.Success)
            {
                Socket sock = userToken.ConnectSocket;
                //把收到的数据写入到缓存区里面
                userToken.ReceiveBuffer.WriteBuffer(e.Buffer, e.Offset, e.BytesTransferred);
                //调用消息处理事件
                _eventManager.OnReceive(userToken);
                Array.Clear(e.Buffer,0, e.BytesTransferred);
                //为接收下一段数据，投递接收请求，这个函数有可能同步完成，这时返回false，并且不会引发SocketAsyncEventArgs.Completed事件
                if (!sock.ReceiveAsync(userToken.ReceiveEventArgs))
                {
                    //同步接收时处理接收完成事件
                    ProcessReceive(userToken.ReceiveEventArgs); 
                }
            }
        }
        /// &lt;summary&gt;
        /// 当接收完成时调用此函数
        /// &lt;/summary&gt;
        /// &lt;param name="sender"&gt;激发事件的对象&lt;/param&gt;
        /// &lt;param name="e"&gt;与发送或接收完成操作相关联的SocketAsyncEventArg对象&lt;/param&gt;
        public void OnIOCompleted(object sender, SocketAsyncEventArgs e)
        {
            AsyncUserToken userToken = e.UserToken as AsyncUserToken;
            lock (userToken)
            {
                ProcessReceive(e);
            }
        }
    }
}
</code></pre>
<p>3.消息发送类AsyncSend，该类负责消息发送</p>
<pre class="language-csharp"><code>using System;
using System.Collections.Generic;
using System.Text;
using System.Net.Sockets;
namespace Mango.Network.Core.MSocket
{
    public class AsyncSend
    {
        /// &lt;summary&gt;
        /// 异步的发送数据
        /// &lt;/summary&gt;
        /// &lt;param name="e"&gt;&lt;/param&gt;
        /// &lt;param name="data"&gt;&lt;/param&gt;
        public static void Send(SocketAsyncEventArgs e, byte[] data)
        {
            AsyncUserToken userToken = e.UserToken as AsyncUserToken;
            if (userToken.SendEventArgs.SocketError == SocketError.Success)
            {
                if (userToken.ConnectSocket.Connected)
                {
                    //设置发送数据
                    e.SetBuffer(data,0,data.Length);
                    //投递发送请求，这个函数有可能同步发送出去，这时返回false，并且不会引发SocketAsyncEventArgs.Completed事件
                    if (!userToken.ConnectSocket.SendAsync(userToken.SendEventArgs))
                    {
                        //同步发送时处理发送完成事件
                        ProcessSend(userToken.SendEventArgs);
                    }
                }
            }
        }
        /// &lt;summary&gt;
        /// 发送完成时处理函数
        /// &lt;/summary&gt;
        /// &lt;param name="e"&gt;与发送完成操作相关联的SocketAsyncEventArg对象&lt;/param&gt;
        private static void ProcessSend(SocketAsyncEventArgs e)
        {
            AsyncUserToken userToken = e.UserToken as AsyncUserToken;
            if (userToken.SendEventArgs.SocketError == SocketError.Success)
            {
                //TODO
                if (e.Buffer != null)
                {
                    Array.Clear(e.Buffer, 0, e.Buffer.Length);
                    e.SetBuffer(null, 0, 0);
                }
            }
        }
        /// &lt;summary&gt;
        /// 当接收完成时调用此函数
        /// &lt;/summary&gt;
        /// &lt;param name="sender"&gt;激发事件的对象&lt;/param&gt;
        /// &lt;param name="e"&gt;与发送或接收完成操作相关联的SocketAsyncEventArg对象&lt;/param&gt;
        public static void OnIOCompleted(object sender, SocketAsyncEventArgs e)
        {
            
        }
    }
}
</code></pre>
<p>&nbsp;第三步：创建服务器端控制类SocketServer，该类负责服务器端的初始化</p>
<pre class="language-csharp"><code>using System;
using System.Collections.Generic;
using System.Text;
using System.Net.Sockets;
using System.Net;
namespace Mango.Network.Core.MSocket
{
    public class SocketServer
    {
        /// &lt;summary&gt;
        /// 异步连接处理对象
        /// &lt;/summary&gt;
        private AsyncAccept _asyncAccept;
        /// &lt;summary&gt;
        /// 异步接收处理对象
        /// &lt;/summary&gt;
        private AsyncReceive _asyncReceive;
        /// &lt;summary&gt;
        /// 服务器Socket对象
        /// &lt;/summary&gt;
        private Socket _socket;
        /// &lt;summary&gt;
        /// 事件管理器,绑定相关事件(无需手动初始化)
        /// &lt;/summary&gt;
        public EventManager EventManager { get; set; }

        public SocketServer()
        {
            EventManager = new EventManager();
        }
        /// &lt;summary&gt;
        /// 初始化基本设置信息
        /// &lt;/summary&gt;
        private void Init(int maxConnectionCount)
        {
            _asyncReceive = new AsyncReceive(EventManager);
            _asyncAccept = new AsyncAccept(_asyncReceive, EventManager);
            //初始化配置项
            ConfigData.MaxClientCount = maxConnectionCount;
            
            ConfigData.UserTokenPool = new SocketAsyncEventArgsPool(ConfigData.MaxClientCount);
            ConfigData.MaxAcceptedClients = new System.Threading.Semaphore(ConfigData.MaxClientCount, ConfigData.MaxClientCount);
            //
            AsyncUserToken userToken;
            for (int i = 0; i &lt; ConfigData.MaxClientCount; i++)
            {
                userToken = new AsyncUserToken(ConfigData.BufferSize);
                userToken.ReceiveEventArgs.Completed += new EventHandler&lt;SocketAsyncEventArgs&gt;(_asyncReceive.OnIOCompleted);
                userToken.SendEventArgs.Completed += new EventHandler&lt;SocketAsyncEventArgs&gt;(AsyncSend.OnIOCompleted);
                ConfigData.UserTokenPool.Push(userToken);
            }
        }
        /// &lt;summary&gt;
        /// 启动Socket服务
        /// &lt;/summary&gt;
        /// &lt;param name="Port"&gt;端口号&lt;/param&gt;
        public void Start(string ip,int port,int maxConnectionCount)
        {
            //初始化
            Init(maxConnectionCount);
            //
            IPEndPoint localEndPoint = new IPEndPoint(IPAddress.Parse(ip), port);
            // 创建监听socket
            _socket = new Socket(localEndPoint.AddressFamily, SocketType.Stream, ProtocolType.Tcp);
            if (localEndPoint.AddressFamily == AddressFamily.InterNetworkV6)
            {
                // 配置监听socket为 dual-mode (IPv4 &amp; IPv6) 
                _socket.SetSocketOption(SocketOptionLevel.IPv6, (SocketOptionName)27, false);
                _socket.Bind(new IPEndPoint(IPAddress.IPv6Any, localEndPoint.Port));
            }
            else
            {
                _socket.Bind(localEndPoint); 
            }
            // 开始监听
            _socket.Listen(ConfigData.MaxClientCount);
            ConfigData.ServerSocket = _socket;
            //在监听Socket上投递一个接受请求。
            _asyncAccept.StartAccept(null);
        }
        /// &lt;summary&gt;
        /// 停止服务
        /// &lt;/summary&gt;
        public void Stop()
        {
            _socket.Dispose();
        }
    }
}
</code></pre>
<p>&nbsp;第四步:使用.net core控制台程序进行托管</p>
<p>PS：下面代码中IP等信息我们是从appsettings.json配置文件中读取的</p>
<pre class="language-csharp"><code>using System;
using System.IO;
using Microsoft.Extensions.Configuration;
using Mango.Network.Core.MSocket;
namespace Mango.Network.Server
{
    public class Program
    {
        private static readonly IConfigurationBuilder Configuration = new ConfigurationBuilder();
        private static IConfigurationRoot _configuration;
        static void Main(string[] args)
        {
            try
            {
                //配置文件处理
                _configuration = Configuration.SetBasePath(Directory.GetCurrentDirectory())
                    .AddJsonFile("appsettings.json", optional: false, reloadOnChange: true)
                    .AddEnvironmentVariables().Build();
                //读取数据配置文件信息
                string serverIP= _configuration.GetSection("ServerIPAddress").Value;
                int port = int.Parse(_configuration.GetSection("ServerPort").Value);
                int maxConnectionCount = int.Parse(_configuration.GetSection("MaxConnectionCount").Value);
                //配置Sokcet服务器端
                SocketServer server = new SocketServer();
                //绑定事件
                server.EventManager.Accept += EventManager_Accept;
                server.EventManager.Receive += EventManager_Receive;
                //启动服务器
                server.Start(serverIP, port, maxConnectionCount);
                Console.WriteLine(string.Format("{0}:{1} 最大连接数:{2} start success", serverIP, port, maxConnectionCount));
            }
            catch (Exception ex)
            {
                Console.WriteLine(string.Format("run error {0}", ex.Message));
            }
            Console.ReadLine();
        }

        private static void EventManager_Receive(AsyncUserToken asyncUserToken)
        {
            byte[] buffer = new byte[asyncUserToken.ReceiveBuffer.DataCount];
            Array.Copy(asyncUserToken.ReceiveBuffer.Buffer, 0, buffer, 0, buffer.Length);
            string info = System.Text.Encoding.UTF8.GetString(buffer);
            asyncUserToken.ReceiveBuffer.Clear();

            Console.WriteLine(string.Format("接收到的消息:{0}", info));
            AsyncSend.Send(asyncUserToken.SendEventArgs, System.Text.Encoding.UTF8.GetBytes("hello,my .net core."));
        }

        private static void EventManager_Accept(AsyncUserToken asyncUserToken, int currentClientCount)
        {
            Console.WriteLine(string.Format("客户端 {0} 连接到服务器,当前共有连接数:{1}", asyncUserToken.ConnectSocket.RemoteEndPoint.ToString(), currentClientCount));
        }
    }
}
</code></pre>
<p><strong>&nbsp;客户端:</strong></p>
<p>第一步:我们同样创建一个.net core的控制台程序来进行与服务器端的交互操作</p>
<p>PS:客户端我们只写了个简单例子基于BeginReceive异步方法接收服务器端返回的消息</p>
<pre class="language-csharp"><code>using System;
using System.IO;
using Microsoft.Extensions.Configuration;
using System.Net.Sockets;
using System.Net;
namespace Mango.Network.Client
{
    public class Program
    {
        private static readonly IConfigurationBuilder Configuration = new ConfigurationBuilder();
        private static IConfigurationRoot _configuration;
        private static byte[] buffer = new byte[1024];
        static void Main(string[] args)
        {
            try
            {
                //配置文件处理
                _configuration = Configuration.SetBasePath(Directory.GetCurrentDirectory())
                    .AddJsonFile("appsettings.json", optional: false, reloadOnChange: true)
                    .AddEnvironmentVariables().Build();
                //读取数据配置文件信息
                string serverIP = _configuration.GetSection("ServerIPAddress").Value;
                int port = int.Parse(_configuration.GetSection("ServerPort").Value);
                //简单的写一个Socket端
                Socket socket = new Socket(AddressFamily.InterNetwork, SocketType.Stream, ProtocolType.Tcp);
                socket.Connect(IPAddress.Parse(serverIP), port);
                socket.Send(System.Text.Encoding.UTF8.GetBytes("hello,my socket."));
                Console.WriteLine(string.Format("connection success 服务器,{0}:{1}", serverIP, port));
                //简单异步接收服务器拿到的消息
                socket.BeginReceive(buffer, 0, buffer.Length, 0, new AsyncCallback(ReceiveCallback), socket);
            }
            catch (Exception ex)
            {
                Console.WriteLine(string.Format("run error {0}", ex.Message));
            }
            Console.ReadLine();
        }
        private static void ReceiveCallback(IAsyncResult ar)
        {
            try
            {
                Socket socket = ar.AsyncState as Socket;
                int REnd = socket.EndReceive(ar);
                if (REnd &gt; 0)
                {
                    byte[] data = new byte[REnd];
                    Array.Copy(buffer, 0, data, 0, REnd);

                    //在此次可以对data进行按需处理
                    string info = System.Text.Encoding.UTF8.GetString(data);
                    Console.WriteLine(string.Format("接收到的消息:{0}", info));
                    //
                    socket.BeginReceive(buffer, 0, buffer.Length, 0, new AsyncCallback(ReceiveCallback), null);
                }
            }
            catch (SocketException ex)
            { }
        }
    }
}
</code></pre>
<p>&nbsp;接下来我们查看预览效果:</p>
<p><img src="https://file.51core.net/2/2019/2/46c787a1cb8c43b8a2a94e2fcef08c2d.png" width="902" height="394" /></p>
<p>本案例源代码已经开源到github,请到如下地址下载</p>
<p><a title="本案例源代码下载" href="https://github.com/51core/mango-socket" target="_blank" rel="noopener">https://github.com/51core/mango-socket</a></p>', CAST(N'2019-02-27T18:32:51.897' AS DateTime), CAST(N'2019-02-27T18:32:51.897' AS DateTime), 2, 0, 3638, 1, N'', N'', 0, 3)
INSERT [dbo].[m_CmsContents] ([ContentsId], [Title], [Contents], [PostTime], [LastTime], [AccountId], [PlusCount], [ReadCount], [StateCode], [Tags], [ImgUrl], [AnswerCount], [ChannelId]) VALUES (23, N'基于Asp.Net Core的简单社区项目源代码开源', N'<p>2019年3月27号 更新版本 本项目基于 ASP.NET CORE 3.0+EF CORE 3.0开发</p>
<p>使用vs2019 +sqlserver 2017(数据库脚本最低支持sql server 2012/+)</p>
<p>使用步骤:</p>
<p>1.下载相关开发工具</p>
<p>2.运行数据库脚本目录下的相关脚本</p>
<p>3.默认前端账号密码: 18812345678 123456</p>
<p>4.默认后台账号密码: admin 123456</p>
<p>开源地址:</p>
<p><a title="源代码地址" href="https://github.com/51core/mango-sns-open" target="_blank" rel="noopener">https://github.com/51core/mango-sns-open</a></p>', CAST(N'2019-03-28T10:27:38.533' AS DateTime), CAST(N'2019-03-28T10:27:38.533' AS DateTime), 2, 0, 443, 1, N'', N'', 0, 1)
INSERT [dbo].[m_CmsContents] ([ContentsId], [Title], [Contents], [PostTime], [LastTime], [AccountId], [PlusCount], [ReadCount], [StateCode], [Tags], [ImgUrl], [AnswerCount], [ChannelId]) VALUES (24, N'关于本站用户发帖以及文档的说明', N'<p>本站专注于.Net Core技术知识分享,请勿重复同一个帖子,也不要进行恶意灌水.</p>
<p>发现以后处罚:</p>
<p>1.第一次屏蔽所发内容</p>
<p>2.第二次再发屏蔽账号</p>', CAST(N'2019-03-28T10:36:33.127' AS DateTime), CAST(N'2019-03-28T10:36:33.127' AS DateTime), 2, 3, 388, 1, N'', N'', 0, 1)
INSERT [dbo].[m_CmsContents] ([ContentsId], [Title], [Contents], [PostTime], [LastTime], [AccountId], [PlusCount], [ReadCount], [StateCode], [Tags], [ImgUrl], [AnswerCount], [ChannelId]) VALUES (25, N'Steam 商店免费领取 Telefrag VR 并开始公测（有可能会收回？）', N'<p>商店地址：<span style="overflow-wrap: break-word; font-family: &amp;quot;"><a class="steamInfoLink loaded touched" style="overflow-wrap: break-word; color: #57bae8; font-family: ''segoe ui'', segoe, ''segoe wp'', tahoma, ''microsoft yahei'', sans-serif; font-size: 14px; text-align: -webkit-center; background-color: #f7f7f7;" href="https://store.steampowered.com/app/916100/Telefrag_VR" target="_blank" rel="noopener">https://store.steampowered.com/app/916100/Telefrag_VR</a></span></p>
<p><span style="overflow-wrap: break-word; font-family: &amp;quot;"><img src="https://steamcdn-a.akamaihd.net/steam/apps/916100/header.jpg?t=1553732797" /></span></p>
<p>登录后点击安装游戏即可加入账号库存！</p>
<p>&nbsp;</p>
<div id="steam_info_app_916100_1" class="steamInfoWrapper" style="overflow-wrap: break-word; background-repeat: no-repeat; background-position: 16px 4px; text-indent: 0px; display: block; width: 312px; height: 374px; padding: 2px; z-index: 10; position: absolute !important; color: #3e3e3e; font-family: ''segoe ui'', segoe, ''segoe wp'', tahoma, ''microsoft yahei'', sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: -webkit-center; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #f7f7f7; text-decoration-style: initial; text-decoration-color: initial; left: 988px; top: 606px;">&nbsp;</div>', CAST(N'2019-03-28T11:08:02.630' AS DateTime), CAST(N'2019-03-28T11:08:02.630' AS DateTime), 2030, 0, 4, 1, N'', N'', 0, 1)
INSERT [dbo].[m_CmsContents] ([ContentsId], [Title], [Contents], [PostTime], [LastTime], [AccountId], [PlusCount], [ReadCount], [StateCode], [Tags], [ImgUrl], [AnswerCount], [ChannelId]) VALUES (26, N'基于Asp.Net Core的简单社区项目源代码开源部署问题', N'<p><span style="color: #444444; font-family: ''PingFang SC'', ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 12px; background-color: #f3fbff;">基于Asp.Net Core的简单社区项目源代码开源 在linux下部署过吗？有没有详细的教程。我在sql server on linux 创建数据库不成功。还有请教下dotnet run在哪个目录下运行?</span></p>', CAST(N'2019-04-02T15:51:29.790' AS DateTime), CAST(N'2019-04-02T15:51:29.790' AS DateTime), 2037, 0, 369, 1, N'', N'', 0, 1)
INSERT [dbo].[m_CmsContents] ([ContentsId], [Title], [Contents], [PostTime], [LastTime], [AccountId], [PlusCount], [ReadCount], [StateCode], [Tags], [ImgUrl], [AnswerCount], [ChannelId]) VALUES (27, N'在Ubuntu18.04+.net core 3.0+sql server on linux 上搭建成功', N'<p><span style="color: #212529; font-family: -apple-system, BlinkMacSystemFont, Segoe UI, Roboto, Helvetica Neue, Arial, Noto Sans, sans-serif, Apple Color Emoji, Segoe UI Emoji, Segoe UI Symbol, Noto Color Emoji;"><span style="font-size: 15px; background-color: #ffffff;">体验地址</span></span><a href="http://www.githall.cn/">http://www.githall.cn/</a></p>
<p>用户名：18812345678 密码：123456</p>
<p>联系QQ：459817225</p>
<p>希望作者能建立个QQ群，大家一起交流。</p>', CAST(N'2019-04-02T23:32:39.397' AS DateTime), CAST(N'2019-04-02T23:32:39.397' AS DateTime), 2037, 2, 346, 1, N'', N'', 0, 1)
INSERT [dbo].[m_CmsContents] ([ContentsId], [Title], [Contents], [PostTime], [LastTime], [AccountId], [PlusCount], [ReadCount], [StateCode], [Tags], [ImgUrl], [AnswerCount], [ChannelId]) VALUES (28, N'VS2019创建新项目居然没有.NET Core3.0的模板的问题解决', N'<p>今天安装了VS2019的正式版,并且已经安装.NET Core 3.0 最新预览版的SDK，但是在原来体验版的VS2019创建的项目居然不能使用,解决办法如下:</p>
<p>1.打开VS2019选择 无代码进入,如下图</p>
<p><img src="https://file.51core.net/2/2019/4/c60c9e0e3bad427d968c2510039b94f4.png" /></p>
<p>2.从顶部菜单栏 工具--&gt;选项进入设置页面,如下图</p>
<p><img src="https://file.51core.net/2/2019/4/fad4bb551c2c4221b8c69d3d2b17b4cc.png" /></p>
<p>3.在搜索框中输入.net core 就会出现设置项,点击项目和解决方案,勾选右边的 使用.Net Core SDK预览版并且保存就解决了,如下图</p>
<p><img src="https://file.51core.net/2/2019/4/d17b103243cd4f9296d15cddd2443081.png" /></p>
<p>&nbsp;</p>', CAST(N'2019-04-03T18:05:02.760' AS DateTime), CAST(N'2019-04-03T18:05:02.760' AS DateTime), 2, 0, 627, 1, N'', N'', 0, 3)
INSERT [dbo].[m_CmsContents] ([ContentsId], [Title], [Contents], [PostTime], [LastTime], [AccountId], [PlusCount], [ReadCount], [StateCode], [Tags], [ImgUrl], [AnswerCount], [ChannelId]) VALUES (29, N'.NET/NET Core 中服务端使用普通Socket处理打包WEBSOCKET消息', N'<p>&nbsp; &nbsp; 了解WEBSOCKET的特性都知道,使用WEBSOCKET需要经过握手处理,如果需要和Socket服务端实现收发消息也要经过处理才可以.</p>
<p>下面这段代码就是.NET SOCKET下处理WEBSOCKET消息的</p>
<pre class="language-csharp"><code>using System;
using System.Collections.Generic;
using System.Net;
using System.Text;
using System.Text.RegularExpressions;
using System.Security.Cryptography;

namespace Mango.Chat.Net
{
    /// &lt;summary&gt;
    /// WebSocket消息处理类
    /// &lt;/summary&gt;
    public class WebSocketDealWith
    {
        /// &lt;summary&gt;
        /// 根据类型名称获取客户端连接类型
        /// &lt;/summary&gt;
        /// &lt;param name="typeName"&gt;&lt;/param&gt;
        /// &lt;returns&gt;&lt;/returns&gt;
        public static ConnectionType GetConnectionType(string typeName)
        {
            ConnectionType connectionType = ConnectionType.Windows;
            switch (typeName.ToLower())
            {
                case "websocket":
                    connectionType = ConnectionType.WebSocket;
                    break;
                case "ios":
                    connectionType = ConnectionType.IOS;
                    break;
                case "android":
                    connectionType = ConnectionType.Android;
                    break;
            }
            return connectionType;
        }

        public static byte[] WebSocketAcceptShake(string message)
        {
            return PackHandShakeData(GetSecKeyAccetp(message));
        }
        /// &lt;summary&gt;
        /// 打包握手信息
        /// &lt;/summary&gt;
        /// &lt;param name="secKeyAccept"&gt;Sec-WebSocket-Accept&lt;/param&gt;
        /// &lt;returns&gt;数据包&lt;/returns&gt;
        private static byte[] PackHandShakeData(string secKeyAccept)
        {
            var responseBuilder = new StringBuilder();
            responseBuilder.Append("HTTP/1.1 101 Switching Protocols" + Environment.NewLine);
            responseBuilder.Append("Upgrade: websocket" + Environment.NewLine);
            responseBuilder.Append("Connection: Upgrade" + Environment.NewLine);
            responseBuilder.Append("Sec-WebSocket-Accept: " + secKeyAccept + Environment.NewLine + Environment.NewLine);
            return Encoding.UTF8.GetBytes(responseBuilder.ToString());
        }

        /// &lt;summary&gt;
        /// 生成Sec-WebSocket-Accept
        /// &lt;/summary&gt;
        /// &lt;param name="handShakeText"&gt;客户端握手信息&lt;/param&gt;
        /// &lt;returns&gt;Sec-WebSocket-Accept&lt;/returns&gt;
        private static string GetSecKeyAccetp(string handShakeText)
        {
            string key = string.Empty;
            Regex r = new Regex(@"Sec\-WebSocket\-Key:(.*?)\r\n");
            Match m = r.Match(handShakeText);
            if (m.Groups.Count != 0)
            {
                key = Regex.Replace(m.Value, @"Sec\-WebSocket\-Key:(.*?)\r\n", "$1").Trim();
            }
            byte[] encryptionString = SHA1.Create().ComputeHash(Encoding.ASCII.GetBytes(key + "258EAFA5-E914-47DA-95CA-C5AB0DC85B11"));
            return Convert.ToBase64String(encryptionString);
        }
        /// &lt;summary&gt;
        /// 将字符串转为base64字符串
        /// &lt;/summary&gt;
        /// &lt;param name="str"&gt;&lt;/param&gt;
        /// &lt;returns&gt;&lt;/returns&gt;
        public static string StringToBase64(string str)
        {
            return Convert.ToBase64String(Encoding.UTF8.GetBytes(str));
        }
        /// &lt;summary&gt;
        /// base64字符串转普通字符串
        /// &lt;/summary&gt;
        /// &lt;param name="base64Str"&gt;&lt;/param&gt;
        /// &lt;returns&gt;&lt;/returns&gt;
        public static string Base64ToString(string base64Str)
        {
            return Encoding.UTF8.GetString(Convert.FromBase64String(base64Str));
        }
        /// &lt;summary&gt;
        /// 打包服务器数据
        /// &lt;/summary&gt;
        /// &lt;param name="message"&gt;数据&lt;/param&gt;
        /// &lt;returns&gt;数据包&lt;/returns&gt;
        public static byte[] PackData(string message)
        {
            byte[] messageBuffer = System.Text.Encoding.UTF8.GetBytes(message);
            byte[] contentBytes = null;
            if (messageBuffer.Length &gt; 0)
            {
                if (messageBuffer.Length &lt; 126)
                {
                    contentBytes = new byte[messageBuffer.Length + 2];
                    contentBytes[0] = 0x81;
                    contentBytes[1] = (byte)messageBuffer.Length;//1个字节存储真实长度
                    Array.Copy(messageBuffer, 0, contentBytes, 2, messageBuffer.Length);
                }
                else if (messageBuffer.Length &lt;= 65535)
                {
                    contentBytes = new byte[messageBuffer.Length + 4];
                    contentBytes[0] = 0x81;//非分片发送
                    contentBytes[1] = 126;
                    byte[] slen = BitConverter.GetBytes((short)messageBuffer.Length);//2个字节存储真实长度
                    contentBytes[2] = slen[1];
                    contentBytes[3] = slen[0];
                    Array.Copy(messageBuffer, 0, contentBytes, 4, messageBuffer.Length);
                }
            }

            return contentBytes;
        }
        /// &lt;summary&gt;
        /// 解析客户端数据包
        /// &lt;/summary&gt;
        /// &lt;param name="recBytes"&gt;服务器接收的数据包&lt;/param&gt;
        /// &lt;param name="recByteLength"&gt;有效数据长度&lt;/param&gt;
        /// &lt;returns&gt;&lt;/returns&gt;
        public static string AnalyticData(byte[] recBytes, int recByteLength)
        {
            if (recByteLength &lt; 2) { return string.Empty; }

            bool fin = (recBytes[0] &amp; 0x80) == 0x80; // 1bit，1表示最后一帧  
            if (!fin)
            {
                return string.Empty;// 超过一帧暂不处理 
            }

            bool mask_flag = (recBytes[1] &amp; 0x80) == 0x80; // 是否包含掩码  
            if (!mask_flag)
            {
                return string.Empty;// 不包含掩码的暂不处理
            }

            int payload_len = recBytes[1] &amp; 0x7F; // 数据长度  

            byte[] masks = new byte[4];
            byte[] payload_data;

            if (payload_len == 126)
            {
                Array.Copy(recBytes, 4, masks, 0, 4);
                payload_len = (UInt16)(recBytes[2] &lt;&lt; 8 | recBytes[3]);
                payload_data = new byte[payload_len];
                Array.Copy(recBytes, 8, payload_data, 0, payload_len);

            }
            else if (payload_len == 127)
            {
                Array.Copy(recBytes, 10, masks, 0, 4);
                byte[] uInt64Bytes = new byte[8];
                for (int i = 0; i &lt; 8; i++)
                {
                    uInt64Bytes[i] = recBytes[9 - i];
                }
                UInt64 len = BitConverter.ToUInt64(uInt64Bytes, 0);

                payload_data = new byte[len];
                for (UInt64 i = 0; i &lt; len; i++)
                {
                    payload_data[i] = recBytes[i + 14];
                }
            }
            else
            {
                Array.Copy(recBytes, 2, masks, 0, 4);
                payload_data = new byte[payload_len];
                Array.Copy(recBytes, 6, payload_data, 0, payload_len);
            }

            for (var i = 0; i &lt; payload_len; i++)
            {
                payload_data[i] = (byte)(payload_data[i] ^ masks[i % 4]);
            }

            return Encoding.UTF8.GetString(payload_data);
        }
    }
}
</code></pre>
<p>&nbsp;调用代码示例:</p>
<pre class="language-csharp"><code>using System;
using System.Collections.Generic;
using System.Net;
using System.Net.Sockets;
using System.Text;
namespace Mango.Chat.Net
{
    /// &lt;summary&gt;
    /// 消息接收类,只负责消息的接收其它一概不管
    /// &lt;/summary&gt;
    public class ReceiveAsync
    {
        public void ReceiveMessage(IAsyncResult ar)
        {
            var token = ar.AsyncState as AsyncUserToken;
            try
            {

                if (ConnectionManager.IsSocketConnected(token.Socket))
                {
                    var length = token.Socket.EndReceive(ar);
                    if (length &gt; 0)
                    {
                        byte[] buffer = new byte[length];
                        Array.Copy(token.Buffer, buffer, length);
                        //判断是否为WebSocket连接
                        var message = System.Text.Encoding.UTF8.GetString(buffer); //WebSocketDealWith.AnalyticData(buffer, buffer.Length);

                        if (message.Contains("Sec-WebSocket-Key"))
                        {
                            byte[] ws = WebSocketDealWith.WebSocketAcceptShake(message);
                            SendAsync.Send(token, ws);
                        }
                        else
                        {
                            token.ReceiveBuffer.Enqueue(buffer);
                            ConnectionManager.MessageQueue.Enqueue(token);
                        }

                        //接收下一个消息(因为这是一个递归的调用，所以这样就可以一直接收消息了）
                        Array.Clear(token.Buffer, 0, length);
                    }
                    token.Socket.BeginReceive(token.Buffer, 0, token.Buffer.Length, SocketFlags.None, new AsyncCallback(ReceiveMessage), token);
                }
            }
            catch (Exception ex)
            {
                Core.Log4Net.Error(this.GetType(), "消息接收:", ex);
            }
        }
    }
}
</code></pre>
<pre class="language-csharp"><code> if (asyncUserToken.ConnectionType == ConnectionType.WebSocket)
{
         buffer = WebSocketDealWith.PackData(tempMsg);
}
else
{
         buffer = System.Text.Encoding.UTF8.GetBytes(tempMsg);
}</code></pre>', CAST(N'2019-05-27T11:45:20.530' AS DateTime), CAST(N'2019-05-27T11:45:20.530' AS DateTime), 2, 0, 314, 1, N'', N'', 0, 3)
INSERT [dbo].[m_CmsContents] ([ContentsId], [Title], [Contents], [PostTime], [LastTime], [AccountId], [PlusCount], [ReadCount], [StateCode], [Tags], [ImgUrl], [AnswerCount], [ChannelId]) VALUES (30, N'基于Asp.Net Core的简单社区项目源代码最新版本更新', N'<p>2019年6月03号 更新版本 本项目基于 ASP.NET CORE 3.0 PR5 +EF CORE 3.0 PR5开发</p>
<p>使用vs2019 +sqlserver 2017(数据库脚本最低支持sql server 2012/+)</p>
<p>使用步骤: 1.下载相关开发工具 2.运行数据库脚本目录下的相关脚本 3.默认前端账号密码: 18812345678 123456 4.默认后台账号密码: admin 123456</p>
<p>前端演示地址:</p>
<p><a href="../../" rel="nofollow">https://www.51core.net</a></p>
<p>记于2019年03月27号-喻平勇</p>
<p><a href="https://github.com/51core/mango-sns-open" target="_blank" rel="noopener">https://github.com/51core/mango-sns-open</a></p>', CAST(N'2019-06-03T11:53:03.960' AS DateTime), CAST(N'2019-06-03T11:53:03.960' AS DateTime), 2, 1, 448, 1, N'', N'', 0, 3)
INSERT [dbo].[m_CmsContents] ([ContentsId], [Title], [Contents], [PostTime], [LastTime], [AccountId], [PlusCount], [ReadCount], [StateCode], [Tags], [ImgUrl], [AnswerCount], [ChannelId]) VALUES (31, N'VS2019 16.2版本创建新项目居然没有.NET Core3.0的模板的问题解决', N'<p>下载安装了VS2019 16.2版本在创建项目时居然没有.NET Core 3.0预览版的SDK选项,而且在原来的16.1版本的设置的位置也已经迁移,正确的设置位置如下</p>
<p>1.打开VS2019选择 无代码进入,如下图</p>
<p><img src="https://file.51core.net/2/2019/4/c60c9e0e3bad427d968c2510039b94f4.png" /></p>
<p>2.从顶部菜单栏 工具--&gt;选项进入设置页面,如下图</p>
<p><img src="https://file.51core.net/2/2019/4/fad4bb551c2c4221b8c69d3d2b17b4cc.png" /></p>
<p>3.在选项卡里面的 环境---&gt;预览功能---&gt;勾选上 Use previews of the .Net Core SDK选项即可(勾选完保存并且重启VS2019即可)</p>
<p><img src="data:image/png;base64,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" alt="" /></p>
<p>&nbsp;</p>', CAST(N'2019-07-25T14:37:15.597' AS DateTime), CAST(N'2019-07-25T14:37:15.597' AS DateTime), 2, 0, 302, 1, N'', N'', 0, 3)
INSERT [dbo].[m_CmsContents] ([ContentsId], [Title], [Contents], [PostTime], [LastTime], [AccountId], [PlusCount], [ReadCount], [StateCode], [Tags], [ImgUrl], [AnswerCount], [ChannelId]) VALUES (32, N'51Core技术网源代码最新版本发布[.Net Core 3.0 PR8]', N'<p>2019.08.14更新日志<br />1.升级到.NET CORE 3.0 PR8版本<br />2.将System.Data.SqlClient替换成Microsoft.Data.SqlClient<br />3.修复已知BUG</p>
<p>开源地址:</p>
<p><a title="https://github.com/51core/mango-sns-open" href="https://github.com/51core/mango-sns-open" target="_blank" rel="noopener">https://github.com/51core/mango-sns-open</a></p>', CAST(N'2019-08-14T22:31:10.380' AS DateTime), CAST(N'2019-08-14T22:31:10.380' AS DateTime), 2, 1, 268, 1, N'', N'', 0, 3)
INSERT [dbo].[m_CmsContents] ([ContentsId], [Title], [Contents], [PostTime], [LastTime], [AccountId], [PlusCount], [ReadCount], [StateCode], [Tags], [ImgUrl], [AnswerCount], [ChannelId]) VALUES (33, N'Linux环境下mango-sns-open的部署', N'<p style="box-sizing: border-box; margin-bottom: 16px; color: #24292e; font-family: -apple-system, BlinkMacSystemFont, ''Segoe UI'', Helvetica, Arial, sans-serif, ''Apple Color Emoji'', ''Segoe UI Emoji'', ''Segoe UI Symbol''; font-size: 14px; background-color: #ffffff; margin-top: 0px !important;">一、环境安装<br style="box-sizing: border-box;" />1、首先更新系统<br style="box-sizing: border-box;" />apt update&amp;&amp;apt upgrade -y</p>
<p style="box-sizing: border-box; margin-bottom: 16px; margin-top: 0px; color: #24292e; font-family: -apple-system, BlinkMacSystemFont, ''Segoe UI'', Helvetica, Arial, sans-serif, ''Apple Color Emoji'', ''Segoe UI Emoji'', ''Segoe UI Symbol''; font-size: 14px; background-color: #ffffff;">2、安装.Net Core环境<br style="box-sizing: border-box;" />按照微软官方的说明安装.Net Core环境<br style="box-sizing: border-box;" /><a style="box-sizing: border-box; background-color: transparent; color: #0366d6; text-decoration-line: none;" href="https://github.com/dotnet/core/blob/master/release-notes/3.0/preview/3.0.0-preview8-download.md">https://github.com/dotnet/core/blob/master/release-notes/3.0/preview/3.0.0-preview8-download.md</a><br style="box-sizing: border-box;" />执行如下命令：</p>
<p style="box-sizing: border-box; margin-bottom: 16px; margin-top: 0px; color: #24292e; font-family: -apple-system, BlinkMacSystemFont, ''Segoe UI'', Helvetica, Arial, sans-serif, ''Apple Color Emoji'', ''Segoe UI Emoji'', ''Segoe UI Symbol''; font-size: 14px; background-color: #ffffff;">（1）下载需要的文件<br style="box-sizing: border-box;" />sudo wget&nbsp;<a style="box-sizing: border-box; background-color: transparent; color: #0366d6; text-decoration-line: none;" href="https://download.visualstudio.microsoft.com/download/pr/54a51271-ab58-41f3-9b18-a939888251fe/9b44470e8bc2bb6259e91696ad4e56b5/dotnet-runtime-deps-3.0.0-preview8-28405-07-x64.deb" rel="nofollow">https://download.visualstudio.microsoft.com/download/pr/54a51271-ab58-41f3-9b18-a939888251fe/9b44470e8bc2bb6259e91696ad4e56b5/dotnet-runtime-deps-3.0.0-preview8-28405-07-x64.deb</a><br style="box-sizing: border-box;" />sudo wget&nbsp;<a style="box-sizing: border-box; background-color: transparent; color: #0366d6; text-decoration-line: none;" href="https://download.visualstudio.microsoft.com/download/pr/24de5026-3471-4803-b674-689b338569df/10770879c266d430f4707e4f05f14559/dotnet-host-3.0.0-preview8-28405-07-x64.deb" rel="nofollow">https://download.visualstudio.microsoft.com/download/pr/24de5026-3471-4803-b674-689b338569df/10770879c266d430f4707e4f05f14559/dotnet-host-3.0.0-preview8-28405-07-x64.deb</a><br style="box-sizing: border-box;" />sudo wget&nbsp;<a style="box-sizing: border-box; background-color: transparent; color: #0366d6; text-decoration-line: none;" href="https://download.visualstudio.microsoft.com/download/pr/f65168d8-ecae-473a-a5ca-4300ed6d82ca/1ef8f137d05783380d128550fb1f0eb8/dotnet-hostfxr-3.0.0-preview8-28405-07-x64.deb" rel="nofollow">https://download.visualstudio.microsoft.com/download/pr/f65168d8-ecae-473a-a5ca-4300ed6d82ca/1ef8f137d05783380d128550fb1f0eb8/dotnet-hostfxr-3.0.0-preview8-28405-07-x64.deb</a><br style="box-sizing: border-box;" />sudo wget&nbsp;<a style="box-sizing: border-box; background-color: transparent; color: #0366d6; text-decoration-line: none;" href="https://download.visualstudio.microsoft.com/download/pr/b19fcec7-447a-465a-b1d5-b18084485b8d/40017d81e52d89f3aaac2537357c6c63/dotnet-runtime-3.0.0-preview8-28405-07-x64.deb" rel="nofollow">https://download.visualstudio.microsoft.com/download/pr/b19fcec7-447a-465a-b1d5-b18084485b8d/40017d81e52d89f3aaac2537357c6c63/dotnet-runtime-3.0.0-preview8-28405-07-x64.deb</a><br style="box-sizing: border-box;" />sudo wget&nbsp;<a style="box-sizing: border-box; background-color: transparent; color: #0366d6; text-decoration-line: none;" href="https://download.visualstudio.microsoft.com/download/pr/13e08a26-96aa-4b54-ab4f-ab967fa13be2/1bbd4e9a5f04e254ec43ede7f43e7005/aspnetcore-runtime-3.0.0-preview8.19405.7-x64.deb" rel="nofollow">https://download.visualstudio.microsoft.com/download/pr/13e08a26-96aa-4b54-ab4f-ab967fa13be2/1bbd4e9a5f04e254ec43ede7f43e7005/aspnetcore-runtime-3.0.0-preview8.19405.7-x64.deb</a><br style="box-sizing: border-box;" />sudo wget&nbsp;<a style="box-sizing: border-box; background-color: transparent; color: #0366d6; text-decoration-line: none;" href="https://download.visualstudio.microsoft.com/download/pr/cb26477c-ca65-4fa7-86cc-de0131303875/b844b61ec6ddab5d82dabc6c5efd419b/dotnet-targeting-pack-3.0.0-preview8-28405-07-x64.deb" rel="nofollow">https://download.visualstudio.microsoft.com/download/pr/cb26477c-ca65-4fa7-86cc-de0131303875/b844b61ec6ddab5d82dabc6c5efd419b/dotnet-targeting-pack-3.0.0-preview8-28405-07-x64.deb</a><br style="box-sizing: border-box;" />sudo wget&nbsp;<a style="box-sizing: border-box; background-color: transparent; color: #0366d6; text-decoration-line: none;" href="https://download.visualstudio.microsoft.com/download/pr/0afc82ac-e13e-4079-8579-0b17ead6479a/37153d3072e9f32ae816664b40302c28/dotnet-apphost-pack-3.0.0-preview8-28405-07-x64.deb" rel="nofollow">https://download.visualstudio.microsoft.com/download/pr/0afc82ac-e13e-4079-8579-0b17ead6479a/37153d3072e9f32ae816664b40302c28/dotnet-apphost-pack-3.0.0-preview8-28405-07-x64.deb</a><br style="box-sizing: border-box;" />sudo wget&nbsp;<a style="box-sizing: border-box; background-color: transparent; color: #0366d6; text-decoration-line: none;" href="https://download.visualstudio.microsoft.com/download/pr/90cf071f-8412-45b1-9237-ade8d9d5b871/adcdf7d67cb0554f6a53af3d3b303e9d/aspnetcore-targeting-pack-3.0.0-preview8.19405.7.deb" rel="nofollow">https://download.visualstudio.microsoft.com/download/pr/90cf071f-8412-45b1-9237-ade8d9d5b871/adcdf7d67cb0554f6a53af3d3b303e9d/aspnetcore-targeting-pack-3.0.0-preview8.19405.7.deb</a><br style="box-sizing: border-box;" />sudo wget&nbsp;<a style="box-sizing: border-box; background-color: transparent; color: #0366d6; text-decoration-line: none;" href="https://download.visualstudio.microsoft.com/download/pr/4caf9463-865a-4265-83e6-15fc4c217eb2/320dde5e522457a91b2a1daaa57bb764/netstandard-targeting-pack-2.1.0-preview8-28405-07-x64.deb" rel="nofollow">https://download.visualstudio.microsoft.com/download/pr/4caf9463-865a-4265-83e6-15fc4c217eb2/320dde5e522457a91b2a1daaa57bb764/netstandard-targeting-pack-2.1.0-preview8-28405-07-x64.deb</a><br style="box-sizing: border-box;" />sudo wget&nbsp;<a style="box-sizing: border-box; background-color: transparent; color: #0366d6; text-decoration-line: none;" href="https://download.visualstudio.microsoft.com/download/pr/3dd3123a-7ada-40d0-b920-cd9b22cdb172/5e9142450ceec2b15829ca0fe5c54a68/dotnet-sdk-3.0.100-preview8-013656-x64.deb" rel="nofollow">https://download.visualstudio.microsoft.com/download/pr/3dd3123a-7ada-40d0-b920-cd9b22cdb172/5e9142450ceec2b15829ca0fe5c54a68/dotnet-sdk-3.0.100-preview8-013656-x64.deb</a></p>
<p style="box-sizing: border-box; margin-bottom: 16px; margin-top: 0px; color: #24292e; font-family: -apple-system, BlinkMacSystemFont, ''Segoe UI'', Helvetica, Arial, sans-serif, ''Apple Color Emoji'', ''Segoe UI Emoji'', ''Segoe UI Symbol''; font-size: 14px; background-color: #ffffff;">（2）运行如下命令安装deb包<br style="box-sizing: border-box;" />sudo dpkg -i ./*.deb<br style="box-sizing: border-box;" />如果出错，执行如下命令修复<br style="box-sizing: border-box;" />apt install -f</p>
<p style="box-sizing: border-box; margin-bottom: 16px; margin-top: 0px; color: #24292e; font-family: -apple-system, BlinkMacSystemFont, ''Segoe UI'', Helvetica, Arial, sans-serif, ''Apple Color Emoji'', ''Segoe UI Emoji'', ''Segoe UI Symbol''; font-size: 14px; background-color: #ffffff;">（3）验证.Net Core是否安装成功<br style="box-sizing: border-box;" />sudo dotnet --version<br style="box-sizing: border-box;" />看到如下提示：<br style="box-sizing: border-box;" />3.0.100-preview8-013656</p>
<p style="box-sizing: border-box; margin-bottom: 16px; margin-top: 0px; color: #24292e; font-family: -apple-system, BlinkMacSystemFont, ''Segoe UI'', Helvetica, Arial, sans-serif, ''Apple Color Emoji'', ''Segoe UI Emoji'', ''Segoe UI Symbol''; font-size: 14px; background-color: #ffffff;">3、克隆项目到本地<br style="box-sizing: border-box;" />git clone&nbsp;<a style="box-sizing: border-box; background-color: transparent; color: #0366d6; text-decoration-line: none;" href="https://github.com/51core/mango-sns-open.git">https://github.com/51core/mango-sns-open.git</a><br style="box-sizing: border-box;" />转到项目的src目录<br style="box-sizing: border-box;" />cd mango-sns-open/src/<br style="box-sizing: border-box;" />分别运行如下命令：<br style="box-sizing: border-box;" />dotnet restore<br style="box-sizing: border-box;" />dotnet publish<br style="box-sizing: border-box;" />转到项目的Mango.Web/bin/Debug/netcoreapp3.0/publish/ 目录<br style="box-sizing: border-box;" />cd Mango.Web/bin/Debug/netcoreapp3.0/publish/<br style="box-sizing: border-box;" />将目录下的文件复制到/var/www/default目录。<br style="box-sizing: border-box;" />如果不存在/var/www/default目录，运行如下命令建立：<br style="box-sizing: border-box;" />mkdir -p /var/www/default</p>
<p style="box-sizing: border-box; margin-bottom: 16px; margin-top: 0px; color: #24292e; font-family: -apple-system, BlinkMacSystemFont, ''Segoe UI'', Helvetica, Arial, sans-serif, ''Apple Color Emoji'', ''Segoe UI Emoji'', ''Segoe UI Symbol''; font-size: 14px; background-color: #ffffff;">4、安装redis<br style="box-sizing: border-box;" />运行如下命令安装redis<br style="box-sizing: border-box;" />apt install redis -y<br style="box-sizing: border-box;" />查看redis是否启动成功。</p>
<p style="box-sizing: border-box; margin-bottom: 16px; margin-top: 0px; color: #24292e; font-family: -apple-system, BlinkMacSystemFont, ''Segoe UI'', Helvetica, Arial, sans-serif, ''Apple Color Emoji'', ''Segoe UI Emoji'', ''Segoe UI Symbol''; font-size: 14px; background-color: #ffffff;">5、安装Jexus<br style="box-sizing: border-box;" />运行如下命令安装Jexus<br style="box-sizing: border-box;" />curl&nbsp;<a style="box-sizing: border-box; background-color: transparent; color: #0366d6; text-decoration-line: none;" href="https://jexus.org/release/x64/install.sh%7Csudo" rel="nofollow">https://jexus.org/release/x64/install.sh|sudo</a>&nbsp;sh</p>
<p style="box-sizing: border-box; margin-bottom: 16px; margin-top: 0px; color: #24292e; font-family: -apple-system, BlinkMacSystemFont, ''Segoe UI'', Helvetica, Arial, sans-serif, ''Apple Color Emoji'', ''Segoe UI Emoji'', ''Segoe UI Symbol''; font-size: 14px; background-color: #ffffff;">6、安装Sql Server on Linux<br style="box-sizing: border-box;" />官方说明已经很详细了，这里不多说了。<br style="box-sizing: border-box;" /><a style="box-sizing: border-box; background-color: transparent; color: #0366d6; text-decoration-line: none;" href="https://docs.microsoft.com/zh-cn/sql/linux/sql-server-linux-setup?view=sql-server-2017" rel="nofollow">https://docs.microsoft.com/zh-cn/sql/linux/sql-server-linux-setup?view=sql-server-2017</a></p>
<p style="box-sizing: border-box; margin-bottom: 16px; margin-top: 0px; color: #24292e; font-family: -apple-system, BlinkMacSystemFont, ''Segoe UI'', Helvetica, Arial, sans-serif, ''Apple Color Emoji'', ''Segoe UI Emoji'', ''Segoe UI Symbol''; font-size: 14px; background-color: #ffffff;">7、用SQL Server management Studio连接数据库，执行项目doc目录下的数据库表结构脚本.sql和项目初始化数据脚本.sql两个文件建立数据库及表。<br style="box-sizing: border-box;" />在执行sql文件之前需要对数据库表结构脚本.sql里的内容，做一些修改，修改的内容主要是：<br style="box-sizing: border-box;" />( NAME = N''MangoDB'', FILENAME = N''/var/opt/mssql/data/MangoDB.mdf'' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )<br style="box-sizing: border-box;" />LOG ON<br style="box-sizing: border-box;" />( NAME = N''MangoDB_log'', FILENAME = N''/var/opt/mssql/data/MangoDB_log.ldf'' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )<br style="box-sizing: border-box;" />然后分别运行数据库表结构脚本.sql和项目初始化数据脚本.sql两个文件，建立数据库及表。</p>
<p style="box-sizing: border-box; margin-bottom: 16px; margin-top: 0px; color: #24292e; font-family: -apple-system, BlinkMacSystemFont, ''Segoe UI'', Helvetica, Arial, sans-serif, ''Apple Color Emoji'', ''Segoe UI Emoji'', ''Segoe UI Symbol''; font-size: 14px; background-color: #ffffff;">8、编辑Jexus的配置文件<br style="box-sizing: border-box;" />这是完整的配置文件：<br style="box-sizing: border-box;" />######################</p>
<p style="box-sizing: border-box; margin-bottom: 16px; margin-top: 0px; color: #24292e; font-family: -apple-system, BlinkMacSystemFont, ''Segoe UI'', Helvetica, Arial, sans-serif, ''Apple Color Emoji'', ''Segoe UI Emoji'', ''Segoe UI Symbol''; font-size: 14px; background-color: #ffffff;">Web Site: Default<br style="box-sizing: border-box;" />########################################<br style="box-sizing: border-box;" />port=80<br style="box-sizing: border-box;" />#root=/ /home/www.githall.cn<br style="box-sizing: border-box;" />hosts=www.githall.cn #OR your.com,*.your.com</p>
<p style="box-sizing: border-box; margin-bottom: 16px; margin-top: 0px; color: #24292e; font-family: -apple-system, BlinkMacSystemFont, ''Segoe UI'', Helvetica, Arial, sans-serif, ''Apple Color Emoji'', ''Segoe UI Emoji'', ''Segoe UI Symbol''; font-size: 14px; background-color: #ffffff;">User=www-data<br style="box-sizing: border-box;" />AspNet.Workers=2<br style="box-sizing: border-box;" />addr=0.0.0.0<br style="box-sizing: border-box;" />CheckQuery=false<br style="box-sizing: border-box;" />NoLog=true</p>
<p style="box-sizing: border-box; margin-bottom: 16px; margin-top: 0px; color: #24292e; font-family: -apple-system, BlinkMacSystemFont, ''Segoe UI'', Helvetica, Arial, sans-serif, ''Apple Color Emoji'', ''Segoe UI Emoji'', ''Segoe UI Symbol''; font-size: 14px; background-color: #ffffff;">NoFile=/index.php<br style="box-sizing: border-box;" />Keep_Alive=false<br style="box-sizing: border-box;" />UseGZIP=false<br style="box-sizing: border-box;" />UseHttps=true<br style="box-sizing: border-box;" />ssl.certificate=/x/xxx.crt #or pem<br style="box-sizing: border-box;" />ssl.certificatekey=/x/xxx.key<br style="box-sizing: border-box;" />ssl.protocol=TLSv1.0 # TLSv1.1 or TLSv1.2<br style="box-sizing: border-box;" />ssl.ciphers=<br style="box-sizing: border-box;" />#AppHost.Port=5000<br style="box-sizing: border-box;" />AppHost={cmd=dotnet /var/www/default/Mango.Web.dll; root=/var/www/default/; port=5000}</p>
<p style="box-sizing: border-box; margin-bottom: 16px; margin-top: 0px; color: #24292e; font-family: -apple-system, BlinkMacSystemFont, ''Segoe UI'', Helvetica, Arial, sans-serif, ''Apple Color Emoji'', ''Segoe UI Emoji'', ''Segoe UI Symbol''; font-size: 14px; background-color: #ffffff;">DenyFrom=192.168.i0.233, 192.168.1.*, 192.168.2.0/24<br style="box-sizing: border-box;" />AllowFrom=192.168..<br style="box-sizing: border-box;" />DenyDirs=~/cgi, ~/upfiles<br style="box-sizing: border-box;" />indexes=myindex.aspx<br style="box-sizing: border-box;" />rewrite=^/.+?.(asp|php|cgi|pl|sh)$ /index.aspx<br style="box-sizing: border-box;" />reproxy=/bbs/&nbsp;<a style="box-sizing: border-box; background-color: transparent; color: #0366d6; text-decoration-line: none;" href="http://192.168.1.112/bbs/" rel="nofollow">http://192.168.1.112/bbs/</a><br style="box-sizing: border-box;" />host.Redirect=abc.com&nbsp;<a style="box-sizing: border-box; background-color: transparent; color: #0366d6; text-decoration-line: none;" href="http://www.abc.com/" rel="nofollow">www.abc.com</a>&nbsp;301<br style="box-sizing: border-box;" />ResponseHandler.Add=myKey:myValue<br style="box-sizing: border-box;" />Jexus php fastcgi address is ''/var/run/jexus/phpsvr''<br style="box-sizing: border-box;" />#######################################################</p>
<p style="box-sizing: border-box; margin-bottom: 16px; margin-top: 0px; color: #24292e; font-family: -apple-system, BlinkMacSystemFont, ''Segoe UI'', Helvetica, Arial, sans-serif, ''Apple Color Emoji'', ''Segoe UI Emoji'', ''Segoe UI Symbol''; font-size: 14px; background-color: #ffffff;">fastcgi.add=php|socket:/var/run/jexus/phpsvr<br style="box-sizing: border-box;" />php-fpm listen address is ''127.0.0.1:9000''<br style="box-sizing: border-box;" />############################################</p>
<p style="box-sizing: border-box; margin-bottom: 16px; margin-top: 0px; color: #24292e; font-family: -apple-system, BlinkMacSystemFont, ''Segoe UI'', Helvetica, Arial, sans-serif, ''Apple Color Emoji'', ''Segoe UI Emoji'', ''Segoe UI Symbol''; font-size: 14px; background-color: #ffffff;">fastcgi.add=php|tcp:127.0.0.1:9000<br style="box-sizing: border-box;" />9、修改appsettings.json文件，其中<br style="box-sizing: border-box;" />server=127.0.0.1;database=MangoDB;uid=数据库用户名;pwd=数据库密码<br style="box-sizing: border-box;" />尤其要注意把redis的端口改为6379，项目默认的端口不是6379<br style="box-sizing: border-box;" />ConnectionString": "127.0.0.1:6379,password=123456"</p>
<p style="box-sizing: border-box; margin-bottom: 16px; margin-top: 0px; color: #24292e; font-family: -apple-system, BlinkMacSystemFont, ''Segoe UI'', Helvetica, Arial, sans-serif, ''Apple Color Emoji'', ''Segoe UI Emoji'', ''Segoe UI Symbol''; font-size: 14px; background-color: #ffffff;">10、启动Jexus<br style="box-sizing: border-box;" />sudo /usr/jexus/jws start<br style="box-sizing: border-box;" />重启是sudo /usr/jexus/jws restart</p>
<p style="box-sizing: border-box; margin-top: 0px; color: #24292e; font-family: -apple-system, BlinkMacSystemFont, ''Segoe UI'', Helvetica, Arial, sans-serif, ''Apple Color Emoji'', ''Segoe UI Emoji'', ''Segoe UI Symbol''; font-size: 14px; background-color: #ffffff; margin-bottom: 0px !important;">11、访问服务器ip地址或者域名，查看是否成功。<br style="box-sizing: border-box;" />至此部署完成。</p>
<p style="box-sizing: border-box; margin-top: 0px; color: #24292e; font-family: -apple-system, BlinkMacSystemFont, ''Segoe UI'', Helvetica, Arial, sans-serif, ''Apple Color Emoji'', ''Segoe UI Emoji'', ''Segoe UI Symbol''; font-size: 14px; background-color: #ffffff; margin-bottom: 0px !important;">&nbsp;</p>
<p style="box-sizing: border-box; margin-top: 0px; color: #24292e; font-family: -apple-system, BlinkMacSystemFont, ''Segoe UI'', Helvetica, Arial, sans-serif, ''Apple Color Emoji'', ''Segoe UI Emoji'', ''Segoe UI Symbol''; font-size: 14px; background-color: #ffffff; margin-bottom: 0px !important;">教程比较简单，欢迎交流：QQ：469888437</p>', CAST(N'2019-08-27T16:11:47.003' AS DateTime), CAST(N'2019-08-27T16:11:47.003' AS DateTime), 2037, 0, 237, 1, N'', N'', 0, 4)
INSERT [dbo].[m_CmsContents] ([ContentsId], [Title], [Contents], [PostTime], [LastTime], [AccountId], [PlusCount], [ReadCount], [StateCode], [Tags], [ImgUrl], [AnswerCount], [ChannelId]) VALUES (34, N'.Net Core 3.0 WEBAPI统一设置返回的时间格式', N'<p>.net core 3.0 webapi 对象换成JSON已经默认使用System.Text.Json来处理,在转换时间时总会返回这样的格式如下:</p>
<pre class=" microlight" style="box-sizing: border-box; font-family: monospace; font-size: 12px; margin: 0px; padding: 10px; white-space: pre-wrap; word-break: break-word; border-radius: 4px; background: #41444e; overflow-wrap: break-word; font-weight: 600; color: #ffffff; overflow-y: auto; max-height: 400px; min-height: 6em; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial;">2019-09-20 T00:00:00</pre>
<p>但是我们需要的是把T去掉,国内网站找了一圈没有找到相关的解决方案线索,最后还是从国外的程序员问答社区找到了类似的答案,然后自己按照那个规则改了过来.</p>
<p>首先我们自定义一个DateTime类型的转换类(类名:DateTimeToStringConverter),代码如下:</p>
<p>DateTimeToStringConverter类必须要继承自 JsonConverter&lt;DateTime&gt;(PS:这里的泛型表示只处理DateTime类型的字段)而且必须要重写Read与Write方法</p>
<pre class="language-csharp"><code>using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Text.Json;
using System.Text.Json.Serialization;
using System.Buffers.Text;
namespace MeiMengMeng.Web.MCore
{
    public class DateTimeToStringConverter:JsonConverter&lt;DateTime&gt;
    {
        public override DateTime Read(ref Utf8JsonReader reader, Type type, JsonSerializerOptions options)
        {
            return reader.GetDateTime();
        }

        public override void Write(Utf8JsonWriter writer, DateTime value, JsonSerializerOptions options)
        {
            //这里把时间格式做一个自顶一格式的转换就行
            writer.WriteStringValue(value.ToString("yyyy-MM-dd HH:mm:ss"));
        }
    }
}
</code></pre>
<p>然后我们在Startup.cs类中添加如下代码:</p>
<pre class="language-csharp"><code>services.AddControllers()
                .AddJsonOptions(options =&gt;
                {
                    options.JsonSerializerOptions.Converters.Add(new MCore.DateTimeToStringConverter());
                });</code></pre>
<p>PS:我们在设置JsonOptions属性时把我们上面定义的类添加进来即可.</p>', CAST(N'2019-09-18T14:07:45.423' AS DateTime), CAST(N'2019-09-18T14:07:45.423' AS DateTime), 2, 0, 263, 1, N'', N'', 0, 3)
INSERT [dbo].[m_CmsContents] ([ContentsId], [Title], [Contents], [PostTime], [LastTime], [AccountId], [PlusCount], [ReadCount], [StateCode], [Tags], [ImgUrl], [AnswerCount], [ChannelId]) VALUES (35, N'Asp.Net Core 3.0实现在类库中添加Microsoft.AspNetCore.App引用', N'<p>Asp.Net Core 3.0 并不能直接在类库项目中直接添加Microsoft.AspNetCore.App 相关类库的引用了,不过可以通过更改项目.csproj文件来实现</p>
<p>新建一个类库打开.csproj文件看到如下内容</p>
<pre class="language-csharp"><code>&lt;Project Sdk="Microsoft.NET.Sdk"&gt;

  &lt;PropertyGroup&gt;
    &lt;TargetFramework&gt;netcoreapp3.0&lt;/TargetFramework&gt;
  &lt;/PropertyGroup&gt;

&lt;/Project&gt;
</code></pre>
<p>我们将上面的内容替换成下面的内容:</p>
<pre class="language-csharp"><code>&lt;Project Sdk="Microsoft.NET.Sdk.Web"&gt;
  &lt;PropertyGroup&gt;
    &lt;TargetFramework&gt;netcoreapp3.0&lt;/TargetFramework&gt;
    &lt;OutputType&gt;Library&lt;/OutputType&gt;
  &lt;/PropertyGroup&gt;
&lt;/Project&gt;</code></pre>
<p>看到区别在哪没,就是将Microsoft.NET.Sdk改成了 Microsoft.NET.Sdk.Web,然后在&lt;PropertyGroup&gt;节点下增加 &lt;OutputType&gt;Library&lt;/OutputType&gt; 节点,表示把这个项目输出类型还是设定为 类库项目.</p>
<p>接下来看结果(如下图):</p>
<p><img src="https://file.51core.net/2/2019/9/deff96f001ce49fcbe0ad1e6504ac506.png" /></p>', CAST(N'2019-09-26T11:43:59.667' AS DateTime), CAST(N'2019-09-26T11:43:59.667' AS DateTime), 2, 2, 213, 1, N'', N'', 0, 3)
SET IDENTITY_INSERT [dbo].[m_CmsContents] OFF
SET IDENTITY_INSERT [dbo].[m_Docs] ON 

INSERT [dbo].[m_Docs] ([DocsId], [Title], [ShortTitle], [Contents], [AppendTime], [LastTime], [ThemeId], [AccountId], [ReadCount], [PlusCount], [Tags], [VersionText], [IsShow], [IsAudit]) VALUES (4, N'在微信小程序中使用WebSocket连接Asp.Net Core SignalR', N'微信小程序连接SignalR', N'<p>&nbsp; &nbsp; &nbsp; &nbsp;最近在公司开发一个小程序时,需要使用到实时通信,然后在网上找了相关资料进行改进和封装,现在把整个DEMO分享出来.</p>
<p><strong>组件版本信息:</strong></p>
<p>Asp.Net Core SignalR 1.1.0版本</p>
<p>微信小程序使用腾讯默认的测试APPID,调试基础库基于2.7.1版本</p>
<p><strong>Asp.Net Core SignalR服务端:</strong></p>
<p>1.创建一个项目名为Mango.SignalR.WeChat空模板项目(这里不使用WEBAPI和MVC),这里同时创建一个Chat目录用来存放SignalR的封装类文件</p>
<p><img src="https://file.51core.net/2/2019/6/ff0559013ca14e28a210be86a64aed87.png" /></p>
<p>2.使用Nuget引入Microsoft.AspNetCore.SignalR组件包</p>
<p><img src="https://file.51core.net/2/2019/6/549cc3c141314a4fa8c798aab5e9a84f.png" /></p>
<p>3.创建好一些基础处理类</p>
<p><img src="https://file.51core.net/2/2019/6/ebf35a3ee36c47a8acf868a02072a49b.png" /></p>
<p>说明:</p>
<p>ChatCore类:负责处理消息发送等业务逻辑</p>
<pre class="language-csharp"><code>using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.SignalR;
using Newtonsoft.Json;
namespace Mango.SignalR.WeChat.Chat
{
    public class ChatCore
    {

        ///
        /// 发送聊天室消息
        /// 
        ///
        ///
        public static void SendMessage(ChatHub chatHub, MessageData messageData)
        {
            //
            var sendMsg = JsonConvert.SerializeObject(messageData);
            foreach (ConnectionUser user in ConnectionManager.ConnectionUsers)
            {
                chatHub.Clients.Client(user.ConnectionId).SendAsync("receive", sendMsg);
            }
        }
    }
}
</code></pre>
<p>ConnectionUser类:表示连接用户对象</p>
<pre class="language-csharp"><code>using System;
using System.Collections.Generic;
using System.Text;

namespace Mango.SignalR.WeChat.Chat
{
    public class ConnectionUser
    {
        ///
        /// 用户标识
        /// 
        public string UserId { get; set; }
        ///
        /// SignalR连接ID
        /// 
        public string ConnectionId { get; set; }
    }
}
</code></pre>
<p>ConnectionManager类:存储用户连接信息</p>
<pre class="language-csharp"><code>using System;
using System.Collections.Generic;
using System.Text;
namespace Mango.SignalR.WeChat.Chat
{
    public class ConnectionManager
    {
        public static List ConnectionUsers { get; set; } = new List();
    }
}
</code></pre>
<p>MessageData类:消息体格式定义</p>
<pre class="language-csharp"><code>using System;
using System.Collections.Generic;
using System.Text;

namespace Mango.SignalR.WeChat.Chat
{
    public class MessageData
    {
        ///
        /// 消息类型
        /// 
        public MessageType MessageType { get; set; }
        ///
        /// 发送用户(0表示系统消息发送用户)
        /// 
        public string SendUserId { get; set; }
        ///
        /// 消息内容
        /// 
        public string MessageBody { get; set; }
    }
}
</code></pre>
<p>MessageDealWidth类:处理客户端发送的消息</p>
<pre class="language-csharp"><code>using System;
using System.Collections.Generic;
using System.Text;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;
using Microsoft.AspNetCore.SignalR;
using Newtonsoft.Json;
namespace Mango.SignalR.WeChat.Chat
{
    ///
    /// 消息处理
    /// 
    public class MessageDealWidth
    {
        public static async Task DealWidth(string message,ChatHub chatHub)
        {
            await Task.Run(() =&gt; {
                try
                {
                    MessageData data = JsonConvert.DeserializeObject(message);
                    if (data != null)
                    {
                        ConnectionUser connectionUser = null;
                        MessageData sendMsg = null;
                        switch (data.MessageType)
                        {
                            case MessageType.Line:
                                connectionUser = ConnectionManager.ConnectionUsers.Where(m =&gt; m.ConnectionId == chatHub.Context.ConnectionId).FirstOrDefault();
                                //处理连接消息
                                if (connectionUser == null)
                                {
                                    connectionUser = new ConnectionUser();
                                    connectionUser.ConnectionId = chatHub.Context.ConnectionId;
                                    connectionUser.UserId = data.SendUserId;
                                    ConnectionManager.ConnectionUsers.Add(connectionUser);
                                }
                                //处理发送回执消息
                                sendMsg = new MessageData();
                                sendMsg.MessageBody = "";
                                sendMsg.MessageType = MessageType.LineReceipt;
                                sendMsg.SendUserId = "0";
                                chatHub.Clients.Client(chatHub.Context.ConnectionId).SendAsync("receive", JsonConvert.SerializeObject(sendMsg));
                                break;
                            case MessageType.Text:
                                //处理普通文字消息
                                ChatCore.SendMessage(chatHub, data);
                                break;
                            case MessageType.LineReceipt:
                                //处理连接回执消息
                                ChatCore.SendMessage(chatHub, data);
                                break;
                        }
                    }
                }
                catch (Exception ex)
                {
                    Console.WriteLine(ex.Message);
                }
            });
        }
    }
}
</code></pre>
<p>MessageType类:消息类型枚举类</p>
<pre class="language-csharp"><code>using System;

namespace Mango.SignalR.WeChat.Chat
{
    ///
    /// 消息类型
    /// 
    public enum MessageType
    {
        ///
        /// 连接消息
        /// 
        Line=1,
        ///
        /// 文字消息
        /// 
        Text=2,
        ///
        /// 连接回执消息
        /// 
        LineReceipt = 98,
    }
}
</code></pre>
<p>4.创建一个ChatHub的类并且继承Hub父类,代码如下:</p>
<pre class="language-csharp"><code>using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.SignalR;
using Newtonsoft.Json;
namespace Mango.SignalR.WeChat.Chat
{
    public class ChatHub : Hub
    {
        ///
        /// 服务器端中转消息处理方法
        /// 
        ///
        /// 
        public async Task ServerTransferMessage(string message)
        {
            await MessageDealWidth.DealWidth(message, this);
        }
        ///
        /// 用户连接方法重写
        /// 
        /// 
        public override Task OnConnectedAsync()
        {
            return base.OnConnectedAsync();
        }
        ///
        /// 用户断开连接方法重写
        /// 
        ///
        /// 
        public override Task OnDisconnectedAsync(Exception exception)
        {
            try
            {
                var item = ConnectionManager.ConnectionUsers.Where(m =&gt; m.ConnectionId == Context.ConnectionId).FirstOrDefault();
                //移除相关联用户
                ConnectionManager.ConnectionUsers.Remove(item);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return base.OnDisconnectedAsync(exception);
        }
    }
}
</code></pre>
<p>5.在Startup类中添加并且启用SignalR组件</p>
<pre class="language-csharp"><code>using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.DependencyInjection;
using Mango.SignalR.WeChat.Chat;
namespace Mango.SignalR.WeChat
{
    public class Startup
    {
        // This method gets called by the runtime. Use this method to add services to the container.
        // For more information on how to configure your application, visit https://go.microsoft.com/fwlink/?LinkID=398940
        public void ConfigureServices(IServiceCollection services)
        {
            //添加SignalR
            services.AddSignalR();
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IHostingEnvironment env)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }
            //启用Signalr
            app.UseSignalR(routes =&gt;
            {
                routes.MapHub("/ChatHub");
            });
            app.Run(async (context) =&gt;
            {
                await context.Response.WriteAsync("SignalR Success!");
            });
        }
    }
}
</code></pre>
<p>6.把SignalR服务端部署到服务器上</p>
<p>PS:由于微信小程序的特殊性需要使用HTTPS,所以这里我已经提供了一个公共测试域名https://123.51core.net</p>
<p><strong>微信小程序端:</strong></p>
<p>1.使用微信开发者工具创建一个用于测试的项目</p>
<p><img src="https://file.51core.net/2/2019/6/a31cee9adaf8412aa9782942e6376184.png" /></p>
<p>2.在lib目录中创建<span style="background-color: #fffffe; font-family: Consolas; font-size: 14px; white-space: pre;">signalR.js文件,这个文件封装一个WebSocket处理模块</span></p>
<pre class="language-javascript"><code>var signalR = (function () {
  let recordCode = 0x1e;
  let recordString = String.fromCharCode(recordCode);
  let isConnectioned = false;
  let _events=new Array();
  //初始化相关事件
  //消息发送事件
  _events[''send''] = function (obj) {
    console.log(obj);
  };
  //消息接收事件
  _events[''receive'']=function(message){
    console.log(message);
  };
  //连接事件
  _events[''connection'']= function () {
    console.log(message);
  };
  //连接关闭事件
  _events[''close'']= function () {
    console.log(''连接已经关闭'');
  };
  //连接异常处理事件
  _events[''error''] = function (ex) {
    console.log(ex);
  };
  return {
    //事件绑定
    on:function(eventName,eventMethod){
      if (_events[eventName] != null &amp;&amp; _events[eventName]!=undefined){
        _events[eventName] = eventMethod;
      }
    },
    //连接方法
    connection: function (url) {
      let self = this;
      wx.connectSocket({
        url: url
      });
      wx.onSocketOpen(function () {
        let handshakeRequest = {
          protocol: ''json'',
          version: 1
        };
        let senddata = `${JSON.stringify(handshakeRequest)}${recordString}`;
        self.isConnectioned = true;
        wx.sendSocketMessage({
          data: senddata,
        });
        _events[''connection'']();
      });
      wx.onSocketClose(function () {
        self.isConnectioned = false;
        _events[''close'']();
      });
      //接收到消息
      wx.onSocketMessage(function (res) {
        try {
          //console.log(res);
          let jsonstr = String(res.data).replace(recordString, '''');
          if (jsonstr.indexOf(''{}{'') &gt; -1){
            jsonstr = jsonstr.replace(''{}'', '''');
          }
          let obj = JSON.parse(jsonstr);
          //当收到返回消息type=1（调用方法）
          if (obj.type == 1) {
            _events[''receive''](obj.arguments[0]);
          }
        } catch (ex) {
          console.log(''异常：'' + ex);
          console.log(''收到服务器内容：'' + res.data);
        }
      });
      wx.onSocketError(function (ex) {
        self.isConnectioned = false;
        _events[''error''](ex);
      });
    },
    abortConnection: function () {
      console.log(String(this.abortConnection.name));
      wx.closeSocket();
    },
    sendMessage: function (data) {
      let self = this;
      if (!self.isConnectioned) {
        _events[''error''](''未连接'');
        return;
      }
      let args=new Array();
      args.push(data);
      let body = {
        arguments: args,   //SignalR服务端接收时必须为数组参数
        target: ''ServerTransferMessage'',        //SignalR端方法
        type: 1,
      };
      //发送的数据，分隔符结尾：
      let senddata = `${JSON.stringify(body)}${recordString}`;
      wx.sendSocketMessage({
        data: senddata,
        success: function(res){
          _events[''send''](res);
        },
        fail: function(ex){
          console.log(ex);
        }
      });
    }
  }
});
module.exports = {
  signalR: signalR
}</code></pre>
<p>2.在index.js中调用</p>
<pre class="language-javascript"><code>//index.js
///引入这个类库
var signalR = require(''../../lib/signalR.js'')
//获取应用实例
const app = getApp()

Page({
  data: {
    motto: ''微信连接SignalR的Demo''
  },
  onLoad: function () {
    //测试WebSocket
    ///实例化一个对象
    let _signalR = new signalR.signalR();
    _signalR.on("receive", function (message) {
      console.log(''服务器返回消息回调方法:'' + message);
    });
    _signalR.on("connection", function () {
      //消息格式
      var msg = {
        messageType: 1,//消息类型 1.发送连接消息 2.普通内容消息 98.连接回执消息
        sendUserId: ''1'',//消息发送人(登录用户ID)
        messageBody: ''online''//消息内容
      };
      _signalR.sendMessage(JSON.stringify(msg));
    });
    _signalR.connection(''wss://123.51core.net/ChatHub'');
  }
})
</code></pre>
<p>&nbsp;接下来就可以查看运行结果了,如下图：</p>
<p><img src="https://file.51core.net/2/2019/6/fc59814aa39a45e19a1cf4ac8dc2d06d.png" /></p>
<p>本案例源代码已经更新到github上,欢迎大家下载</p>
<p><a href="https://github.com/51core/mango-docs" target="_blank" rel="noopener">https://github.com/51core/mango-docs</a></p>', CAST(N'2019-03-24T16:45:46.640' AS DateTime), CAST(N'2019-06-11T14:57:59.340' AS DateTime), 7, 2, 524, 0, N'', N'', 1, 1)
INSERT [dbo].[m_Docs] ([DocsId], [Title], [ShortTitle], [Contents], [AppendTime], [LastTime], [ThemeId], [AccountId], [ReadCount], [PlusCount], [Tags], [VersionText], [IsShow], [IsAudit]) VALUES (5, N'如何使用Asp.Net Core SignalR?', N'使用Asp.Net Core SignalR', N'<p>如何使用Asp.Net Core SignalR?</p>', CAST(N'2019-03-24T16:46:58.900' AS DateTime), CAST(N'2019-06-11T14:59:39.500' AS DateTime), 7, 2, 378, 2, N'', N'', 1, 1)
INSERT [dbo].[m_Docs] ([DocsId], [Title], [ShortTitle], [Contents], [AppendTime], [LastTime], [ThemeId], [AccountId], [ReadCount], [PlusCount], [Tags], [VersionText], [IsShow], [IsAudit]) VALUES (6, N'Asp.Net Core MVC路由以及区域创建', N'路由/区域创建', N'<p><strong>一:路由</strong></p>
<p>1.创建项目时默认的路由设置：</p>
<pre class="language-csharp"><code>        public void Configure(IApplicationBuilder app, IHostingEnvironment env)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }
            else
            {
                app.UseExceptionHandler("/Home/Error");
            }

            app.UseStaticFiles();
            app.UseCookiePolicy();

            app.UseMvc(routes =&gt;
            {
                routes.MapRoute(
                    name: "default",
                    template: "{controller=Home}/{action=Index}/{id?}");
            });
        }</code></pre>
<p>2.自定义路由：</p>
<pre class="language-csharp"><code>using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;

namespace Mango.Web.Controllers
{
   
    public class PassportController : Controller
    {
        [Route("/user/passport/login")]
        public IActionResult Login()
        {
            return View();
        }
    }
}</code></pre>
<p>3.在自定义路由器设置指定参数:</p>
<pre class="language-csharp"><code>        /// &lt;summary&gt;
        /// 自定义路由设置指定参数
        /// &lt;/summary&gt;
        /// &lt;param name="tag"&gt;&lt;/param&gt;
        /// &lt;param name="fromurl"&gt;&lt;/param&gt;
        /// &lt;returns&gt;&lt;/returns&gt;
        [Route("/user/passport/register/{tag}/{fromurl}")]
        public IActionResult Register(string tag,string fromurl)
        {
            return View();
        }</code></pre>
<p>浏览效果:</p>
<p><img src="https://file.51core.net/2/2019/4/8158321f526c464b8e77fc5deaa1d064.png" width="666" height="201" /></p>
<p><strong>二:创建区域</strong></p>
<p>1.右键创建一个名为Admin的区域</p>
<p><img src="https://file.51core.net/2/2019/4/31174188581c408eb7c67b6ebedf0f9f.png" /></p>
<p>2.在Startup类中设置区域路由</p>
<pre class="language-csharp"><code>        public void Configure(IApplicationBuilder app, IHostingEnvironment env)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }
            else
            {
                app.UseExceptionHandler("/Home/Error");
            }

            app.UseStaticFiles();
            app.UseCookiePolicy();

            app.UseMvc(routes =&gt;
            {
                //区域路由设置
                routes.MapRoute(
                    name: "area",
                    template: "{area:exists}/{controller=Home}/{action=Index}/{id?}");

                //默认路由
                routes.MapRoute(
                    name: "default",
                    template: "{controller=Home}/{action=Index}/{id?}");
            });
        }</code></pre>
<p>3.在Admin区域中创建一个Test控制器:</p>
<pre class="language-csharp"><code>using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;

namespace Mango.Web.Areas.Admin.Controllers
{
    /// &lt;summary&gt;
    /// 在区域的控制器中必须要使用Area特性标识为Admin区域中的控制器
    /// &lt;/summary&gt;
    [Area("Admin")]
    public class TestController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}</code></pre>
<p>预览效果：</p>
<p><img src="https://file.51core.net/2/2019/4/dded7232c1a94aba9aaa6f4686a61059.png" /></p>', CAST(N'2019-04-17T23:22:54.983' AS DateTime), CAST(N'2019-04-17T23:22:54.983' AS DateTime), 6, 2, 296, 1, N'', N'', 1, 1)
SET IDENTITY_INSERT [dbo].[m_Docs] OFF
SET IDENTITY_INSERT [dbo].[m_DocsTheme] ON 

INSERT [dbo].[m_DocsTheme] ([ThemeId], [Title], [Contents], [AccountId], [AppendTime], [LastTime], [ReadCount], [PlusCount], [Tags], [VersionText], [IsShow]) VALUES (6, N'Asp.Net Core MVC开发使用教程文档', N'<p>本教程基于Asp.Net Core MVC 框架</p>
<p>.Net Core 2.2版本,通过多个开发中常用的功能来了解Asp.Net Core MV框架的使用.</p>
<p>文档案例源代码地址:</p>
<p><a title="Asp.Net教程文档源代码地址" href="https://github.com/51core/mango-docs/tree/master/src/Mango.AspNetCoreMVCDemo" target="_blank" rel="noopener">https://github.com/51core/mango-docs/tree/master/src/Mango.AspNetCoreMVCDemo</a></p>
<p>&nbsp;</p>', 2, CAST(N'2019-03-22T16:50:47.003' AS DateTime), CAST(N'2019-04-17T23:26:25.457' AS DateTime), 383, 1, N'', N'', 1)
INSERT [dbo].[m_DocsTheme] ([ThemeId], [Title], [Contents], [AccountId], [AppendTime], [LastTime], [ReadCount], [PlusCount], [Tags], [VersionText], [IsShow]) VALUES (7, N'SignalR通信框架使用案例文档', N'<p>本文档会介绍SignalR通信基础使用,通过一个消息推送案例以及一个聊天室案例来介绍SignalR的使用</p>', 2, CAST(N'2019-03-22T16:51:13.200' AS DateTime), CAST(N'2019-03-28T21:58:11.260' AS DateTime), 367, 3, N'', N'', 1)
SET IDENTITY_INSERT [dbo].[m_DocsTheme] OFF
SET IDENTITY_INSERT [dbo].[m_ManagerAccount] ON 

INSERT [dbo].[m_ManagerAccount] ([AdminId], [AdminName], [Password], [IsStatus], [RoleId]) VALUES (1, N'admin', N'e10adc3949ba59abbe56e057f20f883e', 1, 2)
INSERT [dbo].[m_ManagerAccount] ([AdminId], [AdminName], [Password], [IsStatus], [RoleId]) VALUES (2, N'admin123', N'e10adc3949ba59abbe56e057f20f883e', 1, 1)
SET IDENTITY_INSERT [dbo].[m_ManagerAccount] OFF
SET IDENTITY_INSERT [dbo].[m_ManagerMenu] ON 

INSERT [dbo].[m_ManagerMenu] ([MenuId], [MenuName], [AreaName], [ControllerName], [ActionName], [ParentId], [IsPower]) VALUES (104, N'系统设置', NULL, NULL, NULL, 0, 0)
INSERT [dbo].[m_ManagerMenu] ([MenuId], [MenuName], [AreaName], [ControllerName], [ActionName], [ParentId], [IsPower]) VALUES (105, N'内容管理', NULL, NULL, NULL, 0, 0)
INSERT [dbo].[m_ManagerMenu] ([MenuId], [MenuName], [AreaName], [ControllerName], [ActionName], [ParentId], [IsPower]) VALUES (106, N'用户管理', NULL, NULL, NULL, 0, 0)
INSERT [dbo].[m_ManagerMenu] ([MenuId], [MenuName], [AreaName], [ControllerName], [ActionName], [ParentId], [IsPower]) VALUES (107, N'管理员账号', NULL, N'ManagerAccount', N'Index', 104, 1)
INSERT [dbo].[m_ManagerMenu] ([MenuId], [MenuName], [AreaName], [ControllerName], [ActionName], [ParentId], [IsPower]) VALUES (108, N'系统角色管理', NULL, N'ManagerRole', N'Index', 104, 1)
INSERT [dbo].[m_ManagerMenu] ([MenuId], [MenuName], [AreaName], [ControllerName], [ActionName], [ParentId], [IsPower]) VALUES (109, N'系统权限菜单', NULL, N'ManagerMenu', N'Index', 104, 1)
INSERT [dbo].[m_ManagerMenu] ([MenuId], [MenuName], [AreaName], [ControllerName], [ActionName], [ParentId], [IsPower]) VALUES (110, N'标签管理', NULL, N'Posts', N'Tags', 105, 1)
INSERT [dbo].[m_ManagerMenu] ([MenuId], [MenuName], [AreaName], [ControllerName], [ActionName], [ParentId], [IsPower]) VALUES (111, N'帖子管理', NULL, N'Posts', N'Index', 105, 1)
INSERT [dbo].[m_ManagerMenu] ([MenuId], [MenuName], [AreaName], [ControllerName], [ActionName], [ParentId], [IsPower]) VALUES (112, N'文章管理', NULL, N'Article', N'Index', 105, 1)
INSERT [dbo].[m_ManagerMenu] ([MenuId], [MenuName], [AreaName], [ControllerName], [ActionName], [ParentId], [IsPower]) VALUES (113, N'用户列表', NULL, N'User', N'Index', 106, 1)
INSERT [dbo].[m_ManagerMenu] ([MenuId], [MenuName], [AreaName], [ControllerName], [ActionName], [ParentId], [IsPower]) VALUES (114, N'用户组', NULL, N'User', N'Group', 106, 1)
INSERT [dbo].[m_ManagerMenu] ([MenuId], [MenuName], [AreaName], [ControllerName], [ActionName], [ParentId], [IsPower]) VALUES (115, N'用户组权限菜单', NULL, N'User', N'Menu', 106, 1)
INSERT [dbo].[m_ManagerMenu] ([MenuId], [MenuName], [AreaName], [ControllerName], [ActionName], [ParentId], [IsPower]) VALUES (116, N'网址导航', NULL, N'Navigation', N'Index', 105, 1)
INSERT [dbo].[m_ManagerMenu] ([MenuId], [MenuName], [AreaName], [ControllerName], [ActionName], [ParentId], [IsPower]) VALUES (117, N'导航分类', NULL, N'Navigation', N'Classify', 105, 1)
INSERT [dbo].[m_ManagerMenu] ([MenuId], [MenuName], [AreaName], [ControllerName], [ActionName], [ParentId], [IsPower]) VALUES (118, N'清理系统缓存', NULL, N'ManagerSystem', N'Cache', 104, 1)
INSERT [dbo].[m_ManagerMenu] ([MenuId], [MenuName], [AreaName], [ControllerName], [ActionName], [ParentId], [IsPower]) VALUES (119, N'网站基础数据设置', NULL, N'WebSite', N'Config', 104, 1)
INSERT [dbo].[m_ManagerMenu] ([MenuId], [MenuName], [AreaName], [ControllerName], [ActionName], [ParentId], [IsPower]) VALUES (120, N'网站导航', NULL, N'WebSIte', N'Navigation', 104, 1)
INSERT [dbo].[m_ManagerMenu] ([MenuId], [MenuName], [AreaName], [ControllerName], [ActionName], [ParentId], [IsPower]) VALUES (121, N'帖子频道', NULL, N'Posts', N'Channel', 105, 1)
INSERT [dbo].[m_ManagerMenu] ([MenuId], [MenuName], [AreaName], [ControllerName], [ActionName], [ParentId], [IsPower]) VALUES (122, N'文档主题管理', NULL, N'Docs', N'Theme', 105, 1)
SET IDENTITY_INSERT [dbo].[m_ManagerMenu] OFF
SET IDENTITY_INSERT [dbo].[m_ManagerPower] ON 

INSERT [dbo].[m_ManagerPower] ([PowerId], [MenuId], [RoleId]) VALUES (97, 104, 4)
INSERT [dbo].[m_ManagerPower] ([PowerId], [MenuId], [RoleId]) VALUES (98, 107, 4)
INSERT [dbo].[m_ManagerPower] ([PowerId], [MenuId], [RoleId]) VALUES (99, 108, 4)
INSERT [dbo].[m_ManagerPower] ([PowerId], [MenuId], [RoleId]) VALUES (100, 109, 4)
INSERT [dbo].[m_ManagerPower] ([PowerId], [MenuId], [RoleId]) VALUES (101, 118, 4)
INSERT [dbo].[m_ManagerPower] ([PowerId], [MenuId], [RoleId]) VALUES (102, 105, 4)
INSERT [dbo].[m_ManagerPower] ([PowerId], [MenuId], [RoleId]) VALUES (103, 110, 4)
INSERT [dbo].[m_ManagerPower] ([PowerId], [MenuId], [RoleId]) VALUES (104, 111, 4)
INSERT [dbo].[m_ManagerPower] ([PowerId], [MenuId], [RoleId]) VALUES (105, 112, 4)
INSERT [dbo].[m_ManagerPower] ([PowerId], [MenuId], [RoleId]) VALUES (106, 116, 4)
INSERT [dbo].[m_ManagerPower] ([PowerId], [MenuId], [RoleId]) VALUES (107, 117, 4)
INSERT [dbo].[m_ManagerPower] ([PowerId], [MenuId], [RoleId]) VALUES (108, 106, 4)
INSERT [dbo].[m_ManagerPower] ([PowerId], [MenuId], [RoleId]) VALUES (109, 113, 4)
INSERT [dbo].[m_ManagerPower] ([PowerId], [MenuId], [RoleId]) VALUES (110, 114, 4)
INSERT [dbo].[m_ManagerPower] ([PowerId], [MenuId], [RoleId]) VALUES (111, 115, 4)
INSERT [dbo].[m_ManagerPower] ([PowerId], [MenuId], [RoleId]) VALUES (162, 104, 2)
INSERT [dbo].[m_ManagerPower] ([PowerId], [MenuId], [RoleId]) VALUES (163, 113, 2)
INSERT [dbo].[m_ManagerPower] ([PowerId], [MenuId], [RoleId]) VALUES (164, 106, 2)
INSERT [dbo].[m_ManagerPower] ([PowerId], [MenuId], [RoleId]) VALUES (165, 122, 2)
INSERT [dbo].[m_ManagerPower] ([PowerId], [MenuId], [RoleId]) VALUES (166, 121, 2)
INSERT [dbo].[m_ManagerPower] ([PowerId], [MenuId], [RoleId]) VALUES (167, 117, 2)
INSERT [dbo].[m_ManagerPower] ([PowerId], [MenuId], [RoleId]) VALUES (168, 116, 2)
INSERT [dbo].[m_ManagerPower] ([PowerId], [MenuId], [RoleId]) VALUES (169, 114, 2)
INSERT [dbo].[m_ManagerPower] ([PowerId], [MenuId], [RoleId]) VALUES (170, 111, 2)
INSERT [dbo].[m_ManagerPower] ([PowerId], [MenuId], [RoleId]) VALUES (171, 120, 2)
INSERT [dbo].[m_ManagerPower] ([PowerId], [MenuId], [RoleId]) VALUES (172, 119, 2)
INSERT [dbo].[m_ManagerPower] ([PowerId], [MenuId], [RoleId]) VALUES (173, 118, 2)
INSERT [dbo].[m_ManagerPower] ([PowerId], [MenuId], [RoleId]) VALUES (174, 109, 2)
INSERT [dbo].[m_ManagerPower] ([PowerId], [MenuId], [RoleId]) VALUES (175, 108, 2)
INSERT [dbo].[m_ManagerPower] ([PowerId], [MenuId], [RoleId]) VALUES (176, 107, 2)
INSERT [dbo].[m_ManagerPower] ([PowerId], [MenuId], [RoleId]) VALUES (177, 105, 2)
INSERT [dbo].[m_ManagerPower] ([PowerId], [MenuId], [RoleId]) VALUES (178, 115, 2)
SET IDENTITY_INSERT [dbo].[m_ManagerPower] OFF
SET IDENTITY_INSERT [dbo].[m_ManagerRole] ON 

INSERT [dbo].[m_ManagerRole] ([RoleId], [RoleName]) VALUES (1, N'游客')
INSERT [dbo].[m_ManagerRole] ([RoleId], [RoleName]) VALUES (2, N'社区管理员')
SET IDENTITY_INSERT [dbo].[m_ManagerRole] OFF
SET IDENTITY_INSERT [dbo].[m_Message] ON 

INSERT [dbo].[m_Message] ([MessageId], [MessageType], [Contents], [PostTime], [AccountId], [AppendAccountId], [ObjectId], [IsRead]) VALUES (1, 10, N'<a href="javascript:void(0)">糊涂书生</a>&nbsp;回复了你的帖子&nbsp;<a href="javascript:void(0)">知乎趣味回复</a>&nbsp;', CAST(N'2018-11-21T18:12:54.637' AS DateTime), 2, 2, 3035, 1)
INSERT [dbo].[m_Message] ([MessageId], [MessageType], [Contents], [PostTime], [AccountId], [AppendAccountId], [ObjectId], [IsRead]) VALUES (2, 10, N'<a href="javascript:void(0)">糊涂书生</a>&nbsp;回复了你的帖子&nbsp;<a href="/posts/read/3035">知乎趣味回复</a>&nbsp;', CAST(N'2018-11-21T18:18:27.197' AS DateTime), 2, 2, 3035, 1)
INSERT [dbo].[m_Message] ([MessageId], [MessageType], [Contents], [PostTime], [AccountId], [AppendAccountId], [ObjectId], [IsRead]) VALUES (3, 11, N'<a href="javascript:void(0)">糊涂书生</a>&nbsp;评论了你的帖子回复&nbsp;<a href="/posts/read/3035">知乎趣味回复</a>&nbsp;', CAST(N'2018-11-21T18:30:58.257' AS DateTime), 2, 2, 3035, 1)
INSERT [dbo].[m_Message] ([MessageId], [MessageType], [Contents], [PostTime], [AccountId], [AppendAccountId], [ObjectId], [IsRead]) VALUES (4, 13, N'<a href="javascript:void(0)">糊涂书生</a>&nbsp;点赞了你的帖子回复&nbsp;<a href="/posts/read/3035">知乎趣味回复</a>&nbsp;', CAST(N'2018-11-22T10:28:20.860' AS DateTime), 2, 2, 3035, 1)
INSERT [dbo].[m_Message] ([MessageId], [MessageType], [Contents], [PostTime], [AccountId], [AppendAccountId], [ObjectId], [IsRead]) VALUES (5, 13, N'<a href="javascript:void(0)">糊涂书生</a>&nbsp;点赞了你的帖子回复&nbsp;<a href="/posts/read/3035">知乎趣味回复</a>&nbsp;', CAST(N'2018-11-22T10:28:22.803' AS DateTime), 2, 2, 3035, 1)
INSERT [dbo].[m_Message] ([MessageId], [MessageType], [Contents], [PostTime], [AccountId], [AppendAccountId], [ObjectId], [IsRead]) VALUES (6, 14, N'<a href="javascript:void(0)">糊涂书生</a>&nbsp;点赞了你的帖子评论&nbsp;<a href="/posts/read/3032">进行回答功能更新测试？</a>&nbsp;', CAST(N'2018-11-22T10:28:46.003' AS DateTime), 2, 2, 3032, 1)
INSERT [dbo].[m_Message] ([MessageId], [MessageType], [Contents], [PostTime], [AccountId], [AppendAccountId], [ObjectId], [IsRead]) VALUES (7, 14, N'<a href="javascript:void(0)">糊涂书生</a>&nbsp;点赞了你的帖子评论&nbsp;<a href="/posts/read/3032">进行回答功能更新测试？</a>&nbsp;', CAST(N'2018-11-22T10:28:47.757' AS DateTime), 2, 2, 3032, 1)
INSERT [dbo].[m_Message] ([MessageId], [MessageType], [Contents], [PostTime], [AccountId], [AppendAccountId], [ObjectId], [IsRead]) VALUES (8, 13, N'<a href="javascript:void(0)">糊涂书生</a>&nbsp;点赞了你的帖子回复&nbsp;<a href="/posts/read/3035">知乎趣味回复</a>&nbsp;', CAST(N'2018-11-22T17:52:58.007' AS DateTime), 2, 2, 3035, 1)
INSERT [dbo].[m_Message] ([MessageId], [MessageType], [Contents], [PostTime], [AccountId], [AppendAccountId], [ObjectId], [IsRead]) VALUES (9, 13, N'<a href="javascript:void(0)">糊涂书生</a>&nbsp;点赞了你的帖子回复&nbsp;<a href="/posts/read/3035">知乎趣味回复</a>&nbsp;', CAST(N'2018-11-22T18:17:45.770' AS DateTime), 2, 2, 3035, 1)
INSERT [dbo].[m_Message] ([MessageId], [MessageType], [Contents], [PostTime], [AccountId], [AppendAccountId], [ObjectId], [IsRead]) VALUES (10, 10, N'<a href="javascript:void(0)">糊涂书生</a>&nbsp;回复了你的帖子&nbsp;<a href="/posts/read/3035">知乎趣味回复</a>&nbsp;', CAST(N'2018-11-23T10:52:23.480' AS DateTime), 2, 2, 3035, 1)
INSERT [dbo].[m_Message] ([MessageId], [MessageType], [Contents], [PostTime], [AccountId], [AppendAccountId], [ObjectId], [IsRead]) VALUES (11, 11, N'<a href="javascript:void(0)">糊涂书生</a>&nbsp;评论了你的帖子回复&nbsp;<a href="/posts/read/3035">知乎趣味回复</a>&nbsp;', CAST(N'2018-11-23T10:52:38.610' AS DateTime), 2, 2, 3035, 1)
INSERT [dbo].[m_Message] ([MessageId], [MessageType], [Contents], [PostTime], [AccountId], [AppendAccountId], [ObjectId], [IsRead]) VALUES (12, 13, N'<a href="javascript:void(0)">糊涂书生</a>&nbsp;点赞了你的帖子回复&nbsp;<a href="/posts/read/3034">.NET Core 2.2 预览版P3发布了</a>&nbsp;', CAST(N'2018-11-23T14:57:24.823' AS DateTime), 2, 2, 3034, 1)
INSERT [dbo].[m_Message] ([MessageId], [MessageType], [Contents], [PostTime], [AccountId], [AppendAccountId], [ObjectId], [IsRead]) VALUES (13, 12, N'<a href="javascript:void(0)">糊涂书生</a>&nbsp;点赞了你的帖子&nbsp;<a href="/posts/read/3034" target="_blank">.NET Core 2.2 预览版P3发布了</a>&nbsp;', CAST(N'2018-11-23T17:16:06.050' AS DateTime), 2, 2, 3034, 1)
INSERT [dbo].[m_Message] ([MessageId], [MessageType], [Contents], [PostTime], [AccountId], [AppendAccountId], [ObjectId], [IsRead]) VALUES (14, 12, N'<a href="javascript:void(0)">糊涂书生</a>&nbsp;点赞了你的帖子&nbsp;<a href="/posts/read/3034" target="_blank">.NET Core 2.2 预览版P3发布了</a>&nbsp;', CAST(N'2018-11-23T17:16:11.597' AS DateTime), 2, 2, 3034, 1)
INSERT [dbo].[m_Message] ([MessageId], [MessageType], [Contents], [PostTime], [AccountId], [AppendAccountId], [ObjectId], [IsRead]) VALUES (15, 12, N'<a href="javascript:void(0)">糊涂书生</a>&nbsp;点赞了你的帖子&nbsp;<a href="/posts/read/3033" target="_blank">上传文件时如何获取到系统的根目录?</a>&nbsp;', CAST(N'2018-11-23T17:18:11.073' AS DateTime), 2, 2, 3033, 1)
INSERT [dbo].[m_Message] ([MessageId], [MessageType], [Contents], [PostTime], [AccountId], [AppendAccountId], [ObjectId], [IsRead]) VALUES (16, 12, N'<a href="javascript:void(0)">糊涂书生</a>&nbsp;点赞了你的帖子&nbsp;<a href="/posts/read/3032" target="_blank">进行回答功能更新测试？</a>&nbsp;', CAST(N'2018-11-23T17:58:13.600' AS DateTime), 2, 2, 3032, 1)
INSERT [dbo].[m_Message] ([MessageId], [MessageType], [Contents], [PostTime], [AccountId], [AppendAccountId], [ObjectId], [IsRead]) VALUES (17, 11, N'<a href="javascript:void(0)">糊涂书生</a>&nbsp;评论了你的帖子回复&nbsp;<a href="/posts/read/3032" target="_blank">进行回答功能更新测试？</a>&nbsp;', CAST(N'2018-11-29T14:47:13.107' AS DateTime), 2, 2, 3032, 1)
INSERT [dbo].[m_Message] ([MessageId], [MessageType], [Contents], [PostTime], [AccountId], [AppendAccountId], [ObjectId], [IsRead]) VALUES (18, 11, N'<a href="javascript:void(0)">糊涂书生</a>&nbsp;评论了你的帖子回复&nbsp;<a href="/posts/read/3032" target="_blank">进行回答功能更新测试？</a>&nbsp;', CAST(N'2018-11-29T14:47:26.783' AS DateTime), 2, 2, 3032, 1)
INSERT [dbo].[m_Message] ([MessageId], [MessageType], [Contents], [PostTime], [AccountId], [AppendAccountId], [ObjectId], [IsRead]) VALUES (19, 13, N'<a href="javascript:void(0)">测试开发</a>&nbsp;点赞了你的帖子回复&nbsp;<a href="/posts/read/3035" target="_blank">知乎趣味回复</a>&nbsp;', CAST(N'2018-11-29T15:02:08.657' AS DateTime), 2, 2022, 3035, 1)
INSERT [dbo].[m_Message] ([MessageId], [MessageType], [Contents], [PostTime], [AccountId], [AppendAccountId], [ObjectId], [IsRead]) VALUES (20, 11, N'<a href="javascript:void(0)">测试开发</a>&nbsp;评论了你的帖子回复&nbsp;<a href="/posts/read/3035" target="_blank">知乎趣味回复</a>&nbsp;', CAST(N'2018-11-29T15:02:16.497' AS DateTime), 2, 2022, 3035, 1)
INSERT [dbo].[m_Message] ([MessageId], [MessageType], [Contents], [PostTime], [AccountId], [AppendAccountId], [ObjectId], [IsRead]) VALUES (21, 11, N'<a href="javascript:void(0)">测试开发</a>&nbsp;评论了你的帖子回复&nbsp;<a href="/posts/read/3035" target="_blank">知乎趣味回复</a>&nbsp;', CAST(N'2018-11-29T15:02:35.673' AS DateTime), 2, 2022, 3035, 1)
INSERT [dbo].[m_Message] ([MessageId], [MessageType], [Contents], [PostTime], [AccountId], [AppendAccountId], [ObjectId], [IsRead]) VALUES (22, 11, N'<a href="javascript:void(0)">测试开发</a>&nbsp;评论了你的帖子回复&nbsp;<a href="/posts/read/3035" target="_blank">知乎趣味回复</a>&nbsp;', CAST(N'2018-11-29T15:03:00.583' AS DateTime), 2, 2022, 3035, 1)
INSERT [dbo].[m_Message] ([MessageId], [MessageType], [Contents], [PostTime], [AccountId], [AppendAccountId], [ObjectId], [IsRead]) VALUES (23, 12, N'<a href="javascript:void(0)">测试开发</a>&nbsp;点赞了你的帖子&nbsp;<a href="/posts/read/3034" target="_blank">.NET Core 2.2 预览版P3发布了</a>&nbsp;', CAST(N'2018-11-29T16:46:24.957' AS DateTime), 2, 2022, 3034, 1)
INSERT [dbo].[m_Message] ([MessageId], [MessageType], [Contents], [PostTime], [AccountId], [AppendAccountId], [ObjectId], [IsRead]) VALUES (24, 12, N'<a href="javascript:void(0)">测试开发</a>&nbsp;点赞了你的帖子&nbsp;<a href="/posts/read/3034" target="_blank">.NET Core 2.2 预览版P3发布了</a>&nbsp;', CAST(N'2018-11-29T16:46:27.067' AS DateTime), 2, 2022, 3034, 1)
INSERT [dbo].[m_Message] ([MessageId], [MessageType], [Contents], [PostTime], [AccountId], [AppendAccountId], [ObjectId], [IsRead]) VALUES (25, 12, N'<a href="javascript:void(0)">测试开发</a>&nbsp;点赞了你的帖子&nbsp;<a href="/posts/read/3033" target="_blank">上传文件时如何获取到系统的根目录?</a>&nbsp;', CAST(N'2018-11-29T16:49:09.880' AS DateTime), 2, 2022, 3033, 1)
INSERT [dbo].[m_Message] ([MessageId], [MessageType], [Contents], [PostTime], [AccountId], [AppendAccountId], [ObjectId], [IsRead]) VALUES (26, 12, N'<a href="javascript:void(0)">测试开发</a>&nbsp;点赞了你的帖子&nbsp;<a href="/posts/read/3033" target="_blank">上传文件时如何获取到系统的根目录?</a>&nbsp;', CAST(N'2018-11-29T16:49:11.473' AS DateTime), 2, 2022, 3033, 1)
INSERT [dbo].[m_Message] ([MessageId], [MessageType], [Contents], [PostTime], [AccountId], [AppendAccountId], [ObjectId], [IsRead]) VALUES (27, 12, N'<a href="javascript:void(0)">测试开发</a>&nbsp;点赞了你的帖子&nbsp;<a href="/posts/read/3033" target="_blank">上传文件时如何获取到系统的根目录?</a>&nbsp;', CAST(N'2018-11-29T16:49:15.500' AS DateTime), 2, 2022, 3033, 1)
INSERT [dbo].[m_Message] ([MessageId], [MessageType], [Contents], [PostTime], [AccountId], [AppendAccountId], [ObjectId], [IsRead]) VALUES (28, 12, N'<a href="javascript:void(0)">测试开发</a>&nbsp;点赞了你的帖子&nbsp;<a href="/posts/read/3033" target="_blank">上传文件时如何获取到系统的根目录?</a>&nbsp;', CAST(N'2018-11-29T16:49:18.450' AS DateTime), 2, 2022, 3033, 1)
INSERT [dbo].[m_Message] ([MessageId], [MessageType], [Contents], [PostTime], [AccountId], [AppendAccountId], [ObjectId], [IsRead]) VALUES (29, 12, N'<a href="javascript:void(0)">测试开发</a>&nbsp;点赞了你的帖子&nbsp;<a href="/posts/read/3033" target="_blank">上传文件时如何获取到系统的根目录?</a>&nbsp;', CAST(N'2018-11-29T16:49:23.250' AS DateTime), 2, 2022, 3033, 1)
INSERT [dbo].[m_Message] ([MessageId], [MessageType], [Contents], [PostTime], [AccountId], [AppendAccountId], [ObjectId], [IsRead]) VALUES (30, 12, N'<a href="javascript:void(0)">测试开发</a>&nbsp;点赞了你的帖子&nbsp;<a href="/posts/read/3033" target="_blank">上传文件时如何获取到系统的根目录?</a>&nbsp;', CAST(N'2018-11-29T16:49:26.000' AS DateTime), 2, 2022, 3033, 1)
INSERT [dbo].[m_Message] ([MessageId], [MessageType], [Contents], [PostTime], [AccountId], [AppendAccountId], [ObjectId], [IsRead]) VALUES (31, 12, N'<a href="javascript:void(0)">测试开发</a>&nbsp;点赞了你的帖子&nbsp;<a href="/posts/read/3033" target="_blank">上传文件时如何获取到系统的根目录?</a>&nbsp;', CAST(N'2018-11-29T16:49:40.770' AS DateTime), 2, 2022, 3033, 1)
INSERT [dbo].[m_Message] ([MessageId], [MessageType], [Contents], [PostTime], [AccountId], [AppendAccountId], [ObjectId], [IsRead]) VALUES (32, 12, N'<a href="javascript:void(0)">糊涂书生</a>&nbsp;点赞了你的帖子&nbsp;<a href="/posts/read/3033" target="_blank">上传文件时如何获取到系统的根目录?</a>&nbsp;', CAST(N'2018-12-05T10:44:04.373' AS DateTime), 2, 2, 3033, 1)
INSERT [dbo].[m_Message] ([MessageId], [MessageType], [Contents], [PostTime], [AccountId], [AppendAccountId], [ObjectId], [IsRead]) VALUES (33, 10, N'<a href="javascript:void(0)">糊涂书生</a>&nbsp;回复了你的帖子&nbsp;<a href="/posts/read/3050" target="_blank">使用Asp.Net Core MVC 开发项目实践[第六篇:TinyMCE富文本编辑器]</a>&nbsp;', CAST(N'2019-02-18T15:36:13.760' AS DateTime), 2, 2, 3050, 1)
INSERT [dbo].[m_Message] ([MessageId], [MessageType], [Contents], [PostTime], [AccountId], [AppendAccountId], [ObjectId], [IsRead]) VALUES (34, 12, N'<a href="javascript:void(0)">糊涂书生</a>&nbsp;点赞了你的帖子&nbsp;<a href="/posts/read/3050" target="_blank">使用Asp.Net Core MVC 开发项目实践[第六篇:TinyMCE富文本编辑器]</a>&nbsp;', CAST(N'2019-03-25T21:58:49.643' AS DateTime), 2, 2, 3050, 1)
INSERT [dbo].[m_Message] ([MessageId], [MessageType], [Contents], [PostTime], [AccountId], [AppendAccountId], [ObjectId], [IsRead]) VALUES (35, 12, N'<a href="javascript:void(0)">糊涂书生</a>&nbsp;点赞了你的帖子&nbsp;<a href="/posts/read/3050" target="_blank">使用Asp.Net Core MVC 开发项目实践[第六篇:TinyMCE富文本编辑器]</a>&nbsp;', CAST(N'2019-03-25T21:58:53.977' AS DateTime), 2, 2, 3050, 1)
INSERT [dbo].[m_Message] ([MessageId], [MessageType], [Contents], [PostTime], [AccountId], [AppendAccountId], [ObjectId], [IsRead]) VALUES (36, 12, N'<a href="javascript:void(0)">糊涂书生</a>&nbsp;点赞了你的帖子&nbsp;<a href="/posts/read/3051" target="_blank">代码编辑插入问题修复</a>&nbsp;', CAST(N'2019-03-26T13:05:06.300' AS DateTime), 2, 2, 3051, 1)
INSERT [dbo].[m_Message] ([MessageId], [MessageType], [Contents], [PostTime], [AccountId], [AppendAccountId], [ObjectId], [IsRead]) VALUES (37, 12, N'<a href="javascript:void(0)">糊涂书生</a>&nbsp;点赞了你的帖子&nbsp;<a href="/posts/read/3051" target="_blank">代码编辑插入问题修复</a>&nbsp;', CAST(N'2019-03-26T13:05:12.537' AS DateTime), 2, 2, 3051, 1)
INSERT [dbo].[m_Message] ([MessageId], [MessageType], [Contents], [PostTime], [AccountId], [AppendAccountId], [ObjectId], [IsRead]) VALUES (38, 20, N'<a href="javascript:void(0)">糊涂书生</a>&nbsp;点赞了你的文档主题&nbsp;<a href="/docs/read/0/2" target="_blank">文档测试标题2222</a>&nbsp;', CAST(N'2019-03-26T13:10:30.150' AS DateTime), 2, 2, 2, 1)
INSERT [dbo].[m_Message] ([MessageId], [MessageType], [Contents], [PostTime], [AccountId], [AppendAccountId], [ObjectId], [IsRead]) VALUES (39, 21, N'<a href="javascript:void(0)">糊涂书生</a>&nbsp;点赞了你的文档&nbsp;<a href="/docs/read/2/2" target="_blank">其实不懂什么才是好的文档项</a>&nbsp;', CAST(N'2019-03-26T13:10:42.193' AS DateTime), 2, 2, 2, 1)
INSERT [dbo].[m_Message] ([MessageId], [MessageType], [Contents], [PostTime], [AccountId], [AppendAccountId], [ObjectId], [IsRead]) VALUES (40, 20, N'<a href="javascript:void(0)">糊涂书生</a>&nbsp;点赞了你的文档主题&nbsp;<a href="/docs/read/0/2" target="_blank">文档测试标题2222</a>&nbsp;', CAST(N'2019-03-26T13:25:02.583' AS DateTime), 2, 2, 2, 1)
INSERT [dbo].[m_Message] ([MessageId], [MessageType], [Contents], [PostTime], [AccountId], [AppendAccountId], [ObjectId], [IsRead]) VALUES (41, 20, N'<a href="javascript:void(0)">糊涂书生</a>&nbsp;点赞了你的文档主题&nbsp;<a href="/docs/read/0/2" target="_blank">文档测试标题2222</a>&nbsp;', CAST(N'2019-03-26T13:25:06.293' AS DateTime), 2, 2, 2, 1)
INSERT [dbo].[m_Message] ([MessageId], [MessageType], [Contents], [PostTime], [AccountId], [AppendAccountId], [ObjectId], [IsRead]) VALUES (42, 20, N'<a href="javascript:void(0)">糊涂书生</a>&nbsp;点赞了你的文档主题&nbsp;<a href="/docs/read/0/2" target="_blank">文档测试标题2222</a>&nbsp;', CAST(N'2019-03-26T13:25:10.063' AS DateTime), 2, 2, 2, 1)
INSERT [dbo].[m_Message] ([MessageId], [MessageType], [Contents], [PostTime], [AccountId], [AppendAccountId], [ObjectId], [IsRead]) VALUES (43, 20, N'<a href="javascript:void(0)">糊涂书生</a>&nbsp;点赞了你的文档主题&nbsp;<a href="/docs/read/0/2" target="_blank">文档测试标题2222</a>&nbsp;', CAST(N'2019-03-26T13:25:12.333' AS DateTime), 2, 2, 2, 1)
INSERT [dbo].[m_Message] ([MessageId], [MessageType], [Contents], [PostTime], [AccountId], [AppendAccountId], [ObjectId], [IsRead]) VALUES (44, 20, N'<a href="javascript:void(0)">糊涂书生</a>&nbsp;点赞了你的文档主题&nbsp;<a href="/docs/read/0/2" target="_blank">文档测试标题2222</a>&nbsp;', CAST(N'2019-03-26T13:25:14.303' AS DateTime), 2, 2, 2, 1)
INSERT [dbo].[m_Message] ([MessageId], [MessageType], [Contents], [PostTime], [AccountId], [AppendAccountId], [ObjectId], [IsRead]) VALUES (45, 20, N'<a href="javascript:void(0)">糊涂书生</a>&nbsp;点赞了你的文档主题&nbsp;<a href="/docs/read/0/2" target="_blank">文档测试标题2222</a>&nbsp;', CAST(N'2019-03-26T13:25:29.927' AS DateTime), 2, 2, 2, 1)
INSERT [dbo].[m_Message] ([MessageId], [MessageType], [Contents], [PostTime], [AccountId], [AppendAccountId], [ObjectId], [IsRead]) VALUES (46, 20, N'<a href="javascript:void(0)">糊涂书生</a>&nbsp;点赞了你的文档主题&nbsp;<a href="/docs/read/0/2" target="_blank">文档测试标题2222</a>&nbsp;', CAST(N'2019-03-26T13:25:31.637' AS DateTime), 2, 2, 2, 1)
INSERT [dbo].[m_Message] ([MessageId], [MessageType], [Contents], [PostTime], [AccountId], [AppendAccountId], [ObjectId], [IsRead]) VALUES (47, 20, N'<a href="javascript:void(0)">糊涂书生</a>&nbsp;点赞了你的文档主题&nbsp;<a href="/docs/read/0/2" target="_blank">文档测试标题2222</a>&nbsp;', CAST(N'2019-03-26T13:25:32.583' AS DateTime), 2, 2, 2, 1)
INSERT [dbo].[m_Message] ([MessageId], [MessageType], [Contents], [PostTime], [AccountId], [AppendAccountId], [ObjectId], [IsRead]) VALUES (48, 20, N'<a href="javascript:void(0)">糊涂书生</a>&nbsp;点赞了你的文档主题&nbsp;<a href="/docs/read/0/2" target="_blank">文档测试标题2222</a>&nbsp;', CAST(N'2019-03-26T13:25:33.200' AS DateTime), 2, 2, 2, 1)
INSERT [dbo].[m_Message] ([MessageId], [MessageType], [Contents], [PostTime], [AccountId], [AppendAccountId], [ObjectId], [IsRead]) VALUES (49, 20, N'<a href="javascript:void(0)">糊涂书生</a>&nbsp;点赞了你的文档主题&nbsp;<a href="/docs/read/0/2" target="_blank">文档测试标题2222</a>&nbsp;', CAST(N'2019-03-26T13:25:33.623' AS DateTime), 2, 2, 2, 1)
INSERT [dbo].[m_Message] ([MessageId], [MessageType], [Contents], [PostTime], [AccountId], [AppendAccountId], [ObjectId], [IsRead]) VALUES (50, 20, N'<a href="javascript:void(0)">糊涂书生</a>&nbsp;点赞了你的文档主题&nbsp;<a href="/docs/read/0/2" target="_blank">文档测试标题2222</a>&nbsp;', CAST(N'2019-03-26T13:25:34.030' AS DateTime), 2, 2, 2, 1)
INSERT [dbo].[m_Message] ([MessageId], [MessageType], [Contents], [PostTime], [AccountId], [AppendAccountId], [ObjectId], [IsRead]) VALUES (51, 20, N'<a href="javascript:void(0)">糊涂书生</a>&nbsp;点赞了你的文档主题&nbsp;<a href="/docs/read/0/2" target="_blank">文档测试标题2222</a>&nbsp;', CAST(N'2019-03-26T13:25:34.447' AS DateTime), 2, 2, 2, 1)
INSERT [dbo].[m_Message] ([MessageId], [MessageType], [Contents], [PostTime], [AccountId], [AppendAccountId], [ObjectId], [IsRead]) VALUES (52, 20, N'<a href="javascript:void(0)">糊涂书生</a>&nbsp;点赞了你的文档主题&nbsp;<a href="/docs/read/0/2" target="_blank">文档测试标题2222</a>&nbsp;', CAST(N'2019-03-26T13:25:34.860' AS DateTime), 2, 2, 2, 1)
INSERT [dbo].[m_Message] ([MessageId], [MessageType], [Contents], [PostTime], [AccountId], [AppendAccountId], [ObjectId], [IsRead]) VALUES (53, 20, N'<a href="javascript:void(0)">糊涂书生</a>&nbsp;点赞了你的文档主题&nbsp;<a href="/docs/read/0/2" target="_blank">文档测试标题2222</a>&nbsp;', CAST(N'2019-03-26T13:25:35.293' AS DateTime), 2, 2, 2, 1)
INSERT [dbo].[m_Message] ([MessageId], [MessageType], [Contents], [PostTime], [AccountId], [AppendAccountId], [ObjectId], [IsRead]) VALUES (54, 20, N'<a href="javascript:void(0)">糊涂书生</a>&nbsp;点赞了你的文档主题&nbsp;<a href="/docs/read/0/2" target="_blank">文档测试标题2222</a>&nbsp;', CAST(N'2019-03-26T13:25:35.727' AS DateTime), 2, 2, 2, 1)
INSERT [dbo].[m_Message] ([MessageId], [MessageType], [Contents], [PostTime], [AccountId], [AppendAccountId], [ObjectId], [IsRead]) VALUES (55, 20, N'<a href="javascript:void(0)">糊涂书生</a>&nbsp;点赞了你的文档主题&nbsp;<a href="/docs/read/0/2" target="_blank">文档测试标题2222</a>&nbsp;', CAST(N'2019-03-26T13:25:36.143' AS DateTime), 2, 2, 2, 1)
INSERT [dbo].[m_Message] ([MessageId], [MessageType], [Contents], [PostTime], [AccountId], [AppendAccountId], [ObjectId], [IsRead]) VALUES (56, 20, N'<a href="javascript:void(0)">糊涂书生</a>&nbsp;点赞了你的文档主题&nbsp;<a href="/docs/read/0/2" target="_blank">文档测试标题2222</a>&nbsp;', CAST(N'2019-03-26T13:25:36.560' AS DateTime), 2, 2, 2, 1)
INSERT [dbo].[m_Message] ([MessageId], [MessageType], [Contents], [PostTime], [AccountId], [AppendAccountId], [ObjectId], [IsRead]) VALUES (57, 20, N'<a href="javascript:void(0)">糊涂书生</a>&nbsp;点赞了你的文档主题&nbsp;<a href="/docs/read/0/2" target="_blank">文档测试标题2222</a>&nbsp;', CAST(N'2019-03-26T13:25:36.963' AS DateTime), 2, 2, 2, 1)
INSERT [dbo].[m_Message] ([MessageId], [MessageType], [Contents], [PostTime], [AccountId], [AppendAccountId], [ObjectId], [IsRead]) VALUES (58, 20, N'<a href="javascript:void(0)">糊涂书生</a>&nbsp;点赞了你的文档主题&nbsp;<a href="/docs/read/0/2" target="_blank">文档测试标题2222</a>&nbsp;', CAST(N'2019-03-26T13:25:37.437' AS DateTime), 2, 2, 2, 1)
INSERT [dbo].[m_Message] ([MessageId], [MessageType], [Contents], [PostTime], [AccountId], [AppendAccountId], [ObjectId], [IsRead]) VALUES (59, 20, N'<a href="javascript:void(0)">糊涂书生</a>&nbsp;点赞了你的文档主题&nbsp;<a href="/docs/read/0/2" target="_blank">文档测试标题2222</a>&nbsp;', CAST(N'2019-03-26T13:25:37.860' AS DateTime), 2, 2, 2, 1)
INSERT [dbo].[m_Message] ([MessageId], [MessageType], [Contents], [PostTime], [AccountId], [AppendAccountId], [ObjectId], [IsRead]) VALUES (60, 20, N'<a href="javascript:void(0)">糊涂书生</a>&nbsp;点赞了你的文档主题&nbsp;<a href="/docs/read/0/2" target="_blank">文档测试标题2222</a>&nbsp;', CAST(N'2019-03-26T13:25:38.283' AS DateTime), 2, 2, 2, 1)
INSERT [dbo].[m_Message] ([MessageId], [MessageType], [Contents], [PostTime], [AccountId], [AppendAccountId], [ObjectId], [IsRead]) VALUES (61, 20, N'<a href="javascript:void(0)">糊涂书生</a>&nbsp;点赞了你的文档主题&nbsp;<a href="/docs/read/0/2" target="_blank">文档测试标题2222</a>&nbsp;', CAST(N'2019-03-26T13:25:38.727' AS DateTime), 2, 2, 2, 1)
INSERT [dbo].[m_Message] ([MessageId], [MessageType], [Contents], [PostTime], [AccountId], [AppendAccountId], [ObjectId], [IsRead]) VALUES (62, 20, N'<a href="javascript:void(0)">糊涂书生</a>&nbsp;点赞了你的文档主题&nbsp;<a href="/docs/read/0/2" target="_blank">文档测试标题2222</a>&nbsp;', CAST(N'2019-03-26T13:25:39.173' AS DateTime), 2, 2, 2, 1)
INSERT [dbo].[m_Message] ([MessageId], [MessageType], [Contents], [PostTime], [AccountId], [AppendAccountId], [ObjectId], [IsRead]) VALUES (63, 20, N'<a href="javascript:void(0)">糊涂书生</a>&nbsp;点赞了你的文档主题&nbsp;<a href="/docs/read/0/2" target="_blank">文档测试标题2222</a>&nbsp;', CAST(N'2019-03-26T13:25:39.613' AS DateTime), 2, 2, 2, 1)
INSERT [dbo].[m_Message] ([MessageId], [MessageType], [Contents], [PostTime], [AccountId], [AppendAccountId], [ObjectId], [IsRead]) VALUES (64, 20, N'<a href="javascript:void(0)">糊涂书生</a>&nbsp;点赞了你的文档主题&nbsp;<a href="/docs/read/0/2" target="_blank">文档测试标题2222</a>&nbsp;', CAST(N'2019-03-26T13:25:40.037' AS DateTime), 2, 2, 2, 1)
INSERT [dbo].[m_Message] ([MessageId], [MessageType], [Contents], [PostTime], [AccountId], [AppendAccountId], [ObjectId], [IsRead]) VALUES (65, 12, N'<a href="javascript:void(0)">糊涂书生</a>&nbsp;点赞了你的帖子&nbsp;<a href="/posts/read/1" target="_blank">进行回答功能更新测试？</a>&nbsp;', CAST(N'2019-03-26T14:23:54.790' AS DateTime), 2, 2, 1, 1)
INSERT [dbo].[m_Message] ([MessageId], [MessageType], [Contents], [PostTime], [AccountId], [AppendAccountId], [ObjectId], [IsRead]) VALUES (66, 12, N'<a href="javascript:void(0)">糊涂书生</a>&nbsp;点赞了你的帖子&nbsp;<a href="/posts/read/1" target="_blank">进行回答功能更新测试？</a>&nbsp;', CAST(N'2019-03-26T14:23:57.273' AS DateTime), 2, 2, 1, 1)
INSERT [dbo].[m_Message] ([MessageId], [MessageType], [Contents], [PostTime], [AccountId], [AppendAccountId], [ObjectId], [IsRead]) VALUES (67, 12, N'<a href="javascript:void(0)">糊涂书生</a>&nbsp;点赞了你的帖子&nbsp;<a href="/posts/read/3" target="_blank">进行回答功能更新测试？</a>&nbsp;', CAST(N'2019-03-26T14:23:58.857' AS DateTime), 2, 2, 3, 1)
INSERT [dbo].[m_Message] ([MessageId], [MessageType], [Contents], [PostTime], [AccountId], [AppendAccountId], [ObjectId], [IsRead]) VALUES (68, 12, N'<a href="javascript:void(0)">糊涂书生</a>&nbsp;点赞了你的帖子&nbsp;<a href="/posts/read/4" target="_blank">进行回答功能更新测试？</a>&nbsp;', CAST(N'2019-03-26T14:24:02.600' AS DateTime), 2, 2, 4, 1)
INSERT [dbo].[m_Message] ([MessageId], [MessageType], [Contents], [PostTime], [AccountId], [AppendAccountId], [ObjectId], [IsRead]) VALUES (69, 12, N'<a href="javascript:void(0)">糊涂书生</a>&nbsp;点赞了你的帖子&nbsp;<a href="/posts/read/4" target="_blank">进行回答功能更新测试？</a>&nbsp;', CAST(N'2019-03-26T14:24:04.567' AS DateTime), 2, 2, 4, 1)
INSERT [dbo].[m_Message] ([MessageId], [MessageType], [Contents], [PostTime], [AccountId], [AppendAccountId], [ObjectId], [IsRead]) VALUES (70, 10, N'<a href="javascript:void(0)">糊涂书生</a>&nbsp;回复了你的帖子&nbsp;<a href="/posts/read/3051" target="_blank">代码编辑插入问题修复</a>&nbsp;', CAST(N'2019-03-27T22:47:01.293' AS DateTime), 2, 2, 3051, 1)
INSERT [dbo].[m_Message] ([MessageId], [MessageType], [Contents], [PostTime], [AccountId], [AppendAccountId], [ObjectId], [IsRead]) VALUES (71, 12, N'<a href="javascript:void(0)">新版测试账号3</a>&nbsp;点赞了你的帖子&nbsp;<a href="/cms/read/35" target="_blank">Asp.Net Core 3.0实现在类库中添加Microsoft.AspNetCore.App引用</a>&nbsp;', CAST(N'2020-03-01T21:47:14.020' AS DateTime), 2, 2026, 35, 1)
INSERT [dbo].[m_Message] ([MessageId], [MessageType], [Contents], [PostTime], [AccountId], [AppendAccountId], [ObjectId], [IsRead]) VALUES (72, 12, N'<a href="javascript:void(0)">新版测试账号3</a>&nbsp;点赞了你的帖子&nbsp;<a href="/cms/read/35" target="_blank">Asp.Net Core 3.0实现在类库中添加Microsoft.AspNetCore.App引用</a>&nbsp;', CAST(N'2020-03-01T21:53:52.723' AS DateTime), 2, 2026, 35, 1)
INSERT [dbo].[m_Message] ([MessageId], [MessageType], [Contents], [PostTime], [AccountId], [AppendAccountId], [ObjectId], [IsRead]) VALUES (73, 12, N'<a href="javascript:void(0)">新版测试账号3</a>&nbsp;点赞了你的帖子&nbsp;<a href="/cms/read/35" target="_blank">Asp.Net Core 3.0实现在类库中添加Microsoft.AspNetCore.App引用</a>&nbsp;', CAST(N'2020-03-02T10:24:27.333' AS DateTime), 2, 2026, 35, 1)
INSERT [dbo].[m_Message] ([MessageId], [MessageType], [Contents], [PostTime], [AccountId], [AppendAccountId], [ObjectId], [IsRead]) VALUES (74, 12, N'<a href="javascript:void(0)">新版测试账号3</a>&nbsp;点赞了你的帖子&nbsp;<a href="/cms/read/35" target="_blank">Asp.Net Core 3.0实现在类库中添加Microsoft.AspNetCore.App引用</a>&nbsp;', CAST(N'2020-03-02T10:27:56.667' AS DateTime), 2, 2026, 35, 1)
INSERT [dbo].[m_Message] ([MessageId], [MessageType], [Contents], [PostTime], [AccountId], [AppendAccountId], [ObjectId], [IsRead]) VALUES (75, 12, N'<a href="javascript:void(0)">新版测试账号3</a>&nbsp;点赞了你的帖子&nbsp;<a href="/cms/read/35" target="_blank">Asp.Net Core 3.0实现在类库中添加Microsoft.AspNetCore.App引用</a>&nbsp;', CAST(N'2020-03-02T10:28:03.133' AS DateTime), 2, 2026, 35, 1)
INSERT [dbo].[m_Message] ([MessageId], [MessageType], [Contents], [PostTime], [AccountId], [AppendAccountId], [ObjectId], [IsRead]) VALUES (76, 12, N'<a href="javascript:void(0)">新版测试账号3</a>&nbsp;点赞了你的帖子&nbsp;<a href="/cms/read/35" target="_blank">Asp.Net Core 3.0实现在类库中添加Microsoft.AspNetCore.App引用</a>&nbsp;', CAST(N'2020-03-02T10:34:03.933' AS DateTime), 2, 2026, 35, 1)
INSERT [dbo].[m_Message] ([MessageId], [MessageType], [Contents], [PostTime], [AccountId], [AppendAccountId], [ObjectId], [IsRead]) VALUES (77, 12, N'<a href="javascript:void(0)">新版测试账号3</a>&nbsp;点赞了你的帖子&nbsp;<a href="/cms/read/35" target="_blank">Asp.Net Core 3.0实现在类库中添加Microsoft.AspNetCore.App引用</a>&nbsp;', CAST(N'2020-03-02T10:44:05.287' AS DateTime), 2, 2026, 35, 1)
INSERT [dbo].[m_Message] ([MessageId], [MessageType], [Contents], [PostTime], [AccountId], [AppendAccountId], [ObjectId], [IsRead]) VALUES (78, 12, N'<a href="javascript:void(0)">新版测试账号3</a>&nbsp;点赞了你的帖子&nbsp;<a href="/cms/read/35" target="_blank">Asp.Net Core 3.0实现在类库中添加Microsoft.AspNetCore.App引用</a>&nbsp;', CAST(N'2020-03-02T10:46:51.380' AS DateTime), 2, 2026, 35, 1)
INSERT [dbo].[m_Message] ([MessageId], [MessageType], [Contents], [PostTime], [AccountId], [AppendAccountId], [ObjectId], [IsRead]) VALUES (79, 12, N'<a href="javascript:void(0)">新版测试账号3</a>&nbsp;点赞了你的帖子&nbsp;<a href="/cms/read/35" target="_blank">Asp.Net Core 3.0实现在类库中添加Microsoft.AspNetCore.App引用</a>&nbsp;', CAST(N'2020-03-02T10:53:03.173' AS DateTime), 2, 2026, 35, 1)
INSERT [dbo].[m_Message] ([MessageId], [MessageType], [Contents], [PostTime], [AccountId], [AppendAccountId], [ObjectId], [IsRead]) VALUES (80, 12, N'<a href="javascript:void(0)">新版测试账号3</a>&nbsp;点赞了你的帖子&nbsp;<a href="/cms/read/35" target="_blank">Asp.Net Core 3.0实现在类库中添加Microsoft.AspNetCore.App引用</a>&nbsp;', CAST(N'2020-03-02T10:53:15.073' AS DateTime), 2, 2026, 35, 1)
INSERT [dbo].[m_Message] ([MessageId], [MessageType], [Contents], [PostTime], [AccountId], [AppendAccountId], [ObjectId], [IsRead]) VALUES (81, 12, N'<a href="javascript:void(0)">新版测试账号3</a>&nbsp;点赞了你的帖子&nbsp;<a href="/cms/read/35" target="_blank">Asp.Net Core 3.0实现在类库中添加Microsoft.AspNetCore.App引用</a>&nbsp;', CAST(N'2020-03-02T10:53:26.293' AS DateTime), 2, 2026, 35, 1)
INSERT [dbo].[m_Message] ([MessageId], [MessageType], [Contents], [PostTime], [AccountId], [AppendAccountId], [ObjectId], [IsRead]) VALUES (82, 12, N'<a href="javascript:void(0)">新版测试账号3</a>&nbsp;点赞了你的帖子&nbsp;<a href="/cms/read/35" target="_blank">Asp.Net Core 3.0实现在类库中添加Microsoft.AspNetCore.App引用</a>&nbsp;', CAST(N'2020-03-02T11:15:42.143' AS DateTime), 2, 2026, 35, 1)
INSERT [dbo].[m_Message] ([MessageId], [MessageType], [Contents], [PostTime], [AccountId], [AppendAccountId], [ObjectId], [IsRead]) VALUES (83, 12, N'<a href="javascript:void(0)">新版测试账号3</a>&nbsp;点赞了你的帖子&nbsp;<a href="/cms/read/35" target="_blank">Asp.Net Core 3.0实现在类库中添加Microsoft.AspNetCore.App引用</a>&nbsp;', CAST(N'2020-03-02T11:15:48.083' AS DateTime), 2, 2026, 35, 1)
INSERT [dbo].[m_Message] ([MessageId], [MessageType], [Contents], [PostTime], [AccountId], [AppendAccountId], [ObjectId], [IsRead]) VALUES (84, 12, N'<a href="javascript:void(0)">新版测试账号3</a>&nbsp;点赞了你的帖子&nbsp;<a href="/cms/read/35" target="_blank">Asp.Net Core 3.0实现在类库中添加Microsoft.AspNetCore.App引用</a>&nbsp;', CAST(N'2020-03-02T11:17:28.260' AS DateTime), 2, 2026, 35, 1)
INSERT [dbo].[m_Message] ([MessageId], [MessageType], [Contents], [PostTime], [AccountId], [AppendAccountId], [ObjectId], [IsRead]) VALUES (85, 12, N'<a href="javascript:void(0)">糊涂书生</a>&nbsp;点赞了你的帖子&nbsp;<a href="/cms/read/35" target="_blank">Asp.Net Core 3.0实现在类库中添加Microsoft.AspNetCore.App引用</a>&nbsp;', CAST(N'2020-03-02T12:49:41.083' AS DateTime), 2, 2, 35, 1)
INSERT [dbo].[m_Message] ([MessageId], [MessageType], [Contents], [PostTime], [AccountId], [AppendAccountId], [ObjectId], [IsRead]) VALUES (86, 12, N'<a href="javascript:void(0)">糊涂书生</a>&nbsp;点赞了你的帖子&nbsp;<a href="/cms/read/35" target="_blank">Asp.Net Core 3.0实现在类库中添加Microsoft.AspNetCore.App引用</a>&nbsp;', CAST(N'2020-03-02T12:49:48.460' AS DateTime), 2, 2, 35, 1)
INSERT [dbo].[m_Message] ([MessageId], [MessageType], [Contents], [PostTime], [AccountId], [AppendAccountId], [ObjectId], [IsRead]) VALUES (87, 12, N'<a href="javascript:void(0)"></a>&nbsp;点赞了你的帖子&nbsp;<a href="/cms/read/35" target="_blank">Asp.Net Core 3.0实现在类库中添加Microsoft.AspNetCore.App引用</a>&nbsp;', CAST(N'2020-03-02T13:22:42.957' AS DateTime), 2, 0, 35, 1)
INSERT [dbo].[m_Message] ([MessageId], [MessageType], [Contents], [PostTime], [AccountId], [AppendAccountId], [ObjectId], [IsRead]) VALUES (88, 12, N'<a href="javascript:void(0)"></a>&nbsp;点赞了你的帖子&nbsp;<a href="/cms/read/35" target="_blank">Asp.Net Core 3.0实现在类库中添加Microsoft.AspNetCore.App引用</a>&nbsp;', CAST(N'2020-03-02T13:22:44.760' AS DateTime), 2, 0, 35, 1)
INSERT [dbo].[m_Message] ([MessageId], [MessageType], [Contents], [PostTime], [AccountId], [AppendAccountId], [ObjectId], [IsRead]) VALUES (89, 12, N'<a href="javascript:void(0)"></a>&nbsp;点赞了你的帖子&nbsp;<a href="/cms/read/35" target="_blank">Asp.Net Core 3.0实现在类库中添加Microsoft.AspNetCore.App引用</a>&nbsp;', CAST(N'2020-03-02T13:22:46.410' AS DateTime), 2, 0, 35, 1)
INSERT [dbo].[m_Message] ([MessageId], [MessageType], [Contents], [PostTime], [AccountId], [AppendAccountId], [ObjectId], [IsRead]) VALUES (90, 12, N'<a href="javascript:void(0)">糊涂书生</a>&nbsp;点赞了你的帖子&nbsp;<a href="/cms/read/35" target="_blank">Asp.Net Core 3.0实现在类库中添加Microsoft.AspNetCore.App引用</a>&nbsp;', CAST(N'2020-03-02T13:43:45.230' AS DateTime), 2, 2, 35, 1)
INSERT [dbo].[m_Message] ([MessageId], [MessageType], [Contents], [PostTime], [AccountId], [AppendAccountId], [ObjectId], [IsRead]) VALUES (91, 12, N'<a href="javascript:void(0)">糊涂书生</a>&nbsp;点赞了你的帖子&nbsp;<a href="/cms/read/35" target="_blank">Asp.Net Core 3.0实现在类库中添加Microsoft.AspNetCore.App引用</a>&nbsp;', CAST(N'2020-03-02T13:45:56.143' AS DateTime), 2, 2, 35, 1)
INSERT [dbo].[m_Message] ([MessageId], [MessageType], [Contents], [PostTime], [AccountId], [AppendAccountId], [ObjectId], [IsRead]) VALUES (92, 12, N'<a href="javascript:void(0)">糊涂书生</a>&nbsp;点赞了你的帖子&nbsp;<a href="/cms/read/35" target="_blank">Asp.Net Core 3.0实现在类库中添加Microsoft.AspNetCore.App引用</a>&nbsp;', CAST(N'2020-03-02T13:47:30.617' AS DateTime), 2, 2, 35, 1)
INSERT [dbo].[m_Message] ([MessageId], [MessageType], [Contents], [PostTime], [AccountId], [AppendAccountId], [ObjectId], [IsRead]) VALUES (93, 12, N'<a href="javascript:void(0)">糊涂书生</a>&nbsp;点赞了你的帖子&nbsp;<a href="/cms/read/35" target="_blank">Asp.Net Core 3.0实现在类库中添加Microsoft.AspNetCore.App引用</a>&nbsp;', CAST(N'2020-03-02T13:52:31.487' AS DateTime), 2, 2, 35, 1)
INSERT [dbo].[m_Message] ([MessageId], [MessageType], [Contents], [PostTime], [AccountId], [AppendAccountId], [ObjectId], [IsRead]) VALUES (94, 12, N'<a href="javascript:void(0)">糊涂书生</a>&nbsp;点赞了你的帖子&nbsp;<a href="/cms/read/35" target="_blank">Asp.Net Core 3.0实现在类库中添加Microsoft.AspNetCore.App引用</a>&nbsp;', CAST(N'2020-03-02T14:22:34.977' AS DateTime), 2, 2, 35, 1)
INSERT [dbo].[m_Message] ([MessageId], [MessageType], [Contents], [PostTime], [AccountId], [AppendAccountId], [ObjectId], [IsRead]) VALUES (95, 12, N'<a href="javascript:void(0)">糊涂书生</a>&nbsp;点赞了你的帖子&nbsp;<a href="/cms/read/35" target="_blank">Asp.Net Core 3.0实现在类库中添加Microsoft.AspNetCore.App引用</a>&nbsp;', CAST(N'2020-03-02T15:07:24.123' AS DateTime), 2, 2, 35, 1)
INSERT [dbo].[m_Message] ([MessageId], [MessageType], [Contents], [PostTime], [AccountId], [AppendAccountId], [ObjectId], [IsRead]) VALUES (96, 12, N'<a href="javascript:void(0)">糊涂书生</a>&nbsp;点赞了你的帖子&nbsp;<a href="/cms/read/35" target="_blank">Asp.Net Core 3.0实现在类库中添加Microsoft.AspNetCore.App引用</a>&nbsp;', CAST(N'2020-03-02T15:56:23.017' AS DateTime), 2, 2, 35, 1)
INSERT [dbo].[m_Message] ([MessageId], [MessageType], [Contents], [PostTime], [AccountId], [AppendAccountId], [ObjectId], [IsRead]) VALUES (97, 12, N'<a href="javascript:void(0)">糊涂书生</a>&nbsp;点赞了你的帖子&nbsp;<a href="/cms/read/35" target="_blank">Asp.Net Core 3.0实现在类库中添加Microsoft.AspNetCore.App引用</a>&nbsp;', CAST(N'2020-03-02T15:58:58.773' AS DateTime), 2, 2, 35, 1)
INSERT [dbo].[m_Message] ([MessageId], [MessageType], [Contents], [PostTime], [AccountId], [AppendAccountId], [ObjectId], [IsRead]) VALUES (98, 12, N'<a href="javascript:void(0)">糊涂书生</a>&nbsp;点赞了你的帖子&nbsp;<a href="/cms/read/35" target="_blank">Asp.Net Core 3.0实现在类库中添加Microsoft.AspNetCore.App引用</a>&nbsp;', CAST(N'2020-03-02T16:23:25.857' AS DateTime), 2, 2, 35, 1)
INSERT [dbo].[m_Message] ([MessageId], [MessageType], [Contents], [PostTime], [AccountId], [AppendAccountId], [ObjectId], [IsRead]) VALUES (99, 12, N'<a href="javascript:void(0)">糊涂书生</a>&nbsp;点赞了你的帖子&nbsp;<a href="/cms/read/35" target="_blank">Asp.Net Core 3.0实现在类库中添加Microsoft.AspNetCore.App引用</a>&nbsp;', CAST(N'2020-03-02T16:23:41.920' AS DateTime), 2, 2, 35, 1)
GO
INSERT [dbo].[m_Message] ([MessageId], [MessageType], [Contents], [PostTime], [AccountId], [AppendAccountId], [ObjectId], [IsRead]) VALUES (100, 12, N'<a href="javascript:void(0)">糊涂书生</a>&nbsp;点赞了你的帖子&nbsp;<a href="/cms/read/35" target="_blank">Asp.Net Core 3.0实现在类库中添加Microsoft.AspNetCore.App引用</a>&nbsp;', CAST(N'2020-03-02T16:28:13.733' AS DateTime), 2, 2, 35, 1)
INSERT [dbo].[m_Message] ([MessageId], [MessageType], [Contents], [PostTime], [AccountId], [AppendAccountId], [ObjectId], [IsRead]) VALUES (101, 12, N'<a href="javascript:void(0)">糊涂书生</a>&nbsp;点赞了你的帖子&nbsp;<a href="/cms/read/35" target="_blank">Asp.Net Core 3.0实现在类库中添加Microsoft.AspNetCore.App引用</a>&nbsp;', CAST(N'2020-03-02T17:46:38.463' AS DateTime), 2, 2, 35, 1)
INSERT [dbo].[m_Message] ([MessageId], [MessageType], [Contents], [PostTime], [AccountId], [AppendAccountId], [ObjectId], [IsRead]) VALUES (102, 12, N'<a href="javascript:void(0)">糊涂书生</a>&nbsp;点赞了你的帖子&nbsp;<a href="/cms/read/35" target="_blank">Asp.Net Core 3.0实现在类库中添加Microsoft.AspNetCore.App引用</a>&nbsp;', CAST(N'2020-03-02T17:56:23.870' AS DateTime), 2, 2, 35, 1)
INSERT [dbo].[m_Message] ([MessageId], [MessageType], [Contents], [PostTime], [AccountId], [AppendAccountId], [ObjectId], [IsRead]) VALUES (103, 12, N'<a href="javascript:void(0)">糊涂书生</a>&nbsp;点赞了你的帖子&nbsp;<a href="/cms/read/35" target="_blank">Asp.Net Core 3.0实现在类库中添加Microsoft.AspNetCore.App引用</a>&nbsp;', CAST(N'2020-03-02T17:58:09.343' AS DateTime), 2, 2, 35, 1)
INSERT [dbo].[m_Message] ([MessageId], [MessageType], [Contents], [PostTime], [AccountId], [AppendAccountId], [ObjectId], [IsRead]) VALUES (104, 12, N'<a href="javascript:void(0)">糊涂书生</a>&nbsp;点赞了你的帖子&nbsp;<a href="/cms/read/35" target="_blank">Asp.Net Core 3.0实现在类库中添加Microsoft.AspNetCore.App引用</a>&nbsp;', CAST(N'2020-03-02T18:00:04.743' AS DateTime), 2, 2, 35, 1)
INSERT [dbo].[m_Message] ([MessageId], [MessageType], [Contents], [PostTime], [AccountId], [AppendAccountId], [ObjectId], [IsRead]) VALUES (105, 10, N'<a href="javascript:void(0)">糊涂书生</a>&nbsp;点赞了你的文档主题&nbsp;<a href="/cms/read/7" target="_blank">SignalR通信框架使用案例文档</a>&nbsp;', CAST(N'2020-03-02T20:39:31.590' AS DateTime), 2, 2, 7, 1)
INSERT [dbo].[m_Message] ([MessageId], [MessageType], [Contents], [PostTime], [AccountId], [AppendAccountId], [ObjectId], [IsRead]) VALUES (106, 10, N'<a href="javascript:void(0)">糊涂书生</a>&nbsp;点赞了你的文档主题&nbsp;<a href="/cms/read/7" target="_blank">SignalR通信框架使用案例文档</a>&nbsp;', CAST(N'2020-03-02T20:39:36.683' AS DateTime), 2, 2, 7, 1)
INSERT [dbo].[m_Message] ([MessageId], [MessageType], [Contents], [PostTime], [AccountId], [AppendAccountId], [ObjectId], [IsRead]) VALUES (107, 11, N'<a href="javascript:void(0)">糊涂书生</a>&nbsp;点赞了你的文档&nbsp;<a href="/cms/read/7" target="_blank">如何使用Asp.Net Core SignalR?</a>&nbsp;', CAST(N'2020-03-02T21:59:11.510' AS DateTime), 2, 2, 7, 1)
INSERT [dbo].[m_Message] ([MessageId], [MessageType], [Contents], [PostTime], [AccountId], [AppendAccountId], [ObjectId], [IsRead]) VALUES (108, 10, N'<a href="javascript:void(0)">糊涂书生</a>&nbsp;点赞了你的文档主题&nbsp;<a href="/cms/read/7" target="_blank">SignalR通信框架使用案例文档</a>&nbsp;', CAST(N'2020-03-02T21:59:20.190' AS DateTime), 2, 2, 7, 1)
INSERT [dbo].[m_Message] ([MessageId], [MessageType], [Contents], [PostTime], [AccountId], [AppendAccountId], [ObjectId], [IsRead]) VALUES (109, 10, N'<a href="javascript:void(0)">糊涂书生</a>&nbsp;点赞了你的文档主题&nbsp;<a href="/cms/read/7" target="_blank">SignalR通信框架使用案例文档</a>&nbsp;', CAST(N'2020-03-02T21:59:22.270' AS DateTime), 2, 2, 7, 1)
INSERT [dbo].[m_Message] ([MessageId], [MessageType], [Contents], [PostTime], [AccountId], [AppendAccountId], [ObjectId], [IsRead]) VALUES (110, 10, N'<a href="javascript:void(0)">糊涂书生</a>&nbsp;点赞了你的文档主题&nbsp;<a href="/cms/read/7" target="_blank">SignalR通信框架使用案例文档</a>&nbsp;', CAST(N'2020-03-02T21:59:25.277' AS DateTime), 2, 2, 7, 1)
INSERT [dbo].[m_Message] ([MessageId], [MessageType], [Contents], [PostTime], [AccountId], [AppendAccountId], [ObjectId], [IsRead]) VALUES (111, 11, N'<a href="javascript:void(0)">糊涂书生</a>&nbsp;点赞了你的文档&nbsp;<a href="/cms/read/7" target="_blank">如何使用Asp.Net Core SignalR?</a>&nbsp;', CAST(N'2020-03-02T21:59:29.473' AS DateTime), 2, 2, 7, 1)
INSERT [dbo].[m_Message] ([MessageId], [MessageType], [Contents], [PostTime], [AccountId], [AppendAccountId], [ObjectId], [IsRead]) VALUES (112, 10, N'<a href="javascript:void(0)">糊涂书生</a>&nbsp;点赞了你的文档主题&nbsp;<a href="/cms/read/7" target="_blank">SignalR通信框架使用案例文档</a>&nbsp;', CAST(N'2020-03-02T21:59:37.670' AS DateTime), 2, 2, 7, 1)
INSERT [dbo].[m_Message] ([MessageId], [MessageType], [Contents], [PostTime], [AccountId], [AppendAccountId], [ObjectId], [IsRead]) VALUES (113, 11, N'<a href="javascript:void(0)">糊涂书生</a>&nbsp;点赞了你的文档&nbsp;<a href="/cms/read/7" target="_blank">如何使用Asp.Net Core SignalR?</a>&nbsp;', CAST(N'2020-03-02T21:59:41.080' AS DateTime), 2, 2, 7, 1)
INSERT [dbo].[m_Message] ([MessageId], [MessageType], [Contents], [PostTime], [AccountId], [AppendAccountId], [ObjectId], [IsRead]) VALUES (114, 1, N'<a href="javascript:void(0)">糊涂书生</a>&nbsp;点赞了你的文章&nbsp;', CAST(N'2020-03-04T09:57:33.077' AS DateTime), 2, 2, 35, 1)
SET IDENTITY_INSERT [dbo].[m_Message] OFF
SET IDENTITY_INSERT [dbo].[m_Navigation] ON 

INSERT [dbo].[m_Navigation] ([NavigationId], [NavigationName], [IsShow], [Remark], [CId], [NavigationUrl], [ClickCount]) VALUES (100, N'VS2017系列下载', 1, N'VS2017系列开发工具下载,包含了社区版 企业版 专业版', 1, N'https://www.visualstudio.com/zh-hans/vs', 109)
INSERT [dbo].[m_Navigation] ([NavigationId], [NavigationName], [IsShow], [Remark], [CId], [NavigationUrl], [ClickCount]) VALUES (101, N'.net core sdk下载', 1, N'.net core sdk下载地址,包含了每个版本的SDK下载', 1, N'https://www.microsoft.com/net/download/windows', 60)
INSERT [dbo].[m_Navigation] ([NavigationId], [NavigationName], [IsShow], [Remark], [CId], [NavigationUrl], [ClickCount]) VALUES (103, N'artDialog', 1, N'web弹窗组件,轻便简单', 3, N'http://aui.github.io/artDialog/', 57)
INSERT [dbo].[m_Navigation] ([NavigationId], [NavigationName], [IsShow], [Remark], [CId], [NavigationUrl], [ClickCount]) VALUES (104, N'本站源代码下载', 1, N'基于Asp.Net Core MVC开发的社区项目源代码', 5, N'https://github.com/51core/mango-sns-open', 108)
INSERT [dbo].[m_Navigation] ([NavigationId], [NavigationName], [IsShow], [Remark], [CId], [NavigationUrl], [ClickCount]) VALUES (106, N'echarts在线图表', 1, N'免费开源,专业性强,图表组件丰富', 3, N'http://echarts.baidu.com/', 67)
INSERT [dbo].[m_Navigation] ([NavigationId], [NavigationName], [IsShow], [Remark], [CId], [NavigationUrl], [ClickCount]) VALUES (107, N'微软开发者文档中心', 1, N'微软开发者文档中心', 1, N'https://docs.microsoft.com/zh-cn/', 49)
INSERT [dbo].[m_Navigation] ([NavigationId], [NavigationName], [IsShow], [Remark], [CId], [NavigationUrl], [ClickCount]) VALUES (108, N'LayUI', 1, N'一个不错的前端UI组件', 3, N'http://www.layui.com', 24)
INSERT [dbo].[m_Navigation] ([NavigationId], [NavigationName], [IsShow], [Remark], [CId], [NavigationUrl], [ClickCount]) VALUES (109, N'zui', 1, N'一个基于bootstrap的前端框架', 3, N'http://zui.sexy/', 22)
INSERT [dbo].[m_Navigation] ([NavigationId], [NavigationName], [IsShow], [Remark], [CId], [NavigationUrl], [ClickCount]) VALUES (110, N'Ocelot API网关组件', 1, N'基于.NET CORE的API网关组件', 4, N'https://github.com/TomPallister/Ocelot', 34)
INSERT [dbo].[m_Navigation] ([NavigationId], [NavigationName], [IsShow], [Remark], [CId], [NavigationUrl], [ClickCount]) VALUES (111, N'MSDN, 我告诉你', 1, N'专业的开发工具,以及数据库安装包,其它工具等收录站', 5, N'https://msdn.itellyou.cn/', 13)
SET IDENTITY_INSERT [dbo].[m_Navigation] OFF
SET IDENTITY_INSERT [dbo].[m_NavigationClassify] ON 

INSERT [dbo].[m_NavigationClassify] ([CId], [ClassifyName], [IsShow], [SortCount]) VALUES (1, N'开发工具', 1, 2)
INSERT [dbo].[m_NavigationClassify] ([CId], [ClassifyName], [IsShow], [SortCount]) VALUES (3, N'JS/H5/CSS', 1, 3)
INSERT [dbo].[m_NavigationClassify] ([CId], [ClassifyName], [IsShow], [SortCount]) VALUES (4, N'微服务架构组件', 1, 4)
INSERT [dbo].[m_NavigationClassify] ([CId], [ClassifyName], [IsShow], [SortCount]) VALUES (5, N'推荐', 1, 1)
SET IDENTITY_INSERT [dbo].[m_NavigationClassify] OFF
SET IDENTITY_INSERT [dbo].[m_Sms] ON 

INSERT [dbo].[m_Sms] ([SmsID], [Phone], [Contents], [SendTime], [SendIP], [IsOk]) VALUES (1, N'18823812180', N'短信验证码为:181282 服务器返回结果:{"Message":"签名不合法(不存在或被拉黑)","RequestId":"DA52F029-FBA1-4B87-9FB7-599D6BBD92EF","Code":"isv.SMS_SIGNATURE_ILLEGAL"}', CAST(N'2018-11-16T13:24:39.977' AS DateTime), N'::1', 0)
INSERT [dbo].[m_Sms] ([SmsID], [Phone], [Contents], [SendTime], [SendIP], [IsOk]) VALUES (2, N'18823812180', N'短信验证码为:755045 服务器返回结果:{"Message":"OK","RequestId":"4BD3A270-25B9-43BA-82EB-ED5C5E151020","BizId":"591718443298067514^0","Code":"OK"}', CAST(N'2018-11-27T13:54:35.627' AS DateTime), N'::1', 1)
INSERT [dbo].[m_Sms] ([SmsID], [Phone], [Contents], [SendTime], [SendIP], [IsOk]) VALUES (3, N'18823812180', N'短信验证码为:656677 服务器返回结果:{"Message":"OK","RequestId":"6A86E8A6-DFEC-4D41-AD6B-805EBE09B606","BizId":"939208443313525884^0","Code":"OK"}', CAST(N'2018-11-28T18:12:11.437' AS DateTime), N'::1', 1)
INSERT [dbo].[m_Sms] ([SmsID], [Phone], [Contents], [SendTime], [SendIP], [IsOk]) VALUES (4, N'18823812180', N'短信验证码为:269166 服务器返回结果:{"Message":"OK","RequestId":"868ABEFF-5260-4C55-A071-ADB2936DA68A","BizId":"277406543373903718^0","Code":"OK"}', CAST(N'2018-11-28T10:58:24.730' AS DateTime), N'::1', 1)
INSERT [dbo].[m_Sms] ([SmsID], [Phone], [Contents], [SendTime], [SendIP], [IsOk]) VALUES (5, N'18823812180', N'短信验证码为:857653 服务器返回结果:{"Message":"OK","RequestId":"8E95103C-379E-4063-B4C5-9465F2B147E3","BizId":"991613543383261424^0","Code":"OK"}', CAST(N'2018-11-28T13:34:24.117' AS DateTime), N'::1', 1)
INSERT [dbo].[m_Sms] ([SmsID], [Phone], [Contents], [SendTime], [SendIP], [IsOk]) VALUES (6, N'18138207129', N'短信验证码为:881275 服务器返回结果:{"Message":"OK","RequestId":"A16CF6EC-F06C-457C-8042-0B757BF04473","BizId":"105611943474441039^0","Code":"OK"}', CAST(N'2018-11-29T14:54:02.353' AS DateTime), N'::1', 1)
INSERT [dbo].[m_Sms] ([SmsID], [Phone], [Contents], [SendTime], [SendIP], [IsOk]) VALUES (7, N'18138207129', N'短信验证码为:449501 服务器返回结果:{"Message":"OK","RequestId":"D390BEFD-3D9A-4BCA-850D-FCDB1F6F166B","BizId":"729516343474670571^0","Code":"OK"}', CAST(N'2018-11-29T14:57:51.870' AS DateTime), N'::1', 1)
INSERT [dbo].[m_Sms] ([SmsID], [Phone], [Contents], [SendTime], [SendIP], [IsOk]) VALUES (8, N'18823812180', N'短信验证码为:826380 服务器返回结果:{"Message":"OK","RequestId":"F3AAA403-D7C2-434E-8FFE-EA0C391F6695","BizId":"323008944089280172^0","Code":"OK"}', CAST(N'2018-12-06T17:41:21.083' AS DateTime), N'::1', 1)
INSERT [dbo].[m_Sms] ([SmsID], [Phone], [Contents], [SendTime], [SendIP], [IsOk]) VALUES (9, N'18823812180', N'短信验证码为:609160 服务器返回结果:{"Message":"OK","RequestId":"79E95EFC-82C2-4002-BDCA-280498E43844","BizId":"876422644089543159^0","Code":"OK"}', CAST(N'2018-12-06T17:45:49.027' AS DateTime), N'::1', 1)
INSERT [dbo].[m_Sms] ([SmsID], [Phone], [Contents], [SendTime], [SendIP], [IsOk]) VALUES (10, N'17858954953', N'短信验证码为:916982 服务器返回结果:{"Message":"OK","RequestId":"8F55E879-960E-499A-A4D3-44675A21FE05","BizId":"443707044433946787^0","Code":"OK"}', CAST(N'2018-12-10T17:25:48.020' AS DateTime), N'111.2.9.178', 1)
INSERT [dbo].[m_Sms] ([SmsID], [Phone], [Contents], [SendTime], [SendIP], [IsOk]) VALUES (11, N'18501234567', N'短信验证码为:756358 服务器返回结果:{"Message":"OK","RequestId":"EE104C6B-2F57-4FBD-95CC-1A6FF2181502","BizId":"255416347090258159^0","Code":"OK"}', CAST(N'2019-01-10T11:17:39.260' AS DateTime), N'124.200.185.250', 1)
INSERT [dbo].[m_Sms] ([SmsID], [Phone], [Contents], [SendTime], [SendIP], [IsOk]) VALUES (12, N'13277745080', N'短信验证码为:330245 服务器返回结果:{"Message":"OK","RequestId":"F9ECB13B-9E9A-4D15-AEDB-8AC2B45A709E","BizId":"326214947432894917^0","Code":"OK"}', CAST(N'2019-01-14T10:28:15.963' AS DateTime), N'119.139.199.208', 1)
INSERT [dbo].[m_Sms] ([SmsID], [Phone], [Contents], [SendTime], [SendIP], [IsOk]) VALUES (13, N'18823812180', N'短信验证码为:695087 服务器返回结果:{"Message":"签名不合法(不存在或被拉黑)","RequestId":"0D3F73FE-979C-4EE9-B40A-69D7062594BE","Code":"isv.SMS_SIGNATURE_ILLEGAL"}', CAST(N'2019-03-20T22:30:39.153' AS DateTime), N'::1', 0)
INSERT [dbo].[m_Sms] ([SmsID], [Phone], [Contents], [SendTime], [SendIP], [IsOk]) VALUES (14, N'18823812180', N'短信验证码为:671881 服务器返回结果:{"Message":"签名不合法(不存在或被拉黑)","RequestId":"220D1FCD-0F48-4BC1-B847-53BAD70F8562","Code":"isv.SMS_SIGNATURE_ILLEGAL"}', CAST(N'2019-03-20T22:35:34.560' AS DateTime), N'::1', 0)
INSERT [dbo].[m_Sms] ([SmsID], [Phone], [Contents], [SendTime], [SendIP], [IsOk]) VALUES (15, N'yupingyong@qq.com', N'邮箱验证码为:226688 服务器返回结果:True', CAST(N'2019-11-20T21:45:26.450' AS DateTime), N'::1', 1)
INSERT [dbo].[m_Sms] ([SmsID], [Phone], [Contents], [SendTime], [SendIP], [IsOk]) VALUES (16, N'yupingyong@qq.com', N'邮箱验证码为:844901 服务器返回结果:True', CAST(N'2019-11-20T21:48:44.983' AS DateTime), N'::1', 1)
INSERT [dbo].[m_Sms] ([SmsID], [Phone], [Contents], [SendTime], [SendIP], [IsOk]) VALUES (17, N'yupingyong@qq.com', N'邮箱验证码为:682978 服务器返回结果:True', CAST(N'2019-11-20T21:52:48.597' AS DateTime), N'::1', 1)
INSERT [dbo].[m_Sms] ([SmsID], [Phone], [Contents], [SendTime], [SendIP], [IsOk]) VALUES (18, N'52116709@qq.com', N'邮箱验证码为:372655 服务器返回结果:True', CAST(N'2019-11-20T22:24:24.823' AS DateTime), N'::1', 1)
INSERT [dbo].[m_Sms] ([SmsID], [Phone], [Contents], [SendTime], [SendIP], [IsOk]) VALUES (19, N'yupingyong@qq.com', N'邮箱验证码为:767149 服务器返回结果:False', CAST(N'2019-11-21T11:32:30.347' AS DateTime), N'::1', 0)
INSERT [dbo].[m_Sms] ([SmsID], [Phone], [Contents], [SendTime], [SendIP], [IsOk]) VALUES (20, N'yupingyong@qq.com', N'邮箱验证码为:184216 服务器返回结果:True', CAST(N'2019-11-21T12:02:15.433' AS DateTime), N'::1', 1)
INSERT [dbo].[m_Sms] ([SmsID], [Phone], [Contents], [SendTime], [SendIP], [IsOk]) VALUES (21, N'6569723@qq.com', N'邮箱验证码为:332133 服务器返回结果:True', CAST(N'2019-11-21T13:06:29.410' AS DateTime), N'::1', 1)
INSERT [dbo].[m_Sms] ([SmsID], [Phone], [Contents], [SendTime], [SendIP], [IsOk]) VALUES (22, N'6569723@qq.com', N'邮箱验证码为:511077 服务器返回结果:True', CAST(N'2019-11-21T13:37:17.450' AS DateTime), N'::1', 1)
INSERT [dbo].[m_Sms] ([SmsID], [Phone], [Contents], [SendTime], [SendIP], [IsOk]) VALUES (23, N'6569723@qq.com', N'邮箱验证码为:702116 服务器返回结果:True', CAST(N'2019-11-21T13:38:33.217' AS DateTime), N'::1', 1)
INSERT [dbo].[m_Sms] ([SmsID], [Phone], [Contents], [SendTime], [SendIP], [IsOk]) VALUES (24, N'6569723@qq.com', N'邮箱验证码为:833391 服务器返回结果:True', CAST(N'2019-11-21T13:48:13.657' AS DateTime), N'::1', 1)
INSERT [dbo].[m_Sms] ([SmsID], [Phone], [Contents], [SendTime], [SendIP], [IsOk]) VALUES (25, N'591270247@qq.com', N'邮箱验证码为:287303 服务器返回结果:False', CAST(N'2019-12-18T16:41:55.413' AS DateTime), N'106.15.231.152', 0)
INSERT [dbo].[m_Sms] ([SmsID], [Phone], [Contents], [SendTime], [SendIP], [IsOk]) VALUES (26, N'591270247@qq.com', N'邮箱验证码为:697342 服务器返回结果:False', CAST(N'2019-12-18T16:43:02.797' AS DateTime), N'106.15.231.152', 0)
INSERT [dbo].[m_Sms] ([SmsID], [Phone], [Contents], [SendTime], [SendIP], [IsOk]) VALUES (27, N'111@qq.com', N'邮箱验证码为:255079 服务器返回结果:False', CAST(N'2019-12-19T10:24:52.623' AS DateTime), N'106.15.231.152', 0)
INSERT [dbo].[m_Sms] ([SmsID], [Phone], [Contents], [SendTime], [SendIP], [IsOk]) VALUES (28, N'11111@qq.com', N'邮箱验证码为:408197 服务器返回结果:False', CAST(N'2019-12-19T10:25:20.643' AS DateTime), N'106.15.231.152', 0)
INSERT [dbo].[m_Sms] ([SmsID], [Phone], [Contents], [SendTime], [SendIP], [IsOk]) VALUES (29, N'dbtt117@163.com', N'邮箱验证码为:445186 服务器返回结果:False', CAST(N'2019-12-29T19:04:30.287' AS DateTime), N'106.15.231.152', 0)
INSERT [dbo].[m_Sms] ([SmsID], [Phone], [Contents], [SendTime], [SendIP], [IsOk]) VALUES (30, N'dbtt117@163.com', N'邮箱验证码为:748692 服务器返回结果:False', CAST(N'2019-12-29T19:05:41.990' AS DateTime), N'106.15.231.152', 0)
INSERT [dbo].[m_Sms] ([SmsID], [Phone], [Contents], [SendTime], [SendIP], [IsOk]) VALUES (31, N'dbtt117@163.com', N'邮箱验证码为:867217 服务器返回结果:False', CAST(N'2019-12-29T19:08:03.923' AS DateTime), N'106.15.231.152', 0)
INSERT [dbo].[m_Sms] ([SmsID], [Phone], [Contents], [SendTime], [SendIP], [IsOk]) VALUES (32, N'3@qq.com', N'邮箱验证码为:193863 服务器返回结果:False', CAST(N'2020-01-31T18:04:02.310' AS DateTime), N'106.15.231.152', 0)
INSERT [dbo].[m_Sms] ([SmsID], [Phone], [Contents], [SendTime], [SendIP], [IsOk]) VALUES (33, N'459817225@qq.com', N'邮箱验证码为:936891 服务器返回结果:False', CAST(N'2020-02-01T18:00:31.450' AS DateTime), N'106.15.231.152', 0)
INSERT [dbo].[m_Sms] ([SmsID], [Phone], [Contents], [SendTime], [SendIP], [IsOk]) VALUES (34, N'459817225@qq.com', N'邮箱验证码为:417940 服务器返回结果:False', CAST(N'2020-02-01T18:03:42.080' AS DateTime), N'106.15.231.152', 0)
INSERT [dbo].[m_Sms] ([SmsID], [Phone], [Contents], [SendTime], [SendIP], [IsOk]) VALUES (35, N'2900574511@qq.com', N'邮箱验证码为:713408 服务器返回结果:False', CAST(N'2020-02-11T10:21:16.610' AS DateTime), N'106.15.231.152', 0)
INSERT [dbo].[m_Sms] ([SmsID], [Phone], [Contents], [SendTime], [SendIP], [IsOk]) VALUES (36, N'2900574511@qq.com', N'邮箱验证码为:127104 服务器返回结果:False', CAST(N'2020-02-11T10:21:59.200' AS DateTime), N'106.15.231.152', 0)
INSERT [dbo].[m_Sms] ([SmsID], [Phone], [Contents], [SendTime], [SendIP], [IsOk]) VALUES (37, N'chdq0306@qq.com', N'邮箱验证码为:932755 服务器返回结果:False', CAST(N'2020-02-20T16:04:13.727' AS DateTime), N'106.15.231.152', 0)
INSERT [dbo].[m_Sms] ([SmsID], [Phone], [Contents], [SendTime], [SendIP], [IsOk]) VALUES (38, N'52116709@qq.com', N'邮箱验证码为:270489 服务器返回结果:True', CAST(N'2020-03-07T12:21:49.623' AS DateTime), N'::1', 1)
INSERT [dbo].[m_Sms] ([SmsID], [Phone], [Contents], [SendTime], [SendIP], [IsOk]) VALUES (39, N'52116709@qq.com', N'邮箱验证码为:853475 服务器返回结果:True', CAST(N'2020-03-07T12:27:51.573' AS DateTime), N'::1', 1)
INSERT [dbo].[m_Sms] ([SmsID], [Phone], [Contents], [SendTime], [SendIP], [IsOk]) VALUES (40, N'908008766@qq.com', N'邮箱验证码为:873585 服务器返回结果:False', CAST(N'2020-03-09T09:19:10.647' AS DateTime), N'::ffff:172.18.0.1', 0)
INSERT [dbo].[m_Sms] ([SmsID], [Phone], [Contents], [SendTime], [SendIP], [IsOk]) VALUES (41, N'867662267@qq.com', N'邮箱验证码为:928291 服务器返回结果:False', CAST(N'2020-03-10T01:19:18.197' AS DateTime), N'::ffff:172.18.0.1', 0)
INSERT [dbo].[m_Sms] ([SmsID], [Phone], [Contents], [SendTime], [SendIP], [IsOk]) VALUES (42, N'867662267@qq.com', N'邮箱验证码为:789983 服务器返回结果:False', CAST(N'2020-03-10T01:21:58.707' AS DateTime), N'::ffff:172.18.0.1', 0)
INSERT [dbo].[m_Sms] ([SmsID], [Phone], [Contents], [SendTime], [SendIP], [IsOk]) VALUES (43, N'1169614663@qq.com', N'邮箱验证码为:341100 服务器返回结果:False', CAST(N'2020-03-10T05:51:59.667' AS DateTime), N'::ffff:172.18.0.1', 0)
INSERT [dbo].[m_Sms] ([SmsID], [Phone], [Contents], [SendTime], [SendIP], [IsOk]) VALUES (44, N'1169614663@qq.com', N'邮箱验证码为:242912 服务器返回结果:False', CAST(N'2020-03-10T05:52:04.147' AS DateTime), N'::ffff:172.18.0.1', 0)
SET IDENTITY_INSERT [dbo].[m_Sms] OFF
INSERT [dbo].[m_WebSiteConfig] ([ConfigId], [WebSiteName], [WebSiteUrl], [WebSiteTitle], [WebSiteKeyWord], [WebSiteDescription], [CopyrightText], [IsLogin], [IsRegister], [FilingNo]) VALUES (1, N'51Core技术网', N'http://www.51core.net', N'专注于.NET Core的技术分享网站', N'.net core,asp.net core,mvc', N'专注于.NET Core的技术分享网站', N'版权所有', 1, 1, N'粤ICP备13058630号-1')
SET IDENTITY_INSERT [dbo].[m_WebSiteNavigation] ON 

INSERT [dbo].[m_WebSiteNavigation] ([NavigationId], [LinkUrl], [NavigationName], [IsTarget], [AppendTime], [SortCount], [IsShow]) VALUES (1, N'/cms/channel', N'文章', 0, CAST(N'2018-11-16T16:11:25.000' AS DateTime), 1, 1)
INSERT [dbo].[m_WebSiteNavigation] ([NavigationId], [LinkUrl], [NavigationName], [IsTarget], [AppendTime], [SortCount], [IsShow]) VALUES (3, N'/docs/theme', N'文档', 0, CAST(N'2018-11-16T16:11:25.000' AS DateTime), 2, 1)
SET IDENTITY_INSERT [dbo].[m_WebSiteNavigation] OFF
ALTER TABLE [dbo].[m_Navigation] ADD  CONSTRAINT [DF_m_Navigation_ClickCount]  DEFAULT ((0)) FOR [ClickCount]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_Account', @level2type=N'COLUMN',@level2name=N'AccountId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_Account', @level2type=N'COLUMN',@level2name=N'AccountName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登陆密码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_Account', @level2type=N'COLUMN',@level2name=N'Password'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'昵称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_Account', @level2type=N'COLUMN',@level2name=N'NickName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户头像' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_Account', @level2type=N'COLUMN',@level2name=N'HeadUrl'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户状态(1:正常,0:禁止)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_Account', @level2type=N'COLUMN',@level2name=N'StateCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'手机号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_Account', @level2type=N'COLUMN',@level2name=N'Phone'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'注册时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_Account', @level2type=N'COLUMN',@level2name=N'RegisterDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最后登陆时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_Account', @level2type=N'COLUMN',@level2name=N'LastLoginDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'地区信息' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_Account', @level2type=N'COLUMN',@level2name=N'AddressInfo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'生日' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_Account', @level2type=N'COLUMN',@level2name=N'Birthday'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'个人标签' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_Account', @level2type=N'COLUMN',@level2name=N'Tags'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'性别' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_Account', @level2type=N'COLUMN',@level2name=N'Sex'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户组Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_AccountGroup', @level2type=N'COLUMN',@level2name=N'GroupId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户组名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_AccountGroup', @level2type=N'COLUMN',@level2name=N'GroupName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'记录Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_AccountPlusRecords', @level2type=N'COLUMN',@level2name=N'RecordsId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'点赞对象Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_AccountPlusRecords', @level2type=N'COLUMN',@level2name=N'ObjectId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'添加人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_AccountPlusRecords', @level2type=N'COLUMN',@level2name=N'AccountId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'添加时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_AccountPlusRecords', @level2type=N'COLUMN',@level2name=N'AppendTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'记录类型 1 帖子点赞 2 帖子回答点赞 3 帖子评论点赞 4 文档点赞 5 文档项点赞' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_AccountPlusRecords', @level2type=N'COLUMN',@level2name=N'RecordsType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'应用ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_AppManager', @level2type=N'COLUMN',@level2name=N'AppId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'应用名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_AppManager', @level2type=N'COLUMN',@level2name=N'AppName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注信息' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_AppManager', @level2type=N'COLUMN',@level2name=N'RemarkText'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否已关闭' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_AppManager', @level2type=N'COLUMN',@level2name=N'IsOpen'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'允许请求API的开放地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_AppManager', @level2type=N'COLUMN',@level2name=N'OpenUrl'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'允许请求API的IP地址白名单' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_AppManager', @level2type=N'COLUMN',@level2name=N'OpenIP'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'APP秘钥键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_AppManager', @level2type=N'COLUMN',@level2name=N'AppKey'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'APP秘钥' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_AppManager', @level2type=N'COLUMN',@level2name=N'AppSecret'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'添加时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_AppManager', @level2type=N'COLUMN',@level2name=N'AppendTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最后更新时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_AppManager', @level2type=N'COLUMN',@level2name=N'LastTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'关注Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_CmsAttention', @level2type=N'COLUMN',@level2name=N'AttentionId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'帖子Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_CmsAttention', @level2type=N'COLUMN',@level2name=N'ContentsId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'关注时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_CmsAttention', @level2type=N'COLUMN',@level2name=N'AttentionTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_CmsAttention', @level2type=N'COLUMN',@level2name=N'AccountId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'频道名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_CmsChannel', @level2type=N'COLUMN',@level2name=N'ChannelName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注信息' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_CmsChannel', @level2type=N'COLUMN',@level2name=N'RemarkText'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否显示' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_CmsChannel', @level2type=N'COLUMN',@level2name=N'StateCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'频道创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_CmsChannel', @level2type=N'COLUMN',@level2name=N'AppendTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'内容Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_CmsContents', @level2type=N'COLUMN',@level2name=N'ContentsId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'标题' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_CmsContents', @level2type=N'COLUMN',@level2name=N'Title'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_CmsContents', @level2type=N'COLUMN',@level2name=N'Contents'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'发布时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_CmsContents', @level2type=N'COLUMN',@level2name=N'PostTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最后更新时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_CmsContents', @level2type=N'COLUMN',@level2name=N'LastTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'账号Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_CmsContents', @level2type=N'COLUMN',@level2name=N'AccountId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'+1数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_CmsContents', @level2type=N'COLUMN',@level2name=N'PlusCount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'阅读次数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_CmsContents', @level2type=N'COLUMN',@level2name=N'ReadCount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否显示' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_CmsContents', @level2type=N'COLUMN',@level2name=N'StateCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'内容标签' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_CmsContents', @level2type=N'COLUMN',@level2name=N'Tags'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'图片地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_CmsContents', @level2type=N'COLUMN',@level2name=N'ImgUrl'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'回复数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_CmsContents', @level2type=N'COLUMN',@level2name=N'AnswerCount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'所属频道' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_CmsContents', @level2type=N'COLUMN',@level2name=N'ChannelId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'文档项ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_Docs', @level2type=N'COLUMN',@level2name=N'DocsId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'标题' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_Docs', @level2type=N'COLUMN',@level2name=N'Title'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'短标题' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_Docs', @level2type=N'COLUMN',@level2name=N'ShortTitle'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_Docs', @level2type=N'COLUMN',@level2name=N'Contents'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'添加时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_Docs', @level2type=N'COLUMN',@level2name=N'AppendTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最后更新时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_Docs', @level2type=N'COLUMN',@level2name=N'LastTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'所属文档' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_Docs', @level2type=N'COLUMN',@level2name=N'ThemeId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'发布人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_Docs', @level2type=N'COLUMN',@level2name=N'AccountId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'浏览数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_Docs', @level2type=N'COLUMN',@level2name=N'ReadCount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'+1数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_Docs', @level2type=N'COLUMN',@level2name=N'PlusCount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'标签' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_Docs', @level2type=N'COLUMN',@level2name=N'Tags'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'支持的版本信息' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_Docs', @level2type=N'COLUMN',@level2name=N'VersionText'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否显示' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_Docs', @level2type=N'COLUMN',@level2name=N'IsShow'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否已经审核' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_Docs', @level2type=N'COLUMN',@level2name=N'IsAudit'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'文档ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_DocsTheme', @level2type=N'COLUMN',@level2name=N'ThemeId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'标题' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_DocsTheme', @level2type=N'COLUMN',@level2name=N'Title'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'内容描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_DocsTheme', @level2type=N'COLUMN',@level2name=N'Contents'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'发布用户' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_DocsTheme', @level2type=N'COLUMN',@level2name=N'AccountId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'添加时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_DocsTheme', @level2type=N'COLUMN',@level2name=N'AppendTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最后更新时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_DocsTheme', @level2type=N'COLUMN',@level2name=N'LastTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'浏览数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_DocsTheme', @level2type=N'COLUMN',@level2name=N'ReadCount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'+1数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_DocsTheme', @level2type=N'COLUMN',@level2name=N'PlusCount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'标签' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_DocsTheme', @level2type=N'COLUMN',@level2name=N'Tags'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'版本号信息' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_DocsTheme', @level2type=N'COLUMN',@level2name=N'VersionText'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否显示' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_DocsTheme', @level2type=N'COLUMN',@level2name=N'IsShow'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'管理员Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_ManagerAccount', @level2type=N'COLUMN',@level2name=N'AdminId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'管理员这账号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_ManagerAccount', @level2type=N'COLUMN',@level2name=N'AdminName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'密码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_ManagerAccount', @level2type=N'COLUMN',@level2name=N'Password'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_ManagerAccount', @level2type=N'COLUMN',@level2name=N'IsStatus'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'角色Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_ManagerAccount', @level2type=N'COLUMN',@level2name=N'RoleId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'菜单Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_ManagerMenu', @level2type=N'COLUMN',@level2name=N'MenuId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'菜单名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_ManagerMenu', @level2type=N'COLUMN',@level2name=N'MenuName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'菜单地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_ManagerMenu', @level2type=N'COLUMN',@level2name=N'AreaName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'所属上级菜单' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_ManagerMenu', @level2type=N'COLUMN',@level2name=N'ParentId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'菜单级别' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_ManagerMenu', @level2type=N'COLUMN',@level2name=N'IsPower'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'权限Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_ManagerPower', @level2type=N'COLUMN',@level2name=N'PowerId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'菜单Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_ManagerPower', @level2type=N'COLUMN',@level2name=N'MenuId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'角色Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_ManagerPower', @level2type=N'COLUMN',@level2name=N'RoleId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'角色Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_ManagerRole', @level2type=N'COLUMN',@level2name=N'RoleId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'角色名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_ManagerRole', @level2type=N'COLUMN',@level2name=N'RoleName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'消息Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_Message', @level2type=N'COLUMN',@level2name=N'MessageId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'消息类型(0:系统消息,1:帖子消息,2:分享消息)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_Message', @level2type=N'COLUMN',@level2name=N'MessageType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_Message', @level2type=N'COLUMN',@level2name=N'Contents'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'提交时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_Message', @level2type=N'COLUMN',@level2name=N'PostTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'消息接收用户' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_Message', @level2type=N'COLUMN',@level2name=N'AccountId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'产生消息用户' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_Message', @level2type=N'COLUMN',@level2name=N'AppendAccountId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'存储对象Id(PostId ShareId)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_Message', @level2type=N'COLUMN',@level2name=N'ObjectId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否已经阅读' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_Message', @level2type=N'COLUMN',@level2name=N'IsRead'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'导航Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_Navigation', @level2type=N'COLUMN',@level2name=N'NavigationId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'导航名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_Navigation', @level2type=N'COLUMN',@level2name=N'NavigationName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否显示' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_Navigation', @level2type=N'COLUMN',@level2name=N'IsShow'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'导航描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_Navigation', @level2type=N'COLUMN',@level2name=N'Remark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'所属导航分类' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_Navigation', @level2type=N'COLUMN',@level2name=N'CId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分类Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_NavigationClassify', @level2type=N'COLUMN',@level2name=N'CId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分类名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_NavigationClassify', @level2type=N'COLUMN',@level2name=N'ClassifyName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否显示' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_NavigationClassify', @level2type=N'COLUMN',@level2name=N'IsShow'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'短信ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_Sms', @level2type=N'COLUMN',@level2name=N'SmsID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'短信手机号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_Sms', @level2type=N'COLUMN',@level2name=N'Phone'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'短信内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_Sms', @level2type=N'COLUMN',@level2name=N'Contents'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'发送时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_Sms', @level2type=N'COLUMN',@level2name=N'SendTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'发送IP地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_Sms', @level2type=N'COLUMN',@level2name=N'SendIP'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否发送成功' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_Sms', @level2type=N'COLUMN',@level2name=N'IsOk'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'网站名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_WebSiteConfig', @level2type=N'COLUMN',@level2name=N'WebSiteName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'网站地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_WebSiteConfig', @level2type=N'COLUMN',@level2name=N'WebSiteUrl'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'网站标题' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_WebSiteConfig', @level2type=N'COLUMN',@level2name=N'WebSiteTitle'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'网站关键字' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_WebSiteConfig', @level2type=N'COLUMN',@level2name=N'WebSiteKeyWord'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'网站描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_WebSiteConfig', @level2type=N'COLUMN',@level2name=N'WebSiteDescription'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'底部版权申明' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_WebSiteConfig', @level2type=N'COLUMN',@level2name=N'CopyrightText'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否开放登录' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_WebSiteConfig', @level2type=N'COLUMN',@level2name=N'IsLogin'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否开放注册' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_WebSiteConfig', @level2type=N'COLUMN',@level2name=N'IsRegister'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'网站备案号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_WebSiteConfig', @level2type=N'COLUMN',@level2name=N'FilingNo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'链接地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_WebSiteNavigation', @level2type=N'COLUMN',@level2name=N'LinkUrl'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'导航名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_WebSiteNavigation', @level2type=N'COLUMN',@level2name=N'NavigationName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否为跳转到新窗口' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_WebSiteNavigation', @level2type=N'COLUMN',@level2name=N'IsTarget'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'添加时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_WebSiteNavigation', @level2type=N'COLUMN',@level2name=N'AppendTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序(从小到大)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_WebSiteNavigation', @level2type=N'COLUMN',@level2name=N'SortCount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否显示到前端' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_WebSiteNavigation', @level2type=N'COLUMN',@level2name=N'IsShow'
GO
USE [master]
GO
ALTER DATABASE [MangoPlatformDB] SET  READ_WRITE 
GO
