USE [master]
GO
/****** Object:  Database [user22]    Script Date: 11.09.2023 16:20:15 ******/
CREATE DATABASE [user22]
GO
USE [user22]
GO
/****** Object:  Table [dbo].[Client]    Script Date: 11.09.2023 16:20:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client](
	[ClientId] [int] IDENTITY(1,1) NOT NULL,
	[Familiya] [nvarchar](100) NULL,
	[Name] [nvarchar](100) NULL,
	[Otchestvo] [nvarchar](100) NULL,
	[Pol] [nvarchar](15) NULL,
	[Phone] [nvarchar](255) NULL,
	[BirthDate] [date] NULL,
	[Email] [nvarchar](155) NULL,
	[RegisterDate] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[ClientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Uslugi]    Script Date: 11.09.2023 16:20:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Uslugi](
	[UslugiId] [int] IDENTITY(1,1) NOT NULL,
	[Uslugi] [nvarchar](255) NULL,
	[Kartinka] [nvarchar](100) NULL,
	[Dlitelnost] [nvarchar](55) NULL,
	[Cena] [money] NULL,
	[Skidki] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[UslugiId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UslugiClient]    Script Date: 11.09.2023 16:20:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UslugiClient](
	[UslugiClientId] [int] IDENTITY(1,1) NOT NULL,
	[Uslugi] [nvarchar](255) NULL,
	[UslugiId] [int] NULL,
	[NachaloProvedeniyaUslugi] [datetime] NULL,
	[Client] [nvarchar](100) NULL,
	[ClientId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[UslugiClient] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[UslugiClient]  WITH CHECK ADD FOREIGN KEY([ClientId])
REFERENCES [dbo].[Client] ([ClientId])
GO
ALTER TABLE [dbo].[UslugiClient]  WITH CHECK ADD FOREIGN KEY([UslugiId])
REFERENCES [dbo].[Uslugi] ([UslugiId])
GO
USE [master]
GO
ALTER DATABASE [user22] SET  READ_WRITE 
GO
