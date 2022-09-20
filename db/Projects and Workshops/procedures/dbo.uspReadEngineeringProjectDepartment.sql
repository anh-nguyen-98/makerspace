USE [MakerspaceDB]
GO

/****** Object:  StoredProcedure [dbo].[uspReadEngineeringProjectDepartment]    Script Date: 10/09/2022 17:03:59 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[uspReadEngineeringProjectDepartment]
	-- Add the parameters for the stored procedure here
	@projectID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM ProjectDepartment WHERE projectID = @projectID
END
GO

