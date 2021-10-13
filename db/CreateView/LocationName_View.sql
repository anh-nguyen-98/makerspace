CREATE VIEW LocationName_View
AS
    SELECT
    EquipmentItem.eID,Equipment.eCode, Equipment.eName,
    Room.roomName, RoomSpace.spaceName, LocObject.objectName, Location.objectNum
    FROM Equipment
    INNER JOIN EquipmentItem ON EquipmentItem.eID=Equipment.eID
    INNER JOIN Location ON EquipmentItem.locID = Location.locID
    INNER JOIN RoomSpace on Location.spaceID=RoomSpace.spaceID
    INNER JOIN LocObject ON Location.objectID=LocObject.objectID
    INNER JOIN Room ON RoomSpace.roomID=Room.roomID;