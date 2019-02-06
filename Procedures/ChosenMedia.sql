USE [HBO]
GO
/****** Object:  StoredProcedure [dbo].[ChosenMedia]    Script Date: 12/15/2017 22:04:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[ChosenMedia]  
		@media int,
		@genre varchar(25)

AS
BEGIN

        Select Name,I.Type,Poster,I.ID
        from Item as I,Genre
        where I.Type = @media AND I.ID = Genre.ID_Item AND Genre.Genre = @genre;  

END
