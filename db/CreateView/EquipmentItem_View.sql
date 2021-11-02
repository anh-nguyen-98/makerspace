ALTER VIEW EquipmentItem_View
AS
	SELECT Equipment.id as equipment_id, Equipment.code, Equipment.name, Equipment.description, Equipment.purpose, Equipment.instruction, Equipment.training,
	EquipmentItem.id as item_id, EquipmentItem.status, EquipmentItem.location_id, EquipmentItem.num,
	EquipmentItem.delivered_at, EquipmentItem.removed_at,
	CONCAT(Equipment.code, '-', EquipmentItem.num) AS item_code
	FROM Equipment
    JOIN EquipmentItem ON EquipmentItem.equipment_id=Equipment.id;