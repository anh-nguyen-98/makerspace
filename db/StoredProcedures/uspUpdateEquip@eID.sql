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
CREATE PROCEDURE [dbo].[uspUpdateEquip@eID]
	-- Add the parameters for the stored procedure here
	@eID int,
	@eName NVARCHAR(256),
	@eDesc NVARCHAR(4000),
	@eFunction NVARCHAR(4000),
	@eInstruction NVARCHAR(4000),
	@eTraining int

AS
BEGIN

    -- Insert statements for procedure here
	UPDATE Equipment
	SET name = @eName, description = @eDesc, purpose = @eFunction,
	instruction = @eInstruction, training=@eTraining
	WHERE id = @eID
END
GO
