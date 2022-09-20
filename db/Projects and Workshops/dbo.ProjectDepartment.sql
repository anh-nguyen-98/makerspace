USE [MakerspaceDB]
GO

/****** Object:  Table [dbo].[ProjectDepartment]    Script Date: 10/09/2022 17:01:18 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[ProjectDepartment](
	[projectDepartmentID] [int] IDENTITY(1,1) NOT NULL,
	[projectID] [int] NOT NULL,
	[name] [nvarchar](64) NULL,
	[role] [nvarchar](512) NULL,
PRIMARY KEY CLUSTERED 
(
	[projectDepartmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[ProjectDepartment]  WITH CHECK ADD  CONSTRAINT [FK_ProjectDepartment] FOREIGN KEY([projectID])
REFERENCES [dbo].[Projects] ([projectID])
GO

ALTER TABLE [dbo].[ProjectDepartment] CHECK CONSTRAINT [FK_ProjectDepartment]
GO

