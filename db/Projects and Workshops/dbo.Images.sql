USE [MakerspaceDB]
GO

/****** Object:  Table [dbo].[Images]    Script Date: 10/09/2022 17:00:59 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Images](
	[imageID] [int] IDENTITY(1,1) NOT NULL,
	[pageID] [int] NOT NULL,
	[position] [int] NOT NULL,
	[section] [int] NOT NULL,
	[image_path] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[imageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

