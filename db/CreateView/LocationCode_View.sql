CREATE VIEW LocationCode_View
AS
    SELECT
    EquipmentItem.equipment_id,Equipment.code AS equipment_code,
    Room.code as room_code, RoomSpace.code AS room_space_code, Object.code AS object_code, Location.object_num
    FROM Equipment
    INNER JOIN EquipmentItem ON EquipmentItem.equipment_id=Equipment.id
    INNER JOIN Location ON EquipmentItem.location_id = Location.id
    INNER JOIN RoomSpace on Location.room_space_id=RoomSpace.id
    INNER JOIN Object ON Location.object_id=Object.id
    INNER JOIN Room ON RoomSpace.room_id=Room.id;