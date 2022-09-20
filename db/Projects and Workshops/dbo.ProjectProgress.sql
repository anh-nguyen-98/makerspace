USE [MakerspaceDB]
GO

/****** Object:  Table [dbo].[ProjectProgress]    Script Date: 10/09/2022 17:01:52 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[ProjectProgress](
	[projectProgressID] [int] IDENTITY(1,1) NOT NULL,
	[projectID] [int] NOT NULL,
	[phase] [nvarchar](4000) NULL,
	[description] [nvarchar](4000) NULL,
PRIMARY KEY CLUSTERED 
(
	[projectProgressID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[ProjectProgress]  WITH CHECK ADD  CONSTRAINT [FK_ProjectProgress] FOREIGN KEY([projectID])
REFERENCES [dbo].[Projects] ([projectID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[ProjectProgress] CHECK CONSTRAINT [FK_ProjectProgress]
GO

