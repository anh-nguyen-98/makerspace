CREATE VIEW Room_View
AS
    SELECT Room.roomID, Room.roomCode, Room.roomName, RoomSpace.spaceName FROM Room
    JOIN RoomSpace ON Room.roomID=RoomSpace.roomID;