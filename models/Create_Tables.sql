IF NOT EXISTS (SELECT 1 FROM sys.schemas WHERE name = 'neolude')
BEGIN
    EXEC('CREATE SCHEMA neolude')
END

SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

IF NOT EXISTS (
	SELECT * FROM sys.tables t JOIN sys.schemas s ON (t.schema_id = s.schema_id) 
	WHERE s.name='neolude' and t.name='audios'
) 
CREATE TABLE [neolude].[audios](
	[AudioID] [bigint] NULL,
	[AudioActivityID] [bigint] NULL,
	[ModuleActivityTypeID] [bigint] NULL,
	[IsDeleted] [bit] NULL,
	[Title] [nvarchar](max) NULL,
	[AuditCreatedDate] [nvarchar](max) NULL,
	[AuditLastUpdatedDate] [nvarchar](max) NULL,
	[Page] [bigint] NULL,
	[PageSize] [bigint] NULL,
	[MaximumPageSize] [bigint] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY];

IF NOT EXISTS (
	SELECT * FROM sys.tables t JOIN sys.schemas s ON (t.schema_id = s.schema_id) 
	WHERE s.name='neolude' and t.name='businessunits'
) 
CREATE TABLE [neolude].[businessunits](
	[BusinessUnitID] [bigint] NULL,
	[ClientUniqueIdentifier] [nvarchar](max) NULL,
	[BusinessUnitName] [nvarchar](max) NULL,
	[BusinessUnitTypeID] [bigint] NULL,
	[BusinessUnitType_Identifier] [nvarchar](max) NULL,
	[BusinessUnitStatusID] [bigint] NULL,
	[BusinessUnitStatus_Identifier] [nvarchar](max) NULL,
	[ParentBusinessUnitID] [bigint] NULL,
	[IsDeleted] [bit] NULL,
	[AuditCreatedDate] [nvarchar](max) NULL,
	[AuditLastUpdatedDate] [nvarchar](max) NULL,
	[Page] [bigint] NULL,
	[PageSize] [bigint] NULL,
	[MaximumPageSize] [bigint] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY];

IF NOT EXISTS (
	SELECT * FROM sys.tables t JOIN sys.schemas s ON (t.schema_id = s.schema_id) 
	WHERE s.name='neolude' and t.name='campaigncontents'
) 
CREATE TABLE [neolude].[campaigncontents](
	[CampaignRepositoryContentID] [bigint] NULL,
	[IsDeleted] [bit] NULL,
	[CampaignContentID] [bigint] NULL,
	[RepositoryContentName] [nvarchar](max) NULL,
	[Size] [bigint] NULL,
	[IsTrash] [bit] NULL,
	[FullPath] [nvarchar](max) NULL,
	[CampaignContentTypeID] [bigint] NULL,
	[CampaignContentTypeIdentifier] [nvarchar](max) NULL,
	[AuditCreatedDate] [nvarchar](max) NULL,
	[AuditLastUpdatedDate] [nvarchar](max) NULL,
	[Page] [bigint] NULL,
	[PageSize] [bigint] NULL,
	[MaximumPageSize] [bigint] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY];

IF NOT EXISTS (
	SELECT * FROM sys.tables t JOIN sys.schemas s ON (t.schema_id = s.schema_id) 
	WHERE s.name='neolude' and t.name='campaignpermissions'
) 
CREATE TABLE [neolude].[campaignpermissions](
	[CampaignPermissionID] [bigint] NULL,
	[IsDeleted] [bit] NULL,
	[CampaignID] [bigint] NULL,
	[OccupationAreaID] [bigint] NULL,
	[BusinessUnitID] [bigint] NULL,
	[UserID] [bigint] NULL,
	[Inheritable] [bit] NULL,
	[AuditCreatedDate] [nvarchar](max) NULL,
	[AuditLastUpdatedDate] [nvarchar](max) NULL,
	[Page] [bigint] NULL,
	[PageSize] [bigint] NULL,
	[MaximumPageSize] [bigint] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY];

IF NOT EXISTS (
	SELECT * FROM sys.tables t JOIN sys.schemas s ON (t.schema_id = s.schema_id) 
	WHERE s.name='neolude' and t.name='campaigns'
) 
CREATE TABLE [neolude].[campaigns](
	[CampaignID] [bigint] NULL,
	[IsDeleted] [bit] NULL,
	[CampaignName] [nvarchar](max) NULL,
	[Beginning] [nvarchar](max) NULL,
	[Ending] [nvarchar](max) NULL,
	[IsActive] [bit] NULL,
	[CampaignContentID] [bigint] NULL,
	[ContentName] [nvarchar](max) NULL,
	[ContentTypeID] [bigint] NULL,
	[CampaignContentTypeIdentifier] [nvarchar](max) NULL,
	[AuditCreatedDate] [nvarchar](max) NULL,
	[AuditLastUpdatedDate] [nvarchar](max) NULL,
	[Page] [bigint] NULL,
	[PageSize] [bigint] NULL,
	[MaximumPageSize] [bigint] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY];

IF NOT EXISTS (
	SELECT * FROM sys.tables t JOIN sys.schemas s ON (t.schema_id = s.schema_id) 
	WHERE s.name='neolude' and t.name='categories'
) 
CREATE TABLE [neolude].[categories](
	[CategoryID] [bigint] NULL,
	[IsDeleted] [bit] NULL,
	[CategoryName] [nvarchar](max) NULL,
	[CategoryTypeID] [bigint] NULL,
	[CategoryTypeIdentifier] [nvarchar](max) NULL,
	[ParentCategoryID] [bigint] NULL,
	[AuditCreatedDate] [nvarchar](max) NULL,
	[AuditLastUpdatedDate] [nvarchar](max) NULL,
	[Page] [bigint] NULL,
	[PageSize] [bigint] NULL,
	[MaximumPageSize] [bigint] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY];

IF NOT EXISTS (
	SELECT * FROM sys.tables t JOIN sys.schemas s ON (t.schema_id = s.schema_id) 
	WHERE s.name='neolude' and t.name='certifications'
) 
CREATE TABLE [neolude].[certifications](
	[CertificationID] [bigint] NULL,
	[ClientUniqueIdentifier] [nvarchar](max) NULL,
	[IsDeleted] [bit] NULL,
	[Name] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[ExpirationType] [nvarchar](max) NULL,
	[ExpirationValue] [bigint] NULL,
	[DaysBeforeRenewal] [bigint] NULL,
	[UseCoursePermission] [bit] NULL,
	[AllowCustomExpirationDate] [bit] NULL,
	[CertificationStatusID] [bigint] NULL,
	[CertificationStatusIdentifier] [nvarchar](max) NULL,
	[AuditCreatedDate] [nvarchar](max) NULL,
	[AuditLastUpdatedDate] [nvarchar](max) NULL,
	[Page] [bigint] NULL,
	[PageSize] [bigint] NULL,
	[MaximumPageSize] [bigint] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY];

IF NOT EXISTS (
	SELECT * FROM sys.tables t JOIN sys.schemas s ON (t.schema_id = s.schema_id) 
	WHERE s.name='neolude' and t.name='certificationpermissions'
) 
CREATE TABLE [neolude].[certificationpermissions](
	[CertificationID] [bigint] NULL,
	[UserID] [bigint] NULL,
	[CourseID] [bigint] NULL,
	[GranteDate] [nvarchar](max) NULL,
	[ExpirationDate] [nvarchar](max) NULL,
	[Status] [nvarchar](max) NULL,
	[Page] [bigint] NULL,
	[PageSize] [bigint] NULL,
	[MaximumPageSize] [bigint] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY];

IF NOT EXISTS (
	SELECT * FROM sys.tables t JOIN sys.schemas s ON (t.schema_id = s.schema_id) 
	WHERE s.name='neolude' and t.name='componentactivities'
) 
CREATE TABLE [neolude].[componentactivities](
	[ComponentActivityID] [bigint] NULL,
	[IsDeleted] [bit] NULL,
	[ComponentActivityName] [nvarchar](max) NULL,
	[ComponentActivityOrder] [bigint] NULL,
	[ModuleActivityID] [bigint] NULL,
	[ModuleActivityTypeID] [bigint] NULL,
	[ModuleActivityTypeIdentifier] [nvarchar](max) NULL,
	[IsGradable] [bit] NULL,
	[GradeTypeID] [bigint] NULL,
	[GradeTypeIdentifier] [nvarchar](max) NULL,
	[GradeScale] [bigint] NULL,
	[AccountProgress] [bit] NULL,
	[EvidenceIsMandatory] [bit] NULL,
	[VisibilityID] [bigint] NULL,
	[VisibilityIdentifier] [nvarchar](max) NULL,
	[VisibilityBeginning] [nvarchar](max) NULL,
	[VisibilityEnding] [nvarchar](max) NULL,
	[VisibilityHoldDays] [bigint] NULL,
	[VisibilityAvailableDays] [bigint] NULL,
	[ComponentID] [bigint] NULL,
	[ComponentName] [nvarchar](max) NULL,
	[ComponentOrder] [bigint] NULL,
	[EnrollableID] [bigint] NULL,
	[CourseID] [bigint] NULL,
	[AuditCreatedDate] [nvarchar](max) NULL,
	[AuditLastUpdatedDate] [nvarchar](max) NULL,
	[Page] [bigint] NULL,
	[PageSize] [bigint] NULL,
	[MaximumPageSize] [bigint] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY];

IF NOT EXISTS (
	SELECT * FROM sys.tables t JOIN sys.schemas s ON (t.schema_id = s.schema_id) 
	WHERE s.name='neolude' and t.name='courseActivityViews'
) 
CREATE TABLE [neolude].[courseActivityViews](
	[CompletedActivityID] [bigint] NULL,
	[CourseID] [bigint] NULL,
	[EnrollableID] [bigint] NULL,
	[EnrollmentID] [bigint] NULL,
	[UserID] [bigint] NULL,
	[Identifier] [nvarchar](max) NULL,
	[ModuleActivityTypeID] [bigint] NULL,
	[ModuleActivityID] [bigint] NULL,
	[Activity] [nvarchar](max) NULL,
	[Attempt] [bigint] NULL,
	[timeSpent] [bigint] NULL,
	[ConclusionDate] [nvarchar](max) NULL,
	[AuditCreatedDate] [nvarchar](max) NULL,
	[AuditLastUpdatedDate] [nvarchar](max) NULL,
	[Page] [bigint] NULL,
	[PageSize] [bigint] NULL,
	[MaximumPageSize] [bigint] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY];

IF NOT EXISTS (
	SELECT * FROM sys.tables t JOIN sys.schemas s ON (t.schema_id = s.schema_id) 
	WHERE s.name='neolude' and t.name='coursecategories'
) 
CREATE TABLE [neolude].[coursecategories](
	[CourseCategoryID] [bigint] NULL,
	[CourseID] [bigint] NULL,
	[CategoryID] [bigint] NULL,
	[IsDeleted] [bit] NULL,
	[AuditCreatedDate] [nvarchar](max) NULL,
	[AuditLastUpdatedDate] [nvarchar](max) NULL,
	[Page] [bigint] NULL,
	[PageSize] [bigint] NULL,
	[MaximumPageSize] [bigint] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY];

IF NOT EXISTS (
	SELECT * FROM sys.tables t JOIN sys.schemas s ON (t.schema_id = s.schema_id) 
	WHERE s.name='neolude' and t.name='coursepermissions'
) 
CREATE TABLE [neolude].[coursepermissions](
	[UserID] [bigint] NULL,
	[CourseID] [bigint] NULL,
	[CoursePermissionLevelID] [bigint] NULL,
	[Page] [bigint] NULL,
	[PageSize] [bigint] NULL,
	[MaximumPageSize] [bigint] NULL
) ON [PRIMARY]

IF NOT EXISTS (
	SELECT * FROM sys.tables t JOIN sys.schemas s ON (t.schema_id = s.schema_id) 
	WHERE s.name='neolude' and t.name='courses'
) 
CREATE TABLE [neolude].[courses](
	[CourseID] [bigint] NULL,
	[ClientUniqueIdentifier] [nvarchar](max) NULL,
	[IsDeleted] [bit] NULL,
	[CourseName] [nvarchar](max) NULL,
	[CourseTypeID] [bigint] NULL,
	[CourseType_Identifier] [nvarchar](max) NULL,
	[RegisterOriginTypeID] [bigint] NULL,
	[RegisterOriginType_Identifier] [nvarchar](max) NULL,
	[CourseModeID] [bigint] NULL,
	[CourseMode_Identifier] [nvarchar](max) NULL,
	[EstimatedDuration] [bigint] NULL,
	[MinimumScoringGrade] [float] NULL,
	[Points] [bigint] NULL,
	[Points_ScoreOnActivityConclusion] [bigint] NULL,
	[AuditCreatedDate] [nvarchar](max) NULL,
	[AuditLastUpdatedDate] [nvarchar](max) NULL,
	[Page] [bigint] NULL,
	[PageSize] [bigint] NULL,
	[MaximumPageSize] [bigint] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY];

IF NOT EXISTS (
	SELECT * FROM sys.tables t JOIN sys.schemas s ON (t.schema_id = s.schema_id) 
	WHERE s.name='neolude' and t.name='coursetags'
) 
CREATE TABLE [neolude].[coursetags](
	[TagID] [bigint] NULL,
	[CourseID] [bigint] NULL,
	[Page] [bigint] NULL,
	[PageSize] [bigint] NULL,
	[MaximumPageSize] [bigint] NULL
) ON [PRIMARY]

IF NOT EXISTS (
	SELECT * FROM sys.tables t JOIN sys.schemas s ON (t.schema_id = s.schema_id) 
	WHERE s.name='neolude' and t.name='enrollables'
) 
CREATE TABLE [neolude].[enrollables](
	[EnrollableID] [bigint] NULL,
	[ClientUniqueIdentifier] [nvarchar](max) NULL,
	[IsDeleted] [bit] NULL,
	[EnrollableName] [nvarchar](max) NULL,
	[SourceEnrollableID] [bigint] NULL,
	[CourseID] [bigint] NULL,
	[Status_ID] [bigint] NULL,
	[Status_Identifier] [nvarchar](max) NULL,
	[EnrollableCancellationReasonID] [bigint] NULL,
	[Beginning] [nvarchar](max) NULL,
	[Ending] [nvarchar](max) NULL,
	[EstimatedDuration] [bigint] NULL,
	[EnrollableEnrollmentMethodID] [bigint] NULL,
	[EnrollableEnrollmentMethod_Identifier] [nvarchar](max) NULL,
	[MinimumScoringGrade] [nvarchar](max) NULL,
	[KeepInProgress] [nvarchar](max) NULL,
	[PlaceID] [bigint] NULL,
	[PlaceRoomID] [nvarchar](max) NULL,
	[AuditCreatedDate] [nvarchar](max) NULL,
	[AuditLastUpdatedDate] [nvarchar](max) NULL,
	[Page] [bigint] NULL,
	[PageSize] [bigint] NULL,
	[MaximumPageSize] [bigint] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY];

IF NOT EXISTS (
	SELECT * FROM sys.tables t JOIN sys.schemas s ON (t.schema_id = s.schema_id) 
	WHERE s.name='neolude' and t.name='enrollabletags'
) 
CREATE TABLE [neolude].[enrollabletags](
	[TagID] [bigint] NULL,
	[EnrollableID] [bigint] NULL,
	[Page] [bigint] NULL,
	[PageSize] [bigint] NULL,
	[MaximumPageSize] [bigint] NULL
) ON [PRIMARY] 

IF NOT EXISTS (
	SELECT * FROM sys.tables t JOIN sys.schemas s ON (t.schema_id = s.schema_id) 
	WHERE s.name='neolude' and t.name='enrollments'
) 
CREATE TABLE [neolude].[enrollments](
	[EnrollmentID] [bigint] NULL,
	[ClientUniqueIdentifier] [nvarchar](max) NULL,
	[IsDeleted] [bit] NULL,
	[IsBlocked] [bit] NULL,
	[EnrollmentTypeID] [bigint] NULL,
	[EnrollmentType_Identifier] [nvarchar](max) NULL,
	[EnrollableID] [bigint] NULL,
	[UserID] [bigint] NULL,
	[Progress] [float] NULL,
	[AverageGrade] [float] NULL,
	[EnrollmentDate] [nvarchar](max) NULL,
	[LastAccessDate] [nvarchar](max) NULL,
	[ConclusionDate] [nvarchar](max) NULL,
	[CourseUserStatusID] [bigint] NULL,
	[CourseUserStatus_Identifier] [nvarchar](max) NULL,
	[AuditCreatedDate] [nvarchar](max) NULL,
	[AuditLastUpdatedDate] [nvarchar](max) NULL,
	[Page] [bigint] NULL,
	[PageSize] [bigint] NULL,
	[MaximumPageSize] [bigint] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]; 

IF NOT EXISTS (
	SELECT * FROM sys.tables t JOIN sys.schemas s ON (t.schema_id = s.schema_id) 
	WHERE s.name='neolude' and t.name='equivalencyrequests'
) 
CREATE TABLE [neolude].[equivalencyrequests](
	[CourseEquivalencyRequestID] [bigint] NULL,
	[RequestedCourseID] [bigint] NULL,
	[EnrollmentID] [bigint] NULL,
	[RequesterUserID] [bigint] NULL,
	[RequestCreatedDate] [nvarchar](max) NULL,
	[Course] [nvarchar](max) NULL,
	[Institution] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[Duration] [bigint] NULL,
	[Notes] [nvarchar](max) NULL,
	[ExpirationDate] [nvarchar](max) NULL,
	[ConclusionDate] [nvarchar](max) NULL,
	[Status] [bigint] NULL,
	[LastActionUserID] [nvarchar](max) NULL,
	[LastActionDate] [nvarchar](max) NULL,
	[Feedback] [nvarchar](max) NULL,
	[AuditCreatedDate] [nvarchar](max) NULL,
	[AuditLastUpdatedDate] [nvarchar](max) NULL,
	[IsDeleted] [bit] NULL,
	[Page] [bigint] NULL,
	[PageSize] [bigint] NULL,
	[MaximumPageSize] [bigint] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]; 

IF NOT EXISTS (
	SELECT * FROM sys.tables t JOIN sys.schemas s ON (t.schema_id = s.schema_id) 
	WHERE s.name='neolude' and t.name='examquestions'
) 
CREATE TABLE [neolude].[examquestions](
	[ExamQuestionID] [bigint] NULL,
	[ExamID] [bigint] NULL,
	[QuestionID] [bigint] NULL,
	[Order] [bigint] NULL,
	[Points] [bigint] NULL,
	[QuestionGroupID] [bigint] NULL,
	[QuestionGroup_Title] [nvarchar](max) NULL,
	[IsDeleted] [bit] NULL,
	[AuditCreatedDate] [nvarchar](max) NULL,
	[AuditLastUpdatedDate] [nvarchar](max) NULL,
	[Page] [bigint] NULL,
	[PageSize] [bigint] NULL,
	[MaximumPageSize] [bigint] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]; 

IF NOT EXISTS (
	SELECT * FROM sys.tables t JOIN sys.schemas s ON (t.schema_id = s.schema_id) 
	WHERE s.name='neolude' and t.name='exams'
) 
CREATE TABLE [neolude].[exams](
	[ExamID] [bigint] NULL,
	[IsDeleted] [bit] NULL,
	[Title] [nvarchar](max) NULL,
	[FullPath] [nvarchar](max) NULL,
	[AttemptsLimit] [bigint] NULL,
	[DurationLimit] [bigint] NULL,
	[KeepScoreTypeID] [bigint] NULL,
	[KeepScoreType_Identifier] [nvarchar](max) NULL,
	[ExamTypeID] [bigint] NULL,
	[ExamType_Identifier] [nvarchar](max) NULL,
	[AuditCreatedDate] [nvarchar](max) NULL,
	[AuditLastUpdatedDate] [nvarchar](max) NULL,
	[Page] [bigint] NULL,
	[PageSize] [bigint] NULL,
	[MaximumPageSize] [bigint] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]; 

IF NOT EXISTS (
	SELECT * FROM sys.tables t JOIN sys.schemas s ON (t.schema_id = s.schema_id) 
	WHERE s.name='neolude' and t.name='examtakens'
) 
CREATE TABLE [neolude].[examtakens](
	[ExamTakenID] [bigint] NULL,
	[IsDeleted] [bit] NULL,
	[ExamID] [bigint] NULL,
	[EnrollmentID] [bigint] NULL,
	[UserID] [bigint] NULL,
	[Attempt] [bigint] NULL,
	[TimeSpent] [bigint] NULL,
	[NeedsGrading] [bit] NULL,
	[Grade] [float] NULL,
	[Finished] [bit] NULL,
	[CompletionDate] [datetimeoffset](7) NULL,
	[Locked] [bit] NULL,
	[CreatedByLock] [bit] NULL,
	[AuditCreatedDate] [nvarchar](max) NULL,
	[AuditLastUpdatedDate] [nvarchar](max) NULL,
	[Page] [bigint] NULL,
	[PageSize] [bigint] NULL,
	[MaximumPageSize] [bigint] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY];

IF NOT EXISTS (
	SELECT * FROM sys.tables t JOIN sys.schemas s ON (t.schema_id = s.schema_id) 
	WHERE s.name='neolude' and t.name='examtakenanswers'
) 
CREATE TABLE [neolude].[examtakenanswers](
	[Identifier] [nvarchar](max) NULL,
	[IsDeleted] [bit] NULL,
	[ExamTakenID] [bigint] NULL,
	[QuestionID] [bigint] NULL,
	[Grade] [float] NULL,
	[Answer] [nvarchar](max) NULL,
	[IsCorrect] [bit] NULL,
	[AuditCreatedDate] [nvarchar](max) NULL,
	[AuditLastUpdatedDate] [nvarchar](max) NULL,
	[Page] [bigint] NULL,
	[PageSize] [bigint] NULL,
	[MaximumPageSize] [bigint] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]; 

IF NOT EXISTS (
	SELECT * FROM sys.tables t JOIN sys.schemas s ON (t.schema_id = s.schema_id) 
	WHERE s.name='neolude' and t.name='examtakenquestions'
) 
CREATE TABLE [neolude].[examtakenquestions](
	[ExamTakenQuestionID] [bigint] NULL,
	[IsDeleted] [bit] NULL,
	[ExamTakenID] [bigint] NULL,
	[QuestionID] [bigint] NULL,
	[Order] [bigint] NULL,
	[Grade] [float] NULL,
	[Points] [bigint] NULL,
	[AuditCreatedDate] [nvarchar](max) NULL,
	[AuditLastUpdatedDate] [nvarchar](max) NULL,
	[Page] [bigint] NULL,
	[PageSize] [bigint] NULL,
	[MaximumPageSize] [bigint] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]; 

IF NOT EXISTS (
	SELECT * FROM sys.tables t JOIN sys.schemas s ON (t.schema_id = s.schema_id) 
	WHERE s.name='neolude' and t.name='htmls'
) 
CREATE TABLE [neolude].[htmls](
	[HTMLPageID] [bigint] NULL,
	[ModuleActivityTypeID] [bigint] NULL,
	[Title] [nvarchar](max) NULL,
	[FullPath] [nvarchar](max) NULL,
	[IsDeleted] [bit] NULL,
	[AuditCreatedDate] [nvarchar](max) NULL,
	[AuditLastUpdatedDate] [nvarchar](max) NULL,
	[Page] [bigint] NULL,
	[PageSize] [bigint] NULL,
	[MaximumPageSize] [bigint] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]; 

IF NOT EXISTS (
	SELECT * FROM sys.tables t JOIN sys.schemas s ON (t.schema_id = s.schema_id) 
	WHERE s.name='neolude' and t.name='labels'
) 
CREATE TABLE [neolude].[labels](
	[LabelID] [bigint] NULL,
	[ClientUniqueIdentifier] [nvarchar](max) NULL,
	[LabelName] [nvarchar](max) NULL,
	[IsDeleted] [bit] NULL,
	[AuditCreatedDate] [nvarchar](max) NULL,
	[AuditLastUpdatedDate] [nvarchar](max) NULL,
	[Page] [bigint] NULL,
	[PageSize] [bigint] NULL,
	[MaximumPageSize] [bigint] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]; 

IF NOT EXISTS (
	SELECT * FROM sys.tables t JOIN sys.schemas s ON (t.schema_id = s.schema_id) 
	WHERE s.name='neolude' and t.name='medialibraryfiledownloads'
) 
CREATE TABLE [neolude].[medialibraryfiledownloads](
	[DownloadHistoryID] [bigint] NULL,
	[IsDeleted] [bit] NULL,
	[FileAssignmentID] [bigint] NULL,
	[UserID] [bigint] NULL,
	[FileName] [nvarchar](max) NULL,
	[Title] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[DownloadDate] [nvarchar](max) NULL,
	[AuditCreatedDate] [nvarchar](max) NULL,
	[AuditLastUpdatedDate] [nvarchar](max) NULL,
	[Page] [bigint] NULL,
	[PageSize] [bigint] NULL,
	[MaximumPageSize] [bigint] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]; 

IF NOT EXISTS (
	SELECT * FROM sys.tables t JOIN sys.schemas s ON (t.schema_id = s.schema_id) 
	WHERE s.name='neolude' and t.name='medialibraryhtmls'
) 
CREATE TABLE [neolude].[medialibraryhtmls](
	[MediaContentID] [bigint] NULL,
	[IsDeleted] [bit] NULL,
	[CategoryID] [bigint] NULL,
	[Media_Name] [nvarchar](max) NULL,
	[HTMLPageID] [bigint] NULL,
	[IsEnabled] [bit] NULL,
	[DisplayDate] [nvarchar](max) NULL,
	[Points] [bigint] NULL,
	[AuditCreatedDate] [nvarchar](max) NULL,
	[AuditLastUpdatedDate] [nvarchar](max) NULL,
	[Page] [bigint] NULL,
	[PageSize] [bigint] NULL,
	[MaximumPageSize] [bigint] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]; 

IF NOT EXISTS (
	SELECT * FROM sys.tables t JOIN sys.schemas s ON (t.schema_id = s.schema_id) 
	WHERE s.name='neolude' and t.name='medialibraryhtmlviews'
) 
CREATE TABLE [neolude].[medialibraryhtmlviews](
	[AccessHistoryID] [bigint] NULL,
	[IsDeleted] [bit] NULL,
	[UserID] [bigint] NULL,
	[HTMLPageID] [bigint] NULL,
	[AccessDate] [nvarchar](max) NULL,
	[AuditCreatedDate] [nvarchar](max) NULL,
	[AuditLastUpdatedDate] [nvarchar](max) NULL,
	[Page] [bigint] NULL,
	[PageSize] [bigint] NULL,
	[MaximumPageSize] [bigint] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]; 

IF NOT EXISTS (
	SELECT * FROM sys.tables t JOIN sys.schemas s ON (t.schema_id = s.schema_id) 
	WHERE s.name='neolude' and t.name='medialibrarypermissions'
) 
CREATE TABLE [neolude].[medialibrarypermissions](
	[MediaContentPermissionID] [bigint] NULL,
	[UserID] [bigint] NULL,
	[MediaContentID] [bigint] NULL,
	[ModuleContentTypeID] [bigint] NULL,
	[ModuleContentType_Identifier] [nvarchar](max) NULL,
	[AuditCreatedDate] [nvarchar](max) NULL,
	[AuditLastUpdatedDate] [nvarchar](max) NULL,
	[Page] [bigint] NULL,
	[PageSize] [bigint] NULL,
	[MaximumPageSize] [bigint] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]; 

IF NOT EXISTS (
	SELECT * FROM sys.tables t JOIN sys.schemas s ON (t.schema_id = s.schema_id) 
	WHERE s.name='neolude' and t.name='medialibraryvideos'
) 
CREATE TABLE [neolude].[medialibraryvideos](
	[MediaContentID] [bigint] NULL,
	[IsDeleted] [bit] NULL,
	[CategoryID] [bigint] NULL,
	[Media_Name] [nvarchar](max) NULL,
	[VideoID] [bigint] NULL,
	[IsEnabled] [bit] NULL,
	[DisplayDate] [nvarchar](max) NULL,
	[Points] [bigint] NULL,
	[AuditCreatedDate] [nvarchar](max) NULL,
	[AuditLastUpdatedDate] [nvarchar](max) NULL,
	[Page] [bigint] NULL,
	[PageSize] [bigint] NULL,
	[MaximumPageSize] [bigint] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]; 

IF NOT EXISTS (
	SELECT * FROM sys.tables t JOIN sys.schemas s ON (t.schema_id = s.schema_id) 
	WHERE s.name='neolude' and t.name='occupationareas'
) 
CREATE TABLE [neolude].[occupationareas](
	[OccupationAreaID] [bigint] NULL,
	[ClientUniqueIdentifier] [nvarchar](max) NULL,
	[OccupationAreaName] [nvarchar](max) NULL,
	[IsManager] [bit] NULL,
	[OccupationAreaStatusID] [bigint] NULL,
	[OccupationAreaStatus_Identifier] [nvarchar](max) NULL,
	[IsDeleted] [bit] NULL,
	[AuditCreatedDate] [nvarchar](max) NULL,
	[AuditLastUpdatedDate] [nvarchar](max) NULL,
	[Page] [bigint] NULL,
	[PageSize] [bigint] NULL,
	[MaximumPageSize] [bigint] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]; 

IF NOT EXISTS (
	SELECT * FROM sys.tables t JOIN sys.schemas s ON (t.schema_id = s.schema_id) 
	WHERE s.name='neolude' and t.name='placerooms'
) 
CREATE TABLE [neolude].[placerooms](
	[PlaceRoomID] [bigint] NULL,
	[PlaceID] [bigint] NULL,
	[PlaceRoomName] [nvarchar](max) NULL,
	[Capacity] [bigint] NULL,
	[HasAccessibility] [bit] NULL,
	[Observations] [nvarchar](max) NULL,
	[IsDeleted] [bit] NULL,
	[AuditCreatedDate] [nvarchar](max) NULL,
	[AuditLastUpdatedDate] [nvarchar](max) NULL,
	[Page] [bigint] NULL,
	[PageSize] [bigint] NULL,
	[MaximumPageSize] [bigint] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]; 

IF NOT EXISTS (
	SELECT * FROM sys.tables t JOIN sys.schemas s ON (t.schema_id = s.schema_id) 
	WHERE s.name='neolude' and t.name='places'
) 
CREATE TABLE [neolude].[places](
	[PlaceID] [bigint] NULL,
	[PlaceName] [nvarchar](max) NULL,
	[PlaceStatusID] [bigint] NULL,
	[PlaceStatus_Identifier] [nvarchar](max) NULL,
	[IsDeleted] [bit] NULL,
	[AuditCreatedDate] [nvarchar](max) NULL,
	[AuditLastUpdatedDate] [nvarchar](max) NULL,
	[Page] [bigint] NULL,
	[PageSize] [bigint] NULL,
	[MaximumPageSize] [bigint] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]; 

IF NOT EXISTS (
	SELECT * FROM sys.tables t JOIN sys.schemas s ON (t.schema_id = s.schema_id) 
	WHERE s.name='neolude' and t.name='positions'
) 
CREATE TABLE [neolude].[positions](
	[PositionID] [bigint] NULL,
	[PositionName] [nvarchar](max) NULL,
	[IsDeleted] [bit] NULL,
	[AuditCreatedDate] [nvarchar](max) NULL,
	[AuditLastUpdatedDate] [nvarchar](max) NULL,
	[Page] [bigint] NULL,
	[PageSize] [bigint] NULL,
	[MaximumPageSize] [bigint] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]; 

IF NOT EXISTS (
	SELECT * FROM sys.tables t JOIN sys.schemas s ON (t.schema_id = s.schema_id) 
	WHERE s.name='neolude' and t.name='ppts'
) 
CREATE TABLE [neolude].[ppts](
	[PresentationID] [bigint] NULL,
	[PresentationActivityID] [bigint] NULL,
	[ModuleActivityTypeID] [bigint] NULL,
	[IsDeleted] [bit] NULL,
	[Title] [nvarchar](max) NULL,
	[SlideCount] [bigint] NULL,
	[LastUploadedFileInfo] [nvarchar](max) NULL,
	[AuditCreatedDate] [nvarchar](max) NULL,
	[AuditLastUpdatedDate] [nvarchar](max) NULL,
	[Page] [bigint] NULL,
	[PageSize] [bigint] NULL,
	[MaximumPageSize] [bigint] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]; 

IF NOT EXISTS (
	SELECT * FROM sys.tables t JOIN sys.schemas s ON (t.schema_id = s.schema_id) 
	WHERE s.name='neolude' and t.name='presentialmeetings'
) 
CREATE TABLE [neolude].[presentialmeetings](
	[PresentialMeetingID] [bigint] NULL,
	[PresentialMeetingActivityID] [bigint] NULL,
	[ModuleActivityTypeID] [bigint] NULL,
	[IsDeleted] [bit] NULL,
	[Name] [nvarchar](max) NULL,
	[Beginning] [nvarchar](max) NULL,
	[Ending] [nvarchar](max) NULL,
	[PlaceID] [bigint] NULL,
	[PlaceName] [nvarchar](max) NULL,
	[PlaceCity] [nvarchar](max) NULL,
	[PlaceState] [nvarchar](max) NULL,
	[PlaceCountry] [nvarchar](max) NULL,
	[PlaceRoomID] [bigint] NULL,
	[PlaceRoom] [nvarchar](max) NULL,
	[PlaceRoomCapacity] [bigint] NULL,
	[PlaceRoomHasAccessibility] [nvarchar](max) NULL,
	[AuditCreatedDate] [nvarchar](max) NULL,
	[AuditLastUpdatedDate] [nvarchar](max) NULL,
	[Page] [bigint] NULL,
	[PageSize] [bigint] NULL,
	[MaximumPageSize] [bigint] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]; 

IF NOT EXISTS (
	SELECT * FROM sys.tables t JOIN sys.schemas s ON (t.schema_id = s.schema_id) 
	WHERE s.name='neolude' and t.name='questions'
) 
CREATE TABLE [neolude].[questions](
	[QuestionID] [bigint] NULL,
	[IsDeleted] [bit] NULL,
	[Title] [nvarchar](max) NULL,
	[Question] [nvarchar](max) NULL,
	[DifficultyLevel] [bigint] NULL,
	[Feedback] [nvarchar](max) NULL,
	[HasAutoCorrection] [bit] NULL,
	[QuestionTypeID] [bigint] NULL,
	[QuestionType_Identifier] [nvarchar](max) NULL,
	[AuditCreatedDate] [nvarchar](max) NULL,
	[AuditLastUpdatedDate] [nvarchar](max) NULL,
	[Page] [bigint] NULL,
	[PageSize] [bigint] NULL,
	[MaximumPageSize] [bigint] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]; 

IF NOT EXISTS (
	SELECT * FROM sys.tables t JOIN sys.schemas s ON (t.schema_id = s.schema_id) 
	WHERE s.name='neolude' and t.name='scorms'
) 
CREATE TABLE [neolude].[scorms](
	[ScormID] [bigint] NULL,
	[ScormActivityID] [bigint] NULL,
	[ModuleActivityTypeID] [bigint] NULL,
	[IsDeleted] [bit] NULL,
	[Title] [nvarchar](max) NULL,
	[Version] [nvarchar](max) NULL,
	[gradeType] [nvarchar](max) NULL,
	[keepGradeType] [nvarchar](max) NULL,
	[AllowMultipleAttempts] [bit] NULL,
	[AttemptsLimit] [bigint] NULL,
	[LastUploadedFileInfo] [nvarchar](max) NULL,
	[AuditCreatedDate] [nvarchar](max) NULL,
	[AuditLastUpdatedDate] [nvarchar](max) NULL,
	[Page] [bigint] NULL,
	[PageSize] [bigint] NULL,
	[MaximumPageSize] [bigint] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]; 

IF NOT EXISTS (
	SELECT * FROM sys.tables t JOIN sys.schemas s ON (t.schema_id = s.schema_id) 
	WHERE s.name='neolude' and t.name='surveyanswerquestions'
) 
CREATE TABLE [neolude].[surveyanswerquestions](
	[SurveyQuestionAnswerID] [bigint] NULL,
	[SurveyAnswerID] [bigint] NULL,
	[SurveyQuestionID] [bigint] NULL,
	[SurveyQuestionOptionID] [bigint] NULL,
	[Answer] [nvarchar](max) NULL,
	[Justification] [nvarchar](max) NULL,
	[IsDeleted] [bit] NULL,
	[AuditCreatedDate] [nvarchar](max) NULL,
	[AuditLastUpdatedDate] [nvarchar](max) NULL,
	[Page] [bigint] NULL,
	[PageSize] [bigint] NULL,
	[MaximumPageSize] [bigint] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]; 

IF NOT EXISTS (
	SELECT * FROM sys.tables t JOIN sys.schemas s ON (t.schema_id = s.schema_id) 
	WHERE s.name='neolude' and t.name='surveyanswers'
) 
CREATE TABLE [neolude].[surveyanswers](
	[SurveyAnswerID] [bigint] NULL,
	[SurveyID] [bigint] NULL,
	[EnrollmentID] [bigint] NULL,
	[EnrollableID] [bigint] NULL,
	[CourseID] [bigint] NULL,
	[CampaignID] [bigint] NULL,
	[UserID] [bigint] NULL,
	[SubmissionDate] [nvarchar](max) NULL,
	[IsDeleted] [bit] NULL,
	[IsAnonymousAnswer] [bit] NULL,
	[AuditCreatedDate] [nvarchar](max) NULL,
	[AuditLastUpdatedDate] [nvarchar](max) NULL,
	[Page] [bigint] NULL,
	[PageSize] [bigint] NULL,
	[MaximumPageSize] [bigint] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]; 

IF NOT EXISTS (
	SELECT * FROM sys.tables t JOIN sys.schemas s ON (t.schema_id = s.schema_id) 
	WHERE s.name='neolude' and t.name='surveyquestionoptions'
) 
CREATE TABLE [neolude].[surveyquestionoptions](
	[SurveyQuestionOptionID] [bigint] NULL,
	[QuestionID] [bigint] NULL,
	[Label] [nvarchar](max) NULL,
	[Value] [nvarchar](max) NULL,
	[Order] [bigint] NULL,
	[RequiresJustification] [bit] NULL,
	[IsDeleted] [bit] NULL,
	[AuditCreatedDate] [nvarchar](max) NULL,
	[AuditLastUpdatedDate] [nvarchar](max) NULL,
	[Page] [bigint] NULL,
	[PageSize] [bigint] NULL,
	[MaximumPageSize] [bigint] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]; 

IF NOT EXISTS (
	SELECT * FROM sys.tables t JOIN sys.schemas s ON (t.schema_id = s.schema_id) 
	WHERE s.name='neolude' and t.name='surveyquestions'
) 
CREATE TABLE [neolude].[surveyquestions](
	[SurveyQuestionID] [bigint] NULL,
	[Question] [nvarchar](max) NULL,
	[SurveyID] [bigint] NULL,
	[SurveyOrder] [bigint] NULL,
	[SurveyQuestionTypeID] [bigint] NULL,
	[SurveyQuestionType_Identifier] [nvarchar](max) NULL,
	[SurveyQuestionType_HasOptions] [bit] NULL,
	[GroupingID] [bigint] NULL,
	[SurveyQuestionGrouping_Title] [nvarchar](max) NULL,
	[IsJustificationMandatory] [bit] NULL,
	[IsDeleted] [bit] NULL,
	[AuditCreatedDate] [nvarchar](max) NULL,
	[AuditLastUpdatedDate] [nvarchar](max) NULL,
	[Page] [bigint] NULL,
	[PageSize] [bigint] NULL,
	[MaximumPageSize] [bigint] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]; 

IF NOT EXISTS (
	SELECT * FROM sys.tables t JOIN sys.schemas s ON (t.schema_id = s.schema_id) 
	WHERE s.name='neolude' and t.name='surveys'
) 
CREATE TABLE [neolude].[surveys](
	[SurveyID] [bigint] NULL,
	[Title] [nvarchar](max) NULL,
	[IsDeleted] [bit] NULL,
	[PrivacyLevel] [bigint] NULL,
	[SurveyTypeID] [bigint] NULL,
	[SurveyType_Identifier] [nvarchar](max) NULL,
	[CanResponseAfterEnrollablePeriod] [bit] NULL,
	[AuditCreatedDate] [nvarchar](max) NULL,
	[AuditLastUpdatedDate] [nvarchar](max) NULL,
	[Page] [bigint] NULL,
	[PageSize] [bigint] NULL,
	[MaximumPageSize] [bigint] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]; 

IF NOT EXISTS (
	SELECT * FROM sys.tables t JOIN sys.schemas s ON (t.schema_id = s.schema_id) 
	WHERE s.name='neolude' and t.name='tags'
) 
CREATE TABLE [neolude].[tags](
	[TagID] [bigint] NULL,
	[TagName] [nvarchar](max) NULL,
	[IsDeleted] [bit] NULL,
	[AuditCreatedDate] [nvarchar](max) NULL,
	[AuditLastUpdatedDate] [nvarchar](max) NULL,
	[Page] [bigint] NULL,
	[PageSize] [bigint] NULL,
	[MaximumPageSize] [bigint] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]; 

IF NOT EXISTS (
	SELECT * FROM sys.tables t JOIN sys.schemas s ON (t.schema_id = s.schema_id) 
	WHERE s.name='neolude' and t.name='uploadactivities'
) 
CREATE TABLE [neolude].[uploadactivities](
	[FileAssignmentID] [bigint] NULL,
	[FileAssignmentUploadActivityID] [bigint] NULL,
	[ModuleActivityTypeID] [bigint] NULL,
	[IsDeleted] [bit] NULL,
	[Title] [nvarchar](max) NULL,
	[AuditCreatedDate] [nvarchar](max) NULL,
	[AuditLastUpdatedDate] [nvarchar](max) NULL,
	[Page] [bigint] NULL,
	[PageSize] [bigint] NULL,
	[MaximumPageSize] [bigint] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]; 

IF NOT EXISTS (
	SELECT * FROM sys.tables t JOIN sys.schemas s ON (t.schema_id = s.schema_id) 
	WHERE s.name='neolude' and t.name='useraccesshistorys'
) 
CREATE TABLE [neolude].[useraccesshistorys](
	[UserID] [bigint] NULL,
	[Device] [nvarchar](max) NULL,
	[AuditCreatedDate] [nvarchar](max) NULL,
	[BusinessUnitLinks] [nvarchar](max) NULL,
	[Identifier] [nvarchar](max) NULL,
	[Page] [bigint] NULL,
	[PageSize] [bigint] NULL,
	[MaximumPageSize] [bigint] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]; 

IF NOT EXISTS (
	SELECT * FROM sys.tables t JOIN sys.schemas s ON (t.schema_id = s.schema_id) 
	WHERE s.name='neolude' and t.name='userbusinessunits'
) 
CREATE TABLE [neolude].[userbusinessunits](
	[UserBusinessUnitID] [bigint] NULL,
	[IsDeleted] [bit] NULL,
	[UserID] [bigint] NULL,
	[BusinessUnitID] [bigint] NULL,
	[OccupationAreaID] [bigint] NULL,
	[MonitorIndirectSubordinates] [bit] NULL,
	[DirectSuperiorID] [nvarchar](max) NULL,
	[PositionID] [bigint] NULL,
	[AdmissionDate] [nvarchar](max) NULL,
	[DismissalDate] [nvarchar](max) NULL,
	[RegistrationNumber] [nvarchar](max) NULL,
	[IsActive] [bit] NULL,
	[StateID] [bigint] NULL,
	[State_Identifier] [nvarchar](max) NULL,
	[AuditCreatedDate] [nvarchar](max) NULL,
	[AuditLastUpdatedDate] [nvarchar](max) NULL,
	[Page] [bigint] NULL,
	[PageSize] [bigint] NULL,
	[MaximumPageSize] [bigint] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]; 

IF NOT EXISTS (
	SELECT * FROM sys.tables t JOIN sys.schemas s ON (t.schema_id = s.schema_id) 
	WHERE s.name='neolude' and t.name='usercertifications'
) 
CREATE TABLE [neolude].[usercertifications](
	[CertificationID] [bigint] NULL,
	[UserID] [bigint] NULL,
	[CourseID] [bigint] NULL,
	[GrantedDate] [nvarchar](max) NULL,
	[ExpirationDate] [nvarchar](max) NULL,
	[Status] [nvarchar](max) NULL,
	[AuditCreatedDate] [nvarchar](max) NULL,
	[AuditLastUpdatedDate] [nvarchar](max) NULL,
	[Page] [bigint] NULL,
	[PageSize] [bigint] NULL,
	[MaximumPageSize] [bigint] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]; 

IF NOT EXISTS (
	SELECT * FROM sys.tables t JOIN sys.schemas s ON (t.schema_id = s.schema_id) 
	WHERE s.name='neolude' and t.name='userlabels'
) 
CREATE TABLE [neolude].[userlabels](
	[UserLabelID] [bigint] NULL,
	[ClientUniqueIdentifier] [nvarchar](max) NULL,
	[UserID] [bigint] NULL,
	[LabelID] [bigint] NULL,
	[IsDeleted] [bit] NULL,
	[AuditCreatedDate] [nvarchar](max) NULL,
	[AuditLastUpdatedDate] [nvarchar](max) NULL,
	[Page] [bigint] NULL,
	[PageSize] [bigint] NULL,
	[MaximumPageSize] [bigint] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]; 

IF NOT EXISTS (
	SELECT * FROM sys.tables t JOIN sys.schemas s ON (t.schema_id = s.schema_id) 
	WHERE s.name='neolude' and t.name='users'
) 
CREATE TABLE [neolude].[users](
	[UserID] [bigint] NULL,
	[ClientUniqueIdentifier] [nvarchar](max) NULL,
	[FirstName] [nvarchar](max) NULL,
	[LastName] [nvarchar](max) NULL,
	[Login] [nvarchar](max) NULL,
	[CPF] [nvarchar](max) NULL,
	[RG] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NULL,
	[BirthDate] [nvarchar](max) NULL,
	[GenderIdentifier] [nvarchar](max) NULL,
	[IsDeleted] [bit] NULL,
	[AuditCreatedDate] [nvarchar](max) NULL,
	[AuditLastUpdatedDate] [nvarchar](max) NULL,
	[LastLogin] [nvarchar](max) NULL,
	[RegisterOriginTypeID] [bigint] NULL,
	[RegisterOriginType_Identifier] [nvarchar](max) NULL,
	[TermsOfUseAcceptance] [bigint] NULL,
	[DefaultPictureURL] [nvarchar](max) NULL,
	[Suspension_IsActive] [bigint] NULL,
	[Suspension_Motive] [nvarchar](max) NULL,
	[Suspension_Feedback] [nvarchar](max) NULL,
	[Suspension_StartDate] [nvarchar](max) NULL,
	[Suspension_ExpirationDate] [nvarchar](max) NULL,
	[Suspension_AuditLastUpdatedDate] [nvarchar](max) NULL,
	[Page] [bigint] NULL,
	[PageSize] [bigint] NULL,
	[MaximumPageSize] [bigint] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]; 

IF NOT EXISTS (
	SELECT * FROM sys.tables t JOIN sys.schemas s ON (t.schema_id = s.schema_id) 
	WHERE s.name='neolude' and t.name='videos'
) 
CREATE TABLE [neolude].[videos](
	[VideoID] [float] NULL,
	[IsDeleted] [bit] NULL,
	[Title] [nvarchar](max) NULL,
	[FullPath] [nvarchar](max) NULL,
	[Duration] [bigint] NULL,
	[VideoStatusID] [bigint] NULL,
	[VideoStatus_Identifier] [nvarchar](max) NULL,
	[IsLive] [bit] NULL,
	[SeekEnabled] [bit] NULL,
	[IsExternal] [bit] NULL,
	[AuditCreatedDate] [nvarchar](max) NULL,
	[AuditLastUpdatedDate] [nvarchar](max) NULL,
	[Page] [bigint] NULL,
	[PageSize] [bigint] NULL,
	[MaximumPageSize] [bigint] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]; 

IF NOT EXISTS (
	SELECT * FROM sys.tables t JOIN sys.schemas s ON (t.schema_id = s.schema_id) 
	WHERE s.name='neolude' and t.name='videoviews'
) 
CREATE TABLE [neolude].[videoviews](
	[VideoAccessHistoryID] [bigint] NULL,
	[IsDeleted] [bit] NULL,
	[UserID] [bigint] NULL,
	[VideoID] [bigint] NULL,
	[AccessDate] [nvarchar](max) NULL,
	[AuditCreatedDate] [nvarchar](max) NULL,
	[AuditLastUpdatedDate] [nvarchar](max) NULL,
	[Page] [bigint] NULL,
	[PageSize] [bigint] NULL,
	[MaximumPageSize] [bigint] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]; 

IF NOT EXISTS (
	SELECT * FROM sys.tables t JOIN sys.schemas s ON (t.schema_id = s.schema_id) 
	WHERE s.name='neolude' and t.name='webmeetings'
) 
CREATE TABLE [neolude].[webmeetings](
	[WebMeetingID] [bigint] NULL,
	[WebMeetingActivityID] [bigint] NULL,
	[ModuleActivityTypeID] [bigint] NULL,
	[IsDeleted] [bit] NULL,
	[Title] [nvarchar](max) NULL,
	[StartDate] [nvarchar](max) NULL,
	[EndDate] [nvarchar](max) NULL,
	[type] [nvarchar](max) NULL,
	[AuditCreatedDate] [nvarchar](max) NULL,
	[AuditLastUpdatedDate] [nvarchar](max) NULL,
	[Page] [bigint] NULL,
	[PageSize] [bigint] NULL,
	[MaximumPageSize] [bigint] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]; 

IF NOT EXISTS (
	SELECT * FROM sys.tables t JOIN sys.schemas s ON (t.schema_id = s.schema_id) 
	WHERE s.name='neolude' and t.name='teste_cursos'
) 
CREATE TABLE [neolude].[teste_cursos](
	[CourseID] [bigint] NULL,
	[ClientUniqueIdentifier] [nvarchar](max) NULL,
	[IsDeleted] [bit] NULL,
	[CourseName] [nvarchar](max) NULL,
	[CourseTypeID] [bigint] NULL,
	[CourseType_Identifier] [nvarchar](max) NULL,
	[RegisterOriginTypeID] [bigint] NULL,
	[RegisterOriginType_Identifier] [nvarchar](max) NULL,
	[CourseModeID] [bigint] NULL,
	[CourseMode_Identifier] [nvarchar](max) NULL,
	[EstimatedDuration] [bigint] NULL,
	[MinimumScoringGrade] [float] NULL,
	[Points] [bigint] NULL,
	[Points_ScoreOnActivityConclusion] [bit] NULL,
	[AuditCreatedDate] [nvarchar](max) NULL,
	[AuditLastUpdatedDate] [nvarchar](max) NULL,
	[Page] [bigint] NULL,
	[PageSize] [bigint] NULL,
	[MaximumPageSize] [bigint] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]; 

IF NOT EXISTS (
	SELECT * FROM sys.tables t JOIN sys.schemas s ON (t.schema_id = s.schema_id) 
	WHERE s.name='neolude' and t.name='teste_positions'
) 
CREATE TABLE [neolude].[teste_positions](
	[PositionID] [bigint] NULL,
	[PositionName] [nvarchar](max) NULL,
	[IsDeleted] [bit] NULL,
	[AuditCreatedDate] [nvarchar](max) NULL,
	[AuditLastUpdatedDate] [nvarchar](max) NULL,
	[Page] [bigint] NULL,
	[PageSize] [bigint] NULL,
	[MaximumPageSize] [bigint] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY];
