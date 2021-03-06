USE [HinnaShop]
GO
/****** Object:  Table [dbo].[tblCategory]    Script Date: 1/23/2021 11:55:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCategory](
	[categoryID] [nvarchar](10) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[description] [nvarchar](500) NOT NULL,
	[status] [bit] NOT NULL,
 CONSTRAINT [PK_tblCategory] PRIMARY KEY CLUSTERED 
(
	[categoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblHistoryUpdate]    Script Date: 1/23/2021 11:55:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblHistoryUpdate](
	[userID] [nvarchar](50) NOT NULL,
	[date] [datetime] NOT NULL,
	[description] [nchar](10) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblOrder]    Script Date: 1/23/2021 11:55:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrder](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[orderID] [nvarchar](11) NOT NULL,
	[Total] [nvarchar](50) NOT NULL,
	[dateOfCreate] [date] NOT NULL,
	[status] [bit] NOT NULL,
	[userID] [nvarchar](50) NOT NULL,
	[address] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_tblOrder] PRIMARY KEY CLUSTERED 
(
	[orderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblOrderDetailID]    Script Date: 1/23/2021 11:55:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrderDetailID](
	[orderDetailID] [nvarchar](11) NOT NULL,
	[productID] [nvarchar](10) NOT NULL,
	[quantity] [int] NOT NULL,
	[price] [float] NOT NULL,
	[status] [bit] NOT NULL,
	[orderID] [nvarchar](11) NOT NULL,
 CONSTRAINT [PK_tblOrderDetailID] PRIMARY KEY CLUSTERED 
(
	[orderDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblProduct]    Script Date: 1/23/2021 11:55:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProduct](
	[productID] [nvarchar](10) NOT NULL,
	[productName] [nvarchar](50) NOT NULL,
	[quanlity] [int] NOT NULL,
	[description] [nvarchar](3000) NOT NULL,
	[categoryID] [nvarchar](10) NOT NULL,
	[price] [float] NOT NULL,
	[DateOfCreate] [datetime] NOT NULL,
	[img] [nvarchar](1000) NOT NULL,
	[status] [bit] NOT NULL,
 CONSTRAINT [PK_tblProduct] PRIMARY KEY CLUSTERED 
(
	[productID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUsers]    Script Date: 1/23/2021 11:55:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUsers](
	[userID] [nvarchar](50) NOT NULL,
	[fullName] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NULL,
	[address] [nvarchar](50) NULL,
	[phone] [nchar](10) NULL,
	[roleID] [nchar](2) NULL,
 CONSTRAINT [PK_tblUsers] PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[tblCategory] ([categoryID], [name], [description], [status]) VALUES (N'ChickenA', N'Chicken', N'Company chicken', 1)
INSERT [dbo].[tblCategory] ([categoryID], [name], [description], [status]) VALUES (N'Drink01', N'Drink', N'This is a drink', 1)
INSERT [dbo].[tblCategory] ([categoryID], [name], [description], [status]) VALUES (N'FishA', N'Fish', N'This is a Fish', 1)
INSERT [dbo].[tblCategory] ([categoryID], [name], [description], [status]) VALUES (N'HamburgerA', N'Hamburger', N'Special hambergur', 1)
INSERT [dbo].[tblCategory] ([categoryID], [name], [description], [status]) VALUES (N'OtherA', N'Other', N'Custom Food', 1)
INSERT [dbo].[tblCategory] ([categoryID], [name], [description], [status]) VALUES (N'PizzaA', N'Pizaa', N'This is a Pizza', 1)
INSERT [dbo].[tblCategory] ([categoryID], [name], [description], [status]) VALUES (N'SteakA', N'Steak', N'Beef Kobe', 1)
GO
INSERT [dbo].[tblHistoryUpdate] ([userID], [date], [description]) VALUES (N'admin', CAST(N'2021-01-23T22:52:16.820' AS DateTime), N'UPDATE    ')
INSERT [dbo].[tblHistoryUpdate] ([userID], [date], [description]) VALUES (N'admin', CAST(N'2021-01-23T22:52:28.420' AS DateTime), N'DELETE    ')
INSERT [dbo].[tblHistoryUpdate] ([userID], [date], [description]) VALUES (N'admin', CAST(N'2021-01-23T23:17:10.633' AS DateTime), N'UPDATE    ')
INSERT [dbo].[tblHistoryUpdate] ([userID], [date], [description]) VALUES (N'admin', CAST(N'2021-01-23T23:18:43.870' AS DateTime), N'UPDATE    ')
INSERT [dbo].[tblHistoryUpdate] ([userID], [date], [description]) VALUES (N'admin', CAST(N'2021-01-23T23:21:14.380' AS DateTime), N'UPDATE    ')
INSERT [dbo].[tblHistoryUpdate] ([userID], [date], [description]) VALUES (N'admin', CAST(N'2021-01-23T23:22:31.470' AS DateTime), N'UPDATE    ')
INSERT [dbo].[tblHistoryUpdate] ([userID], [date], [description]) VALUES (N'admin', CAST(N'2021-01-23T23:23:30.280' AS DateTime), N'UPDATE    ')
INSERT [dbo].[tblHistoryUpdate] ([userID], [date], [description]) VALUES (N'admin', CAST(N'2021-01-23T23:23:36.400' AS DateTime), N'UPDATE    ')
GO
SET IDENTITY_INSERT [dbo].[tblOrder] ON 

INSERT [dbo].[tblOrder] ([id], [orderID], [Total], [dateOfCreate], [status], [userID], [address]) VALUES (35, N'380655470', N'25.0', CAST(N'2021-01-23' AS Date), 1, N'bean', N'My home')
INSERT [dbo].[tblOrder] ([id], [orderID], [Total], [dateOfCreate], [status], [userID], [address]) VALUES (36, N'754585931', N'26.0', CAST(N'2021-01-23' AS Date), 1, N'bean', N'D2')
INSERT [dbo].[tblOrder] ([id], [orderID], [Total], [dateOfCreate], [status], [userID], [address]) VALUES (34, N'899166984', N'44.23', CAST(N'2021-01-23' AS Date), 1, N'bean', N'Khang Dien Resident')
INSERT [dbo].[tblOrder] ([id], [orderID], [Total], [dateOfCreate], [status], [userID], [address]) VALUES (33, N'954573512', N'81.24', CAST(N'2021-01-23' AS Date), 1, N'bean', N'FPT University')
SET IDENTITY_INSERT [dbo].[tblOrder] OFF
GO
INSERT [dbo].[tblOrderDetailID] ([orderDetailID], [productID], [quantity], [price], [status], [orderID]) VALUES (N'120237028', N'Pizza01', 1, 32.950000762939453, 1, N'899166984')
INSERT [dbo].[tblOrderDetailID] ([orderDetailID], [productID], [quantity], [price], [status], [orderID]) VALUES (N'123600670', N'Drink02', 1, 0.99000000953674316, 1, N'899166984')
INSERT [dbo].[tblOrderDetailID] ([orderDetailID], [productID], [quantity], [price], [status], [orderID]) VALUES (N'127290072', N'Burger02', 2, 25, 1, N'954573512')
INSERT [dbo].[tblOrderDetailID] ([orderDetailID], [productID], [quantity], [price], [status], [orderID]) VALUES (N'195662800', N'Burger02', 1, 25, 1, N'380655470')
INSERT [dbo].[tblOrderDetailID] ([orderDetailID], [productID], [quantity], [price], [status], [orderID]) VALUES (N'248577122', N'Fish01', 1, 10.289999961853027, 1, N'899166984')
INSERT [dbo].[tblOrderDetailID] ([orderDetailID], [productID], [quantity], [price], [status], [orderID]) VALUES (N'695860553', N'Chicken02', 1, 6, 1, N'754585931')
INSERT [dbo].[tblOrderDetailID] ([orderDetailID], [productID], [quantity], [price], [status], [orderID]) VALUES (N'91052847', N'Chicken03', 1, 20, 1, N'754585931')
INSERT [dbo].[tblOrderDetailID] ([orderDetailID], [productID], [quantity], [price], [status], [orderID]) VALUES (N'975777877', N'Chicken05', 1, 16.989999771118164, 1, N'954573512')
INSERT [dbo].[tblOrderDetailID] ([orderDetailID], [productID], [quantity], [price], [status], [orderID]) VALUES (N'98322497', N'Chicken04', 1, 14.25, 1, N'954573512')
GO
INSERT [dbo].[tblProduct] ([productID], [productName], [quanlity], [description], [categoryID], [price], [DateOfCreate], [img], [status]) VALUES (N'Burger01', N'Burger Party', 5, N'Our tender, juicy Chicken are made with 100% white meat chicken and no artificial colors, flavors or preservatives.', N'HamburgerA', 22, CAST(N'2021-01-16T00:39:59.960' AS DateTime), N'img/Burger-Patty.jpg', 1)
INSERT [dbo].[tblProduct] ([productID], [productName], [quanlity], [description], [categoryID], [price], [DateOfCreate], [img], [status]) VALUES (N'Burger02', N'Big C', 3, N'Mouthwatering perfection starts with two 100% pure beef patties and Big Mac sauce sandwiched between a sesame seed bun. It’s topped off with pickles, crisp shredded lettuce, finely chopped onion and American cheese.', N'HamburgerA', 25, CAST(N'2021-01-11T23:35:57.753' AS DateTime), N'img/Premium-Crispy-Fillet.jpg', 1)
INSERT [dbo].[tblProduct] ([productID], [productName], [quanlity], [description], [categoryID], [price], [DateOfCreate], [img], [status]) VALUES (N'Burger03', N'Raw Chicken Burger atty', 3, N'Mouthwatering perfection starts with two 100% pure beef patties and Big Mac sauce sandwiched between a sesame seed bun. It’s topped off with pickles, crisp shredded lettuce, finely chopped onion and American cheese.', N'HamburgerA', 24, CAST(N'2021-01-11T12:00:00.000' AS DateTime), N'img/Raw-Chicken-Burger-Patty.jpg', 1)
INSERT [dbo].[tblProduct] ([productID], [productName], [quanlity], [description], [categoryID], [price], [DateOfCreate], [img], [status]) VALUES (N'Chicken01', N' Handcrafted Chicken Tenders ', 8, N'Our tender, juicy Chicken are made with 100% white meat chicken and no artificial colors, flavors or preservatives.', N'ChickenA', 4.99, CAST(N'2021-01-11T23:23:25.483' AS DateTime), N'img/Handcrafted-Chicken-Tenders.jpg', 1)
INSERT [dbo].[tblProduct] ([productID], [productName], [quanlity], [description], [categoryID], [price], [DateOfCreate], [img], [status]) VALUES (N'Chicken02', N'Chicken Pakora', 11, N'Our tender, juicy Chicken are made with 100% white meat chicken and no artificial colors, flavors or preservatives.', N'ChickenA', 6, CAST(N'2021-01-11T23:31:25.593' AS DateTime), N'img/Chicken-Pakora.jpg', 1)
INSERT [dbo].[tblProduct] ([productID], [productName], [quanlity], [description], [categoryID], [price], [DateOfCreate], [img], [status]) VALUES (N'Chicken03', N'Chicken Tulip', 33, N'Our tender, juicy Chicken are made with 100% white meat chicken and no artificial colors, flavors or preservatives', N'ChickenA', 20, CAST(N'2021-01-11T12:00:00.000' AS DateTime), N'img/Chicken-Tulip.jpg', 1)
INSERT [dbo].[tblProduct] ([productID], [productName], [quanlity], [description], [categoryID], [price], [DateOfCreate], [img], [status]) VALUES (N'Chicken04', N'Popcorn Chicken', 3, N'Our tender, juicy Chicken are made with 100% white meat chicken and no artificial colors, flavors or preservatives.', N'ChickenA', 14, CAST(N'2021-01-14T13:51:57.833' AS DateTime), N'img/PopcornChicken.jpg', 1)
INSERT [dbo].[tblProduct] ([productID], [productName], [quanlity], [description], [categoryID], [price], [DateOfCreate], [img], [status]) VALUES (N'Chicken05', N'Seekh Kabab', 12, N'Our tender, juicy Chicken are made with 100% white meat chicken and no artificial colors, flavors or preservatives.', N'ChickenA', 16.989999771118164, CAST(N'2021-01-14T13:54:44.207' AS DateTime), N'img/Seekh-Kabab.jpg', 1)
INSERT [dbo].[tblProduct] ([productID], [productName], [quanlity], [description], [categoryID], [price], [DateOfCreate], [img], [status]) VALUES (N'Chicken06', N'Spring Roll', 2, N'Our tender, juicy Chicken are made with 100% white meat chicken and no artificial colors, flavors or preservatives.', N'ChickenA', 17.989999771118164, CAST(N'2021-01-14T13:55:29.393' AS DateTime), N'img/Spring-Roll.jpg', 1)
INSERT [dbo].[tblProduct] ([productID], [productName], [quanlity], [description], [categoryID], [price], [DateOfCreate], [img], [status]) VALUES (N'Drink01', N'Cocacola', 88, N'This is Drink', N'Drink01', 1, CAST(N'2021-01-14T14:07:40.543' AS DateTime), N'img/Cocacola.png', 1)
INSERT [dbo].[tblProduct] ([productID], [productName], [quanlity], [description], [categoryID], [price], [DateOfCreate], [img], [status]) VALUES (N'Drink02', N'MoutainNew ', 54, N'This is Drink', N'Drink01', 0.99000000953674316, CAST(N'2021-01-14T14:10:05.747' AS DateTime), N'img/MoutanNew.jpg', 1)
INSERT [dbo].[tblProduct] ([productID], [productName], [quanlity], [description], [categoryID], [price], [DateOfCreate], [img], [status]) VALUES (N'Fish01', N'Popcorn Fish', 13, N'This is New Food', N'FishA', 10.29, CAST(N'2021-01-12T23:51:07.067' AS DateTime), N'img/Popcorn-Fish.jpg', 1)
INSERT [dbo].[tblProduct] ([productID], [productName], [quanlity], [description], [categoryID], [price], [DateOfCreate], [img], [status]) VALUES (N'Fish02', N'Kofta', 12, N'This is Kofta Fish New Food', N'FishA', 17, CAST(N'2021-01-14T13:49:52.410' AS DateTime), N'img/Kofta.jpg', 1)
INSERT [dbo].[tblProduct] ([productID], [productName], [quanlity], [description], [categoryID], [price], [DateOfCreate], [img], [status]) VALUES (N'Fish03', N'Nuggets', 8, N'This is Nuggets Fish New Food', N'FishA', 13.989999771118164, CAST(N'2021-01-14T13:50:43.830' AS DateTime), N'img/Nuggets.jpg', 1)
INSERT [dbo].[tblProduct] ([productID], [productName], [quanlity], [description], [categoryID], [price], [DateOfCreate], [img], [status]) VALUES (N'Fish04', N'Tempura Fish Fillet', 25, N'This is Tempura Fish Fillet New Food', N'FishA', 23.989999771118164, CAST(N'2021-01-14T13:56:21.473' AS DateTime), N'img/Tempura-Fish-Fillet.jpg', 1)
INSERT [dbo].[tblProduct] ([productID], [productName], [quanlity], [description], [categoryID], [price], [DateOfCreate], [img], [status]) VALUES (N'Pizza01', N'Chicken Fajita Pizza', 14, N'Our pizzas with farm-to-table ingredients, house-made cheese are available for delivery. Order online or by calling us. Order Online. Order From Website. Services Japanese-Italian dishes, Organic ingredients, House-made cheese, Omotenashi spirit.', N'PizzaA', 32.95, CAST(N'2021-01-11T23:48:41.777' AS DateTime), N'img/Chicken-Fajita-Pizza.jpg', 1)
INSERT [dbo].[tblProduct] ([productID], [productName], [quanlity], [description], [categoryID], [price], [DateOfCreate], [img], [status]) VALUES (N'Pizza02', N'Chicken Tikka Pizza', 29, N'Our tender, juicy Chicken are made with 100% white meat chicken and no artificial colors, flavors or preservatives.', N'PizzaA', 34.25, CAST(N'2021-01-14T13:46:49.967' AS DateTime), N'img/Chicken-Tikka-Pizza.jpg', 1)
INSERT [dbo].[tblProduct] ([productID], [productName], [quanlity], [description], [categoryID], [price], [DateOfCreate], [img], [status]) VALUES (N'Pizza03', N'Burrata Parma Ham Margherita', 23, N'This is pizza', N'PizzaA', 23, CAST(N'2021-01-14T00:00:00.000' AS DateTime), N'img/timthumb (3).png', 1)
INSERT [dbo].[tblProduct] ([productID], [productName], [quanlity], [description], [categoryID], [price], [DateOfCreate], [img], [status]) VALUES (N'Pizza04', N'abc', 23, N'pizza', N'PizzaA', 32, CAST(N'2021-02-01T00:00:00.000' AS DateTime), N'img/timthumb (1).png', 1)
INSERT [dbo].[tblProduct] ([productID], [productName], [quanlity], [description], [categoryID], [price], [DateOfCreate], [img], [status]) VALUES (N'Pizza05', N'xzy', 13, N'pizza', N'PizzaA', 11, CAST(N'2021-02-01T00:00:00.000' AS DateTime), N'img/timthumb (4).png', 1)
GO
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [address], [phone], [roleID]) VALUES (N'admin', N'Admin', N'123', N'Core', N'0944747911', N'AD')
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [address], [phone], [roleID]) VALUES (N'bean', N'Bean', N'123', N'Cà Mau', N'0913922752', N'US')
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [address], [phone], [roleID]) VALUES (N'leeanh764@gmail.com', N'leeanh764', N'', N'', N'          ', N'US')
GO
ALTER TABLE [dbo].[tblHistoryUpdate]  WITH CHECK ADD  CONSTRAINT [FK_tblHistoryUpdate_tblUsers] FOREIGN KEY([userID])
REFERENCES [dbo].[tblUsers] ([userID])
GO
ALTER TABLE [dbo].[tblHistoryUpdate] CHECK CONSTRAINT [FK_tblHistoryUpdate_tblUsers]
GO
ALTER TABLE [dbo].[tblOrder]  WITH CHECK ADD  CONSTRAINT [FK_tblOrder_tblUsers] FOREIGN KEY([userID])
REFERENCES [dbo].[tblUsers] ([userID])
GO
ALTER TABLE [dbo].[tblOrder] CHECK CONSTRAINT [FK_tblOrder_tblUsers]
GO
ALTER TABLE [dbo].[tblOrderDetailID]  WITH CHECK ADD  CONSTRAINT [FK_tblOrderDetailID_tblOrder] FOREIGN KEY([orderID])
REFERENCES [dbo].[tblOrder] ([orderID])
GO
ALTER TABLE [dbo].[tblOrderDetailID] CHECK CONSTRAINT [FK_tblOrderDetailID_tblOrder]
GO
ALTER TABLE [dbo].[tblOrderDetailID]  WITH CHECK ADD  CONSTRAINT [FK_tblOrderDetailID_tblProduct] FOREIGN KEY([productID])
REFERENCES [dbo].[tblProduct] ([productID])
GO
ALTER TABLE [dbo].[tblOrderDetailID] CHECK CONSTRAINT [FK_tblOrderDetailID_tblProduct]
GO
ALTER TABLE [dbo].[tblProduct]  WITH CHECK ADD  CONSTRAINT [FK_tblProduct_tblCategory] FOREIGN KEY([categoryID])
REFERENCES [dbo].[tblCategory] ([categoryID])
GO
ALTER TABLE [dbo].[tblProduct] CHECK CONSTRAINT [FK_tblProduct_tblCategory]
GO
