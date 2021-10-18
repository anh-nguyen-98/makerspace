CREATE VIEW Room_View
AS
    SELECT Room.id, Room.code, Room.name AS room_name, RoomSpace.name AS room_space_name FROM Room
    JOIN RoomSpace ON Room.id=RoomSpace.room_id;