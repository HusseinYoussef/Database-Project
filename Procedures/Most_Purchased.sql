USE [HBO]
GO
/****** Object:  StoredProcedure [dbo].[most_purchased]    Script Date: 12/18/2017 20:47:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[most_purchased]
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    select #Purchase,ID,Name,Poster,Type
	from Item
	order by #Purchase DESC
END
