USE [master]
GO

/****** Object:  Database [ShoeGalaxy]    Script Date: 10/04/2024 11:42:34 CH ******/
CREATE DATABASE [ShoeGalaxy]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ShoeGalaxy', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\ShoeGalaxy.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ShoeGalaxy_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\ShoeGalaxy_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [ShoeGalaxy] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ShoeGalaxy].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ShoeGalaxy] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ShoeGalaxy] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ShoeGalaxy] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ShoeGalaxy] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ShoeGalaxy] SET ARITHABORT OFF 
GO
ALTER DATABASE [ShoeGalaxy] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ShoeGalaxy] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ShoeGalaxy] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ShoeGalaxy] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ShoeGalaxy] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ShoeGalaxy] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ShoeGalaxy] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ShoeGalaxy] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ShoeGalaxy] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ShoeGalaxy] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ShoeGalaxy] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ShoeGalaxy] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ShoeGalaxy] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ShoeGalaxy] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ShoeGalaxy] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ShoeGalaxy] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ShoeGalaxy] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ShoeGalaxy] SET RECOVERY FULL 
GO
ALTER DATABASE [ShoeGalaxy] SET  MULTI_USER 
GO
ALTER DATABASE [ShoeGalaxy] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ShoeGalaxy] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ShoeGalaxy] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ShoeGalaxy] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ShoeGalaxy] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ShoeGalaxy] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'ShoeGalaxy', N'ON'
GO
ALTER DATABASE [ShoeGalaxy] SET QUERY_STORE = ON
GO
ALTER DATABASE [ShoeGalaxy] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [ShoeGalaxy]
GO
/****** Object:  Table [dbo].[Accounts]    Script Date: 10/04/2024 11:42:34 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accounts](
	[username] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
	[fullname] [nvarchar](50) NOT NULL,
	[email] [nvarchar](50) NOT NULL,
	[photo] [nvarchar](50) NULL,
	[available] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Addresses]    Script Date: 10/04/2024 11:42:34 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Addresses](
	[address_id] [int] IDENTITY(1,1) NOT NULL,
	[account_username] [nvarchar](50) NOT NULL,
	[address_detail] [nvarchar](255) NOT NULL,
	[city] [nvarchar](255) NULL,
	[district] [nvarchar](100) NULL,
	[ward] [nvarchar](100) NULL,
	[street] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[address_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Authorities]    Script Date: 10/04/2024 11:42:34 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Authorities](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](50) NOT NULL,
	[roleId] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 10/04/2024 11:42:34 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[id] [char](4) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[available] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[comments]    Script Date: 10/04/2024 11:42:34 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[comments](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[description] [nvarchar](max) NOT NULL,
	[create_date] [date] NOT NULL,
	[product_id] [int] NOT NULL,
	[username] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[contacts]    Script Date: 10/04/2024 11:42:34 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[contacts](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[fullname] [nvarchar](255) NOT NULL,
	[email] [varchar](50) NOT NULL,
	[phone] [varchar](20) NOT NULL,
	[subject] [nvarchar](255) NULL,
	[message] [text] NOT NULL,
	[create_Date] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[discount_codes]    Script Date: 10/04/2024 11:42:34 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[discount_codes](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[code] [varchar](255) NOT NULL,
	[discount_amount] [decimal](10, 2) NOT NULL,
	[quantity] [int] NOT NULL,
	[start_Date] [date] NOT NULL,
	[end_DATE] [date] NOT NULL,
	[activate] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[discount_product]    Script Date: 10/04/2024 11:42:34 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[discount_product](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[product_id] [int] NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[start_Date] [date] NOT NULL,
	[end_Date] [date] NOT NULL,
	[percentage] [float] NOT NULL,
	[active] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Images]    Script Date: 10/04/2024 11:42:34 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Images](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[image] [nvarchar](100) NULL,
	[product_id] [int] NULL,
 CONSTRAINT [PK_Images] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 10/04/2024 11:42:34 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[order_id] [bigint] NULL,
	[product_id] [int] NULL,
	[price] [float] NOT NULL,
	[quantity] [int] NOT NULL,
	[size] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 10/04/2024 11:42:34 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](50) NULL,
	[create_date] [datetime] NOT NULL,
	[address] [nvarchar](100) NOT NULL,
	[nguoinhan] [nvarchar](50) NOT NULL,
	[tongtien] [float] NOT NULL,
	[available] [bit] NULL,
	[phone] [varchar](11) NULL,
	[discountID] [int] NULL,
	[city] [nvarchar](255) NULL,
	[status] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 10/04/2024 11:42:34 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[category_id] [char](4) NULL,
	[name] [nvarchar](50) NOT NULL,
	[price] [float] NOT NULL,
	[quantity] [int] NULL,
	[available] [bit] NOT NULL,
	[description] [nvarchar](500) NULL,
 CONSTRAINT [PK__Products__3213E83FE24BFA19] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[replys]    Script Date: 10/04/2024 11:42:34 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[replys](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[description] [nvarchar](max) NOT NULL,
	[create_date] [date] NOT NULL,
	[product_id] [int] NOT NULL,
	[comment_id] [int] NOT NULL,
	[username] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 10/04/2024 11:42:34 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[id] [varchar](10) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShoppingCarts]    Script Date: 10/04/2024 11:42:34 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShoppingCarts](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](50) NULL,
	[product_id] [int] NULL,
	[image] [nvarchar](100) NULL,
	[name] [nvarchar](50) NULL,
	[size] [int] NULL,
	[price] [float] NULL,
	[qty] [int] NULL,
	[total] [float] NULL,
	[status] [bit] NULL,
 CONSTRAINT [PK_ShoppingCarts] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sizes]    Script Date: 10/04/2024 11:42:34 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sizes](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[product_id] [int] NULL,
	[size] [int] NULL,
	[quantity] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Accounts] ([username], [password], [fullname], [email], [photo], [available]) VALUES (N'Admin', N'123', N'Admin ShoeGalaxy11', N'ShoeGalaxy@gmail.com', N'3522aeb1.jpg', 1)
INSERT [dbo].[Accounts] ([username], [password], [fullname], [email], [photo], [available]) VALUES (N'nguyen', N'123', N'nguyên', N'chatgpt7@tranduy.de', N'nv01.jpg', NULL)
INSERT [dbo].[Accounts] ([username], [password], [fullname], [email], [photo], [available]) VALUES (N'nguyenpham242003@gmail.com', N'18ebc6adcfe', N'Phạm Đăng Nguyên', N'nguyenpham242003@gmail.com', N'nv01.jpg', NULL)
INSERT [dbo].[Accounts] ([username], [password], [fullname], [email], [photo], [available]) VALUES (N'NV01', N'123', N'Phạm Trung Hiếu', N'hieupt@fpt.edu.vn', N'hieu.jpg', 1)
GO
SET IDENTITY_INSERT [dbo].[Addresses] ON 

INSERT [dbo].[Addresses] ([address_id], [account_username], [address_detail], [city], [district], [ward], [street]) VALUES (1, N'NV01', N'68 Phùng Văn Cung, Phường 07, Quận Phú Nhuận, Thành phố Hồ Chí Minh', N'Thành phố Hồ Chí Minh', N'Quận Phú Nhuận', N'Phường 07', N'68 Phùng Văn Cung')
INSERT [dbo].[Addresses] ([address_id], [account_username], [address_detail], [city], [district], [ward], [street]) VALUES (2, N'NV01', N'68 Phùng Văn Cung, Phường Châu Khê, Thành phố Từ Sơn, Tỉnh Bắc Ninh', N'Tỉnh Bắc Ninh', N'Thành phố Từ Sơn', N'Phường Châu Khê', N'68 Phùng Văn Cung')
INSERT [dbo].[Addresses] ([address_id], [account_username], [address_detail], [city], [district], [ward], [street]) VALUES (3, N'nv01', N'68 Phùng Văn Cung, Xã Phú Lương, Huyện Phú Vang, Tỉnh Thừa Thiên Huế', N'Tỉnh Thừa Thiên Huế', N'Huyện Phú Vang', N'Xã Phú Lương', N'68 Phùng Văn Cung')
INSERT [dbo].[Addresses] ([address_id], [account_username], [address_detail], [city], [district], [ward], [street]) VALUES (4, N'nv01', N'68 Phùng Văn Cung, Xã Hố Quáng Phìn, Huyện Đồng Văn, Tỉnh Hà Giang', N'Tỉnh Hà Giang', N'Huyện Đồng Văn', N'Xã Hố Quáng Phìn', N'68 Phùng Văn Cung')
INSERT [dbo].[Addresses] ([address_id], [account_username], [address_detail], [city], [district], [ward], [street]) VALUES (5, N'nv01', N'69 Quận 1, Phường Dĩnh Kế, Thành phố Bắc Giang, Tỉnh Bắc Giang', N'Tỉnh Bắc Giang', N'Thành phố Bắc Giang', N'Phường Dĩnh Kế', N'69 Quận 1')
INSERT [dbo].[Addresses] ([address_id], [account_username], [address_detail], [city], [district], [ward], [street]) VALUES (12, N'admin', N'205/20 Phạm Đăng Giảng, Phường Bình Hưng Hòa, Xã Duyên Hà, Huyện Thanh Trì, Thành phố Hà Nội', N'Thành phố Hà Nội', N'Huyện Thanh Trì', N'Xã Duyên Hà', N'205/20 Phạm Đăng Giảng, Phường Bình Hưng Hòa')
INSERT [dbo].[Addresses] ([address_id], [account_username], [address_detail], [city], [district], [ward], [street]) VALUES (13, N'admin', N'28/16/23, 00394, 016, 01', N'01', N'016', N'00394', N'28/16/23')
INSERT [dbo].[Addresses] ([address_id], [account_username], [address_detail], [city], [district], [ward], [street]) VALUES (14, N'admin', N'28/16/23, 30415, 888, 89', N'89', N'888', N'30415', N'28/16/23')
INSERT [dbo].[Addresses] ([address_id], [account_username], [address_detail], [city], [district], [ward], [street]) VALUES (15, N'admin', N'fsdfs, 25789, 720, 74', N'74', N'720', N'25789', N'fsdfs')
INSERT [dbo].[Addresses] ([address_id], [account_username], [address_detail], [city], [district], [ward], [street]) VALUES (16, N'admin', N'28/16/23, Xã Cẩm Giàng, 063, 06', N'06', N'063', N'Xã Cẩm Giàng', N'28/16/23')
INSERT [dbo].[Addresses] ([address_id], [account_username], [address_detail], [city], [district], [ward], [street]) VALUES (17, N'admin', N'28/16/23, Xã Chiên Sơn, Huyện Sơn Động, Tỉnh Bắc Giang', N'Tỉnh Bắc Giang', N'Huyện Sơn Động', N'Xã Chiên Sơn', N'28/16/23')
INSERT [dbo].[Addresses] ([address_id], [account_username], [address_detail], [city], [district], [ward], [street]) VALUES (18, N'nguyenpham242003@gmail.com', N'qwqeqwe, Xã Hua Trai, Huyện Mường La, Tỉnh Sơn La', N'Tỉnh Sơn La', N'Huyện Mường La', N'Xã Hua Trai', N'qwqeqwe')
INSERT [dbo].[Addresses] ([address_id], [account_username], [address_detail], [city], [district], [ward], [street]) VALUES (19, N'admin', N'28/16/23, Xã Hán Quảng, Huyện Quế Võ, Tỉnh Bắc Ninh', N'Tỉnh Bắc Ninh', N'Huyện Quế Võ', N'Xã Hán Quảng', N'28/16/23')
INSERT [dbo].[Addresses] ([address_id], [account_username], [address_detail], [city], [district], [ward], [street]) VALUES (20, N'admin', N'28/16/23, Xã Dục Tú, Huyện Đông Anh, Thành phố Hà Nội', N'Thành phố Hà Nội', N'Huyện Đông Anh', N'Xã Dục Tú', N'28/16/23')
SET IDENTITY_INSERT [dbo].[Addresses] OFF
GO
SET IDENTITY_INSERT [dbo].[Authorities] ON 

INSERT [dbo].[Authorities] ([id], [username], [roleId]) VALUES (3, N'NV03', N'CUST')
INSERT [dbo].[Authorities] ([id], [username], [roleId]) VALUES (4, N'NV01', N'CUST')
INSERT [dbo].[Authorities] ([id], [username], [roleId]) VALUES (24, N'Admin', N'ADMI')
INSERT [dbo].[Authorities] ([id], [username], [roleId]) VALUES (48, N'NV01', N'ADMI')
INSERT [dbo].[Authorities] ([id], [username], [roleId]) VALUES (49, N'nguyenpham242003@gmail.com', N'CUST')
INSERT [dbo].[Authorities] ([id], [username], [roleId]) VALUES (50, N'nguyen', N'CUST')
SET IDENTITY_INSERT [dbo].[Authorities] OFF
GO
INSERT [dbo].[Categories] ([id], [name], [available]) VALUES (N'AD  ', N'Adidas', 0)
INSERT [dbo].[Categories] ([id], [name], [available]) VALUES (N'M   ', N'MLB', 0)
INSERT [dbo].[Categories] ([id], [name], [available]) VALUES (N'NK  ', N'Nike', 0)
INSERT [dbo].[Categories] ([id], [name], [available]) VALUES (N'pant', N'pant', 1)
INSERT [dbo].[Categories] ([id], [name], [available]) VALUES (N'puma', N'PUMA', 0)
INSERT [dbo].[Categories] ([id], [name], [available]) VALUES (N'SHI ', N'SHIRT', 1)
GO
SET IDENTITY_INSERT [dbo].[comments] ON 

INSERT [dbo].[comments] ([id], [description], [create_date], [product_id], [username]) VALUES (1037, N'123234', CAST(N'2023-11-29' AS Date), 1, N'vietbx23@gmail.com')
INSERT [dbo].[comments] ([id], [description], [create_date], [product_id], [username]) VALUES (1038, N'123', CAST(N'2023-11-29' AS Date), 1, N'vietbx23@gmail.com')
INSERT [dbo].[comments] ([id], [description], [create_date], [product_id], [username]) VALUES (1043, N'123', CAST(N'2023-11-30' AS Date), 2, N'XuanViet123')
INSERT [dbo].[comments] ([id], [description], [create_date], [product_id], [username]) VALUES (1044, N'nvnvj', CAST(N'2024-02-11' AS Date), 36, N'nv01')
SET IDENTITY_INSERT [dbo].[comments] OFF
GO
SET IDENTITY_INSERT [dbo].[contacts] ON 

INSERT [dbo].[contacts] ([id], [fullname], [email], [phone], [subject], [message], [create_Date]) VALUES (1, N'HieuPt', N'phamthieu961@gmail.com', N'123333333333', N'Lô', N'aaaaaaaaaa', CAST(N'2023-11-18' AS Date))
INSERT [dbo].[contacts] ([id], [fullname], [email], [phone], [subject], [message], [create_Date]) VALUES (2, N'Bùi Xuân Việt', N'Viebx23@gmail.com', N'0932718625', N'Viebx23@gmail.com', N'call me', CAST(N'2023-11-26' AS Date))
SET IDENTITY_INSERT [dbo].[contacts] OFF
GO
SET IDENTITY_INSERT [dbo].[discount_codes] ON 

INSERT [dbo].[discount_codes] ([id], [code], [discount_amount], [quantity], [start_Date], [end_DATE], [activate]) VALUES (1, N'KM01', CAST(30.00 AS Decimal(10, 2)), 9, CAST(N'2013-10-13' AS Date), CAST(N'2023-10-29' AS Date), 1)
INSERT [dbo].[discount_codes] ([id], [code], [discount_amount], [quantity], [start_Date], [end_DATE], [activate]) VALUES (2, N'1', CAST(1.00 AS Decimal(10, 2)), 0, CAST(N'2023-10-11' AS Date), CAST(N'2023-10-21' AS Date), 1)
INSERT [dbo].[discount_codes] ([id], [code], [discount_amount], [quantity], [start_Date], [end_DATE], [activate]) VALUES (3, N'BXV', CAST(10.00 AS Decimal(10, 2)), 983, CAST(N'2023-10-13' AS Date), CAST(N'2024-10-31' AS Date), 1)
SET IDENTITY_INSERT [dbo].[discount_codes] OFF
GO
SET IDENTITY_INSERT [dbo].[discount_product] ON 

INSERT [dbo].[discount_product] ([id], [product_id], [name], [start_Date], [end_Date], [percentage], [active]) VALUES (46, 4, N'concac', CAST(N'2024-02-22' AS Date), CAST(N'2024-03-01' AS Date), 50, 1)
SET IDENTITY_INSERT [dbo].[discount_product] OFF
GO
SET IDENTITY_INSERT [dbo].[Images] ON 

INSERT [dbo].[Images] ([id], [image], [product_id]) VALUES (1, N'm1_1.jpg', 1)
INSERT [dbo].[Images] ([id], [image], [product_id]) VALUES (2, N'm1_2.jpg', 1)
INSERT [dbo].[Images] ([id], [image], [product_id]) VALUES (3, N'm1_3.jpg', 1)
INSERT [dbo].[Images] ([id], [image], [product_id]) VALUES (4, N'm2_1.jpg', 2)
INSERT [dbo].[Images] ([id], [image], [product_id]) VALUES (5, N'm2_2.jpg', 2)
INSERT [dbo].[Images] ([id], [image], [product_id]) VALUES (6, N'm2_3.jpg', 2)
INSERT [dbo].[Images] ([id], [image], [product_id]) VALUES (7, N'm3_1.jpg', 3)
INSERT [dbo].[Images] ([id], [image], [product_id]) VALUES (8, N'm3_2.jpg', 3)
INSERT [dbo].[Images] ([id], [image], [product_id]) VALUES (9, N'm3_3.jpg', 3)
INSERT [dbo].[Images] ([id], [image], [product_id]) VALUES (10, N'm4_1.jpg', 4)
INSERT [dbo].[Images] ([id], [image], [product_id]) VALUES (11, N'ac9dacdb.jpg', 37)
INSERT [dbo].[Images] ([id], [image], [product_id]) VALUES (12, N'm4_3.jpg', 4)
INSERT [dbo].[Images] ([id], [image], [product_id]) VALUES (46, N'n1_1.jpg', 16)
INSERT [dbo].[Images] ([id], [image], [product_id]) VALUES (47, N'n1_2.jpg', 16)
INSERT [dbo].[Images] ([id], [image], [product_id]) VALUES (48, N'n1_3.jpg', 16)
INSERT [dbo].[Images] ([id], [image], [product_id]) VALUES (70, N'n9_1.webp', 24)
INSERT [dbo].[Images] ([id], [image], [product_id]) VALUES (71, N'n9_2.webp', 24)
INSERT [dbo].[Images] ([id], [image], [product_id]) VALUES (72, N'n9_3.webp', 24)
INSERT [dbo].[Images] ([id], [image], [product_id]) VALUES (80, N'1a7f2417.png', 36)
INSERT [dbo].[Images] ([id], [image], [product_id]) VALUES (81, N'4b9ce393.png', 36)
INSERT [dbo].[Images] ([id], [image], [product_id]) VALUES (82, N'7715c5d4.png', 36)
INSERT [dbo].[Images] ([id], [image], [product_id]) VALUES (83, N'e5ed5bb8.jpg', 37)
SET IDENTITY_INSERT [dbo].[Images] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderDetails] ON 

INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (2, 2, 24, 50, 1, 39)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (4, 4, 16, 35, 1, 39)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (5, 5, 24, 50, 1, 39)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (6, 6, 37, 350000, 1, 2)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (7, 7, 37, 350000, 1, 3)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (8, 8, 37, 350000, 1, 2)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (9, 10, 37, 350000, 1, 2)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (10, 11, 37, 350000, 1, 2)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (11, 13, 37, 350000, 1, 2)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (12, 14, 37, 350000, 1, 2)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (13, 15, 37, 350000, 1, 2)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (14, 16, 37, 350000, 1, 2)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (17, 19, 37, 350000, 1, 2)
SET IDENTITY_INSERT [dbo].[OrderDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [phone], [discountID], [city], [status]) VALUES (2, N'NV01', CAST(N'2023-02-01T00:00:00.000' AS DateTime), N'68 Phú Nhuận', N'Hiếu', 50, 1, N'0383689355', NULL, NULL, N'Đang Giao')
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [phone], [discountID], [city], [status]) VALUES (4, N'NV01', CAST(N'2023-04-01T00:00:00.000' AS DateTime), N'68 Phú Nhuận', N'Hiếu', 35, 1, N'0383689355', NULL, NULL, N'Đã Giao')
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [phone], [discountID], [city], [status]) VALUES (5, N'NV01', CAST(N'2023-05-01T00:00:00.000' AS DateTime), N'68 Phú Nhuận', N'Hiếu', 50, 1, N'0383689355', NULL, NULL, N'Đang Xác Nhận')
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [phone], [discountID], [city], [status]) VALUES (6, N'admin', CAST(N'2024-04-06T23:52:57.967' AS DateTime), N'205/20 Phạm Đăng Giảng, Phường Bình Hưng Hòa, Xã Duyên Hà, Huyện Thanh Trì, Thành phố Hà Nội', N'Admin ShoeGalaxy11', 350000, 0, N'0383689355', NULL, N'Thành phố Hà Nội', N'Đang Xác Nhận')
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [phone], [discountID], [city], [status]) VALUES (7, N'admin', CAST(N'2024-04-06T23:54:23.570' AS DateTime), N'205/20 Phạm Đăng Giảng, Phường Bình Hưng Hòa, Xã Duyên Hà, Huyện Thanh Trì, Thành phố Hà Nội', N'Admin ShoeGalaxy11', 350000, 0, N'0923442103', NULL, N'Thành phố Hà Nội', N'Đang Xác Nhận')
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [phone], [discountID], [city], [status]) VALUES (8, N'admin', CAST(N'2024-04-07T00:00:54.483' AS DateTime), N'205/20 Phạm Đăng Giảng, Phường Bình Hưng Hòa, Xã Duyên Hà, Huyện Thanh Trì, Thành phố Hà Nội', N'Admin ShoeGalaxy11', 350000, 0, N'0325235235', NULL, N'Thành phố Hà Nội', N'Đang Xác Nhận')
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [phone], [discountID], [city], [status]) VALUES (10, N'admin', CAST(N'2024-04-07T01:40:00.990' AS DateTime), N'Tp. Phan Rang - Tháp Chàm, Ninh Thuận', N'Admin ShoeGalaxy11', 350000, 0, N'0383689355', NULL, NULL, N'Đang Xác Nhận')
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [phone], [discountID], [city], [status]) VALUES (11, N'admin', CAST(N'2024-04-07T01:40:24.713' AS DateTime), N'Tp. Phan Rang - Tháp Chàm, Ninh Thuận', N'Admin ShoeGalaxy11', 350000, 0, N'0383689355', NULL, NULL, N'Đang Xác Nhận')
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [phone], [discountID], [city], [status]) VALUES (13, N'admin', CAST(N'2024-04-08T12:55:53.810' AS DateTime), N'28/16/23, 00394, 016, 01', N'Admin ShoeGalaxy11', 350000, 0, N'0383689355', NULL, N'01', N'Đang Xác Nhận')
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [phone], [discountID], [city], [status]) VALUES (14, N'admin', CAST(N'2024-04-08T13:01:15.890' AS DateTime), N'28/16/23, 30415, 888, 89', N'Admin ShoeGalaxy11', 350000, 0, N'0383689355', NULL, N'89', N'Đang Xác Nhận')
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [phone], [discountID], [city], [status]) VALUES (15, N'admin', CAST(N'2024-04-08T13:25:37.193' AS DateTime), N'28/16/23, Xã Chiên Sơn, Huyện Sơn Động, Tỉnh Bắc Giang', N'Admin ShoeGalaxy11', 350000, 0, N'0923442103', NULL, N'Tỉnh Bắc Giang', N'Đang Xác Nhận')
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [phone], [discountID], [city], [status]) VALUES (16, N'nguyenpham242003@gmail.com', CAST(N'2024-04-08T13:35:46.130' AS DateTime), N'qwqeqwe, Xã Hua Trai, Huyện Mường La, Tỉnh Sơn La', N'Phạm Đăng Nguyên', 350000, 0, N'0923442103', NULL, N'Tỉnh Sơn La', N'Đã Giao')
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [phone], [discountID], [city], [status]) VALUES (17, N'admin', CAST(N'2024-04-08T23:59:44.320' AS DateTime), N'205/20 Phạm Đăng Giảng, Phường Bình Hưng Hòa, Xã Duyên Hà, Huyện Thanh Trì, Thành phố Hà Nội', N'Admin ShoeGalaxy11', 350000, 0, N'0923442103', NULL, N'Thành phố Hà Nội', N'Đang Xác Nhận')
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [phone], [discountID], [city], [status]) VALUES (18, N'admin', CAST(N'2024-04-09T00:00:41.723' AS DateTime), N'28/16/23, Xã Hán Quảng, Huyện Quế Võ, Tỉnh Bắc Ninh', N'Admin ShoeGalaxy11', 350000, 0, N'0923442103', NULL, N'Tỉnh Bắc Ninh', N'Đã Giao')
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [phone], [discountID], [city], [status]) VALUES (19, N'admin', CAST(N'2024-04-09T00:09:04.357' AS DateTime), N'28/16/23, Xã Dục Tú, Huyện Đông Anh, Thành phố Hà Nội', N'Admin ShoeGalaxy11', 350000, 1, N'0383689355', NULL, N'Thành phố Hà Nội', N'Đã Giao')
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([id], [category_id], [name], [price], [quantity], [available], [description]) VALUES (1, N'M   ', N'MLB Chunky Liner Mid Denim Boston Red', 90, 10, 0, N'MLB Chunky Liner Mid Denim Boston Red là đôi giày thể thao nổi bật với chất liệu denim cao cấp và thiết kế độc đáo. Với đế giày dày mang lại sự thoải mái và ổn định, đây là lựa chọn hoàn hảo cho người yêu thể thao và phong cách cá tính. Màu sắc Boston Red tạo điểm nhấn nổi bật, biểu tượng cho sự đam mê và phong cách.')
INSERT [dbo].[Products] ([id], [category_id], [name], [price], [quantity], [available], [description]) VALUES (2, N'M   ', N'MLB BigBall Chunky A-Line', 90, 10, 0, N'Điển hình cho sự đổi mới sâu sắc cho dòng sản phẩm vốn đã rất nổi tiếng trong giới trẻ, sự pha trộn giữa nét vẽ đột phá của dòng liner cùng cái chất thể thao từ bộ sưu tập BigBall Chunky đã tạo ra một vẻ ngoài hoàn mới, được gọi với cái tên vô cùng cá tinh - BigBall Chunky A-Line.')
INSERT [dbo].[Products] ([id], [category_id], [name], [price], [quantity], [available], [description]) VALUES (3, N'M   ', N'MLB Bigball Chunky A New York Yankees', 90, 10, 0, N'MLB Chunky Liner Mid Denim Boston Red là đôi giày thể thao nổi bật với chất liệu denim cao cấp và thiết kế độc đáo. Với đế giày dày mang lại sự thoải mái và ổn định, đây là lựa chọn hoàn hảo cho người yêu thể thao và phong cách cá tính. Màu sắc Boston Red tạo điểm nhấn nổi bật, biểu tượng cho sự đam mê và phong cách.')
INSERT [dbo].[Products] ([id], [category_id], [name], [price], [quantity], [available], [description]) VALUES (4, N'M   ', N'MLB BigBall Chunky A LA Dodgers Off-White', 60, 10, 0, N'MLB Chunky Liner Mid Denim Boston Red là đôi giày thể thao nổi bật với chất liệu denim cao cấp và thiết kế độc đáo. Với đế giày dày mang lại sự thoải mái và ổn định, đây là lựa chọn hoàn hảo cho người yêu thể thao và phong cách cá tính. Màu sắc Boston Red tạo điểm nhấn nổi bật, biểu tượng cho sự đam mê và phong cách.')
INSERT [dbo].[Products] ([id], [category_id], [name], [price], [quantity], [available], [description]) VALUES (16, N'NK  ', N'Nike Air Force 1', 35, 10, 0, N'Nike Air Force 1, một biểu tượng không thể phủ nhận trong thế giới giày thể thao, đại diện cho sự độc đáo và phong cách đương đại của thương hiệu Nike. Ra mắt lần đầu tiên vào năm 1982 và vẫn tiếp tục làm mưa làm gió trong thị trường giày thể thao.')
INSERT [dbo].[Products] ([id], [category_id], [name], [price], [quantity], [available], [description]) VALUES (24, N'NK  ', N'Nike Blazer Mid', 50, 10, 0, N'Nike Air Force 1, một biểu tượng không thể phủ nhận trong thế giới giày thể thao, đại diện cho sự độc đáo và phong cách đương đại của thương hiệu Nike. Ra mắt lần đầu tiên vào năm 1982 và vẫn tiếp tục làm mưa làm gió trong thị trường giày thể thao.')
INSERT [dbo].[Products] ([id], [category_id], [name], [price], [quantity], [available], [description]) VALUES (36, N'M   ', N'Ps6', 123, NULL, 0, N'123')
INSERT [dbo].[Products] ([id], [category_id], [name], [price], [quantity], [available], [description]) VALUES (37, N'SHI ', N'Áo thun "Don Corleone"', 350000, NULL, 1, N'Chất liệu: 
- Chất liệu 100% cotton 2 chiều thấm hút mồ hôi tốt.
- Mềm mại, thoáng mát, không xù lông.
Công nghệ in: 
- Được in ấn theo công nghệ DTG tốt nhất hiện nay.
- Chất lượng hình ảnh sắc nét, không bong tróc. 
Form dáng: 
- Kiểu dáng unisex tạo cảm giác thoải mái, trẻ trung.')
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[replys] ON 

INSERT [dbo].[replys] ([id], [description], [create_date], [product_id], [comment_id], [username]) VALUES (46, N'234', CAST(N'2023-11-29' AS Date), 1, 1037, N'vietbx23@gmail.com')
SET IDENTITY_INSERT [dbo].[replys] OFF
GO
INSERT [dbo].[Roles] ([id], [name]) VALUES (N'ADMI', N'Admins')
INSERT [dbo].[Roles] ([id], [name]) VALUES (N'CUST', N'Customers')
GO
SET IDENTITY_INSERT [dbo].[ShoppingCarts] ON 

INSERT [dbo].[ShoppingCarts] ([id], [username], [product_id], [image], [name], [size], [price], [qty], [total], [status]) VALUES (1181, N'nv02', 3, N'm3_1.jpg', N'MLB Bigball Chunky A New York Yankees', 42, 90, 1, 90, 1)
INSERT [dbo].[ShoppingCarts] ([id], [username], [product_id], [image], [name], [size], [price], [qty], [total], [status]) VALUES (1182, N'nv02', 3, N'm3_1.jpg', N'MLB Bigball Chunky A New York Yankees', 39, 90, 1, 90, 1)
INSERT [dbo].[ShoppingCarts] ([id], [username], [product_id], [image], [name], [size], [price], [qty], [total], [status]) VALUES (1189, N'vietbxps22788@fpt.edu.vn', 3, N'm3_1.jpg', N'MLB Bigball Chunky A New York Yankees', 39, 90, 1, 90, 0)
INSERT [dbo].[ShoppingCarts] ([id], [username], [product_id], [image], [name], [size], [price], [qty], [total], [status]) VALUES (1190, N'vietbxps22788@fpt.edu.vn', 3, N'm3_1.jpg', N'MLB Bigball Chunky A New York Yankees', 42, 90, 1, 90, 0)
INSERT [dbo].[ShoppingCarts] ([id], [username], [product_id], [image], [name], [size], [price], [qty], [total], [status]) VALUES (1191, N'vietbxps22788@fpt.edu.vn', 1, N'm1_1.jpg', N'MLB Chunky Liner Mid Denim Boston Red', 40, 90, 1, 90, 1)
INSERT [dbo].[ShoppingCarts] ([id], [username], [product_id], [image], [name], [size], [price], [qty], [total], [status]) VALUES (1192, N'vietbxps22788@fpt.edu.vn', 1, N'm1_1.jpg', N'MLB Chunky Liner Mid Denim Boston Red', 43, 90, 2, 180, 1)
INSERT [dbo].[ShoppingCarts] ([id], [username], [product_id], [image], [name], [size], [price], [qty], [total], [status]) VALUES (1218, N'admin', 37, N'ac9dacdb.jpg', N'Áo thun "Don Corleone"', 2, 350000, 1, 350000, 0)
SET IDENTITY_INSERT [dbo].[ShoppingCarts] OFF
GO
SET IDENTITY_INSERT [dbo].[Sizes] ON 

INSERT [dbo].[Sizes] ([id], [product_id], [size], [quantity]) VALUES (96, 37, 3, 7)
INSERT [dbo].[Sizes] ([id], [product_id], [size], [quantity]) VALUES (97, 37, 1, 8)
INSERT [dbo].[Sizes] ([id], [product_id], [size], [quantity]) VALUES (98, 37, 2, 26)
SET IDENTITY_INSERT [dbo].[Sizes] OFF
GO
ALTER TABLE [dbo].[Addresses]  WITH CHECK ADD  CONSTRAINT [FK_Addresses_Accounts] FOREIGN KEY([account_username])
REFERENCES [dbo].[Accounts] ([username])
GO
ALTER TABLE [dbo].[Addresses] CHECK CONSTRAINT [FK_Addresses_Accounts]
GO
ALTER TABLE [dbo].[comments]  WITH CHECK ADD  CONSTRAINT [FK__comments__produc__2C3393D0] FOREIGN KEY([product_id])
REFERENCES [dbo].[Products] ([id])
GO
ALTER TABLE [dbo].[comments] CHECK CONSTRAINT [FK__comments__produc__2C3393D0]
GO
ALTER TABLE [dbo].[discount_product]  WITH CHECK ADD  CONSTRAINT [FK__discount___produ__2E1BDC42] FOREIGN KEY([product_id])
REFERENCES [dbo].[Products] ([id])
GO
ALTER TABLE [dbo].[discount_product] CHECK CONSTRAINT [FK__discount___produ__2E1BDC42]
GO
ALTER TABLE [dbo].[Images]  WITH CHECK ADD  CONSTRAINT [FK_Images_Products] FOREIGN KEY([product_id])
REFERENCES [dbo].[Products] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Images] CHECK CONSTRAINT [FK_Images_Products]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD FOREIGN KEY([order_id])
REFERENCES [dbo].[Orders] ([id])
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK__OrderDeta__produ__286302EC] FOREIGN KEY([product_id])
REFERENCES [dbo].[Products] ([id])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK__OrderDeta__produ__286302EC]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK__Products__catego__239E4DCF] FOREIGN KEY([category_id])
REFERENCES [dbo].[Categories] ([id])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK__Products__catego__239E4DCF]
GO
ALTER TABLE [dbo].[replys]  WITH CHECK ADD  CONSTRAINT [FK__replys__comment___34C8D9D1] FOREIGN KEY([comment_id])
REFERENCES [dbo].[comments] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[replys] CHECK CONSTRAINT [FK__replys__comment___34C8D9D1]
GO
ALTER TABLE [dbo].[replys]  WITH CHECK ADD  CONSTRAINT [FK__replys__product___35BCFE0A] FOREIGN KEY([product_id])
REFERENCES [dbo].[Products] ([id])
GO
ALTER TABLE [dbo].[replys] CHECK CONSTRAINT [FK__replys__product___35BCFE0A]
GO
ALTER TABLE [dbo].[ShoppingCarts]  WITH CHECK ADD  CONSTRAINT [FK_ShoppingCarts_Products] FOREIGN KEY([product_id])
REFERENCES [dbo].[Products] ([id])
GO
ALTER TABLE [dbo].[ShoppingCarts] CHECK CONSTRAINT [FK_ShoppingCarts_Products]
GO
ALTER TABLE [dbo].[Sizes]  WITH CHECK ADD  CONSTRAINT [FK_Sizes_Products] FOREIGN KEY([product_id])
REFERENCES [dbo].[Products] ([id])
GO
ALTER TABLE [dbo].[Sizes] CHECK CONSTRAINT [FK_Sizes_Products]
GO
/****** Object:  StoredProcedure [dbo].[DeleteAccountAndRelatedData]    Script Date: 10/04/2024 11:42:34 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteAccountAndRelatedData]
    @Username NVARCHAR(255)
AS
BEGIN
    DELETE FROM OrderDetails
    WHERE order_id IN (SELECT id FROM Orders WHERE username = @Username);
    DELETE FROM Orders
    WHERE username = @Username;
    DELETE FROM Addresses
    WHERE account_username = @Username;
    DELETE FROM Authorities
    WHERE username = @Username;
    DELETE FROM Accounts
    WHERE username = @Username;
END;

GO
USE [master]
GO
ALTER DATABASE [ShoeGalaxy] SET  READ_WRITE 
GO
