USE [MyShop]
GO
/****** Object:  Table [dbo].[bill]    Script Date: 09/11/2021 11:19:43 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bill](
	[bill_id] [bigint] IDENTITY(1,1) NOT NULL,
	[user_id] [bigint] NOT NULL,
	[total] [money] NOT NULL,
	[payment] [varchar](250) NOT NULL,
	[address] [ntext] NOT NULL,
	[date] [date] NOT NULL,
	[phone] [bigint] NOT NULL,
 CONSTRAINT [PK_bill] PRIMARY KEY CLUSTERED 
(
	[bill_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[bill_detail]    Script Date: 09/11/2021 11:19:43 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bill_detail](
	[detail_id] [bigint] IDENTITY(1,1) NOT NULL,
	[bill_id] [bigint] NOT NULL,
	[product_id] [varchar](100) NOT NULL,
	[quantity] [int] NOT NULL,
	[size] [nchar](10) NOT NULL,
	[color] [nvarchar](150) NOT NULL,
	[price] [money] NOT NULL,
 CONSTRAINT [PK_bill_detail] PRIMARY KEY CLUSTERED 
(
	[detail_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cart]    Script Date: 09/11/2021 11:19:43 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cart](
	[cart_id] [bigint] NOT NULL,
	[product_id] [varchar](100) NOT NULL,
	[product_name] [varchar](255) NOT NULL,
	[product_img] [varchar](255) NOT NULL,
	[product_price] [float] NOT NULL,
	[total] [float] NOT NULL,
	[quantity] [int] NOT NULL,
 CONSTRAINT [PK_cart] PRIMARY KEY CLUSTERED 
(
	[cart_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[category]    Script Date: 09/11/2021 11:19:43 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[category](
	[category_id] [int] IDENTITY(1,1) NOT NULL,
	[category_name] [varchar](255) NOT NULL,
 CONSTRAINT [PK_category] PRIMARY KEY CLUSTERED 
(
	[category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product]    Script Date: 09/11/2021 11:19:43 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product](
	[product_id] [varchar](100) NOT NULL,
	[category_id] [int] NOT NULL,
	[product_name] [nvarchar](max) NOT NULL,
	[product_price] [money] NOT NULL,
	[product_describe] [nvarchar](max) NOT NULL,
	[quantity] [int] NOT NULL,
	[img] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_product] PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product_color]    Script Date: 09/11/2021 11:19:43 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product_color](
	[product_id] [varchar](100) NOT NULL,
	[color] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product_size]    Script Date: 09/11/2021 11:19:43 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product_size](
	[product_id] [varchar](100) NOT NULL,
	[size] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 09/11/2021 11:19:43 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[user_id] [bigint] IDENTITY(1,1) NOT NULL,
	[user_name] [nvarchar](200) NULL,
	[user_email] [varchar](255) NOT NULL,
	[user_pass] [nvarchar](255) NOT NULL,
	[isAdmin] [nvarchar](50) NULL,
 CONSTRAINT [PK_users] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[bill] ON 

INSERT [dbo].[bill] ([bill_id], [user_id], [total], [payment], [address], [date], [phone]) VALUES (45, 5, 648000.0000, N'MOMO', N'Hà Đông, Hà Nội', CAST(N'2021-11-04' AS Date), 919208356)
INSERT [dbo].[bill] ([bill_id], [user_id], [total], [payment], [address], [date], [phone]) VALUES (46, 5, 298000.0000, N'MOMO', N'Ninh Bình', CAST(N'2021-11-04' AS Date), 888195313)
INSERT [dbo].[bill] ([bill_id], [user_id], [total], [payment], [address], [date], [phone]) VALUES (47, 5, 378000.0000, N'VNPAY', N'Ninh Bình', CAST(N'2021-11-03' AS Date), 88195313)
INSERT [dbo].[bill] ([bill_id], [user_id], [total], [payment], [address], [date], [phone]) VALUES (48, 5, 270000.0000, N'Chua thanh toán (VNPAY)', N'Ninh Bình', CAST(N'2021-11-04' AS Date), 383298183)
INSERT [dbo].[bill] ([bill_id], [user_id], [total], [payment], [address], [date], [phone]) VALUES (49, 5, 417000.0000, N'Chua thanh toán (VNPAY)', N'Ninh Bình', CAST(N'2021-11-04' AS Date), 888195313)
INSERT [dbo].[bill] ([bill_id], [user_id], [total], [payment], [address], [date], [phone]) VALUES (50, 5, 567000.0000, N'COD', N'Ninh Bình', CAST(N'2021-11-04' AS Date), 888195313)
INSERT [dbo].[bill] ([bill_id], [user_id], [total], [payment], [address], [date], [phone]) VALUES (51, 5, 278000.0000, N'COD', N'test', CAST(N'2021-11-04' AS Date), 123)
INSERT [dbo].[bill] ([bill_id], [user_id], [total], [payment], [address], [date], [phone]) VALUES (52, 5, 189000.0000, N'COD', N'è', CAST(N'2021-11-04' AS Date), 2)
INSERT [dbo].[bill] ([bill_id], [user_id], [total], [payment], [address], [date], [phone]) VALUES (53, 5, 259000.0000, N'MOMO', N'Check', CAST(N'2021-11-04' AS Date), 888195313)
INSERT [dbo].[bill] ([bill_id], [user_id], [total], [payment], [address], [date], [phone]) VALUES (54, 5, 270000.0000, N'VNPAY', N'Check', CAST(N'2021-11-04' AS Date), 888195313)
INSERT [dbo].[bill] ([bill_id], [user_id], [total], [payment], [address], [date], [phone]) VALUES (55, 5, 259000.0000, N'MOMO', N'jrtn', CAST(N'2021-11-06' AS Date), 2)
INSERT [dbo].[bill] ([bill_id], [user_id], [total], [payment], [address], [date], [phone]) VALUES (56, 5, 810000.0000, N'VNPAY', N'df', CAST(N'2021-11-06' AS Date), 3)
INSERT [dbo].[bill] ([bill_id], [user_id], [total], [payment], [address], [date], [phone]) VALUES (57, 5, 149000.0000, N'MOMO', N'Ninh Binh', CAST(N'2021-11-08' AS Date), 383298183)
INSERT [dbo].[bill] ([bill_id], [user_id], [total], [payment], [address], [date], [phone]) VALUES (58, 5, 417000.0000, N'VNPAY', N'bf', CAST(N'2021-11-08' AS Date), 4)
INSERT [dbo].[bill] ([bill_id], [user_id], [total], [payment], [address], [date], [phone]) VALUES (59, 5, 149000.0000, N'COD', N'rshfxb12414', CAST(N'2021-11-08' AS Date), 23544353)
INSERT [dbo].[bill] ([bill_id], [user_id], [total], [payment], [address], [date], [phone]) VALUES (60, 5, 517000.0000, N'MOMO', N'Ninh Bình', CAST(N'2021-11-09' AS Date), 888195313)
INSERT [dbo].[bill] ([bill_id], [user_id], [total], [payment], [address], [date], [phone]) VALUES (61, 5, 139000.0000, N'VNPAY', N'ưgrs', CAST(N'2021-11-09' AS Date), 32)
SET IDENTITY_INSERT [dbo].[bill] OFF
GO
SET IDENTITY_INSERT [dbo].[bill_detail] ON 

INSERT [dbo].[bill_detail] ([detail_id], [bill_id], [product_id], [quantity], [size], [color], [price]) VALUES (40, 45, N'T2129', 1, N'XS        ', N'White', 270000.0000)
INSERT [dbo].[bill_detail] ([detail_id], [bill_id], [product_id], [quantity], [size], [color], [price]) VALUES (41, 45, N'T2099', 2, N'S         ', N'Purple', 378000.0000)
INSERT [dbo].[bill_detail] ([detail_id], [bill_id], [product_id], [quantity], [size], [color], [price]) VALUES (42, 46, N'AT533', 2, N'S         ', N'White', 298000.0000)
INSERT [dbo].[bill_detail] ([detail_id], [bill_id], [product_id], [quantity], [size], [color], [price]) VALUES (43, 47, N'T2099', 2, N'L         ', N'Purple', 378000.0000)
INSERT [dbo].[bill_detail] ([detail_id], [bill_id], [product_id], [quantity], [size], [color], [price]) VALUES (44, 48, N'T2129', 1, N'XS        ', N'White', 270000.0000)
INSERT [dbo].[bill_detail] ([detail_id], [bill_id], [product_id], [quantity], [size], [color], [price]) VALUES (45, 49, N'AT536', 3, N'S         ', N'Red', 417000.0000)
INSERT [dbo].[bill_detail] ([detail_id], [bill_id], [product_id], [quantity], [size], [color], [price]) VALUES (46, 50, N'T2099', 3, N'S         ', N'Purple', 567000.0000)
INSERT [dbo].[bill_detail] ([detail_id], [bill_id], [product_id], [quantity], [size], [color], [price]) VALUES (47, 51, N'AT536', 2, N'S         ', N'Red', 278000.0000)
INSERT [dbo].[bill_detail] ([detail_id], [bill_id], [product_id], [quantity], [size], [color], [price]) VALUES (48, 52, N'T2099', 1, N'S         ', N'Purple', 189000.0000)
INSERT [dbo].[bill_detail] ([detail_id], [bill_id], [product_id], [quantity], [size], [color], [price]) VALUES (49, 53, N'T2127', 1, N'L         ', N'Black', 259000.0000)
INSERT [dbo].[bill_detail] ([detail_id], [bill_id], [product_id], [quantity], [size], [color], [price]) VALUES (50, 54, N'T2129', 1, N'XS        ', N'White', 270000.0000)
INSERT [dbo].[bill_detail] ([detail_id], [bill_id], [product_id], [quantity], [size], [color], [price]) VALUES (51, 55, N'T2128', 1, N'XS        ', N'White', 259000.0000)
INSERT [dbo].[bill_detail] ([detail_id], [bill_id], [product_id], [quantity], [size], [color], [price]) VALUES (52, 56, N'T2129', 3, N'XS        ', N'White', 810000.0000)
INSERT [dbo].[bill_detail] ([detail_id], [bill_id], [product_id], [quantity], [size], [color], [price]) VALUES (53, 57, N'AT533', 1, N'S         ', N'White', 149000.0000)
INSERT [dbo].[bill_detail] ([detail_id], [bill_id], [product_id], [quantity], [size], [color], [price]) VALUES (54, 58, N'AT536', 3, N'S         ', N'Red', 417000.0000)
INSERT [dbo].[bill_detail] ([detail_id], [bill_id], [product_id], [quantity], [size], [color], [price]) VALUES (55, 59, N'AT533', 1, N'S         ', N'White', 149000.0000)
INSERT [dbo].[bill_detail] ([detail_id], [bill_id], [product_id], [quantity], [size], [color], [price]) VALUES (56, 60, N'T2099', 2, N'S         ', N'Purple', 378000.0000)
INSERT [dbo].[bill_detail] ([detail_id], [bill_id], [product_id], [quantity], [size], [color], [price]) VALUES (57, 60, N'AT536', 1, N'L         ', N'Red', 139000.0000)
INSERT [dbo].[bill_detail] ([detail_id], [bill_id], [product_id], [quantity], [size], [color], [price]) VALUES (58, 61, N'AT536', 1, N'S         ', N'Red', 139000.0000)
SET IDENTITY_INSERT [dbo].[bill_detail] OFF
GO
SET IDENTITY_INSERT [dbo].[category] ON 

INSERT [dbo].[category] ([category_id], [category_name]) VALUES (1, N'SHIRT')
INSERT [dbo].[category] ([category_id], [category_name]) VALUES (2, N'T-SHIRT')
INSERT [dbo].[category] ([category_id], [category_name]) VALUES (3, N'OUTERWEAR')
INSERT [dbo].[category] ([category_id], [category_name]) VALUES (4, N'HOODIES')
INSERT [dbo].[category] ([category_id], [category_name]) VALUES (5, N'SHORT&PANTS')
INSERT [dbo].[category] ([category_id], [category_name]) VALUES (6, N'ACCESSORIES')
INSERT [dbo].[category] ([category_id], [category_name]) VALUES (7, N'SOCIAL')
INSERT [dbo].[category] ([category_id], [category_name]) VALUES (14, N'SWEATSHIRTS')
SET IDENTITY_INSERT [dbo].[category] OFF
GO
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_describe], [quantity], [img]) VALUES (N'AT533', 2, N'Champion Graphic Big Logo T-Shirt', 149000.0000, N'Cổ Tròn
Vạt Ngang
Tay Ngắn
Hình In Trướ', 186, N'images/AT533.png')
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_describe], [quantity], [img]) VALUES (N'AT536', 2, N'Champion Change The World', 139000.0000, N'Cổ Tròn
Vạt Ngang
Tay Ngắn
Hình Thêu Trước', 410, N'images/AT536.png')
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_describe], [quantity], [img]) VALUES (N'T2099', 2, N'No Smile Tee Purple', 189000.0000, N'Cổ Tròn 
Tay Ngắn
Vạt Ngang 
Hình Phía Trước
Và Sau', 49, N'images/T2099.png')
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_describe], [quantity], [img]) VALUES (N'T2106', 2, N'Shin-chan Tee', 229000.0000, N'Cổ Tròn 
Tay Ngắn
Vạt Ngang 
Hình In Trước', 95, N'images/T2106.png')
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_describe], [quantity], [img]) VALUES (N'T2109', 2, N'Tie Dye Orange Mint Tee', 290000.0000, N'Cổ Tròn 
Tay Ngắn
Vạt Ngang 
Hình In Trước
Và Sau
Tie Tye', 75, N'images/T2109.png')
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_describe], [quantity], [img]) VALUES (N'T2119', 2, N'The Sun Tie Dye', 280000.0000, N'Cổ Tròn 
Tay Ngắn
Vạt Ngang 
Hình In Trước
Và Sau
Tie Tye', 82, N'images/T2119.png')
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_describe], [quantity], [img]) VALUES (N'T2127', 2, N'Fucking Awesome Tee In Black', 259000.0000, N'Cổ Tròn 
Tay Ngắn
Vạt Ngang 
Hình Phía Trước
Và Sau', 94, N'images/T2127.png')
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_describe], [quantity], [img]) VALUES (N'T2128', 2, N'Fucking Awesome Tee', 259000.0000, N'Cổ Tròn 
Tay Ngắn
Vạt Ngang 
Hình Phía Trước
Và Sau
', 62, N'images/T2128.png')
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_describe], [quantity], [img]) VALUES (N'T2129', 2, N'I''m Not Psycho Tee', 270000.0000, N'Cổ Tròn 
Tay Ngắn
Vạt Ngang 
Hình Phía Trước
Và Sau', 102, N'images/T2129.png')
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_describe], [quantity], [img]) VALUES (N'T2130', 2, N'Acid Washed Dark', 240000.0000, N'Cổ Tròn
Tay Ngắn
Vạt Ngang
Stone Wash', 300, N'images/T2130.png')
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_describe], [quantity], [img]) VALUES (N'T2131', 2, N'Exceptional Tee With Distressed', 250000.0000, N'Cổ Tròn 
Tay Ngắn
Vạt Ngang 
Hình Phía Trước
Và Sau
Stone Wash', 198, N'images/T2131.png')
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_describe], [quantity], [img]) VALUES (N'TD481', 14, N'''''Sinner'''' Sweater', 360000.0000, N'Cổ Tròn
Vạt Ngang
Tay Dài Bo
Hình In Mặt Trước Và Sau ', 29, N'images/TD481.png')
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_describe], [quantity], [img]) VALUES (N'TD509', 14, N'Champion Sweater', 169000.0000, N'Cổ Tròn
Vạt Ngang
Tay Dài Bo
Hình Thêu Trước ', 447, N'images/TD509.png')
GO
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'T2131', N'Grey')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'T2131', N'Blue')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'T2130', N'Grey')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'T2119', N'Pink')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'T2119', N'White')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'AT533', N'White')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'AT533', N'Black')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'AT536', N'Red')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'AT536', N'White')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'AT536', N'Black')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'AT536', N'Blue')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'TD509', N'Purple')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'TD509', N'Blue')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'TD509', N'Black')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'TD509', N'White')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'TD481', N'White')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'T2109', N'Orange')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'T2128', N'White')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'T2128', N'Green')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'T2127', N'Black')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'T2099', N'Purple')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'T2129', N'White')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'T2106', N'Yellow')
GO
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'T2131', N'L')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'T2131', N'XL')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'T2131', N'XXL')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'T2130', N'S')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'T2130', N'L')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'T2119', N'L')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'T2119', N'XL')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'AT533', N'S')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'AT533', N'L')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'AT533', N'XL')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'AT536', N'S')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'AT536', N'L')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'AT536', N'XXL')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'TD509', N'S')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'TD509', N'L')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'TD509', N'XL')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'TD509', N'XXL')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'TD481', N'L')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'TD481', N'XL')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'T2109', N'L')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'T2109', N'XL')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'T2099', N'S')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'T2099', N'L')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'T2099', N'XL')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'T2128', N'XS')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'T2128', N'L')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'T2128', N'XL')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'T2127', N'L')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'T2129', N'XS')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'T2129', N'S')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'T2129', N'L')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'T2129', N'XL')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'T2106', N'S')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'T2106', N'L')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'T2106', N'XL')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'T2106', N'XXL')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'T2106', N'3XL')
GO
SET IDENTITY_INSERT [dbo].[users] ON 

INSERT [dbo].[users] ([user_id], [user_name], [user_email], [user_pass], [isAdmin]) VALUES (1, N'Admin', N'khuonghung1423@gmail.com', N'khuonghung1423', N'TRUE')
INSERT [dbo].[users] ([user_id], [user_name], [user_email], [user_pass], [isAdmin]) VALUES (2, N'Hùng', N'khuonghung', N'123456', N'FALSE')
INSERT [dbo].[users] ([user_id], [user_name], [user_email], [user_pass], [isAdmin]) VALUES (3, N'Hương', N'thuyhuong1423@gmail.com', N'123456', N'FALSE')
INSERT [dbo].[users] ([user_id], [user_name], [user_email], [user_pass], [isAdmin]) VALUES (4, N'Khuong Hung', N'khuonghung2408@gmail.com', N'1423', N'FALSE')
INSERT [dbo].[users] ([user_id], [user_name], [user_email], [user_pass], [isAdmin]) VALUES (5, N'Mai Phạm', N'maipham11@gmail.com', N'123', N'FALSE')
INSERT [dbo].[users] ([user_id], [user_name], [user_email], [user_pass], [isAdmin]) VALUES (6, N'Arya', N'hre@yahoo.com', N'1245', N'FALSE')
SET IDENTITY_INSERT [dbo].[users] OFF
GO
ALTER TABLE [dbo].[bill]  WITH CHECK ADD  CONSTRAINT [FK_bill_users] FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([user_id])
GO
ALTER TABLE [dbo].[bill] CHECK CONSTRAINT [FK_bill_users]
GO
ALTER TABLE [dbo].[bill_detail]  WITH CHECK ADD  CONSTRAINT [FK_bill_detail_bill] FOREIGN KEY([bill_id])
REFERENCES [dbo].[bill] ([bill_id])
GO
ALTER TABLE [dbo].[bill_detail] CHECK CONSTRAINT [FK_bill_detail_bill]
GO
ALTER TABLE [dbo].[bill_detail]  WITH CHECK ADD  CONSTRAINT [FK_bill_detail_product] FOREIGN KEY([product_id])
REFERENCES [dbo].[product] ([product_id])
GO
ALTER TABLE [dbo].[bill_detail] CHECK CONSTRAINT [FK_bill_detail_product]
GO
ALTER TABLE [dbo].[cart]  WITH CHECK ADD  CONSTRAINT [FK_cart_product] FOREIGN KEY([product_id])
REFERENCES [dbo].[product] ([product_id])
GO
ALTER TABLE [dbo].[cart] CHECK CONSTRAINT [FK_cart_product]
GO
ALTER TABLE [dbo].[product]  WITH CHECK ADD  CONSTRAINT [FK_product_category] FOREIGN KEY([category_id])
REFERENCES [dbo].[category] ([category_id])
GO
ALTER TABLE [dbo].[product] CHECK CONSTRAINT [FK_product_category]
GO
ALTER TABLE [dbo].[product_color]  WITH CHECK ADD  CONSTRAINT [FK_product_color_product] FOREIGN KEY([product_id])
REFERENCES [dbo].[product] ([product_id])
GO
ALTER TABLE [dbo].[product_color] CHECK CONSTRAINT [FK_product_color_product]
GO
ALTER TABLE [dbo].[product_size]  WITH CHECK ADD  CONSTRAINT [FK_product_size_product] FOREIGN KEY([product_id])
REFERENCES [dbo].[product] ([product_id])
GO
ALTER TABLE [dbo].[product_size] CHECK CONSTRAINT [FK_product_size_product]
GO
