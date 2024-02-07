IF NOT EXISTS (
SELECT *
FROM sys.tables t JOIN sys.schemas s ON (t.schema_id = s.schema_id)
WHERE s.name='Audios' and t.name='Audios'
) 
CREATE TABLE [Audios].[Audios]
(
	[AudioID] [bigint] NULL,
	[AudioActivityID] [bigint] NULL,
	[ModuleActivityTypeID] [bigint] NULL,
	[IsDeleted] [bit] NULL,
	[Title] [nvarchar](max) NULL,
	[AuditCreatedDate] [datetime] NOT NULL,
	[AuditLastUpdatedDate] [datetime] NOT NULL,
	[Page] [smallint] NOT NULL,
	[PageSize] [smallint] NOT NULL,
	[MaximumPageSize] [smallint] NOT NULL
); 