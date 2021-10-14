USE [MakerspaceDB]
GO
/****** Object:  StoredProcedure [dbo].[uspInsertEquipItemTest]    Script Date: 6/9/2021 6:47:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[uspInsertEquipItem]
	-- Add the parameters for the stored procedure here
	@eID INT,
	@locID INT,
	@itemStatus INT,
	@itemDeliveryDate DATE,
	@itemRemovalDate DATE
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	IF NOT EXISTS (SELECT * FROM EquipmentItem WHERE eID = @eID) 
	BEGIN
		INSERT INTO EquipmentItem (eID, itemNum, itemStatus, locID, itemDeliveryDate, itemRemovalDate) 
		VALUES (@eID, 1, @itemStatus, @locID, @itemDeliveryDate, @itemRemovalDate);
		
	END
	ELSE
	BEGIN
		INSERT INTO EquipmentItem (eID, itemNum, itemStatus, locID, itemDeliveryDate, itemRemovalDate) 
		VALUES (@eID, 
		(SELECT MAX(itemNum) FROM EquipmentItem WHERE eID = @eID) +1, 
		@itemStatus, @locID, @itemDeliveryDate, @itemRemovalDate);
	END
	
END
