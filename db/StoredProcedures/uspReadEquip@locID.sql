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
CREATE PROCEDURE [dbo].[uspReadEquip@locID]
	-- Add the parameters for the stored procedure here
	@locID INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT 
	Equipment.eCode,
	Equipment.eName,
	STRING_AGG(CONCAT (eCode, '-', itemNum), ',') as ItemCode,
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
	GROUP BY Equipment.eCode, Equipment.eName, Equipment.eTraining, EquipmentItem.locID;
END
GO
