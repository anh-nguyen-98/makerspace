USE [MakerspaceDB]
GO

/****** Object:  Table [dbo].[Projects]    Script Date: 10/09/2022 17:02:15 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Projects](
	[projectID] [int] IDENTITY(10000000,1) NOT NULL,
	[name] [nvarchar](256) NOT NULL,
	[advisor] [nvarchar](64) NULL,
	[overview] [nvarchar](4000) NULL,
	[objective] [nvarchar](4000) NULL,
	[duration] [nvarchar](4000) NULL,
	[click_count] [int] NULL,
	[created_at] [date] NOT NULL,
	[ongoing] [int] NOT NULL,
	[begin_date] [date] NULL,
	[end_date] [date] NULL,
	[youtube_link] [nvarchar](512) NULL,
	[facebook_link] [nvarchar](512) NULL,
	[email_link] [nvarchar](512) NULL,
PRIMARY KEY CLUSTERED 
(
	[projectID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

