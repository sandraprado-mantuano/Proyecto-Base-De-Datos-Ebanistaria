USE [master]
GO
/****** Object:  Database [triggers]    Script Date: 12/03/2021 12:25:45 ******/
CREATE DATABASE [triggers]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'triggers', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\triggers.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'triggers_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\triggers_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [triggers] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [triggers].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [triggers] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [triggers] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [triggers] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [triggers] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [triggers] SET ARITHABORT OFF 
GO
ALTER DATABASE [triggers] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [triggers] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [triggers] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [triggers] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [triggers] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [triggers] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [triggers] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [triggers] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [triggers] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [triggers] SET  DISABLE_BROKER 
GO
ALTER DATABASE [triggers] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [triggers] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [triggers] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [triggers] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [triggers] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [triggers] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [triggers] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [triggers] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [triggers] SET  MULTI_USER 
GO
ALTER DATABASE [triggers] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [triggers] SET DB_CHAINING OFF 
GO
ALTER DATABASE [triggers] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [triggers] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [triggers] SET DELAYED_DURABILITY = DISABLED 
GO
USE [triggers]
GO
/****** Object:  Table [dbo].[articulo]    Script Date: 12/03/2021 12:25:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[articulo](
	[idarticulo] [int] IDENTITY(1,1) NOT NULL,
	[idcategoria] [int] NOT NULL,
	[codigo] [varchar](50) NULL,
	[nombre] [varchar](100) NOT NULL,
	[precio_venta] [decimal](11, 2) NOT NULL,
	[stock] [int] NOT NULL,
	[descripcion] [varchar](256) NULL,
	[estado] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[idarticulo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AuditoriaTblUsuarios]    Script Date: 12/03/2021 12:25:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AuditoriaTblUsuarios](
	[idusuario] [int] NULL,
	[idrol] [int] NULL,
	[Nombre] [varchar](50) NULL,
	[tipo_documento] [varchar](50) NULL,
	[num_documento] [int] NULL,
	[direccion] [varchar](50) NULL,
	[telefono] [int] NULL,
	[email] [varchar](50) NULL,
	[password] [varchar](50) NULL,
	[estado] [varchar](50) NULL,
	[usuarioCreador] [varchar](100) NULL,
	[Fecha] [datetime] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[categoria]    Script Date: 12/03/2021 12:25:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[categoria](
	[idcategoria] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[descripcion] [varchar](256) NULL,
	[estado] [bit] NULL DEFAULT ((1)),
PRIMARY KEY CLUSTERED 
(
	[idcategoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[detalle_ingreso]    Script Date: 12/03/2021 12:25:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[detalle_ingreso](
	[iddetalle_ingreso] [int] IDENTITY(1,1) NOT NULL,
	[idingreso] [int] NOT NULL,
	[idarticulo] [int] NOT NULL,
	[cantidad] [int] NOT NULL,
	[precio] [decimal](11, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[iddetalle_ingreso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[detalle_venta]    Script Date: 12/03/2021 12:25:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[detalle_venta](
	[iddetalle_venta] [int] IDENTITY(1,1) NOT NULL,
	[idventa] [int] NOT NULL,
	[idarticulo] [int] NOT NULL,
	[cantidad] [int] NOT NULL,
	[precio] [decimal](11, 2) NOT NULL,
	[descuento] [decimal](11, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[iddetalle_venta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ingreso]    Script Date: 12/03/2021 12:25:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ingreso](
	[idingreso] [int] IDENTITY(1,1) NOT NULL,
	[idproveedor] [int] NOT NULL,
	[idusuario] [int] NOT NULL,
	[tipo_comprobante] [varchar](20) NOT NULL,
	[serie_comprobante] [varchar](7) NULL,
	[num_comprobante] [varchar](10) NOT NULL,
	[fecha] [datetime] NOT NULL,
	[impuesto] [decimal](4, 2) NOT NULL,
	[total] [decimal](11, 2) NOT NULL,
	[estado] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idingreso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[persona]    Script Date: 12/03/2021 12:25:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[persona](
	[idpersona] [int] IDENTITY(1,1) NOT NULL,
	[tipo_persona] [varchar](20) NOT NULL,
	[nombre] [varchar](100) NOT NULL,
	[tipo_documento] [varchar](20) NULL,
	[num_documento] [varchar](20) NULL,
	[direccion] [varchar](70) NULL,
	[telefono] [varchar](20) NULL,
	[email] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[idpersona] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[rol]    Script Date: 12/03/2021 12:25:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[rol](
	[idrol] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](30) NOT NULL,
	[descripcion] [varchar](100) NULL,
	[estado] [varchar](50) NULL DEFAULT ((1)),
PRIMARY KEY CLUSTERED 
(
	[idrol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[usuario]    Script Date: 12/03/2021 12:25:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[usuario](
	[idusuario] [int] IDENTITY(1,1) NOT NULL,
	[idrol] [int] NOT NULL,
	[nombre] [varchar](100) NOT NULL,
	[tipo_documento] [varchar](20) NULL,
	[num_documento] [varchar](20) NULL,
	[direccion] [varchar](70) NULL,
	[telefono] [varchar](20) NULL,
	[email] [varchar](50) NOT NULL,
	[password] [varchar](50) NOT NULL,
	[estado] [varchar](50) NULL DEFAULT ((1)),
PRIMARY KEY CLUSTERED 
(
	[idusuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[venta]    Script Date: 12/03/2021 12:25:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[venta](
	[idventa] [int] IDENTITY(1,1) NOT NULL,
	[idcliente] [int] NOT NULL,
	[idusuario] [int] NOT NULL,
	[tipo_comprobante] [varchar](20) NOT NULL,
	[serie_comprobante] [varchar](7) NULL,
	[num_comprobante] [varchar](10) NOT NULL,
	[fecha_hora] [datetime] NOT NULL,
	[impuesto] [decimal](4, 2) NOT NULL,
	[total] [decimal](11, 2) NOT NULL,
	[estado] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idventa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[AuditoriaTblUsuarios] ([idusuario], [idrol], [Nombre], [tipo_documento], [num_documento], [direccion], [telefono], [email], [password], [estado], [usuarioCreador], [Fecha]) VALUES (2, 1, N'Saori', N'Cedula', 1362389021, N'Manta', 989556544, N'saori.pram@gmail.com', N'sa123', N'activo', N'DESKTOP-NS8TTFM\sandr', CAST(N'2021-03-10 18:41:54.790' AS DateTime))
SET IDENTITY_INSERT [dbo].[categoria] ON 

INSERT [dbo].[categoria] ([idcategoria], [nombre], [descripcion], [estado]) VALUES (1, N'Herramientas', N'Herramientas Basicas', 1)
SET IDENTITY_INSERT [dbo].[categoria] OFF
SET IDENTITY_INSERT [dbo].[persona] ON 

INSERT [dbo].[persona] ([idpersona], [tipo_persona], [nombre], [tipo_documento], [num_documento], [direccion], [telefono], [email]) VALUES (1, N'Cliente', N'Maria Mero', N'Cedula', N'1328934098', N'Manta', N'0992231789', N'mary@gamil.com')
INSERT [dbo].[persona] ([idpersona], [tipo_persona], [nombre], [tipo_documento], [num_documento], [direccion], [telefono], [email]) VALUES (2, N'Empleado', N'Cesar Franco', N'Cedula', N'1314355239', N'Los Estertos', N'0934567220', N'cesar@hotmail.com')
INSERT [dbo].[persona] ([idpersona], [tipo_persona], [nombre], [tipo_documento], [num_documento], [direccion], [telefono], [email]) VALUES (4, N'Clliente', N'Mario Perez', N'Cedula', N'1323346578', N'El Palmar', N'0956723129', N'perezm@gmail.com')
INSERT [dbo].[persona] ([idpersona], [tipo_persona], [nombre], [tipo_documento], [num_documento], [direccion], [telefono], [email]) VALUES (5, N'Cliente', N'Cecilia Ruiz', N'Cedula', N'1367679821', N'Manta', N'0956723456', N'ceci-ruiz@hotmail.com')
INSERT [dbo].[persona] ([idpersona], [tipo_persona], [nombre], [tipo_documento], [num_documento], [direccion], [telefono], [email]) VALUES (6, N'Empleado', N'Tereza Campos', N'Cedula', N'1315672342', N'Tarqui', N'0966783430', N'campostere@outlook.es')
SET IDENTITY_INSERT [dbo].[persona] OFF
SET IDENTITY_INSERT [dbo].[rol] ON 

INSERT [dbo].[rol] ([idrol], [nombre], [descripcion], [estado]) VALUES (1, N'Johan', N'Gerente', N'Activo')
SET IDENTITY_INSERT [dbo].[rol] OFF
SET IDENTITY_INSERT [dbo].[usuario] ON 

INSERT [dbo].[usuario] ([idusuario], [idrol], [nombre], [tipo_documento], [num_documento], [direccion], [telefono], [email], [password], [estado]) VALUES (1, 1, N'Sandra', N'Cedula', N'1314565782', N'Manta', N'0934567289', N'sanprado@gmail.com', N's12345', N'activo')
INSERT [dbo].[usuario] ([idusuario], [idrol], [nombre], [tipo_documento], [num_documento], [direccion], [telefono], [email], [password], [estado]) VALUES (2, 1, N'Saori', N'Cedula', N'1362389021', N'Manta', N'989556544', N'saori.pram@gmail.com', N'sa123', N'activo')
SET IDENTITY_INSERT [dbo].[usuario] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__articulo__72AFBCC62512DEF0]    Script Date: 12/03/2021 12:25:45 ******/
ALTER TABLE [dbo].[articulo] ADD UNIQUE NONCLUSTERED 
(
	[nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__categori__72AFBCC6E7D1E626]    Script Date: 12/03/2021 12:25:45 ******/
ALTER TABLE [dbo].[categoria] ADD UNIQUE NONCLUSTERED 
(
	[nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[articulo] ADD  DEFAULT ((1)) FOR [estado]
GO
ALTER TABLE [dbo].[articulo]  WITH CHECK ADD FOREIGN KEY([idcategoria])
REFERENCES [dbo].[categoria] ([idcategoria])
GO
ALTER TABLE [dbo].[detalle_ingreso]  WITH CHECK ADD FOREIGN KEY([idarticulo])
REFERENCES [dbo].[articulo] ([idarticulo])
GO
ALTER TABLE [dbo].[detalle_ingreso]  WITH CHECK ADD FOREIGN KEY([idingreso])
REFERENCES [dbo].[ingreso] ([idingreso])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[detalle_venta]  WITH CHECK ADD FOREIGN KEY([idarticulo])
REFERENCES [dbo].[articulo] ([idarticulo])
GO
ALTER TABLE [dbo].[detalle_venta]  WITH CHECK ADD FOREIGN KEY([idventa])
REFERENCES [dbo].[venta] ([idventa])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ingreso]  WITH CHECK ADD FOREIGN KEY([idproveedor])
REFERENCES [dbo].[persona] ([idpersona])
GO
ALTER TABLE [dbo].[ingreso]  WITH CHECK ADD FOREIGN KEY([idusuario])
REFERENCES [dbo].[usuario] ([idusuario])
GO
ALTER TABLE [dbo].[usuario]  WITH CHECK ADD FOREIGN KEY([idrol])
REFERENCES [dbo].[rol] ([idrol])
GO
ALTER TABLE [dbo].[venta]  WITH CHECK ADD FOREIGN KEY([idcliente])
REFERENCES [dbo].[persona] ([idpersona])
GO
ALTER TABLE [dbo].[venta]  WITH CHECK ADD FOREIGN KEY([idusuario])
REFERENCES [dbo].[usuario] ([idusuario])
GO
USE [master]
GO
ALTER DATABASE [triggers] SET  READ_WRITE 
GO
