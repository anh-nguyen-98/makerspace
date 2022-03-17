USE [MakerspaceDB]
GO

/****** Object:  View [dbo].[LocationName_View]    Script Date: 3/15/2022 4:21:07 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



/****** Script for SelectTopNRows command from SSMS  ******/
ALTER     VIEW [dbo].[LocationName_View]
AS
    SELECT
    DistinctEquipmentLocation_View.equipment_id, DistinctEquipmentLocation_View.location_id, Equipment.code, Equipment.name as equipment_name,
    Room.name AS room_name, RoomSpace.name as room_space_name, Object.code as object_code, Object.name as object_name, Location.object_num
    FROM DistinctEquipmentLocation_View
	INNER JOIN Equipment ON DistinctEquipmentLocation_View.equipment_id = Equipment.id
    INNER JOIN Location ON DistinctEquipmentLocation_View.location_id = Location.id
    INNER JOIN RoomSpace on Location.room_space_id =RoomSpace.id
    INNER JOIN Object ON Location.object_id=Object.id
    INNER JOIN Room ON RoomSpace.room_id=Room.id;
GO


