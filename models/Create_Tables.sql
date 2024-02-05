IF NOT EXISTS (SELECT 1 FROM sys.schemas WHERE name = 'neolude')
BEGIN
    EXEC('CREATE SCHEMA neolude')
END

SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON


















































IF NOT EXISTS (
	SELECT * FROM sys.tables t JOIN sys.schemas s ON (t.schema_id = s.schema_id) 
	WHERE s.name='neolude' and t.name='teste_cursos'
) 
CREATE TABLE [neolude].[teste_cursos](
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
	[Points_ScoreOnActivityConclusion] [bit] NULL,
	[AuditCreatedDate] [nvarchar](max) NULL,
	[AuditLastUpdatedDate] [nvarchar](max) NULL,
	[Page] [bigint] NULL,
	[PageSize] [bigint] NULL,
	[MaximumPageSize] [bigint] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY];

IF NOT EXISTS (
	SELECT * FROM sys.tables t JOIN sys.schemas s ON (t.schema_id = s.schema_id) 
	WHERE s.name='neolude' and t.name='teste_positions'
) 
CREATE TABLE [neolude].[teste_positions](
	[PositionID] [bigint] NULL,
	[PositionName] [nvarchar](max) NULL,
	[IsDeleted] [bit] NULL,
	[AuditCreatedDate] [nvarchar](max) NULL,
	[AuditLastUpdatedDate] [nvarchar](max) NULL,
	[Page] [bigint] NULL,
	[PageSize] [bigint] NULL,
	[MaximumPageSize] [bigint] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY];
