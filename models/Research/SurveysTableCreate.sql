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