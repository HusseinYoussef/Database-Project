USE [HBO]
GO
/****** Object:  StoredProcedure [dbo].[UploaderName]    Script Date: 12/18/2017 20:38:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[UploaderName] 
           @itemid int
           
AS  
BEGIN

		Select Users_name
		from Users
		where Users.ID = (select Uploader_ID
		                   from Item
		                   where Item.ID = @itemid
		                  );
		
END
