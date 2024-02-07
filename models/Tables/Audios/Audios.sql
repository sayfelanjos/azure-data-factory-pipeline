IF NOT EXISTS (
SELECT *
FROM sys.tables t JOIN sys.schemas s ON (t.schema_id = s.schema_id)
WHERE s.name='Audios' and t.name='Audios'
) 
CREATE TABLE [Audios].[Audios]
(
	[AudioID] [int] NOT NULL PRIMARY KEY,
	[AudioActivityID] [int] NOT NULL,
	[ModuleActivityTypeID] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[Title] [nvarchar](200) NOT NULL,
	[AuditCreatedDate] [datetime] NOT NULL,
	[AuditLastUpdatedDate] [datetime] NOT NULL,
	[Page] [smallint] NOT NULL,
	[PageSize] [smallint] NOT NULL,
	[MaximumPageSize] [smallint] NOT NULL
); 