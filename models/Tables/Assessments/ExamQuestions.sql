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
	[Order] [tinyint] NOT NULL,
	[Points] [tinyint] NOT NULL,
	[QuestionGroupID] [int] NULL,
	[QuestionGroup_Title] [nvarchar](200) NULL,
	[IsDeleted] [bit] NOT NULL,
	[AuditCreatedDate] [datetime] NOT NULL,
	[AuditLastUpdatedDate] [datetime] NOT NULL,
	[Page] [smallint] NOT NULL,
	[PageSize] [smallint] NOT NULL,
	[MaximumPageSize] [smallint] NOT NULL,
); 