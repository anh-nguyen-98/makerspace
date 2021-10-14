USE [MakerspaceDB]
GO
/****** Object:  StoredProcedure [dbo].[uspReadEquipItem@eID]    Script Date: 6/7/2021 5:23:53 PM ******/
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
	EquipmentItem.itemDeliveryDate, EquipmentItem.itemRemovalDate,
	CONCAT(Equipment.eCode, '-', EquipmentItem.itemNum) AS itemCode
	
	FROM EquipmentItem
	INNER JOIN Equipment ON Equipment.eID = EquipmentItem.eID
	
	WHERE Equipment.eID = @eID;
END
