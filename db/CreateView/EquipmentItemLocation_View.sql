USE [MakerspaceDB]
GO

/****** Object:  View [dbo].[EquipmentItemLocation_View]    Script Date: 4/21/2022 12:15:32 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER VIEW [dbo].[EquipmentItemLocation_View] as
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
	Equipment.popular,
	EquipmentItem.num,
	EquipmentItem.status,
	EquipmentItem.delivered_at,
	EquipmentItem.removed_at,
	Category.name as category_name,
	Category.cat_src as catergory_src,
	LocationName_View.room_name, LocationName_View.room_space_name, LocationName_View.object_code, LocationName_View.object_name, LocationName_View.object_num
	FROM Equipment
	INNER JOIN EquipmentItem
	ON EquipmentItem.equipment_id = Equipment.id
	INNER JOIN Category
	ON Equipment.category_id = Category.id
	INNER JOIN LocationName_View
	ON EquipmentItem.location_id = LocationName_View.location_id;
GO


