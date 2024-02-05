IF NOT EXISTS (
	SELECT * FROM sys.tables t JOIN sys.schemas s ON (t.schema_id = s.schema_id) 
	WHERE s.name='neolude' and t.name='videos'
) 
CREATE TABLE [neolude].[videos](
	[VideoID] [float] NULL,
	[IsDeleted] [bit] NULL,
	[Title] [nvarchar](max) NULL,
	[FullPath] [nvarchar](max) NULL,
	[Duration] [bigint] NULL,
	[VideoStatusID] [bigint] NULL,
	[VideoStatus_Identifier] [nvarchar](max) NULL,
	[IsLive] [bit] NULL,
	[SeekEnabled] [bit] NULL,
	[IsExternal] [bit] NULL,
	[AuditCreatedDate] [nvarchar](max) NULL,
	[AuditLastUpdatedDate] [nvarchar](max) NULL,
	[Page] [bigint] NULL,
	[PageSize] [bigint] NULL,
	[MaximumPageSize] [bigint] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]; 