USE [MakerspaceDB]
GO
/****** Object:  StoredProcedure [dbo].[uspInsertEquipItemTest]    Script Date: 6/9/2021 6:47:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[uspInsertEquipment]
	-- Add the parameters for the stored procedure here
	@id INT,
	@code INT,
	@name NVARCHAR,
    @description NVARCHAR(4000),
	@purpose NVARCHAR(4000) ,
	@instruction NVARCHAR(4000),
	@training INT,
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	IF NOT EXISTS (SELECT * FROM Equipment WHERE id = @id) 
	BEGIN
		INSERT INTO Equipment (id, code, name, description, purpose, instruction, training) 
		VALUES (@id, @code, @name, @description, @purpose, @instruction, @training);
		
	END
END
	