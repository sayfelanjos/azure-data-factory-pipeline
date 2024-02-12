IF NOT EXISTS (
SELECT *
FROM sys.tables t JOIN sys.schemas s ON (t.schema_id = s.schema_id)
WHERE s.name='Files' and t.name='MediaLibraryHtmls'
) 
CREATE TABLE [Files].[MediaLibraryHtmls]
(
	[MediaContentID] [int] NOT NULL PRIMARY KEY,
	[IsDeleted] [bit] NULL,
	[CategoryID] [int] NULL,
	[Media_Name] [nvarchar](4000) NULL,
	[HTMLPageID] [int] NULL,
	[IsEnabled] [bit] NULL,
	[DisplayDate] [datetime] NULL,
	[Points] [smallint] NULL,
	[AuditCreatedDate] [datetime] NULL,
	[AuditLastUpdatedDate] [datetime] NULL,
	[Page] [smallint] NULL,
	[PageSize] [smallint] NULL,
	[MaximumPageSize] [smallint] NULL
); 
