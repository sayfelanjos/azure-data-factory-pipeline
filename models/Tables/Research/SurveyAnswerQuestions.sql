
IF NOT EXISTS (
SELECT *
FROM sys.tables t JOIN sys.schemas s ON (t.schema_id = s.schema_id)
WHERE s.name='Research' and t.name='SurveyAnswerQuestions'
) 
CREATE TABLE [Research].[SurveyAnswerQuestions]
(
	[SurveyQuestionAnswerID] [int] NOT NULL PRIMARY KEY,
	[SurveyAnswerID] [int] NOT NULL FOREIGN KEY (SurveyAnswerID) REFERENCES Research.SurveyAnswers(SurveyAnswerID),
	[SurveyQuestionID] [int] NOT NULL FOREIGN KEY (SurveyQuestionID) REFERENCES Research.SurveyQuestions(SurveyQuestionID),
	[SurveyQuestionOptionID] [int] NULL FOREIGN KEY (SurveyQuestionOptionID) REFERENCES Research.SurveyQuestionOptions(SurveyQuestionOptionID),
	[Answer] [nvarchar](4000) NULL,
	[Justification] [nvarchar](4000) NULL,
	[IsDeleted] [bit] NULL,
	[AuditCreatedDate] [datetime] NULL,
	[AuditLastUpdatedDate] [datetime] NULL,
	[Page] [smallint] NULL,
	[PageSize] [smallint] NULL,
	[MaximumPageSize] [smallint] NULL
); 