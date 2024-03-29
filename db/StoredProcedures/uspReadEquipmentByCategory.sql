USE [MakerspaceDB]
GO
/****** Object:  StoredProcedure [dbo].[uspReadEquipmentByCategory]    Script Date: 4/20/2022 7:46:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[uspReadEquipmentByCategory] 
	-- Add the parameters for the stored procedure here
	@category_name NVARCHAR(256)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
    -- Insert statements for procedure here
	SELECT *
	FROM (SELECT equipment_id, MIN(location_id) AS min_location_id, MIN(num) as min_item_num FROM EquipmentItem GROUP BY equipment_id) AS EquipmentItemTruncated
	INNER JOIN EquipmentItemLocation_View
	ON EquipmentItemTruncated.equipment_id = EquipmentItemLocation_View.id
	AND EquipmentItemTruncated.min_item_num = EquipmentItemLocation_View.num
	WHERE EquipmentItemLocation_View.category_name = @category_name ORDER BY EquipmentItemLocation_View.popular DESC;
END
