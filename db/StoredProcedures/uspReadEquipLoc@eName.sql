USE [MakerspaceDB]
GO
/****** Object:  StoredProcedure [dbo].[uspReadEquipLoc@eName]    Script Date: 5/3/2021 11:11:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[uspReadEquipInfo@eLocation]
	-- Add the parameters for the stored procedure here
	@eLocation NVARCHAR(256)

	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT 
	CONCAT (eCode, '-', itemNum) AS itemCode,
	eName,
	CONCAT(Room.roomCode, '.', RoomSpace.spaceCode, '.', LocObject.objectCode, '.', Location.objectNum) AS locationCode,
	CONCAT(Room.roomName, ' - ', RoomSpace.spaceName, ' - ', LocObject.objectName, ' - ', Location.objectNum) AS locationName
	

	FROM Equipment INNER JOIN EquipmentItem 
	ON EquipmentItem.eID = Equipment.eID
	INNER JOIN Location 
	ON EquipmentItem.locID = Location.locID
	INNER JOIN RoomSpace
	ON Location.spaceID = RoomSpace.spaceID
	INNER JOIN LocObject
	ON Location.objectID = LocObject.objectID
	INNER JOIN Room
	ON RoomSpace.roomID = Room.roomID

	
	WHERE Room.roomName LIKE @eLocation 
	OR RoomSpace.spaceName LIKE @eLocation 
	OR LocObject.objectName LIKE @eLocation 
	OR Location.objectNum LIKE @eLocation;

END
