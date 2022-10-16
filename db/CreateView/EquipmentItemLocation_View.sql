USE [MakerspaceDB]
GO

/****** Object:  View [dbo].[EquipmentItemLocation_View]    Script Date: 10/15/2022 2:31:51 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER VIEW [dbo].[EquipmentItemLocation_View]
AS
SELECT        dbo.Equipment.id, dbo.Equipment.code, dbo.Equipment.name, dbo.Equipment.description, dbo.Equipment.instruction, dbo.Equipment.training, dbo.Equipment.category_id, dbo.Equipment.image, dbo.Equipment.name_vie, 
                         dbo.Equipment.popular, dbo.Equipment.brand, dbo.EquipmentItem.num, dbo.EquipmentItem.status, dbo.EquipmentItem.delivered_at, dbo.EquipmentItem.removed_at, dbo.Category.name AS category_name, 
                         dbo.Category.cat_src AS category_src, dbo.LocationName_View.room_space_id, dbo.LocationName_View.room_name, dbo.LocationName_View.room_space_name, dbo.LocationName_View.object_id, dbo.LocationName_View.object_code, dbo.LocationName_View.object_name, 
                         dbo.LocationName_View.object_num, dbo.Equipment.deleted
FROM            dbo.Equipment INNER JOIN
                         dbo.EquipmentItem ON dbo.EquipmentItem.equipment_id = dbo.Equipment.id INNER JOIN
                         dbo.Category ON dbo.Equipment.category_id = dbo.Category.id INNER JOIN
                         dbo.LocationName_View ON dbo.EquipmentItem.location_id = dbo.LocationName_View.location_id
WHERE        (dbo.Equipment.deleted = 0) OR
                         (dbo.Equipment.deleted IS NULL)
GO
