USE [MakerspaceDB]
GO
/****** Object:  StoredProcedure [dbo].[uspReadMostPopularEquipment]    Script Date: 3/17/2022 12:50:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[uspReadMostPopularEquipment]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT TOP 20
	Equipment.id,
	Equipment.code,
	Equipment.name,
	Equipment.description,
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
	
	ORDER BY Equipment.popular DESC;
	
END
