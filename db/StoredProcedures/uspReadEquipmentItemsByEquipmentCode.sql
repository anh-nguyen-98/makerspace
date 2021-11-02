USE [MakerspaceDB]
GO
/****** Object:  StoredProcedure [dbo].[uspReadEquipItem@eID]    Script Date: 10/27/2021 7:47:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[uspReadEquipmentItemsByEquipmentCode] 
	-- Add the parameters for the stored procedure here
	@equipment_code varchar(256)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT *
	FROM EquipmentItem_View
	WHERE EquipmentItem_View.code = @equipment_code;
END
