USE [HBO]
GO
/****** Object:  StoredProcedure [dbo].[Uploads]    Script Date: 12/16/2017 18:04:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[Uploads] 
         @username varchar(50)

AS
BEGIN
        
        select Name,Type,Poster,ID
        from Item
        where Item.Uploader_ID = ( select ID 
                                   from Users
                                   where Users.Users_name = @username
                                  );

END
