USE [library]
GO
/****** Object:  Table [dbo].[tb_purview]    Script Date: 03/07/2024 14:09:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_purview](
	[ID] [varchar](50) NOT NULL,
	[sysset] [bit] NOT NULL,
	[readset] [bit] NOT NULL,
	[bookset] [bit] NOT NULL,
	[borrowback] [bit] NOT NULL,
	[sysquery] [bit] NOT NULL,
 CONSTRAINT [PK_tb_purview] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'流水号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_purview', @level2type=N'COLUMN',@level2name=N'ID'
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
/****** Object:  Table [dbo].[tb_library]    Script Date: 03/07/2024 14:09:00 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
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
/****** Object:  Table [dbo].[tb_readertype]    Script Date: 03/07/2024 14:09:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_readertype](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](30) NOT NULL,
	[Number] [int] NOT NULL,
 CONSTRAINT [PK_tb_readertype] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'读者类型ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_readertype', @level2type=N'COLUMN',@level2name=N'ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'读者类型名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_readertype', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'可借图书数量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_readertype', @level2type=N'COLUMN',@level2name=N'Number'
GO
/****** Object:  Table [dbo].[tb_bookcase]    Script Date: 03/07/2024 14:09:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_bookcase](
	[ID] [varchar](20) NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tb_bookcase] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'书架ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_bookcase', @level2type=N'COLUMN',@level2name=N'ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'书架名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_bookcase', @level2type=N'COLUMN',@level2name=N'Name'
GO
/****** Object:  Table [dbo].[tb_admin]    Script Date: 03/07/2024 14:09:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_admin](
	[ID] [varchar](20) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Pwd] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tb_admin] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_admin', @level2type=N'COLUMN',@level2name=N'ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_admin', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'密码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_admin', @level2type=N'COLUMN',@level2name=N'Pwd'
GO
/****** Object:  Table [dbo].[tb_booktype]    Script Date: 03/07/2024 14:09:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_booktype](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[typename] [varchar](30) NOT NULL,
	[days] [int] NULL,
 CONSTRAINT [PK_tb_booktype] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'图书类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_booktype', @level2type=N'COLUMN',@level2name=N'ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'图书类型名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_booktype', @level2type=N'COLUMN',@level2name=N'typename'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'可借天数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_booktype', @level2type=N'COLUMN',@level2name=N'days'
GO
/****** Object:  Table [dbo].[tb_bookinfo]    Script Date: 03/07/2024 14:09:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_bookinfo](
	[bookcode] [varchar](30) NOT NULL,
	[bookname] [varchar](50) NOT NULL,
	[typeid] [int] NOT NULL,
	[author] [varchar](50) NULL,
	[translator] [varchar](50) NULL,
	[pubname] [varchar](100) NULL,
	[price] [money] NULL,
	[page] [int] NULL,
	[bcase] [varchar](20) NULL,
	[storage] [bigint] NOT NULL,
	[inTime] [datetime] NOT NULL,
	[oper] [varchar](30) NOT NULL,
	[borrownum] [int] NULL,
 CONSTRAINT [PK_tb_bookinfo] PRIMARY KEY CLUSTERED 
(
	[bookcode] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ISBN' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_bookinfo', @level2type=N'COLUMN',@level2name=N'bookcode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'图书名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_bookinfo', @level2type=N'COLUMN',@level2name=N'bookname'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'图书类型ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_bookinfo', @level2type=N'COLUMN',@level2name=N'typeid'
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
/****** Object:  Table [dbo].[tb_reader]    Script Date: 03/07/2024 14:09:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_reader](
	[ID] [varchar](30) NOT NULL,
	[Name] [varchar](20) NOT NULL,
	[typeid] [int] NOT NULL,
	[birthday] [datetime] NULL,
	[papertype] [varchar](20) NOT NULL,
	[papernum] [varchar](30) NOT NULL,
	[tel] [varchar](30) NOT NULL,
	[email] [varchar](50) NULL,
	[createdate] [datetime] NULL,
	[oper] [varchar](30) NOT NULL,
	[remark] [varchar](200) NULL,
	[borrownum] [int] NULL,
	[num] [int] NULL,
	[password] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tb_reader] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'读者ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_reader', @level2type=N'COLUMN',@level2name=N'ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'读者姓名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_reader', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'读者类型ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_reader', @level2type=N'COLUMN',@level2name=N'typeid'
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
/****** Object:  Table [dbo].[tb_borrowandback]    Script Date: 03/07/2024 14:09:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_borrowandback](
	[ID] [varchar](30) NOT NULL,
	[readerid] [varchar](30) NOT NULL,
	[bookcode] [varchar](30) NOT NULL,
	[borrowtime] [datetime] NULL,
	[ygbacktime] [datetime] NULL,
	[sjbacktime] [datetime] NULL,
	[borrowoper] [varchar](30) NOT NULL,
	[backoper] [varchar](30) NULL,
	[isback] [bit] NULL,
 CONSTRAINT [PK_tb_borrowandback] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'流水号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_borrowandback', @level2type=N'COLUMN',@level2name=N'ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'读者ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_borrowandback', @level2type=N'COLUMN',@level2name=N'readerid'
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
/****** Object:  View [dbo].[View_1]    Script Date: 03/07/2024 14:09:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_1]
AS
SELECT dbo.tb_bookcase.*, dbo.tb_bookinfo.*
FROM   dbo.tb_booktype INNER JOIN
          dbo.tb_bookinfo ON dbo.tb_booktype.ID = dbo.tb_bookinfo.typeid INNER JOIN
          dbo.tb_borrowandback ON dbo.tb_bookinfo.bookcode = dbo.tb_borrowandback.bookcode INNER JOIN
          dbo.tb_reader ON dbo.tb_borrowandback.readerid = dbo.tb_reader.ID INNER JOIN
          dbo.tb_readertype ON dbo.tb_reader.typeid = dbo.tb_readertype.ID INNER JOIN
          dbo.tb_bookcase ON dbo.tb_borrowandback.ID = dbo.tb_bookcase.ID CROSS JOIN
          dbo.tb_admin CROSS JOIN
          dbo.tb_purview CROSS JOIN
          dbo.tb_library
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[57] 4[12] 2[13] 3) )"
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
         Top = -192
         Left = 0
      End
      Begin Tables = 
         Begin Table = "tb_admin"
            Begin Extent = 
               Top = 167
               Left = 1183
               Bottom = 312
               Right = 1359
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tb_bookinfo"
            Begin Extent = 
               Top = 15
               Left = 14
               Bottom = 416
               Right = 299
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tb_booktype"
            Begin Extent = 
               Top = 32
               Left = 430
               Bottom = 177
               Right = 606
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tb_library"
            Begin Extent = 
               Top = 20
               Left = 928
               Bottom = 190
               Right = 1116
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tb_purview"
            Begin Extent = 
               Top = 252
               Left = 941
               Bottom = 422
               Right = 1128
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tb_bookcase"
            Begin Extent = 
               Top = 26
               Left = 652
               Bottom = 146
               Right = 828
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tb_readertype"
            Begin Extent = 
               Top = 398
               Left = 425
               Bottom = 543
               Right = 601
            En' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'd
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tb_reader"
            Begin Extent = 
               Top = 432
               Left = 11
               Bottom = 851
               Right = 269
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tb_borrowandback"
            Begin Extent = 
               Top = 208
               Left = 428
               Bottom = 378
               Right = 614
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 19
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
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
/****** Object:  Default [DF_tb_borrowandback_isback]    Script Date: 03/07/2024 14:09:00 ******/
ALTER TABLE [dbo].[tb_borrowandback] ADD  CONSTRAINT [DF_tb_borrowandback_isback]  DEFAULT ((0)) FOR [isback]
GO
/****** Object:  Default [DF_tb_reader_borrownum]    Script Date: 03/07/2024 14:09:00 ******/
ALTER TABLE [dbo].[tb_reader] ADD  CONSTRAINT [DF_tb_reader_borrownum]  DEFAULT ((0)) FOR [borrownum]
GO
/****** Object:  Default [DF_tb_reader_num]    Script Date: 03/07/2024 14:09:00 ******/
ALTER TABLE [dbo].[tb_reader] ADD  CONSTRAINT [DF_tb_reader_num]  DEFAULT ((0)) FOR [num]
GO
/****** Object:  ForeignKey [FK_tb_bookinfo_tb_bookcase]    Script Date: 03/07/2024 14:09:00 ******/
ALTER TABLE [dbo].[tb_bookinfo]  WITH CHECK ADD  CONSTRAINT [FK_tb_bookinfo_tb_bookcase] FOREIGN KEY([bcase])
REFERENCES [dbo].[tb_bookcase] ([ID])
GO
ALTER TABLE [dbo].[tb_bookinfo] CHECK CONSTRAINT [FK_tb_bookinfo_tb_bookcase]
GO
/****** Object:  ForeignKey [FK_tb_bookinfo_tb_booktype]    Script Date: 03/07/2024 14:09:00 ******/
ALTER TABLE [dbo].[tb_bookinfo]  WITH CHECK ADD  CONSTRAINT [FK_tb_bookinfo_tb_booktype] FOREIGN KEY([typeid])
REFERENCES [dbo].[tb_booktype] ([ID])
GO
ALTER TABLE [dbo].[tb_bookinfo] CHECK CONSTRAINT [FK_tb_bookinfo_tb_booktype]
GO
/****** Object:  ForeignKey [FK_tb_booktype_tb_booktype]    Script Date: 03/07/2024 14:09:00 ******/
ALTER TABLE [dbo].[tb_booktype]  WITH CHECK ADD  CONSTRAINT [FK_tb_booktype_tb_booktype] FOREIGN KEY([ID])
REFERENCES [dbo].[tb_booktype] ([ID])
GO
ALTER TABLE [dbo].[tb_booktype] CHECK CONSTRAINT [FK_tb_booktype_tb_booktype]
GO
/****** Object:  ForeignKey [FK_tb_borrowandback_tb_bookinfo]    Script Date: 03/07/2024 14:09:00 ******/
ALTER TABLE [dbo].[tb_borrowandback]  WITH CHECK ADD  CONSTRAINT [FK_tb_borrowandback_tb_bookinfo] FOREIGN KEY([bookcode])
REFERENCES [dbo].[tb_bookinfo] ([bookcode])
GO
ALTER TABLE [dbo].[tb_borrowandback] CHECK CONSTRAINT [FK_tb_borrowandback_tb_bookinfo]
GO
/****** Object:  ForeignKey [FK_tb_borrowandback_tb_reader]    Script Date: 03/07/2024 14:09:00 ******/
ALTER TABLE [dbo].[tb_borrowandback]  WITH CHECK ADD  CONSTRAINT [FK_tb_borrowandback_tb_reader] FOREIGN KEY([readerid])
REFERENCES [dbo].[tb_reader] ([ID])
GO
ALTER TABLE [dbo].[tb_borrowandback] CHECK CONSTRAINT [FK_tb_borrowandback_tb_reader]
GO
/****** Object:  ForeignKey [FK_tb_reader_tb_readertype]    Script Date: 03/07/2024 14:09:00 ******/
ALTER TABLE [dbo].[tb_reader]  WITH CHECK ADD  CONSTRAINT [FK_tb_reader_tb_readertype] FOREIGN KEY([typeid])
REFERENCES [dbo].[tb_readertype] ([ID])
GO
ALTER TABLE [dbo].[tb_reader] CHECK CONSTRAINT [FK_tb_reader_tb_readertype]
GO
