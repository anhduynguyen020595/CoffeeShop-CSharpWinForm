IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'SP_CFS_GET_ACCOUNT_BY_USERNAME_AND_PASSWORD')
	DROP PROCEDURE SP_CFS_GET_ACCOUNT_BY_USERNAME_AND_PASSWORD
GO
CREATE PROCEDURE [dbo].[SP_CFS_GET_ACCOUNT_BY_USERNAME_AND_PASSWORD] (@Username nvarchar(100), @Password nvarchar(1000))
AS SET NOCOUNT ON
BEGIN
	SELECT * FROM CFS_ACCOUNT 
	WHERE Username = @Username 
	AND Password = @Password
END
GO
--=====================================================================================================================
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'SP_CFS_GET_TABLE')
	DROP PROCEDURE SP_CFS_GET_TABLE
GO
CREATE PROCEDURE [dbo].[SP_CFS_GET_TABLE]
AS SET NOCOUNT ON
BEGIN
	SELECT * FROM CFS_TABLE
END
GO
--=====================================================================================================================
