IF NOT EXISTS (
SELECT *
FROM sys.tables t JOIN sys.schemas s ON (t.schema_id = s.schema_id)
WHERE s.name='Assessments' and t.name='ExamTakenAnswers'
) 
CREATE TABLE [Assessments].[ExamTakenAnswers]
(
	[Identifier] [nvarchar](20) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ExamTakenID] [int] NOT NULL FOREIGN KEY (ExamTakenID) REFERENCES Assessments.ExamTakens(ExamTakenID),
	[QuestionID] [int] NOT NULL FOREIGN KEY (QuestionID) REFERENCES Assessments.Questions(QuestionID),
	[Grade] [decimal] NOT NULL,
	[Answer] [nvarchar](400) NOT NULL,
	[IsCorrect] [bit] NULL,
	[AuditCreatedDate] [datetime] NOT NULL,
	[AuditLastUpdatedDate] [datetime] NOT NULL,
	[Page] [smallint] NOT NULL,
	[PageSize] [smallint] NOT NULL,
	[MaximumPageSize] [smallint] NOT NULL
); 