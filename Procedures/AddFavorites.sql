USE [HBO]
GO
/****** Object:  StoredProcedure [dbo].[AddFavorites]    Script Date: 12/16/2017 22:42:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[AddFavorites]  
       @username varchar(50),
       @itemname varchar(50)
        	  
AS
BEGIN
        
	    insert into Favorites (ID_Item,ID_Users,Type)
	    select I.ID , U.ID , Type
        from Item as I , Users as U
        where I.Name = @itemname AND U.Users_name = @username;
END
