/*
Returns equipment items that are discarded 
at a certain inspection time (identified by inspection Id)
*/

------USING JOIN 3 TABLES------
SELECT EquipmentItem.equipCode, EquipmentItem.itemId, itemStatus
FROM Inspection INNER JOIN InspectionLine
ON Inspection.inspId = InspectionLine.inspId
RIGHT JOIN EquipmentItem 
ON InspectionLine.equipCode = EquipmentItem.equipCode
where EquipmentItem.itemStatus = 1 
AND InspectionLine.equipCode IS NULL;


------USING EXCEPT CLAUSE------
SELECT  EquipmentItem.equipCode,EquipmentItem.itemId
FROM EquipmentItem 
WHERE itemStatus = 1
EXCEPT --rules ~ UNION
SELECT InspectionLine.equipCode,InspectionLine.itemId 
FROM Inspection INNER JOIN InspectionLine
ON Inspection.inspId = InspectionLine.inspId
where Inspection.inspId = 1 ;

------USING NOT IN FOR WHERE ROW CONDITION-------
SELECT  EquipmentItem.equipCode,EquipmentItem.itemId, itemStatus
FROM EquipmentItem 
WHERE equipCode NOT IN (
	SELECT equipCode
	FROM Inspection INNER JOIN InspectionLine
	ON Inspection.inspId = InspectionLine.inspId
	where Inspection.inspId = 1 
	)
AND itemStatus = 1;