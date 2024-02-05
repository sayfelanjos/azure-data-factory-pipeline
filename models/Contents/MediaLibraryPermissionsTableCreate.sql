IF NOT EXISTS (
	SELECT * FROM sys.tables t JOIN sys.schemas s ON (t.schema_id = s.schema_id) 
	WHERE s.name='neolude' and t.name='medialibrarypermissions'
) 
CREATE TABLE [neolude].[medialibrarypermissions](
	[MediaContentPermissionID] [bigint] NULL,
	[UserID] [bigint] NULL,
	[MediaContentID] [bigint] NULL,
	[ModuleContentTypeID] [bigint] NULL,
	[ModuleContentType_Identifier] [nvarchar](max) NULL,
	[AuditCreatedDate] [nvarchar](max) NULL,
	[AuditLastUpdatedDate] [nvarchar](max) NULL,
	[Page] [bigint] NULL,
	[PageSize] [bigint] NULL,
	[MaximumPageSize] [bigint] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]; 