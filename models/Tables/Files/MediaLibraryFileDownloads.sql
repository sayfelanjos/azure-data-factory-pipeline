IF NOT EXISTS (
SELECT *
FROM sys.tables t JOIN sys.schemas s ON (t.schema_id = s.schema_id)
WHERE s.name='Files' and t.name='MediaLibraryFileDownloads'
) 
CREATE TABLE [Files].[MediaLibraryFileDownloads]
(
	[DownloadHistoryID] [int] NOT NULL PRIMARY KEY,
	[IsDeleted] [bit] NOT NULL,
	[FileAssignmentID] [int] NOT NULL,
	[UserID] [int] NOT NULL FOREIGN KEY (UserID) REFERENCES Users.Users(UserID),
	[FileName] [nvarchar](400) NOT NULL,
	[Title] [nvarchar](400) NOT NULL,
	[Description] [nvarchar](4000) NULL,
	[DownloadDate] [datetime] NOT NULL,
	[AuditCreatedDate] [datetime] NOT NULL,
	[AuditLastUpdatedDate] [datetime] NOT NULL,
	[Page] [smallint] NOT NULL,
	[PageSize] [smallint] NOT NULL,
	[MaximumPageSize] [smallint] NOT NULL
); 