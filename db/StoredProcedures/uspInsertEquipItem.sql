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
CREATE PROCEDURE [dbo].[uspInsertEquipItem]
	-- Add the parameters for the stored procedure here
	@equipment_id INT,
	@location_id INT,
	@status INT,
	@delivered_at DATE,
	@removed_at DATE
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	IF NOT EXISTS (SELECT * FROM EquipmentItem WHERE eID = @eID) 
	BEGIN
		INSERT INTO EquipmentItem (equipment_id, num, itemStatus, location_id, delivered_at, removed_at) 
		VALUES (@equipment_id, 1, @status, @location_id, @delivered_at, @removed_at);
		
	END
	ELSE
	BEGIN
		INSERT INTO EquipmentItem (equipment_id, num, itemStatus, location_id, delivered_at, removed_at) 
		VALUES (@equipment_id, 
		(SELECT MAX(itemNum) FROM EquipmentItem WHERE equipment_id = @equipment_id) +1, 
		@status, @location_id, @delivered_at, @removed_at);
	END
	
END
