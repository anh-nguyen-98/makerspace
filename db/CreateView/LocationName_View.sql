/****** Script for SelectTopNRows command from SSMS  ******/
CREATE VIEW LocationName_View
AS
    SELECT
    EquipmentItem.equipment_id,Equipment.code, Equipment.name as equipment_name,
    Room.name AS room_name, RoomSpace.name as room_space_name, Object.code as object_code, Object.name as object_name, Location.object_num
    FROM Equipment
    INNER JOIN EquipmentItem ON EquipmentItem.equipment_id=Equipment.id
    INNER JOIN Location ON EquipmentItem.location_id = Location.id
    INNER JOIN RoomSpace on Location.room_space_id =RoomSpace.id
    INNER JOIN Object ON Location.object_id=Object.id
    INNER JOIN Room ON RoomSpace.room_id=Room.id;