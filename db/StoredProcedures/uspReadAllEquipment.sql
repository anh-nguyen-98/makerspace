USE [MakerspaceDB]
GO
/****** Object:  StoredProcedure [dbo].[uspReadAllEquip]    Script Date: 6/9/2021 11:54:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[uspReadAllEquipment]
	-- Add the parameters for the stored procedure here


	
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
	
	--STRING_AGG(CONCAT (eCode, '-', itemNum), ','+ CHAR(10)) as ItemCode,
	--STRING_AGG (CONCAT(Room.roomCode, '.', RoomSpace.spaceCode, '.', LocObject.objectCode, '.', Location.objectNum), ',') as LocationID,
	--CONCAT(Room.roomName, ' - ', RoomSpace.spaceName, ' - ', LocObject.objectName, ' - ', Location.objectNum), ',') AS locationName,
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

	--GROUP BY Equipment.eID, Equipment.eCode, Equipment.eName,Equipment.eDesc, 
	--Equipment.eFunction, Equipment.eManual, Equipment.eSafety, Equipment.eTraining;

END
