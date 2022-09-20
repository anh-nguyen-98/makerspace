USE [MakerspaceDB]
GO

/****** Object:  StoredProcedure [dbo].[uspReadEngineeringProjectProgress]    Script Date: 10/09/2022 17:04:44 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[uspReadEngineeringProjectProgress]
	-- Add the parameters for the stored procedure here
	@projectID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM dbo.ProjectProgress WHERE projectID = @projectID
END
GO

