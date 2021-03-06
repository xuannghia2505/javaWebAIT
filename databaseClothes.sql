USE [master]
GO


CREATE DATABASE [Clothes]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Clothes', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Clothes.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Clothes_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Clothes_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Clothes] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Clothes].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Clothes] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Clothes] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Clothes] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Clothes] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Clothes] SET ARITHABORT OFF 
GO
ALTER DATABASE [Clothes] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Clothes] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Clothes] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Clothes] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Clothes] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Clothes] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Clothes] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Clothes] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Clothes] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Clothes] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Clothes] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Clothes] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Clothes] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Clothes] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Clothes] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Clothes] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Clothes] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Clothes] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Clothes] SET  MULTI_USER 
GO
ALTER DATABASE [Clothes] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Clothes] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Clothes] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Clothes] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Clothes] SET DELAYED_DURABILITY = DISABLED 
GO
USE [Clothes]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 8/26/2021 8:58:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](50) NULL,
	[password] [nvarchar](50) NULL,
	[role] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DonHang]    Script Date: 8/26/2021 8:58:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DonHang](
	[maDonhang] [int] IDENTITY(1,1) NOT NULL,
	[tenKH] [nvarchar](50) NOT NULL,
	[diachi] [nvarchar](50) NOT NULL,
	[sdt] [nvarchar](50) NOT NULL,
	[email] [nvarchar](50) NOT NULL,
	[tongTien] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[maDonhang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[products]    Script Date: 8/26/2021 8:58:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[products](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[image] [nvarchar](500) NOT NULL,
	[price] [float] NOT NULL,
	[title] [nvarchar](50) NOT NULL,
	[description] [nvarchar](500) NOT NULL,
	[type] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([id], [username], [password], [role]) VALUES (2, N'nghia_ad', N'123', 1)
INSERT [dbo].[Account] ([id], [username], [password], [role]) VALUES (4, N'nghia2', N'123', 0)
INSERT [dbo].[Account] ([id], [username], [password], [role]) VALUES (5, N'nghia3', N'123', 0)
INSERT [dbo].[Account] ([id], [username], [password], [role]) VALUES (6, N'nghiavip', N'123', 0)
INSERT [dbo].[Account] ([id], [username], [password], [role]) VALUES (13, N'nghia5', N'123', 0)
INSERT [dbo].[Account] ([id], [username], [password], [role]) VALUES (17, N'nghia6', N'123', 0)
SET IDENTITY_INSERT [dbo].[Account] OFF
SET IDENTITY_INSERT [dbo].[DonHang] ON 

INSERT [dbo].[DonHang] ([maDonhang], [tenKH], [diachi], [sdt], [email], [tongTien]) VALUES (1, N'nghia', N'hue', N'0355535433', N'xuannghia255@gmail.com', 200)
INSERT [dbo].[DonHang] ([maDonhang], [tenKH], [diachi], [sdt], [email], [tongTien]) VALUES (2, N'nghia', N'quan ro', N'0355535433', N'xuannghia2255@gmail.com', 250)
INSERT [dbo].[DonHang] ([maDonhang], [tenKH], [diachi], [sdt], [email], [tongTien]) VALUES (3, N'nghia21', N'hue', N'0355535433', N'xuannghia255@gmail.com', 300)
INSERT [dbo].[DonHang] ([maDonhang], [tenKH], [diachi], [sdt], [email], [tongTien]) VALUES (4, N'ha xuan nghia', N'quan ro la chu', N'113', N'xuannghia255@gmail.com', 390)
INSERT [dbo].[DonHang] ([maDonhang], [tenKH], [diachi], [sdt], [email], [tongTien]) VALUES (5, N'nghia', N'quan ro la chu', N'113', N'xuannghia255@gmail.com', 630)
INSERT [dbo].[DonHang] ([maDonhang], [tenKH], [diachi], [sdt], [email], [tongTien]) VALUES (10, N'nghiav', N'quan ro', N'123', N'123', 50)
SET IDENTITY_INSERT [dbo].[DonHang] OFF
SET IDENTITY_INSERT [dbo].[products] ON 

INSERT [dbo].[products] ([id], [name], [image], [price], [title], [description], [type]) VALUES (1, N'Clothes MTP', N'https://media3.scdn.vn/img4/2021/04_02/3GesgzXLwne4ryCuQPBo_simg_de2fe0_250x250_maxb.jpg', 50, N'Is the best', N'Son Tung MT-P clothes', N'spring')
INSERT [dbo].[products] ([id], [name], [image], [price], [title], [description], [type]) VALUES (2, N'Clothes MTP', N'https://media3.scdn.vn/img4/2021/06_10/sKHoYYsU2ZiCgg8uVz6g_simg_de2fe0_250x250_maxb.jpg', 50, N'Is the best', N'Son Tung MT-P clothes', N'spring')
INSERT [dbo].[products] ([id], [name], [image], [price], [title], [description], [type]) VALUES (3, N'Clothes MTP', N'https://ae01.alicdn.com/kf/Ha61f791d68724d88ba54240a78c16e5e7/COCOEPPS-N-2-B-D-t-Kim-o-V-V-y-B-Sinh-Vi-n-Phong.png_250x250.png', 50, N'Is the best', N'Son Tung MT-P clothes', N'spring')
INSERT [dbo].[products] ([id], [name], [image], [price], [title], [description], [type]) VALUES (4, N'Clothes MTP', N'https://i.pinimg.com/474x/87/dd/e3/87dde3d72b1998ffce77d872133886f0.jpg', 50, N'Is the best', N'Son Tung MT-P clothes', N'spring')
INSERT [dbo].[products] ([id], [name], [image], [price], [title], [description], [type]) VALUES (5, N'Clothes MTP', N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR6lfqTh4owpCVR_WPnscqgY97v0OVSuRnJLA&usqp=CAU', 50, N'Is the best', N'Son Tung MT-P clothes', N'spring')
INSERT [dbo].[products] ([id], [name], [image], [price], [title], [description], [type]) VALUES (6, N'Clothes MTP', N'https://thoitrangngaynay.com/upload/sanpham/thumbs/ao-khoac-kaki-nu-han-quoc-888-1.jpg', 50, N'Is the best', N'Son Tung MT-P clothes', N'spring')
INSERT [dbo].[products] ([id], [name], [image], [price], [title], [description], [type]) VALUES (7, N'Clothes MTP', N'https://media3.scdn.vn/img4/2021/04_01/Ef0x2hoDXcIcTtGXHJfx_simg_de2fe0_250x250_maxb.jpg', 50, N'Is the best', N'Son Tung MT-P clothes', N'spring')
INSERT [dbo].[products] ([id], [name], [image], [price], [title], [description], [type]) VALUES (8, N'Clothes MTP', N'https://media3.scdn.vn/img2/2018/10_26/BnIxSO_simg_b5529c_250x250_maxb.jpg', 50, N'Is the best', N'Son Tung MT-P clothes', N'spring')
INSERT [dbo].[products] ([id], [name], [image], [price], [title], [description], [type]) VALUES (9, N'Clothes MTP', N'https://media3.scdn.vn/img2/2018/10_26/BnIxSO_simg_b5529c_250x250_maxb.jpg', 50, N'Is the best', N'Son Tung MT-P clothes', N'spring')
INSERT [dbo].[products] ([id], [name], [image], [price], [title], [description], [type]) VALUES (10, N'Clothes MTP', N'https://thoitrangngaynay.com/upload/sanpham/thumbs/ao-khoac-kaki-nu-han-quoc-888-1.jpg', 50, N'Is the best', N'Son Tung MT-P clothes', N'spring')
INSERT [dbo].[products] ([id], [name], [image], [price], [title], [description], [type]) VALUES (11, N'Clothes MTP', N'https://media3.scdn.vn/img4/2021/04_01/Ef0x2hoDXcIcTtGXHJfx_simg_de2fe0_250x250_maxb.jpg', 50, N'Is the best', N'Son Tung MT-P clothes', N'spring')
INSERT [dbo].[products] ([id], [name], [image], [price], [title], [description], [type]) VALUES (12, N'Clothes MTP', N'https://ae01.alicdn.com/kf/Ha61f791d68724d88ba54240a78c16e5e7/COCOEPPS-N-2-B-D-t-Kim-o-V-V-y-B-Sinh-Vi-n-Phong.png_250x250.png', 50, N'Is the best', N'Son Tung MT-P clothes', N'spring')
INSERT [dbo].[products] ([id], [name], [image], [price], [title], [description], [type]) VALUES (13, N'Clothes MTP', N'https://i.pinimg.com/474x/87/dd/e3/87dde3d72b1998ffce77d872133886f0.jpg', 50, N'Is the best', N'Son Tung MT-P clothes', N'spring')
INSERT [dbo].[products] ([id], [name], [image], [price], [title], [description], [type]) VALUES (14, N'Clothes MTP', N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR6lfqTh4owpCVR_WPnscqgY97v0OVSuRnJLA&usqp=CAU', 50, N'Is the best', N'Son Tung MT-P clothes', N'spring')
INSERT [dbo].[products] ([id], [name], [image], [price], [title], [description], [type]) VALUES (15, N'Clothes MTP', N'https://media3.scdn.vn/img4/2021/04_02/3GesgzXLwne4ryCuQPBo_simg_de2fe0_250x250_maxb.jpg', 50, N'Is the best', N'Son Tung MT-P clothes', N'spring')
INSERT [dbo].[products] ([id], [name], [image], [price], [title], [description], [type]) VALUES (16, N'Clothes MTP', N'https://media3.scdn.vn/img4/2021/06_10/sKHoYYsU2ZiCgg8uVz6g_simg_de2fe0_250x250_maxb.jpg', 50, N'Is the best', N'Son Tung MT-P clothes', N'spring')
INSERT [dbo].[products] ([id], [name], [image], [price], [title], [description], [type]) VALUES (17, N'Clothes MTP', N'https://media3.scdn.vn/img4/2021/04_02/3GesgzXLwne4ryCuQPBo_simg_de2fe0_250x250_maxb.jpg', 50, N'Is the best', N'Son Tung MT-P clothes', N'spring')
INSERT [dbo].[products] ([id], [name], [image], [price], [title], [description], [type]) VALUES (18, N'Clothes MTP', N'https://media3.scdn.vn/img4/2021/06_10/sKHoYYsU2ZiCgg8uVz6g_simg_de2fe0_250x250_maxb.jpg', 100, N'Is the best', N'Son Tung MT-P clothes', N'spring')
INSERT [dbo].[products] ([id], [name], [image], [price], [title], [description], [type]) VALUES (19, N'Clothes MTP', N'https://ae01.alicdn.com/kf/Ha61f791d68724d88ba54240a78c16e5e7/COCOEPPS-N-2-B-D-t-Kim-o-V-V-y-B-Sinh-Vi-n-Phong.png_250x250.png', 100, N'Is the best', N'Son Tung MT-P clothes', N'spring')
INSERT [dbo].[products] ([id], [name], [image], [price], [title], [description], [type]) VALUES (20, N'Clothes MTP', N'https://i.pinimg.com/474x/87/dd/e3/87dde3d72b1998ffce77d872133886f0.jpg', 100, N'Is the best', N'Son Tung MT-P clothes', N'spring')
INSERT [dbo].[products] ([id], [name], [image], [price], [title], [description], [type]) VALUES (21, N'Clothes MTP', N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR6lfqTh4owpCVR_WPnscqgY97v0OVSuRnJLA&usqp=CAU', 75, N'Is the best', N'Son Tung MT-P clothes', N'spring')
INSERT [dbo].[products] ([id], [name], [image], [price], [title], [description], [type]) VALUES (22, N'Clothes MTP', N'https://thoitrangngaynay.com/upload/sanpham/thumbs/ao-khoac-kaki-nu-han-quoc-888-1.jpg', 80, N'Is the best', N'Son Tung MT-P clothes', N'spring')
INSERT [dbo].[products] ([id], [name], [image], [price], [title], [description], [type]) VALUES (23, N'Clothes MTP', N'https://media3.scdn.vn/img4/2021/04_01/Ef0x2hoDXcIcTtGXHJfx_simg_de2fe0_250x250_maxb.jpg', 120, N'Is the best', N'Son Tung MT-P clothes', N'spring')
INSERT [dbo].[products] ([id], [name], [image], [price], [title], [description], [type]) VALUES (24, N'Clothes MTP', N'https://media3.scdn.vn/img2/2018/10_26/BnIxSO_simg_b5529c_250x250_maxb.jpg', 50, N'Is the best', N'Son Tung MT-P clothes', N'spring')
INSERT [dbo].[products] ([id], [name], [image], [price], [title], [description], [type]) VALUES (25, N'Clothes MTP', N'https://media3.scdn.vn/img4/2021/04_02/3GesgzXLwne4ryCuQPBo_simg_de2fe0_250x250_maxb.jpg', 50, N'Is the best', N'Son Tung MT-P clothes', N'summer')
INSERT [dbo].[products] ([id], [name], [image], [price], [title], [description], [type]) VALUES (26, N'Clothes MTP', N'https://media3.scdn.vn/img4/2021/06_10/sKHoYYsU2ZiCgg8uVz6g_simg_de2fe0_250x250_maxb.jpg', 100, N'Is the best', N'Son Tung MT-P clothes', N'summer')
INSERT [dbo].[products] ([id], [name], [image], [price], [title], [description], [type]) VALUES (27, N'Clothes MTP', N'https://ae01.alicdn.com/kf/Ha61f791d68724d88ba54240a78c16e5e7/COCOEPPS-N-2-B-D-t-Kim-o-V-V-y-B-Sinh-Vi-n-Phong.png_250x250.png', 100, N'Is the best', N'Son Tung MT-P clothes', N'summer')
INSERT [dbo].[products] ([id], [name], [image], [price], [title], [description], [type]) VALUES (28, N'Clothes MTP', N'https://i.pinimg.com/474x/87/dd/e3/87dde3d72b1998ffce77d872133886f0.jpg', 100, N'Is the best', N'Son Tung MT-P clothes', N'summer')
INSERT [dbo].[products] ([id], [name], [image], [price], [title], [description], [type]) VALUES (29, N'Clothes MTP', N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR6lfqTh4owpCVR_WPnscqgY97v0OVSuRnJLA&usqp=CAU', 75, N'Is the best', N'Son Tung MT-P clothes', N'summer')
INSERT [dbo].[products] ([id], [name], [image], [price], [title], [description], [type]) VALUES (30, N'Clothes MTP', N'https://thoitrangngaynay.com/upload/sanpham/thumbs/ao-khoac-kaki-nu-han-quoc-888-1.jpg', 80, N'Is the best', N'Son Tung MT-P clothes', N'summer')
INSERT [dbo].[products] ([id], [name], [image], [price], [title], [description], [type]) VALUES (31, N'Clothes MTP', N'https://media3.scdn.vn/img4/2021/04_01/Ef0x2hoDXcIcTtGXHJfx_simg_de2fe0_250x250_maxb.jpg', 120, N'Is the best', N'Son Tung MT-P clothes', N'summer')
INSERT [dbo].[products] ([id], [name], [image], [price], [title], [description], [type]) VALUES (32, N'Clothes MTP', N'https://media3.scdn.vn/img2/2018/10_26/BnIxSO_simg_b5529c_250x250_maxb.jpg', 50, N'Is the best', N'Son Tung MT-P clothes', N'summer')
INSERT [dbo].[products] ([id], [name], [image], [price], [title], [description], [type]) VALUES (33, N'Clothes MTP', N'https://media3.scdn.vn/img4/2021/04_01/Ef0x2hoDXcIcTtGXHJfx_simg_de2fe0_250x250_maxb.jpg', 120, N'Is the best', N'Son Tung MT-P clothes', N'summer')
INSERT [dbo].[products] ([id], [name], [image], [price], [title], [description], [type]) VALUES (34, N'Clothes MTP', N'https://media3.scdn.vn/img2/2018/10_26/BnIxSO_simg_b5529c_250x250_maxb.jpg', 50, N'Is the best', N'Son Tung MT-P clothes', N'summer')
INSERT [dbo].[products] ([id], [name], [image], [price], [title], [description], [type]) VALUES (35, N'Clothes MTP', N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR6lfqTh4owpCVR_WPnscqgY97v0OVSuRnJLA&usqp=CAU', 75, N'Is the best', N'Son Tung MT-P clothes', N'summer')
INSERT [dbo].[products] ([id], [name], [image], [price], [title], [description], [type]) VALUES (36, N'Clothes MTP', N'https://thoitrangngaynay.com/upload/sanpham/thumbs/ao-khoac-kaki-nu-han-quoc-888-1.jpg', 80, N'Is the best', N'Son Tung MT-P clothes', N'summer')
INSERT [dbo].[products] ([id], [name], [image], [price], [title], [description], [type]) VALUES (37, N'Clothes MTP', N'https://ae01.alicdn.com/kf/Ha61f791d68724d88ba54240a78c16e5e7/COCOEPPS-N-2-B-D-t-Kim-o-V-V-y-B-Sinh-Vi-n-Phong.png_250x250.png', 100, N'Is the best', N'Son Tung MT-P clothes', N'summer')
INSERT [dbo].[products] ([id], [name], [image], [price], [title], [description], [type]) VALUES (38, N'Clothes MTP', N'https://i.pinimg.com/474x/87/dd/e3/87dde3d72b1998ffce77d872133886f0.jpg', 100, N'Is the best', N'Son Tung MT-P clothes', N'summer')
INSERT [dbo].[products] ([id], [name], [image], [price], [title], [description], [type]) VALUES (39, N'Clothes MTP', N'https://media3.scdn.vn/img4/2021/04_02/3GesgzXLwne4ryCuQPBo_simg_de2fe0_250x250_maxb.jpg', 50, N'Is the best', N'Son Tung MT-P clothes', N'summer')
INSERT [dbo].[products] ([id], [name], [image], [price], [title], [description], [type]) VALUES (40, N'Clothes MTP', N'https://media3.scdn.vn/img4/2021/06_10/sKHoYYsU2ZiCgg8uVz6g_simg_de2fe0_250x250_maxb.jpg', 100, N'Is the best', N'Son Tung MT-P clothes', N'summer')
INSERT [dbo].[products] ([id], [name], [image], [price], [title], [description], [type]) VALUES (41, N'Clothes MTP', N'https://i.pinimg.com/474x/87/dd/e3/87dde3d72b1998ffce77d872133886f0.jpg', 100, N'Is the best', N'Son Tung MT-P clothes', N'summer')
INSERT [dbo].[products] ([id], [name], [image], [price], [title], [description], [type]) VALUES (42, N'Clothes MTP', N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR6lfqTh4owpCVR_WPnscqgY97v0OVSuRnJLA&usqp=CAU', 75, N'Is the best', N'Son Tung MT-P clothes', N'summer')
INSERT [dbo].[products] ([id], [name], [image], [price], [title], [description], [type]) VALUES (43, N'Clothes MTP', N'https://thoitrangngaynay.com/upload/sanpham/thumbs/ao-khoac-kaki-nu-han-quoc-888-1.jpg', 80, N'Is the best', N'Son Tung MT-P clothes', N'summer')
INSERT [dbo].[products] ([id], [name], [image], [price], [title], [description], [type]) VALUES (44, N'Clothes MTP', N'https://media3.scdn.vn/img4/2021/04_02/3GesgzXLwne4ryCuQPBo_simg_de2fe0_250x250_maxb.jpg', 50, N'Is the best', N'Son Tung MT-P clothes', N'summer')
INSERT [dbo].[products] ([id], [name], [image], [price], [title], [description], [type]) VALUES (45, N'Clothes MTP', N'https://media3.scdn.vn/img4/2021/06_10/sKHoYYsU2ZiCgg8uVz6g_simg_de2fe0_250x250_maxb.jpg', 100, N'Is the best', N'Son Tung MT-P clothes', N'summer')
INSERT [dbo].[products] ([id], [name], [image], [price], [title], [description], [type]) VALUES (46, N'Clothes MTP', N'https://ae01.alicdn.com/kf/Ha61f791d68724d88ba54240a78c16e5e7/COCOEPPS-N-2-B-D-t-Kim-o-V-V-y-B-Sinh-Vi-n-Phong.png_250x250.png', 100, N'Is the best', N'Son Tung MT-P clothes', N'summer')
INSERT [dbo].[products] ([id], [name], [image], [price], [title], [description], [type]) VALUES (47, N'Clothes MTP', N'https://media3.scdn.vn/img4/2021/04_01/Ef0x2hoDXcIcTtGXHJfx_simg_de2fe0_250x250_maxb.jpg', 120, N'Is the best', N'Son Tung MT-P clothes', N'summer')
INSERT [dbo].[products] ([id], [name], [image], [price], [title], [description], [type]) VALUES (48, N'Clothes MTP', N'https://media3.scdn.vn/img2/2018/10_26/BnIxSO_simg_b5529c_250x250_maxb.jpg', 50, N'Is the best', N'Son Tung MT-P clothes', N'summer')
INSERT [dbo].[products] ([id], [name], [image], [price], [title], [description], [type]) VALUES (49, N'Clothes Jack', N'https://linhstyle.vn/userfiles/2021/06/thumb/277_z2573294063844_1a7649c126b1f752cbf1f1e7f56038e5.jpg', 50, N'Is the best', N'Son Tung MT-P clothes', N'autumn')
INSERT [dbo].[products] ([id], [name], [image], [price], [title], [description], [type]) VALUES (50, N'Clothes Jack', N'https://media3.scdn.vn/img4/2021/06_10/sKHoYYsU2ZiCgg8uVz6g_simg_de2fe0_250x250_maxb.jpg', 100, N'Is the best', N'Son Tung MT-P clothes', N'autumn')
INSERT [dbo].[products] ([id], [name], [image], [price], [title], [description], [type]) VALUES (51, N'Clothes Jack', N'https://media3.scdn.vn/img4/2020/10_22/ILtnv2I5WZla15bZ8ZKw_simg_de2fe0_250x250_maxb.jpg', 100, N'Is the best', N'Son Tung MT-P clothes', N'autumn')
INSERT [dbo].[products] ([id], [name], [image], [price], [title], [description], [type]) VALUES (52, N'Clothes MTP', N'https://i.pinimg.com/474x/87/dd/e3/87dde3d72b1998ffce77d872133886f0.jpg', 100, N'Is the best', N'Son Tung MT-P clothes', N'autumn')
INSERT [dbo].[products] ([id], [name], [image], [price], [title], [description], [type]) VALUES (53, N'Clothes Jack', N'https://thoitrangngaynay.com/upload/sanpham/thumbs/quan-short-jeans-nu-lung-cao-co-2-tui-chat-jeans-dep-899-1.jpg', 75, N'Is the best', N'Son Tung MT-P clothes', N'autumn')
INSERT [dbo].[products] ([id], [name], [image], [price], [title], [description], [type]) VALUES (54, N'Clothes MTP', N'https://thoitrangngaynay.com/upload/sanpham/thumbs/ao-khoac-kaki-nu-han-quoc-888-1.jpg', 80, N'Is the best', N'Son Tung MT-P clothes', N'autumn')
INSERT [dbo].[products] ([id], [name], [image], [price], [title], [description], [type]) VALUES (55, N'Clothes MTP', N'https://media3.scdn.vn/img4/2021/04_01/Ef0x2hoDXcIcTtGXHJfx_simg_de2fe0_250x250_maxb.jpg', 120, N'Is the best', N'Son Tung MT-P clothes', N'autumn')
INSERT [dbo].[products] ([id], [name], [image], [price], [title], [description], [type]) VALUES (56, N'Clothes MTP', N'https://media3.scdn.vn/img4/2020/05_31/lftaBVc4Cmvqe4boKZh6_simg_de2fe0_250x250_maxb.png', 50, N'Is the best', N'Son Tung MT-P clothes', N'autumn')
INSERT [dbo].[products] ([id], [name], [image], [price], [title], [description], [type]) VALUES (57, N'Clothes Jack', N'https://linhstyle.vn/userfiles/2021/06/thumb/277_z2573294063844_1a7649c126b1f752cbf1f1e7f56038e5.jpg', 50, N'Is the best', N'Son Tung MT-P clothes', N'autumn')
INSERT [dbo].[products] ([id], [name], [image], [price], [title], [description], [type]) VALUES (58, N'Clothes Jack', N'https://media3.scdn.vn/img4/2021/06_10/sKHoYYsU2ZiCgg8uVz6g_simg_de2fe0_250x250_maxb.jpg', 100, N'Is the best', N'Son Tung MT-P clothes', N'autumn')
INSERT [dbo].[products] ([id], [name], [image], [price], [title], [description], [type]) VALUES (59, N'Clothes Jack', N'https://media3.scdn.vn/img4/2020/10_22/ILtnv2I5WZla15bZ8ZKw_simg_de2fe0_250x250_maxb.jpg', 100, N'Is the best', N'Son Tung MT-P clothes', N'autumn')
INSERT [dbo].[products] ([id], [name], [image], [price], [title], [description], [type]) VALUES (60, N'Clothes MTP', N'https://thoitrangngaynay.com/upload/sanpham/thumbs/ao-khoac-kaki-nu-han-quoc-888-1.jpg', 80, N'Is the best', N'Son Tung MT-P clothes', N'autumn')
INSERT [dbo].[products] ([id], [name], [image], [price], [title], [description], [type]) VALUES (61, N'Clothes MTP', N'https://media3.scdn.vn/img4/2021/04_01/Ef0x2hoDXcIcTtGXHJfx_simg_de2fe0_250x250_maxb.jpg', 120, N'Is the best', N'Son Tung MT-P clothes', N'autumn')
INSERT [dbo].[products] ([id], [name], [image], [price], [title], [description], [type]) VALUES (62, N'Clothes MTP', N'https://media3.scdn.vn/img4/2020/05_31/lftaBVc4Cmvqe4boKZh6_simg_de2fe0_250x250_maxb.png', 50, N'Is the best', N'Son Tung MT-P clothes', N'autumn')
INSERT [dbo].[products] ([id], [name], [image], [price], [title], [description], [type]) VALUES (63, N'Clothes MTP', N'https://i.pinimg.com/474x/87/dd/e3/87dde3d72b1998ffce77d872133886f0.jpg', 100, N'Is the best', N'Son Tung MT-P clothes', N'autumn')
INSERT [dbo].[products] ([id], [name], [image], [price], [title], [description], [type]) VALUES (64, N'Clothes Jack', N'https://thoitrangngaynay.com/upload/sanpham/thumbs/quan-short-jeans-nu-lung-cao-co-2-tui-chat-jeans-dep-899-1.jpg', 75, N'Is the best', N'Son Tung MT-P clothes', N'autumn')
SET IDENTITY_INSERT [dbo].[products] OFF
USE [master]
GO
ALTER DATABASE [Clothes] SET  READ_WRITE 
GO
