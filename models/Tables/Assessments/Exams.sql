IF NOT EXISTS (
SELECT *
FROM sys.tables t JOIN sys.schemas s ON (t.schema_id = s.schema_id)
WHERE s.name='Assessments' and t.name='Exams'
) 
CREATE TABLE [Assessments].[Exams]
(
	[ExamID] [int] NOT NULL PRIMARY KEY,
	[IsDeleted] [bit] NOT NULL,
	[Title] [nvarchar](200) NOT NULL,
	[FullPath] [nvarchar](400) NOT NULL,
	[AttemptsLimit] [tinyint] NULL,
	[DurationLimit] [int] NULL,
	[KeepScoreTypeID] [int] NULL,
	[KeepScoreType_Identifier] [nvarchar](100) NULL,
	[ExamTypeID] [int] NOT NULL,
	[ExamType_Identifier] [nvarchar](100) NOT NULL,
	[AuditCreatedDate] [datetime] NOT NULL,
	[AuditLastUpdatedDate] [datetime] NOT NULL,
	[Page] [smallint] NOT NULL,
	[PageSize] [smallint] NOT NULL,
	[MaximumPageSize] [smallint] NOT NULL
); 
