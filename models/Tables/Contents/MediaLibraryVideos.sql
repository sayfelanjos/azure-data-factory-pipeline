IF NOT EXISTS (
SELECT *
FROM sys.tables t JOIN sys.schemas s ON (t.schema_id = s.schema_id)
WHERE s.name='Contents' and t.name='MediaLibraryVideos'
) 
CREATE TABLE [Contents].[MediaLibraryVideos]
(
	[MediaContentID] [int] NOT NULL PRIMARY KEY,
	[IsDeleted] [bit] NOT NULL,
	[CategoryID] [int] NULL,
	[Media_Name] [nvarchar](400) NULL,
	[VideoID] [int] NULL,
	[IsEnabled] [bit] NOT NULL,
	[DisplayDate] [datetime] NOT NULL,
	[Points] [tinyint] NULL,
	[AuditCreatedDate] [datetime] NOT NULL,
	[AuditLastUpdatedDate] [datetime] NOT NULL,
	[Page] [smallint] NOT NULL,
	[PageSize] [smallint] NOT NULL,
	[MaximumPageSize] [smallint] NOT NULL
); 