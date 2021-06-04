USE [MakerspaceDB]
GO
/****** Object:  StoredProcedure [dbo].[uspReadEquip@locID]    Script Date: 6/4/2021 10:10:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[uspReadEquip@locID]
	-- Add the parameters for the stored procedure here
	@locID INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT 
	Equipment.eID,
	Equipment.eCode,
	Equipment.eName,
	STRING_AGG(CONCAT (eCode, '-', itemNum), ',') as ItemCode,
	STRING_AGG (CONCAT(Room.roomCode, '.', RoomSpace.spaceCode, '.', LocObject.objectCode, '.', Location.objectNum), ','+CHAR(10)) as LocationID,
	Equipment.eTraining

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

	WHERE EquipmentItem.locID = @locID
	GROUP BY Equipment.eID, Equipment.eCode, Equipment.eName, Equipment.eTraining, EquipmentItem.locID;
END
