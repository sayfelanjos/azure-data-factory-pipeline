IF NOT EXISTS (
SELECT *
FROM sys.tables t JOIN sys.schemas s ON (t.schema_id = s.schema_id)
WHERE s.name='Contents' and t.name='MediaLibraryVideos'
) 
CREATE TABLE [Contents].[MediaLibraryVideos]
(
	[MediaContentID] [int] NOT NULL PRIMARY KEY,
	[IsDeleted] [bit] NULL,
	[CategoryID] [int] NULL FOREIGN KEY (CategoryID) REFERENCES Categories.Categories(CategoryID),
	[Media_Name] [nvarchar](400) NULL,
	[VideoID] [int] NULL,
	[IsEnabled] [bit] NULL,
	[DisplayDate] [datetime] NULL,
	[Points] [tinyint] NULL,
	[AuditCreatedDate] [datetime] NULL,
	[AuditLastUpdatedDate] [datetime] NULL,
	[Page] [smallint] NULL,
	[PageSize] [smallint] NULL,
	[MaximumPageSize] [smallint] NULL
); 