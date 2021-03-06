USE [HBO]
GO
/****** Object:  StoredProcedure [dbo].[MyHistory]    Script Date: 12/16/2017 18:03:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[MyHistory] 
       @username varchar(50)
AS
BEGIN

      select Name,Type,Poster,ID
	  from Item
	  where Item.ID IN ( select H.ID_Item 
	                     from History as H
	                     where H.ID_Users = ( select ID
	                                          from Users
	                                          where Users.Users_name = @username
	                                         )
	                    );
END
