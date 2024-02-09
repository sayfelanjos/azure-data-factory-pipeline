IF NOT EXISTS (
SELECT *
FROM sys.tables t JOIN sys.schemas s ON (t.schema_id = s.schema_id)
WHERE s.name='Files' and t.name='MediaLibraryHtmls'
) 
CREATE TABLE [Files].[MediaLibraryHtmls]
(
	[MediaContentID] [int] NOT NULL PRIMARY KEY,
	[IsDeleted] [bit] NOT NULL,
	[CategoryID] [int] NULL,
	[Media_Name] [nvarchar](200) NOT NULL,
	[HTMLPageID] [int] NOT NULL,
	[IsEnabled] [bit] NOT NULL,
	[DisplayDate] [datetime] NOT NULL,
	[Points] [smallint] NOT NULL,
	[AuditCreatedDate] [datetime] NOT NULL,
	[AuditLastUpdatedDate] [datetime] NOT NULL,
	[Page] [smallint] NOT NULL,
	[PageSize] [smallint] NOT NULL,
	[MaximumPageSize] [smallint] NOT NULL
); 
