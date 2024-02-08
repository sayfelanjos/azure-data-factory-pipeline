IF NOT EXISTS (
SELECT *
FROM sys.tables t JOIN sys.schemas s ON (t.schema_id = s.schema_id)
WHERE s.name='Assessments' and t.name='Questions'
) 
CREATE TABLE [Assessments].[Questions]
(
	[QuestionID] [int] NOT NULL PRIMARY KEY,
	[IsDeleted] [bit] NOT NULL,
	[Title] [nvarchar](4000) NULL,
	[Question] [nvarchar](4000) NOT NULL,
	[DifficultyLevel] [tinyint] NOT NULL,
	[Feedback] [nvarchar](4000) NULL,
	[HasAutoCorrection] [bit] NOT NULL,
	[QuestionTypeID] [smallint] NOT NULL,
	[QuestionType_Identifier] [nvarchar](20) NOT NULL,
	[AuditCreatedDate] [datetime] NOT NULL,
	[AuditLastUpdatedDate] [datetime] NOT NULL,
	[Page] [smallint] NOT NULL,
	[PageSize] [smallint] NOT NULL,
	[MaximumPageSize] [smallint] NOT NULL
); 