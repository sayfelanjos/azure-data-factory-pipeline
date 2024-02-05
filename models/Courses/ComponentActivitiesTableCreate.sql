IF NOT EXISTS (
	SELECT * FROM sys.tables t JOIN sys.schemas s ON (t.schema_id = s.schema_id) 
	WHERE s.name='neolude' and t.name='componentactivities'
) 
CREATE TABLE [neolude].[componentactivities](
	[ComponentActivityID] [bigint] NULL,
	[IsDeleted] [bit] NULL,
	[ComponentActivityName] [nvarchar](max) NULL,
	[ComponentActivityOrder] [bigint] NULL,
	[ModuleActivityID] [bigint] NULL,
	[ModuleActivityTypeID] [bigint] NULL,
	[ModuleActivityTypeIdentifier] [nvarchar](max) NULL,
	[IsGradable] [bit] NULL,
	[GradeTypeID] [bigint] NULL,
	[GradeTypeIdentifier] [nvarchar](max) NULL,
	[GradeScale] [bigint] NULL,
	[AccountProgress] [bit] NULL,
	[EvidenceIsMandatory] [bit] NULL,
	[VisibilityID] [bigint] NULL,
	[VisibilityIdentifier] [nvarchar](max) NULL,
	[VisibilityBeginning] [nvarchar](max) NULL,
	[VisibilityEnding] [nvarchar](max) NULL,
	[VisibilityHoldDays] [bigint] NULL,
	[VisibilityAvailableDays] [bigint] NULL,
	[ComponentID] [bigint] NULL,
	[ComponentName] [nvarchar](max) NULL,
	[ComponentOrder] [bigint] NULL,
	[EnrollableID] [bigint] NULL,
	[CourseID] [bigint] NULL,
	[AuditCreatedDate] [nvarchar](max) NULL,
	[AuditLastUpdatedDate] [nvarchar](max) NULL,
	[Page] [bigint] NULL,
	[PageSize] [bigint] NULL,
	[MaximumPageSize] [bigint] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY];