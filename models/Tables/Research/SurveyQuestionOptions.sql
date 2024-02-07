IF NOT EXISTS (
SELECT *
FROM sys.tables t JOIN sys.schemas s ON (t.schema_id = s.schema_id)
WHERE s.name='Research' and t.name='SurveyQuestionOptions'
) 
CREATE TABLE [Research].[SurveyQuestionOptions]
(
	[SurveyQuestionOptionID] [int] NOT NULL PRIMARY KEY,
	[QuestionID] [int] NOT NULL,
	[Label] [nvarchar](200) NOT NULL,
	[Value] [nvarchar](10) NOT NULL,
	[Order] [tinyint] NOT NULL,
	[RequiresJustification] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[AuditCreatedDate] [datetime] NOT NULL,
	[AuditLastUpdatedDate] [datetime] NOT NULL,
	[Page] [smallint] NOT NULL,
	[PageSize] [smallint] NOT NULL,
	[MaximumPageSize] [smallint] NOT NULL
); 