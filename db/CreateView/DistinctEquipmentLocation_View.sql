USE [MakerspaceDB]
GO

/****** Object:  View [dbo].[DistinctEquipmentLocation_View]    Script Date: 3/15/2022 4:18:41 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[DistinctEquipmentLocation_View] as
select distinct EquipmentItem.equipment_id, EquipmentItem.location_id FROM EquipmentItem;
GO


