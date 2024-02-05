IF NOT EXISTS (
	SELECT * FROM sys.tables t JOIN sys.schemas s ON (t.schema_id = s.schema_id) 
	WHERE s.name='neolude' and t.name='enrollables'
) 
CREATE TABLE [neolude].[enrollables](
	[EnrollableID] [bigint] NULL,
	[ClientUniqueIdentifier] [nvarchar](max) NULL,
	[IsDeleted] [bit] NULL,
	[EnrollableName] [nvarchar](max) NULL,
	[SourceEnrollableID] [bigint] NULL,
	[CourseID] [bigint] NULL,
	[Status_ID] [bigint] NULL,
	[Status_Identifier] [nvarchar](max) NULL,
	[EnrollableCancellationReasonID] [bigint] NULL,
	[Beginning] [nvarchar](max) NULL,
	[Ending] [nvarchar](max) NULL,
	[EstimatedDuration] [bigint] NULL,
	[EnrollableEnrollmentMethodID] [bigint] NULL,
	[EnrollableEnrollmentMethod_Identifier] [nvarchar](max) NULL,
	[MinimumScoringGrade] [nvarchar](max) NULL,
	[KeepInProgress] [nvarchar](max) NULL,
	[PlaceID] [bigint] NULL,
	[PlaceRoomID] [nvarchar](max) NULL,
	[AuditCreatedDate] [nvarchar](max) NULL,
	[AuditLastUpdatedDate] [nvarchar](max) NULL,
	[Page] [bigint] NULL,
	[PageSize] [bigint] NULL,
	[MaximumPageSize] [bigint] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY];