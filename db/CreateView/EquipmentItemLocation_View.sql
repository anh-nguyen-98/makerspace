USE [MakerspaceDB]
GO

/****** Object:  View [dbo].[DistinctEquipmentLocation_View]    Script Date: 4/20/2022 12:00:17 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[EquipmentItemLocation_View] as
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
	Category.name as category_name,
	LocationName_View.room_name, LocationName_View.room_space_name, LocationName_View.object_code, LocationName_View.object_name, LocationName_View.object_num
	FROM Equipment
	INNER JOIN EquipmentItem
	ON EquipmentItem.equipment_id = Equipment.id
	INNER JOIN Category
	ON Equipment.category_id = Category.id
	INNER JOIN LocationName_View
	ON EquipmentItem.equipment_id = LocationName_View.equipment_id;
GO


