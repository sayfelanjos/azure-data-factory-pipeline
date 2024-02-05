IF NOT EXISTS (
	SELECT * FROM sys.tables t JOIN sys.schemas s ON (t.schema_id = s.schema_id) 
	WHERE s.name='neolude' and t.name='categories'
) 
CREATE TABLE [neolude].[categories](
	[CategoryID] [bigint] NULL,
	[IsDeleted] [bit] NULL,
	[CategoryName] [nvarchar](max) NULL,
	[CategoryTypeID] [bigint] NULL,
	[CategoryTypeIdentifier] [nvarchar](max) NULL,
	[ParentCategoryID] [bigint] NULL,
	[AuditCreatedDate] [nvarchar](max) NULL,
	[AuditLastUpdatedDate] [nvarchar](max) NULL,
	[Page] [bigint] NULL,
	[PageSize] [bigint] NULL,
	[MaximumPageSize] [bigint] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY];