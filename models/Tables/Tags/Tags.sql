IF NOT EXISTS (
SELECT *
FROM sys.tables t JOIN sys.schemas s ON (t.schema_id = s.schema_id)
WHERE s.name='Tags' and t.name='Tags'
) 
CREATE TABLE [Tags].[Tags]
(
	[TagID] [int] NOT NULL PRIMARY KEY,
	[TagName] [nvarchar](400) NULL,
	[IsDeleted] [bit] NULL,
	[AuditCreatedDate] [datetime] NULL,
	[AuditLastUpdatedDate] [datetime] NULL,
	[Page] [smallint] NULL,
	[PageSize] [smallint] NULL,
	[MaximumPageSize] [smallint] NULL
); 