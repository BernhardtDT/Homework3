USE [master]
GO
/****** Object:  Database [Student]    Script Date: 2020/02/27 17:09:30 ******/
CREATE DATABASE [Student]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Student', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Student.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Student_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Student_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Student] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Student].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Student] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Student] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Student] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Student] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Student] SET ARITHABORT OFF 
GO
ALTER DATABASE [Student] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Student] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Student] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Student] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Student] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Student] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Student] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Student] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Student] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Student] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Student] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Student] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Student] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Student] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Student] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Student] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Student] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Student] SET RECOVERY FULL 
GO
ALTER DATABASE [Student] SET  MULTI_USER 
GO
ALTER DATABASE [Student] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Student] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Student] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Student] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Student] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Student', N'ON'
GO
ALTER DATABASE [Student] SET QUERY_STORE = OFF
GO
USE [Student]
GO
/****** Object:  Table [dbo].[Grade]    Script Date: 2020/02/27 17:09:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Grade](
	[Grade_ID] [int] IDENTITY(1,1) NOT NULL,
	[Student_ID] [int] NULL,
	[Subject_ID] [int] NULL,
	[Grade_Mark] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Grade_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 2020/02/27 17:09:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[Student_ID] [int] IDENTITY(1,1) NOT NULL,
	[Student_Name] [varchar](20) NULL,
	[Student_Surname] [varchar](20) NULL,
	[Student_Number] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[Student_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Subject]    Script Date: 2020/02/27 17:09:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subject](
	[Subject_ID] [int] IDENTITY(1,1) NOT NULL,
	[Subject_Name] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[Subject_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Token]    Script Date: 2020/02/27 17:09:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Token](
	[Token_ID] [int] IDENTITY(1,1) NOT NULL,
	[User_ID] [int] NULL,
	[Timer] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[Token_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 2020/02/27 17:09:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[User_ID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](30) NULL,
	[Password] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[User_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Grade] ON 

INSERT [dbo].[Grade] ([Grade_ID], [Student_ID], [Subject_ID], [Grade_Mark]) VALUES (1, 1, 1, 98)
INSERT [dbo].[Grade] ([Grade_ID], [Student_ID], [Subject_ID], [Grade_Mark]) VALUES (2, 1, 2, 75)
INSERT [dbo].[Grade] ([Grade_ID], [Student_ID], [Subject_ID], [Grade_Mark]) VALUES (3, 1, 3, 69)
INSERT [dbo].[Grade] ([Grade_ID], [Student_ID], [Subject_ID], [Grade_Mark]) VALUES (4, 1, 4, 76)
INSERT [dbo].[Grade] ([Grade_ID], [Student_ID], [Subject_ID], [Grade_Mark]) VALUES (5, 1, 5, 78)
INSERT [dbo].[Grade] ([Grade_ID], [Student_ID], [Subject_ID], [Grade_Mark]) VALUES (6, 2, 1, 73)
INSERT [dbo].[Grade] ([Grade_ID], [Student_ID], [Subject_ID], [Grade_Mark]) VALUES (7, 2, 2, 74)
INSERT [dbo].[Grade] ([Grade_ID], [Student_ID], [Subject_ID], [Grade_Mark]) VALUES (8, 2, 3, 66)
INSERT [dbo].[Grade] ([Grade_ID], [Student_ID], [Subject_ID], [Grade_Mark]) VALUES (9, 2, 8, 79)
INSERT [dbo].[Grade] ([Grade_ID], [Student_ID], [Subject_ID], [Grade_Mark]) VALUES (10, 2, 9, 55)
INSERT [dbo].[Grade] ([Grade_ID], [Student_ID], [Subject_ID], [Grade_Mark]) VALUES (11, 3, 1, 98)
INSERT [dbo].[Grade] ([Grade_ID], [Student_ID], [Subject_ID], [Grade_Mark]) VALUES (12, 3, 2, 75)
INSERT [dbo].[Grade] ([Grade_ID], [Student_ID], [Subject_ID], [Grade_Mark]) VALUES (13, 3, 3, 69)
INSERT [dbo].[Grade] ([Grade_ID], [Student_ID], [Subject_ID], [Grade_Mark]) VALUES (14, 3, 6, 98)
INSERT [dbo].[Grade] ([Grade_ID], [Student_ID], [Subject_ID], [Grade_Mark]) VALUES (15, 3, 7, 75)
INSERT [dbo].[Grade] ([Grade_ID], [Student_ID], [Subject_ID], [Grade_Mark]) VALUES (16, 3, 10, 55)
INSERT [dbo].[Grade] ([Grade_ID], [Student_ID], [Subject_ID], [Grade_Mark]) VALUES (17, 3, 11, 59)
SET IDENTITY_INSERT [dbo].[Grade] OFF
SET IDENTITY_INSERT [dbo].[Student] ON 

INSERT [dbo].[Student] ([Student_ID], [Student_Name], [Student_Surname], [Student_Number]) VALUES (1, N'Bernhard', N'Du Toit', N'16007878')
INSERT [dbo].[Student] ([Student_ID], [Student_Name], [Student_Surname], [Student_Number]) VALUES (2, N'Iain', N'Steyn', N'1609875')
INSERT [dbo].[Student] ([Student_ID], [Student_Name], [Student_Surname], [Student_Number]) VALUES (3, N'Cassie', N'Perkett', N'16098234')
SET IDENTITY_INSERT [dbo].[Student] OFF
SET IDENTITY_INSERT [dbo].[Subject] ON 

INSERT [dbo].[Subject] ([Subject_ID], [Subject_Name]) VALUES (1, N'INF 354')
INSERT [dbo].[Subject] ([Subject_ID], [Subject_Name]) VALUES (2, N'INF 315')
INSERT [dbo].[Subject] ([Subject_ID], [Subject_Name]) VALUES (3, N'INF 324')
INSERT [dbo].[Subject] ([Subject_ID], [Subject_Name]) VALUES (4, N'OBS 310')
INSERT [dbo].[Subject] ([Subject_ID], [Subject_Name]) VALUES (5, N'OBS 320')
INSERT [dbo].[Subject] ([Subject_ID], [Subject_Name]) VALUES (6, N'IOK 311')
INSERT [dbo].[Subject] ([Subject_ID], [Subject_Name]) VALUES (7, N'IOK 321')
INSERT [dbo].[Subject] ([Subject_ID], [Subject_Name]) VALUES (8, N'STK 310')
INSERT [dbo].[Subject] ([Subject_ID], [Subject_Name]) VALUES (9, N'STK 320')
INSERT [dbo].[Subject] ([Subject_ID], [Subject_Name]) VALUES (10, N'FRK 311')
INSERT [dbo].[Subject] ([Subject_ID], [Subject_Name]) VALUES (11, N'FRK 321')
SET IDENTITY_INSERT [dbo].[Subject] OFF
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([User_ID], [Username], [Password]) VALUES (1, N'Bernny', N'12345')
INSERT [dbo].[User] ([User_ID], [Username], [Password]) VALUES (2, N'Iainslaya', N'54321')
INSERT [dbo].[User] ([User_ID], [Username], [Password]) VALUES (3, N'Cassiethedassie', N'67890')
SET IDENTITY_INSERT [dbo].[User] OFF
ALTER TABLE [dbo].[Grade]  WITH CHECK ADD FOREIGN KEY([Student_ID])
REFERENCES [dbo].[Student] ([Student_ID])
GO
ALTER TABLE [dbo].[Grade]  WITH CHECK ADD FOREIGN KEY([Student_ID])
REFERENCES [dbo].[Student] ([Student_ID])
GO
ALTER TABLE [dbo].[Grade]  WITH CHECK ADD FOREIGN KEY([Student_ID])
REFERENCES [dbo].[Student] ([Student_ID])
GO
ALTER TABLE [dbo].[Grade]  WITH CHECK ADD FOREIGN KEY([Subject_ID])
REFERENCES [dbo].[Subject] ([Subject_ID])
GO
ALTER TABLE [dbo].[Grade]  WITH CHECK ADD FOREIGN KEY([Subject_ID])
REFERENCES [dbo].[Subject] ([Subject_ID])
GO
ALTER TABLE [dbo].[Grade]  WITH CHECK ADD FOREIGN KEY([Subject_ID])
REFERENCES [dbo].[Subject] ([Subject_ID])
GO
ALTER TABLE [dbo].[Token]  WITH CHECK ADD FOREIGN KEY([User_ID])
REFERENCES [dbo].[User] ([User_ID])
GO
ALTER TABLE [dbo].[Token]  WITH CHECK ADD FOREIGN KEY([User_ID])
REFERENCES [dbo].[User] ([User_ID])
GO
ALTER TABLE [dbo].[Token]  WITH CHECK ADD FOREIGN KEY([User_ID])
REFERENCES [dbo].[User] ([User_ID])
GO
USE [master]
GO
ALTER DATABASE [Student] SET  READ_WRITE 
GO
