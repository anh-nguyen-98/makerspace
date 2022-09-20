USE [MakerspaceDB]
GO

/****** Object:  StoredProcedure [dbo].[uspReadAllEngineeringProject]    Script Date: 10/09/2022 17:03:28 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[uspReadAllEngineeringProject]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT projectID, name, begin_date, end_date, ongoing, overview, image_path
	FROM 
		Projects p JOIN
			(SELECT Images.image_path, Images.pageID
			FROM Images
			WHERE position=1) i
		ON p.projectID = i.pageID
	ORDER BY begin_date DESC
END
GO

