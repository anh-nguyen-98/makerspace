USE [MakerspaceDB]
GO
/****** Object:  StoredProcedure [dbo].[uspReadEquipmentBySearchTerm]    Script Date: 3/15/2022 4:25:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[uspReadEquipmentBySearchTerm]
	-- Add the parameters for the stored procedure here
	@name NVARCHAR(256),
	@name_vie NVARCHAR(256),
	@code NVARCHAR(256),
	@purpose NVARCHAR(4000),
	@category_name NVARCHAR(256),
	@room_space_name NVARCHAR(256)

	
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
	Category.name as category_name,
	Equipment.image,
	Equipment.name_vie,
	Category.name as category_name,
	LocationName_View.room_name, LocationName_View.room_space_name, LocationName_View.object_code, LocationName_View.object_num
	
	FROM Equipment INNER JOIN Category
	ON Equipment.category_id = Category.id
	INNER JOIN LocationName_View
	ON Equipment.id = LocationName_View.equipment_id

	WHERE LOWER(Equipment.name) LIKE @name
	or LOWER(Equipment.name_vie) LIKE @name_vie 
	OR LOWER(Equipment.code) LIKE @code
	OR LOWER(Equipment.purpose) LIKE @purpose
	OR LOWER(Category.name) LIKE @category_name
	OR LOWER(LocationName_View.room_space_name) LIKE @room_space_name;


END
