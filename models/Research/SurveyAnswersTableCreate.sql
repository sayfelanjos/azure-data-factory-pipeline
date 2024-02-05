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