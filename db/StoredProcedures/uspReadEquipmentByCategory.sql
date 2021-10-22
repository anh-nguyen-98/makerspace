-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[uspReadEquipmentByCategory] 
	-- Add the parameters for the stored procedure here
	@category_id int
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
	Category.name as category_name,
	RoomSpace.name as room_space_name
	FROM Equipment INNER JOIN Category
	ON Equipment.category_id = Category.id
	INNER JOIN RoomSpace
	ON Equipment.room_space_id = RoomSpace.id

	WHERE Equipment.category_id = @category_id;
END
GO
