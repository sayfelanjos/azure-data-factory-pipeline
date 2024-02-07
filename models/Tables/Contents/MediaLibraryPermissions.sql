IF NOT EXISTS (
SELECT *
FROM sys.tables t JOIN sys.schemas s ON (t.schema_id = s.schema_id)
WHERE s.name='Contents' and t.name='MediaLibraryPermissions'
) 
CREATE TABLE [Contents].[MediaLibraryPermissions]
(
	[MediaContentPermissionID] [int] NOT NULL PRIMARY KEY,
	[UserID] [int] NOT NULL FOREIGN KEY (UserID) REFERENCES Users.Users(UserID),
	[MediaContentID] [int] NOT NULL FOREIGN KEY (MediaContentID) REFERENCES Contents.MediaLibraryVideos(MediaContentID),
	[ModuleContentTypeID] [int] NOT NULL,
	[ModuleContentType_Identifier] [nvarchar](80) NULL,
	[AuditCreatedDate] [datetime] NOT NULL,
	[AuditLastUpdatedDate] [datetime] NOT NULL,
	[Page] [smallint] NOT NULL,
	[PageSize] [smallint] NOT NULL,
	[MaximumPageSize] [smallint] NOT NULL
); 