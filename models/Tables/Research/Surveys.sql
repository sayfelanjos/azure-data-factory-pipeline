IF NOT EXISTS (
SELECT *
FROM sys.tables t JOIN sys.schemas s ON (t.schema_id = s.schema_id)
WHERE s.name='Research' and t.name='Surveys'
) 
CREATE TABLE [Research].[Surveys]
(
	[SurveyID] [int] NOT NULL PRIMARY KEY,
	[Title] [nvarchar](200) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[PrivacyLevel] [tinyint] NOT NULL,
	[SurveyTypeID] [int] NOT NULL,
	[SurveyType_Identifier] [nvarchar](20) NOT NULL,
	[CanResponseAfterEnrollablePeriod] [bit] NOT NULL,
	[AuditCreatedDate] [datetime] NOT NULL,
	[AuditLastUpdatedDate] [datetime] NOT NULL,
	[Page] [smallint] NOT NULL,
	[PageSize] [smallint] NOT NULL,
	[MaximumPageSize] [smallint] NOT NULL
); 