USE [master]
GO
/****** Object:  Database [DW_Sales_Music]    Script Date: 25/2/2022 23:21:00 ******/
CREATE DATABASE [DW_Sales_Music]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DW_Sales_Music', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQL2021\MSSQL\DATA\DW_Sales_Music.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DW_Sales_Music_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQL2021\MSSQL\DATA\DW_Sales_Music_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [DW_Sales_Music] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DW_Sales_Music].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DW_Sales_Music] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DW_Sales_Music] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DW_Sales_Music] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DW_Sales_Music] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DW_Sales_Music] SET ARITHABORT OFF 
GO
ALTER DATABASE [DW_Sales_Music] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DW_Sales_Music] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DW_Sales_Music] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DW_Sales_Music] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DW_Sales_Music] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DW_Sales_Music] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DW_Sales_Music] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DW_Sales_Music] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DW_Sales_Music] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DW_Sales_Music] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DW_Sales_Music] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DW_Sales_Music] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DW_Sales_Music] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DW_Sales_Music] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DW_Sales_Music] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DW_Sales_Music] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DW_Sales_Music] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DW_Sales_Music] SET RECOVERY FULL 
GO
ALTER DATABASE [DW_Sales_Music] SET  MULTI_USER 
GO
ALTER DATABASE [DW_Sales_Music] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DW_Sales_Music] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DW_Sales_Music] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DW_Sales_Music] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DW_Sales_Music] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DW_Sales_Music] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'DW_Sales_Music', N'ON'
GO
ALTER DATABASE [DW_Sales_Music] SET QUERY_STORE = OFF
GO
USE [DW_Sales_Music]
GO
/****** Object:  Table [dbo].[Dim_Album]    Script Date: 25/2/2022 23:21:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Album](
	[AlbumId] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](160) NULL,
 CONSTRAINT [PK_Dim_Album] PRIMARY KEY CLUSTERED 
(
	[AlbumId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_Artist]    Script Date: 25/2/2022 23:21:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Artist](
	[ArtistId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](120) NULL,
 CONSTRAINT [PK_Dim_Artist] PRIMARY KEY CLUSTERED 
(
	[ArtistId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_Customer]    Script Date: 25/2/2022 23:21:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Customer](
	[CustomerId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](40) NULL,
	[LastName] [varchar](40) NULL,
	[Phone] [varchar](24) NULL,
	[Fax] [varchar](24) NULL,
	[Email] [varchar](60) NULL,
 CONSTRAINT [PK_Dim_Customers] PRIMARY KEY CLUSTERED 
(
	[CustomerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_Employee]    Script Date: 25/2/2022 23:21:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Employee](
	[EmployeeId] [int] IDENTITY(1,1) NOT NULL,
	[LastName] [varchar](20) NULL,
	[FirstName] [varchar](20) NULL,
	[Title] [varchar](30) NULL,
	[BirthDate] [datetime] NULL,
	[HireDate] [datetime] NULL,
	[Address] [varchar](70) NULL,
	[City] [varchar](40) NULL,
	[State] [varchar](40) NULL,
	[Country] [varchar](40) NULL,
	[PostalCode] [varchar](10) NULL,
	[Phone] [varchar](24) NULL,
	[Fax] [varchar](24) NULL,
	[Email] [varchar](60) NULL,
 CONSTRAINT [PK_Dim_Employee] PRIMARY KEY CLUSTERED 
(
	[EmployeeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_Invoice_Item]    Script Date: 25/2/2022 23:21:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Invoice_Item](
	[InvoiceItemID] [int] IDENTITY(1,1) NOT NULL,
	[UnitPrice] [numeric](10, 2) NULL,
	[Quantity] [int] NULL,
 CONSTRAINT [PK_Dim_Invoice_Items] PRIMARY KEY CLUSTERED 
(
	[InvoiceItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_Location]    Script Date: 25/2/2022 23:21:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Location](
	[LocationId] [int] IDENTITY(1,1) NOT NULL,
	[Address] [varchar](70) NULL,
	[City] [varchar](40) NULL,
	[State] [varchar](40) NULL,
	[Country] [varchar](40) NULL,
	[PostalCode] [varchar](10) NULL,
 CONSTRAINT [PK_Dim_Locations] PRIMARY KEY CLUSTERED 
(
	[LocationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_Time]    Script Date: 25/2/2022 23:21:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Time](
	[TimeId] [int] IDENTITY(1,1) NOT NULL,
	[fecha] [date] NULL,
	[año] [int] NULL,
	[mes] [int] NULL,
	[dia] [int] NULL,
	[nombre_dia] [varchar](50) NULL,
	[dia_semana] [int] NULL,
	[semana] [int] NULL,
	[trimestre] [int] NULL,
 CONSTRAINT [PK_Dim_Time] PRIMARY KEY CLUSTERED 
(
	[TimeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_Track]    Script Date: 25/2/2022 23:21:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Track](
	[TrackId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](255) NULL,
	[MediaType] [varchar](255) NULL,
	[Genre] [varchar](255) NULL,
	[Composer] [varchar](255) NULL,
	[Milliseconds] [int] NULL,
	[Bytes] [int] NULL,
	[UnitPrice] [numeric](10, 2) NULL,
 CONSTRAINT [PK_Dim_Track] PRIMARY KEY CLUSTERED 
(
	[TrackId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Fact_Sales]    Script Date: 25/2/2022 23:21:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fact_Sales](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[InvoicesID] [int] NULL,
	[CustomerID] [int] NULL,
	[EmployeeID] [int] NULL,
	[TimeID] [int] NULL,
	[LocationID] [int] NULL,
	[TrackId] [int] NULL,
	[ArtistId] [int] NULL,
	[AlbumId] [int] NULL,
	[Total] [numeric](10, 2) NULL,
 CONSTRAINT [PK_Fact_sales] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Fact_Sales]  WITH CHECK ADD  CONSTRAINT [FK_Fact_sales_Dim_Album] FOREIGN KEY([AlbumId])
REFERENCES [dbo].[Dim_Album] ([AlbumId])
GO
ALTER TABLE [dbo].[Fact_Sales] CHECK CONSTRAINT [FK_Fact_sales_Dim_Album]
GO
ALTER TABLE [dbo].[Fact_Sales]  WITH CHECK ADD  CONSTRAINT [FK_Fact_sales_Dim_Artist] FOREIGN KEY([ArtistId])
REFERENCES [dbo].[Dim_Artist] ([ArtistId])
GO
ALTER TABLE [dbo].[Fact_Sales] CHECK CONSTRAINT [FK_Fact_sales_Dim_Artist]
GO
ALTER TABLE [dbo].[Fact_Sales]  WITH CHECK ADD  CONSTRAINT [FK_Fact_sales_Dim_Customer] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Dim_Customer] ([CustomerId])
GO
ALTER TABLE [dbo].[Fact_Sales] CHECK CONSTRAINT [FK_Fact_sales_Dim_Customer]
GO
ALTER TABLE [dbo].[Fact_Sales]  WITH CHECK ADD  CONSTRAINT [FK_Fact_Sales_Dim_Employee] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Dim_Employee] ([EmployeeId])
GO
ALTER TABLE [dbo].[Fact_Sales] CHECK CONSTRAINT [FK_Fact_Sales_Dim_Employee]
GO
ALTER TABLE [dbo].[Fact_Sales]  WITH CHECK ADD  CONSTRAINT [FK_Fact_sales_Dim_Invoice_Item] FOREIGN KEY([InvoicesID])
REFERENCES [dbo].[Dim_Invoice_Item] ([InvoiceItemID])
GO
ALTER TABLE [dbo].[Fact_Sales] CHECK CONSTRAINT [FK_Fact_sales_Dim_Invoice_Item]
GO
ALTER TABLE [dbo].[Fact_Sales]  WITH CHECK ADD  CONSTRAINT [FK_Fact_sales_Dim_Location] FOREIGN KEY([LocationID])
REFERENCES [dbo].[Dim_Location] ([LocationId])
GO
ALTER TABLE [dbo].[Fact_Sales] CHECK CONSTRAINT [FK_Fact_sales_Dim_Location]
GO
ALTER TABLE [dbo].[Fact_Sales]  WITH CHECK ADD  CONSTRAINT [FK_Fact_Sales_Dim_Time1] FOREIGN KEY([TimeID])
REFERENCES [dbo].[Dim_Time] ([TimeId])
GO
ALTER TABLE [dbo].[Fact_Sales] CHECK CONSTRAINT [FK_Fact_Sales_Dim_Time1]
GO
ALTER TABLE [dbo].[Fact_Sales]  WITH CHECK ADD  CONSTRAINT [FK_Fact_sales_Dim_Track] FOREIGN KEY([TrackId])
REFERENCES [dbo].[Dim_Track] ([TrackId])
GO
ALTER TABLE [dbo].[Fact_Sales] CHECK CONSTRAINT [FK_Fact_sales_Dim_Track]
GO
USE [master]
GO
ALTER DATABASE [DW_Sales_Music] SET  READ_WRITE 
GO
