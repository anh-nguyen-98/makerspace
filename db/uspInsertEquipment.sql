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
ALTER PROCEDURE [dbo].[uspInsertEquipment]
	-- Add the parameters for the stored procedure here
	@code NCHAR(15),
	@name NVARCHAR,
    @description NVARCHAR(4000),
	@purpose NVARCHAR(4000) ,
	@instruction NVARCHAR(4000),
	@training INT
AS
BEGIN

    -- Insert statements for procedure here
	BEGIN
		INSERT INTO Equipment (code, name, description, purpose, instruction, training, category_id, room_space_id) 
		VALUES (@code, @name, @description, @purpose, @instruction, @training, 1, 1);
		
	END
END
	