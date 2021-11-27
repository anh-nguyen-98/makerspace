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
CREATE PROCEDURE [dbo].[uspReadEquipment@id]
	-- Add the parameters for the stored procedure here
    @id INT

	
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

	FROM Equipment WHERE Equipment.id = @id;

END
