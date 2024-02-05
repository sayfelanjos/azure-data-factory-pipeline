IF NOT EXISTS (
	SELECT * FROM sys.tables t JOIN sys.schemas s ON (t.schema_id = s.schema_id) 
	WHERE s.name='neolude' and t.name='courseActivityViews'
) 
CREATE TABLE [neolude].[courseActivityViews](
	[CompletedActivityID] [bigint] NULL,
	[CourseID] [bigint] NULL,
	[EnrollableID] [bigint] NULL,
	[EnrollmentID] [bigint] NULL,
	[UserID] [bigint] NULL,
	[Identifier] [nvarchar](max) NULL,
	[ModuleActivityTypeID] [bigint] NULL,
	[ModuleActivityID] [bigint] NULL,
	[Activity] [nvarchar](max) NULL,
	[Attempt] [bigint] NULL,
	[timeSpent] [bigint] NULL,
	[ConclusionDate] [nvarchar](max) NULL,
	[AuditCreatedDate] [nvarchar](max) NULL,
	[AuditLastUpdatedDate] [nvarchar](max) NULL,
	[Page] [bigint] NULL,
	[PageSize] [bigint] NULL,
	[MaximumPageSize] [bigint] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY];