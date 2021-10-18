CREATE VIEW RoomSpace_View
AS
    SELECT Room.id AS room_id, Room.name AS room_name, RoomSpace.id AS room_space_id, RoomSpace.name AS room_space_name
    FROM Room JOIN RoomSpace ON Room.id=RoomSpace.room_id; 