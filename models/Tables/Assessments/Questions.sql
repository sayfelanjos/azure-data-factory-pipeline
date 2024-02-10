IF NOT EXISTS (
SELECT *
FROM sys.tables t JOIN sys.schemas s ON (t.schema_id = s.schema_id)
WHERE s.name='Assessments' and t.name='Questions'
) 
CREATE TABLE [Assessments].[Questions]
(
	[QuestionID] [int] NOT NULL PRIMARY KEY,
	[IsDeleted] [bit] NULL,
	[Title] [nvarchar](max) NULL,
	[Question] [nvarchar](max) NULL,
	[DifficultyLevel] [tinyint] NULL,
	[Feedback] [nvarchar](4000) NULL,
	[HasAutoCorrection] [bit] NULL,
	[QuestionTypeID] [smallint] NULL,
	[QuestionType_Identifier] [nvarchar](200) NULL,
	[AuditCreatedDate] [datetime] NULL,
	[AuditLastUpdatedDate] [datetime] NULL,
	[Page] [smallint] NULL,
	[PageSize] [smallint] NULL,
	[MaximumPageSize] [smallint] NULL
); 