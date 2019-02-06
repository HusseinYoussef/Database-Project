USE [HBO]
GO
/****** Object:  StoredProcedure [dbo].[GetItemByName]    Script Date: 12/15/2017 23:17:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[GetItemByName] @name varchar(50) 
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	select Name,Type,Poster,ID from Item where Name like '%'+@name+'%';
END
