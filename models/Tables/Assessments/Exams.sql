IF NOT EXISTS (
SELECT *
FROM sys.tables t JOIN sys.schemas s ON (t.schema_id = s.schema_id)
WHERE s.name='Assessments' and t.name='Exams'
) 
CREATE TABLE [Assessments].[Exams]
(
	[ExamID] [int] NOT NULL PRIMARY KEY,
	[IsDeleted] [bit] NULL,
	[Title] [nvarchar](400) NULL,
	[FullPath] [nvarchar](4000) NULL,
	[AttemptsLimit] [tinyint] NULL,
	[DurationLimit] [int] NULL,
	[KeepScoreTypeID] [int] NULL,
	[KeepScoreType_Identifier] [nvarchar](200) NULL,
	[ExamTypeID] [int] NULL,
	[ExamType_Identifier] [nvarchar](200) NULL,
	[AuditCreatedDate] [datetime] NULL,
	[AuditLastUpdatedDate] [datetime] NULL,
	[Page] [smallint] NULL,
	[PageSize] [smallint] NULL,
	[MaximumPageSize] [smallint] NULL
); 
