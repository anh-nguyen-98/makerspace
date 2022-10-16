USE [MakerspaceDB]
GO

/****** Object:  View [dbo].[LocationName_View]    Script Date: 10/16/2022 12:26:53 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



/****** Script for SelectTopNRows command from SSMS  ******/
ALTER     VIEW [dbo].[LocationName_View]
AS
    SELECT
    Location.id AS location_id, Location.room_space_id, Room.name AS room_name, RoomSpace.name as room_space_name, Object.id as object_id, Object.code as object_code, Object.name as object_name, Location.object_num
    FROM Location
    INNER JOIN RoomSpace on Location.room_space_id =RoomSpace.id
    INNER JOIN Object ON Location.object_id=Object.id
    INNER JOIN Room ON RoomSpace.room_id=Room.id;
GO


