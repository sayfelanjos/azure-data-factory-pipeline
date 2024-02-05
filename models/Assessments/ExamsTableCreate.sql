IF NOT EXISTS (
	SELECT * FROM sys.tables t JOIN sys.schemas s ON (t.schema_id = s.schema_id) 
	WHERE s.name='Assessments' and t.name='Exams'
) 
CREATE TABLE [Assessments].[Exams](
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
