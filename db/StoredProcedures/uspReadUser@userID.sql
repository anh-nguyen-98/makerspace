USE [MakerspaceDB]
GO
/****** Object:  StoredProcedure [dbo].[uspReadUser@userID]    Script Date: 6/10/2021 7:21:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[uspReadUser@userID] 
	-- Add the parameters for the stored procedure here
	@userID INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM MksUser 
	INNER JOIN UserRoles ON MksUser.userID = UserRoles.userID
	INNER JOIN Role ON UserRoles.roleID = Role.roleID
	WHERE MksUser.userID = @userID;
END
