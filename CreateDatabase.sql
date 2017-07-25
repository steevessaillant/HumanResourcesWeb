USE [master]
GO
/****** Object:  Database [aspnet-HumanResourcesWeb-20170330030007]    Script Date: 25/07/2017 18:00:12 ******/
CREATE DATABASE [aspnet-HumanResourcesWeb-20170330030007]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'aspnet-HumanResourcesWeb-20170330030007.mdf', FILENAME = N'D:\visual studio 2015\Projects\Selenium-RD-Test\HumanResourcesWeb\HumanResourcesWeb\App_Data\aspnet-HumanResourcesWeb-20170330030007.mdf' , SIZE = 4288KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'aspnet-HumanResourcesWeb-20170330030007_log.ldf', FILENAME = N'D:\visual studio 2015\Projects\Selenium-RD-Test\HumanResourcesWeb\HumanResourcesWeb\App_Data\aspnet-HumanResourcesWeb-20170330030007_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [aspnet-HumanResourcesWeb-20170330030007] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [aspnet-HumanResourcesWeb-20170330030007].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [aspnet-HumanResourcesWeb-20170330030007] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [aspnet-HumanResourcesWeb-20170330030007] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [aspnet-HumanResourcesWeb-20170330030007] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [aspnet-HumanResourcesWeb-20170330030007] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [aspnet-HumanResourcesWeb-20170330030007] SET ARITHABORT OFF 
GO
ALTER DATABASE [aspnet-HumanResourcesWeb-20170330030007] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [aspnet-HumanResourcesWeb-20170330030007] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [aspnet-HumanResourcesWeb-20170330030007] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [aspnet-HumanResourcesWeb-20170330030007] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [aspnet-HumanResourcesWeb-20170330030007] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [aspnet-HumanResourcesWeb-20170330030007] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [aspnet-HumanResourcesWeb-20170330030007] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [aspnet-HumanResourcesWeb-20170330030007] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [aspnet-HumanResourcesWeb-20170330030007] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [aspnet-HumanResourcesWeb-20170330030007] SET  ENABLE_BROKER 
GO
ALTER DATABASE [aspnet-HumanResourcesWeb-20170330030007] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [aspnet-HumanResourcesWeb-20170330030007] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [aspnet-HumanResourcesWeb-20170330030007] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [aspnet-HumanResourcesWeb-20170330030007] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [aspnet-HumanResourcesWeb-20170330030007] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [aspnet-HumanResourcesWeb-20170330030007] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [aspnet-HumanResourcesWeb-20170330030007] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [aspnet-HumanResourcesWeb-20170330030007] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [aspnet-HumanResourcesWeb-20170330030007] SET  MULTI_USER 
GO
ALTER DATABASE [aspnet-HumanResourcesWeb-20170330030007] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [aspnet-HumanResourcesWeb-20170330030007] SET DB_CHAINING OFF 
GO
ALTER DATABASE [aspnet-HumanResourcesWeb-20170330030007] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [aspnet-HumanResourcesWeb-20170330030007] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [aspnet-HumanResourcesWeb-20170330030007] SET DELAYED_DURABILITY = DISABLED 
GO
USE [aspnet-HumanResourcesWeb-20170330030007]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 25/07/2017 18:00:12 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 25/07/2017 18:00:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 25/07/2017 18:00:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 25/07/2017 18:00:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 25/07/2017 18:00:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 25/07/2017 18:00:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) NOT NULL,
	[Hometown] [nvarchar](max) NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [RoleNameIndex]    Script Date: 25/07/2017 18:00:12 ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 25/07/2017 18:00:12 ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 25/07/2017 18:00:12 ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_RoleId]    Script Date: 25/07/2017 18:00:12 ******/
CREATE NONCLUSTERED INDEX [IX_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 25/07/2017 18:00:12 ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserRoles]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UserNameIndex]    Script Date: 25/07/2017 18:00:12 ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
USE [master]
GO
ALTER DATABASE [aspnet-HumanResourcesWeb-20170330030007] SET  READ_WRITE 
GO
