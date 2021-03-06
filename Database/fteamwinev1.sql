USE [master]
GO
/****** Object:  Database [fteamwine]    Script Date: 28/06/2016 13:19:06 ******/
CREATE DATABASE [fteamwine]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'fteamwine', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\fteamwine.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'fteamwine_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\fteamwine_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [fteamwine] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [fteamwine].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [fteamwine] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [fteamwine] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [fteamwine] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [fteamwine] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [fteamwine] SET ARITHABORT OFF 
GO
ALTER DATABASE [fteamwine] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [fteamwine] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [fteamwine] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [fteamwine] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [fteamwine] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [fteamwine] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [fteamwine] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [fteamwine] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [fteamwine] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [fteamwine] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [fteamwine] SET  DISABLE_BROKER 
GO
ALTER DATABASE [fteamwine] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [fteamwine] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [fteamwine] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [fteamwine] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [fteamwine] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [fteamwine] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [fteamwine] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [fteamwine] SET RECOVERY FULL 
GO
ALTER DATABASE [fteamwine] SET  MULTI_USER 
GO
ALTER DATABASE [fteamwine] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [fteamwine] SET DB_CHAINING OFF 
GO
ALTER DATABASE [fteamwine] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [fteamwine] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [fteamwine]
GO
/****** Object:  DatabaseRole [aspnet_WebEvent_FullAccess]    Script Date: 28/06/2016 13:19:06 ******/
CREATE ROLE [aspnet_WebEvent_FullAccess]
GO
/****** Object:  DatabaseRole [aspnet_Roles_ReportingAccess]    Script Date: 28/06/2016 13:19:06 ******/
CREATE ROLE [aspnet_Roles_ReportingAccess]
GO
/****** Object:  DatabaseRole [aspnet_Roles_FullAccess]    Script Date: 28/06/2016 13:19:06 ******/
CREATE ROLE [aspnet_Roles_FullAccess]
GO
/****** Object:  DatabaseRole [aspnet_Roles_BasicAccess]    Script Date: 28/06/2016 13:19:06 ******/
CREATE ROLE [aspnet_Roles_BasicAccess]
GO
/****** Object:  DatabaseRole [aspnet_Profile_ReportingAccess]    Script Date: 28/06/2016 13:19:06 ******/
CREATE ROLE [aspnet_Profile_ReportingAccess]
GO
/****** Object:  DatabaseRole [aspnet_Profile_FullAccess]    Script Date: 28/06/2016 13:19:06 ******/
CREATE ROLE [aspnet_Profile_FullAccess]
GO
/****** Object:  DatabaseRole [aspnet_Profile_BasicAccess]    Script Date: 28/06/2016 13:19:06 ******/
CREATE ROLE [aspnet_Profile_BasicAccess]
GO
/****** Object:  DatabaseRole [aspnet_Personalization_ReportingAccess]    Script Date: 28/06/2016 13:19:06 ******/
CREATE ROLE [aspnet_Personalization_ReportingAccess]
GO
/****** Object:  DatabaseRole [aspnet_Personalization_FullAccess]    Script Date: 28/06/2016 13:19:06 ******/
CREATE ROLE [aspnet_Personalization_FullAccess]
GO
/****** Object:  DatabaseRole [aspnet_Personalization_BasicAccess]    Script Date: 28/06/2016 13:19:06 ******/
CREATE ROLE [aspnet_Personalization_BasicAccess]
GO
/****** Object:  DatabaseRole [aspnet_Membership_ReportingAccess]    Script Date: 28/06/2016 13:19:06 ******/
CREATE ROLE [aspnet_Membership_ReportingAccess]
GO
/****** Object:  DatabaseRole [aspnet_Membership_FullAccess]    Script Date: 28/06/2016 13:19:06 ******/
CREATE ROLE [aspnet_Membership_FullAccess]
GO
/****** Object:  DatabaseRole [aspnet_Membership_BasicAccess]    Script Date: 28/06/2016 13:19:06 ******/
CREATE ROLE [aspnet_Membership_BasicAccess]
GO
ALTER ROLE [aspnet_Roles_BasicAccess] ADD MEMBER [aspnet_Roles_FullAccess]
GO
ALTER ROLE [aspnet_Roles_ReportingAccess] ADD MEMBER [aspnet_Roles_FullAccess]
GO
ALTER ROLE [aspnet_Profile_BasicAccess] ADD MEMBER [aspnet_Profile_FullAccess]
GO
ALTER ROLE [aspnet_Profile_ReportingAccess] ADD MEMBER [aspnet_Profile_FullAccess]
GO
ALTER ROLE [aspnet_Personalization_BasicAccess] ADD MEMBER [aspnet_Personalization_FullAccess]
GO
ALTER ROLE [aspnet_Personalization_ReportingAccess] ADD MEMBER [aspnet_Personalization_FullAccess]
GO
ALTER ROLE [aspnet_Membership_BasicAccess] ADD MEMBER [aspnet_Membership_FullAccess]
GO
ALTER ROLE [aspnet_Membership_ReportingAccess] ADD MEMBER [aspnet_Membership_FullAccess]
GO
/****** Object:  Schema [aspnet_Membership_BasicAccess]    Script Date: 28/06/2016 13:19:07 ******/
CREATE SCHEMA [aspnet_Membership_BasicAccess]
GO
/****** Object:  Schema [aspnet_Membership_FullAccess]    Script Date: 28/06/2016 13:19:07 ******/
CREATE SCHEMA [aspnet_Membership_FullAccess]
GO
/****** Object:  Schema [aspnet_Membership_ReportingAccess]    Script Date: 28/06/2016 13:19:07 ******/
CREATE SCHEMA [aspnet_Membership_ReportingAccess]
GO
/****** Object:  Schema [aspnet_Personalization_BasicAccess]    Script Date: 28/06/2016 13:19:07 ******/
CREATE SCHEMA [aspnet_Personalization_BasicAccess]
GO
/****** Object:  Schema [aspnet_Personalization_FullAccess]    Script Date: 28/06/2016 13:19:07 ******/
CREATE SCHEMA [aspnet_Personalization_FullAccess]
GO
/****** Object:  Schema [aspnet_Personalization_ReportingAccess]    Script Date: 28/06/2016 13:19:07 ******/
CREATE SCHEMA [aspnet_Personalization_ReportingAccess]
GO
/****** Object:  Schema [aspnet_Profile_BasicAccess]    Script Date: 28/06/2016 13:19:07 ******/
CREATE SCHEMA [aspnet_Profile_BasicAccess]
GO
/****** Object:  Schema [aspnet_Profile_FullAccess]    Script Date: 28/06/2016 13:19:07 ******/
CREATE SCHEMA [aspnet_Profile_FullAccess]
GO
/****** Object:  Schema [aspnet_Profile_ReportingAccess]    Script Date: 28/06/2016 13:19:07 ******/
CREATE SCHEMA [aspnet_Profile_ReportingAccess]
GO
/****** Object:  Schema [aspnet_Roles_BasicAccess]    Script Date: 28/06/2016 13:19:07 ******/
CREATE SCHEMA [aspnet_Roles_BasicAccess]
GO
/****** Object:  Schema [aspnet_Roles_FullAccess]    Script Date: 28/06/2016 13:19:07 ******/
CREATE SCHEMA [aspnet_Roles_FullAccess]
GO
/****** Object:  Schema [aspnet_Roles_ReportingAccess]    Script Date: 28/06/2016 13:19:07 ******/
CREATE SCHEMA [aspnet_Roles_ReportingAccess]
GO
/****** Object:  Schema [aspnet_WebEvent_FullAccess]    Script Date: 28/06/2016 13:19:07 ******/
CREATE SCHEMA [aspnet_WebEvent_FullAccess]
GO
/****** Object:  StoredProcedure [dbo].[aspnet_AnyDataInTables]    Script Date: 28/06/2016 13:19:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_AnyDataInTables]
    @TablesToCheck int
AS
BEGIN
    -- Check Membership table if (@TablesToCheck & 1) is set
    IF ((@TablesToCheck & 1) <> 0 AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_MembershipUsers') AND (type = 'V'))))
    BEGIN
        IF (EXISTS(SELECT TOP 1 UserId FROM dbo.aspnet_Membership))
        BEGIN
            SELECT N'aspnet_Membership'
            RETURN
        END
    END

    -- Check aspnet_Roles table if (@TablesToCheck & 2) is set
    IF ((@TablesToCheck & 2) <> 0  AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_Roles') AND (type = 'V'))) )
    BEGIN
        IF (EXISTS(SELECT TOP 1 RoleId FROM dbo.aspnet_Roles))
        BEGIN
            SELECT N'aspnet_Roles'
            RETURN
        END
    END

    -- Check aspnet_Profile table if (@TablesToCheck & 4) is set
    IF ((@TablesToCheck & 4) <> 0  AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_Profiles') AND (type = 'V'))) )
    BEGIN
        IF (EXISTS(SELECT TOP 1 UserId FROM dbo.aspnet_Profile))
        BEGIN
            SELECT N'aspnet_Profile'
            RETURN
        END
    END

    -- Check aspnet_PersonalizationPerUser table if (@TablesToCheck & 8) is set
    IF ((@TablesToCheck & 8) <> 0  AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_WebPartState_User') AND (type = 'V'))) )
    BEGIN
        IF (EXISTS(SELECT TOP 1 UserId FROM dbo.aspnet_PersonalizationPerUser))
        BEGIN
            SELECT N'aspnet_PersonalizationPerUser'
            RETURN
        END
    END

    -- Check aspnet_PersonalizationPerUser table if (@TablesToCheck & 16) is set
    IF ((@TablesToCheck & 16) <> 0  AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'aspnet_WebEvent_LogEvent') AND (type = 'P'))) )
    BEGIN
        IF (EXISTS(SELECT TOP 1 * FROM dbo.aspnet_WebEvent_Events))
        BEGIN
            SELECT N'aspnet_WebEvent_Events'
            RETURN
        END
    END

    -- Check aspnet_Users table if (@TablesToCheck & 1,2,4 & 8) are all set
    IF ((@TablesToCheck & 1) <> 0 AND
        (@TablesToCheck & 2) <> 0 AND
        (@TablesToCheck & 4) <> 0 AND
        (@TablesToCheck & 8) <> 0 AND
        (@TablesToCheck & 32) <> 0 AND
        (@TablesToCheck & 128) <> 0 AND
        (@TablesToCheck & 256) <> 0 AND
        (@TablesToCheck & 512) <> 0 AND
        (@TablesToCheck & 1024) <> 0)
    BEGIN
        IF (EXISTS(SELECT TOP 1 UserId FROM dbo.aspnet_Users))
        BEGIN
            SELECT N'aspnet_Users'
            RETURN
        END
        IF (EXISTS(SELECT TOP 1 ApplicationId FROM dbo.aspnet_Applications))
        BEGIN
            SELECT N'aspnet_Applications'
            RETURN
        END
    END
END









GO
/****** Object:  StoredProcedure [dbo].[aspnet_Applications_CreateApplication]    Script Date: 28/06/2016 13:19:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_Applications_CreateApplication]
    @ApplicationName      nvarchar(256),
    @ApplicationId        uniqueidentifier OUTPUT
AS
BEGIN
    SELECT  @ApplicationId = ApplicationId FROM dbo.aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName

    IF(@ApplicationId IS NULL)
    BEGIN
        DECLARE @TranStarted   bit
        SET @TranStarted = 0

        IF( @@TRANCOUNT = 0 )
        BEGIN
	        BEGIN TRANSACTION
	        SET @TranStarted = 1
        END
        ELSE
    	    SET @TranStarted = 0

        SELECT  @ApplicationId = ApplicationId
        FROM dbo.aspnet_Applications WITH (UPDLOCK, HOLDLOCK)
        WHERE LOWER(@ApplicationName) = LoweredApplicationName

        IF(@ApplicationId IS NULL)
        BEGIN
            SELECT  @ApplicationId = NEWID()
            INSERT  dbo.aspnet_Applications (ApplicationId, ApplicationName, LoweredApplicationName)
            VALUES  (@ApplicationId, @ApplicationName, LOWER(@ApplicationName))
        END


        IF( @TranStarted = 1 )
        BEGIN
            IF(@@ERROR = 0)
            BEGIN
	        SET @TranStarted = 0
	        COMMIT TRANSACTION
            END
            ELSE
            BEGIN
                SET @TranStarted = 0
                ROLLBACK TRANSACTION
            END
        END
    END
END









GO
/****** Object:  StoredProcedure [dbo].[aspnet_CheckSchemaVersion]    Script Date: 28/06/2016 13:19:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_CheckSchemaVersion]
    @Feature                   nvarchar(128),
    @CompatibleSchemaVersion   nvarchar(128)
AS
BEGIN
    IF (EXISTS( SELECT  *
                FROM    dbo.aspnet_SchemaVersions
                WHERE   Feature = LOWER( @Feature ) AND
                        CompatibleSchemaVersion = @CompatibleSchemaVersion ))
        RETURN 0

    RETURN 1
END









GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_ChangePasswordQuestionAndAnswer]    Script Date: 28/06/2016 13:19:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_ChangePasswordQuestionAndAnswer]
    @ApplicationName       nvarchar(256),
    @UserName              nvarchar(256),
    @NewPasswordQuestion   nvarchar(256),
    @NewPasswordAnswer     nvarchar(128)
AS
BEGIN
    DECLARE @UserId uniqueidentifier
    SELECT  @UserId = NULL
    SELECT  @UserId = u.UserId
    FROM    dbo.aspnet_Membership m, dbo.aspnet_Users u, dbo.aspnet_Applications a
    WHERE   LoweredUserName = LOWER(@UserName) AND
            u.ApplicationId = a.ApplicationId  AND
            LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.UserId = m.UserId
    IF (@UserId IS NULL)
    BEGIN
        RETURN(1)
    END

    UPDATE dbo.aspnet_Membership
    SET    PasswordQuestion = @NewPasswordQuestion, PasswordAnswer = @NewPasswordAnswer
    WHERE  UserId=@UserId
    RETURN(0)
END









GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_CreateUser]    Script Date: 28/06/2016 13:19:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_CreateUser]
    @ApplicationName                        nvarchar(256),
    @UserName                               nvarchar(256),
    @Password                               nvarchar(128),
    @PasswordSalt                           nvarchar(128),
    @Email                                  nvarchar(256),
    @PasswordQuestion                       nvarchar(256),
    @PasswordAnswer                         nvarchar(128),
    @IsApproved                             bit,
    @CurrentTimeUtc                         datetime,
    @CreateDate                             datetime = NULL,
    @UniqueEmail                            int      = 0,
    @PasswordFormat                         int      = 0,
    @UserId                                 uniqueidentifier OUTPUT
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL

    DECLARE @NewUserId uniqueidentifier
    SELECT @NewUserId = NULL

    DECLARE @IsLockedOut bit
    SET @IsLockedOut = 0

    DECLARE @LastLockoutDate  datetime
    SET @LastLockoutDate = CONVERT( datetime, '17540101', 112 )

    DECLARE @FailedPasswordAttemptCount int
    SET @FailedPasswordAttemptCount = 0

    DECLARE @FailedPasswordAttemptWindowStart  datetime
    SET @FailedPasswordAttemptWindowStart = CONVERT( datetime, '17540101', 112 )

    DECLARE @FailedPasswordAnswerAttemptCount int
    SET @FailedPasswordAnswerAttemptCount = 0

    DECLARE @FailedPasswordAnswerAttemptWindowStart  datetime
    SET @FailedPasswordAnswerAttemptWindowStart = CONVERT( datetime, '17540101', 112 )

    DECLARE @NewUserCreated bit
    DECLARE @ReturnValue   int
    SET @ReturnValue = 0

    DECLARE @ErrorCode     int
    SET @ErrorCode = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
	    BEGIN TRANSACTION
	    SET @TranStarted = 1
    END
    ELSE
    	SET @TranStarted = 0

    EXEC dbo.aspnet_Applications_CreateApplication @ApplicationName, @ApplicationId OUTPUT

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    SET @CreateDate = @CurrentTimeUtc

    SELECT  @NewUserId = UserId FROM dbo.aspnet_Users WHERE LOWER(@UserName) = LoweredUserName AND @ApplicationId = ApplicationId
    IF ( @NewUserId IS NULL )
    BEGIN
        SET @NewUserId = @UserId
        EXEC @ReturnValue = dbo.aspnet_Users_CreateUser @ApplicationId, @UserName, 0, @CreateDate, @NewUserId OUTPUT
        SET @NewUserCreated = 1
    END
    ELSE
    BEGIN
        SET @NewUserCreated = 0
        IF( @NewUserId <> @UserId AND @UserId IS NOT NULL )
        BEGIN
            SET @ErrorCode = 6
            GOTO Cleanup
        END
    END

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF( @ReturnValue = -1 )
    BEGIN
        SET @ErrorCode = 10
        GOTO Cleanup
    END

    IF ( EXISTS ( SELECT UserId
                  FROM   dbo.aspnet_Membership
                  WHERE  @NewUserId = UserId ) )
    BEGIN
        SET @ErrorCode = 6
        GOTO Cleanup
    END

    SET @UserId = @NewUserId

    IF (@UniqueEmail = 1)
    BEGIN
        IF (EXISTS (SELECT *
                    FROM  dbo.aspnet_Membership m WITH ( UPDLOCK, HOLDLOCK )
                    WHERE ApplicationId = @ApplicationId AND LoweredEmail = LOWER(@Email)))
        BEGIN
            SET @ErrorCode = 7
            GOTO Cleanup
        END
    END

    IF (@NewUserCreated = 0)
    BEGIN
        UPDATE dbo.aspnet_Users
        SET    LastActivityDate = @CreateDate
        WHERE  @UserId = UserId
        IF( @@ERROR <> 0 )
        BEGIN
            SET @ErrorCode = -1
            GOTO Cleanup
        END
    END

    INSERT INTO dbo.aspnet_Membership
                ( ApplicationId,
                  UserId,
                  Password,
                  PasswordSalt,
                  Email,
                  LoweredEmail,
                  PasswordQuestion,
                  PasswordAnswer,
                  PasswordFormat,
                  IsApproved,
                  IsLockedOut,
                  CreateDate,
                  LastLoginDate,
                  LastPasswordChangedDate,
                  LastLockoutDate,
                  FailedPasswordAttemptCount,
                  FailedPasswordAttemptWindowStart,
                  FailedPasswordAnswerAttemptCount,
                  FailedPasswordAnswerAttemptWindowStart )
         VALUES ( @ApplicationId,
                  @UserId,
                  @Password,
                  @PasswordSalt,
                  @Email,
                  LOWER(@Email),
                  @PasswordQuestion,
                  @PasswordAnswer,
                  @PasswordFormat,
                  @IsApproved,
                  @IsLockedOut,
                  @CreateDate,
                  @CreateDate,
                  @CreateDate,
                  @LastLockoutDate,
                  @FailedPasswordAttemptCount,
                  @FailedPasswordAttemptWindowStart,
                  @FailedPasswordAnswerAttemptCount,
                  @FailedPasswordAnswerAttemptWindowStart )

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF( @TranStarted = 1 )
    BEGIN
	    SET @TranStarted = 0
	    COMMIT TRANSACTION
    END

    RETURN 0

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
    	ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode

END









GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_FindUsersByEmail]    Script Date: 28/06/2016 13:19:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_FindUsersByEmail]
    @ApplicationName       nvarchar(256),
    @EmailToMatch          nvarchar(256),
    @PageIndex             int,
    @PageSize              int
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM dbo.aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN 0

    -- Set the page bounds
    DECLARE @PageLowerBound int
    DECLARE @PageUpperBound int
    DECLARE @TotalRecords   int
    SET @PageLowerBound = @PageSize * @PageIndex
    SET @PageUpperBound = @PageSize - 1 + @PageLowerBound

    -- Create a temp table TO store the select results
    CREATE TABLE #PageIndexForUsers
    (
        IndexId int IDENTITY (0, 1) NOT NULL,
        UserId uniqueidentifier
    )

    -- Insert into our temp table
    IF( @EmailToMatch IS NULL )
        INSERT INTO #PageIndexForUsers (UserId)
            SELECT u.UserId
            FROM   dbo.aspnet_Users u, dbo.aspnet_Membership m
            WHERE  u.ApplicationId = @ApplicationId AND m.UserId = u.UserId AND m.Email IS NULL
            ORDER BY m.LoweredEmail
    ELSE
        INSERT INTO #PageIndexForUsers (UserId)
            SELECT u.UserId
            FROM   dbo.aspnet_Users u, dbo.aspnet_Membership m
            WHERE  u.ApplicationId = @ApplicationId AND m.UserId = u.UserId AND m.LoweredEmail LIKE LOWER(@EmailToMatch)
            ORDER BY m.LoweredEmail

    SELECT  u.UserName, m.Email, m.PasswordQuestion, m.Comment, m.IsApproved,
            m.CreateDate,
            m.LastLoginDate,
            u.LastActivityDate,
            m.LastPasswordChangedDate,
            u.UserId, m.IsLockedOut,
            m.LastLockoutDate
    FROM   dbo.aspnet_Membership m, dbo.aspnet_Users u, #PageIndexForUsers p
    WHERE  u.UserId = p.UserId AND u.UserId = m.UserId AND
           p.IndexId >= @PageLowerBound AND p.IndexId <= @PageUpperBound
    ORDER BY m.LoweredEmail

    SELECT  @TotalRecords = COUNT(*)
    FROM    #PageIndexForUsers
    RETURN @TotalRecords
END









GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_FindUsersByName]    Script Date: 28/06/2016 13:19:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_FindUsersByName]
    @ApplicationName       nvarchar(256),
    @UserNameToMatch       nvarchar(256),
    @PageIndex             int,
    @PageSize              int
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM dbo.aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN 0

    -- Set the page bounds
    DECLARE @PageLowerBound int
    DECLARE @PageUpperBound int
    DECLARE @TotalRecords   int
    SET @PageLowerBound = @PageSize * @PageIndex
    SET @PageUpperBound = @PageSize - 1 + @PageLowerBound

    -- Create a temp table TO store the select results
    CREATE TABLE #PageIndexForUsers
    (
        IndexId int IDENTITY (0, 1) NOT NULL,
        UserId uniqueidentifier
    )

    -- Insert into our temp table
    INSERT INTO #PageIndexForUsers (UserId)
        SELECT u.UserId
        FROM   dbo.aspnet_Users u, dbo.aspnet_Membership m
        WHERE  u.ApplicationId = @ApplicationId AND m.UserId = u.UserId AND u.LoweredUserName LIKE LOWER(@UserNameToMatch)
        ORDER BY u.UserName


    SELECT  u.UserName, m.Email, m.PasswordQuestion, m.Comment, m.IsApproved,
            m.CreateDate,
            m.LastLoginDate,
            u.LastActivityDate,
            m.LastPasswordChangedDate,
            u.UserId, m.IsLockedOut,
            m.LastLockoutDate
    FROM   dbo.aspnet_Membership m, dbo.aspnet_Users u, #PageIndexForUsers p
    WHERE  u.UserId = p.UserId AND u.UserId = m.UserId AND
           p.IndexId >= @PageLowerBound AND p.IndexId <= @PageUpperBound
    ORDER BY u.UserName

    SELECT  @TotalRecords = COUNT(*)
    FROM    #PageIndexForUsers
    RETURN @TotalRecords
END









GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetAllUsers]    Script Date: 28/06/2016 13:19:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_GetAllUsers]
    @ApplicationName       nvarchar(256),
    @PageIndex             int,
    @PageSize              int
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM dbo.aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN 0


    -- Set the page bounds
    DECLARE @PageLowerBound int
    DECLARE @PageUpperBound int
    DECLARE @TotalRecords   int
    SET @PageLowerBound = @PageSize * @PageIndex
    SET @PageUpperBound = @PageSize - 1 + @PageLowerBound

    -- Create a temp table TO store the select results
    CREATE TABLE #PageIndexForUsers
    (
        IndexId int IDENTITY (0, 1) NOT NULL,
        UserId uniqueidentifier
    )

    -- Insert into our temp table
    INSERT INTO #PageIndexForUsers (UserId)
    SELECT u.UserId
    FROM   dbo.aspnet_Membership m, dbo.aspnet_Users u
    WHERE  u.ApplicationId = @ApplicationId AND u.UserId = m.UserId
    ORDER BY u.UserName

    SELECT @TotalRecords = @@ROWCOUNT

    SELECT u.UserName, m.Email, m.PasswordQuestion, m.Comment, m.IsApproved,
            m.CreateDate,
            m.LastLoginDate,
            u.LastActivityDate,
            m.LastPasswordChangedDate,
            u.UserId, m.IsLockedOut,
            m.LastLockoutDate
    FROM   dbo.aspnet_Membership m, dbo.aspnet_Users u, #PageIndexForUsers p
    WHERE  u.UserId = p.UserId AND u.UserId = m.UserId AND
           p.IndexId >= @PageLowerBound AND p.IndexId <= @PageUpperBound
    ORDER BY u.UserName
    RETURN @TotalRecords
END









GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetNumberOfUsersOnline]    Script Date: 28/06/2016 13:19:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_GetNumberOfUsersOnline]
    @ApplicationName            nvarchar(256),
    @MinutesSinceLastInActive   int,
    @CurrentTimeUtc             datetime
AS
BEGIN
    DECLARE @DateActive datetime
    SELECT  @DateActive = DATEADD(minute,  -(@MinutesSinceLastInActive), @CurrentTimeUtc)

    DECLARE @NumOnline int
    SELECT  @NumOnline = COUNT(*)
    FROM    dbo.aspnet_Users u(NOLOCK),
            dbo.aspnet_Applications a(NOLOCK),
            dbo.aspnet_Membership m(NOLOCK)
    WHERE   u.ApplicationId = a.ApplicationId                  AND
            LastActivityDate > @DateActive                     AND
            a.LoweredApplicationName = LOWER(@ApplicationName) AND
            u.UserId = m.UserId
    RETURN(@NumOnline)
END









GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetPassword]    Script Date: 28/06/2016 13:19:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_GetPassword]
    @ApplicationName                nvarchar(256),
    @UserName                       nvarchar(256),
    @MaxInvalidPasswordAttempts     int,
    @PasswordAttemptWindow          int,
    @CurrentTimeUtc                 datetime,
    @PasswordAnswer                 nvarchar(128) = NULL
AS
BEGIN
    DECLARE @UserId                                 uniqueidentifier
    DECLARE @PasswordFormat                         int
    DECLARE @Password                               nvarchar(128)
    DECLARE @passAns                                nvarchar(128)
    DECLARE @IsLockedOut                            bit
    DECLARE @LastLockoutDate                        datetime
    DECLARE @FailedPasswordAttemptCount             int
    DECLARE @FailedPasswordAttemptWindowStart       datetime
    DECLARE @FailedPasswordAnswerAttemptCount       int
    DECLARE @FailedPasswordAnswerAttemptWindowStart datetime

    DECLARE @ErrorCode     int
    SET @ErrorCode = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
	    BEGIN TRANSACTION
	    SET @TranStarted = 1
    END
    ELSE
    	SET @TranStarted = 0

    SELECT  @UserId = u.UserId,
            @Password = m.Password,
            @passAns = m.PasswordAnswer,
            @PasswordFormat = m.PasswordFormat,
            @IsLockedOut = m.IsLockedOut,
            @LastLockoutDate = m.LastLockoutDate,
            @FailedPasswordAttemptCount = m.FailedPasswordAttemptCount,
            @FailedPasswordAttemptWindowStart = m.FailedPasswordAttemptWindowStart,
            @FailedPasswordAnswerAttemptCount = m.FailedPasswordAnswerAttemptCount,
            @FailedPasswordAnswerAttemptWindowStart = m.FailedPasswordAnswerAttemptWindowStart
    FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m WITH ( UPDLOCK )
    WHERE   LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.ApplicationId = a.ApplicationId    AND
            u.UserId = m.UserId AND
            LOWER(@UserName) = u.LoweredUserName

    IF ( @@rowcount = 0 )
    BEGIN
        SET @ErrorCode = 1
        GOTO Cleanup
    END

    IF( @IsLockedOut = 1 )
    BEGIN
        SET @ErrorCode = 99
        GOTO Cleanup
    END

    IF ( NOT( @PasswordAnswer IS NULL ) )
    BEGIN
        IF( ( @passAns IS NULL ) OR ( LOWER( @passAns ) <> LOWER( @PasswordAnswer ) ) )
        BEGIN
            IF( @CurrentTimeUtc > DATEADD( minute, @PasswordAttemptWindow, @FailedPasswordAnswerAttemptWindowStart ) )
            BEGIN
                SET @FailedPasswordAnswerAttemptWindowStart = @CurrentTimeUtc
                SET @FailedPasswordAnswerAttemptCount = 1
            END
            ELSE
            BEGIN
                SET @FailedPasswordAnswerAttemptCount = @FailedPasswordAnswerAttemptCount + 1
                SET @FailedPasswordAnswerAttemptWindowStart = @CurrentTimeUtc
            END

            BEGIN
                IF( @FailedPasswordAnswerAttemptCount >= @MaxInvalidPasswordAttempts )
                BEGIN
                    SET @IsLockedOut = 1
                    SET @LastLockoutDate = @CurrentTimeUtc
                END
            END

            SET @ErrorCode = 3
        END
        ELSE
        BEGIN
            IF( @FailedPasswordAnswerAttemptCount > 0 )
            BEGIN
                SET @FailedPasswordAnswerAttemptCount = 0
                SET @FailedPasswordAnswerAttemptWindowStart = CONVERT( datetime, '17540101', 112 )
            END
        END

        UPDATE dbo.aspnet_Membership
        SET IsLockedOut = @IsLockedOut, LastLockoutDate = @LastLockoutDate,
            FailedPasswordAttemptCount = @FailedPasswordAttemptCount,
            FailedPasswordAttemptWindowStart = @FailedPasswordAttemptWindowStart,
            FailedPasswordAnswerAttemptCount = @FailedPasswordAnswerAttemptCount,
            FailedPasswordAnswerAttemptWindowStart = @FailedPasswordAnswerAttemptWindowStart
        WHERE @UserId = UserId

        IF( @@ERROR <> 0 )
        BEGIN
            SET @ErrorCode = -1
            GOTO Cleanup
        END
    END

    IF( @TranStarted = 1 )
    BEGIN
	SET @TranStarted = 0
	COMMIT TRANSACTION
    END

    IF( @ErrorCode = 0 )
        SELECT @Password, @PasswordFormat

    RETURN @ErrorCode

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
    	ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode

END









GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetPasswordWithFormat]    Script Date: 28/06/2016 13:19:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_GetPasswordWithFormat]
    @ApplicationName                nvarchar(256),
    @UserName                       nvarchar(256),
    @UpdateLastLoginActivityDate    bit,
    @CurrentTimeUtc                 datetime
AS
BEGIN
    DECLARE @IsLockedOut                        bit
    DECLARE @UserId                             uniqueidentifier
    DECLARE @Password                           nvarchar(128)
    DECLARE @PasswordSalt                       nvarchar(128)
    DECLARE @PasswordFormat                     int
    DECLARE @FailedPasswordAttemptCount         int
    DECLARE @FailedPasswordAnswerAttemptCount   int
    DECLARE @IsApproved                         bit
    DECLARE @LastActivityDate                   datetime
    DECLARE @LastLoginDate                      datetime

    SELECT  @UserId          = NULL

    SELECT  @UserId = u.UserId, @IsLockedOut = m.IsLockedOut, @Password=Password, @PasswordFormat=PasswordFormat,
            @PasswordSalt=PasswordSalt, @FailedPasswordAttemptCount=FailedPasswordAttemptCount,
		    @FailedPasswordAnswerAttemptCount=FailedPasswordAnswerAttemptCount, @IsApproved=IsApproved,
            @LastActivityDate = LastActivityDate, @LastLoginDate = LastLoginDate
    FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m
    WHERE   LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.ApplicationId = a.ApplicationId    AND
            u.UserId = m.UserId AND
            LOWER(@UserName) = u.LoweredUserName

    IF (@UserId IS NULL)
        RETURN 1

    IF (@IsLockedOut = 1)
        RETURN 99

    SELECT   @Password, @PasswordFormat, @PasswordSalt, @FailedPasswordAttemptCount,
             @FailedPasswordAnswerAttemptCount, @IsApproved, @LastLoginDate, @LastActivityDate

    IF (@UpdateLastLoginActivityDate = 1 AND @IsApproved = 1)
    BEGIN
        UPDATE  dbo.aspnet_Membership
        SET     LastLoginDate = @CurrentTimeUtc
        WHERE   UserId = @UserId

        UPDATE  dbo.aspnet_Users
        SET     LastActivityDate = @CurrentTimeUtc
        WHERE   @UserId = UserId
    END


    RETURN 0
END









GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetUserByEmail]    Script Date: 28/06/2016 13:19:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_GetUserByEmail]
    @ApplicationName  nvarchar(256),
    @Email            nvarchar(256)
AS
BEGIN
    IF( @Email IS NULL )
        SELECT  u.UserName
        FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m
        WHERE   LOWER(@ApplicationName) = a.LoweredApplicationName AND
                u.ApplicationId = a.ApplicationId    AND
                u.UserId = m.UserId AND
                m.ApplicationId = a.ApplicationId AND
                m.LoweredEmail IS NULL
    ELSE
        SELECT  u.UserName
        FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m
        WHERE   LOWER(@ApplicationName) = a.LoweredApplicationName AND
                u.ApplicationId = a.ApplicationId    AND
                u.UserId = m.UserId AND
                m.ApplicationId = a.ApplicationId AND
                LOWER(@Email) = m.LoweredEmail

    IF (@@rowcount = 0)
        RETURN(1)
    RETURN(0)
END









GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetUserByName]    Script Date: 28/06/2016 13:19:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_GetUserByName]
    @ApplicationName      nvarchar(256),
    @UserName             nvarchar(256),
    @CurrentTimeUtc       datetime,
    @UpdateLastActivity   bit = 0
AS
BEGIN
    DECLARE @UserId uniqueidentifier

    IF (@UpdateLastActivity = 1)
    BEGIN
        -- select user ID from aspnet_users table
        SELECT TOP 1 @UserId = u.UserId
        FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m
        WHERE    LOWER(@ApplicationName) = a.LoweredApplicationName AND
                u.ApplicationId = a.ApplicationId    AND
                LOWER(@UserName) = u.LoweredUserName AND u.UserId = m.UserId

        IF (@@ROWCOUNT = 0) -- Username not found
            RETURN -1

        UPDATE   dbo.aspnet_Users
        SET      LastActivityDate = @CurrentTimeUtc
        WHERE    @UserId = UserId

        SELECT m.Email, m.PasswordQuestion, m.Comment, m.IsApproved,
                m.CreateDate, m.LastLoginDate, u.LastActivityDate, m.LastPasswordChangedDate,
                u.UserId, m.IsLockedOut, m.LastLockoutDate
        FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m
        WHERE  @UserId = u.UserId AND u.UserId = m.UserId 
    END
    ELSE
    BEGIN
        SELECT TOP 1 m.Email, m.PasswordQuestion, m.Comment, m.IsApproved,
                m.CreateDate, m.LastLoginDate, u.LastActivityDate, m.LastPasswordChangedDate,
                u.UserId, m.IsLockedOut,m.LastLockoutDate
        FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m
        WHERE    LOWER(@ApplicationName) = a.LoweredApplicationName AND
                u.ApplicationId = a.ApplicationId    AND
                LOWER(@UserName) = u.LoweredUserName AND u.UserId = m.UserId

        IF (@@ROWCOUNT = 0) -- Username not found
            RETURN -1
    END

    RETURN 0
END









GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetUserByUserId]    Script Date: 28/06/2016 13:19:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_GetUserByUserId]
    @UserId               uniqueidentifier,
    @CurrentTimeUtc       datetime,
    @UpdateLastActivity   bit = 0
AS
BEGIN
    IF ( @UpdateLastActivity = 1 )
    BEGIN
        UPDATE   dbo.aspnet_Users
        SET      LastActivityDate = @CurrentTimeUtc
        FROM     dbo.aspnet_Users
        WHERE    @UserId = UserId

        IF ( @@ROWCOUNT = 0 ) -- User ID not found
            RETURN -1
    END

    SELECT  m.Email, m.PasswordQuestion, m.Comment, m.IsApproved,
            m.CreateDate, m.LastLoginDate, u.LastActivityDate,
            m.LastPasswordChangedDate, u.UserName, m.IsLockedOut,
            m.LastLockoutDate
    FROM    dbo.aspnet_Users u, dbo.aspnet_Membership m
    WHERE   @UserId = u.UserId AND u.UserId = m.UserId

    IF ( @@ROWCOUNT = 0 ) -- User ID not found
       RETURN -1

    RETURN 0
END









GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_ResetPassword]    Script Date: 28/06/2016 13:19:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_ResetPassword]
    @ApplicationName             nvarchar(256),
    @UserName                    nvarchar(256),
    @NewPassword                 nvarchar(128),
    @MaxInvalidPasswordAttempts  int,
    @PasswordAttemptWindow       int,
    @PasswordSalt                nvarchar(128),
    @CurrentTimeUtc              datetime,
    @PasswordFormat              int = 0,
    @PasswordAnswer              nvarchar(128) = NULL
AS
BEGIN
    DECLARE @IsLockedOut                            bit
    DECLARE @LastLockoutDate                        datetime
    DECLARE @FailedPasswordAttemptCount             int
    DECLARE @FailedPasswordAttemptWindowStart       datetime
    DECLARE @FailedPasswordAnswerAttemptCount       int
    DECLARE @FailedPasswordAnswerAttemptWindowStart datetime

    DECLARE @UserId                                 uniqueidentifier
    SET     @UserId = NULL

    DECLARE @ErrorCode     int
    SET @ErrorCode = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
	    BEGIN TRANSACTION
	    SET @TranStarted = 1
    END
    ELSE
    	SET @TranStarted = 0

    SELECT  @UserId = u.UserId
    FROM    dbo.aspnet_Users u, dbo.aspnet_Applications a, dbo.aspnet_Membership m
    WHERE   LoweredUserName = LOWER(@UserName) AND
            u.ApplicationId = a.ApplicationId  AND
            LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.UserId = m.UserId

    IF ( @UserId IS NULL )
    BEGIN
        SET @ErrorCode = 1
        GOTO Cleanup
    END

    SELECT @IsLockedOut = IsLockedOut,
           @LastLockoutDate = LastLockoutDate,
           @FailedPasswordAttemptCount = FailedPasswordAttemptCount,
           @FailedPasswordAttemptWindowStart = FailedPasswordAttemptWindowStart,
           @FailedPasswordAnswerAttemptCount = FailedPasswordAnswerAttemptCount,
           @FailedPasswordAnswerAttemptWindowStart = FailedPasswordAnswerAttemptWindowStart
    FROM dbo.aspnet_Membership WITH ( UPDLOCK )
    WHERE @UserId = UserId

    IF( @IsLockedOut = 1 )
    BEGIN
        SET @ErrorCode = 99
        GOTO Cleanup
    END

    UPDATE dbo.aspnet_Membership
    SET    Password = @NewPassword,
           LastPasswordChangedDate = @CurrentTimeUtc,
           PasswordFormat = @PasswordFormat,
           PasswordSalt = @PasswordSalt
    WHERE  @UserId = UserId AND
           ( ( @PasswordAnswer IS NULL ) OR ( LOWER( PasswordAnswer ) = LOWER( @PasswordAnswer ) ) )

    IF ( @@ROWCOUNT = 0 )
        BEGIN
            IF( @CurrentTimeUtc > DATEADD( minute, @PasswordAttemptWindow, @FailedPasswordAnswerAttemptWindowStart ) )
            BEGIN
                SET @FailedPasswordAnswerAttemptWindowStart = @CurrentTimeUtc
                SET @FailedPasswordAnswerAttemptCount = 1
            END
            ELSE
            BEGIN
                SET @FailedPasswordAnswerAttemptWindowStart = @CurrentTimeUtc
                SET @FailedPasswordAnswerAttemptCount = @FailedPasswordAnswerAttemptCount + 1
            END

            BEGIN
                IF( @FailedPasswordAnswerAttemptCount >= @MaxInvalidPasswordAttempts )
                BEGIN
                    SET @IsLockedOut = 1
                    SET @LastLockoutDate = @CurrentTimeUtc
                END
            END

            SET @ErrorCode = 3
        END
    ELSE
        BEGIN
            IF( @FailedPasswordAnswerAttemptCount > 0 )
            BEGIN
                SET @FailedPasswordAnswerAttemptCount = 0
                SET @FailedPasswordAnswerAttemptWindowStart = CONVERT( datetime, '17540101', 112 )
            END
        END

    IF( NOT ( @PasswordAnswer IS NULL ) )
    BEGIN
        UPDATE dbo.aspnet_Membership
        SET IsLockedOut = @IsLockedOut, LastLockoutDate = @LastLockoutDate,
            FailedPasswordAttemptCount = @FailedPasswordAttemptCount,
            FailedPasswordAttemptWindowStart = @FailedPasswordAttemptWindowStart,
            FailedPasswordAnswerAttemptCount = @FailedPasswordAnswerAttemptCount,
            FailedPasswordAnswerAttemptWindowStart = @FailedPasswordAnswerAttemptWindowStart
        WHERE @UserId = UserId

        IF( @@ERROR <> 0 )
        BEGIN
            SET @ErrorCode = -1
            GOTO Cleanup
        END
    END

    IF( @TranStarted = 1 )
    BEGIN
	SET @TranStarted = 0
	COMMIT TRANSACTION
    END

    RETURN @ErrorCode

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
    	ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode

END









GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_SetPassword]    Script Date: 28/06/2016 13:19:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_SetPassword]
    @ApplicationName  nvarchar(256),
    @UserName         nvarchar(256),
    @NewPassword      nvarchar(128),
    @PasswordSalt     nvarchar(128),
    @CurrentTimeUtc   datetime,
    @PasswordFormat   int = 0
AS
BEGIN
    DECLARE @UserId uniqueidentifier
    SELECT  @UserId = NULL
    SELECT  @UserId = u.UserId
    FROM    dbo.aspnet_Users u, dbo.aspnet_Applications a, dbo.aspnet_Membership m
    WHERE   LoweredUserName = LOWER(@UserName) AND
            u.ApplicationId = a.ApplicationId  AND
            LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.UserId = m.UserId

    IF (@UserId IS NULL)
        RETURN(1)

    UPDATE dbo.aspnet_Membership
    SET Password = @NewPassword, PasswordFormat = @PasswordFormat, PasswordSalt = @PasswordSalt,
        LastPasswordChangedDate = @CurrentTimeUtc
    WHERE @UserId = UserId
    RETURN(0)
END









GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_UnlockUser]    Script Date: 28/06/2016 13:19:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_UnlockUser]
    @ApplicationName                         nvarchar(256),
    @UserName                                nvarchar(256)
AS
BEGIN
    DECLARE @UserId uniqueidentifier
    SELECT  @UserId = NULL
    SELECT  @UserId = u.UserId
    FROM    dbo.aspnet_Users u, dbo.aspnet_Applications a, dbo.aspnet_Membership m
    WHERE   LoweredUserName = LOWER(@UserName) AND
            u.ApplicationId = a.ApplicationId  AND
            LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.UserId = m.UserId

    IF ( @UserId IS NULL )
        RETURN 1

    UPDATE dbo.aspnet_Membership
    SET IsLockedOut = 0,
        FailedPasswordAttemptCount = 0,
        FailedPasswordAttemptWindowStart = CONVERT( datetime, '17540101', 112 ),
        FailedPasswordAnswerAttemptCount = 0,
        FailedPasswordAnswerAttemptWindowStart = CONVERT( datetime, '17540101', 112 ),
        LastLockoutDate = CONVERT( datetime, '17540101', 112 )
    WHERE @UserId = UserId

    RETURN 0
END









GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_UpdateUser]    Script Date: 28/06/2016 13:19:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_UpdateUser]
    @ApplicationName      nvarchar(256),
    @UserName             nvarchar(256),
    @Email                nvarchar(256),
    @Comment              ntext,
    @IsApproved           bit,
    @LastLoginDate        datetime,
    @LastActivityDate     datetime,
    @UniqueEmail          int,
    @CurrentTimeUtc       datetime
AS
BEGIN
    DECLARE @UserId uniqueidentifier
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @UserId = NULL
    SELECT  @UserId = u.UserId, @ApplicationId = a.ApplicationId
    FROM    dbo.aspnet_Users u, dbo.aspnet_Applications a, dbo.aspnet_Membership m
    WHERE   LoweredUserName = LOWER(@UserName) AND
            u.ApplicationId = a.ApplicationId  AND
            LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.UserId = m.UserId

    IF (@UserId IS NULL)
        RETURN(1)

    IF (@UniqueEmail = 1)
    BEGIN
        IF (EXISTS (SELECT *
                    FROM  dbo.aspnet_Membership WITH (UPDLOCK, HOLDLOCK)
                    WHERE ApplicationId = @ApplicationId  AND @UserId <> UserId AND LoweredEmail = LOWER(@Email)))
        BEGIN
            RETURN(7)
        END
    END

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
	    BEGIN TRANSACTION
	    SET @TranStarted = 1
    END
    ELSE
	SET @TranStarted = 0

    UPDATE dbo.aspnet_Users WITH (ROWLOCK)
    SET
         LastActivityDate = @LastActivityDate
    WHERE
       @UserId = UserId

    IF( @@ERROR <> 0 )
        GOTO Cleanup

    UPDATE dbo.aspnet_Membership WITH (ROWLOCK)
    SET
         Email            = @Email,
         LoweredEmail     = LOWER(@Email),
         Comment          = @Comment,
         IsApproved       = @IsApproved,
         LastLoginDate    = @LastLoginDate
    WHERE
       @UserId = UserId

    IF( @@ERROR <> 0 )
        GOTO Cleanup

    IF( @TranStarted = 1 )
    BEGIN
	SET @TranStarted = 0
	COMMIT TRANSACTION
    END

    RETURN 0

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
    	ROLLBACK TRANSACTION
    END

    RETURN -1
END









GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_UpdateUserInfo]    Script Date: 28/06/2016 13:19:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_UpdateUserInfo]
    @ApplicationName                nvarchar(256),
    @UserName                       nvarchar(256),
    @IsPasswordCorrect              bit,
    @UpdateLastLoginActivityDate    bit,
    @MaxInvalidPasswordAttempts     int,
    @PasswordAttemptWindow          int,
    @CurrentTimeUtc                 datetime,
    @LastLoginDate                  datetime,
    @LastActivityDate               datetime
AS
BEGIN
    DECLARE @UserId                                 uniqueidentifier
    DECLARE @IsApproved                             bit
    DECLARE @IsLockedOut                            bit
    DECLARE @LastLockoutDate                        datetime
    DECLARE @FailedPasswordAttemptCount             int
    DECLARE @FailedPasswordAttemptWindowStart       datetime
    DECLARE @FailedPasswordAnswerAttemptCount       int
    DECLARE @FailedPasswordAnswerAttemptWindowStart datetime

    DECLARE @ErrorCode     int
    SET @ErrorCode = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
	    BEGIN TRANSACTION
	    SET @TranStarted = 1
    END
    ELSE
    	SET @TranStarted = 0

    SELECT  @UserId = u.UserId,
            @IsApproved = m.IsApproved,
            @IsLockedOut = m.IsLockedOut,
            @LastLockoutDate = m.LastLockoutDate,
            @FailedPasswordAttemptCount = m.FailedPasswordAttemptCount,
            @FailedPasswordAttemptWindowStart = m.FailedPasswordAttemptWindowStart,
            @FailedPasswordAnswerAttemptCount = m.FailedPasswordAnswerAttemptCount,
            @FailedPasswordAnswerAttemptWindowStart = m.FailedPasswordAnswerAttemptWindowStart
    FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u WITH ( UPDLOCK, ROWLOCK ), dbo.aspnet_Membership m WITH ( UPDLOCK, ROWLOCK )
    WHERE   LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.ApplicationId = a.ApplicationId    AND
            u.UserId = m.UserId AND
            LOWER(@UserName) = u.LoweredUserName

    IF ( @@rowcount = 0 )
    BEGIN
        SET @ErrorCode = 1
        GOTO Cleanup
    END

    IF( @IsLockedOut = 1 )
    BEGIN
        GOTO Cleanup
    END

    IF( @IsPasswordCorrect = 0 )
    BEGIN
        IF( @CurrentTimeUtc > DATEADD( minute, @PasswordAttemptWindow, @FailedPasswordAttemptWindowStart ) )
        BEGIN
            SET @FailedPasswordAttemptWindowStart = @CurrentTimeUtc
            SET @FailedPasswordAttemptCount = 1
        END
        ELSE
        BEGIN
            SET @FailedPasswordAttemptWindowStart = @CurrentTimeUtc
            SET @FailedPasswordAttemptCount = @FailedPasswordAttemptCount + 1
        END

        BEGIN
            IF( @FailedPasswordAttemptCount >= @MaxInvalidPasswordAttempts )
            BEGIN
                SET @IsLockedOut = 1
                SET @LastLockoutDate = @CurrentTimeUtc
            END
        END
    END
    ELSE
    BEGIN
        IF( @FailedPasswordAttemptCount > 0 OR @FailedPasswordAnswerAttemptCount > 0 )
        BEGIN
            SET @FailedPasswordAttemptCount = 0
            SET @FailedPasswordAttemptWindowStart = CONVERT( datetime, '17540101', 112 )
            SET @FailedPasswordAnswerAttemptCount = 0
            SET @FailedPasswordAnswerAttemptWindowStart = CONVERT( datetime, '17540101', 112 )
            SET @LastLockoutDate = CONVERT( datetime, '17540101', 112 )
        END
    END

    IF( @UpdateLastLoginActivityDate = 1 )
    BEGIN
        UPDATE  dbo.aspnet_Users WITH (ROWLOCK)
        SET     LastActivityDate = @LastActivityDate
        WHERE   @UserId = UserId

        IF( @@ERROR <> 0 )
        BEGIN
            SET @ErrorCode = -1
            GOTO Cleanup
        END

        UPDATE  dbo.aspnet_Membership
        SET     LastLoginDate = @LastLoginDate
        WHERE   UserId = @UserId

        IF( @@ERROR <> 0 )
        BEGIN
            SET @ErrorCode = -1
            GOTO Cleanup
        END
    END


    UPDATE dbo.aspnet_Membership WITH (ROWLOCK)
    SET IsLockedOut = @IsLockedOut, LastLockoutDate = @LastLockoutDate,
        FailedPasswordAttemptCount = @FailedPasswordAttemptCount,
        FailedPasswordAttemptWindowStart = @FailedPasswordAttemptWindowStart,
        FailedPasswordAnswerAttemptCount = @FailedPasswordAnswerAttemptCount,
        FailedPasswordAnswerAttemptWindowStart = @FailedPasswordAnswerAttemptWindowStart
    WHERE @UserId = UserId

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF( @TranStarted = 1 )
    BEGIN
	SET @TranStarted = 0
	COMMIT TRANSACTION
    END

    RETURN @ErrorCode

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
    	ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode

END









GO
/****** Object:  StoredProcedure [dbo].[aspnet_Paths_CreatePath]    Script Date: 28/06/2016 13:19:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Paths_CreatePath]
    @ApplicationId UNIQUEIDENTIFIER,
    @Path           NVARCHAR(256),
    @PathId         UNIQUEIDENTIFIER OUTPUT
AS
BEGIN
    BEGIN TRANSACTION
    IF (NOT EXISTS(SELECT * FROM dbo.aspnet_Paths WHERE LoweredPath = LOWER(@Path) AND ApplicationId = @ApplicationId))
    BEGIN
        INSERT dbo.aspnet_Paths (ApplicationId, Path, LoweredPath) VALUES (@ApplicationId, @Path, LOWER(@Path))
    END
    COMMIT TRANSACTION
    SELECT @PathId = PathId FROM dbo.aspnet_Paths WHERE LOWER(@Path) = LoweredPath AND ApplicationId = @ApplicationId
END









GO
/****** Object:  StoredProcedure [dbo].[aspnet_Personalization_GetApplicationId]    Script Date: 28/06/2016 13:19:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Personalization_GetApplicationId] (
    @ApplicationName NVARCHAR(256),
    @ApplicationId UNIQUEIDENTIFIER OUT)
AS
BEGIN
    SELECT @ApplicationId = ApplicationId FROM dbo.aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
END









GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAdministration_DeleteAllState]    Script Date: 28/06/2016 13:19:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationAdministration_DeleteAllState] (
    @AllUsersScope bit,
    @ApplicationName NVARCHAR(256),
    @Count int OUT)
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
        SELECT @Count = 0
    ELSE
    BEGIN
        IF (@AllUsersScope = 1)
            DELETE FROM aspnet_PersonalizationAllUsers
            WHERE PathId IN
               (SELECT Paths.PathId
                FROM dbo.aspnet_Paths Paths
                WHERE Paths.ApplicationId = @ApplicationId)
        ELSE
            DELETE FROM aspnet_PersonalizationPerUser
            WHERE PathId IN
               (SELECT Paths.PathId
                FROM dbo.aspnet_Paths Paths
                WHERE Paths.ApplicationId = @ApplicationId)

        SELECT @Count = @@ROWCOUNT
    END
END









GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAdministration_FindState]    Script Date: 28/06/2016 13:19:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationAdministration_FindState] (
    @AllUsersScope bit,
    @ApplicationName NVARCHAR(256),
    @PageIndex              INT,
    @PageSize               INT,
    @Path NVARCHAR(256) = NULL,
    @UserName NVARCHAR(256) = NULL,
    @InactiveSinceDate DATETIME = NULL)
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
        RETURN

    -- Set the page bounds
    DECLARE @PageLowerBound INT
    DECLARE @PageUpperBound INT
    DECLARE @TotalRecords   INT
    SET @PageLowerBound = @PageSize * @PageIndex
    SET @PageUpperBound = @PageSize - 1 + @PageLowerBound

    -- Create a temp table to store the selected results
    CREATE TABLE #PageIndex (
        IndexId int IDENTITY (0, 1) NOT NULL,
        ItemId UNIQUEIDENTIFIER
    )

    IF (@AllUsersScope = 1)
    BEGIN
        -- Insert into our temp table
        INSERT INTO #PageIndex (ItemId)
        SELECT Paths.PathId
        FROM dbo.aspnet_Paths Paths,
             ((SELECT Paths.PathId
               FROM dbo.aspnet_PersonalizationAllUsers AllUsers, dbo.aspnet_Paths Paths
               WHERE Paths.ApplicationId = @ApplicationId
                      AND AllUsers.PathId = Paths.PathId
                      AND (@Path IS NULL OR Paths.LoweredPath LIKE LOWER(@Path))
              ) AS SharedDataPerPath
              FULL OUTER JOIN
              (SELECT DISTINCT Paths.PathId
               FROM dbo.aspnet_PersonalizationPerUser PerUser, dbo.aspnet_Paths Paths
               WHERE Paths.ApplicationId = @ApplicationId
                      AND PerUser.PathId = Paths.PathId
                      AND (@Path IS NULL OR Paths.LoweredPath LIKE LOWER(@Path))
              ) AS UserDataPerPath
              ON SharedDataPerPath.PathId = UserDataPerPath.PathId
             )
        WHERE Paths.PathId = SharedDataPerPath.PathId OR Paths.PathId = UserDataPerPath.PathId
        ORDER BY Paths.Path ASC

        SELECT @TotalRecords = @@ROWCOUNT

        SELECT Paths.Path,
               SharedDataPerPath.LastUpdatedDate,
               SharedDataPerPath.SharedDataLength,
               UserDataPerPath.UserDataLength,
               UserDataPerPath.UserCount
        FROM dbo.aspnet_Paths Paths,
             ((SELECT PageIndex.ItemId AS PathId,
                      AllUsers.LastUpdatedDate AS LastUpdatedDate,
                      DATALENGTH(AllUsers.PageSettings) AS SharedDataLength
               FROM dbo.aspnet_PersonalizationAllUsers AllUsers, #PageIndex PageIndex
               WHERE AllUsers.PathId = PageIndex.ItemId
                     AND PageIndex.IndexId >= @PageLowerBound AND PageIndex.IndexId <= @PageUpperBound
              ) AS SharedDataPerPath
              FULL OUTER JOIN
              (SELECT PageIndex.ItemId AS PathId,
                      SUM(DATALENGTH(PerUser.PageSettings)) AS UserDataLength,
                      COUNT(*) AS UserCount
               FROM aspnet_PersonalizationPerUser PerUser, #PageIndex PageIndex
               WHERE PerUser.PathId = PageIndex.ItemId
                     AND PageIndex.IndexId >= @PageLowerBound AND PageIndex.IndexId <= @PageUpperBound
               GROUP BY PageIndex.ItemId
              ) AS UserDataPerPath
              ON SharedDataPerPath.PathId = UserDataPerPath.PathId
             )
        WHERE Paths.PathId = SharedDataPerPath.PathId OR Paths.PathId = UserDataPerPath.PathId
        ORDER BY Paths.Path ASC
    END
    ELSE
    BEGIN
        -- Insert into our temp table
        INSERT INTO #PageIndex (ItemId)
        SELECT PerUser.Id
        FROM dbo.aspnet_PersonalizationPerUser PerUser, dbo.aspnet_Users Users, dbo.aspnet_Paths Paths
        WHERE Paths.ApplicationId = @ApplicationId
              AND PerUser.UserId = Users.UserId
              AND PerUser.PathId = Paths.PathId
              AND (@Path IS NULL OR Paths.LoweredPath LIKE LOWER(@Path))
              AND (@UserName IS NULL OR Users.LoweredUserName LIKE LOWER(@UserName))
              AND (@InactiveSinceDate IS NULL OR Users.LastActivityDate <= @InactiveSinceDate)
        ORDER BY Paths.Path ASC, Users.UserName ASC

        SELECT @TotalRecords = @@ROWCOUNT

        SELECT Paths.Path, PerUser.LastUpdatedDate, DATALENGTH(PerUser.PageSettings), Users.UserName, Users.LastActivityDate
        FROM dbo.aspnet_PersonalizationPerUser PerUser, dbo.aspnet_Users Users, dbo.aspnet_Paths Paths, #PageIndex PageIndex
        WHERE PerUser.Id = PageIndex.ItemId
              AND PerUser.UserId = Users.UserId
              AND PerUser.PathId = Paths.PathId
              AND PageIndex.IndexId >= @PageLowerBound AND PageIndex.IndexId <= @PageUpperBound
        ORDER BY Paths.Path ASC, Users.UserName ASC
    END

    RETURN @TotalRecords
END









GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAdministration_GetCountOfState]    Script Date: 28/06/2016 13:19:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationAdministration_GetCountOfState] (
    @Count int OUT,
    @AllUsersScope bit,
    @ApplicationName NVARCHAR(256),
    @Path NVARCHAR(256) = NULL,
    @UserName NVARCHAR(256) = NULL,
    @InactiveSinceDate DATETIME = NULL)
AS
BEGIN

    DECLARE @ApplicationId UNIQUEIDENTIFIER
    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
        SELECT @Count = 0
    ELSE
        IF (@AllUsersScope = 1)
            SELECT @Count = COUNT(*)
            FROM dbo.aspnet_PersonalizationAllUsers AllUsers, dbo.aspnet_Paths Paths
            WHERE Paths.ApplicationId = @ApplicationId
                  AND AllUsers.PathId = Paths.PathId
                  AND (@Path IS NULL OR Paths.LoweredPath LIKE LOWER(@Path))
        ELSE
            SELECT @Count = COUNT(*)
            FROM dbo.aspnet_PersonalizationPerUser PerUser, dbo.aspnet_Users Users, dbo.aspnet_Paths Paths
            WHERE Paths.ApplicationId = @ApplicationId
                  AND PerUser.UserId = Users.UserId
                  AND PerUser.PathId = Paths.PathId
                  AND (@Path IS NULL OR Paths.LoweredPath LIKE LOWER(@Path))
                  AND (@UserName IS NULL OR Users.LoweredUserName LIKE LOWER(@UserName))
                  AND (@InactiveSinceDate IS NULL OR Users.LastActivityDate <= @InactiveSinceDate)
END









GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAdministration_ResetSharedState]    Script Date: 28/06/2016 13:19:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationAdministration_ResetSharedState] (
    @Count int OUT,
    @ApplicationName NVARCHAR(256),
    @Path NVARCHAR(256))
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
        SELECT @Count = 0
    ELSE
    BEGIN
        DELETE FROM dbo.aspnet_PersonalizationAllUsers
        WHERE PathId IN
            (SELECT AllUsers.PathId
             FROM dbo.aspnet_PersonalizationAllUsers AllUsers, dbo.aspnet_Paths Paths
             WHERE Paths.ApplicationId = @ApplicationId
                   AND AllUsers.PathId = Paths.PathId
                   AND Paths.LoweredPath = LOWER(@Path))

        SELECT @Count = @@ROWCOUNT
    END
END









GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAdministration_ResetUserState]    Script Date: 28/06/2016 13:19:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationAdministration_ResetUserState] (
    @Count                  int                 OUT,
    @ApplicationName        NVARCHAR(256),
    @InactiveSinceDate      DATETIME            = NULL,
    @UserName               NVARCHAR(256)       = NULL,
    @Path                   NVARCHAR(256)       = NULL)
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
        SELECT @Count = 0
    ELSE
    BEGIN
        DELETE FROM dbo.aspnet_PersonalizationPerUser
        WHERE Id IN (SELECT PerUser.Id
                     FROM dbo.aspnet_PersonalizationPerUser PerUser, dbo.aspnet_Users Users, dbo.aspnet_Paths Paths
                     WHERE Paths.ApplicationId = @ApplicationId
                           AND PerUser.UserId = Users.UserId
                           AND PerUser.PathId = Paths.PathId
                           AND (@InactiveSinceDate IS NULL OR Users.LastActivityDate <= @InactiveSinceDate)
                           AND (@UserName IS NULL OR Users.LoweredUserName = LOWER(@UserName))
                           AND (@Path IS NULL OR Paths.LoweredPath = LOWER(@Path)))

        SELECT @Count = @@ROWCOUNT
    END
END









GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAllUsers_GetPageSettings]    Script Date: 28/06/2016 13:19:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationAllUsers_GetPageSettings] (
    @ApplicationName  NVARCHAR(256),
    @Path              NVARCHAR(256))
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    DECLARE @PathId UNIQUEIDENTIFIER

    SELECT @ApplicationId = NULL
    SELECT @PathId = NULL

    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
    BEGIN
        RETURN
    END

    SELECT @PathId = u.PathId FROM dbo.aspnet_Paths u WHERE u.ApplicationId = @ApplicationId AND u.LoweredPath = LOWER(@Path)
    IF (@PathId IS NULL)
    BEGIN
        RETURN
    END

    SELECT p.PageSettings FROM dbo.aspnet_PersonalizationAllUsers p WHERE p.PathId = @PathId
END









GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAllUsers_ResetPageSettings]    Script Date: 28/06/2016 13:19:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationAllUsers_ResetPageSettings] (
    @ApplicationName  NVARCHAR(256),
    @Path              NVARCHAR(256))
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    DECLARE @PathId UNIQUEIDENTIFIER

    SELECT @ApplicationId = NULL
    SELECT @PathId = NULL

    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
    BEGIN
        RETURN
    END

    SELECT @PathId = u.PathId FROM dbo.aspnet_Paths u WHERE u.ApplicationId = @ApplicationId AND u.LoweredPath = LOWER(@Path)
    IF (@PathId IS NULL)
    BEGIN
        RETURN
    END

    DELETE FROM dbo.aspnet_PersonalizationAllUsers WHERE PathId = @PathId
    RETURN 0
END









GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAllUsers_SetPageSettings]    Script Date: 28/06/2016 13:19:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationAllUsers_SetPageSettings] (
    @ApplicationName  NVARCHAR(256),
    @Path             NVARCHAR(256),
    @PageSettings     IMAGE,
    @CurrentTimeUtc   DATETIME)
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    DECLARE @PathId UNIQUEIDENTIFIER

    SELECT @ApplicationId = NULL
    SELECT @PathId = NULL

    EXEC dbo.aspnet_Applications_CreateApplication @ApplicationName, @ApplicationId OUTPUT

    SELECT @PathId = u.PathId FROM dbo.aspnet_Paths u WHERE u.ApplicationId = @ApplicationId AND u.LoweredPath = LOWER(@Path)
    IF (@PathId IS NULL)
    BEGIN
        EXEC dbo.aspnet_Paths_CreatePath @ApplicationId, @Path, @PathId OUTPUT
    END

    IF (EXISTS(SELECT PathId FROM dbo.aspnet_PersonalizationAllUsers WHERE PathId = @PathId))
        UPDATE dbo.aspnet_PersonalizationAllUsers SET PageSettings = @PageSettings, LastUpdatedDate = @CurrentTimeUtc WHERE PathId = @PathId
    ELSE
        INSERT INTO dbo.aspnet_PersonalizationAllUsers(PathId, PageSettings, LastUpdatedDate) VALUES (@PathId, @PageSettings, @CurrentTimeUtc)
    RETURN 0
END









GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationPerUser_GetPageSettings]    Script Date: 28/06/2016 13:19:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationPerUser_GetPageSettings] (
    @ApplicationName  NVARCHAR(256),
    @UserName         NVARCHAR(256),
    @Path             NVARCHAR(256),
    @CurrentTimeUtc   DATETIME)
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    DECLARE @PathId UNIQUEIDENTIFIER
    DECLARE @UserId UNIQUEIDENTIFIER

    SELECT @ApplicationId = NULL
    SELECT @PathId = NULL
    SELECT @UserId = NULL

    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
    BEGIN
        RETURN
    END

    SELECT @PathId = u.PathId FROM dbo.aspnet_Paths u WHERE u.ApplicationId = @ApplicationId AND u.LoweredPath = LOWER(@Path)
    IF (@PathId IS NULL)
    BEGIN
        RETURN
    END

    SELECT @UserId = u.UserId FROM dbo.aspnet_Users u WHERE u.ApplicationId = @ApplicationId AND u.LoweredUserName = LOWER(@UserName)
    IF (@UserId IS NULL)
    BEGIN
        RETURN
    END

    UPDATE   dbo.aspnet_Users WITH (ROWLOCK)
    SET      LastActivityDate = @CurrentTimeUtc
    WHERE    UserId = @UserId
    IF (@@ROWCOUNT = 0) -- Username not found
        RETURN

    SELECT p.PageSettings FROM dbo.aspnet_PersonalizationPerUser p WHERE p.PathId = @PathId AND p.UserId = @UserId
END









GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationPerUser_ResetPageSettings]    Script Date: 28/06/2016 13:19:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationPerUser_ResetPageSettings] (
    @ApplicationName  NVARCHAR(256),
    @UserName         NVARCHAR(256),
    @Path             NVARCHAR(256),
    @CurrentTimeUtc   DATETIME)
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    DECLARE @PathId UNIQUEIDENTIFIER
    DECLARE @UserId UNIQUEIDENTIFIER

    SELECT @ApplicationId = NULL
    SELECT @PathId = NULL
    SELECT @UserId = NULL

    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
    BEGIN
        RETURN
    END

    SELECT @PathId = u.PathId FROM dbo.aspnet_Paths u WHERE u.ApplicationId = @ApplicationId AND u.LoweredPath = LOWER(@Path)
    IF (@PathId IS NULL)
    BEGIN
        RETURN
    END

    SELECT @UserId = u.UserId FROM dbo.aspnet_Users u WHERE u.ApplicationId = @ApplicationId AND u.LoweredUserName = LOWER(@UserName)
    IF (@UserId IS NULL)
    BEGIN
        RETURN
    END

    UPDATE   dbo.aspnet_Users WITH (ROWLOCK)
    SET      LastActivityDate = @CurrentTimeUtc
    WHERE    UserId = @UserId
    IF (@@ROWCOUNT = 0) -- Username not found
        RETURN

    DELETE FROM dbo.aspnet_PersonalizationPerUser WHERE PathId = @PathId AND UserId = @UserId
    RETURN 0
END









GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationPerUser_SetPageSettings]    Script Date: 28/06/2016 13:19:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationPerUser_SetPageSettings] (
    @ApplicationName  NVARCHAR(256),
    @UserName         NVARCHAR(256),
    @Path             NVARCHAR(256),
    @PageSettings     IMAGE,
    @CurrentTimeUtc   DATETIME)
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    DECLARE @PathId UNIQUEIDENTIFIER
    DECLARE @UserId UNIQUEIDENTIFIER

    SELECT @ApplicationId = NULL
    SELECT @PathId = NULL
    SELECT @UserId = NULL

    EXEC dbo.aspnet_Applications_CreateApplication @ApplicationName, @ApplicationId OUTPUT

    SELECT @PathId = u.PathId FROM dbo.aspnet_Paths u WHERE u.ApplicationId = @ApplicationId AND u.LoweredPath = LOWER(@Path)
    IF (@PathId IS NULL)
    BEGIN
        EXEC dbo.aspnet_Paths_CreatePath @ApplicationId, @Path, @PathId OUTPUT
    END

    SELECT @UserId = u.UserId FROM dbo.aspnet_Users u WHERE u.ApplicationId = @ApplicationId AND u.LoweredUserName = LOWER(@UserName)
    IF (@UserId IS NULL)
    BEGIN
        EXEC dbo.aspnet_Users_CreateUser @ApplicationId, @UserName, 0, @CurrentTimeUtc, @UserId OUTPUT
    END

    UPDATE   dbo.aspnet_Users WITH (ROWLOCK)
    SET      LastActivityDate = @CurrentTimeUtc
    WHERE    UserId = @UserId
    IF (@@ROWCOUNT = 0) -- Username not found
        RETURN

    IF (EXISTS(SELECT PathId FROM dbo.aspnet_PersonalizationPerUser WHERE UserId = @UserId AND PathId = @PathId))
        UPDATE dbo.aspnet_PersonalizationPerUser SET PageSettings = @PageSettings, LastUpdatedDate = @CurrentTimeUtc WHERE UserId = @UserId AND PathId = @PathId
    ELSE
        INSERT INTO dbo.aspnet_PersonalizationPerUser(UserId, PathId, PageSettings, LastUpdatedDate) VALUES (@UserId, @PathId, @PageSettings, @CurrentTimeUtc)
    RETURN 0
END









GO
/****** Object:  StoredProcedure [dbo].[aspnet_Profile_DeleteInactiveProfiles]    Script Date: 28/06/2016 13:19:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_Profile_DeleteInactiveProfiles]
    @ApplicationName        nvarchar(256),
    @ProfileAuthOptions     int,
    @InactiveSinceDate      datetime
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
    BEGIN
        SELECT  0
        RETURN
    END

    DELETE
    FROM    dbo.aspnet_Profile
    WHERE   UserId IN
            (   SELECT  UserId
                FROM    dbo.aspnet_Users u
                WHERE   ApplicationId = @ApplicationId
                        AND (LastActivityDate <= @InactiveSinceDate)
                        AND (
                                (@ProfileAuthOptions = 2)
                             OR (@ProfileAuthOptions = 0 AND IsAnonymous = 1)
                             OR (@ProfileAuthOptions = 1 AND IsAnonymous = 0)
                            )
            )

    SELECT  @@ROWCOUNT
END









GO
/****** Object:  StoredProcedure [dbo].[aspnet_Profile_DeleteProfiles]    Script Date: 28/06/2016 13:19:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_Profile_DeleteProfiles]
    @ApplicationName        nvarchar(256),
    @UserNames              nvarchar(4000)
AS
BEGIN
    DECLARE @UserName     nvarchar(256)
    DECLARE @CurrentPos   int
    DECLARE @NextPos      int
    DECLARE @NumDeleted   int
    DECLARE @DeletedUser  int
    DECLARE @TranStarted  bit
    DECLARE @ErrorCode    int

    SET @ErrorCode = 0
    SET @CurrentPos = 1
    SET @NumDeleted = 0
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
        BEGIN TRANSACTION
        SET @TranStarted = 1
    END
    ELSE
    	SET @TranStarted = 0

    WHILE (@CurrentPos <= LEN(@UserNames))
    BEGIN
        SELECT @NextPos = CHARINDEX(N',', @UserNames,  @CurrentPos)
        IF (@NextPos = 0 OR @NextPos IS NULL)
            SELECT @NextPos = LEN(@UserNames) + 1

        SELECT @UserName = SUBSTRING(@UserNames, @CurrentPos, @NextPos - @CurrentPos)
        SELECT @CurrentPos = @NextPos+1

        IF (LEN(@UserName) > 0)
        BEGIN
            SELECT @DeletedUser = 0
            EXEC dbo.aspnet_Users_DeleteUser @ApplicationName, @UserName, 4, @DeletedUser OUTPUT
            IF( @@ERROR <> 0 )
            BEGIN
                SET @ErrorCode = -1
                GOTO Cleanup
            END
            IF (@DeletedUser <> 0)
                SELECT @NumDeleted = @NumDeleted + 1
        END
    END
    SELECT @NumDeleted
    IF (@TranStarted = 1)
    BEGIN
    	SET @TranStarted = 0
    	COMMIT TRANSACTION
    END
    SET @TranStarted = 0

    RETURN 0

Cleanup:
    IF (@TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
    	ROLLBACK TRANSACTION
    END
    RETURN @ErrorCode
END









GO
/****** Object:  StoredProcedure [dbo].[aspnet_Profile_GetNumberOfInactiveProfiles]    Script Date: 28/06/2016 13:19:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_Profile_GetNumberOfInactiveProfiles]
    @ApplicationName        nvarchar(256),
    @ProfileAuthOptions     int,
    @InactiveSinceDate      datetime
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
    BEGIN
        SELECT 0
        RETURN
    END

    SELECT  COUNT(*)
    FROM    dbo.aspnet_Users u, dbo.aspnet_Profile p
    WHERE   ApplicationId = @ApplicationId
        AND u.UserId = p.UserId
        AND (LastActivityDate <= @InactiveSinceDate)
        AND (
                (@ProfileAuthOptions = 2)
                OR (@ProfileAuthOptions = 0 AND IsAnonymous = 1)
                OR (@ProfileAuthOptions = 1 AND IsAnonymous = 0)
            )
END









GO
/****** Object:  StoredProcedure [dbo].[aspnet_Profile_GetProfiles]    Script Date: 28/06/2016 13:19:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_Profile_GetProfiles]
    @ApplicationName        nvarchar(256),
    @ProfileAuthOptions     int,
    @PageIndex              int,
    @PageSize               int,
    @UserNameToMatch        nvarchar(256) = NULL,
    @InactiveSinceDate      datetime      = NULL
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN

    -- Set the page bounds
    DECLARE @PageLowerBound int
    DECLARE @PageUpperBound int
    DECLARE @TotalRecords   int
    SET @PageLowerBound = @PageSize * @PageIndex
    SET @PageUpperBound = @PageSize - 1 + @PageLowerBound

    -- Create a temp table TO store the select results
    CREATE TABLE #PageIndexForUsers
    (
        IndexId int IDENTITY (0, 1) NOT NULL,
        UserId uniqueidentifier
    )

    -- Insert into our temp table
    INSERT INTO #PageIndexForUsers (UserId)
        SELECT  u.UserId
        FROM    dbo.aspnet_Users u, dbo.aspnet_Profile p
        WHERE   ApplicationId = @ApplicationId
            AND u.UserId = p.UserId
            AND (@InactiveSinceDate IS NULL OR LastActivityDate <= @InactiveSinceDate)
            AND (     (@ProfileAuthOptions = 2)
                   OR (@ProfileAuthOptions = 0 AND IsAnonymous = 1)
                   OR (@ProfileAuthOptions = 1 AND IsAnonymous = 0)
                 )
            AND (@UserNameToMatch IS NULL OR LoweredUserName LIKE LOWER(@UserNameToMatch))
        ORDER BY UserName

    SELECT  u.UserName, u.IsAnonymous, u.LastActivityDate, p.LastUpdatedDate,
            DATALENGTH(p.PropertyNames) + DATALENGTH(p.PropertyValuesString) + DATALENGTH(p.PropertyValuesBinary)
    FROM    dbo.aspnet_Users u, dbo.aspnet_Profile p, #PageIndexForUsers i
    WHERE   u.UserId = p.UserId AND p.UserId = i.UserId AND i.IndexId >= @PageLowerBound AND i.IndexId <= @PageUpperBound

    SELECT COUNT(*)
    FROM   #PageIndexForUsers

    DROP TABLE #PageIndexForUsers
END









GO
/****** Object:  StoredProcedure [dbo].[aspnet_Profile_GetProperties]    Script Date: 28/06/2016 13:19:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_Profile_GetProperties]
    @ApplicationName      nvarchar(256),
    @UserName             nvarchar(256),
    @CurrentTimeUtc       datetime
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM dbo.aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN

    DECLARE @UserId uniqueidentifier
    SELECT  @UserId = NULL

    SELECT @UserId = UserId
    FROM   dbo.aspnet_Users
    WHERE  ApplicationId = @ApplicationId AND LoweredUserName = LOWER(@UserName)

    IF (@UserId IS NULL)
        RETURN
    SELECT TOP 1 PropertyNames, PropertyValuesString, PropertyValuesBinary
    FROM         dbo.aspnet_Profile
    WHERE        UserId = @UserId

    IF (@@ROWCOUNT > 0)
    BEGIN
        UPDATE dbo.aspnet_Users
        SET    LastActivityDate=@CurrentTimeUtc
        WHERE  UserId = @UserId
    END
END









GO
/****** Object:  StoredProcedure [dbo].[aspnet_Profile_SetProperties]    Script Date: 28/06/2016 13:19:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_Profile_SetProperties]
    @ApplicationName        nvarchar(256),
    @PropertyNames          ntext,
    @PropertyValuesString   ntext,
    @PropertyValuesBinary   image,
    @UserName               nvarchar(256),
    @IsUserAnonymous        bit,
    @CurrentTimeUtc         datetime
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL

    DECLARE @ErrorCode     int
    SET @ErrorCode = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
       BEGIN TRANSACTION
       SET @TranStarted = 1
    END
    ELSE
    	SET @TranStarted = 0

    EXEC dbo.aspnet_Applications_CreateApplication @ApplicationName, @ApplicationId OUTPUT

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    DECLARE @UserId uniqueidentifier
    DECLARE @LastActivityDate datetime
    SELECT  @UserId = NULL
    SELECT  @LastActivityDate = @CurrentTimeUtc

    SELECT @UserId = UserId
    FROM   dbo.aspnet_Users
    WHERE  ApplicationId = @ApplicationId AND LoweredUserName = LOWER(@UserName)
    IF (@UserId IS NULL)
        EXEC dbo.aspnet_Users_CreateUser @ApplicationId, @UserName, @IsUserAnonymous, @LastActivityDate, @UserId OUTPUT

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    UPDATE dbo.aspnet_Users
    SET    LastActivityDate=@CurrentTimeUtc
    WHERE  UserId = @UserId

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF (EXISTS( SELECT *
               FROM   dbo.aspnet_Profile
               WHERE  UserId = @UserId))
        UPDATE dbo.aspnet_Profile
        SET    PropertyNames=@PropertyNames, PropertyValuesString = @PropertyValuesString,
               PropertyValuesBinary = @PropertyValuesBinary, LastUpdatedDate=@CurrentTimeUtc
        WHERE  UserId = @UserId
    ELSE
        INSERT INTO dbo.aspnet_Profile(UserId, PropertyNames, PropertyValuesString, PropertyValuesBinary, LastUpdatedDate)
             VALUES (@UserId, @PropertyNames, @PropertyValuesString, @PropertyValuesBinary, @CurrentTimeUtc)

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF( @TranStarted = 1 )
    BEGIN
    	SET @TranStarted = 0
    	COMMIT TRANSACTION
    END

    RETURN 0

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
    	ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode

END









GO
/****** Object:  StoredProcedure [dbo].[aspnet_RegisterSchemaVersion]    Script Date: 28/06/2016 13:19:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_RegisterSchemaVersion]
    @Feature                   nvarchar(128),
    @CompatibleSchemaVersion   nvarchar(128),
    @IsCurrentVersion          bit,
    @RemoveIncompatibleSchema  bit
AS
BEGIN
    IF( @RemoveIncompatibleSchema = 1 )
    BEGIN
        DELETE FROM dbo.aspnet_SchemaVersions WHERE Feature = LOWER( @Feature )
    END
    ELSE
    BEGIN
        IF( @IsCurrentVersion = 1 )
        BEGIN
            UPDATE dbo.aspnet_SchemaVersions
            SET IsCurrentVersion = 0
            WHERE Feature = LOWER( @Feature )
        END
    END

    INSERT  dbo.aspnet_SchemaVersions( Feature, CompatibleSchemaVersion, IsCurrentVersion )
    VALUES( LOWER( @Feature ), @CompatibleSchemaVersion, @IsCurrentVersion )
END









GO
/****** Object:  StoredProcedure [dbo].[aspnet_Roles_CreateRole]    Script Date: 28/06/2016 13:19:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Roles_CreateRole]
    @ApplicationName  nvarchar(256),
    @RoleName         nvarchar(256)
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL

    DECLARE @ErrorCode     int
    SET @ErrorCode = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
        BEGIN TRANSACTION
        SET @TranStarted = 1
    END
    ELSE
        SET @TranStarted = 0

    EXEC dbo.aspnet_Applications_CreateApplication @ApplicationName, @ApplicationId OUTPUT

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF (EXISTS(SELECT RoleId FROM dbo.aspnet_Roles WHERE LoweredRoleName = LOWER(@RoleName) AND ApplicationId = @ApplicationId))
    BEGIN
        SET @ErrorCode = 1
        GOTO Cleanup
    END

    INSERT INTO dbo.aspnet_Roles
                (ApplicationId, RoleName, LoweredRoleName)
         VALUES (@ApplicationId, @RoleName, LOWER(@RoleName))

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
        COMMIT TRANSACTION
    END

    RETURN(0)

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
        ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode

END









GO
/****** Object:  StoredProcedure [dbo].[aspnet_Roles_DeleteRole]    Script Date: 28/06/2016 13:19:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_Roles_DeleteRole]
    @ApplicationName            nvarchar(256),
    @RoleName                   nvarchar(256),
    @DeleteOnlyIfRoleIsEmpty    bit
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN(1)

    DECLARE @ErrorCode     int
    SET @ErrorCode = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
        BEGIN TRANSACTION
        SET @TranStarted = 1
    END
    ELSE
        SET @TranStarted = 0

    DECLARE @RoleId   uniqueidentifier
    SELECT  @RoleId = NULL
    SELECT  @RoleId = RoleId FROM dbo.aspnet_Roles WHERE LoweredRoleName = LOWER(@RoleName) AND ApplicationId = @ApplicationId

    IF (@RoleId IS NULL)
    BEGIN
        SELECT @ErrorCode = 1
        GOTO Cleanup
    END
    IF (@DeleteOnlyIfRoleIsEmpty <> 0)
    BEGIN
        IF (EXISTS (SELECT RoleId FROM dbo.aspnet_UsersInRoles  WHERE @RoleId = RoleId))
        BEGIN
            SELECT @ErrorCode = 2
            GOTO Cleanup
        END
    END


    DELETE FROM dbo.aspnet_UsersInRoles  WHERE @RoleId = RoleId

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    DELETE FROM dbo.aspnet_Roles WHERE @RoleId = RoleId  AND ApplicationId = @ApplicationId

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
        COMMIT TRANSACTION
    END

    RETURN(0)

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
        ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode
END









GO
/****** Object:  StoredProcedure [dbo].[aspnet_Roles_GetAllRoles]    Script Date: 28/06/2016 13:19:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_Roles_GetAllRoles] (
    @ApplicationName           nvarchar(256))
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN
    SELECT RoleName
    FROM   dbo.aspnet_Roles WHERE ApplicationId = @ApplicationId
    ORDER BY RoleName
END









GO
/****** Object:  StoredProcedure [dbo].[aspnet_Roles_RoleExists]    Script Date: 28/06/2016 13:19:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_Roles_RoleExists]
    @ApplicationName  nvarchar(256),
    @RoleName         nvarchar(256)
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN(0)
    IF (EXISTS (SELECT RoleName FROM dbo.aspnet_Roles WHERE LOWER(@RoleName) = LoweredRoleName AND ApplicationId = @ApplicationId ))
        RETURN(1)
    ELSE
        RETURN(0)
END









GO
/****** Object:  StoredProcedure [dbo].[aspnet_Setup_RemoveAllRoleMembers]    Script Date: 28/06/2016 13:19:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_Setup_RemoveAllRoleMembers]
    @name   sysname
AS
BEGIN
    CREATE TABLE #aspnet_RoleMembers
    (
        Group_name      sysname,
        Group_id        smallint,
        Users_in_group  sysname,
        User_id         smallint
    )

    INSERT INTO #aspnet_RoleMembers
    EXEC sp_helpuser @name

    DECLARE @user_id smallint
    DECLARE @cmd nvarchar(500)
    DECLARE c1 cursor FORWARD_ONLY FOR
        SELECT User_id FROM #aspnet_RoleMembers

    OPEN c1

    FETCH c1 INTO @user_id
    WHILE (@@fetch_status = 0)
    BEGIN
        SET @cmd = 'EXEC sp_droprolemember ' + '''' + @name + ''', ''' + USER_NAME(@user_id) + ''''
        EXEC (@cmd)
        FETCH c1 INTO @user_id
    END

    CLOSE c1
    DEALLOCATE c1
END









GO
/****** Object:  StoredProcedure [dbo].[aspnet_Setup_RestorePermissions]    Script Date: 28/06/2016 13:19:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_Setup_RestorePermissions]
    @name   sysname
AS
BEGIN
    DECLARE @object sysname
    DECLARE @protectType char(10)
    DECLARE @action varchar(60)
    DECLARE @grantee sysname
    DECLARE @cmd nvarchar(500)
    DECLARE c1 cursor FORWARD_ONLY FOR
        SELECT Object, ProtectType, [Action], Grantee FROM #aspnet_Permissions where Object = @name

    OPEN c1

    FETCH c1 INTO @object, @protectType, @action, @grantee
    WHILE (@@fetch_status = 0)
    BEGIN
        SET @cmd = @protectType + ' ' + @action + ' on ' + @object + ' TO [' + @grantee + ']'
        EXEC (@cmd)
        FETCH c1 INTO @object, @protectType, @action, @grantee
    END

    CLOSE c1
    DEALLOCATE c1
END









GO
/****** Object:  StoredProcedure [dbo].[aspnet_UnRegisterSchemaVersion]    Script Date: 28/06/2016 13:19:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_UnRegisterSchemaVersion]
    @Feature                   nvarchar(128),
    @CompatibleSchemaVersion   nvarchar(128)
AS
BEGIN
    DELETE FROM dbo.aspnet_SchemaVersions
        WHERE   Feature = LOWER(@Feature) AND @CompatibleSchemaVersion = CompatibleSchemaVersion
END









GO
/****** Object:  StoredProcedure [dbo].[aspnet_Users_CreateUser]    Script Date: 28/06/2016 13:19:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_Users_CreateUser]
    @ApplicationId    uniqueidentifier,
    @UserName         nvarchar(256),
    @IsUserAnonymous  bit,
    @LastActivityDate DATETIME,
    @UserId           uniqueidentifier OUTPUT
AS
BEGIN
    IF( @UserId IS NULL )
        SELECT @UserId = NEWID()
    ELSE
    BEGIN
        IF( EXISTS( SELECT UserId FROM dbo.aspnet_Users
                    WHERE @UserId = UserId ) )
            RETURN -1
    END

    INSERT dbo.aspnet_Users (ApplicationId, UserId, UserName, LoweredUserName, IsAnonymous, LastActivityDate)
    VALUES (@ApplicationId, @UserId, @UserName, LOWER(@UserName), @IsUserAnonymous, @LastActivityDate)

    RETURN 0
END









GO
/****** Object:  StoredProcedure [dbo].[aspnet_Users_DeleteUser]    Script Date: 28/06/2016 13:19:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Users_DeleteUser]
    @ApplicationName  nvarchar(256),
    @UserName         nvarchar(256),
    @TablesToDeleteFrom int,
    @NumTablesDeletedFrom int OUTPUT
AS
BEGIN
    DECLARE @UserId               uniqueidentifier
    SELECT  @UserId               = NULL
    SELECT  @NumTablesDeletedFrom = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
	    BEGIN TRANSACTION
	    SET @TranStarted = 1
    END
    ELSE
	SET @TranStarted = 0

    DECLARE @ErrorCode   int
    DECLARE @RowCount    int

    SET @ErrorCode = 0
    SET @RowCount  = 0

    SELECT  @UserId = u.UserId
    FROM    dbo.aspnet_Users u, dbo.aspnet_Applications a
    WHERE   u.LoweredUserName       = LOWER(@UserName)
        AND u.ApplicationId         = a.ApplicationId
        AND LOWER(@ApplicationName) = a.LoweredApplicationName

    IF (@UserId IS NULL)
    BEGIN
        GOTO Cleanup
    END

    -- Delete from Membership table if (@TablesToDeleteFrom & 1) is set
    IF ((@TablesToDeleteFrom & 1) <> 0 AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_MembershipUsers') AND (type = 'V'))))
    BEGIN
        DELETE FROM dbo.aspnet_Membership WHERE @UserId = UserId

        SELECT @ErrorCode = @@ERROR,
               @RowCount = @@ROWCOUNT

        IF( @ErrorCode <> 0 )
            GOTO Cleanup

        IF (@RowCount <> 0)
            SELECT  @NumTablesDeletedFrom = @NumTablesDeletedFrom + 1
    END

    -- Delete from aspnet_UsersInRoles table if (@TablesToDeleteFrom & 2) is set
    IF ((@TablesToDeleteFrom & 2) <> 0  AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_UsersInRoles') AND (type = 'V'))) )
    BEGIN
        DELETE FROM dbo.aspnet_UsersInRoles WHERE @UserId = UserId

        SELECT @ErrorCode = @@ERROR,
                @RowCount = @@ROWCOUNT

        IF( @ErrorCode <> 0 )
            GOTO Cleanup

        IF (@RowCount <> 0)
            SELECT  @NumTablesDeletedFrom = @NumTablesDeletedFrom + 1
    END

    -- Delete from aspnet_Profile table if (@TablesToDeleteFrom & 4) is set
    IF ((@TablesToDeleteFrom & 4) <> 0  AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_Profiles') AND (type = 'V'))) )
    BEGIN
        DELETE FROM dbo.aspnet_Profile WHERE @UserId = UserId

        SELECT @ErrorCode = @@ERROR,
                @RowCount = @@ROWCOUNT

        IF( @ErrorCode <> 0 )
            GOTO Cleanup

        IF (@RowCount <> 0)
            SELECT  @NumTablesDeletedFrom = @NumTablesDeletedFrom + 1
    END

    -- Delete from aspnet_PersonalizationPerUser table if (@TablesToDeleteFrom & 8) is set
    IF ((@TablesToDeleteFrom & 8) <> 0  AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_WebPartState_User') AND (type = 'V'))) )
    BEGIN
        DELETE FROM dbo.aspnet_PersonalizationPerUser WHERE @UserId = UserId

        SELECT @ErrorCode = @@ERROR,
                @RowCount = @@ROWCOUNT

        IF( @ErrorCode <> 0 )
            GOTO Cleanup

        IF (@RowCount <> 0)
            SELECT  @NumTablesDeletedFrom = @NumTablesDeletedFrom + 1
    END

    -- Delete from aspnet_Users table if (@TablesToDeleteFrom & 1,2,4 & 8) are all set
    IF ((@TablesToDeleteFrom & 1) <> 0 AND
        (@TablesToDeleteFrom & 2) <> 0 AND
        (@TablesToDeleteFrom & 4) <> 0 AND
        (@TablesToDeleteFrom & 8) <> 0 AND
        (EXISTS (SELECT UserId FROM dbo.aspnet_Users WHERE @UserId = UserId)))
    BEGIN
        DELETE FROM dbo.aspnet_Users WHERE @UserId = UserId

        SELECT @ErrorCode = @@ERROR,
                @RowCount = @@ROWCOUNT

        IF( @ErrorCode <> 0 )
            GOTO Cleanup

        IF (@RowCount <> 0)
            SELECT  @NumTablesDeletedFrom = @NumTablesDeletedFrom + 1
    END

    IF( @TranStarted = 1 )
    BEGIN
	    SET @TranStarted = 0
	    COMMIT TRANSACTION
    END

    RETURN 0

Cleanup:
    SET @NumTablesDeletedFrom = 0

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
	    ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode

END









GO
/****** Object:  StoredProcedure [dbo].[aspnet_UsersInRoles_AddUsersToRoles]    Script Date: 28/06/2016 13:19:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_UsersInRoles_AddUsersToRoles]
	@ApplicationName  nvarchar(256),
	@UserNames		  nvarchar(4000),
	@RoleNames		  nvarchar(4000),
	@CurrentTimeUtc   datetime
AS
BEGIN
	DECLARE @AppId uniqueidentifier
	SELECT  @AppId = NULL
	SELECT  @AppId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
	IF (@AppId IS NULL)
		RETURN(2)
	DECLARE @TranStarted   bit
	SET @TranStarted = 0

	IF( @@TRANCOUNT = 0 )
	BEGIN
		BEGIN TRANSACTION
		SET @TranStarted = 1
	END

	DECLARE @tbNames	table(Name nvarchar(256) NOT NULL PRIMARY KEY)
	DECLARE @tbRoles	table(RoleId uniqueidentifier NOT NULL PRIMARY KEY)
	DECLARE @tbUsers	table(UserId uniqueidentifier NOT NULL PRIMARY KEY)
	DECLARE @Num		int
	DECLARE @Pos		int
	DECLARE @NextPos	int
	DECLARE @Name		nvarchar(256)

	SET @Num = 0
	SET @Pos = 1
	WHILE(@Pos <= LEN(@RoleNames))
	BEGIN
		SELECT @NextPos = CHARINDEX(N',', @RoleNames,  @Pos)
		IF (@NextPos = 0 OR @NextPos IS NULL)
			SELECT @NextPos = LEN(@RoleNames) + 1
		SELECT @Name = RTRIM(LTRIM(SUBSTRING(@RoleNames, @Pos, @NextPos - @Pos)))
		SELECT @Pos = @NextPos+1

		INSERT INTO @tbNames VALUES (@Name)
		SET @Num = @Num + 1
	END

	INSERT INTO @tbRoles
	  SELECT RoleId
	  FROM   dbo.aspnet_Roles ar, @tbNames t
	  WHERE  LOWER(t.Name) = ar.LoweredRoleName AND ar.ApplicationId = @AppId

	IF (@@ROWCOUNT <> @Num)
	BEGIN
		SELECT TOP 1 Name
		FROM   @tbNames
		WHERE  LOWER(Name) NOT IN (SELECT ar.LoweredRoleName FROM dbo.aspnet_Roles ar,  @tbRoles r WHERE r.RoleId = ar.RoleId)
		IF( @TranStarted = 1 )
			ROLLBACK TRANSACTION
		RETURN(2)
	END

	DELETE FROM @tbNames WHERE 1=1
	SET @Num = 0
	SET @Pos = 1

	WHILE(@Pos <= LEN(@UserNames))
	BEGIN
		SELECT @NextPos = CHARINDEX(N',', @UserNames,  @Pos)
		IF (@NextPos = 0 OR @NextPos IS NULL)
			SELECT @NextPos = LEN(@UserNames) + 1
		SELECT @Name = RTRIM(LTRIM(SUBSTRING(@UserNames, @Pos, @NextPos - @Pos)))
		SELECT @Pos = @NextPos+1

		INSERT INTO @tbNames VALUES (@Name)
		SET @Num = @Num + 1
	END

	INSERT INTO @tbUsers
	  SELECT UserId
	  FROM   dbo.aspnet_Users ar, @tbNames t
	  WHERE  LOWER(t.Name) = ar.LoweredUserName AND ar.ApplicationId = @AppId

	IF (@@ROWCOUNT <> @Num)
	BEGIN
		DELETE FROM @tbNames
		WHERE LOWER(Name) IN (SELECT LoweredUserName FROM dbo.aspnet_Users au,  @tbUsers u WHERE au.UserId = u.UserId)

		INSERT dbo.aspnet_Users (ApplicationId, UserId, UserName, LoweredUserName, IsAnonymous, LastActivityDate)
		  SELECT @AppId, NEWID(), Name, LOWER(Name), 0, @CurrentTimeUtc
		  FROM   @tbNames

		INSERT INTO @tbUsers
		  SELECT  UserId
		  FROM	dbo.aspnet_Users au, @tbNames t
		  WHERE   LOWER(t.Name) = au.LoweredUserName AND au.ApplicationId = @AppId
	END

	IF (EXISTS (SELECT * FROM dbo.aspnet_UsersInRoles ur, @tbUsers tu, @tbRoles tr WHERE tu.UserId = ur.UserId AND tr.RoleId = ur.RoleId))
	BEGIN
		SELECT TOP 1 UserName, RoleName
		FROM		 dbo.aspnet_UsersInRoles ur, @tbUsers tu, @tbRoles tr, aspnet_Users u, aspnet_Roles r
		WHERE		u.UserId = tu.UserId AND r.RoleId = tr.RoleId AND tu.UserId = ur.UserId AND tr.RoleId = ur.RoleId

		IF( @TranStarted = 1 )
			ROLLBACK TRANSACTION
		RETURN(3)
	END

	INSERT INTO dbo.aspnet_UsersInRoles (UserId, RoleId)
	SELECT UserId, RoleId
	FROM @tbUsers, @tbRoles

	IF( @TranStarted = 1 )
		COMMIT TRANSACTION
	RETURN(0)
END                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     









GO
/****** Object:  StoredProcedure [dbo].[aspnet_UsersInRoles_FindUsersInRole]    Script Date: 28/06/2016 13:19:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_UsersInRoles_FindUsersInRole]
    @ApplicationName  nvarchar(256),
    @RoleName         nvarchar(256),
    @UserNameToMatch  nvarchar(256)
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN(1)
     DECLARE @RoleId uniqueidentifier
     SELECT  @RoleId = NULL

     SELECT  @RoleId = RoleId
     FROM    dbo.aspnet_Roles
     WHERE   LOWER(@RoleName) = LoweredRoleName AND ApplicationId = @ApplicationId

     IF (@RoleId IS NULL)
         RETURN(1)

    SELECT u.UserName
    FROM   dbo.aspnet_Users u, dbo.aspnet_UsersInRoles ur
    WHERE  u.UserId = ur.UserId AND @RoleId = ur.RoleId AND u.ApplicationId = @ApplicationId AND LoweredUserName LIKE LOWER(@UserNameToMatch)
    ORDER BY u.UserName
    RETURN(0)
END









GO
/****** Object:  StoredProcedure [dbo].[aspnet_UsersInRoles_GetRolesForUser]    Script Date: 28/06/2016 13:19:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_UsersInRoles_GetRolesForUser]
    @ApplicationName  nvarchar(256),
    @UserName         nvarchar(256)
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN(1)
    DECLARE @UserId uniqueidentifier
    SELECT  @UserId = NULL

    SELECT  @UserId = UserId
    FROM    dbo.aspnet_Users
    WHERE   LoweredUserName = LOWER(@UserName) AND ApplicationId = @ApplicationId

    IF (@UserId IS NULL)
        RETURN(1)

    SELECT r.RoleName
    FROM   dbo.aspnet_Roles r, dbo.aspnet_UsersInRoles ur
    WHERE  r.RoleId = ur.RoleId AND r.ApplicationId = @ApplicationId AND ur.UserId = @UserId
    ORDER BY r.RoleName
    RETURN (0)
END









GO
/****** Object:  StoredProcedure [dbo].[aspnet_UsersInRoles_GetUsersInRoles]    Script Date: 28/06/2016 13:19:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_UsersInRoles_GetUsersInRoles]
    @ApplicationName  nvarchar(256),
    @RoleName         nvarchar(256)
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN(1)
     DECLARE @RoleId uniqueidentifier
     SELECT  @RoleId = NULL

     SELECT  @RoleId = RoleId
     FROM    dbo.aspnet_Roles
     WHERE   LOWER(@RoleName) = LoweredRoleName AND ApplicationId = @ApplicationId

     IF (@RoleId IS NULL)
         RETURN(1)

    SELECT u.UserName
    FROM   dbo.aspnet_Users u, dbo.aspnet_UsersInRoles ur
    WHERE  u.UserId = ur.UserId AND @RoleId = ur.RoleId AND u.ApplicationId = @ApplicationId
    ORDER BY u.UserName
    RETURN(0)
END









GO
/****** Object:  StoredProcedure [dbo].[aspnet_UsersInRoles_IsUserInRole]    Script Date: 28/06/2016 13:19:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_UsersInRoles_IsUserInRole]
    @ApplicationName  nvarchar(256),
    @UserName         nvarchar(256),
    @RoleName         nvarchar(256)
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN(2)
    DECLARE @UserId uniqueidentifier
    SELECT  @UserId = NULL
    DECLARE @RoleId uniqueidentifier
    SELECT  @RoleId = NULL

    SELECT  @UserId = UserId
    FROM    dbo.aspnet_Users
    WHERE   LoweredUserName = LOWER(@UserName) AND ApplicationId = @ApplicationId

    IF (@UserId IS NULL)
        RETURN(2)

    SELECT  @RoleId = RoleId
    FROM    dbo.aspnet_Roles
    WHERE   LoweredRoleName = LOWER(@RoleName) AND ApplicationId = @ApplicationId

    IF (@RoleId IS NULL)
        RETURN(3)

    IF (EXISTS( SELECT * FROM dbo.aspnet_UsersInRoles WHERE  UserId = @UserId AND RoleId = @RoleId))
        RETURN(1)
    ELSE
        RETURN(0)
END









GO
/****** Object:  StoredProcedure [dbo].[aspnet_UsersInRoles_RemoveUsersFromRoles]    Script Date: 28/06/2016 13:19:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_UsersInRoles_RemoveUsersFromRoles]
	@ApplicationName  nvarchar(256),
	@UserNames		  nvarchar(4000),
	@RoleNames		  nvarchar(4000)
AS
BEGIN
	DECLARE @AppId uniqueidentifier
	SELECT  @AppId = NULL
	SELECT  @AppId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
	IF (@AppId IS NULL)
		RETURN(2)


	DECLARE @TranStarted   bit
	SET @TranStarted = 0

	IF( @@TRANCOUNT = 0 )
	BEGIN
		BEGIN TRANSACTION
		SET @TranStarted = 1
	END

	DECLARE @tbNames  table(Name nvarchar(256) NOT NULL PRIMARY KEY)
	DECLARE @tbRoles  table(RoleId uniqueidentifier NOT NULL PRIMARY KEY)
	DECLARE @tbUsers  table(UserId uniqueidentifier NOT NULL PRIMARY KEY)
	DECLARE @Num	  int
	DECLARE @Pos	  int
	DECLARE @NextPos  int
	DECLARE @Name	  nvarchar(256)
	DECLARE @CountAll int
	DECLARE @CountU	  int
	DECLARE @CountR	  int


	SET @Num = 0
	SET @Pos = 1
	WHILE(@Pos <= LEN(@RoleNames))
	BEGIN
		SELECT @NextPos = CHARINDEX(N',', @RoleNames,  @Pos)
		IF (@NextPos = 0 OR @NextPos IS NULL)
			SELECT @NextPos = LEN(@RoleNames) + 1
		SELECT @Name = RTRIM(LTRIM(SUBSTRING(@RoleNames, @Pos, @NextPos - @Pos)))
		SELECT @Pos = @NextPos+1

		INSERT INTO @tbNames VALUES (@Name)
		SET @Num = @Num + 1
	END

	INSERT INTO @tbRoles
	  SELECT RoleId
	  FROM   dbo.aspnet_Roles ar, @tbNames t
	  WHERE  LOWER(t.Name) = ar.LoweredRoleName AND ar.ApplicationId = @AppId
	SELECT @CountR = @@ROWCOUNT

	IF (@CountR <> @Num)
	BEGIN
		SELECT TOP 1 N'', Name
		FROM   @tbNames
		WHERE  LOWER(Name) NOT IN (SELECT ar.LoweredRoleName FROM dbo.aspnet_Roles ar,  @tbRoles r WHERE r.RoleId = ar.RoleId)
		IF( @TranStarted = 1 )
			ROLLBACK TRANSACTION
		RETURN(2)
	END


	DELETE FROM @tbNames WHERE 1=1
	SET @Num = 0
	SET @Pos = 1


	WHILE(@Pos <= LEN(@UserNames))
	BEGIN
		SELECT @NextPos = CHARINDEX(N',', @UserNames,  @Pos)
		IF (@NextPos = 0 OR @NextPos IS NULL)
			SELECT @NextPos = LEN(@UserNames) + 1
		SELECT @Name = RTRIM(LTRIM(SUBSTRING(@UserNames, @Pos, @NextPos - @Pos)))
		SELECT @Pos = @NextPos+1

		INSERT INTO @tbNames VALUES (@Name)
		SET @Num = @Num + 1
	END

	INSERT INTO @tbUsers
	  SELECT UserId
	  FROM   dbo.aspnet_Users ar, @tbNames t
	  WHERE  LOWER(t.Name) = ar.LoweredUserName AND ar.ApplicationId = @AppId

	SELECT @CountU = @@ROWCOUNT
	IF (@CountU <> @Num)
	BEGIN
		SELECT TOP 1 Name, N''
		FROM   @tbNames
		WHERE  LOWER(Name) NOT IN (SELECT au.LoweredUserName FROM dbo.aspnet_Users au,  @tbUsers u WHERE u.UserId = au.UserId)

		IF( @TranStarted = 1 )
			ROLLBACK TRANSACTION
		RETURN(1)
	END

	SELECT  @CountAll = COUNT(*)
	FROM	dbo.aspnet_UsersInRoles ur, @tbUsers u, @tbRoles r
	WHERE   ur.UserId = u.UserId AND ur.RoleId = r.RoleId

	IF (@CountAll <> @CountU * @CountR)
	BEGIN
		SELECT TOP 1 UserName, RoleName
		FROM		 @tbUsers tu, @tbRoles tr, dbo.aspnet_Users u, dbo.aspnet_Roles r
		WHERE		 u.UserId = tu.UserId AND r.RoleId = tr.RoleId AND
					 tu.UserId NOT IN (SELECT ur.UserId FROM dbo.aspnet_UsersInRoles ur WHERE ur.RoleId = tr.RoleId) AND
					 tr.RoleId NOT IN (SELECT ur.RoleId FROM dbo.aspnet_UsersInRoles ur WHERE ur.UserId = tu.UserId)
		IF( @TranStarted = 1 )
			ROLLBACK TRANSACTION
		RETURN(3)
	END

	DELETE FROM dbo.aspnet_UsersInRoles
	WHERE UserId IN (SELECT UserId FROM @tbUsers)
	  AND RoleId IN (SELECT RoleId FROM @tbRoles)
	IF( @TranStarted = 1 )
		COMMIT TRANSACTION
	RETURN(0)
END
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        









GO
/****** Object:  StoredProcedure [dbo].[aspnet_WebEvent_LogEvent]    Script Date: 28/06/2016 13:19:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_WebEvent_LogEvent]
        @EventId         char(32),
        @EventTimeUtc    datetime,
        @EventTime       datetime,
        @EventType       nvarchar(256),
        @EventSequence   decimal(19,0),
        @EventOccurrence decimal(19,0),
        @EventCode       int,
        @EventDetailCode int,
        @Message         nvarchar(1024),
        @ApplicationPath nvarchar(256),
        @ApplicationVirtualPath nvarchar(256),
        @MachineName    nvarchar(256),
        @RequestUrl      nvarchar(1024),
        @ExceptionType   nvarchar(256),
        @Details         ntext
AS
BEGIN
    INSERT
        dbo.aspnet_WebEvent_Events
        (
            EventId,
            EventTimeUtc,
            EventTime,
            EventType,
            EventSequence,
            EventOccurrence,
            EventCode,
            EventDetailCode,
            Message,
            ApplicationPath,
            ApplicationVirtualPath,
            MachineName,
            RequestUrl,
            ExceptionType,
            Details
        )
    VALUES
    (
        @EventId,
        @EventTimeUtc,
        @EventTime,
        @EventType,
        @EventSequence,
        @EventOccurrence,
        @EventCode,
        @EventDetailCode,
        @Message,
        @ApplicationPath,
        @ApplicationVirtualPath,
        @MachineName,
        @RequestUrl,
        @ExceptionType,
        @Details
    )
END









GO
/****** Object:  Table [dbo].[Analytic]    Script Date: 28/06/2016 13:19:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Analytic](
	[ID] [int] NOT NULL,
	[Ngay] [int] NULL,
	[Thang] [int] NULL,
	[Nam] [int] NULL,
	[ID_SanPham] [int] NULL,
	[TenSanPham] [nvarchar](255) NULL,
	[SoLuong] [int] NULL,
	[TongTien] [float] NULL,
	[NgayTao] [date] NULL,
	[GhiChu] [ntext] NULL,
	[iduser] [int] NULL,
	[longid] [decimal](18, 0) NULL,
 CONSTRAINT [PK_Analytic] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[aspnet_Applications]    Script Date: 28/06/2016 13:19:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_Applications](
	[ApplicationName] [nvarchar](256) NOT NULL,
	[LoweredApplicationName] [nvarchar](256) NOT NULL,
	[ApplicationId] [uniqueidentifier] NOT NULL DEFAULT (newid()),
	[Description] [nvarchar](256) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[aspnet_Membership]    Script Date: 28/06/2016 13:19:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_Membership](
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[Password] [nvarchar](128) NOT NULL,
	[PasswordFormat] [int] NOT NULL DEFAULT ((0)),
	[PasswordSalt] [nvarchar](128) NOT NULL,
	[MobilePIN] [nvarchar](16) NULL,
	[Email] [nvarchar](256) NULL,
	[LoweredEmail] [nvarchar](256) NULL,
	[PasswordQuestion] [nvarchar](256) NULL,
	[PasswordAnswer] [nvarchar](128) NULL,
	[IsApproved] [bit] NOT NULL,
	[IsLockedOut] [bit] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[LastLoginDate] [datetime] NOT NULL,
	[LastPasswordChangedDate] [datetime] NOT NULL,
	[LastLockoutDate] [datetime] NOT NULL,
	[FailedPasswordAttemptCount] [int] NOT NULL,
	[FailedPasswordAttemptWindowStart] [datetime] NOT NULL,
	[FailedPasswordAnswerAttemptCount] [int] NOT NULL,
	[FailedPasswordAnswerAttemptWindowStart] [datetime] NOT NULL,
	[Comment] [ntext] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[aspnet_Paths]    Script Date: 28/06/2016 13:19:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_Paths](
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[PathId] [uniqueidentifier] NOT NULL,
	[Path] [nvarchar](256) NOT NULL,
	[LoweredPath] [nvarchar](256) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[aspnet_PersonalizationAllUsers]    Script Date: 28/06/2016 13:19:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_PersonalizationAllUsers](
	[PathId] [uniqueidentifier] NOT NULL,
	[PageSettings] [image] NOT NULL,
	[LastUpdatedDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PathId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[aspnet_PersonalizationPerUser]    Script Date: 28/06/2016 13:19:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_PersonalizationPerUser](
	[Id] [uniqueidentifier] NOT NULL,
	[PathId] [uniqueidentifier] NULL,
	[UserId] [uniqueidentifier] NULL,
	[PageSettings] [image] NOT NULL,
	[LastUpdatedDate] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[aspnet_Profile]    Script Date: 28/06/2016 13:19:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_Profile](
	[UserId] [uniqueidentifier] NOT NULL,
	[PropertyNames] [ntext] NOT NULL,
	[PropertyValuesString] [ntext] NOT NULL,
	[PropertyValuesBinary] [image] NOT NULL,
	[LastUpdatedDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[aspnet_Roles]    Script Date: 28/06/2016 13:19:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_Roles](
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[RoleId] [uniqueidentifier] NOT NULL DEFAULT (newid()),
	[RoleName] [nvarchar](256) NOT NULL,
	[LoweredRoleName] [nvarchar](256) NOT NULL,
	[Description] [nvarchar](256) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[aspnet_SchemaVersions]    Script Date: 28/06/2016 13:19:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_SchemaVersions](
	[Feature] [nvarchar](128) NOT NULL,
	[CompatibleSchemaVersion] [nvarchar](128) NOT NULL,
	[IsCurrentVersion] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Feature] ASC,
	[CompatibleSchemaVersion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[aspnet_Users]    Script Date: 28/06/2016 13:19:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_Users](
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL DEFAULT (newid()),
	[UserName] [nvarchar](256) NOT NULL,
	[LoweredUserName] [nvarchar](256) NOT NULL,
	[MobileAlias] [nvarchar](16) NULL DEFAULT (NULL),
	[IsAnonymous] [bit] NOT NULL DEFAULT ((0)),
	[LastActivityDate] [datetime] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[aspnet_UsersInRoles]    Script Date: 28/06/2016 13:19:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_UsersInRoles](
	[UserId] [uniqueidentifier] NOT NULL,
	[RoleId] [uniqueidentifier] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[aspnet_WebEvent_Events]    Script Date: 28/06/2016 13:19:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[aspnet_WebEvent_Events](
	[EventId] [char](32) NOT NULL,
	[EventTimeUtc] [datetime] NOT NULL,
	[EventTime] [datetime] NOT NULL,
	[EventType] [nvarchar](256) NOT NULL,
	[EventSequence] [decimal](19, 0) NOT NULL,
	[EventOccurrence] [decimal](19, 0) NOT NULL,
	[EventCode] [int] NOT NULL,
	[EventDetailCode] [int] NOT NULL,
	[Message] [nvarchar](1024) NULL,
	[ApplicationPath] [nvarchar](256) NULL,
	[ApplicationVirtualPath] [nvarchar](256) NULL,
	[MachineName] [nvarchar](256) NOT NULL,
	[RequestUrl] [nvarchar](1024) NULL,
	[ExceptionType] [nvarchar](256) NULL,
	[Details] [ntext] NULL,
PRIMARY KEY CLUSTERED 
(
	[EventId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Banners]    Script Date: 28/06/2016 13:19:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Banners](
	[id] [decimal](18, 0) NOT NULL,
	[img] [nvarchar](max) NULL,
	[content1] [nvarchar](max) NULL,
	[content2] [nvarchar](max) NULL,
	[content3] [nvarchar](max) NULL,
	[content4] [nvarchar](max) NULL,
	[btnContent] [nvarchar](max) NULL,
	[color1] [nvarchar](max) NULL,
	[color2] [nvarchar](max) NULL,
	[color3] [nvarchar](max) NULL,
	[color4] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Cart]    Script Date: 28/06/2016 13:19:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[ID] [int] NOT NULL,
	[CartId] [nvarchar](250) NULL,
	[ProductId] [int] NULL,
	[Count] [int] NULL,
	[DateCreated] [datetime] NULL,
 CONSTRAINT [PK_Cart] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Categories]    Script Date: 28/06/2016 13:19:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Categories](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MaLoai] [varchar](10) NOT NULL,
	[TenLoai] [nvarchar](255) NULL,
	[TuKhoa] [nvarchar](255) NULL,
	[TinhTrang] [int] NULL,
	[NgayTao] [datetime] NULL,
	[NgayCapNhat] [datetime] NULL,
	[GhiChu] [ntext] NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Comment]    Script Date: 28/06/2016 13:19:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comment](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MaCha] [int] NULL,
	[NoiDung] [ntext] NULL,
	[TenBinhLuan] [nvarchar](255) NULL,
	[SanPham_ID] [int] NULL,
	[TrangThai] [int] NULL,
	[NgayTao] [datetime] NULL,
	[NgayCapNhat] [datetime] NULL,
	[GhiChu] [ntext] NULL,
 CONSTRAINT [PK_Comment] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Contacts]    Script Date: 28/06/2016 13:19:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contacts](
	[id] [decimal](18, 0) NOT NULL,
	[ip] [nvarchar](50) NULL,
	[thoigian] [datetime] NULL,
	[name] [nvarchar](max) NULL,
	[email] [nvarchar](max) NULL,
	[tieude] [nvarchar](max) NULL,
	[noidung] [nvarchar](max) NULL,
	[trangthai] [bit] NULL,
 CONSTRAINT [PK_Contacts] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Customers]    Script Date: 28/06/2016 13:19:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Customers](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MaKH] [varchar](10) NOT NULL,
	[TenKH] [nvarchar](255) NULL,
	[DiaChi] [nvarchar](255) NULL,
	[SDT] [varchar](15) NULL,
	[Email] [varchar](255) NULL,
	[User_ID] [int] NULL,
	[TrangThai] [int] NULL,
	[NgayTao] [datetime] NULL,
	[NgayCapNhat] [datetime] NULL,
	[GhiChu] [ntext] NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Images]    Script Date: 28/06/2016 13:19:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Images](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SanPham_ID] [int] NULL,
	[Url_img] [varchar](255) NULL,
	[TuKhoa] [nvarchar](255) NULL,
	[NgayTao] [datetime] NULL,
	[ViTriHinh] [int] NULL,
	[NgayCapNhat] [datetime] NULL,
	[ChieuRong] [float] NULL,
	[TrangThai] [int] NULL,
	[ChieuCao] [float] NULL,
	[GhiChu] [ntext] NULL,
 CONSTRAINT [PK_Image] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Jobs]    Script Date: 28/06/2016 13:19:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Jobs](
	[id] [decimal](18, 0) NOT NULL,
	[title] [nvarchar](max) NULL,
	[img] [nvarchar](max) NULL,
	[tag] [nvarchar](max) NULL,
	[day] [datetime] NULL,
	[nview] [int] NULL,
	[rate] [float] NULL,
	[nrate] [int] NULL,
	[contents] [ntext] NULL,
	[dayupdate] [datetime] NULL,
	[usercreate] [nvarchar](max) NULL,
	[TrangThai] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Manufacturers]    Script Date: 28/06/2016 13:19:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Manufacturers](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Ma] [varchar](10) NOT NULL,
	[TenHangSanXuat] [nvarchar](255) NULL,
	[TuKhoa] [nvarchar](50) NULL,
	[NgayTao] [datetime] NULL,
	[NgayCapNhat] [datetime] NULL,
	[TrangThai] [int] NULL,
	[GhiChu] [ntext] NULL,
 CONSTRAINT [PK_Manufacturers] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Message2s]    Script Date: 28/06/2016 13:19:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Message2s](
	[Message] [nvarchar](max) NULL,
	[thoigian] [datetime] NULL CONSTRAINT [DF_Message2s_thoigian]  DEFAULT (getdate()),
	[TrangThai] [bit] NULL,
	[id] [decimal](18, 0) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Messages1]    Script Date: 28/06/2016 13:19:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Messages1](
	[Message] [nvarchar](max) NULL,
	[thoigian] [date] NULL CONSTRAINT [DF_Messages1_thoigian]  DEFAULT (getdate())
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Msgs]    Script Date: 28/06/2016 13:19:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Msgs](
	[Message] [nvarchar](max) NULL,
	[thoigian] [datetime] NULL,
	[TrangThai] [bit] NULL,
	[id] [decimal](18, 0) NOT NULL,
 CONSTRAINT [PK_Msgs] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 28/06/2016 13:19:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[HD_ID] [int] NULL,
	[SanPham_ID] [int] NULL,
	[DonGia] [float] NULL,
	[SoLuong] [int] NULL,
	[TrangThai] [int] NULL,
	[NgayTao] [date] NULL,
	[NgayCapNhat] [date] NULL,
	[GhiChu] [ntext] NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Orders]    Script Date: 28/06/2016 13:19:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Orders](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MaHD] [varchar](255) NOT NULL,
	[KH_ID] [int] NULL,
	[TenNguoiNhan] [nvarchar](255) NULL,
	[SoNha] [nvarchar](50) NULL,
	[Duong] [nvarchar](50) NULL,
	[Quan_Huyen] [varchar](255) NULL,
	[Tinh_TP] [nvarchar](255) NULL,
	[NgayDatHang] [date] NULL,
	[NgayGiaoHang] [date] NULL,
	[SoLuong] [int] NULL,
	[TongTien] [float] NULL,
	[GhiChu] [ntext] NULL,
	[MaGiamGia] [varchar](50) NULL,
	[NgayTao] [date] NULL,
	[TinhTrang] [int] NULL,
	[NgayCapNhat] [date] NULL,
	[XacNhan] [bit] NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Producers]    Script Date: 28/06/2016 13:19:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Producers](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MaNSX] [varchar](10) NOT NULL,
	[TenNSX] [nvarchar](255) NULL,
	[DiaChi] [nvarchar](255) NULL,
	[SDT] [varchar](15) NULL,
	[TuKhoa] [nvarchar](255) NULL,
	[TrangThai] [int] NULL,
	[NgayTao] [datetime] NULL,
	[NgayCapNhat] [datetime] NULL,
	[GhiChu] [ntext] NULL,
 CONSTRAINT [PK_Producers] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Products]    Script Date: 28/06/2016 13:19:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Products](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MaSanPham] [varchar](10) NOT NULL,
	[TenSanPham] [nvarchar](255) NOT NULL,
	[LoaiSP] [int] NULL,
	[Gia] [float] NULL,
	[XuatXu] [nvarchar](255) NULL,
	[NongDo] [float] NULL,
	[DungTich] [float] NULL,
	[SoLuotXem] [int] NULL,
	[TinhTrang] [int] NULL,
	[Tag] [nvarchar](255) NULL,
	[MoTa] [ntext] NULL,
	[SoLuongTon] [int] NULL,
	[GhiChu] [ntext] NULL,
	[NhaSanXuat] [int] NULL,
	[ThuongHieu] [int] NULL,
	[ChiTietBoSung] [ntext] NULL,
	[GiaKhuyenMai] [float] NULL,
	[NamSanXuat] [int] NULL,
	[NgayTao] [datetime] NULL,
	[TuKhoa] [nvarchar](255) NULL,
	[SoLuotMua] [int] NULL,
	[url_img] [nvarchar](255) NULL,
	[Seri] [nvarchar](250) NULL,
	[NgayCapNhat] [date] NULL,
	[TypeView] [int] NULL,
	[Nrate] [float] NULL,
	[NReViews] [int] NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ReViews]    Script Date: 28/06/2016 13:19:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReViews](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Products_ID] [int] NULL,
	[ReViews] [ntext] NULL,
	[Rate] [int] NULL,
	[GhiChu] [nvarchar](max) NULL,
	[TrangThai] [bit] NULL,
	[TacGia] [nvarchar](250) NULL,
	[NgayTao] [datetime] NULL,
 CONSTRAINT [PK_ReViews] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TrangThai]    Script Date: 28/06/2016 13:19:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TrangThai](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TenTrangThai] [nvarchar](255) NULL,
	[NgayTao] [datetime] NULL,
	[NgayCapNhat] [datetime] NULL,
	[GhiChu] [ntext] NULL,
 CONSTRAINT [PK_Status] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UaThichs]    Script Date: 28/06/2016 13:19:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UaThichs](
	[id] [decimal](18, 0) NOT NULL,
	[iduser] [int] NULL,
	[idsanpham] [int] NULL,
	[ip] [nvarchar](250) NULL,
 CONSTRAINT [PK_UaThichs] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Users]    Script Date: 28/06/2016 13:19:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Users](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TenDangNhap] [varchar](255) NOT NULL,
	[MatKhau] [varchar](50) NULL,
	[TenHienThi] [nvarchar](255) NULL,
	[Quyen] [int] NULL,
	[GhiChu] [ntext] NULL,
	[ThoiGiaDangNhapGanNhat] [datetime] NULL,
	[MaXacNhan] [varchar](50) NULL,
	[NgayTao] [datetime] NULL,
	[TinhTrang] [int] NULL,
	[NgayCapNhat] [datetime] NULL,
	[avatar] [nvarchar](250) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Websites]    Script Date: 28/06/2016 13:19:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Websites](
	[sdt1] [nvarchar](50) NULL,
	[sdt2] [nvarchar](50) NULL,
	[email] [nvarchar](250) NULL,
	[skype] [nvarchar](250) NULL,
	[diachi] [nvarchar](250) NULL,
	[twitter] [nvarchar](250) NULL,
	[facebook] [nvarchar](250) NULL,
	[tenshop] [nvarchar](250) NULL,
	[googlemap] [nvarchar](250) NULL,
	[linkWebsites] [nvarchar](250) NULL,
	[favaicon] [nvarchar](250) NULL,
	[thoigiantao] [datetime] NULL,
	[thoigiancapnhat] [datetime] NULL,
	[nguoichinhsua] [nvarchar](250) NULL,
	[ghichi] [nvarchar](250) NULL,
	[TrangThai] [bit] NULL,
	[id] [decimal](18, 0) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[aspnet_Applications] ([ApplicationName], [LoweredApplicationName], [ApplicationId], [Description]) VALUES (N'/', N'/', N'd8dfd192-c748-4c82-bf2a-8531c19b6071', NULL)
INSERT [dbo].[aspnet_Applications] ([ApplicationName], [LoweredApplicationName], [ApplicationId], [Description]) VALUES (N'SecurityTutorials', N'securitytutorials', N'047a4b88-0520-4ac6-8652-4a72ecf5583f', NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'd8dfd192-c748-4c82-bf2a-8531c19b6071', N'4cda3bf9-abea-4e76-ab50-eecd8770f51d', N'1xtL25h+M1wFkmkfRtW9mJ8hOFg=', 1, N'8PEktWZFfhDOzyAse8d2nA==', NULL, N'badat52@gmail.com', N'badat52@gmail.com', N'a', N'3l0mqDQ4sVmZ0hLmQ8CvjEoqlFc=', 1, 0, CAST(N'2016-05-05 08:14:31.000' AS DateTime), CAST(N'2016-05-05 08:14:31.000' AS DateTime), CAST(N'2016-05-05 08:14:31.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'd8dfd192-c748-4c82-bf2a-8531c19b6071', N'7a3f6936-2775-419b-8139-112e03d676bb', N'0bbEKPK1C1a+Zrhq9LeXPHDSPtA=', 1, N'4/vUAT/IKfASoWhChseWLA==', NULL, N'tamnt@mecloud.com', N'tamnt@mecloud.com', N'a', N'BRiir1I56jjy+Aa4mD6DqDHygwg=', 1, 1, CAST(N'2016-05-26 22:12:54.000' AS DateTime), CAST(N'2016-05-26 22:12:54.000' AS DateTime), CAST(N'2016-05-26 22:27:49.093' AS DateTime), CAST(N'2016-05-26 22:36:16.140' AS DateTime), 5, CAST(N'2016-05-26 22:36:16.140' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'd8dfd192-c748-4c82-bf2a-8531c19b6071', N'7c5fcf09-0a47-4b6d-9c2d-6c45b1e231c1', N'B7R2CyD5uifD68Oz7lUGNYRK//8=', 1, N'celn0njFoBCk9Bwq7pFa4g==', NULL, N'tamtam23423@gmail.com', N'tamtam23423@gmail.com', N'a', N'h7bhbSxf3km/xjcyQNnXiTjP7ag=', 0, 0, CAST(N'2016-05-26 22:58:26.000' AS DateTime), CAST(N'2016-05-26 22:58:26.000' AS DateTime), CAST(N'2016-05-26 22:58:26.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'd8dfd192-c748-4c82-bf2a-8531c19b6071', N'7c51454e-f6e3-49ff-86e5-0a018074d6d9', N'0Yeg6O00avjQsnhSVIZJWjBxTkU=', 1, N'A+46iG8OYwbHlwbnulKELw==', NULL, N'tamthanh770@gmail.com', N'tamthanh770@gmail.com', N'a', N'U2c2gyBq9sV+AMUyBE+mX79J+Zc=', 0, 1, CAST(N'2016-05-05 08:10:10.000' AS DateTime), CAST(N'2016-05-05 08:10:10.000' AS DateTime), CAST(N'2016-05-05 08:10:10.000' AS DateTime), CAST(N'2016-05-20 15:33:55.380' AS DateTime), 5, CAST(N'2016-05-20 15:33:55.380' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'd8dfd192-c748-4c82-bf2a-8531c19b6071', N'ade2b4d1-337f-4c6d-a703-19acdd5e92da', N'E89s14GjD2NXaMWMKM+Bnus7k0g=', 1, N'y2rK4QMXjEX3OgeTzD979Q==', NULL, N'tamthanh770@gmail.com', N'tamthanh770@gmail.com', N'a', N'Y7ks0ldSBBC8ivQKHT/RLkZEHjA=', 1, 0, CAST(N'2016-05-05 09:27:04.000' AS DateTime), CAST(N'2016-05-06 17:26:27.260' AS DateTime), CAST(N'2016-05-05 09:27:04.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 2, CAST(N'2016-05-26 22:45:08.817' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'd8dfd192-c748-4c82-bf2a-8531c19b6071', N'149d5c7e-3edc-4fce-ad61-24c93bd22990', N'mOjGb8dRbYPf3sRVnsVXOmsT8ng=', 1, N'ikKWyT1PTWYLPWNZ2Rzjkg==', NULL, N'tamthanh770@gmail.com', N'tamthanh770@gmail.com', N'a', N'ObanSevLMuCPTknSe/5VwrNh7lk=', 1, 0, CAST(N'2016-05-16 20:45:18.000' AS DateTime), CAST(N'2016-05-16 21:32:45.367' AS DateTime), CAST(N'2016-05-16 20:45:18.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'd8dfd192-c748-4c82-bf2a-8531c19b6071', N'286a2ebf-86dd-4632-afb2-cbe0dbbe3c32', N'd9PMXFnay/ut4fo4NK48Tnl7Fus=', 1, N'h8ISF4Q69ig/l/7VToFF9A==', NULL, N'tamthanh770@gmail.com', N'tamthanh770@gmail.com', N'a', N'lw7JPz8itv4I02pmXut5xTq2LqE=', 1, 1, CAST(N'2016-05-05 07:25:31.000' AS DateTime), CAST(N'2016-05-05 07:25:31.000' AS DateTime), CAST(N'2016-05-05 07:25:31.000' AS DateTime), CAST(N'2016-05-05 09:20:58.637' AS DateTime), 5, CAST(N'2016-05-05 09:20:58.637' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'd8dfd192-c748-4c82-bf2a-8531c19b6071', N'8162365a-c8d1-498d-84cb-06397afc1afd', N'2g4jRKmUguv6FkkzB/cMnx/FOlE=', 1, N'LK1kgISkobozAReoQwG7cg==', NULL, N'tamthanh770@gmail.com', N'tamthanh770@gmail.com', N'a', N'twRfUSLeIKjfZOIRe8NH8f3Xtgg=', 1, 0, CAST(N'2016-05-20 18:31:40.000' AS DateTime), CAST(N'2016-05-20 18:31:40.000' AS DateTime), CAST(N'2016-05-20 18:31:40.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'd8dfd192-c748-4c82-bf2a-8531c19b6071', N'2d819835-2796-436c-ac18-71feaa59d2c6', N'MO5YSAW7MmKf8QQLKsy0mL5vajI=', 1, N'lDhNuINy5PyQB/6UqVRuyg==', NULL, N'tamthanh771@gmail.com', N'tamthanh771@gmail.com', N'a', N'r/Hakbzb3jVxXacERKd7ASEbNt4=', 1, 0, CAST(N'2016-05-06 19:31:54.000' AS DateTime), CAST(N'2016-05-20 06:33:10.190' AS DateTime), CAST(N'2016-05-06 21:55:06.750' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 1, CAST(N'2016-06-07 13:38:48.713' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'd8dfd192-c748-4c82-bf2a-8531c19b6071', N'3a3e7d4f-60cb-4f9e-aba4-ff2c6a597b4c', N'uTSm8ets226SXC6Dg6CNkrl4a0g=', 1, N'0wVrzXbaeLj9Ybn4xAQBZA==', NULL, N'tamtam23423@gmail.com', N'tamtam23423@gmail.com', N'a', N'x3+FHylpjdNkTBn8unx0FYynlOM=', 1, 0, CAST(N'2016-06-07 11:24:14.000' AS DateTime), CAST(N'2016-06-07 11:24:14.000' AS DateTime), CAST(N'2016-06-07 11:24:14.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'd8dfd192-c748-4c82-bf2a-8531c19b6071', N'b296196c-86a6-4a4e-b425-78faa1ff69d9', N'h8YmeOAmc123uoNoSV6k/6Jq+wQ=', 1, N'M8yLU179PDXKiWvsHIJ1jQ==', NULL, N'luixui@gmail.com', N'luixui@gmail.com', N'a', N'5PO41IrRQT3JvuiqkgpGGFTDUk0=', 1, 0, CAST(N'2016-06-07 11:40:03.000' AS DateTime), CAST(N'2016-06-07 11:40:03.000' AS DateTime), CAST(N'2016-06-07 11:40:03.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'd8dfd192-c748-4c82-bf2a-8531c19b6071', N'000f7b28-eda4-479b-8738-c562aaea44d5', N'W+GYctP1KqZJoxeIHCB6Xpqkzyw=', 1, N'3XVBnwGtG/A4w00KSt/62Q==', NULL, N'admin@gmail.com', N'admin@gmail.com', N'a', N'z1GtVR0WkgVrnf5cTt859/DvIWU=', 0, 0, CAST(N'2016-06-07 11:52:56.000' AS DateTime), CAST(N'2016-06-07 11:52:56.000' AS DateTime), CAST(N'2016-06-07 11:52:56.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'd8dfd192-c748-4c82-bf2a-8531c19b6071', N'15679492-1cad-416e-bf3f-1065337df40c', N'ucz5QczlG+3B5vz7jy6cJXxVewQ=', 1, N'7f8+9Azvfv5+ADqzLO3aiQ==', NULL, N'tamthanh770@gmail.com', N'tamthanh770@gmail.com', N'a', N'SzGhKbXtA4TxP3/NEHBT8gGLfPQ=', 1, 0, CAST(N'2016-06-27 15:46:16.000' AS DateTime), CAST(N'2016-06-27 15:46:16.000' AS DateTime), CAST(N'2016-06-27 15:46:16.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), N'default avatar')
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'd8dfd192-c748-4c82-bf2a-8531c19b6071', N'c1310bec-99b7-453d-8e18-4e51e2f97b6b', N'IuKoxj5f1gK43tl/Cq/XCwCa2lo=', 1, N'mNWq54zZE2NvpRH1Wyw8XQ==', NULL, N'tamthanh777@gmail.com', N'tamthanh777@gmail.com', N'a', N'vL6BBNvwbEn5DA8Bldy3KMm5EBk=', 1, 0, CAST(N'2016-06-27 15:48:48.000' AS DateTime), CAST(N'2016-06-27 15:48:48.000' AS DateTime), CAST(N'2016-06-27 15:48:48.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), N'default avatar')
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'd8dfd192-c748-4c82-bf2a-8531c19b6071', N'518dd798-22bf-48a6-b6fe-2cb4a09fc701', N'GuW5qL7pFqui8tBu9+U82eJs9hg=', 1, N'4vscKqbWsZFCuJe8veuEhA==', NULL, N'tamnt@mecloud.com', N'tamnt@mecloud.com', N'a', N'18HHYNsH6XgOizEmsX9VdHH4PCA=', 1, 0, CAST(N'2016-06-27 15:56:03.000' AS DateTime), CAST(N'2016-06-27 15:56:03.000' AS DateTime), CAST(N'2016-06-27 15:56:03.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), N'default avatar')
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'd8dfd192-c748-4c82-bf2a-8531c19b6071', N'be24ef60-d23c-4db8-99a3-66b42ec008dc', N'4RwhlLL6t6xv4pNhHV2iQlbDvmY=', 1, N'FPHCLuYHBWuUS+hlWQ/uyQ==', NULL, N'test@gmail.com', N'test@gmail.com', N'a', N'1askkbIVmH7Az6rsWvK0ONPKcCg=', 1, 0, CAST(N'2016-06-07 13:40:28.000' AS DateTime), CAST(N'2016-06-27 12:06:09.097' AS DateTime), CAST(N'2016-06-07 13:40:28.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'd8dfd192-c748-4c82-bf2a-8531c19b6071', N'75dd890e-69f6-4637-96a1-d70d60c8a69c', N'o+/E3EVBb0frnZGpQ25pRckR7no=', 1, N'ira+lvcAAGajgzY21uNTsQ==', NULL, N'admin@gmail.com', N'admin@gmail.com', N'a', N'EqzHzimsPCYl70KFS34j+DJgOEk=', 1, 0, CAST(N'2016-06-27 16:04:27.000' AS DateTime), CAST(N'2016-06-27 16:04:27.000' AS DateTime), CAST(N'2016-06-27 16:04:27.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), N'default avatar')
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'd8dfd192-c748-4c82-bf2a-8531c19b6071', N'6eb10ecb-e422-4ad7-bd44-b91f2a95e0e1', N'ti2PWKLrDVqz2elj6KeJb1GHdfk=', 1, N'Fk2QeWKFIH1lfi/zORsoPA==', NULL, N'tamtam23423@gmail.com', N'tamtam23423@gmail.com', N'a', N'DwE17ppIx6Ff0KfJpdQ+XdgK2i0=', 1, 0, CAST(N'2016-06-27 16:05:50.000' AS DateTime), CAST(N'2016-06-27 16:05:50.000' AS DateTime), CAST(N'2016-06-27 16:05:50.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), N'default avatar')
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'd8dfd192-c748-4c82-bf2a-8531c19b6071', N'3bdd82a4-d8ab-4e98-a456-fa251d0ada6b', N'ozM/LkkQLQ37vz0Bu1WmCJYNJVY=', 1, N'n11sHQSfr4mofMHgwDTOkg==', NULL, N'abc@gmail.com', N'abc@gmail.com', N'a', N'+dRat6OweH8eYzlvEQXusZcmJEc=', 1, 0, CAST(N'2016-06-27 16:08:04.000' AS DateTime), CAST(N'2016-06-27 16:08:04.000' AS DateTime), CAST(N'2016-06-27 16:08:04.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), N'default avatar')
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'd8dfd192-c748-4c82-bf2a-8531c19b6071', N'c83adad8-ccbf-457d-aa7b-73abf967e7d5', N'h7bHT+EAfO8DnA/nwqt/HoYIXWc=', 1, N'0IQkbR09+/HAMzKjOTCFMw==', NULL, N'tamnt12@mecloud.com', N'tamnt12@mecloud.com', N'a', N'l24+VouzkOzW8IdHAB2yFk3lef4=', 1, 0, CAST(N'2016-06-27 16:09:31.000' AS DateTime), CAST(N'2016-06-28 06:04:38.610' AS DateTime), CAST(N'2016-06-27 16:09:31.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), N'default avatar')
INSERT [dbo].[aspnet_Roles] ([ApplicationId], [RoleId], [RoleName], [LoweredRoleName], [Description]) VALUES (N'047a4b88-0520-4ac6-8652-4a72ecf5583f', N'4b85b45d-c538-499b-b8a8-26d44094c8ba', N'acds', N'acds', NULL)
INSERT [dbo].[aspnet_Roles] ([ApplicationId], [RoleId], [RoleName], [LoweredRoleName], [Description]) VALUES (N'047a4b88-0520-4ac6-8652-4a72ecf5583f', N'b91a5e10-97e5-4f2e-b1de-6299be416da7', N'Admin', N'admin', NULL)
INSERT [dbo].[aspnet_Roles] ([ApplicationId], [RoleId], [RoleName], [LoweredRoleName], [Description]) VALUES (N'047a4b88-0520-4ac6-8652-4a72ecf5583f', N'5134ec03-6340-4f94-bd49-25ea380ed219', N'asasasfa', N'asasasfa', NULL)
INSERT [dbo].[aspnet_Roles] ([ApplicationId], [RoleId], [RoleName], [LoweredRoleName], [Description]) VALUES (N'047a4b88-0520-4ac6-8652-4a72ecf5583f', N'004a2474-37e8-4ab8-bbb6-f2458bfabd91', N'az', N'az', NULL)
INSERT [dbo].[aspnet_Roles] ([ApplicationId], [RoleId], [RoleName], [LoweredRoleName], [Description]) VALUES (N'047a4b88-0520-4ac6-8652-4a72ecf5583f', N'f44dcb80-da27-444f-8cf6-d9a411e2576b', N'dsdgsdgs', N'dsdgsdgs', NULL)
INSERT [dbo].[aspnet_Roles] ([ApplicationId], [RoleId], [RoleName], [LoweredRoleName], [Description]) VALUES (N'047a4b88-0520-4ac6-8652-4a72ecf5583f', N'd83f3544-982e-4fa9-a020-03c162351f68', N'user', N'user', NULL)
INSERT [dbo].[aspnet_Roles] ([ApplicationId], [RoleId], [RoleName], [LoweredRoleName], [Description]) VALUES (N'047a4b88-0520-4ac6-8652-4a72ecf5583f', N'04bde0bb-c8d6-4720-b6c6-f7c27cd652b6', N'lamda', N'lamda', NULL)
INSERT [dbo].[aspnet_SchemaVersions] ([Feature], [CompatibleSchemaVersion], [IsCurrentVersion]) VALUES (N'common', N'1', 1)
INSERT [dbo].[aspnet_SchemaVersions] ([Feature], [CompatibleSchemaVersion], [IsCurrentVersion]) VALUES (N'health monitoring', N'1', 1)
INSERT [dbo].[aspnet_SchemaVersions] ([Feature], [CompatibleSchemaVersion], [IsCurrentVersion]) VALUES (N'membership', N'1', 1)
INSERT [dbo].[aspnet_SchemaVersions] ([Feature], [CompatibleSchemaVersion], [IsCurrentVersion]) VALUES (N'personalization', N'1', 1)
INSERT [dbo].[aspnet_SchemaVersions] ([Feature], [CompatibleSchemaVersion], [IsCurrentVersion]) VALUES (N'profile', N'1', 1)
INSERT [dbo].[aspnet_SchemaVersions] ([Feature], [CompatibleSchemaVersion], [IsCurrentVersion]) VALUES (N'role manager', N'1', 1)
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'047a4b88-0520-4ac6-8652-4a72ecf5583f', N'59e1d20b-917e-4a6d-9fe0-6259da3b107e', N'admin', N'admin', NULL, 0, CAST(N'2016-05-05 20:01:36.830' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'047a4b88-0520-4ac6-8652-4a72ecf5583f', N'ef5e6ea0-0e18-4230-bf85-ef840839ccc9', N'bqdat', N'bqdat', NULL, 0, CAST(N'2016-05-05 20:31:28.750' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'047a4b88-0520-4ac6-8652-4a72ecf5583f', N'e2aa26d9-6905-42b2-b9c5-3704f53b0f32', N'tamnt', N'tamnt', NULL, 0, CAST(N'2016-05-06 16:08:04.520' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'047a4b88-0520-4ac6-8652-4a72ecf5583f', N'41354dc5-46dc-49eb-8727-048454ee57eb', N'tamnt51', N'tamnt51', NULL, 0, CAST(N'2016-05-06 02:07:16.257' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'047a4b88-0520-4ac6-8652-4a72ecf5583f', N'061e1335-67cc-4f6f-bc5d-43b6ccb762a8', N'tamtam', N'tamtam', NULL, 0, CAST(N'2016-05-06 19:41:30.900' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'd8dfd192-c748-4c82-bf2a-8531c19b6071', N'7c51454e-f6e3-49ff-86e5-0a018074d6d9', N'admin', N'admin', NULL, 0, CAST(N'2016-05-05 08:10:10.000' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'd8dfd192-c748-4c82-bf2a-8531c19b6071', N'4cda3bf9-abea-4e76-ab50-eecd8770f51d', N'bqdat', N'bqdat', NULL, 0, CAST(N'2016-05-05 08:14:31.000' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'd8dfd192-c748-4c82-bf2a-8531c19b6071', N'7c5fcf09-0a47-4b6d-9c2d-6c45b1e231c1', N'safafaf', N'safafaf', NULL, 0, CAST(N'2016-05-26 22:58:26.000' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'd8dfd192-c748-4c82-bf2a-8531c19b6071', N'286a2ebf-86dd-4632-afb2-cbe0dbbe3c32', N'tamnt', N'tamnt', NULL, 0, CAST(N'2016-05-05 07:25:31.000' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'd8dfd192-c748-4c82-bf2a-8531c19b6071', N'ade2b4d1-337f-4c6d-a703-19acdd5e92da', N'tamnt51', N'tamnt51', NULL, 0, CAST(N'2016-05-06 17:26:27.260' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'd8dfd192-c748-4c82-bf2a-8531c19b6071', N'7a3f6936-2775-419b-8139-112e03d676bb', N'tamnt513', N'tamnt513', NULL, 0, CAST(N'2016-05-26 22:12:54.000' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'd8dfd192-c748-4c82-bf2a-8531c19b6071', N'149d5c7e-3edc-4fce-ad61-24c93bd22990', N'tamnt5293', N'tamnt5293', NULL, 0, CAST(N'2016-05-16 21:32:45.367' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'd8dfd192-c748-4c82-bf2a-8531c19b6071', N'8162365a-c8d1-498d-84cb-06397afc1afd', N'tamnt79', N'tamnt79', NULL, 0, CAST(N'2016-05-20 18:31:40.000' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'd8dfd192-c748-4c82-bf2a-8531c19b6071', N'2d819835-2796-436c-ac18-71feaa59d2c6', N'tamtam', N'tamtam', NULL, 0, CAST(N'2016-05-20 06:33:10.190' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'd8dfd192-c748-4c82-bf2a-8531c19b6071', N'3a3e7d4f-60cb-4f9e-aba4-ff2c6a597b4c', N'lixuxi', N'lixuxi', NULL, 0, CAST(N'2016-06-07 11:24:14.000' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'd8dfd192-c748-4c82-bf2a-8531c19b6071', N'b296196c-86a6-4a4e-b425-78faa1ff69d9', N'luixui', N'luixui', NULL, 0, CAST(N'2016-06-07 11:40:03.000' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'd8dfd192-c748-4c82-bf2a-8531c19b6071', N'000f7b28-eda4-479b-8738-c562aaea44d5', N'admin2', N'admin2', NULL, 0, CAST(N'2016-06-07 11:52:56.000' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'd8dfd192-c748-4c82-bf2a-8531c19b6071', N'15679492-1cad-416e-bf3f-1065337df40c', N'aaaaaa', N'aaaaaa', NULL, 0, CAST(N'2016-06-27 15:46:16.000' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'047a4b88-0520-4ac6-8652-4a72ecf5583f', N'c0f4291a-5b6e-4489-9018-468adbe604f1', N'aaaaaa', N'aaaaaa', NULL, 0, CAST(N'2016-06-27 15:46:34.950' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'd8dfd192-c748-4c82-bf2a-8531c19b6071', N'c1310bec-99b7-453d-8e18-4e51e2f97b6b', N'aaaaaa7', N'aaaaaa7', NULL, 0, CAST(N'2016-06-27 15:48:48.000' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'047a4b88-0520-4ac6-8652-4a72ecf5583f', N'7dbe0755-4e6c-46bb-ae22-bedb68dc045d', N'aaaaaa7', N'aaaaaa7', NULL, 0, CAST(N'2016-06-27 15:48:50.813' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'd8dfd192-c748-4c82-bf2a-8531c19b6071', N'518dd798-22bf-48a6-b6fe-2cb4a09fc701', N'thanhtam', N'thanhtam', NULL, 0, CAST(N'2016-06-27 15:56:03.000' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'047a4b88-0520-4ac6-8652-4a72ecf5583f', N'b47f6166-f4bb-42be-a04a-97bca63302c5', N'thanhtam', N'thanhtam', NULL, 0, CAST(N'2016-06-27 15:56:04.000' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'047a4b88-0520-4ac6-8652-4a72ecf5583f', N'ffc89ccc-6053-4aeb-bc38-bb1f697f8597', N'admin2', N'admin2', NULL, 0, CAST(N'2016-06-07 11:52:56.383' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'd8dfd192-c748-4c82-bf2a-8531c19b6071', N'be24ef60-d23c-4db8-99a3-66b42ec008dc', N'test', N'test', NULL, 0, CAST(N'2016-06-27 12:06:09.097' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'047a4b88-0520-4ac6-8652-4a72ecf5583f', N'2a0c6559-59a8-41e8-a810-4d50425410b6', N'test', N'test', NULL, 0, CAST(N'2016-06-07 13:40:28.230' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'd8dfd192-c748-4c82-bf2a-8531c19b6071', N'75dd890e-69f6-4637-96a1-d70d60c8a69c', N'admin123', N'admin123', NULL, 0, CAST(N'2016-06-27 16:04:27.000' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'047a4b88-0520-4ac6-8652-4a72ecf5583f', N'40e794c0-bc28-4918-b8e8-a4c48eedc415', N'admin123', N'admin123', NULL, 0, CAST(N'2016-06-27 16:04:27.430' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'd8dfd192-c748-4c82-bf2a-8531c19b6071', N'6eb10ecb-e422-4ad7-bd44-b91f2a95e0e1', N'tamtam23423', N'tamtam23423', NULL, 0, CAST(N'2016-06-27 16:05:50.000' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'047a4b88-0520-4ac6-8652-4a72ecf5583f', N'011b22ef-7276-4e07-a554-4382206f1566', N'tamtam23423', N'tamtam23423', NULL, 0, CAST(N'2016-06-27 16:05:50.963' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'd8dfd192-c748-4c82-bf2a-8531c19b6071', N'3bdd82a4-d8ab-4e98-a456-fa251d0ada6b', N'abcabc', N'abcabc', NULL, 0, CAST(N'2016-06-27 16:08:04.000' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'047a4b88-0520-4ac6-8652-4a72ecf5583f', N'5eb3f2d6-d62a-4e33-9cd2-9c61fc516ce6', N'abcabc', N'abcabc', NULL, 0, CAST(N'2016-06-27 16:08:04.903' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'd8dfd192-c748-4c82-bf2a-8531c19b6071', N'c83adad8-ccbf-457d-aa7b-73abf967e7d5', N'tamnt12', N'tamnt12', NULL, 0, CAST(N'2016-06-28 06:04:38.610' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'047a4b88-0520-4ac6-8652-4a72ecf5583f', N'73eead8e-9be7-46be-9479-78f0b759e2ae', N'tamnt12', N'tamnt12', NULL, 0, CAST(N'2016-06-27 16:09:31.427' AS DateTime))
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'41354dc5-46dc-49eb-8727-048454ee57eb', N'b91a5e10-97e5-4f2e-b1de-6299be416da7')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'e2aa26d9-6905-42b2-b9c5-3704f53b0f32', N'b91a5e10-97e5-4f2e-b1de-6299be416da7')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'011b22ef-7276-4e07-a554-4382206f1566', N'd83f3544-982e-4fa9-a020-03c162351f68')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'061e1335-67cc-4f6f-bc5d-43b6ccb762a8', N'b91a5e10-97e5-4f2e-b1de-6299be416da7')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'c0f4291a-5b6e-4489-9018-468adbe604f1', N'd83f3544-982e-4fa9-a020-03c162351f68')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'2a0c6559-59a8-41e8-a810-4d50425410b6', N'b91a5e10-97e5-4f2e-b1de-6299be416da7')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'59e1d20b-917e-4a6d-9fe0-6259da3b107e', N'b91a5e10-97e5-4f2e-b1de-6299be416da7')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'73eead8e-9be7-46be-9479-78f0b759e2ae', N'd83f3544-982e-4fa9-a020-03c162351f68')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'b47f6166-f4bb-42be-a04a-97bca63302c5', N'd83f3544-982e-4fa9-a020-03c162351f68')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'5eb3f2d6-d62a-4e33-9cd2-9c61fc516ce6', N'd83f3544-982e-4fa9-a020-03c162351f68')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'40e794c0-bc28-4918-b8e8-a4c48eedc415', N'd83f3544-982e-4fa9-a020-03c162351f68')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'ffc89ccc-6053-4aeb-bc38-bb1f697f8597', N'b91a5e10-97e5-4f2e-b1de-6299be416da7')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'7dbe0755-4e6c-46bb-ae22-bedb68dc045d', N'd83f3544-982e-4fa9-a020-03c162351f68')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'ef5e6ea0-0e18-4230-bf85-ef840839ccc9', N'b91a5e10-97e5-4f2e-b1de-6299be416da7')
INSERT [dbo].[Cart] ([ID], [CartId], [ProductId], [Count], [DateCreated]) VALUES (0, N'88ed97a1-4c81-48b4-aedc-39b21f5d44e2', 5, 2, CAST(N'2016-06-23 14:52:20.617' AS DateTime))
INSERT [dbo].[Cart] ([ID], [CartId], [ProductId], [Count], [DateCreated]) VALUES (1, N'13315a27-9b33-4ac4-98b0-69be3fad45f9', 5, 2, CAST(N'2016-06-23 19:14:58.097' AS DateTime))
INSERT [dbo].[Cart] ([ID], [CartId], [ProductId], [Count], [DateCreated]) VALUES (2, N'ee763191-1f13-4662-ae31-189baa757ed2', 5, 1, CAST(N'2016-06-23 19:24:29.637' AS DateTime))
INSERT [dbo].[Cart] ([ID], [CartId], [ProductId], [Count], [DateCreated]) VALUES (3, N'c4200c39-9525-4dbe-9dd3-27f97940fab5', 5, 1, CAST(N'2016-06-23 22:12:30.170' AS DateTime))
INSERT [dbo].[Cart] ([ID], [CartId], [ProductId], [Count], [DateCreated]) VALUES (4, N'8a7893a9-142c-4155-92c2-b99b09dceaf3', 5, 1, CAST(N'2016-06-23 23:44:42.543' AS DateTime))
INSERT [dbo].[Cart] ([ID], [CartId], [ProductId], [Count], [DateCreated]) VALUES (5, N'a047d57c-b228-4fcc-8d49-04c05f7f7db8', 5, 1, CAST(N'2016-06-24 00:15:39.273' AS DateTime))
INSERT [dbo].[Cart] ([ID], [CartId], [ProductId], [Count], [DateCreated]) VALUES (6, N'efc8d785-df06-4930-9fd2-e4085b6db6a3', 5, 1, CAST(N'2016-06-24 00:42:27.713' AS DateTime))
INSERT [dbo].[Cart] ([ID], [CartId], [ProductId], [Count], [DateCreated]) VALUES (7, N'46b12cc4-d6f5-44bd-9b56-bf951b3c6127', 5, 2, CAST(N'2016-06-24 00:44:57.240' AS DateTime))
INSERT [dbo].[Cart] ([ID], [CartId], [ProductId], [Count], [DateCreated]) VALUES (8, N'e16c5043-a2ab-41aa-a749-a4aed90c1753', 5, 3, CAST(N'2016-06-24 01:36:50.493' AS DateTime))
INSERT [dbo].[Cart] ([ID], [CartId], [ProductId], [Count], [DateCreated]) VALUES (9, N'3f356bd6-02e2-4ce3-967d-7e596ddc8dcf', 5, 1, CAST(N'2016-06-24 02:14:59.863' AS DateTime))
INSERT [dbo].[Cart] ([ID], [CartId], [ProductId], [Count], [DateCreated]) VALUES (10, N'ecf5e8e5-7f6e-4677-af9d-4929709150fd', 5, 1, CAST(N'2016-06-27 07:34:38.070' AS DateTime))
INSERT [dbo].[Cart] ([ID], [CartId], [ProductId], [Count], [DateCreated]) VALUES (11, N'640d5596-d6a9-46be-8a40-efa1b531205f', 5, 1, CAST(N'2016-06-27 07:41:44.033' AS DateTime))
INSERT [dbo].[Cart] ([ID], [CartId], [ProductId], [Count], [DateCreated]) VALUES (12, N'acef8ea9-e212-4ccd-8708-881ad3439f89', 5, 1, CAST(N'2016-06-28 00:15:18.110' AS DateTime))
INSERT [dbo].[Cart] ([ID], [CartId], [ProductId], [Count], [DateCreated]) VALUES (13, N'bfc48bd2-92f2-4815-a967-e37ba353fe7c', 5, 1, CAST(N'2016-06-28 00:23:09.957' AS DateTime))
INSERT [dbo].[Cart] ([ID], [CartId], [ProductId], [Count], [DateCreated]) VALUES (14, N'13068078-d840-46ba-8315-7ccea8f6a9c7', 5, 1, CAST(N'2016-06-28 13:04:51.157' AS DateTime))
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([ID], [MaLoai], [TenLoai], [TuKhoa], [TinhTrang], [NgayTao], [NgayCapNhat], [GhiChu]) VALUES (1, N'WINECA0002', N'loại 1', N'laooi', 3, CAST(N'2016-05-06 13:41:45.207' AS DateTime), CAST(N'2016-05-06 13:41:45.207' AS DateTime), N'jnvjcbvjhbfd')
INSERT [dbo].[Categories] ([ID], [MaLoai], [TenLoai], [TuKhoa], [TinhTrang], [NgayTao], [NgayCapNhat], [GhiChu]) VALUES (2, N'WINECA0003', N'Rượu Ngoại', N'ruou_ngoai', 1, CAST(N'2016-05-09 22:17:58.633' AS DateTime), CAST(N'2016-05-09 22:17:58.633' AS DateTime), N'rượu nhập khẩu')
INSERT [dbo].[Categories] ([ID], [MaLoai], [TenLoai], [TuKhoa], [TinhTrang], [NgayTao], [NgayCapNhat], [GhiChu]) VALUES (3, N'WINECA0004', N'Rượi Vang', N'ruou_vang', 1, CAST(N'2016-05-09 22:18:11.773' AS DateTime), CAST(N'2016-05-09 22:18:11.773' AS DateTime), N'')
INSERT [dbo].[Categories] ([ID], [MaLoai], [TenLoai], [TuKhoa], [TinhTrang], [NgayTao], [NgayCapNhat], [GhiChu]) VALUES (4, N'WINECA0005', N'Rượu Nhật', N'ruou_nhat', 1, CAST(N'2016-05-09 22:18:21.540' AS DateTime), CAST(N'2016-05-09 22:18:21.540' AS DateTime), N'')
INSERT [dbo].[Categories] ([ID], [MaLoai], [TenLoai], [TuKhoa], [TinhTrang], [NgayTao], [NgayCapNhat], [GhiChu]) VALUES (5, N'WINECA0006', N'Rượu Hàn', N'ruou_han', 1, CAST(N'2016-05-09 22:18:31.723' AS DateTime), CAST(N'2016-05-09 22:18:31.723' AS DateTime), N'')
SET IDENTITY_INSERT [dbo].[Categories] OFF
INSERT [dbo].[Contacts] ([id], [ip], [thoigian], [name], [email], [tieude], [noidung], [trangthai]) VALUES (CAST(63598590751 AS Decimal(18, 0)), N'::1', CAST(N'2016-05-11 19:12:31.853' AS DateTime), N'thanh tam', N'tamthanh770@gmail.com', N'ajksbvjabv', N'jkdsjvbsjdbdss', 0)
INSERT [dbo].[Contacts] ([id], [ip], [thoigian], [name], [email], [tieude], [noidung], [trangthai]) VALUES (CAST(63598590871 AS Decimal(18, 0)), N'::1', CAST(N'2016-05-11 19:14:31.990' AS DateTime), N'gsdgsdgs', N'tamthanh770@gmail.com', N'sdsgsdg', N'dsgdsgsdg', 0)
INSERT [dbo].[Contacts] ([id], [ip], [thoigian], [name], [email], [tieude], [noidung], [trangthai]) VALUES (CAST(63598591465 AS Decimal(18, 0)), N'::1', CAST(N'2016-05-11 19:24:25.093' AS DateTime), N'van sine', N'tamthanh770@gmail.com', N'tieu de rong', N'sndkgnsdkjdnsnvsdvnsdvksdnvkjsdnvksbsdb', 0)
INSERT [dbo].[Contacts] ([id], [ip], [thoigian], [name], [email], [tieude], [noidung], [trangthai]) VALUES (CAST(63602715867 AS Decimal(18, 0)), N'::1', CAST(N'2016-06-28 13:04:27.587' AS DateTime), N'tam', N'tamthanh770@gmail.com', N'2222', N'gggg', 1)
SET IDENTITY_INSERT [dbo].[Customers] ON 

INSERT [dbo].[Customers] ([ID], [MaKH], [TenKH], [DiaChi], [SDT], [Email], [User_ID], [TrangThai], [NgayTao], [NgayCapNhat], [GhiChu]) VALUES (1, N'KH00000002', N'tamnt52', N'sdfhjbdbh', N'1535131531', N'tamthanh770@gmail.com', 2, 1, CAST(N'2016-05-17 03:45:19.247' AS DateTime), CAST(N'2016-05-17 03:45:19.247' AS DateTime), N'')
INSERT [dbo].[Customers] ([ID], [MaKH], [TenKH], [DiaChi], [SDT], [Email], [User_ID], [TrangThai], [NgayTao], [NgayCapNhat], [GhiChu]) VALUES (2, N'KH00000003', N'asfdasf', N'aaaa', N'aaaa', N'tamthanh777@gmail.com', 3, 1, CAST(N'2016-06-27 22:49:09.373' AS DateTime), CAST(N'2016-06-27 22:49:08.390' AS DateTime), N'')
INSERT [dbo].[Customers] ([ID], [MaKH], [TenKH], [DiaChi], [SDT], [Email], [User_ID], [TrangThai], [NgayTao], [NgayCapNhat], [GhiChu]) VALUES (3, N'KH00000004', N'thanh tam', N'thanhtam', N'thanhtam', N'tamnt@mecloud.com', 4, 1, CAST(N'2016-06-27 22:56:04.407' AS DateTime), CAST(N'2016-06-27 22:56:04.407' AS DateTime), N'')
INSERT [dbo].[Customers] ([ID], [MaKH], [TenKH], [DiaChi], [SDT], [Email], [User_ID], [TrangThai], [NgayTao], [NgayCapNhat], [GhiChu]) VALUES (4, N'KH00000005', N'thanhtam', N'admin123', N'admin123', N'admin@gmail.com', 5, 1, CAST(N'2016-06-27 23:04:27.487' AS DateTime), CAST(N'2016-06-27 23:04:27.487' AS DateTime), N'')
INSERT [dbo].[Customers] ([ID], [MaKH], [TenKH], [DiaChi], [SDT], [Email], [User_ID], [TrangThai], [NgayTao], [NgayCapNhat], [GhiChu]) VALUES (5, N'KH00000006', N'tamtam23423', N'admin123', N'admin123', N'tamtam23423@gmail.com', 6, 1, CAST(N'2016-06-27 23:05:51.007' AS DateTime), CAST(N'2016-06-27 23:05:51.007' AS DateTime), N'')
INSERT [dbo].[Customers] ([ID], [MaKH], [TenKH], [DiaChi], [SDT], [Email], [User_ID], [TrangThai], [NgayTao], [NgayCapNhat], [GhiChu]) VALUES (6, N'KH00000007', N'abcabc', N'abcabc', N'abcabc', N'abc@gmail.com', 7, 1, CAST(N'2016-06-27 23:08:04.997' AS DateTime), CAST(N'2016-06-27 23:08:04.997' AS DateTime), N'')
INSERT [dbo].[Customers] ([ID], [MaKH], [TenKH], [DiaChi], [SDT], [Email], [User_ID], [TrangThai], [NgayTao], [NgayCapNhat], [GhiChu]) VALUES (7, N'KH00000008', N'tamnt12', N'tamnt12', N'tamnt12', N'tamnt12@mecloud.com', 8, 1, CAST(N'2016-06-27 23:09:31.463' AS DateTime), CAST(N'2016-06-27 23:09:31.463' AS DateTime), N'')
SET IDENTITY_INSERT [dbo].[Customers] OFF
INSERT [dbo].[Jobs] ([id], [title], [img], [tag], [day], [nview], [rate], [nrate], [contents], [dayupdate], [usercreate], [TrangThai]) VALUES (CAST(63601014761186 AS Decimal(18, 0)), N'sdgaga12', N'img\job\c.jpg', N'test', CAST(N'2016-06-08 20:32:46.367' AS DateTime), 0, 0, 0, N'<p>agaga12</p>
', CAST(N'2016-06-08 23:01:54.117' AS DateTime), N'test', 0)
INSERT [dbo].[Jobs] ([id], [title], [img], [tag], [day], [nview], [rate], [nrate], [contents], [dayupdate], [usercreate], [TrangThai]) VALUES (CAST(63601015312999 AS Decimal(18, 0)), N'134141', N'', N'test', CAST(N'2016-06-08 20:41:53.000' AS DateTime), 0, 0, 0, N'<p>dgdgsdgsdg</p>
', CAST(N'2016-06-08 20:41:53.000' AS DateTime), N'test', 1)
INSERT [dbo].[Jobs] ([id], [title], [img], [tag], [day], [nview], [rate], [nrate], [contents], [dayupdate], [usercreate], [TrangThai]) VALUES (CAST(63601015450676 AS Decimal(18, 0)), N'134141', N'', N'test', CAST(N'2016-06-08 20:44:10.693' AS DateTime), 0, 0, 0, N'<p>dgdgsdgsdg</p>
', CAST(N'2016-06-08 20:44:10.693' AS DateTime), N'test', 0)
INSERT [dbo].[Jobs] ([id], [title], [img], [tag], [day], [nview], [rate], [nrate], [contents], [dayupdate], [usercreate], [TrangThai]) VALUES (CAST(63601015450691 AS Decimal(18, 0)), N'134141', N'', N'test', CAST(N'2016-06-08 20:44:10.693' AS DateTime), 0, 0, 0, N'<p>dgdgsdgsdg</p>
', CAST(N'2016-06-08 20:44:10.693' AS DateTime), N'test', 0)
INSERT [dbo].[Jobs] ([id], [title], [img], [tag], [day], [nview], [rate], [nrate], [contents], [dayupdate], [usercreate], [TrangThai]) VALUES (CAST(63601016551002 AS Decimal(18, 0)), N'asfa', N'', N'test', CAST(N'2016-06-08 21:02:31.003' AS DateTime), 0, 0, 0, N'<p>asfasfasfa</p>
', CAST(N'2016-06-08 21:02:31.003' AS DateTime), N'test', 0)
INSERT [dbo].[Jobs] ([id], [title], [img], [tag], [day], [nview], [rate], [nrate], [contents], [dayupdate], [usercreate], [TrangThai]) VALUES (CAST(63601021818522 AS Decimal(18, 0)), N'dsfadg', N'', N'test', CAST(N'2016-06-08 22:30:18.523' AS DateTime), 0, 0, 0, N'<p>adgasg</p>
', CAST(N'2016-06-08 22:30:18.523' AS DateTime), N'test', 0)
INSERT [dbo].[Jobs] ([id], [title], [img], [tag], [day], [nview], [rate], [nrate], [contents], [dayupdate], [usercreate], [TrangThai]) VALUES (CAST(63601022088177 AS Decimal(18, 0)), N'asdas', N'img\job\The Long Road to Docker - Jama Software.jpg', N'test', CAST(N'2016-06-08 22:34:48.177' AS DateTime), 0, 0, 0, N'<p>asdasdasd</p>
', CAST(N'2016-06-08 22:34:48.177' AS DateTime), N'test', 0)
INSERT [dbo].[Jobs] ([id], [title], [img], [tag], [day], [nview], [rate], [nrate], [contents], [dayupdate], [usercreate], [TrangThai]) VALUES (CAST(63601022229106 AS Decimal(18, 0)), N'afasf', N'img\job\237.jpg', N'test', CAST(N'2016-06-08 22:37:09.107' AS DateTime), 0, 0, 0, N'<p>afafadga</p>
', CAST(N'2016-06-08 22:37:09.107' AS DateTime), N'test', 0)
INSERT [dbo].[Jobs] ([id], [title], [img], [tag], [day], [nview], [rate], [nrate], [contents], [dayupdate], [usercreate], [TrangThai]) VALUES (CAST(63601022419466 AS Decimal(18, 0)), N'sdgdg', N'img\job\Amanti Vino-fin webready jpg-pano 1-6.jpg', N'test', CAST(N'2016-06-08 22:40:19.467' AS DateTime), 0, 0, 0, N'<p>sdgsdgsdg</p>
', CAST(N'2016-06-08 22:40:19.467' AS DateTime), N'test', 0)
INSERT [dbo].[Jobs] ([id], [title], [img], [tag], [day], [nview], [rate], [nrate], [contents], [dayupdate], [usercreate], [TrangThai]) VALUES (CAST(63601022622492 AS Decimal(18, 0)), N'asfasf', N'img\job\Amanti Vino-fin webready jpg-room.jpg', N'test', CAST(N'2016-06-08 22:43:42.493' AS DateTime), 0, 0, 0, N'<p>asfasf</p>
', CAST(N'2016-06-08 22:43:42.493' AS DateTime), N'test', 1)
INSERT [dbo].[Jobs] ([id], [title], [img], [tag], [day], [nview], [rate], [nrate], [contents], [dayupdate], [usercreate], [TrangThai]) VALUES (CAST(635983146559059039 AS Decimal(18, 0)), N'abc', N'../App_Themes/FrontEnd/img/08052016_023041_PM_e749eee0efdd262f8571458fa9594327.jpg', N'abc', CAST(N'2016-05-08 14:30:55.933' AS DateTime), 0, 0, 0, N'<p>dgsdgsdgsd</p>
', CAST(N'2016-05-08 14:30:55.933' AS DateTime), N'tamnt', 1)
INSERT [dbo].[Jobs] ([id], [title], [img], [tag], [day], [nview], [rate], [nrate], [contents], [dayupdate], [usercreate], [TrangThai]) VALUES (CAST(635983149475782952 AS Decimal(18, 0)), N'abc1', N'../App_Themes/FrontEnd/img/08052016_023547_PM_eden_nebula_2-wallpaper-1366x768.jpg', N'abc', CAST(N'2016-05-08 14:35:47.683' AS DateTime), 0, 0, 0, N'<p>thanhtam</p>', CAST(N'2016-05-08 14:35:47.683' AS DateTime), N'tamnt', 1)
INSERT [dbo].[Jobs] ([id], [title], [img], [tag], [day], [nview], [rate], [nrate], [contents], [dayupdate], [usercreate], [TrangThai]) VALUES (CAST(635983150647636943 AS Decimal(18, 0)), N'asfasfa', N'../App_Themes/FrontEnd/img/08052016_023547_PM_eden_nebula_2-wallpaper-1366x768.jpg', N'abc', CAST(N'2016-05-08 14:37:44.790' AS DateTime), 0, 0, 0, N'<p>asfasfasfasf</p>
', CAST(N'2016-05-08 14:37:44.790' AS DateTime), N'tamnt', 1)
INSERT [dbo].[Jobs] ([id], [title], [img], [tag], [day], [nview], [rate], [nrate], [contents], [dayupdate], [usercreate], [TrangThai]) VALUES (CAST(635983170127850706 AS Decimal(18, 0)), N'adadbsdfbdgngfndgnf', N'../App_Themes/FrontEnd/img/08052016_023547_PM_eden_nebula_2-wallpaper-1366x768.jpg', N'abc', CAST(N'2016-05-08 15:10:12.833' AS DateTime), 0, 2.5, 0, N'<p>sfnsfndnbnfdbfdbdfnbdfdfndfndfn</p>
', CAST(N'2016-05-08 15:10:12.833' AS DateTime), N'tamnt', 1)
INSERT [dbo].[Jobs] ([id], [title], [img], [tag], [day], [nview], [rate], [nrate], [contents], [dayupdate], [usercreate], [TrangThai]) VALUES (CAST(635983370778189946 AS Decimal(18, 0)), N'sfgsdsdb', N'../App_Themes/FrontEnd/img/08052016_084437_PM_e749eee0efdd262f8571458fa9594327.jpg', N'abc', CAST(N'2016-05-08 20:44:37.847' AS DateTime), 0, 0, 0, N'<p>sdbdsbsdbsdbsdb</p>
', CAST(N'2016-05-08 20:44:37.847' AS DateTime), N'tamnt', 1)
INSERT [dbo].[Jobs] ([id], [title], [img], [tag], [day], [nview], [rate], [nrate], [contents], [dayupdate], [usercreate], [TrangThai]) VALUES (CAST(635983370908201543 AS Decimal(18, 0)), N'sdbdbsd', N'../App_Themes/FrontEnd/img/08052016_084450_PM_e749eee0efdd262f8571458fa9594327.jpg', N'abc', CAST(N'2016-05-08 20:44:50.827' AS DateTime), 0, 0, 0, N'<p>bsdbsdbsdb</p>
', CAST(N'2016-05-08 20:44:50.827' AS DateTime), N'tamnt', 1)
INSERT [dbo].[Jobs] ([id], [title], [img], [tag], [day], [nview], [rate], [nrate], [contents], [dayupdate], [usercreate], [TrangThai]) VALUES (CAST(635983370997262973 AS Decimal(18, 0)), N'sdbsdbdsb', N'../App_Themes/FrontEnd/img/08052016_084459_PM_e749eee0efdd262f8571458fa9594327.jpg', N'abc', CAST(N'2016-05-08 20:44:59.730' AS DateTime), 0, 0, 0, N'<p>sdbadbwbdb</p>
', CAST(N'2016-05-08 20:44:59.730' AS DateTime), N'tamnt', 1)
SET IDENTITY_INSERT [dbo].[Manufacturers] ON 

INSERT [dbo].[Manufacturers] ([ID], [Ma], [TenHangSanXuat], [TuKhoa], [NgayTao], [NgayCapNhat], [TrangThai], [GhiChu]) VALUES (1, N'PMA0000002', N'cha mi ngu', N'asd', CAST(N'2016-05-06 14:36:20.040' AS DateTime), CAST(N'2016-05-09 22:50:29.263' AS DateTime), 3, N'')
INSERT [dbo].[Manufacturers] ([ID], [Ma], [TenHangSanXuat], [TuKhoa], [NgayTao], [NgayCapNhat], [TrangThai], [GhiChu]) VALUES (2, N'PMA0000003', N'cha mi ngu', N'asd', CAST(N'2016-05-06 14:36:36.183' AS DateTime), CAST(N'2016-05-09 22:50:35.470' AS DateTime), 3, N'')
INSERT [dbo].[Manufacturers] ([ID], [Ma], [TenHangSanXuat], [TuKhoa], [NgayTao], [NgayCapNhat], [TrangThai], [GhiChu]) VALUES (3, N'PMA0000004', N'cha mi ngu', N'asd', CAST(N'2016-05-06 14:36:46.543' AS DateTime), CAST(N'2016-05-09 22:50:46.227' AS DateTime), 3, N'')
INSERT [dbo].[Manufacturers] ([ID], [Ma], [TenHangSanXuat], [TuKhoa], [NgayTao], [NgayCapNhat], [TrangThai], [GhiChu]) VALUES (4, N'PMA0000005', N'Chivas', N'chivas', CAST(N'2016-05-09 22:42:55.777' AS DateTime), CAST(N'2016-05-09 22:42:55.777' AS DateTime), 1, N'')
INSERT [dbo].[Manufacturers] ([ID], [Ma], [TenHangSanXuat], [TuKhoa], [NgayTao], [NgayCapNhat], [TrangThai], [GhiChu]) VALUES (5, N'PMA0000006', N'XO', N'xo', CAST(N'2016-05-09 22:43:13.523' AS DateTime), CAST(N'2016-05-09 22:43:13.523' AS DateTime), 1, N'')
INSERT [dbo].[Manufacturers] ([ID], [Ma], [TenHangSanXuat], [TuKhoa], [NgayTao], [NgayCapNhat], [TrangThai], [GhiChu]) VALUES (6, N'PMA0000007', N'Hennessy', N'hennessy', CAST(N'2016-05-09 22:43:34.040' AS DateTime), CAST(N'2016-05-09 22:43:34.040' AS DateTime), 1, N'')
INSERT [dbo].[Manufacturers] ([ID], [Ma], [TenHangSanXuat], [TuKhoa], [NgayTao], [NgayCapNhat], [TrangThai], [GhiChu]) VALUES (7, N'PMA0000008', N'Chivas', N'', CAST(N'2016-05-18 07:38:09.433' AS DateTime), CAST(N'2016-05-18 07:38:09.433' AS DateTime), 1, N'')
SET IDENTITY_INSERT [dbo].[Manufacturers] OFF
INSERT [dbo].[Message2s] ([Message], [thoigian], [TrangThai], [id]) VALUES (N'fgfgsdfg', CAST(N'2016-05-18 08:49:39.397' AS DateTime), 0, CAST(5555 AS Decimal(18, 0)))
INSERT [dbo].[Message2s] ([Message], [thoigian], [TrangThai], [id]) VALUES (N'jbsdjfusdj', CAST(N'2016-05-18 08:49:50.317' AS DateTime), 0, CAST(6666 AS Decimal(18, 0)))
INSERT [dbo].[Message2s] ([Message], [thoigian], [TrangThai], [id]) VALUES (N'tamtam vừa xoá role vbfgnfg', CAST(N'2016-05-18 12:42:13.497' AS DateTime), 0, CAST(63599172133454 AS Decimal(18, 0)))
INSERT [dbo].[Message2s] ([Message], [thoigian], [TrangThai], [id]) VALUES (N'tamtam vừa xoá role saaa', CAST(N'2016-05-18 12:42:15.460' AS DateTime), 0, CAST(63599172135455 AS Decimal(18, 0)))
INSERT [dbo].[Message2s] ([Message], [thoigian], [TrangThai], [id]) VALUES (N'tamtam vừa xoá role sa', CAST(N'2016-05-18 12:46:02.697' AS DateTime), 0, CAST(63599172362512 AS Decimal(18, 0)))
INSERT [dbo].[Message2s] ([Message], [thoigian], [TrangThai], [id]) VALUES (N'tamtam vừa xoá role bb', CAST(N'2016-05-18 12:49:07.407' AS DateTime), 0, CAST(63599172547377 AS Decimal(18, 0)))
INSERT [dbo].[Message2s] ([Message], [thoigian], [TrangThai], [id]) VALUES (N'tamtam vừa xoá role baba', CAST(N'2016-05-18 12:49:15.963' AS DateTime), 0, CAST(63599172555954 AS Decimal(18, 0)))
INSERT [dbo].[Message2s] ([Message], [thoigian], [TrangThai], [id]) VALUES (N'tamtam vừa tạo 1 role mới  sdsadas', CAST(N'2016-05-18 13:11:52.600' AS DateTime), 0, CAST(63599173912582 AS Decimal(18, 0)))
INSERT [dbo].[Message2s] ([Message], [thoigian], [TrangThai], [id]) VALUES (N'tamtam vừa xoá role sdsadas', CAST(N'2016-05-18 13:18:36.663' AS DateTime), 1, CAST(63599174316653 AS Decimal(18, 0)))
INSERT [dbo].[Messages1] ([Message], [thoigian]) VALUES (N'adfas', CAST(N'2016-05-03' AS Date))
INSERT [dbo].[Messages1] ([Message], [thoigian]) VALUES (N'231afa', CAST(N'2016-05-03' AS Date))
INSERT [dbo].[Messages1] ([Message], [thoigian]) VALUES (N'hjahfbhasbf', CAST(N'2016-05-03' AS Date))
INSERT [dbo].[Messages1] ([Message], [thoigian]) VALUES (N'456sad', CAST(N'2016-05-03' AS Date))
INSERT [dbo].[Messages1] ([Message], [thoigian]) VALUES (N'asasfasfas', CAST(N'2016-05-03' AS Date))
INSERT [dbo].[Messages1] ([Message], [thoigian]) VALUES (N'asfasf4363', CAST(N'2016-05-03' AS Date))
INSERT [dbo].[Messages1] ([Message], [thoigian]) VALUES (N'asfsafaf34643', CAST(N'2016-05-03' AS Date))
INSERT [dbo].[Messages1] ([Message], [thoigian]) VALUES (N'asfasfasf', CAST(N'2016-05-03' AS Date))
INSERT [dbo].[Messages1] ([Message], [thoigian]) VALUES (N'asgdsagfdgj', CAST(N'2016-05-03' AS Date))
INSERT [dbo].[Messages1] ([Message], [thoigian]) VALUES (N'asfasfas', CAST(N'2016-05-03' AS Date))
INSERT [dbo].[Messages1] ([Message], [thoigian]) VALUES (N'agdsgds', CAST(N'2016-05-03' AS Date))
INSERT [dbo].[Messages1] ([Message], [thoigian]) VALUES (N'asfasfas', CAST(N'2016-05-03' AS Date))
INSERT [dbo].[Messages1] ([Message], [thoigian]) VALUES (N'asfasfasf', CAST(N'2016-05-03' AS Date))
INSERT [dbo].[Messages1] ([Message], [thoigian]) VALUES (N'dgsdgdhmsdbv', CAST(N'2016-05-03' AS Date))
SET IDENTITY_INSERT [dbo].[OrderDetails] ON 

INSERT [dbo].[OrderDetails] ([ID], [HD_ID], [SanPham_ID], [DonGia], [SoLuong], [TrangThai], [NgayTao], [NgayCapNhat], [GhiChu]) VALUES (1, 2, 5, 200000, 1, 2, CAST(N'2016-06-28' AS Date), CAST(N'2016-06-28' AS Date), N'')
INSERT [dbo].[OrderDetails] ([ID], [HD_ID], [SanPham_ID], [DonGia], [SoLuong], [TrangThai], [NgayTao], [NgayCapNhat], [GhiChu]) VALUES (2, 3, 5, 200000, 1, 2, CAST(N'2016-06-28' AS Date), CAST(N'2016-06-28' AS Date), N'')
INSERT [dbo].[OrderDetails] ([ID], [HD_ID], [SanPham_ID], [DonGia], [SoLuong], [TrangThai], [NgayTao], [NgayCapNhat], [GhiChu]) VALUES (3, 4, 5, 200000, 2, 2, CAST(N'2016-06-28' AS Date), CAST(N'2016-06-28' AS Date), N'')
SET IDENTITY_INSERT [dbo].[OrderDetails] OFF
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([ID], [MaHD], [KH_ID], [TenNguoiNhan], [SoNha], [Duong], [Quan_Huyen], [Tinh_TP], [NgayDatHang], [NgayGiaoHang], [SoLuong], [TongTien], [GhiChu], [MaGiamGia], [NgayTao], [TinhTrang], [NgayCapNhat], [XacNhan]) VALUES (1, N'HD000001', 7, N'thanh tam', N'12', NULL, N'12', N'12', CAST(N'2016-06-28' AS Date), CAST(N'2016-07-05' AS Date), 0, 0, NULL, N'', CAST(N'2016-06-28' AS Date), 2, CAST(N'2016-06-28' AS Date), 0)
INSERT [dbo].[Orders] ([ID], [MaHD], [KH_ID], [TenNguoiNhan], [SoNha], [Duong], [Quan_Huyen], [Tinh_TP], [NgayDatHang], [NgayGiaoHang], [SoLuong], [TongTien], [GhiChu], [MaGiamGia], [NgayTao], [TinhTrang], [NgayCapNhat], [XacNhan]) VALUES (2, N'HD000002', 7, N'12', N'12', NULL, N'12', N'12', CAST(N'2016-06-28' AS Date), CAST(N'2016-07-05' AS Date), 1, 200000, NULL, N'', CAST(N'2016-06-28' AS Date), 2, CAST(N'2016-06-28' AS Date), 0)
INSERT [dbo].[Orders] ([ID], [MaHD], [KH_ID], [TenNguoiNhan], [SoNha], [Duong], [Quan_Huyen], [Tinh_TP], [NgayDatHang], [NgayGiaoHang], [SoLuong], [TongTien], [GhiChu], [MaGiamGia], [NgayTao], [TinhTrang], [NgayCapNhat], [XacNhan]) VALUES (3, N'HD000003', 7, N'12', N'12', NULL, N'12', N'12', CAST(N'2016-06-28' AS Date), CAST(N'2016-07-05' AS Date), 1, 200000, NULL, N'', CAST(N'2016-06-28' AS Date), 2, CAST(N'2016-06-28' AS Date), 0)
INSERT [dbo].[Orders] ([ID], [MaHD], [KH_ID], [TenNguoiNhan], [SoNha], [Duong], [Quan_Huyen], [Tinh_TP], [NgayDatHang], [NgayGiaoHang], [SoLuong], [TongTien], [GhiChu], [MaGiamGia], [NgayTao], [TinhTrang], [NgayCapNhat], [XacNhan]) VALUES (4, N'HD000004', 7, N'13', N'13', N'13', N'13', N'13', CAST(N'2016-06-28' AS Date), CAST(N'2016-07-05' AS Date), 2, 400000, NULL, N'', CAST(N'2016-06-28' AS Date), 2, CAST(N'2016-06-28' AS Date), 0)
SET IDENTITY_INSERT [dbo].[Orders] OFF
SET IDENTITY_INSERT [dbo].[Producers] ON 

INSERT [dbo].[Producers] ([ID], [MaNSX], [TenNSX], [DiaChi], [SDT], [TuKhoa], [TrangThai], [NgayTao], [NgayCapNhat], [GhiChu]) VALUES (1, N'PNX0000002', N'lambo', N'162 paster quận 3', N'0164 444 5555', N'lambo', 3, CAST(N'2016-05-09 10:11:16.263' AS DateTime), CAST(N'2016-05-09 10:11:16.263' AS DateTime), N'lambo')
INSERT [dbo].[Producers] ([ID], [MaNSX], [TenNSX], [DiaChi], [SDT], [TuKhoa], [TrangThai], [NgayTao], [NgayCapNhat], [GhiChu]) VALUES (2, N'PNX0000003', N'Nhật', N'Tokyo', N'0123456789', N'nhat', 1, CAST(N'2016-05-09 22:12:57.117' AS DateTime), CAST(N'2016-05-09 22:16:02.243' AS DateTime), N'nhật bản')
INSERT [dbo].[Producers] ([ID], [MaNSX], [TenNSX], [DiaChi], [SDT], [TuKhoa], [TrangThai], [NgayTao], [NgayCapNhat], [GhiChu]) VALUES (3, N'PNX0000004', N'Pháp', N'Pari', N'0123456789', N'phap', 1, CAST(N'2016-05-09 22:16:30.380' AS DateTime), CAST(N'2016-05-09 22:16:30.380' AS DateTime), N'Pháp ')
INSERT [dbo].[Producers] ([ID], [MaNSX], [TenNSX], [DiaChi], [SDT], [TuKhoa], [TrangThai], [NgayTao], [NgayCapNhat], [GhiChu]) VALUES (4, N'PNX0000005', N'Việt Nam', N'Hồ chí minh', N'0123456789', N'vn', 1, CAST(N'2016-05-09 22:17:07.867' AS DateTime), CAST(N'2016-05-09 22:17:18.463' AS DateTime), N'Việt nam')
SET IDENTITY_INSERT [dbo].[Producers] OFF
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([ID], [MaSanPham], [TenSanPham], [LoaiSP], [Gia], [XuatXu], [NongDo], [DungTich], [SoLuotXem], [TinhTrang], [Tag], [MoTa], [SoLuongTon], [GhiChu], [NhaSanXuat], [ThuongHieu], [ChiTietBoSung], [GiaKhuyenMai], [NamSanXuat], [NgayTao], [TuKhoa], [SoLuotMua], [url_img], [Seri], [NgayCapNhat], [TypeView], [Nrate], [NReViews]) VALUES (1, N'PWI0000002', N'chivas 1', 2, 450000, N'pháp', 30, 1, 1, 1, N'chivas', N'Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm ', 20, N'sản phẩm bán chạy', 3, 4, N'', 400000, 1990, CAST(N'2016-05-09 23:24:37.253' AS DateTime), N'', 0, N'/img/products/a.jpg', N'', CAST(N'2016-05-09' AS Date), 1, 0, 0)
INSERT [dbo].[Products] ([ID], [MaSanPham], [TenSanPham], [LoaiSP], [Gia], [XuatXu], [NongDo], [DungTich], [SoLuotXem], [TinhTrang], [Tag], [MoTa], [SoLuongTon], [GhiChu], [NhaSanXuat], [ThuongHieu], [ChiTietBoSung], [GiaKhuyenMai], [NamSanXuat], [NgayTao], [TuKhoa], [SoLuotMua], [url_img], [Seri], [NgayCapNhat], [TypeView], [Nrate], [NReViews]) VALUES (2, N'PWI0000003', N'hennessy', 2, 300000, N'Đức', 40, 1.5, 3, 1, N'', N'Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm ', 10, N'sản phẩm mới', 3, 6, N'Chi tiết bổ sung Chi tiết bổ sung Chi tiết bổ sung Chi tiết bổ sung Chi tiết bổ sung Chi tiết bổ sung Chi tiết bổ sung Chi tiết bổ sung Chi tiết bổ sung Chi tiết bổ sung Chi tiết bổ sung Chi tiết bổ sung Chi tiết bổ sung Chi tiết bổ sung Chi tiết bổ sung Chi tiết bổ sung Chi tiết bổ sung Chi tiết bổ sung Chi tiết bổ sung Chi tiết bổ sung Chi tiết bổ sung Chi tiết bổ sung ', 300000, 1990, CAST(N'2016-05-09 23:32:06.410' AS DateTime), N'', 0, N'/img/products/a.jpg', N'', CAST(N'2016-05-09' AS Date), 0, 5, 2)
INSERT [dbo].[Products] ([ID], [MaSanPham], [TenSanPham], [LoaiSP], [Gia], [XuatXu], [NongDo], [DungTich], [SoLuotXem], [TinhTrang], [Tag], [MoTa], [SoLuongTon], [GhiChu], [NhaSanXuat], [ThuongHieu], [ChiTietBoSung], [GiaKhuyenMai], [NamSanXuat], [NgayTao], [TuKhoa], [SoLuotMua], [url_img], [Seri], [NgayCapNhat], [TypeView], [Nrate], [NReViews]) VALUES (3, N'PWI0000004', N'XO 1', 4, 1000000, N'Đức', 30, 2, 0, 1, N'', N'Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm ', 15, N'sản phẩm thường', 2, 5, N'Chi tiết bổ sung Chi tiết bổ sung Chi tiết bổ sung Chi tiết bổ sung Chi tiết bổ sung Chi tiết bổ sung Chi tiết bổ sung Chi tiết bổ sung Chi tiết bổ sung Chi tiết bổ sung Chi tiết bổ sung Chi tiết bổ sung Chi tiết bổ sung Chi tiết bổ sung Chi tiết bổ sung Chi tiết bổ sung Chi tiết bổ sung Chi tiết bổ sung Chi tiết bổ sung Chi tiết bổ sung Chi tiết bổ sung Chi tiết bổ sung ', 1000000, 1990, CAST(N'2016-05-09 23:34:25.637' AS DateTime), N'', 0, N'/img/products/a.jpg', N'', CAST(N'2016-05-09' AS Date), 2, 0, 0)
INSERT [dbo].[Products] ([ID], [MaSanPham], [TenSanPham], [LoaiSP], [Gia], [XuatXu], [NongDo], [DungTich], [SoLuotXem], [TinhTrang], [Tag], [MoTa], [SoLuongTon], [GhiChu], [NhaSanXuat], [ThuongHieu], [ChiTietBoSung], [GiaKhuyenMai], [NamSanXuat], [NgayTao], [TuKhoa], [SoLuotMua], [url_img], [Seri], [NgayCapNhat], [TypeView], [Nrate], [NReViews]) VALUES (4, N'PWI0000005', N'volka', 4, 200000, N'vn', 30, 1, 0, 1, N'', N'Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm ', 0, N'sản phẩm sắp bán', 4, 6, N'Chi tiết bổ sung Chi tiết bổ sung Chi tiết bổ sung Chi tiết bổ sung Chi tiết bổ sung Chi tiết bổ sung Chi tiết bổ sung Chi tiết bổ sung Chi tiết bổ sung Chi tiết bổ sung Chi tiết bổ sung Chi tiết bổ sung Chi tiết bổ sung Chi tiết bổ sung Chi tiết bổ sung Chi tiết bổ sung Chi tiết bổ sung Chi tiết bổ sung Chi tiết bổ sung Chi tiết bổ sung Chi tiết bổ sung Chi tiết bổ sung ', 200000, 1990, CAST(N'2016-05-09 23:35:25.833' AS DateTime), N'', 0, N'/img/products/a.jpg', N'', CAST(N'2016-05-09' AS Date), 3, 0, 0)
INSERT [dbo].[Products] ([ID], [MaSanPham], [TenSanPham], [LoaiSP], [Gia], [XuatXu], [NongDo], [DungTich], [SoLuotXem], [TinhTrang], [Tag], [MoTa], [SoLuongTon], [GhiChu], [NhaSanXuat], [ThuongHieu], [ChiTietBoSung], [GiaKhuyenMai], [NamSanXuat], [NgayTao], [TuKhoa], [SoLuotMua], [url_img], [Seri], [NgayCapNhat], [TypeView], [Nrate], [NReViews]) VALUES (5, N'PWI0000006', N'XO 2', 2, 200000, N'pháp', 30, 1, 0, 1, NULL, N'Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm ', 1, N'sản phẩm đặt biệt', 3, 5, N'Chi tiết bổ sung Chi tiết bổ sung Chi tiết bổ sung Chi tiết bổ sung Chi tiết bổ sung Chi tiết bổ sung Chi tiết bổ sung Chi tiết bổ sung Chi tiết bổ sung Chi tiết bổ sung Chi tiết bổ sung Chi tiết bổ sung Chi tiết bổ sung Chi tiết bổ sung Chi tiết bổ sung Chi tiết bổ sung Chi tiết bổ sung Chi tiết bổ sung Chi tiết bổ sung Chi tiết bổ sung Chi tiết bổ sung Chi tiết bổ sung ', 200000, 1999, CAST(N'2016-05-09 23:42:44.000' AS DateTime), NULL, 2, N'/img/products/a.jpg', NULL, CAST(N'2016-05-09' AS Date), 4, 4, 0)
SET IDENTITY_INSERT [dbo].[Products] OFF
SET IDENTITY_INSERT [dbo].[ReViews] ON 

INSERT [dbo].[ReViews] ([ID], [Products_ID], [ReViews], [Rate], [GhiChu], [TrangThai], [TacGia], [NgayTao]) VALUES (1, 2, N'sản phẩm đẹp', 5, N'', 1, N'User', CAST(N'2016-05-18 07:42:41.187' AS DateTime))
INSERT [dbo].[ReViews] ([ID], [Products_ID], [ReViews], [Rate], [GhiChu], [TrangThai], [TacGia], [NgayTao]) VALUES (2, 2, N'sản phẩm đẹp', 5, N'', 1, N'User', CAST(N'2016-05-18 07:42:47.403' AS DateTime))
SET IDENTITY_INSERT [dbo].[ReViews] OFF
SET IDENTITY_INSERT [dbo].[TrangThai] ON 

INSERT [dbo].[TrangThai] ([ID], [TenTrangThai], [NgayTao], [NgayCapNhat], [GhiChu]) VALUES (1, N'Đang hoạt động', CAST(N'2016-05-01 23:07:19.323' AS DateTime), CAST(N'2016-05-01 23:07:19.323' AS DateTime), N'')
INSERT [dbo].[TrangThai] ([ID], [TenTrangThai], [NgayTao], [NgayCapNhat], [GhiChu]) VALUES (2, N'Đang chờ xét duyệt', CAST(N'2016-05-01 23:09:31.620' AS DateTime), CAST(N'2016-05-01 23:09:31.620' AS DateTime), N'')
INSERT [dbo].[TrangThai] ([ID], [TenTrangThai], [NgayTao], [NgayCapNhat], [GhiChu]) VALUES (3, N'Tạm khoá', CAST(N'2016-05-01 23:09:31.623' AS DateTime), CAST(N'2016-05-01 23:09:31.623' AS DateTime), N'')
INSERT [dbo].[TrangThai] ([ID], [TenTrangThai], [NgayTao], [NgayCapNhat], [GhiChu]) VALUES (4, N'Trạng thái demo', CAST(N'2016-06-18 00:00:00.000' AS DateTime), CAST(N'2016-06-18 00:00:00.000' AS DateTime), N'ghi chú mới')
INSERT [dbo].[TrangThai] ([ID], [TenTrangThai], [NgayTao], [NgayCapNhat], [GhiChu]) VALUES (5, N'dat nho', CAST(N'2016-01-01 00:00:00.000' AS DateTime), CAST(N'2016-02-02 00:00:00.000' AS DateTime), N'asff')
SET IDENTITY_INSERT [dbo].[TrangThai] OFF
INSERT [dbo].[UaThichs] ([id], [iduser], [idsanpham], [ip]) VALUES (CAST(63599053592862 AS Decimal(18, 0)), 2, 5, N'::1')
INSERT [dbo].[UaThichs] ([id], [iduser], [idsanpham], [ip]) VALUES (CAST(63599054963708 AS Decimal(18, 0)), 2, 5, N'::1')
INSERT [dbo].[UaThichs] ([id], [iduser], [idsanpham], [ip]) VALUES (CAST(63599055274265 AS Decimal(18, 0)), 2, 5, N'::1')
INSERT [dbo].[UaThichs] ([id], [iduser], [idsanpham], [ip]) VALUES (CAST(63599056372503 AS Decimal(18, 0)), 2, 2, N'::1')
INSERT [dbo].[UaThichs] ([id], [iduser], [idsanpham], [ip]) VALUES (CAST(63599056377701 AS Decimal(18, 0)), 2, 1, N'::1')
INSERT [dbo].[UaThichs] ([id], [iduser], [idsanpham], [ip]) VALUES (CAST(63599056387972 AS Decimal(18, 0)), 2, 4, N'::1')
INSERT [dbo].[UaThichs] ([id], [iduser], [idsanpham], [ip]) VALUES (CAST(63599056397890 AS Decimal(18, 0)), 2, 3, N'::1')
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([ID], [TenDangNhap], [MatKhau], [TenHienThi], [Quyen], [GhiChu], [ThoiGiaDangNhapGanNhat], [MaXacNhan], [NgayTao], [TinhTrang], [NgayCapNhat], [avatar]) VALUES (1, N'tamtam', N'', N'', 1, N'tamthanh771@gmail.com', CAST(N'2016-05-07 02:36:18.507' AS DateTime), N'4team', CAST(N'2016-05-07 02:36:18.507' AS DateTime), 1, CAST(N'2016-05-07 02:36:18.507' AS DateTime), N'images/avatar/07052016_030216_AM_10626539_899656320153722_3599533380482127467_n.jpg')
INSERT [dbo].[Users] ([ID], [TenDangNhap], [MatKhau], [TenHienThi], [Quyen], [GhiChu], [ThoiGiaDangNhapGanNhat], [MaXacNhan], [NgayTao], [TinhTrang], [NgayCapNhat], [avatar]) VALUES (2, N'tamnt5293', N'123456789', N'tamnt52', 2, N'', CAST(N'2016-05-17 03:45:19.100' AS DateTime), N'', CAST(N'2016-05-17 03:45:19.100' AS DateTime), 1, CAST(N'2016-05-17 03:45:19.100' AS DateTime), N'../../App_Themes/FrontEnd/img/avart/default.png')
INSERT [dbo].[Users] ([ID], [TenDangNhap], [MatKhau], [TenHienThi], [Quyen], [GhiChu], [ThoiGiaDangNhapGanNhat], [MaXacNhan], [NgayTao], [TinhTrang], [NgayCapNhat], [avatar]) VALUES (3, N'aaaaaa7', N'', N'asfdasf', 2, N'', CAST(N'2016-06-27 22:49:46.867' AS DateTime), N'a', CAST(N'2016-06-27 22:49:16.267' AS DateTime), 1, CAST(N'2016-06-27 22:49:16.683' AS DateTime), N'')
INSERT [dbo].[Users] ([ID], [TenDangNhap], [MatKhau], [TenHienThi], [Quyen], [GhiChu], [ThoiGiaDangNhapGanNhat], [MaXacNhan], [NgayTao], [TinhTrang], [NgayCapNhat], [avatar]) VALUES (4, N'thanhtam', N'', N'thanh tam', 2, N'', CAST(N'2016-06-27 22:56:04.427' AS DateTime), N'a', CAST(N'2016-06-27 22:56:04.407' AS DateTime), 1, CAST(N'2016-06-27 22:56:04.407' AS DateTime), N'')
INSERT [dbo].[Users] ([ID], [TenDangNhap], [MatKhau], [TenHienThi], [Quyen], [GhiChu], [ThoiGiaDangNhapGanNhat], [MaXacNhan], [NgayTao], [TinhTrang], [NgayCapNhat], [avatar]) VALUES (5, N'admin123', N'', N'thanhtam', 2, N'', CAST(N'2016-06-27 23:04:27.490' AS DateTime), N'a', CAST(N'2016-06-27 23:04:27.487' AS DateTime), 1, CAST(N'2016-06-27 23:04:27.487' AS DateTime), N'')
INSERT [dbo].[Users] ([ID], [TenDangNhap], [MatKhau], [TenHienThi], [Quyen], [GhiChu], [ThoiGiaDangNhapGanNhat], [MaXacNhan], [NgayTao], [TinhTrang], [NgayCapNhat], [avatar]) VALUES (6, N'tamtam23423', N'', N'tamtam23423', 2, N'', CAST(N'2016-06-27 23:05:51.010' AS DateTime), N'a', CAST(N'2016-06-27 23:05:51.007' AS DateTime), 1, CAST(N'2016-06-27 23:05:51.007' AS DateTime), N'')
INSERT [dbo].[Users] ([ID], [TenDangNhap], [MatKhau], [TenHienThi], [Quyen], [GhiChu], [ThoiGiaDangNhapGanNhat], [MaXacNhan], [NgayTao], [TinhTrang], [NgayCapNhat], [avatar]) VALUES (7, N'abcabc', N'', N'abcabc', 2, N'', CAST(N'2016-06-27 23:08:04.997' AS DateTime), N'a', CAST(N'2016-06-27 23:08:04.997' AS DateTime), 1, CAST(N'2016-06-27 23:08:04.997' AS DateTime), N'')
INSERT [dbo].[Users] ([ID], [TenDangNhap], [MatKhau], [TenHienThi], [Quyen], [GhiChu], [ThoiGiaDangNhapGanNhat], [MaXacNhan], [NgayTao], [TinhTrang], [NgayCapNhat], [avatar]) VALUES (8, N'tamnt12', N'', N'tamnt12', 2, N'', CAST(N'2016-06-27 23:09:31.463' AS DateTime), N'a', CAST(N'2016-06-27 23:09:31.463' AS DateTime), 1, CAST(N'2016-06-27 23:09:31.463' AS DateTime), N'')
SET IDENTITY_INSERT [dbo].[Users] OFF
INSERT [dbo].[Websites] ([sdt1], [sdt2], [email], [skype], [diachi], [twitter], [facebook], [tenshop], [googlemap], [linkWebsites], [favaicon], [thoigiantao], [thoigiancapnhat], [nguoichinhsua], [ghichi], [TrangThai], [id]) VALUES (N'123456', N'123456', N'tamthanh770@gmail.com', N'123456', N'123456', N'123456', N'123456', N'123456', N'123456', N'123456', N'', CAST(N'2016-06-08 15:21:59.180' AS DateTime), CAST(N'2016-06-08 15:21:59.180' AS DateTime), N'test', N'', 0, CAST(63600996119178 AS Decimal(18, 0)))
INSERT [dbo].[Websites] ([sdt1], [sdt2], [email], [skype], [diachi], [twitter], [facebook], [tenshop], [googlemap], [linkWebsites], [favaicon], [thoigiantao], [thoigiancapnhat], [nguoichinhsua], [ghichi], [TrangThai], [id]) VALUES (N'123456', N'1234567', N'tamthanh770@gmail.com', N'123456', N'123456', N'123456', N'123456', N'123456', N'123456', N'123456', NULL, NULL, CAST(N'2016-06-08 15:47:03.090' AS DateTime), N'test', N'Đã cập nhật', NULL, CAST(63600996533380 AS Decimal(18, 0)))
INSERT [dbo].[Websites] ([sdt1], [sdt2], [email], [skype], [diachi], [twitter], [facebook], [tenshop], [googlemap], [linkWebsites], [favaicon], [thoigiantao], [thoigiancapnhat], [nguoichinhsua], [ghichi], [TrangThai], [id]) VALUES (N'1234567', N'123456', N'tamthanh770@gmail.com', N'123456', N'123456', N'123456', N'123456', N'123456', N'123456', N'123456', N'', CAST(N'2016-06-08 15:52:57.720' AS DateTime), CAST(N'2016-06-08 15:53:06.360' AS DateTime), N'test', N'Đã cập nhật', 1, CAST(63600997977720 AS Decimal(18, 0)))
INSERT [dbo].[Websites] ([sdt1], [sdt2], [email], [skype], [diachi], [twitter], [facebook], [tenshop], [googlemap], [linkWebsites], [favaicon], [thoigiantao], [thoigiancapnhat], [nguoichinhsua], [ghichi], [TrangThai], [id]) VALUES (N'0164414356', N'23t2352352', N'tamthanh770@gmail.com', N'asgasg', N'agagagas', N'dsdsvsdvsd', N'sgasgasgasg', N'sdvdsvsvssdv', N'vsdvsdvsdv', N'sgasgasgsgasga', N'../App_Themes/FrontEnd/img/08052016_033311_AM_e749eee0efdd262f8571458fa9594327.jpg', CAST(N'2016-05-08 03:33:11.870' AS DateTime), CAST(N'2016-05-08 03:33:11.870' AS DateTime), N'tamnt', N'tamnt', 0, CAST(635982751917321588 AS Decimal(18, 0)))
INSERT [dbo].[Websites] ([sdt1], [sdt2], [email], [skype], [diachi], [twitter], [facebook], [tenshop], [googlemap], [linkWebsites], [favaicon], [thoigiantao], [thoigiancapnhat], [nguoichinhsua], [ghichi], [TrangThai], [id]) VALUES (N'0164414356', N'23t2352352', N'tamthanh770@gmail.com', N'asgasg', N'agagagas', N'dsdsvsdvsd', N'sgasgasgasg', N'sdvdsvsvssdv', N'vsdvsdvsdv', N'sgasgasgsgasga', N'', CAST(N'2016-05-08 03:36:04.070' AS DateTime), CAST(N'2016-05-08 03:36:04.070' AS DateTime), N'tamnt', N'tamnt', 0, CAST(635982753640474639 AS Decimal(18, 0)))
INSERT [dbo].[Websites] ([sdt1], [sdt2], [email], [skype], [diachi], [twitter], [facebook], [tenshop], [googlemap], [linkWebsites], [favaicon], [thoigiantao], [thoigiancapnhat], [nguoichinhsua], [ghichi], [TrangThai], [id]) VALUES (N'0164414356', N'23t2352352', N'tamthanh770@gmail.com', N'asgasg', N'agagagas', N'dsdsvsdvsd', N'sgasgasgasg', N'bbbbbbbbbbbbbb', N'vsdvsdvsdv', N'sgasgasgsgasga', N'', CAST(N'2016-05-08 03:45:44.670' AS DateTime), CAST(N'2016-05-08 03:45:44.670' AS DateTime), N'tamnt', N'tamnt', 0, CAST(635982759446025110 AS Decimal(18, 0)))
/****** Object:  Index [PK__aspnet_A__C93A4C980A43BF6D]    Script Date: 28/06/2016 13:19:07 ******/
ALTER TABLE [dbo].[aspnet_Applications] ADD PRIMARY KEY NONCLUSTERED 
(
	[ApplicationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__aspnet_A__17477DE453A64C2E]    Script Date: 28/06/2016 13:19:07 ******/
ALTER TABLE [dbo].[aspnet_Applications] ADD UNIQUE NONCLUSTERED 
(
	[LoweredApplicationName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__aspnet_A__30910331F17B4AEB]    Script Date: 28/06/2016 13:19:07 ******/
ALTER TABLE [dbo].[aspnet_Applications] ADD UNIQUE NONCLUSTERED 
(
	[ApplicationName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK__aspnet_M__1788CC4D918BD886]    Script Date: 28/06/2016 13:19:07 ******/
ALTER TABLE [dbo].[aspnet_Membership] ADD PRIMARY KEY NONCLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK__aspnet_P__CD67DC58A2CA5FFA]    Script Date: 28/06/2016 13:19:07 ******/
ALTER TABLE [dbo].[aspnet_Paths] ADD PRIMARY KEY NONCLUSTERED 
(
	[PathId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK__aspnet_P__3214EC06B365BC71]    Script Date: 28/06/2016 13:19:07 ******/
ALTER TABLE [dbo].[aspnet_PersonalizationPerUser] ADD PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK__aspnet_R__8AFACE1B4F3B7604]    Script Date: 28/06/2016 13:19:07 ******/
ALTER TABLE [dbo].[aspnet_Roles] ADD PRIMARY KEY NONCLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK__aspnet_U__1788CC4DE5526CE6]    Script Date: 28/06/2016 13:19:07 ******/
ALTER TABLE [dbo].[aspnet_Users] ADD PRIMARY KEY NONCLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__Categori__730A5758DA8AA904]    Script Date: 28/06/2016 13:19:07 ******/
ALTER TABLE [dbo].[Categories] ADD UNIQUE NONCLUSTERED 
(
	[MaLoai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__Customer__2725CF1F31F9B999]    Script Date: 28/06/2016 13:19:07 ******/
ALTER TABLE [dbo].[Customers] ADD UNIQUE NONCLUSTERED 
(
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__Manufact__3214CC9EEC83F8FD]    Script Date: 28/06/2016 13:19:07 ******/
ALTER TABLE [dbo].[Manufacturers] ADD UNIQUE NONCLUSTERED 
(
	[Ma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__Orders__2725A6E1A6B7F294]    Script Date: 28/06/2016 13:19:07 ******/
ALTER TABLE [dbo].[Orders] ADD UNIQUE NONCLUSTERED 
(
	[MaHD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__Producer__3A1BDBD3AC7DA115]    Script Date: 28/06/2016 13:19:07 ******/
ALTER TABLE [dbo].[Producers] ADD UNIQUE NONCLUSTERED 
(
	[MaNSX] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__Products__FAC7442CB00DAE71]    Script Date: 28/06/2016 13:19:07 ******/
ALTER TABLE [dbo].[Products] ADD UNIQUE NONCLUSTERED 
(
	[MaSanPham] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__Users__55F68FC00C13A65B]    Script Date: 28/06/2016 13:19:07 ******/
ALTER TABLE [dbo].[Users] ADD UNIQUE NONCLUSTERED 
(
	[TenDangNhap] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[aspnet_Paths] ADD  DEFAULT (newid()) FOR [PathId]
GO
ALTER TABLE [dbo].[aspnet_PersonalizationPerUser] ADD  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[aspnet_Membership]  WITH CHECK ADD FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[aspnet_Applications] ([ApplicationId])
GO
ALTER TABLE [dbo].[aspnet_Membership]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[aspnet_Users] ([UserId])
GO
ALTER TABLE [dbo].[aspnet_Paths]  WITH CHECK ADD FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[aspnet_Applications] ([ApplicationId])
GO
ALTER TABLE [dbo].[aspnet_PersonalizationAllUsers]  WITH CHECK ADD FOREIGN KEY([PathId])
REFERENCES [dbo].[aspnet_Paths] ([PathId])
GO
ALTER TABLE [dbo].[aspnet_PersonalizationPerUser]  WITH CHECK ADD FOREIGN KEY([PathId])
REFERENCES [dbo].[aspnet_Paths] ([PathId])
GO
ALTER TABLE [dbo].[aspnet_PersonalizationPerUser]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[aspnet_Users] ([UserId])
GO
ALTER TABLE [dbo].[aspnet_Profile]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[aspnet_Users] ([UserId])
GO
ALTER TABLE [dbo].[aspnet_Roles]  WITH CHECK ADD FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[aspnet_Applications] ([ApplicationId])
GO
ALTER TABLE [dbo].[aspnet_Users]  WITH CHECK ADD FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[aspnet_Applications] ([ApplicationId])
GO
ALTER TABLE [dbo].[aspnet_UsersInRoles]  WITH CHECK ADD FOREIGN KEY([RoleId])
REFERENCES [dbo].[aspnet_Roles] ([RoleId])
GO
ALTER TABLE [dbo].[aspnet_UsersInRoles]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[aspnet_Users] ([UserId])
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([ID])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Cart_Products]
GO
ALTER TABLE [dbo].[Categories]  WITH CHECK ADD  CONSTRAINT [FK_Categories_Status] FOREIGN KEY([TinhTrang])
REFERENCES [dbo].[TrangThai] ([ID])
GO
ALTER TABLE [dbo].[Categories] CHECK CONSTRAINT [FK_Categories_Status]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment_Products] FOREIGN KEY([SanPham_ID])
REFERENCES [dbo].[Products] ([ID])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Comment_Products]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment_Status] FOREIGN KEY([TrangThai])
REFERENCES [dbo].[TrangThai] ([ID])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Comment_Status]
GO
ALTER TABLE [dbo].[Customers]  WITH CHECK ADD  CONSTRAINT [FK_Customers_Status] FOREIGN KEY([TrangThai])
REFERENCES [dbo].[TrangThai] ([ID])
GO
ALTER TABLE [dbo].[Customers] CHECK CONSTRAINT [FK_Customers_Status]
GO
ALTER TABLE [dbo].[Customers]  WITH CHECK ADD  CONSTRAINT [FK_Customers_User] FOREIGN KEY([User_ID])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[Customers] CHECK CONSTRAINT [FK_Customers_User]
GO
ALTER TABLE [dbo].[Images]  WITH CHECK ADD  CONSTRAINT [FK_Image_Products] FOREIGN KEY([SanPham_ID])
REFERENCES [dbo].[Products] ([ID])
GO
ALTER TABLE [dbo].[Images] CHECK CONSTRAINT [FK_Image_Products]
GO
ALTER TABLE [dbo].[Images]  WITH CHECK ADD  CONSTRAINT [FK_Image_Status] FOREIGN KEY([TrangThai])
REFERENCES [dbo].[TrangThai] ([ID])
GO
ALTER TABLE [dbo].[Images] CHECK CONSTRAINT [FK_Image_Status]
GO
ALTER TABLE [dbo].[Manufacturers]  WITH CHECK ADD  CONSTRAINT [FK_Manufacturers_Status] FOREIGN KEY([TrangThai])
REFERENCES [dbo].[TrangThai] ([ID])
GO
ALTER TABLE [dbo].[Manufacturers] CHECK CONSTRAINT [FK_Manufacturers_Status]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Order] FOREIGN KEY([HD_ID])
REFERENCES [dbo].[Orders] ([ID])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Order]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Products] FOREIGN KEY([SanPham_ID])
REFERENCES [dbo].[Products] ([ID])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Products]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Status] FOREIGN KEY([TrangThai])
REFERENCES [dbo].[TrangThai] ([ID])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Status]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Order_Customers] FOREIGN KEY([KH_ID])
REFERENCES [dbo].[Customers] ([ID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Order_Customers]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Order_Status] FOREIGN KEY([TinhTrang])
REFERENCES [dbo].[TrangThai] ([ID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Order_Status]
GO
ALTER TABLE [dbo].[Producers]  WITH CHECK ADD  CONSTRAINT [FK_Producers_Status] FOREIGN KEY([TrangThai])
REFERENCES [dbo].[TrangThai] ([ID])
GO
ALTER TABLE [dbo].[Producers] CHECK CONSTRAINT [FK_Producers_Status]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Categories] FOREIGN KEY([LoaiSP])
REFERENCES [dbo].[Categories] ([ID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Categories]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Manufacturers] FOREIGN KEY([ThuongHieu])
REFERENCES [dbo].[Manufacturers] ([ID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Manufacturers]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Producers] FOREIGN KEY([NhaSanXuat])
REFERENCES [dbo].[Producers] ([ID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Producers]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Status] FOREIGN KEY([TinhTrang])
REFERENCES [dbo].[TrangThai] ([ID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Status]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_User_Status] FOREIGN KEY([TinhTrang])
REFERENCES [dbo].[TrangThai] ([ID])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_User_Status]
GO
USE [master]
GO
ALTER DATABASE [fteamwine] SET  READ_WRITE 
GO
