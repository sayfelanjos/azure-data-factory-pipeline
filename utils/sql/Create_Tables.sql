IF NOT EXISTS (SELECT 1 FROM sys.schemas WHERE name = 'great_job')
BEGIN
    EXEC('CREATE SCHEMA great_job')
END

SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE TABLE [great_job].[dbo.audios](
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
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

CREATE TABLE [great_job].[dbo.businessunits](
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
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

CREATE TABLE [great_job].[dbo.campaigncontents](
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
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

CREATE TABLE [great_job].[dbo.campaignpermissions](
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
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

CREATE TABLE [great_job].[dbo.campaigns](
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
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

CREATE TABLE [great_job].[dbo.catries](
[CatryID] [bigint] NULL,
[IsDeleted] [bit] NULL,
[CatryName] [nvarchar](max) NULL,
[CatryTypeID] [bigint] NULL,
[CatryTypeIdentifier] [nvarchar](max) NULL,
[ParentCatryID] [bigint] NULL,
[AuditCreatedDate] [nvarchar](max) NULL,
[AuditLastUpdatedDate] [nvarchar](max) NULL,
[Page] [bigint] NULL,
[PageSize] [bigint] NULL,
[MaximumPageSize] [bigint] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

CREATE TABLE [great_job].[dbo.certifications](
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
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

CREATE TABLE [great_job].[dbo.componentactivities](
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
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

CREATE TABLE [great_job].[dbo.courseActivityViews](
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
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

CREATE TABLE [great_job].[dbo.coursecatries](
[CourseCatryID] [bigint] NULL,
[CourseID] [bigint] NULL,
[CatryID] [bigint] NULL,
[IsDeleted] [bit] NULL,
[AuditCreatedDate] [nvarchar](max) NULL,
[AuditLastUpdatedDate] [nvarchar](max) NULL,
[Page] [bigint] NULL,
[PageSize] [bigint] NULL,
[MaximumPageSize] [bigint] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

CREATE TABLE [great_job].[dbo.coursepermissions](
[UserID] [bigint] NULL,
[CourseID] [bigint] NULL,
[CoursePermissionLevelID] [bigint] NULL,
[Page] [bigint] NULL,
[PageSize] [bigint] NULL,
[MaximumPageSize] [bigint] NULL
) ON [PRIMARY]

CREATE TABLE [great_job].[dbo.courses](
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
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

CREATE TABLE [great_job].[dbo.coursetags](
[TagID] [bigint] NULL,
[CourseID] [bigint] NULL,
[Page] [bigint] NULL,
[PageSize] [bigint] NULL,
[MaximumPageSize] [bigint] NULL
) ON [PRIMARY]

CREATE TABLE [great_job].[dbo.enrollables](
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
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

CREATE TABLE [great_job].[dbo.enrollabletags](
[TagID] [bigint] NULL,
[EnrollableID] [bigint] NULL,
[Page] [bigint] NULL,
[PageSize] [bigint] NULL,
[MaximumPageSize] [bigint] NULL
) ON [PRIMARY] 

CREATE TABLE [great_job].[dbo.enrollments](
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
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY] 

CREATE TABLE [great_job].[dbo.equivalencyrequests](
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
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY] 

CREATE TABLE [great_job].[dbo.examquestions](
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
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY] 

CREATE TABLE [great_job].[dbo.exams](
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
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY] 

CREATE TABLE [great_job].[dbo.examtaken](
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
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY] 

CREATE TABLE [great_job].[dbo.examtakenquestions](
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
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY] 

CREATE TABLE [great_job].[dbo.htmls](
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
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY] 

CREATE TABLE [great_job].[dbo.labels](
[LabelID] [bigint] NULL,
[ClientUniqueIdentifier] [nvarchar](max) NULL,
[LabelName] [nvarchar](max) NULL,
[IsDeleted] [bit] NULL,
[AuditCreatedDate] [nvarchar](max) NULL,
[AuditLastUpdatedDate] [nvarchar](max) NULL,
[Page] [bigint] NULL,
[PageSize] [bigint] NULL,
[MaximumPageSize] [bigint] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY] 

CREATE TABLE [great_job].[dbo.medialibraryfiledownloads](
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
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY] 

CREATE TABLE [great_job].[dbo.medialibraryhtmls](
[MediaContentID] [bigint] NULL,
[IsDeleted] [bit] NULL,
[CatryID] [bigint] NULL,
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
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY] 

CREATE TABLE [great_job].[dbo.medialibraryhtmlviews](
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
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY] 

CREATE TABLE [great_job].[dbo.medialibrarypermissions](
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
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY] 

CREATE TABLE [great_job].[dbo.medialibraryvideos](
[MediaContentID] [bigint] NULL,
[IsDeleted] [bit] NULL,
[CatryID] [bigint] NULL,
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
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY] 

CREATE TABLE [great_job].[dbo.occupationareas](
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
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY] 

CREATE TABLE [great_job].[dbo.placerooms](
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
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY] 

CREATE TABLE [great_job].[dbo.places](
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
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY] 

CREATE TABLE [great_job].[dbo.positions](
[PositionID] [bigint] NULL,
[PositionName] [nvarchar](max) NULL,
[IsDeleted] [bit] NULL,
[AuditCreatedDate] [nvarchar](max) NULL,
[AuditLastUpdatedDate] [nvarchar](max) NULL,
[Page] [bigint] NULL,
[PageSize] [bigint] NULL,
[MaximumPageSize] [bigint] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY] 

CREATE TABLE [great_job].[dbo.ppts](
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
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY] 

CREATE TABLE [great_job].[dbo.presentialmeetings](
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
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY] 

CREATE TABLE [great_job].[dbo.questions](
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
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY] 

CREATE TABLE [great_job].[dbo.scorms](
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
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY] 

CREATE TABLE [great_job].[dbo.surveyanswerquestions](
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
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY] 

CREATE TABLE [great_job].[dbo.surveyanswers](
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
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY] 

CREATE TABLE [great_job].[dbo.surveyquestionoptions](
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
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY] 

CREATE TABLE [great_job].[dbo.surveyquestions](
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
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY] 

CREATE TABLE [great_job].[dbo.surveys](
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
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY] 

CREATE TABLE [great_job].[dbo.tags](
[TagID] [bigint] NULL,
[TagName] [nvarchar](max) NULL,
[IsDeleted] [bit] NULL,
[AuditCreatedDate] [nvarchar](max) NULL,
[AuditLastUpdatedDate] [nvarchar](max) NULL,
[Page] [bigint] NULL,
[PageSize] [bigint] NULL,
[MaximumPageSize] [bigint] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY] 

CREATE TABLE [great_job].[dbo.uploadactivities](
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
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY] 

CREATE TABLE [great_job].[dbo.useraccesshistorys](
[UserID] [bigint] NULL,
[Device] [nvarchar](max) NULL,
[AuditCreatedDate] [nvarchar](max) NULL,
[BusinessUnitLinks] [nvarchar](max) NULL,
[Identifier] [nvarchar](max) NULL,
[Page] [bigint] NULL,
[PageSize] [bigint] NULL,
[MaximumPageSize] [bigint] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY] 

CREATE TABLE [great_job].[dbo.userbusinessunits](
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
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY] 

CREATE TABLE [great_job].[dbo.usercertifications](
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
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY] 

CREATE TABLE [great_job].[dbo.userlabels](
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
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY] 

CREATE TABLE [great_job].[dbo.users](
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
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY] 

CREATE TABLE [great_job].[dbo.videos](
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
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY] 

CREATE TABLE [great_job].[dbo.videoviews](
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
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY] 

CREATE TABLE [great_job].[dbo.webmeeting](
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
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY] 

CREATE TABLE [great_job].[teste_cursos](
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
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY] 

CREATE TABLE [great_job].[teste_positions](
[PositionID] [bigint] NULL,
[PositionName] [nvarchar](max) NULL,
[IsDeleted] [bit] NULL,
[AuditCreatedDate] [nvarchar](max) NULL,
[AuditLastUpdatedDate] [nvarchar](max) NULL,
[Page] [bigint] NULL,
[PageSize] [bigint] NULL,
[MaximumPageSize] [bigint] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
