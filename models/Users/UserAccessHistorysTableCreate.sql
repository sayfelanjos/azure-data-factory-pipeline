IF NOT EXISTS (
	SELECT * FROM sys.tables t JOIN sys.schemas s ON (t.schema_id = s.schema_id) 
	WHERE s.name='neolude' and t.name='useraccesshistorys'
) 
CREATE TABLE [neolude].[useraccesshistorys](
	[UserID] [bigint] NULL,
	[Device] [nvarchar](max) NULL,
	[AuditCreatedDate] [nvarchar](max) NULL,
	[BusinessUnitLinks] [nvarchar](max) NULL,
	[Identifier] [nvarchar](max) NULL,
	[Page] [bigint] NULL,
	[PageSize] [bigint] NULL,
	[MaximumPageSize] [bigint] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]; 