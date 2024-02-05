IF NOT EXISTS (
	SELECT * FROM sys.tables t JOIN sys.schemas s ON (t.schema_id = s.schema_id) 
	WHERE s.name='neolude' and t.name='medialibraryfiledownloads'
) 
CREATE TABLE [neolude].[medialibraryfiledownloads](
	[DownloadHistoryID] [bigint] NULL,
	[IsDeleted] [bit] NULL,
	[FileAssignmentID] [bigint] NULL,
	[UserID] [bigint] NULL,
	[FileName] [nvarchar](max) NULL,
	[Title] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[DownloadDate] [nvarchar](max) NULL,
	[AuditCreatedDate] [nvarchar](max) NULL,
	[AuditLastUpdatedDate] [nvarchar](max) NULL,
	[Page] [bigint] NULL,
	[PageSize] [bigint] NULL,
	[MaximumPageSize] [bigint] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]; 