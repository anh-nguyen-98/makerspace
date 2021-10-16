CREATE VIEW EquipmentItem_View
AS
    SELECT Equipment.id,Equipment.code, Equipment.name, EquipmentItem.num, Equipment.purpose FROM Equipment
    JOIN EquipmentItem ON EquipmentItem.equipment_id=Equipment.id;