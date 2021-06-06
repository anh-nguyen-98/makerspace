-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[uspReadEquipItem@eID] 
	-- Add the parameters for the stored procedure here
	@eID INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT EquipmentItem.itemID, Equipment.eID, EquipmentItem.itemStatus, EquipmentItem.locID,
	CONCAT(Equipment.eCode, '-', EquipmentItem.itemNum) AS itemCode
	
	FROM EquipmentItem
	INNER JOIN Equipment ON Equipment.eID = EquipmentItem.eID
	
	WHERE Equipment.eID = @eID;
END
GO
