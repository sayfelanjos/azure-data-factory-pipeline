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