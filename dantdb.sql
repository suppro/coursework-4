USE [master]
GO
/****** Object:  Database [DANTDB]    Script Date: 22.05.2021 23:42:34 ******/
CREATE DATABASE [DANTDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DANTDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\DANTDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DANTDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\DANTDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [DANTDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DANTDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DANTDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DANTDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DANTDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DANTDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DANTDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [DANTDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DANTDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DANTDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DANTDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DANTDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DANTDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DANTDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DANTDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DANTDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DANTDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DANTDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DANTDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DANTDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DANTDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DANTDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DANTDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DANTDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DANTDB] SET RECOVERY FULL 
GO
ALTER DATABASE [DANTDB] SET  MULTI_USER 
GO
ALTER DATABASE [DANTDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DANTDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DANTDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DANTDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DANTDB] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'DANTDB', N'ON'
GO
ALTER DATABASE [DANTDB] SET QUERY_STORE = OFF
GO
USE [DANTDB]
GO
/****** Object:  Table [dbo].[Appointment]    Script Date: 22.05.2021 23:42:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Appointment](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[time_id] [int] NOT NULL,
	[client_id] [int] NOT NULL,
	[employee_id] [int] NOT NULL,
	[status_id] [int] NOT NULL,
	[number_appointment] [int] NOT NULL,
	[date] [date] NOT NULL,
 CONSTRAINT [PK_Appointment] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AppointmentStatus]    Script Date: 22.05.2021 23:42:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AppointmentStatus](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[status_appointment] [varchar](50) NOT NULL,
 CONSTRAINT [PK_AppointmentStatus] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Check]    Script Date: 22.05.2021 23:42:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Check](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[appointment_id] [int] NOT NULL,
	[check_status_id] [int] NOT NULL,
	[number_check] [int] NOT NULL,
	[service_cost] [int] NOT NULL,
 CONSTRAINT [PK_Check] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CheckStatus]    Script Date: 22.05.2021 23:42:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CheckStatus](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[check_status] [varchar](50) NOT NULL,
 CONSTRAINT [PK_CheckStatus] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Client]    Script Date: 22.05.2021 23:42:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[surname] [varchar](50) NOT NULL,
	[patronymic] [varchar](50) NOT NULL,
	[phone] [varchar](50) NOT NULL,
	[card_number] [int] NOT NULL,
	[deleted] [int] NULL,
 CONSTRAINT [PK_Client] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 22.05.2021 23:42:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[position_id] [int] NOT NULL,
	[category_id] [int] NULL,
	[name] [varchar](50) NOT NULL,
	[surname] [varchar](50) NOT NULL,
	[patronymic] [varchar](50) NOT NULL,
	[phone] [varchar](50) NOT NULL,
	[login] [varchar](50) NOT NULL,
	[password] [varchar](50) NOT NULL,
	[deleted] [int] NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee_Service]    Script Date: 22.05.2021 23:42:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee_Service](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[employee_id] [int] NULL,
	[service_id] [int] NULL,
 CONSTRAINT [PK_Employee_Service] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Position]    Script Date: 22.05.2021 23:42:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Position](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[position] [varchar](max) NOT NULL,
 CONSTRAINT [PK_EmployeeStatus] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Service]    Script Date: 22.05.2021 23:42:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Service](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](max) NULL,
	[price] [int] NULL,
 CONSTRAINT [PK_Service] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Timetable]    Script Date: 22.05.2021 23:42:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Timetable](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[time] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Timetable] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Сategory]    Script Date: 22.05.2021 23:42:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Сategory](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NULL,
 CONSTRAINT [PK_Сategory] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Appointment] ON 

INSERT [dbo].[Appointment] ([id], [time_id], [client_id], [employee_id], [status_id], [number_appointment], [date]) VALUES (2, 6, 1, 1, 3, 510000, CAST(N'2020-11-16' AS Date))
INSERT [dbo].[Appointment] ([id], [time_id], [client_id], [employee_id], [status_id], [number_appointment], [date]) VALUES (4, 11, 1, 1, 4, 510001, CAST(N'2020-11-16' AS Date))
INSERT [dbo].[Appointment] ([id], [time_id], [client_id], [employee_id], [status_id], [number_appointment], [date]) VALUES (5, 14, 1, 1, 4, 510002, CAST(N'2020-11-17' AS Date))
INSERT [dbo].[Appointment] ([id], [time_id], [client_id], [employee_id], [status_id], [number_appointment], [date]) VALUES (6, 5, 3, 2, 4, 1, CAST(N'2020-11-18' AS Date))
INSERT [dbo].[Appointment] ([id], [time_id], [client_id], [employee_id], [status_id], [number_appointment], [date]) VALUES (7, 3, 3, 2, 4, 1, CAST(N'2020-11-18' AS Date))
INSERT [dbo].[Appointment] ([id], [time_id], [client_id], [employee_id], [status_id], [number_appointment], [date]) VALUES (8, 1, 2, 2, 4, 1, CAST(N'2020-11-18' AS Date))
INSERT [dbo].[Appointment] ([id], [time_id], [client_id], [employee_id], [status_id], [number_appointment], [date]) VALUES (9, 1, 3, 1, 1, 1, CAST(N'2020-11-20' AS Date))
INSERT [dbo].[Appointment] ([id], [time_id], [client_id], [employee_id], [status_id], [number_appointment], [date]) VALUES (10, 6, 2, 5, 1, 1, CAST(N'2020-11-26' AS Date))
INSERT [dbo].[Appointment] ([id], [time_id], [client_id], [employee_id], [status_id], [number_appointment], [date]) VALUES (11, 2, 1, 5, 5, 1, CAST(N'2020-11-20' AS Date))
INSERT [dbo].[Appointment] ([id], [time_id], [client_id], [employee_id], [status_id], [number_appointment], [date]) VALUES (12, 8, 3, 5, 4, 1, CAST(N'2020-11-20' AS Date))
INSERT [dbo].[Appointment] ([id], [time_id], [client_id], [employee_id], [status_id], [number_appointment], [date]) VALUES (13, 7, 2, 5, 4, 1, CAST(N'2020-11-22' AS Date))
INSERT [dbo].[Appointment] ([id], [time_id], [client_id], [employee_id], [status_id], [number_appointment], [date]) VALUES (14, 8, 2, 5, 4, 1, CAST(N'2020-11-23' AS Date))
INSERT [dbo].[Appointment] ([id], [time_id], [client_id], [employee_id], [status_id], [number_appointment], [date]) VALUES (15, 4, 2, 5, 6, 510003, CAST(N'2020-11-28' AS Date))
INSERT [dbo].[Appointment] ([id], [time_id], [client_id], [employee_id], [status_id], [number_appointment], [date]) VALUES (16, 7, 3, 5, 6, 510004, CAST(N'2020-11-29' AS Date))
INSERT [dbo].[Appointment] ([id], [time_id], [client_id], [employee_id], [status_id], [number_appointment], [date]) VALUES (17, 7, 2, 5, 1, 510005, CAST(N'2020-11-29' AS Date))
INSERT [dbo].[Appointment] ([id], [time_id], [client_id], [employee_id], [status_id], [number_appointment], [date]) VALUES (18, 5, 12, 5, 1, 510006, CAST(N'2020-12-01' AS Date))
INSERT [dbo].[Appointment] ([id], [time_id], [client_id], [employee_id], [status_id], [number_appointment], [date]) VALUES (19, 4, 12, 5, 4, 510010, CAST(N'2020-12-02' AS Date))
SET IDENTITY_INSERT [dbo].[Appointment] OFF
GO
SET IDENTITY_INSERT [dbo].[AppointmentStatus] ON 

INSERT [dbo].[AppointmentStatus] ([id], [status_appointment]) VALUES (1, N'Записан')
INSERT [dbo].[AppointmentStatus] ([id], [status_appointment]) VALUES (2, N'Явился на прием')
INSERT [dbo].[AppointmentStatus] ([id], [status_appointment]) VALUES (3, N'Не явился на прием')
INSERT [dbo].[AppointmentStatus] ([id], [status_appointment]) VALUES (4, N'Обслужен, чек к оплате готов')
INSERT [dbo].[AppointmentStatus] ([id], [status_appointment]) VALUES (5, N'Отменен')
INSERT [dbo].[AppointmentStatus] ([id], [status_appointment]) VALUES (6, N'Удален')
SET IDENTITY_INSERT [dbo].[AppointmentStatus] OFF
GO
SET IDENTITY_INSERT [dbo].[Check] ON 

INSERT [dbo].[Check] ([id], [appointment_id], [check_status_id], [number_check], [service_cost]) VALUES (1, 2, 2, 510000, 3500)
INSERT [dbo].[Check] ([id], [appointment_id], [check_status_id], [number_check], [service_cost]) VALUES (2, 5, 1, 510001, 3000)
INSERT [dbo].[Check] ([id], [appointment_id], [check_status_id], [number_check], [service_cost]) VALUES (3, 5, 1, 510002, 3000)
INSERT [dbo].[Check] ([id], [appointment_id], [check_status_id], [number_check], [service_cost]) VALUES (4, 5, 1, 510003, 3000)
INSERT [dbo].[Check] ([id], [appointment_id], [check_status_id], [number_check], [service_cost]) VALUES (5, 6, 1, 510004, 3000)
INSERT [dbo].[Check] ([id], [appointment_id], [check_status_id], [number_check], [service_cost]) VALUES (6, 7, 2, 510005, 5500)
INSERT [dbo].[Check] ([id], [appointment_id], [check_status_id], [number_check], [service_cost]) VALUES (7, 8, 2, 510006, 5000)
INSERT [dbo].[Check] ([id], [appointment_id], [check_status_id], [number_check], [service_cost]) VALUES (8, 12, 2, 510007, 3000)
INSERT [dbo].[Check] ([id], [appointment_id], [check_status_id], [number_check], [service_cost]) VALUES (9, 14, 1, 510008, 5000)
INSERT [dbo].[Check] ([id], [appointment_id], [check_status_id], [number_check], [service_cost]) VALUES (10, 19, 2, 510009, 3000)
SET IDENTITY_INSERT [dbo].[Check] OFF
GO
SET IDENTITY_INSERT [dbo].[CheckStatus] ON 

INSERT [dbo].[CheckStatus] ([id], [check_status]) VALUES (1, N'Готов к оплате')
INSERT [dbo].[CheckStatus] ([id], [check_status]) VALUES (2, N'Оплачен')
INSERT [dbo].[CheckStatus] ([id], [check_status]) VALUES (3, N'Удален')
SET IDENTITY_INSERT [dbo].[CheckStatus] OFF
GO
SET IDENTITY_INSERT [dbo].[Client] ON 

INSERT [dbo].[Client] ([id], [name], [surname], [patronymic], [phone], [card_number], [deleted]) VALUES (1, N'Григорий', N'Лужков', N'Олегович', N'+78372637284', 100000, NULL)
INSERT [dbo].[Client] ([id], [name], [surname], [patronymic], [phone], [card_number], [deleted]) VALUES (2, N'Павел', N'Петров', N'Александрович', N'+79775238471', 100003, NULL)
INSERT [dbo].[Client] ([id], [name], [surname], [patronymic], [phone], [card_number], [deleted]) VALUES (3, N'Дмитрий', N'Шакалов', N'Сергеевич', N'+79378273813', 100002, NULL)
INSERT [dbo].[Client] ([id], [name], [surname], [patronymic], [phone], [card_number], [deleted]) VALUES (4, N'Юлианий', N'Аркадьев', N'Матвеевич', N'+7 (981) 650-48-50', 100004, NULL)
INSERT [dbo].[Client] ([id], [name], [surname], [patronymic], [phone], [card_number], [deleted]) VALUES (5, N'Алфира', N'Виноградова', N'Матвеевна', N'+7 (960) 162-89-07', 100005, NULL)
INSERT [dbo].[Client] ([id], [name], [surname], [patronymic], [phone], [card_number], [deleted]) VALUES (6, N'Буди', N'Рублев', N'Матвеевич', N'+7 (981) 762-76-29', 100006, NULL)
INSERT [dbo].[Client] ([id], [name], [surname], [patronymic], [phone], [card_number], [deleted]) VALUES (7, N'Тахое', N'Беляев', N'Анатольевич', N'+7 (956) 820-83-57', 100007, NULL)
INSERT [dbo].[Client] ([id], [name], [surname], [patronymic], [phone], [card_number], [deleted]) VALUES (8, N'Розеллен', N'Малиновская', N'Владиславовна', N'+7 (980) 630-33-17', 100008, NULL)
INSERT [dbo].[Client] ([id], [name], [surname], [patronymic], [phone], [card_number], [deleted]) VALUES (9, N'Валериян', N'Кудрявцев', N'Кириллович', N'+7 (906) 750-70-12', 100009, NULL)
INSERT [dbo].[Client] ([id], [name], [surname], [patronymic], [phone], [card_number], [deleted]) VALUES (10, N'Умсапият', N'Власова', N'Егоровна', N'+7 (935) 289-57-49', 100010, NULL)
INSERT [dbo].[Client] ([id], [name], [surname], [patronymic], [phone], [card_number], [deleted]) VALUES (11, N'Ирина', N'Жукова', N'Сергеевна', N'+79384726312', 100011, NULL)
INSERT [dbo].[Client] ([id], [name], [surname], [patronymic], [phone], [card_number], [deleted]) VALUES (12, N'Дмитрий', N'Гусев', N'Олегович', N'+73837426316', 100012, NULL)
SET IDENTITY_INSERT [dbo].[Client] OFF
GO
SET IDENTITY_INSERT [dbo].[Employee] ON 

INSERT [dbo].[Employee] ([id], [position_id], [category_id], [name], [surname], [patronymic], [phone], [login], [password], [deleted]) VALUES (1, 2, 1, N'Василий', N'Гетигежев', N'Олегович', N'+79852637281', N'admin', N'c3284d0f94606de1fd2af172aba15bf3', NULL)
INSERT [dbo].[Employee] ([id], [position_id], [category_id], [name], [surname], [patronymic], [phone], [login], [password], [deleted]) VALUES (2, 1, NULL, N'Татьяна', N'Золотова', N'Григорьевна', N'+79634627361', N'adm1', N'c3284d0f94606de1fd2af172aba15bf3', NULL)
INSERT [dbo].[Employee] ([id], [position_id], [category_id], [name], [surname], [patronymic], [phone], [login], [password], [deleted]) VALUES (3, 1, NULL, N'Екатерина', N'Окунева', N'Павловна', N'+79772593736', N'adm2', N'c3284d0f94606de1fd2af172aba15bf3', NULL)
INSERT [dbo].[Employee] ([id], [position_id], [category_id], [name], [surname], [patronymic], [phone], [login], [password], [deleted]) VALUES (5, 2, 2, N'Олег', N'Голунов', N'Павлович', N'+79752374823', N'tera1', N'c3284d0f94606de1fd2af172aba15bf3', NULL)
SET IDENTITY_INSERT [dbo].[Employee] OFF
GO
SET IDENTITY_INSERT [dbo].[Position] ON 

INSERT [dbo].[Position] ([id], [position]) VALUES (1, N'Администратор')
INSERT [dbo].[Position] ([id], [position]) VALUES (2, N'Терапевт')
INSERT [dbo].[Position] ([id], [position]) VALUES (3, N'Ортодонт')
INSERT [dbo].[Position] ([id], [position]) VALUES (4, N'Детский стоматолог')
INSERT [dbo].[Position] ([id], [position]) VALUES (5, N'Хирург')
INSERT [dbo].[Position] ([id], [position]) VALUES (6, N'Имплантолог')
INSERT [dbo].[Position] ([id], [position]) VALUES (7, N'Администратор БД')
SET IDENTITY_INSERT [dbo].[Position] OFF
GO
SET IDENTITY_INSERT [dbo].[Service] ON 

INSERT [dbo].[Service] ([id], [name], [price]) VALUES (1, N'Консультация', 100)
INSERT [dbo].[Service] ([id], [name], [price]) VALUES (2, N'Удаление зуба простое', 1500)
INSERT [dbo].[Service] ([id], [name], [price]) VALUES (3, N'Удаление зуба сложное', 3000)
INSERT [dbo].[Service] ([id], [name], [price]) VALUES (4, N'Удаление молочного зуба', 1000)
INSERT [dbo].[Service] ([id], [name], [price]) VALUES (5, N'Удаление пародонтитного зуба', 1000)
INSERT [dbo].[Service] ([id], [name], [price]) VALUES (6, N'Лечение кариеса + пломба', 2000)
INSERT [dbo].[Service] ([id], [name], [price]) VALUES (7, N'Анестезия аппликационная', 100)
INSERT [dbo].[Service] ([id], [name], [price]) VALUES (8, N'Анестезия инфильтрационная', 300)
INSERT [dbo].[Service] ([id], [name], [price]) VALUES (9, N'Анестезия проводниковая', 350)
INSERT [dbo].[Service] ([id], [name], [price]) VALUES (10, N'Радиовизиографическое исследование одного зуба', 300)
INSERT [dbo].[Service] ([id], [name], [price]) VALUES (12, N'Механическая обработка полости зуба', 350)
INSERT [dbo].[Service] ([id], [name], [price]) VALUES (13, N'Временная пломба', 350)
INSERT [dbo].[Service] ([id], [name], [price]) VALUES (14, N'Коронка пластмассовая временная', 1000)
INSERT [dbo].[Service] ([id], [name], [price]) VALUES (15, N'Коронка металлокерамическая', 4650)
INSERT [dbo].[Service] ([id], [name], [price]) VALUES (16, N'Винир', 19000)
INSERT [dbo].[Service] ([id], [name], [price]) VALUES (17, N'Медработы1 (тест)', 1000)
INSERT [dbo].[Service] ([id], [name], [price]) VALUES (18, N'Медработы2 (тест)', 2000)
INSERT [dbo].[Service] ([id], [name], [price]) VALUES (19, N'Медработы3 (тест)', 3000)
SET IDENTITY_INSERT [dbo].[Service] OFF
GO
SET IDENTITY_INSERT [dbo].[Timetable] ON 

INSERT [dbo].[Timetable] ([id], [time]) VALUES (1, N'9:00 - 9:30')
INSERT [dbo].[Timetable] ([id], [time]) VALUES (2, N'9:30 - 10:00')
INSERT [dbo].[Timetable] ([id], [time]) VALUES (3, N'10:00 - 10:30')
INSERT [dbo].[Timetable] ([id], [time]) VALUES (4, N'10:30 - 11:00')
INSERT [dbo].[Timetable] ([id], [time]) VALUES (5, N'11:30 - 12:00')
INSERT [dbo].[Timetable] ([id], [time]) VALUES (6, N'12:00 - 12:30')
INSERT [dbo].[Timetable] ([id], [time]) VALUES (7, N'12:30 - 13:00')
INSERT [dbo].[Timetable] ([id], [time]) VALUES (8, N'13:00 - 13:30')
INSERT [dbo].[Timetable] ([id], [time]) VALUES (9, N'13:30 - 14:00')
INSERT [dbo].[Timetable] ([id], [time]) VALUES (10, N'14:00 - 14:30')
INSERT [dbo].[Timetable] ([id], [time]) VALUES (11, N'14:30 - 15:00')
INSERT [dbo].[Timetable] ([id], [time]) VALUES (12, N'15:00 - 15:30')
INSERT [dbo].[Timetable] ([id], [time]) VALUES (13, N'15:30 - 16:00')
INSERT [dbo].[Timetable] ([id], [time]) VALUES (14, N'16:00 - 16:30')
INSERT [dbo].[Timetable] ([id], [time]) VALUES (15, N'16:30 - 17:00')
SET IDENTITY_INSERT [dbo].[Timetable] OFF
GO
SET IDENTITY_INSERT [dbo].[Сategory] ON 

INSERT [dbo].[Сategory] ([id], [name]) VALUES (1, N'Глав-врач')
INSERT [dbo].[Сategory] ([id], [name]) VALUES (2, N'Зав. стоматологическим отделением')
INSERT [dbo].[Сategory] ([id], [name]) VALUES (3, N'Старший стоматолог')
INSERT [dbo].[Сategory] ([id], [name]) VALUES (4, N'Стоматолог повышенной категории')
SET IDENTITY_INSERT [dbo].[Сategory] OFF
GO
/****** Object:  Index [IX_Client]    Script Date: 22.05.2021 23:42:36 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Client] ON [dbo].[Client]
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Appointment]  WITH CHECK ADD  CONSTRAINT [FK_Appointment_AppointmentStatus] FOREIGN KEY([status_id])
REFERENCES [dbo].[AppointmentStatus] ([id])
GO
ALTER TABLE [dbo].[Appointment] CHECK CONSTRAINT [FK_Appointment_AppointmentStatus]
GO
ALTER TABLE [dbo].[Appointment]  WITH CHECK ADD  CONSTRAINT [FK_Appointment_Client] FOREIGN KEY([client_id])
REFERENCES [dbo].[Client] ([id])
GO
ALTER TABLE [dbo].[Appointment] CHECK CONSTRAINT [FK_Appointment_Client]
GO
ALTER TABLE [dbo].[Appointment]  WITH CHECK ADD  CONSTRAINT [FK_Appointment_Employee] FOREIGN KEY([employee_id])
REFERENCES [dbo].[Employee] ([id])
GO
ALTER TABLE [dbo].[Appointment] CHECK CONSTRAINT [FK_Appointment_Employee]
GO
ALTER TABLE [dbo].[Appointment]  WITH CHECK ADD  CONSTRAINT [FK_Appointment_Timetable] FOREIGN KEY([time_id])
REFERENCES [dbo].[Timetable] ([id])
GO
ALTER TABLE [dbo].[Appointment] CHECK CONSTRAINT [FK_Appointment_Timetable]
GO
ALTER TABLE [dbo].[Check]  WITH CHECK ADD  CONSTRAINT [FK_Check_Appointment] FOREIGN KEY([appointment_id])
REFERENCES [dbo].[Appointment] ([id])
GO
ALTER TABLE [dbo].[Check] CHECK CONSTRAINT [FK_Check_Appointment]
GO
ALTER TABLE [dbo].[Check]  WITH CHECK ADD  CONSTRAINT [FK_Check_CheckStatus] FOREIGN KEY([check_status_id])
REFERENCES [dbo].[CheckStatus] ([id])
GO
ALTER TABLE [dbo].[Check] CHECK CONSTRAINT [FK_Check_CheckStatus]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_EmployeeStatus] FOREIGN KEY([position_id])
REFERENCES [dbo].[Position] ([id])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_EmployeeStatus]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Сategory] FOREIGN KEY([category_id])
REFERENCES [dbo].[Сategory] ([id])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Сategory]
GO
ALTER TABLE [dbo].[Employee_Service]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Service_Employee] FOREIGN KEY([employee_id])
REFERENCES [dbo].[Employee] ([id])
GO
ALTER TABLE [dbo].[Employee_Service] CHECK CONSTRAINT [FK_Employee_Service_Employee]
GO
ALTER TABLE [dbo].[Employee_Service]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Service_Service] FOREIGN KEY([service_id])
REFERENCES [dbo].[Service] ([id])
GO
ALTER TABLE [dbo].[Employee_Service] CHECK CONSTRAINT [FK_Employee_Service_Service]
GO
USE [master]
GO
ALTER DATABASE [DANTDB] SET  READ_WRITE 
GO
