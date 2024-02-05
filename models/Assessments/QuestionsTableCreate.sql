
IF NOT EXISTS (
	SELECT * FROM sys.tables t JOIN sys.schemas s ON (t.schema_id = s.schema_id) 
	WHERE s.name='Assessments' and t.name='Questions'
) 
CREATE TABLE [Assessments].[Questions](
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