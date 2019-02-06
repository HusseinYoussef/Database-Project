USE [HBO]
GO
/****** Object:  StoredProcedure [dbo].[HaveThisItem]    Script Date: 12/18/2017 20:04:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[HaveThisItem] @itemid int,@username varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    select ID_Item from Purchase where ID_Item = @itemid and ID_Users = (select ID from Users where @username = Users_name);
END
