SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE RetSongs 


AS
BEGIN
	
	Select Name,Type,Poster
	from Item
	where Item.Type = 4

END
GO
