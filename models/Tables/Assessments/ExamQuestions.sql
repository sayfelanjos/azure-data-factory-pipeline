IF NOT EXISTS (
SELECT *
FROM sys.tables t JOIN sys.schemas s ON (t.schema_id = s.schema_id)
WHERE s.name='Assessments' and t.name='ExamQuestions'
) 
CREATE TABLE [Assessments].[ExamQuestions]
(
	[ExamQuestionID] [int] NOT NULL PRIMARY KEY,
	[ExamID] [int] NOT NULL FOREIGN KEY (ExamID) REFERENCES [Assessments].[Exams](ExamID),
	[QuestionID] [int] NOT NULL FOREIGN KEY (QuestionID) REFERENCES [Assessments].[Questions](QuestionID),
	[Order] [tinyint] NULL,
	[Points] [tinyint] NULL,
	[QuestionGroupID] [int] NULL,
	[QuestionGroup_Title] [nvarchar](400) NULL,
	[IsDeleted] [bit] NULL,
	[AuditCreatedDate] [datetime] NULL,
	[AuditLastUpdatedDate] [datetime] NULL,
	[Page] [smallint] NULL,
	[PageSize] [smallint] NULL,
	[MaximumPageSize] [smallint] NULL,
); 