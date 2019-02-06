USE [HBO]
GO
/****** Object:  StoredProcedure [dbo].[MyItems]    Script Date: 12/16/2017 22:44:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[MyItems] 
		@username varchar(50)

AS
BEGIN
		
	   select Name,I.Type,Poster,I.ID
	   from Item as I
	   where I.ID IN (select ID_Item
	                  from Purchase
	                  where Purchase.ID_Users = (Select ID
	                                             from Users
	                                             where Users.Users_name = @username
	                                             ) 
	                 ); 

END
