IF NOT EXISTS (
SELECT *
FROM sys.tables t JOIN sys.schemas s ON (t.schema_id = s.schema_id)
WHERE s.name='Contents' and t.name='MediaLibraryPermissions'
) 
CREATE TABLE [Contents].[MediaLibraryPermissions]
(
	[MediaContentPermissionID] [int] NOT NULL PRIMARY KEY,
	[UserID] [int] NOT NULL FOREIGN KEY (UserID) REFERENCES Users.Users(UserID),
	[MediaContentID] [int] NULL,
	[ModuleContentTypeID] [int] NULL,
	[ModuleContentType_Identifier] [nvarchar](80) NULL,
	[AuditCreatedDate] [datetime] NULL,
	[AuditLastUpdatedDate] [datetime] NULL,
	[Page] [smallint] NULL,
	[PageSize] [smallint] NULL,
	[MaximumPageSize] [smallint] NULL
); 