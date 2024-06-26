USE [master]
GO
/****** Object:  Database [library]    Script Date: 2024/4/1 15:41:03 ******/
CREATE DATABASE [library]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'library', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\library.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'library_log', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\library_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [library] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [library].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [library] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [library] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [library] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [library] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [library] SET ARITHABORT OFF 
GO
ALTER DATABASE [library] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [library] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [library] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [library] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [library] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [library] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [library] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [library] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [library] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [library] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [library] SET  DISABLE_BROKER 
GO
ALTER DATABASE [library] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [library] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [library] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [library] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [library] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [library] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [library] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [library] SET RECOVERY FULL 
GO
ALTER DATABASE [library] SET  MULTI_USER 
GO
ALTER DATABASE [library] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [library] SET DB_CHAINING OFF 
GO
ALTER DATABASE [library] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [library] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'library', N'ON'
GO
USE [library]
GO
/****** Object:  Table [dbo].[tb_admin]    Script Date: 2024/4/1 15:41:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_admin](
	[id] [varchar](20) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[pwd] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tb_admin] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_bookcase]    Script Date: 2024/4/1 15:41:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_bookcase](
	[id] [varchar](20) NOT NULL,
	[name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tb_bookcase] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_bookinfo]    Script Date: 2024/4/1 15:41:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_bookinfo](
	[bookcode] [varchar](30) NOT NULL,
	[bookname] [varchar](50) NOT NULL,
	[type] [int] NOT NULL,
	[author] [varchar](50) NULL,
	[translator] [varchar](50) NULL,
	[pubname] [varchar](100) NULL,
	[price] [money] NULL,
	[page] [int] NULL,
	[bcase] [varchar](20) NULL,
	[storage] [bigint] NOT NULL,
	[inTime] [datetime] NOT NULL,
	[oper] [varchar](20) NOT NULL,
	[borrownum] [int] NULL,
 CONSTRAINT [PK_tb_bookinfo] PRIMARY KEY CLUSTERED 
(
	[bookcode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_booktype]    Script Date: 2024/4/1 15:41:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_booktype](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[typename] [varchar](30) NOT NULL,
	[days] [int] NULL,
 CONSTRAINT [PK_tb_booktype] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_borrowandback]    Script Date: 2024/4/1 15:41:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_borrowandback](
	[id] [varchar](30) NOT NULL,
	[reader] [varchar](30) NOT NULL,
	[bookcode] [varchar](30) NOT NULL,
	[borrowtime] [datetime] NULL,
	[ygbacktime] [datetime] NULL,
	[sjbacktime] [datetime] NULL,
	[borrowoper] [varchar](20) NOT NULL,
	[backoper] [varchar](20) NULL,
	[isback] [bit] NULL,
 CONSTRAINT [PK_tb_borrowandback] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_library]    Script Date: 2024/4/1 15:41:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_library](
	[libraryname] [varchar](50) NOT NULL,
	[curator] [varchar](20) NOT NULL,
	[tel] [varchar](20) NOT NULL,
	[address] [varchar](100) NULL,
	[email] [varchar](50) NULL,
	[url] [varchar](100) NULL,
	[createdate] [datetime] NOT NULL,
	[introduce] [text] NULL,
 CONSTRAINT [PK_tb_library] PRIMARY KEY CLUSTERED 
(
	[libraryname] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_purview]    Script Date: 2024/4/1 15:41:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_purview](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[sysset] [bit] NOT NULL,
	[readset] [bit] NOT NULL,
	[bookset] [bit] NOT NULL,
	[borrowback] [bit] NOT NULL,
	[sysquery] [bit] NOT NULL,
 CONSTRAINT [PK_tb_purview] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tb_reader]    Script Date: 2024/4/1 15:41:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_reader](
	[id] [varchar](30) NOT NULL,
	[name] [varchar](20) NOT NULL,
	[type] [int] NOT NULL,
	[birthday] [datetime] NULL,
	[papertype] [varchar](20) NOT NULL,
	[papernum] [varchar](30) NOT NULL,
	[tel] [varchar](30) NOT NULL,
	[email] [varchar](50) NULL,
	[createdate] [datetime] NULL,
	[oper] [varchar](20) NOT NULL,
	[remark] [varchar](200) NULL,
	[borrownum] [int] NULL,
	[num] [int] NULL,
 CONSTRAINT [PK_tb_reader] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_readertype]    Script Date: 2024/4/1 15:41:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_readertype](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](30) NOT NULL,
	[number] [int] NOT NULL,
 CONSTRAINT [PK_tb_readertype] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[View_1]    Script Date: 2024/4/1 15:41:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_1]
AS
SELECT  dbo.tb_bookinfo.bookcode
FROM      dbo.tb_admin INNER JOIN
                   dbo.tb_bookinfo ON dbo.tb_admin.id = dbo.tb_bookinfo.oper INNER JOIN
                   dbo.tb_bookcase ON dbo.tb_bookinfo.bcase = dbo.tb_bookcase.id INNER JOIN
                   dbo.tb_booktype ON dbo.tb_bookinfo.type = dbo.tb_booktype.id INNER JOIN
                   dbo.tb_borrowandback ON dbo.tb_admin.id = dbo.tb_borrowandback.borrowoper AND 
                   dbo.tb_admin.id = dbo.tb_borrowandback.backoper AND 
                   dbo.tb_bookinfo.bookcode = dbo.tb_borrowandback.bookcode INNER JOIN
                   dbo.tb_reader ON dbo.tb_admin.id = dbo.tb_reader.oper AND 
                   dbo.tb_borrowandback.reader = dbo.tb_reader.id INNER JOIN
                   dbo.tb_readertype ON dbo.tb_reader.type = dbo.tb_readertype.id

GO
ALTER TABLE [dbo].[tb_borrowandback] ADD  CONSTRAINT [DF_tb_borrowandback_isback]  DEFAULT ((0)) FOR [isback]
GO
ALTER TABLE [dbo].[tb_reader] ADD  CONSTRAINT [DF_tb_reader_borrownum]  DEFAULT ((0)) FOR [borrownum]
GO
ALTER TABLE [dbo].[tb_reader] ADD  CONSTRAINT [DF_tb_reader_num]  DEFAULT ((0)) FOR [num]
GO
ALTER TABLE [dbo].[tb_admin]  WITH CHECK ADD  CONSTRAINT [FK_tb_admin_tb_admin] FOREIGN KEY([id])
REFERENCES [dbo].[tb_admin] ([id])
GO
ALTER TABLE [dbo].[tb_admin] CHECK CONSTRAINT [FK_tb_admin_tb_admin]
GO
ALTER TABLE [dbo].[tb_bookinfo]  WITH CHECK ADD  CONSTRAINT [bcase] FOREIGN KEY([bcase])
REFERENCES [dbo].[tb_bookcase] ([id])
GO
ALTER TABLE [dbo].[tb_bookinfo] CHECK CONSTRAINT [bcase]
GO
ALTER TABLE [dbo].[tb_bookinfo]  WITH CHECK ADD  CONSTRAINT [oper] FOREIGN KEY([oper])
REFERENCES [dbo].[tb_admin] ([id])
GO
ALTER TABLE [dbo].[tb_bookinfo] CHECK CONSTRAINT [oper]
GO
ALTER TABLE [dbo].[tb_bookinfo]  WITH CHECK ADD  CONSTRAINT [typeid] FOREIGN KEY([type])
REFERENCES [dbo].[tb_booktype] ([id])
GO
ALTER TABLE [dbo].[tb_bookinfo] CHECK CONSTRAINT [typeid]
GO
ALTER TABLE [dbo].[tb_borrowandback]  WITH CHECK ADD  CONSTRAINT [backoper] FOREIGN KEY([backoper])
REFERENCES [dbo].[tb_admin] ([id])
GO
ALTER TABLE [dbo].[tb_borrowandback] CHECK CONSTRAINT [backoper]
GO
ALTER TABLE [dbo].[tb_borrowandback]  WITH CHECK ADD  CONSTRAINT [bookcode] FOREIGN KEY([bookcode])
REFERENCES [dbo].[tb_bookinfo] ([bookcode])
GO
ALTER TABLE [dbo].[tb_borrowandback] CHECK CONSTRAINT [bookcode]
GO
ALTER TABLE [dbo].[tb_borrowandback]  WITH CHECK ADD  CONSTRAINT [borrowoper] FOREIGN KEY([borrowoper])
REFERENCES [dbo].[tb_admin] ([id])
GO
ALTER TABLE [dbo].[tb_borrowandback] CHECK CONSTRAINT [borrowoper]
GO
ALTER TABLE [dbo].[tb_borrowandback]  WITH CHECK ADD  CONSTRAINT [FK_reader_id_to_borrowandback_readerid] FOREIGN KEY([reader])
REFERENCES [dbo].[tb_reader] ([id])
GO
ALTER TABLE [dbo].[tb_borrowandback] CHECK CONSTRAINT [FK_reader_id_to_borrowandback_readerid]
GO
ALTER TABLE [dbo].[tb_reader]  WITH CHECK ADD  CONSTRAINT [FK_admin_id_to_reader_oper] FOREIGN KEY([oper])
REFERENCES [dbo].[tb_admin] ([id])
GO
ALTER TABLE [dbo].[tb_reader] CHECK CONSTRAINT [FK_admin_id_to_reader_oper]
GO
ALTER TABLE [dbo].[tb_reader]  WITH CHECK ADD  CONSTRAINT [FK_reader_typeid_to_readertype_id] FOREIGN KEY([type])
REFERENCES [dbo].[tb_readertype] ([id])
GO
ALTER TABLE [dbo].[tb_reader] CHECK CONSTRAINT [FK_reader_typeid_to_readertype_id]
GO
ALTER TABLE [dbo].[tb_readertype]  WITH CHECK ADD  CONSTRAINT [FK_readertype_id_to_reader_id] FOREIGN KEY([id])
REFERENCES [dbo].[tb_readertype] ([id])
GO
ALTER TABLE [dbo].[tb_readertype] CHECK CONSTRAINT [FK_readertype_id_to_reader_id]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_admin', @level2type=N'COLUMN',@level2name=N'id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_admin', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'密码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_admin', @level2type=N'COLUMN',@level2name=N'pwd'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'书架ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_bookcase', @level2type=N'COLUMN',@level2name=N'id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'书架名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_bookcase', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ISBN' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_bookinfo', @level2type=N'COLUMN',@level2name=N'bookcode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'图书名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_bookinfo', @level2type=N'COLUMN',@level2name=N'bookname'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'图书类型ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_bookinfo', @level2type=N'COLUMN',@level2name=N'type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'作者' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_bookinfo', @level2type=N'COLUMN',@level2name=N'author'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'译者' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_bookinfo', @level2type=N'COLUMN',@level2name=N'translator'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'出版社' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_bookinfo', @level2type=N'COLUMN',@level2name=N'pubname'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'价格' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_bookinfo', @level2type=N'COLUMN',@level2name=N'price'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'页数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_bookinfo', @level2type=N'COLUMN',@level2name=N'page'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'书架' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_bookinfo', @level2type=N'COLUMN',@level2name=N'bcase'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'库存数量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_bookinfo', @level2type=N'COLUMN',@level2name=N'storage'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'入库时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_bookinfo', @level2type=N'COLUMN',@level2name=N'inTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'操作员' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_bookinfo', @level2type=N'COLUMN',@level2name=N'oper'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'借阅次数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_bookinfo', @level2type=N'COLUMN',@level2name=N'borrownum'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'图书类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_booktype', @level2type=N'COLUMN',@level2name=N'id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'图书类型名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_booktype', @level2type=N'COLUMN',@level2name=N'typename'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'可借天数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_booktype', @level2type=N'COLUMN',@level2name=N'days'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'流水号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_borrowandback', @level2type=N'COLUMN',@level2name=N'id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'读者ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_borrowandback', @level2type=N'COLUMN',@level2name=N'reader'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ISBN' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_borrowandback', @level2type=N'COLUMN',@level2name=N'bookcode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'借书时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_borrowandback', @level2type=N'COLUMN',@level2name=N'borrowtime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'应该还书时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_borrowandback', @level2type=N'COLUMN',@level2name=N'ygbacktime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'实际还书时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_borrowandback', @level2type=N'COLUMN',@level2name=N'sjbacktime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'借书经办人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_borrowandback', @level2type=N'COLUMN',@level2name=N'borrowoper'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'还书经办人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_borrowandback', @level2type=N'COLUMN',@level2name=N'backoper'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否归还' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_borrowandback', @level2type=N'COLUMN',@level2name=N'isback'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'图书馆名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_library', @level2type=N'COLUMN',@level2name=N'libraryname'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'馆长姓名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_library', @level2type=N'COLUMN',@level2name=N'curator'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'电话' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_library', @level2type=N'COLUMN',@level2name=N'tel'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_library', @level2type=N'COLUMN',@level2name=N'address'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'E-mail' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_library', @level2type=N'COLUMN',@level2name=N'email'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'网址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_library', @level2type=N'COLUMN',@level2name=N'url'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'建馆时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_library', @level2type=N'COLUMN',@level2name=N'createdate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'介绍' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_library', @level2type=N'COLUMN',@level2name=N'introduce'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'流水号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_purview', @level2type=N'COLUMN',@level2name=N'id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'系统设置菜单' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_purview', @level2type=N'COLUMN',@level2name=N'sysset'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'读者管理菜单' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_purview', @level2type=N'COLUMN',@level2name=N'readset'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'图书管理菜单' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_purview', @level2type=N'COLUMN',@level2name=N'bookset'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'图书借还菜单' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_purview', @level2type=N'COLUMN',@level2name=N'borrowback'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'系统查询菜单' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_purview', @level2type=N'COLUMN',@level2name=N'sysquery'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'读者ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_reader', @level2type=N'COLUMN',@level2name=N'id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'读者姓名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_reader', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'读者类型ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_reader', @level2type=N'COLUMN',@level2name=N'type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'出生日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_reader', @level2type=N'COLUMN',@level2name=N'birthday'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'证件类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_reader', @level2type=N'COLUMN',@level2name=N'papertype'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'证件号码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_reader', @level2type=N'COLUMN',@level2name=N'papernum'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'电话' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_reader', @level2type=N'COLUMN',@level2name=N'tel'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'E-mail' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_reader', @level2type=N'COLUMN',@level2name=N'email'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'建立日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_reader', @level2type=N'COLUMN',@level2name=N'createdate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'操作员' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_reader', @level2type=N'COLUMN',@level2name=N'oper'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_reader', @level2type=N'COLUMN',@level2name=N'remark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'借书量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_reader', @level2type=N'COLUMN',@level2name=N'borrownum'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'借阅次数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_reader', @level2type=N'COLUMN',@level2name=N'num'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'读者类型ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_readertype', @level2type=N'COLUMN',@level2name=N'id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'读者类型名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_readertype', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'可借图书数量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_readertype', @level2type=N'COLUMN',@level2name=N'number'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[75] 4[1] 2[7] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "tb_admin"
            Begin Extent = 
               Top = 416
               Left = 269
               Bottom = 556
               Right = 427
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tb_bookinfo"
            Begin Extent = 
               Top = 0
               Left = 0
               Bottom = 361
               Right = 186
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tb_bookcase"
            Begin Extent = 
               Top = 281
               Left = 272
               Bottom = 400
               Right = 433
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tb_booktype"
            Begin Extent = 
               Top = 136
               Left = 269
               Bottom = 277
               Right = 437
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tb_borrowandback"
            Begin Extent = 
               Top = 0
               Left = 497
               Bottom = 317
               Right = 659
            End
            DisplayFlags = 280
            TopColumn = 2
         End
         Begin Table = "tb_reader"
            Begin Extent = 
               Top = 110
               Left = 770
               Bottom = 497
               Right = 950
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tb_readertype"
            Begin Extent = 
               Top = 153
               Left = 1037
               Bottom = 305
               Right = 1201
            End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1176
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1356
         SortOrder = 1416
         GroupBy = 1350
         Filter = 1356
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_1'
GO
USE [master]
GO
ALTER DATABASE [library] SET  READ_WRITE 
GO
