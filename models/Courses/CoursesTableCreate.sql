IF NOT EXISTS (
	SELECT * FROM sys.tables t JOIN sys.schemas s ON (t.schema_id = s.schema_id) 
	WHERE s.name='neolude' and t.name='courses'
) 
CREATE TABLE [neolude].[courses](
	[CourseID] [bigint] NULL,
	[ClientUniqueIdentifier] [nvarchar](max) NULL,
	[IsDeleted] [bit] NULL,
	[CourseName] [nvarchar](max) NULL,
	[CourseTypeID] [bigint] NULL,
	[CourseType_Identifier] [nvarchar](max) NULL,
	[RegisterOriginTypeID] [bigint] NULL,
	[RegisterOriginType_Identifier] [nvarchar](max) NULL,
	[CourseModeID] [bigint] NULL,
	[CourseMode_Identifier] [nvarchar](max) NULL,
	[EstimatedDuration] [bigint] NULL,
	[MinimumScoringGrade] [float] NULL,
	[Points] [bigint] NULL,
	[Points_ScoreOnActivityConclusion] [bigint] NULL,
	[AuditCreatedDate] [nvarchar](max) NULL,
	[AuditLastUpdatedDate] [nvarchar](max) NULL,
	[Page] [bigint] NULL,
	[PageSize] [bigint] NULL,
	[MaximumPageSize] [bigint] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY];