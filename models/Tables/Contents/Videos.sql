IF NOT EXISTS (
SELECT *
FROM sys.tables t JOIN sys.schemas s ON (t.schema_id = s.schema_id)
WHERE s.name='Contents' and t.name='Videos'
) 
CREATE TABLE [Contents].[Videos]
(
	[VideoID] [int] NOT NULL PRIMARY KEY,
	[IsDeleted] [bit] NULL,
	[Title] [nvarchar](400) NULL,
	[FullPath] [nvarchar](4000) NULL,
	[Duration] [smallint] NULL,
	[VideoStatusID] [smallint] NULL,
	[VideoStatus_Identifier] [nvarchar](20) NULL,
	[IsLive] [bit] NULL,
	[SeekEnabled] [bit] NULL,
	[IsExternal] [bit] NULL,
	[AuditCreatedDate] [datetime] NULL,
	[AuditLastUpdatedDate] [datetime] NULL,
	[Page] [smallint] NULL,
	[PageSize] [smallint] NULL,
	[MaximumPageSize] [smallint] NULL
); 