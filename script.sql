USE [master]
GO
/****** Object:  Database [BrokersDB]    Script Date: 26.04.2021 23:13:54 ******/
CREATE DATABASE [BrokersDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BrokersDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\BrokersDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BrokersDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\BrokersDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [BrokersDB] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BrokersDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BrokersDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BrokersDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BrokersDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BrokersDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BrokersDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [BrokersDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BrokersDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BrokersDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BrokersDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BrokersDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BrokersDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BrokersDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BrokersDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BrokersDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BrokersDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BrokersDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BrokersDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BrokersDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BrokersDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BrokersDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BrokersDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BrokersDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BrokersDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BrokersDB] SET  MULTI_USER 
GO
ALTER DATABASE [BrokersDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BrokersDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BrokersDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BrokersDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BrokersDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BrokersDB] SET QUERY_STORE = OFF
GO
USE [BrokersDB]
GO
/****** Object:  Table [dbo].[Брокер]    Script Date: 26.04.2021 23:13:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Брокер](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Фамилия] [nvarchar](50) NULL,
 CONSTRAINT [PK_Брокер] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Договор]    Script Date: 26.04.2021 23:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Договор](
	[Номер] [int] NOT NULL,
	[КлиентId] [int] NULL,
	[БрокерId] [int] NULL,
 CONSTRAINT [PK_Договор] PRIMARY KEY CLUSTERED 
(
	[Номер] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Клиент]    Script Date: 26.04.2021 23:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Клиент](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Фамилия] [nvarchar](50) NULL,
	[Имя] [nvarchar](50) NULL,
	[Отчество] [nvarchar](50) NULL,
	[ДоговорId] [int] NULL,
	[БрокерId] [int] NULL,
 CONSTRAINT [PK_Клиент] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ПредметСделки]    Script Date: 26.04.2021 23:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ПредметСделки](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Название] [nvarchar](50) NULL,
 CONSTRAINT [PK_ПредметСделки] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Сделка]    Script Date: 26.04.2021 23:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Сделка](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Дата] [datetime] NULL,
	[ДоговорId] [int] NULL,
	[IdПредмета] [int] NULL,
 CONSTRAINT [PK_Сделка] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Брокер] ON 

INSERT [dbo].[Брокер] ([Id], [Фамилия]) VALUES (1, N'Ирисова')
INSERT [dbo].[Брокер] ([Id], [Фамилия]) VALUES (2, N'Андропов')
INSERT [dbo].[Брокер] ([Id], [Фамилия]) VALUES (3, N'Мокрушин')
INSERT [dbo].[Брокер] ([Id], [Фамилия]) VALUES (4, N'Арапова')
INSERT [dbo].[Брокер] ([Id], [Фамилия]) VALUES (5, N'Салина')
INSERT [dbo].[Брокер] ([Id], [Фамилия]) VALUES (6, N'Гоголев')
INSERT [dbo].[Брокер] ([Id], [Фамилия]) VALUES (7, N'Зарипова')
INSERT [dbo].[Брокер] ([Id], [Фамилия]) VALUES (8, N'Ахметов')
INSERT [dbo].[Брокер] ([Id], [Фамилия]) VALUES (9, N'Сабирова')
SET IDENTITY_INSERT [dbo].[Брокер] OFF
GO
INSERT [dbo].[Договор] ([Номер], [КлиентId], [БрокерId]) VALUES (938, 5, 5)
INSERT [dbo].[Договор] ([Номер], [КлиентId], [БрокерId]) VALUES (947, 4, 4)
INSERT [dbo].[Договор] ([Номер], [КлиентId], [БрокерId]) VALUES (976, 3, 3)
INSERT [dbo].[Договор] ([Номер], [КлиентId], [БрокерId]) VALUES (983, 1, 1)
INSERT [dbo].[Договор] ([Номер], [КлиентId], [БрокерId]) VALUES (984, 2, 2)
GO
SET IDENTITY_INSERT [dbo].[Клиент] ON 

INSERT [dbo].[Клиент] ([Id], [Фамилия], [Имя], [Отчество], [ДоговорId], [БрокерId]) VALUES (1, N'Агапов', N'Павел', N'Валерьянович', 983, 1)
INSERT [dbo].[Клиент] ([Id], [Фамилия], [Имя], [Отчество], [ДоговорId], [БрокерId]) VALUES (2, N'Ирдов', N'Максим', N'Айратович', 984, 2)
INSERT [dbo].[Клиент] ([Id], [Фамилия], [Имя], [Отчество], [ДоговорId], [БрокерId]) VALUES (3, N'Лешина ', N'Алина', N'Эдуардовна', 976, 3)
INSERT [dbo].[Клиент] ([Id], [Фамилия], [Имя], [Отчество], [ДоговорId], [БрокерId]) VALUES (4, N'Павлова', N'Алиса', N'Алексеевна', 947, 4)
INSERT [dbo].[Клиент] ([Id], [Фамилия], [Имя], [Отчество], [ДоговорId], [БрокерId]) VALUES (5, N'Хамдеева', N'Дина', N'Ибрагимовна', 938, 5)
INSERT [dbo].[Клиент] ([Id], [Фамилия], [Имя], [Отчество], [ДоговорId], [БрокерId]) VALUES (6, N'Лукина', N'Дарья', N'Дмитриевна', NULL, 6)
INSERT [dbo].[Клиент] ([Id], [Фамилия], [Имя], [Отчество], [ДоговорId], [БрокерId]) VALUES (7, N'Патрисов', N'Дмитрий', N'Леонидович', NULL, 7)
SET IDENTITY_INSERT [dbo].[Клиент] OFF
GO
SET IDENTITY_INSERT [dbo].[ПредметСделки] ON 

INSERT [dbo].[ПредметСделки] ([Id], [Название]) VALUES (1, N'Акциии')
INSERT [dbo].[ПредметСделки] ([Id], [Название]) VALUES (2, N'Ценные бумаги')
INSERT [dbo].[ПредметСделки] ([Id], [Название]) VALUES (3, N'Деньги')
SET IDENTITY_INSERT [dbo].[ПредметСделки] OFF
GO
SET IDENTITY_INSERT [dbo].[Сделка] ON 

INSERT [dbo].[Сделка] ([Id], [Дата], [ДоговорId], [IdПредмета]) VALUES (1, CAST(N'2020-09-09T00:00:00.000' AS DateTime), 983, 1)
INSERT [dbo].[Сделка] ([Id], [Дата], [ДоговорId], [IdПредмета]) VALUES (2, CAST(N'2020-09-10T00:00:00.000' AS DateTime), 984, 2)
INSERT [dbo].[Сделка] ([Id], [Дата], [ДоговорId], [IdПредмета]) VALUES (3, CAST(N'2020-09-11T00:00:00.000' AS DateTime), 976, 3)
INSERT [dbo].[Сделка] ([Id], [Дата], [ДоговорId], [IdПредмета]) VALUES (4, CAST(N'2020-09-12T00:00:00.000' AS DateTime), 947, 1)
INSERT [dbo].[Сделка] ([Id], [Дата], [ДоговорId], [IdПредмета]) VALUES (5, CAST(N'2020-09-13T00:00:00.000' AS DateTime), 938, 3)
SET IDENTITY_INSERT [dbo].[Сделка] OFF
GO
ALTER TABLE [dbo].[Договор]  WITH CHECK ADD  CONSTRAINT [FK_Договор_Брокер] FOREIGN KEY([БрокерId])
REFERENCES [dbo].[Брокер] ([Id])
GO
ALTER TABLE [dbo].[Договор] CHECK CONSTRAINT [FK_Договор_Брокер]
GO
ALTER TABLE [dbo].[Клиент]  WITH CHECK ADD  CONSTRAINT [FK_Клиент_Брокер] FOREIGN KEY([БрокерId])
REFERENCES [dbo].[Брокер] ([Id])
GO
ALTER TABLE [dbo].[Клиент] CHECK CONSTRAINT [FK_Клиент_Брокер]
GO
ALTER TABLE [dbo].[Клиент]  WITH CHECK ADD  CONSTRAINT [FK_Клиент_Договор] FOREIGN KEY([ДоговорId])
REFERENCES [dbo].[Договор] ([Номер])
GO
ALTER TABLE [dbo].[Клиент] CHECK CONSTRAINT [FK_Клиент_Договор]
GO
ALTER TABLE [dbo].[Сделка]  WITH CHECK ADD  CONSTRAINT [FK_Сделка_Договор] FOREIGN KEY([ДоговорId])
REFERENCES [dbo].[Договор] ([Номер])
GO
ALTER TABLE [dbo].[Сделка] CHECK CONSTRAINT [FK_Сделка_Договор]
GO
ALTER TABLE [dbo].[Сделка]  WITH CHECK ADD  CONSTRAINT [FK_Сделка_ПредметСделки] FOREIGN KEY([IdПредмета])
REFERENCES [dbo].[ПредметСделки] ([Id])
GO
ALTER TABLE [dbo].[Сделка] CHECK CONSTRAINT [FK_Сделка_ПредметСделки]
GO
USE [master]
GO
ALTER DATABASE [BrokersDB] SET  READ_WRITE 
GO
