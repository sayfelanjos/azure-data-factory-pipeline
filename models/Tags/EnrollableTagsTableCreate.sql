IF NOT EXISTS (
	SELECT * FROM sys.tables t JOIN sys.schemas s ON (t.schema_id = s.schema_id) 
	WHERE s.name='neolude' and t.name='enrollabletags'
) 
CREATE TABLE [neolude].[enrollabletags](
	[TagID] [bigint] NULL,
	[EnrollableID] [bigint] NULL,
	[Page] [bigint] NULL,
	[PageSize] [bigint] NULL,
	[MaximumPageSize] [bigint] NULL
) ON [PRIMARY] 