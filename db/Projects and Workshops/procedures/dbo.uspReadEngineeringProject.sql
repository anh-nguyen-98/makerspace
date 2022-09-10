USE [MakerspaceDB]
GO

/****** Object:  StoredProcedure [dbo].[uspReadEngineeringProject]    Script Date: 10/09/2022 17:03:40 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[uspReadEngineeringProject]
	-- Add the parameters for the stored procedure here
	@projectID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM dbo.Projects WHERE dbo.Projects.projectID=@projectID;
END
GO

