IF NOT EXISTS (
SELECT *
FROM sys.tables t JOIN sys.schemas s ON (t.schema_id = s.schema_id)
WHERE s.name='Assessments' and t.name='ExamTakenQuestions'
) 
CREATE TABLE [Assessments].[ExamTakenQuestions]
(
	[ExamTakenQuestionID] [int] NOT NULL PRIMARY KEY,
	[IsDeleted] [bit] NOT NULL,
	[ExamTakenID] [int] NOT NULL,
	[QuestionID] [int] NOT NULL,
	[Order] [tinyint] NOT NULL,
	[Grade] [decimal] NOT NULL,
	[Points] [tinyint] NOT NULL,
	[AuditCreatedDate] [datetime] NOT NULL,
	[AuditLastUpdatedDate] [datetime] NOT NULL,
	[Page] [smallint] NOT NULL,
	[PageSize] [smallint] NOT NULL,
	[MaximumPageSize] [smallint] NOT NULL
); 