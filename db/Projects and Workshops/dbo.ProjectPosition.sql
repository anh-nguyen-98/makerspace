USE [MakerspaceDB]
GO

/****** Object:  Table [dbo].[ProjectPosition]    Script Date: 10/09/2022 17:01:33 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[ProjectPosition](
	[projectPositionID] [int] IDENTITY(1,1) NOT NULL,
	[projectID] [int] NULL,
	[name] [nvarchar](64) NULL,
	[description] [nvarchar](512) NULL,
PRIMARY KEY CLUSTERED 
(
	[projectPositionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[ProjectPosition]  WITH CHECK ADD FOREIGN KEY([projectID])
REFERENCES [dbo].[Projects] ([projectID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO

