IF NOT EXISTS (
	SELECT * FROM sys.tables t JOIN sys.schemas s ON (t.schema_id = s.schema_id) 
	WHERE s.name='neolude' and t.name='medialibraryvideos'
) 
CREATE TABLE [neolude].[medialibraryvideos](
	[MediaContentID] [bigint] NULL,
	[IsDeleted] [bit] NULL,
	[CategoryID] [bigint] NULL,
	[Media_Name] [nvarchar](max) NULL,
	[VideoID] [bigint] NULL,
	[IsEnabled] [bit] NULL,
	[DisplayDate] [nvarchar](max) NULL,
	[Points] [bigint] NULL,
	[AuditCreatedDate] [nvarchar](max) NULL,
	[AuditLastUpdatedDate] [nvarchar](max) NULL,
	[Page] [bigint] NULL,
	[PageSize] [bigint] NULL,
	[MaximumPageSize] [bigint] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]; 