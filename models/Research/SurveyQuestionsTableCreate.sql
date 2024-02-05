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