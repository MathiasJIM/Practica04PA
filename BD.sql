USE [master]
GO
/****** Object:  Database [Practica4PA]    Script Date: 5/12/2023 20:55:54 ******/
CREATE DATABASE [Practica4PA]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Practica4PA', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Practica4PA.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Practica4PA_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Practica4PA_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Practica4PA] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Practica4PA].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Practica4PA] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Practica4PA] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Practica4PA] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Practica4PA] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Practica4PA] SET ARITHABORT OFF 
GO
ALTER DATABASE [Practica4PA] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Practica4PA] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Practica4PA] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Practica4PA] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Practica4PA] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Practica4PA] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Practica4PA] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Practica4PA] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Practica4PA] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Practica4PA] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Practica4PA] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Practica4PA] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Practica4PA] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Practica4PA] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Practica4PA] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Practica4PA] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Practica4PA] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Practica4PA] SET RECOVERY FULL 
GO
ALTER DATABASE [Practica4PA] SET  MULTI_USER 
GO
ALTER DATABASE [Practica4PA] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Practica4PA] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Practica4PA] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Practica4PA] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Practica4PA] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Practica4PA] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Practica4PA', N'ON'
GO
ALTER DATABASE [Practica4PA] SET QUERY_STORE = ON
GO
ALTER DATABASE [Practica4PA] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Practica4PA]
GO
/****** Object:  Table [dbo].[Abonos]    Script Date: 5/12/2023 20:55:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Abonos](
	[AbonoID] [int] IDENTITY(1,1) NOT NULL,
	[PrincipalID] [int] NULL,
	[Compra] [nvarchar](20) NULL,
	[Abono] [decimal](10, 2) NULL,
	[SaldoAnterior] [decimal](10, 2) NULL,
	[FechaAbono] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[AbonoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Principal]    Script Date: 5/12/2023 20:55:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Principal](
	[PrincipalID] [int] IDENTITY(1,1) NOT NULL,
	[CodigoCompra] [nvarchar](20) NULL,
	[Descripcion] [nvarchar](255) NULL,
	[Precio] [decimal](10, 2) NULL,
	[Saldo] [decimal](10, 2) NULL,
	[Estado] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[PrincipalID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Principal] ON 

INSERT [dbo].[Principal] ([PrincipalID], [CodigoCompra], [Descripcion], [Precio], [Saldo], [Estado]) VALUES (1, N'ABC123', N'Zapatos Deportivos', CAST(50.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), N'Pendiente')
INSERT [dbo].[Principal] ([PrincipalID], [CodigoCompra], [Descripcion], [Precio], [Saldo], [Estado]) VALUES (2, N'XYZ789', N'Bolso Elegante', CAST(75.00 AS Decimal(10, 2)), CAST(75.00 AS Decimal(10, 2)), N'Pendiente')
INSERT [dbo].[Principal] ([PrincipalID], [CodigoCompra], [Descripcion], [Precio], [Saldo], [Estado]) VALUES (3, N'DEF456', N'Camiseta Casual', CAST(30.00 AS Decimal(10, 2)), CAST(30.00 AS Decimal(10, 2)), N'Aprobado')
INSERT [dbo].[Principal] ([PrincipalID], [CodigoCompra], [Descripcion], [Precio], [Saldo], [Estado]) VALUES (4, N'GHI789', N'Portátil Ultraligero', CAST(100.00 AS Decimal(10, 2)), CAST(5.00 AS Decimal(10, 2)), N'Pendiente')
INSERT [dbo].[Principal] ([PrincipalID], [CodigoCompra], [Descripcion], [Precio], [Saldo], [Estado]) VALUES (5, N'JKL012', N'Gafas de Sol', CAST(25.00 AS Decimal(10, 2)), CAST(25.00 AS Decimal(10, 2)), N'Aprobado')
INSERT [dbo].[Principal] ([PrincipalID], [CodigoCompra], [Descripcion], [Precio], [Saldo], [Estado]) VALUES (6, N'MNO345', N'Cámara Digital', CAST(60.00 AS Decimal(10, 2)), CAST(60.00 AS Decimal(10, 2)), N'Pendiente')
INSERT [dbo].[Principal] ([PrincipalID], [CodigoCompra], [Descripcion], [Precio], [Saldo], [Estado]) VALUES (7, N'PQR678', N'Smartwatch Fitness', CAST(90.00 AS Decimal(10, 2)), CAST(90.00 AS Decimal(10, 2)), N'Aprobado')
INSERT [dbo].[Principal] ([PrincipalID], [CodigoCompra], [Descripcion], [Precio], [Saldo], [Estado]) VALUES (8, N'STU901', N'Auriculares Inalámbricos', CAST(40.00 AS Decimal(10, 2)), CAST(15.00 AS Decimal(10, 2)), N'Pendiente')
INSERT [dbo].[Principal] ([PrincipalID], [CodigoCompra], [Descripcion], [Precio], [Saldo], [Estado]) VALUES (9, N'VWX234', N'Tablet Android', CAST(55.00 AS Decimal(10, 2)), CAST(55.00 AS Decimal(10, 2)), N'Pendiente')
INSERT [dbo].[Principal] ([PrincipalID], [CodigoCompra], [Descripcion], [Precio], [Saldo], [Estado]) VALUES (10, N'YZA567', N'Teclado Mecánico', CAST(80.00 AS Decimal(10, 2)), CAST(80.00 AS Decimal(10, 2)), N'Aprobado')
SET IDENTITY_INSERT [dbo].[Principal] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Principa__39DDA18E3FF0A36D]    Script Date: 5/12/2023 20:55:55 ******/
ALTER TABLE [dbo].[Principal] ADD UNIQUE NONCLUSTERED 
(
	[CodigoCompra] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Abonos]  WITH CHECK ADD FOREIGN KEY([PrincipalID])
REFERENCES [dbo].[Principal] ([PrincipalID])
GO
ALTER TABLE [dbo].[Abonos]  WITH CHECK ADD  CONSTRAINT [FK_Abonos_Principal] FOREIGN KEY([PrincipalID])
REFERENCES [dbo].[Principal] ([PrincipalID])
GO
ALTER TABLE [dbo].[Abonos] CHECK CONSTRAINT [FK_Abonos_Principal]
GO
USE [master]
GO
ALTER DATABASE [Practica4PA] SET  READ_WRITE 
GO
