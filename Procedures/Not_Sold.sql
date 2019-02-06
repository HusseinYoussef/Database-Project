USE [HBO]
GO
/****** Object:  StoredProcedure [dbo].[Not_Sold]    Script Date: 12/20/2017 15:26:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[Not_Sold]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	select Name,ID,Poster,#Purchase,Type from Item as I where I.ID in (
	select ID from Item 
	where ID not in (select distinct ID_Item from Purchase))
    
END
