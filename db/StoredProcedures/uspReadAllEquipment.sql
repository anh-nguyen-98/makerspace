USE [MakerspaceDB]
GO
/****** Object:  StoredProcedure [dbo].[uspReadAllEquipment]    Script Date: 4/19/2022 12:39:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[uspReadAllEquipment]
	-- Add the parameters for the stored procedure here


	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT 
	Equipment.id,
	Equipment.code,
	Equipment.name,
	Equipment.description,
	Equipment.instruction,
	Equipment.training,
	Equipment.category_id,
	Equipment.image,
	Equipment.name_vie,
	Category.name as category_name,
	LocationName_View.room_name, LocationName_View.room_space_name, LocationName_View.object_code, LocationName_View.object_name, LocationName_View.object_num
	FROM (SELECT equipment_id, MIN(location_id) AS min_location_id, MIN(num) as min_item_num FROM EquipmentItem GROUP BY equipment_id) AS EquipmentItemTruncated
	INNER JOIN Equipment
	ON EquipmentItemTruncated.equipment_id = Equipment.id
	INNER JOIN Category
	ON Equipment.category_id = Category.id
	INNER JOIN LocationName_View
	ON EquipmentItemTruncated.equipment_id = LocationName_View.equipment_id 
	ORDER BY Equipment.popular DESC;


	--GROUP BY Equipment.eID, Equipment.eCode, Equipment.eName,Equipment.eDesc, 
	--Equipment.eFunction, Equipment.eManual, Equipment.eSafety, Equipment.eTraining;

END
