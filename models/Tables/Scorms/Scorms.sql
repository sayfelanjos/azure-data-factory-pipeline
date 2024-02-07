IF NOT EXISTS (
SELECT *
FROM sys.tables t JOIN sys.schemas s ON (t.schema_id = s.schema_id)
WHERE s.name='Scorms' and t.name='Scorms'
) 
CREATE TABLE [Scorms].[Scorms]
(
	[ScormID] [int] NOT NULL PRIMARY KEY,
	[ScormActivityID] [int] NOT NULL,
	[ModuleActivityTypeID] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[Title] [nvarchar](200) NULL,
	[Version] [nvarchar](10) NOT NULL,
	[gradeType] [nvarchar](20) NOT NULL,
	[keepGradeType] [nvarchar](20) NOT NULL,
	[AllowMultipleAttempts] [bit] NOT NULL,
	[AttemptsLimit] [tinyint] NULL,
	[LastUploadedFileInfo] [nvarchar](400) NOT NULL,
	[AuditCreatedDate] [datetime] NOT NULL,
	[AuditLastUpdatedDate] [datetime] NOT NULL,
	[Page] [smallint] NOT NULL,
	[PageSize] [smallint] NOT NULL,
	[MaximumPageSize] [smallint] NOT NULL
); 