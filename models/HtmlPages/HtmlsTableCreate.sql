IF NOT EXISTS (
	SELECT * FROM sys.tables t JOIN sys.schemas s ON (t.schema_id = s.schema_id) 
	WHERE s.name='neolude' and t.name='htmls'
) 
CREATE TABLE [neolude].[htmls](
	[HTMLPageID] [bigint] NULL,
	[ModuleActivityTypeID] [bigint] NULL,
	[Title] [nvarchar](max) NULL,
	[FullPath] [nvarchar](max) NULL,
	[IsDeleted] [bit] NULL,
	[AuditCreatedDate] [nvarchar](max) NULL,
	[AuditLastUpdatedDate] [nvarchar](max) NULL,
	[Page] [bigint] NULL,
	[PageSize] [bigint] NULL,
	[MaximumPageSize] [bigint] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]; 