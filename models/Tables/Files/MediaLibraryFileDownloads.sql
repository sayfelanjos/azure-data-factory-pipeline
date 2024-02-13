IF NOT EXISTS (
SELECT *
FROM sys.tables t JOIN sys.schemas s ON (t.schema_id = s.schema_id)
WHERE s.name='Files' and t.name='MediaLibraryFileDownloads'
) 
CREATE TABLE [Files].[MediaLibraryFileDownloads]
(
	[MediaLibraryFileDownloadsID] [uniqueidentifier] NOT NULL PRIMARY KEY,
	[DownloadHistoryID] [int] NOT NULL,
	[IsDeleted] [bit] NULL,
	[FileAssignmentID] [int] NULL,
	[UserID] [int] NOT NULL FOREIGN KEY (UserID) REFERENCES Users.Users(UserID),
	[FileName] [nvarchar](4000) NULL,
	[Title] [nvarchar](4000) NULL,
	[Description] [nvarchar](4000) NULL,
	[DownloadDate] [datetime] NULL,
	[AuditCreatedDate] [datetime] NULL,
	[AuditLastUpdatedDate] [datetime] NULL,
	[Page] [smallint] NULL,
	[PageSize] [smallint] NULL,
	[MaximumPageSize] [smallint] NULL
); 