IF NOT EXISTS (
SELECT *
FROM sys.tables t JOIN sys.schemas s ON (t.schema_id = s.schema_id)
WHERE s.name='Assessments' and t.name='ExamTakenAnswers'
) 
CREATE TABLE [Assessments].[ExamTakenAnswers]
(
	[Identifier] [nvarchar](200) NOT NULL,
	[IsDeleted] [bit] NULL,
	[EssayAnswerID] [int] NULL,
	[MatchingAnswerID] [int] NULL,
	[MultipleAnswerAnswerID] [int] NULL,
	[MultipleChoiceAnswerID] [int] NULL,
	[TrueOrFalseAnswerID] [int] NULL,
	[ExamTakenID] [int] NOT NULL FOREIGN KEY (ExamTakenID) REFERENCES Assessments.ExamTakens(ExamTakenID),
	[QuestionID] [int] NOT NULL FOREIGN KEY (QuestionID) REFERENCES Assessments.Questions(QuestionID),
	[Grade] [decimal] NULL,
	[Answer] [nvarchar](4000) NULL,
	[IsCorrect] [bit] NULL,
	[AuditCreatedDate] [datetime] NULL,
	[AuditLastUpdatedDate] [datetime] NULL,
	[Page] [smallint] NULL,
	[PageSize] [smallint] NULL,
	[MaximumPageSize] [smallint] NULL
); 