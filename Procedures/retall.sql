USE [HBO]
GO
/****** Object:  StoredProcedure [dbo].[retall]    Script Date: 12/15/2017 22:03:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[retall] @t int
AS
BEGIN
	
	SET NOCOUNT ON;

	select Name,Type,Poster,ID from Item where Type = @t;
END
