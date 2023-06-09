USE [master]
GO
create database [ООО «Добрый дом»]
GO
USE [ООО «Добрый дом»]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 09.03.2023 15:42:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Manufacture]    Script Date: 09.03.2023 15:42:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Manufacture](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Manufacture] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 09.03.2023 15:42:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderDate] [date] NOT NULL,
	[ArrivalDate] [date] NOT NULL,
	[UserId] [int] NOT NULL,
	[StatusId] [int] NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderCompound]    Script Date: 09.03.2023 15:42:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderCompound](
	[OrderId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[ProductCount] [int] NOT NULL,
 CONSTRAINT [PK_OrderCompound] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC,
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 09.03.2023 15:42:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[Discount] [int] NOT NULL,
	[PriceWithDiscount] [decimal](18, 2) NOT NULL,
	[ManufacterId] [int] NOT NULL,
	[SupplierId] [int] NOT NULL,
	[CategoryId] [int] NOT NULL,
	[CountInStorage] [int] NOT NULL,
	[Discription] [nvarchar](200) NOT NULL,
	[Image] [image] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 09.03.2023 15:42:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Status]    Script Date: 09.03.2023 15:42:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Status](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Status] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Supplier]    Script Date: 09.03.2023 15:42:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supplier](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Supplier] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 09.03.2023 15:42:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserSurname] [nvarchar](50) NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[UserLogin] [nvarchar](50) NOT NULL,
	[UserPassword] [nvarchar](50) NOT NULL,
	[RoleId] [int] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([Id], [Name]) VALUES (1, N'Диван')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (2, N'Еврософа')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (3, N'Стол')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (4, N'Шкаф')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Manufacture] ON 

INSERT [dbo].[Manufacture] ([Id], [Name]) VALUES (1, N'Фактура')
INSERT [dbo].[Manufacture] ([Id], [Name]) VALUES (2, N'Simple PRO')
INSERT [dbo].[Manufacture] ([Id], [Name]) VALUES (3, N'DivanSoft')
SET IDENTITY_INSERT [dbo].[Manufacture] OFF
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([Id], [OrderDate], [ArrivalDate], [UserId], [StatusId]) VALUES (1, CAST(N'2020-12-12' AS Date), CAST(N'2021-12-12' AS Date), 4, 1)
INSERT [dbo].[Order] ([Id], [OrderDate], [ArrivalDate], [UserId], [StatusId]) VALUES (2, CAST(N'2020-12-12' AS Date), CAST(N'2021-12-12' AS Date), 4, 2)
INSERT [dbo].[Order] ([Id], [OrderDate], [ArrivalDate], [UserId], [StatusId]) VALUES (3, CAST(N'2020-12-12' AS Date), CAST(N'2021-12-12' AS Date), 5, 2)
INSERT [dbo].[Order] ([Id], [OrderDate], [ArrivalDate], [UserId], [StatusId]) VALUES (4, CAST(N'2021-12-12' AS Date), CAST(N'2022-12-12' AS Date), 5, 1)
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
INSERT [dbo].[OrderCompound] ([OrderId], [ProductId], [ProductCount]) VALUES (1, 1, 10)
INSERT [dbo].[OrderCompound] ([OrderId], [ProductId], [ProductCount]) VALUES (2, 3, 10)
INSERT [dbo].[OrderCompound] ([OrderId], [ProductId], [ProductCount]) VALUES (3, 3, 10)
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([Id], [Name], [Price], [Discount], [PriceWithDiscount], [ManufacterId], [SupplierId], [CategoryId], [CountInStorage], [Discription], [Image]) VALUES (1, N'Сальдо', CAST(12000.00 AS Decimal(18, 2)), 10, CAST(10800.00 AS Decimal(18, 2)), 3, 3, 2, 100, N'Еврософа "Сальдо"', NULL)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Discount], [PriceWithDiscount], [ManufacterId], [SupplierId], [CategoryId], [CountInStorage], [Discription], [Image]) VALUES (2, N'Доминик', CAST(10000.00 AS Decimal(18, 2)), 0, CAST(10000.00 AS Decimal(18, 2)), 3, 3, 1, 50, N'Диван "Доминик"', NULL)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Discount], [PriceWithDiscount], [ManufacterId], [SupplierId], [CategoryId], [CountInStorage], [Discription], [Image]) VALUES (3, N'ЛК-1500', CAST(8000.00 AS Decimal(18, 2)), 25, CAST(6000.00 AS Decimal(18, 2)), 2, 2, 4, 10, N'Лабораторный шкаф "ЛК-1500"', NULL)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Discount], [PriceWithDiscount], [ManufacterId], [SupplierId], [CategoryId], [CountInStorage], [Discription], [Image]) VALUES (4, N'Квадро', CAST(15000.00 AS Decimal(18, 2)), 0, CAST(15000.00 AS Decimal(18, 2)), 1, 1, 3, 50, N'Офисный стол "Квадро"', NULL)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([Id], [Name]) VALUES (1, N'Админ')
INSERT [dbo].[Role] ([Id], [Name]) VALUES (2, N'Менеджер')
INSERT [dbo].[Role] ([Id], [Name]) VALUES (3, N'Клиент')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[Status] ON 

INSERT [dbo].[Status] ([Id], [Name]) VALUES (1, N'В обработке')
INSERT [dbo].[Status] ([Id], [Name]) VALUES (2, N'Завершён')
SET IDENTITY_INSERT [dbo].[Status] OFF
GO
SET IDENTITY_INSERT [dbo].[Supplier] ON 

INSERT [dbo].[Supplier] ([Id], [Name]) VALUES (1, N'Фактура')
INSERT [dbo].[Supplier] ([Id], [Name]) VALUES (2, N'Simple PRO')
INSERT [dbo].[Supplier] ([Id], [Name]) VALUES (3, N'DivanSoft')
SET IDENTITY_INSERT [dbo].[Supplier] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([Id], [UserSurname], [UserName], [UserLogin], [UserPassword], [RoleId]) VALUES (1, N'Генхель', N'Иван', N'iven', N'1234', 1)
INSERT [dbo].[User] ([Id], [UserSurname], [UserName], [UserLogin], [UserPassword], [RoleId]) VALUES (2, N'Денис', N'Корнинский', N'den', N'1234', 2)
INSERT [dbo].[User] ([Id], [UserSurname], [UserName], [UserLogin], [UserPassword], [RoleId]) VALUES (3, N'Виталий', N'Семкив', N'vit', N'1234', 2)
INSERT [dbo].[User] ([Id], [UserSurname], [UserName], [UserLogin], [UserPassword], [RoleId]) VALUES (4, N'Незарегистрированный', N'Пользователь', N'Guest', N'1111', 3)
INSERT [dbo].[User] ([Id], [UserSurname], [UserName], [UserLogin], [UserPassword], [RoleId]) VALUES (5, N'Никита ', N'Мамонтов', N'nik', N'1234', 3)
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Status] FOREIGN KEY([StatusId])
REFERENCES [dbo].[Status] ([Id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Status]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_User]
GO
ALTER TABLE [dbo].[OrderCompound]  WITH CHECK ADD  CONSTRAINT [FK_OrderCompound_Order] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Order] ([Id])
GO
ALTER TABLE [dbo].[OrderCompound] CHECK CONSTRAINT [FK_OrderCompound_Order]
GO
ALTER TABLE [dbo].[OrderCompound]  WITH CHECK ADD  CONSTRAINT [FK_OrderCompound_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([Id])
GO
ALTER TABLE [dbo].[OrderCompound] CHECK CONSTRAINT [FK_OrderCompound_Product]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([Id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Category]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Manufacture] FOREIGN KEY([ManufacterId])
REFERENCES [dbo].[Manufacture] ([Id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Manufacture]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Supplier] FOREIGN KEY([SupplierId])
REFERENCES [dbo].[Supplier] ([Id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Supplier]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Role] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([Id])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Role]
GO
