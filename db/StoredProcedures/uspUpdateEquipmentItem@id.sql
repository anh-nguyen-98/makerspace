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
CREATE PROCEDURE [dbo].[uspUpdateEquipItem@id]
	-- Add the parameters for the stored procedure here
	@id int,
	@location_id int,
	@status int,
	@delivered_at DATE,
	@removed_at DATE

AS
BEGIN

    -- Insert statements for procedure here
	UPDATE EquipmentItem
	SET location_id = @location_id, status = @status, delivered_at = @delivered_at,
	removed_at = @removed_at
	WHERE id = @id

END