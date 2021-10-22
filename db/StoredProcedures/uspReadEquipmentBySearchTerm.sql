USE [MakerspaceDB]
GO
/****** Object:  StoredProcedure [dbo].[uspReadEquip@eName]    Script Date: 6/5/2021 2:25:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[uspReadEquipmentBySearchTerm]
	-- Add the parameters for the stored procedure here
	@name NVARCHAR(256),
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
	RoomSpace.name as room_space_name

	FROM Equipment INNER JOIN Category
	ON Equipment.category_id = Category.id
	INNER JOIN RoomSpace
	ON Equipment.room_space_id = RoomSpace.id

	WHERE LOWER(Equipment.name) LIKE @name 
	OR LOWER(Equipment.code) LIKE @code
	OR LOWER(Equipment.purpose) LIKE @purpose
	OR LOWER(Category.name) LIKE @category_name
	OR LOWER(RoomSpace.name) LIKE @room_space_name;


END
