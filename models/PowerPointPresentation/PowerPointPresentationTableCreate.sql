IF NOT EXISTS (
	SELECT * FROM sys.tables t JOIN sys.schemas s ON (t.schema_id = s.schema_id) 
	WHERE s.name='neolude' and t.name='ppts'
) 
CREATE TABLE [neolude].[ppts](
	[PresentationID] [bigint] NULL,
	[PresentationActivityID] [bigint] NULL,
	[ModuleActivityTypeID] [bigint] NULL,
	[IsDeleted] [bit] NULL,
	[Title] [nvarchar](max) NULL,
	[SlideCount] [bigint] NULL,
	[LastUploadedFileInfo] [nvarchar](max) NULL,
	[AuditCreatedDate] [nvarchar](max) NULL,
	[AuditLastUpdatedDate] [nvarchar](max) NULL,
	[Page] [bigint] NULL,
	[PageSize] [bigint] NULL,
	[MaximumPageSize] [bigint] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]; 