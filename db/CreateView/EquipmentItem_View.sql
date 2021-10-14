CREATE VIEW EquipmentItem_View
AS
    SELECT Equipment.eID,Equipment.eCode, Equipment.eName, EquipmentItem.itemNum, Equipment.eFunction FROM Equipment
    JOIN EquipmentItem ON EquipmentItem.eID=Equipment.eID;