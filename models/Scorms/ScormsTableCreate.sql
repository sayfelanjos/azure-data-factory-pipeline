IF NOT EXISTS (
	SELECT * FROM sys.tables t JOIN sys.schemas s ON (t.schema_id = s.schema_id) 
	WHERE s.name='neolude' and t.name='scorms'
) 
CREATE TABLE [neolude].[scorms](
	[ScormID] [bigint] NULL,
	[ScormActivityID] [bigint] NULL,
	[ModuleActivityTypeID] [bigint] NULL,
	[IsDeleted] [bit] NULL,
	[Title] [nvarchar](max) NULL,
	[Version] [nvarchar](max) NULL,
	[gradeType] [nvarchar](max) NULL,
	[keepGradeType] [nvarchar](max) NULL,
	[AllowMultipleAttempts] [bit] NULL,
	[AttemptsLimit] [bigint] NULL,
	[LastUploadedFileInfo] [nvarchar](max) NULL,
	[AuditCreatedDate] [nvarchar](max) NULL,
	[AuditLastUpdatedDate] [nvarchar](max) NULL,
	[Page] [bigint] NULL,
	[PageSize] [bigint] NULL,
	[MaximumPageSize] [bigint] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]; 