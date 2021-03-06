USE [HBO]
GO
/****** Object:  StoredProcedure [dbo].[upload_movie]    Script Date: 12/19/2017 15:41:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================

--***************************************************************************************
--** The following procedures are for uploading an item(movie,tv series, game or song)
--** I'm assuming that ids for these items are auto-incremented and constraints are ckecked by GUI.

ALTER PROCEDURE [dbo].[upload_movie]
	-- Add the parameters for the stored procedure here
			
	@Name varchar(50),		-- Add to items
	@Price int,				-- Add to items
	@Year int,				-- Add to items
	@Rate float,
	@UploaderUserName varchar(50),		-- Add to items (his id)
	@Poster_Url image,-- Add to items
	
	@Duration float,		-- Add to Movies
	@Name_Director varchar(50),		-- Add to Movies
	@act1 varchar(50),		-- Add to Movies
	@act2 varchar(50)		-- Add to Movies
	
	

	--@Genre varchar(50)		-- Add to Genre

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DECLARE @ItemID int;	--This variable will hold the current item id.
	DECLARE @ID_Director int;
	DECLARE @UploaderID int;
	DECLARE @Act1ID int;
	DECLARE @Act2ID int;
	
	--Insertion In Item Table.
	select @UploaderID = ID from Users where Users.Users_name = @UploaderUserName;
	insert into Item(Name,Price,Year,Rate,#Purchase,Uploader_ID,Type,Poster)
	values(@Name,@Price,@Year,@Rate,0,@UploaderID,1,@Poster_Url)
	-- type : 1 = movie, 2 = tv series, 3 = game, 4 = song
	set @ItemID = (	select max(ID) from Item);
	

	--SELECT @ItemID = ID FROM Item where Name = @Name and Type = 1;	-- Now @ItemID has the current item id.
 	SET @ID_Director  = (SELECT ID FROM Director where Fname = @Name_Director);
 --  	--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
	set @Act1ID = (select ID from Actors where @act1 = Actors.Fname); -- FOCUS YOU MUST CHNAGE IT IN NEW DB ^^^^^^^^^^^^^^^^^^^^^^^^
	set @Act2ID = (select ID from Actors where @act2 = Actors.Fname); -- FOCUS YOU MUST CHNAGE IT IN NEW DB ^^^^^^^^^^^^^^^^^^^^^^^^
	----^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
	
	insert into Movies(ID,Duration,ID_Director)
	values(@ItemID,@Duration,@ID_Director);
	
	insert into Act values(@Act1ID,@ItemID,1);
	insert into Act values(@Act2ID,@ItemID,1);
	select @ItemID;
	--SELECT ID FROM Item where Name = @Name and Type = 1;	-- Now @ItemID has the current item id.--Return The Item ID
	
	----insert into Genre(ID_Item,Genre,Type)
	--values(@ItemID,@Genre,1)
	

END

