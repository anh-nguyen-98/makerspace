USE [MakerspaceDB]
GO
/****** Object:  StoredProcedure [dbo].[uspInsertEquipItem]    Script Date: 12/15/2021 11:08:42 AM ******/
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
	@equipment_id INT,
	@location_id INT,
	@status INT,
	@delivered_at DATE,
	@removed_at DATE
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	--SET NOCOUNT ON;

    -- Insert statements for procedure here
	IF NOT EXISTS (SELECT * FROM EquipmentItem WHERE equipment_id = @equipment_id) 
	BEGIN
		INSERT INTO Equipment(id) VALUES (@equipment_id);
		INSERT INTO EquipmentItem (equipment_id, num, status, location_id, delivered_at, removed_at) 
		VALUES (@equipment_id, 1, @status, @location_id, @delivered_at, @removed_at);
		
	END
	ELSE
	BEGIN
		INSERT INTO EquipmentItem (equipment_id, num, status, location_id, delivered_at, removed_at) 
		VALUES (@equipment_id, 
		(SELECT MAX(num) FROM EquipmentItem WHERE equipment_id = @equipment_id) +1, 
		@status, @location_id, @delivered_at, @removed_at);
	END
	
END
