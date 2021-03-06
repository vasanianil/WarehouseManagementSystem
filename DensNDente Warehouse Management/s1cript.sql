USE [master]
GO
/****** Object:  Database [DensDB]    Script Date: 27/10/2013 10:15:07 PM ******/
CREATE DATABASE [DensDB]
GO
ALTER DATABASE [DensDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DensDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DensDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DensDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DensDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [DensDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DensDB] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [DensDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DensDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DensDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DensDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DensDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DensDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DensDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DensDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DensDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DensDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DensDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DensDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DensDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DensDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DensDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DensDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DensDB] SET RECOVERY FULL 
GO
ALTER DATABASE [DensDB] SET  MULTI_USER 
GO
ALTER DATABASE [DensDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DensDB] SET DB_CHAINING OFF 
GO
EXEC sys.sp_db_vardecimal_storage_format N'DensDB', N'ON'
GO
USE [DensDB]
GO
/****** Object:  Table [dbo].[tblBin]    Script Date: 27/10/2013 10:15:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblBin](
	[BinId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](10) NOT NULL,
	[Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_tblBin] PRIMARY KEY CLUSTERED 
(
	[BinId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblCustomer]    Script Date: 27/10/2013 10:15:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblCustomer](
	[CustomerId] [int] IDENTITY(1,1) NOT NULL,
	[Firstname] [varchar](50) NOT NULL,
	[Lastname] [varchar](50) NOT NULL,
	[Title] [varchar](50) NULL,
	[Address] [varchar](200) NOT NULL,
	[City] [varchar](50) NOT NULL,
	[State] [varchar](50) NOT NULL,
	[PostalCode] [varchar](6) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Phone] [varchar](10) NOT NULL,
	[Fax] [varchar](50) NULL,
	[Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_tblCustomer] PRIMARY KEY CLUSTERED 
(
	[CustomerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblEmployee]    Script Date: 27/10/2013 10:15:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblEmployee](
	[EmployeeId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[MiddleName] [varchar](50) NULL,
	[LastName] [varchar](50) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[PhoneNo] [varchar](50) NULL,
	[MobileNo] [varchar](50) NOT NULL,
	[Address] [varchar](150) NOT NULL,
	[SINNo] [varchar](20) NOT NULL,
	[PayPerHour] [float] NOT NULL,
	[RollId] [int] NOT NULL,
	[Deleted] [bit] NOT NULL,
	[Password] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tblEmployee] PRIMARY KEY CLUSTERED 
(
	[EmployeeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblNewsLetter]    Script Date: 27/10/2013 10:15:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblNewsLetter](
	[NewsId] [int] IDENTITY(1,1) NOT NULL,
	[NewsDate] [date] NOT NULL,
	[Message] [text] NULL,
	[Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_tblNewsLetter] PRIMARY KEY CLUSTERED 
(
	[NewsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblPermission]    Script Date: 27/10/2013 10:15:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPermission](
	[PermissionId] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [int] NOT NULL,
	[Insert_Item] [bit] NOT NULL,
	[Update_Item] [bit] NOT NULL,
	[Delete_Item] [bit] NOT NULL,
	[View_Item] [bit] NOT NULL,
	[Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_tblPermission] PRIMARY KEY CLUSTERED 
(
	[PermissionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblProduct]    Script Date: 27/10/2013 10:15:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblProduct](
	[ProductId] [int] NOT NULL,
	[ProductName] [varchar](100) NOT NULL,
	[ProductDescription] [text] NULL,
	[Deleted] [bit] NOT NULL,
	[BinId] [int] NOT NULL,
	[StandardCost] [money] NOT NULL,
	[SafetyStockLevel] [int] NOT NULL,
	[ReorderPoint] [int] NOT NULL,
	[ImagePath] [text] NULL,
	[Quantity] [int] NOT NULL,
	[SellingCost] [money] NOT NULL,
 CONSTRAINT [PK_tblProduct] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblPurchaseOrder]    Script Date: 27/10/2013 10:15:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPurchaseOrder](
	[POId] [int] IDENTITY(1,1) NOT NULL,
	[VendorId] [int] NOT NULL,
	[OrderDate] [date] NOT NULL,
	[TotalValue] [decimal](18, 2) NOT NULL,
	[ExpectedDeliveryDate] [date] NOT NULL,
	[Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_tblPurchaseOrder] PRIMARY KEY CLUSTERED 
(
	[POId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblPurchaseOrderDetails]    Script Date: 27/10/2013 10:15:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPurchaseOrderDetails](
	[PODetailId] [int] IDENTITY(1,1) NOT NULL,
	[POId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Price] [decimal](18, 2) NULL,
	[Deleted] [bit] NOT NULL,
	[ReceivedQuantity] [int] NOT NULL,
	[Recieved] [bit] NOT NULL,
 CONSTRAINT [PK_tblPurchaseOrderDetails] PRIMARY KEY CLUSTERED 
(
	[PODetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblRole]    Script Date: 27/10/2013 10:15:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblRole](
	[RoleId] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [varchar](20) NOT NULL,
	[Stock] [bit] NOT NULL,
	[Sales] [bit] NOT NULL,
	[Purchase] [bit] NOT NULL,
	[Admin] [bit] NOT NULL,
	[Payroll] [bit] NOT NULL,
	[SalesTarget] [bit] NOT NULL,
	[Reports] [bit] NOT NULL,
	[Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_tblRole] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblSalary]    Script Date: 27/10/2013 10:15:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblSalary](
	[SalaryId] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeId] [int] NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NOT NULL,
	[TotalHours] [float] NOT NULL,
	[TotalSalary] [decimal](18, 2) NOT NULL,
	[Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_tblSalary] PRIMARY KEY CLUSTERED 
(
	[SalaryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblSaleInvoice]    Script Date: 27/10/2013 10:15:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblSaleInvoice](
	[InvoiceId] [int] IDENTITY(1,1) NOT NULL,
	[InvoiceNo] [varchar](50) NULL,
	[InvoiceDate] [date] NULL,
	[CustomerId] [int] NOT NULL,
	[TotalSale] [decimal](18, 2) NOT NULL,
	[Tax] [decimal](18, 2) NOT NULL,
	[Discount] [decimal](18, 2) NOT NULL,
	[NetSale] [decimal](18, 2) NOT NULL,
	[Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_tblSaleInvoice] PRIMARY KEY CLUSTERED 
(
	[InvoiceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblSaleInvoiceDetail]    Script Date: 27/10/2013 10:15:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblSaleInvoiceDetail](
	[InvoiceDetailId] [int] IDENTITY(1,1) NOT NULL,
	[InvoiceId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_tblSaleInvoiceDetail] PRIMARY KEY CLUSTERED 
(
	[InvoiceDetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblSalesTarget]    Script Date: 27/10/2013 10:15:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblSalesTarget](
	[SalesTargetId] [int] IDENTITY(1,1) NOT NULL,
	[MonthName] [int] NOT NULL,
	[YearName] [int] NOT NULL,
	[TargetAmount] [int] NOT NULL,
	[AchievedAmount] [int] NOT NULL,
	[Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_tblSalesTarget] PRIMARY KEY CLUSTERED 
(
	[SalesTargetId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblVendor]    Script Date: 27/10/2013 10:15:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblVendor](
	[VendorId] [int] IDENTITY(1,1) NOT NULL,
	[VendorName] [varchar](100) NOT NULL,
	[VendorAddress] [varchar](150) NOT NULL,
	[VendorEmail] [varchar](50) NOT NULL,
	[VendorPhone] [varchar](50) NOT NULL,
	[VendorDescription] [varchar](50) NULL,
	[Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_tblVendor] PRIMARY KEY CLUSTERED 
(
	[VendorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[tblBin] ON 

INSERT [dbo].[tblBin] ([BinId], [Name], [Deleted]) VALUES (1, N'A1 - A5', 1)
INSERT [dbo].[tblBin] ([BinId], [Name], [Deleted]) VALUES (2, N'A1 - A5', 1)
INSERT [dbo].[tblBin] ([BinId], [Name], [Deleted]) VALUES (3, N'A1 - A5', 1)
INSERT [dbo].[tblBin] ([BinId], [Name], [Deleted]) VALUES (4, N'A1 - A5', 1)
INSERT [dbo].[tblBin] ([BinId], [Name], [Deleted]) VALUES (5, N'A1 - A5', 1)
INSERT [dbo].[tblBin] ([BinId], [Name], [Deleted]) VALUES (6, N'', 1)
INSERT [dbo].[tblBin] ([BinId], [Name], [Deleted]) VALUES (7, N'', 1)
INSERT [dbo].[tblBin] ([BinId], [Name], [Deleted]) VALUES (8, N'', 1)
INSERT [dbo].[tblBin] ([BinId], [Name], [Deleted]) VALUES (9, N'', 1)
INSERT [dbo].[tblBin] ([BinId], [Name], [Deleted]) VALUES (10, N'A1 - A5', 1)
INSERT [dbo].[tblBin] ([BinId], [Name], [Deleted]) VALUES (11, N'A1 - A5', 1)
INSERT [dbo].[tblBin] ([BinId], [Name], [Deleted]) VALUES (12, N'adas', 1)
INSERT [dbo].[tblBin] ([BinId], [Name], [Deleted]) VALUES (13, N'adas', 1)
INSERT [dbo].[tblBin] ([BinId], [Name], [Deleted]) VALUES (14, N'adas', 1)
INSERT [dbo].[tblBin] ([BinId], [Name], [Deleted]) VALUES (15, N'adas', 1)
INSERT [dbo].[tblBin] ([BinId], [Name], [Deleted]) VALUES (16, N'adas', 1)
INSERT [dbo].[tblBin] ([BinId], [Name], [Deleted]) VALUES (17, N'adas', 1)
INSERT [dbo].[tblBin] ([BinId], [Name], [Deleted]) VALUES (18, N'anil', 1)
INSERT [dbo].[tblBin] ([BinId], [Name], [Deleted]) VALUES (19, N'anil', 1)
INSERT [dbo].[tblBin] ([BinId], [Name], [Deleted]) VALUES (20, N'anil', 1)
INSERT [dbo].[tblBin] ([BinId], [Name], [Deleted]) VALUES (21, N'Maya', 1)
INSERT [dbo].[tblBin] ([BinId], [Name], [Deleted]) VALUES (22, N'Maya', 1)
INSERT [dbo].[tblBin] ([BinId], [Name], [Deleted]) VALUES (23, N'Maya', 1)
INSERT [dbo].[tblBin] ([BinId], [Name], [Deleted]) VALUES (24, N'B1 - A1', 1)
INSERT [dbo].[tblBin] ([BinId], [Name], [Deleted]) VALUES (25, N'A1 - A1', 0)
INSERT [dbo].[tblBin] ([BinId], [Name], [Deleted]) VALUES (26, N'A1 - A2', 0)
INSERT [dbo].[tblBin] ([BinId], [Name], [Deleted]) VALUES (27, N'A1 - B1', 0)
INSERT [dbo].[tblBin] ([BinId], [Name], [Deleted]) VALUES (28, N'B1 - D2', 0)
INSERT [dbo].[tblBin] ([BinId], [Name], [Deleted]) VALUES (29, N'B1 - D1', 0)
INSERT [dbo].[tblBin] ([BinId], [Name], [Deleted]) VALUES (30, N'C1 - C2', 0)
INSERT [dbo].[tblBin] ([BinId], [Name], [Deleted]) VALUES (31, N'C1 - A1', 0)
INSERT [dbo].[tblBin] ([BinId], [Name], [Deleted]) VALUES (32, N'C1 - C3', 0)
INSERT [dbo].[tblBin] ([BinId], [Name], [Deleted]) VALUES (33, N'F1 - A1', 0)
INSERT [dbo].[tblBin] ([BinId], [Name], [Deleted]) VALUES (34, N'F3 - A4', 0)
INSERT [dbo].[tblBin] ([BinId], [Name], [Deleted]) VALUES (35, N'F1 - A3', 0)
INSERT [dbo].[tblBin] ([BinId], [Name], [Deleted]) VALUES (36, N'F1 - A2', 0)
INSERT [dbo].[tblBin] ([BinId], [Name], [Deleted]) VALUES (37, N'B1 - A1', 1)
INSERT [dbo].[tblBin] ([BinId], [Name], [Deleted]) VALUES (38, N'A1 - A6 4', 1)
INSERT [dbo].[tblBin] ([BinId], [Name], [Deleted]) VALUES (39, N'B1 - A1', 0)
INSERT [dbo].[tblBin] ([BinId], [Name], [Deleted]) VALUES (40, N'Ahj', 0)
SET IDENTITY_INSERT [dbo].[tblBin] OFF
SET IDENTITY_INSERT [dbo].[tblCustomer] ON 

INSERT [dbo].[tblCustomer] ([CustomerId], [Firstname], [Lastname], [Title], [Address], [City], [State], [PostalCode], [Email], [Phone], [Fax], [Deleted]) VALUES (1, N'Anil', N'Vasani', N'Maya Company', N'#807,4000 Lawrence Avenue East', N'Scarborough', N'Ontario', N'M1E2R3', N'a@a.com', N'1647631436', N'1231231255', 0)
SET IDENTITY_INSERT [dbo].[tblCustomer] OFF
SET IDENTITY_INSERT [dbo].[tblEmployee] ON 

INSERT [dbo].[tblEmployee] ([EmployeeId], [FirstName], [MiddleName], [LastName], [Email], [PhoneNo], [MobileNo], [Address], [SINNo], [PayPerHour], [RollId], [Deleted], [Password]) VALUES (1, N'Anil', N'', N'Vasani', N'maya21166@gmail.com', N'99867786786786', N'786876', N'djaksdah', N'123456789', 10.5, 6, 0, N'wanrltw009')
SET IDENTITY_INSERT [dbo].[tblEmployee] OFF
SET IDENTITY_INSERT [dbo].[tblRole] ON 

INSERT [dbo].[tblRole] ([RoleId], [RoleName], [Stock], [Sales], [Purchase], [Admin], [Payroll], [SalesTarget], [Reports], [Deleted]) VALUES (5, N'Maketing', 1, 0, 1, 0, 0, 0, 0, 0)
INSERT [dbo].[tblRole] ([RoleId], [RoleName], [Stock], [Sales], [Purchase], [Admin], [Payroll], [SalesTarget], [Reports], [Deleted]) VALUES (6, N'Admin', 1, 1, 1, 1, 0, 0, 0, 0)
SET IDENTITY_INSERT [dbo].[tblRole] OFF
SET IDENTITY_INSERT [dbo].[tblSalary] ON 

INSERT [dbo].[tblSalary] ([SalaryId], [EmployeeId], [StartDate], [EndDate], [TotalHours], [TotalSalary], [Deleted]) VALUES (1, 1, CAST(0x0000A24A00000000 AS DateTime), CAST(0x0000A26800000000 AS DateTime), 170, CAST(1785.00 AS Decimal(18, 2)), 0)
SET IDENTITY_INSERT [dbo].[tblSalary] OFF
ALTER TABLE [dbo].[tblBin] ADD  CONSTRAINT [DF_tblBin_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[tblCustomer] ADD  CONSTRAINT [DF_tblCustomer_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[tblEmployee] ADD  CONSTRAINT [DF_tblEmployee_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[tblNewsLetter] ADD  CONSTRAINT [DF_tblNewsLetter_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[tblPermission] ADD  CONSTRAINT [DF_tblPermission_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[tblProduct] ADD  CONSTRAINT [DF_tblProduct_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[tblPurchaseOrder] ADD  CONSTRAINT [DF_tblPurchaseOrder_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[tblPurchaseOrderDetails] ADD  CONSTRAINT [DF_tblPurchaseOrderDetails_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[tblPurchaseOrderDetails] ADD  CONSTRAINT [DF_tblPurchaseOrderDetails_Recieved]  DEFAULT ((0)) FOR [Recieved]
GO
ALTER TABLE [dbo].[tblRole] ADD  CONSTRAINT [DF_tblRole_Stock]  DEFAULT ((0)) FOR [Stock]
GO
ALTER TABLE [dbo].[tblRole] ADD  CONSTRAINT [DF_tblRole_Sales]  DEFAULT ((0)) FOR [Sales]
GO
ALTER TABLE [dbo].[tblRole] ADD  CONSTRAINT [DF_tblRole_Purchase]  DEFAULT ((0)) FOR [Purchase]
GO
ALTER TABLE [dbo].[tblRole] ADD  CONSTRAINT [DF_tblRole_Admin]  DEFAULT ((0)) FOR [Admin]
GO
ALTER TABLE [dbo].[tblRole] ADD  CONSTRAINT [DF_tblRole_Payroll]  DEFAULT ((0)) FOR [Payroll]
GO
ALTER TABLE [dbo].[tblRole] ADD  CONSTRAINT [DF_tblRole_SalesTarget]  DEFAULT ((0)) FOR [SalesTarget]
GO
ALTER TABLE [dbo].[tblRole] ADD  CONSTRAINT [DF_tblRole_Reports]  DEFAULT ((0)) FOR [Reports]
GO
ALTER TABLE [dbo].[tblRole] ADD  CONSTRAINT [DF_tblRole_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[tblSalary] ADD  CONSTRAINT [DF_tblSalary_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[tblSaleInvoice] ADD  CONSTRAINT [DF_tblSaleInvoice_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[tblSaleInvoiceDetail] ADD  CONSTRAINT [DF_tblSaleInvoiceDetail_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[tblSalesTarget] ADD  CONSTRAINT [DF_tblSalesTarget_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[tblVendor] ADD  CONSTRAINT [DF_tblVendor_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[tblEmployee]  WITH CHECK ADD  CONSTRAINT [FK_tblEmployee_tblRole] FOREIGN KEY([RollId])
REFERENCES [dbo].[tblRole] ([RoleId])
GO
ALTER TABLE [dbo].[tblEmployee] CHECK CONSTRAINT [FK_tblEmployee_tblRole]
GO
ALTER TABLE [dbo].[tblPermission]  WITH CHECK ADD  CONSTRAINT [FK_tblPermission_tblRole] FOREIGN KEY([RoleId])
REFERENCES [dbo].[tblRole] ([RoleId])
GO
ALTER TABLE [dbo].[tblPermission] CHECK CONSTRAINT [FK_tblPermission_tblRole]
GO
ALTER TABLE [dbo].[tblProduct]  WITH CHECK ADD  CONSTRAINT [FK_tblProduct_tblBin] FOREIGN KEY([BinId])
REFERENCES [dbo].[tblBin] ([BinId])
GO
ALTER TABLE [dbo].[tblProduct] CHECK CONSTRAINT [FK_tblProduct_tblBin]
GO
ALTER TABLE [dbo].[tblPurchaseOrder]  WITH CHECK ADD  CONSTRAINT [FK_tblPurchaseOrder_tblVendor] FOREIGN KEY([VendorId])
REFERENCES [dbo].[tblVendor] ([VendorId])
GO
ALTER TABLE [dbo].[tblPurchaseOrder] CHECK CONSTRAINT [FK_tblPurchaseOrder_tblVendor]
GO
ALTER TABLE [dbo].[tblPurchaseOrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_tblPurchaseOrderDetails_tblProduct] FOREIGN KEY([ProductId])
REFERENCES [dbo].[tblProduct] ([ProductId])
GO
ALTER TABLE [dbo].[tblPurchaseOrderDetails] CHECK CONSTRAINT [FK_tblPurchaseOrderDetails_tblProduct]
GO
ALTER TABLE [dbo].[tblPurchaseOrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_tblPurchaseOrderDetails_tblPurchaseOrder] FOREIGN KEY([POId])
REFERENCES [dbo].[tblPurchaseOrder] ([POId])
GO
ALTER TABLE [dbo].[tblPurchaseOrderDetails] CHECK CONSTRAINT [FK_tblPurchaseOrderDetails_tblPurchaseOrder]
GO
ALTER TABLE [dbo].[tblSalary]  WITH CHECK ADD  CONSTRAINT [FK_tblSalary_tblEmployee] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[tblEmployee] ([EmployeeId])
GO
ALTER TABLE [dbo].[tblSalary] CHECK CONSTRAINT [FK_tblSalary_tblEmployee]
GO
ALTER TABLE [dbo].[tblSaleInvoice]  WITH CHECK ADD  CONSTRAINT [FK_tblSaleInvoice_tblCustomer] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[tblCustomer] ([CustomerId])
GO
ALTER TABLE [dbo].[tblSaleInvoice] CHECK CONSTRAINT [FK_tblSaleInvoice_tblCustomer]
GO
ALTER TABLE [dbo].[tblSaleInvoiceDetail]  WITH CHECK ADD  CONSTRAINT [FK_tblSaleInvoiceDetail_tblProduct] FOREIGN KEY([ProductId])
REFERENCES [dbo].[tblProduct] ([ProductId])
GO
ALTER TABLE [dbo].[tblSaleInvoiceDetail] CHECK CONSTRAINT [FK_tblSaleInvoiceDetail_tblProduct]
GO
ALTER TABLE [dbo].[tblSaleInvoiceDetail]  WITH CHECK ADD  CONSTRAINT [FK_tblSaleInvoiceDetail_tblSaleInvoice] FOREIGN KEY([InvoiceId])
REFERENCES [dbo].[tblSaleInvoice] ([InvoiceId])
GO
ALTER TABLE [dbo].[tblSaleInvoiceDetail] CHECK CONSTRAINT [FK_tblSaleInvoiceDetail_tblSaleInvoice]
GO
USE [master]
GO
ALTER DATABASE [DensDB] SET  READ_WRITE 
GO
