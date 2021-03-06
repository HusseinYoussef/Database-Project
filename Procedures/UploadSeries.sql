USE [HBO]
GO
/****** Object:  StoredProcedure [dbo].[Upload_Series]    Script Date: 12/20/2017 00:27:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[Upload_Series]
	@Name varchar(50),		-- Add to items
	@Price int,				-- Add to items
	@Year int,				-- Add to items
	@Rate float,
	@UploaderUserName varchar(50),		-- Add to items (his id)
	@Poster_Url image,-- Add to items
	
	@NOS float,		
	@Name_Director varchar(50),
	@act1 varchar(50),
	@act2 varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @ItemID int;	--This variable will hold the current item id.
	DECLARE @ID_Director int;
	DECLARE @UploaderID int;
	DECLARE @Act1ID int;
	DECLARE @Act2ID int;
	
	--Insertion In Item Table.
	set @UploaderID = (select ID from Users where Users.Users_name = @UploaderUserName);
	insert into Item(Name,Price,Year,Rate,#Purchase,Uploader_ID,Type,Poster)
	values(@Name,@Price,@Year,@Rate,0,@UploaderID,2,@Poster_Url);
	-- type : 1 = movie, 2 = tv series, 3 = game, 4 = song
	

	set @ItemID = (	select max(ID) from Item);	-- Now @ItemID has the current item id.
   	SET @ID_Director =(SELECT ID FROM Director where Fname = @Name_Director);
   	--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
	SET @Act1ID = (select ID from Actors where @act1 = Actors.Fname) -- FOCUS YOU MUST CHNAGE IT IN NEW DB ^^^^^^^^^^^^^^^^^^^^^^^^
	SET @Act2ID = (select ID from Actors where @act2 = Actors.Fname) -- FOCUS YOU MUST CHNAGE IT IN NEW DB ^^^^^^^^^^^^^^^^^^^^^^^^
	--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

	
	insert into  TV_Series(ID,#Seasons,ID_Director)
	values(@ItemID,@NOS,@ID_Director)
	
	insert into Act values(@Act1ID,@ItemID,1);
	insert into Act values(@Act2ID,@ItemID,1);
	
	select @ItemID;--Return The Item ID
	

END