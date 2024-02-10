IF NOT EXISTS (
SELECT *
FROM sys.tables t JOIN sys.schemas s ON (t.schema_id = s.schema_id)
WHERE s.name='Assessments' and t.name='ExamTakenQuestions'
) 
CREATE TABLE [Assessments].[ExamTakenQuestions]
(
	[ExamTakenQuestionID] [int] NOT NULL PRIMARY KEY,
	[IsDeleted] [bit] NULL,
	[ExamTakenID] [int] NOT NULL FOREIGN KEY (ExamTakenID) REFERENCES Assessments.ExamTakens(ExamTakenID),
	[QuestionID] [int] NOT NULL FOREIGN KEY (QuestionID) REFERENCES Assessments.Questions(QuestionsID),
	[Order] [tinyint] NULL,
	[Grade] [decimal] NULL,
	[Points] [tinyint] NULL,
	[AuditCreatedDate] [datetime] NULL,
	[AuditLastUpdatedDate] [datetime] NULL,
	[Page] [smallint] NULL,
	[PageSize] [smallint] NULL,
	[MaximumPageSize] [smallint] NULL
); 