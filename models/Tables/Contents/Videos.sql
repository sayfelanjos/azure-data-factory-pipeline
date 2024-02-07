IF NOT EXISTS (
SELECT *
FROM sys.tables t JOIN sys.schemas s ON (t.schema_id = s.schema_id)
WHERE s.name='Contents' and t.name='Videos'
) 
CREATE TABLE [Contents].[Videos]
(
	[VideoID] [int] NOT NULL PRIMARY KEY,
	[IsDeleted] [bit] NOT NULL,
	[Title] [nvarchar](200) NOT NULL,
	[FullPath] [nvarchar](400) NOT NULL,
	[Duration] [smallint] NOT NULL,
	[VideoStatusID] [smallint] NOT NULL,
	[VideoStatus_Identifier] [nvarchar](20) NOT NULL,
	[IsLive] [bit] NOT NULL,
	[SeekEnabled] [bit] NOT NULL,
	[IsExternal] [bit] NOT NULL,
	[AuditCreatedDate] [datetime] NOT NULL,
	[AuditLastUpdatedDate] [datetime] NOT NULL,
	[Page] [smallint] NOT NULL,
	[PageSize] [smallint] NOT NULL,
	[MaximumPageSize] [smallint] NOT NULL
); 