USE [MakerspaceDB]
GO
/****** Object:  StoredProcedure [dbo].[uspReadEquipmentByCategory]    Script Date: 3/15/2022 4:26:57 PM ******/
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
	SELECT
	Equipment.id,
	Equipment.code,
	Equipment.name,
	Equipment.description,
	Equipment.purpose,
	Equipment.instruction,
	Equipment.training,
	Equipment.category_id,
	Equipment.image,
	Equipment.name_vie,
	Category.name as category_name,
	LocationName_View.room_name, LocationName_View.room_space_name, LocationName_View.object_code, LocationName_View.object_num
	FROM Equipment INNER JOIN Category
	ON Equipment.category_id = Category.id
	INNER JOIN LocationName_View
	ON Equipment.id = LocationName_View.equipment_id

	WHERE Category.name = @category_name;
END
