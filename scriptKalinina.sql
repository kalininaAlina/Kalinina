USE [NailsStudio]
GO
/****** Object:  Table [dbo].[clients]    Script Date: 14.06.2021 17:46:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[clients](
	[id] [int] NOT NULL,
	[name] [varchar](50) NULL,
	[number] [int] NULL,
 CONSTRAINT [PK_clients] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[masters]    Script Date: 14.06.2021 17:46:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[masters](
	[id] [int] NOT NULL,
	[name] [varchar](50) NULL,
	[number] [int] NULL,
 CONSTRAINT [PK_masters] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[materials]    Script Date: 14.06.2021 17:46:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[materials](
	[id] [int] NOT NULL,
	[name] [varchar](50) NULL,
	[price] [money] NULL,
 CONSTRAINT [PK_materials] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[services and price]    Script Date: 14.06.2021 17:46:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[services and price](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NULL,
	[price] [money] NULL,
	[material] [int] NULL,
 CONSTRAINT [PK_services and price] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[session]    Script Date: 14.06.2021 17:46:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[session](
	[id] [int] NOT NULL,
	[name_client] [int] NULL,
	[name_master] [int] NULL,
	[service] [int] NULL,
	[date] [date] NULL,
	[time] [time](7) NULL,
 CONSTRAINT [PK_session] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[services and price]  WITH CHECK ADD  CONSTRAINT [FK_services and price_materials] FOREIGN KEY([material])
REFERENCES [dbo].[materials] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[services and price] CHECK CONSTRAINT [FK_services and price_materials]
GO
ALTER TABLE [dbo].[session]  WITH CHECK ADD  CONSTRAINT [FK_session_clients] FOREIGN KEY([name_client])
REFERENCES [dbo].[clients] ([id])
GO
ALTER TABLE [dbo].[session] CHECK CONSTRAINT [FK_session_clients]
GO
ALTER TABLE [dbo].[session]  WITH CHECK ADD  CONSTRAINT [FK_session_masters] FOREIGN KEY([name_master])
REFERENCES [dbo].[masters] ([id])
GO
ALTER TABLE [dbo].[session] CHECK CONSTRAINT [FK_session_masters]
GO
ALTER TABLE [dbo].[session]  WITH CHECK ADD  CONSTRAINT [FK_session_services and price] FOREIGN KEY([service])
REFERENCES [dbo].[services and price] ([id])
GO
ALTER TABLE [dbo].[session] CHECK CONSTRAINT [FK_session_services and price]
GO
