USE [MakerspaceDB]
GO

/****** Object:  View [dbo].[LocationName_View]    Script Date: 4/19/2022 2:22:00 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




/****** Script for SelectTopNRows command from SSMS  ******/
ALTER     VIEW [dbo].[LocationName_View]
AS
    SELECT
    EquipmentItem.equipment_id, EquipmentItem.location_id,
    Room.name AS room_name, RoomSpace.name as room_space_name, Object.code as object_code, Object.name as object_name, Location.object_num
    FROM EquipmentItem
    INNER JOIN Location ON EquipmentItem.location_id = Location.id
    INNER JOIN RoomSpace on Location.room_space_id =RoomSpace.id
    INNER JOIN Object ON Location.object_id=Object.id
    INNER JOIN Room ON RoomSpace.room_id=Room.id;
GO


