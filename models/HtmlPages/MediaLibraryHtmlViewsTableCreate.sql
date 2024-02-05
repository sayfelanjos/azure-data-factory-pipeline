IF NOT EXISTS (
	SELECT * FROM sys.tables t JOIN sys.schemas s ON (t.schema_id = s.schema_id) 
	WHERE s.name='neolude' and t.name='medialibraryhtmlviews'
) 
CREATE TABLE [neolude].[medialibraryhtmlviews](
	[AccessHistoryID] [bigint] NULL,
	[IsDeleted] [bit] NULL,
	[UserID] [bigint] NULL,
	[HTMLPageID] [bigint] NULL,
	[AccessDate] [nvarchar](max) NULL,
	[AuditCreatedDate] [nvarchar](max) NULL,
	[AuditLastUpdatedDate] [nvarchar](max) NULL,
	[Page] [bigint] NULL,
	[PageSize] [bigint] NULL,
	[MaximumPageSize] [bigint] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]; 