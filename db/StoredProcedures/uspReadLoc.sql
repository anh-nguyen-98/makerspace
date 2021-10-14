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
CREATE PROCEDURE [dbo].[uspReadLoc]
	-- Add the parameters for the stored procedure here
	@roomCode NCHAR(5),
	@spaceCode NCHAR(2),
	@objectCode NCHAR(2),
	@objectNumber NCHAR(3)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM Location
	INNER JOIN RoomSpace ON Location.spaceID = RoomSpace.spaceID
	INNER JOIN LocObject ON Location.objectID = LocObject.objectID
	INNER JOIN Room ON RoomSpace.roomID = Room.roomID
	
	WHERE Room.roomCode= @roomCode 
	AND RoomSpace.spaceCode = @spaceCode
	AND LocObject.objectCode = @objectCode
	AND Location.objectNum = @objectNumber;
END
GO
