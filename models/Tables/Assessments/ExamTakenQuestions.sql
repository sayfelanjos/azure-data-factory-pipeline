IF NOT EXISTS (
SELECT *
FROM sys.tables t JOIN sys.schemas s ON (t.schema_id = s.schema_id)
WHERE s.name='Assessments' and t.name='ExamTakenQuestions'
) 
CREATE TABLE [Assessments].[ExamTakenQuestions]
(
	[ExamTakenQuestionID] [bigint] NULL,
	[IsDeleted] [bit] NULL,
	[ExamTakenID] [bigint] NULL,
	[QuestionID] [bigint] NULL,
	[Order] [bigint] NULL,
	[Grade] [float] NULL,
	[Points] [bigint] NULL,
	[AuditCreatedDate] [datetime] NOT NULL,
	[AuditLastUpdatedDate] [datetime] NOT NULL,
	[Page] [smallint] NOT NULL,
	[PageSize] [smallint] NOT NULL,
	[MaximumPageSize] [smallint] NOT NULL
); 