CREATE VIEW RoomSpace_View
AS
    SELECT Room.roomID, Room.roomName, RoomSpace.spaceID, RoomSpace.spaceName
    FROM Room JOIN RoomSpace ON Room.roomID=RoomSpace.roomID; 