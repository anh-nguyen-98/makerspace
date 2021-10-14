SELECT Room.roomID, Room.roomName, RoomSpace.spaceID, RoomSpace.spaceName FROM Room
INNER JOIN RoomSpace ON Room.roomID=RoomSpace.roomID;
