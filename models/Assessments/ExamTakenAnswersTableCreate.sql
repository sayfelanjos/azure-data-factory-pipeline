IF NOT EXISTS (
	SELECT * FROM sys.tables t JOIN sys.schemas s ON (t.schema_id = s.schema_id) 
	WHERE s.name='Assessments' and t.name='ExamTakenAnswers'
) 
CREATE TABLE [Assessments].[ExamTakenAnswers](
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