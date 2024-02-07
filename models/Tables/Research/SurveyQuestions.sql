IF NOT EXISTS (
SELECT *
FROM sys.tables t JOIN sys.schemas s ON (t.schema_id = s.schema_id)
WHERE s.name='Research' and t.name='SurveyQuestions'
) 
CREATE TABLE [Research].[SurveyQuestions]
(
	[SurveyQuestionID] [int] NOT NULL PRIMARY KEY,
	[Question] [nvarchar](400) NULL,
	[SurveyID] [int] NOT NULL FOREIGN KEY (SurveyID) REFERENCES Research.Surveys(SurveyID),
	[SurveyOrder] [tinyint] NOT NULL,
	[SurveyQuestionTypeID] [int] NOT NULL,
	[SurveyQuestionType_Identifier] [nvarchar](20) NULL,
	[SurveyQuestionType_HasOptions] [bit] NOT NULL,
	[GroupingID] [int] NOT NULL,
	[SurveyQuestionGrouping_Title] [nvarchar](200) NOT NULL,
	[IsJustificationMandatory] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[AuditCreatedDate] [datetime] NOT NULL,
	[AuditLastUpdatedDate] [datetime] NOT NULL,
	[Page] [smallint] NOT NULL,
	[PageSize] [smallint] NOT NULL,
	[MaximumPageSize] [smallint] NOT NULL
); 