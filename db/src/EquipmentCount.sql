/*COUNT EQUIPMENT QUANTITY*/

/*Count quantity of available in use items.*/
SELECT Equipment.equipCode, equipName, 
	COUNT(Equipment.equipCode) AS Quantity
FROM EquipmentItem Inner Join Equipment		
ON EquipmentItem.equipCode = Equipment.equipCode
WHERE itemStatus = 1 -- count only available-in-use items
GROUP BY Equipment.equipCode, equipName;


/*Count quantity of out-of-order items.*/
SELECT Equipment.equipCode, equipName, 
	COUNT(Equipment.equipCode) AS Quantity
FROM EquipmentItem Inner Join Equipment		
ON EquipmentItem.equipCode = Equipment.equipCode
WHERE itemStatus = 0 
GROUP BY Equipment.equipCode, equipName;

/*Count quantity of in-repair items.*/
SELECT Equipment.equipCode, equipName, 
	COUNT(Equipment.equipCode) AS Quantity
FROM EquipmentItem Inner Join Equipment		
ON EquipmentItem.equipCode = Equipment.equipCode
WHERE itemStatus = -1
GROUP BY Equipment.equipCode, equipName;

