IF NOT EXISTS (
SELECT *
FROM sys.tables t JOIN sys.schemas s ON (t.schema_id = s.schema_id)
WHERE s.name='Courses' and t.name='Courses'
) 
CREATE TABLE [Courses].[Courses]
(
	[CourseID] [int] NOT NULL PRIMARY KEY,
	[ClientUniqueIdentifier] [nvarchar](50) NULL,
	[IsDeleted] [bit] NOT NULL,
	[CourseName] [nvarchar](200) NOT NULL,
	[CourseTypeID] [int] NOT NULL,
	[CourseType_Identifier] [nvarchar](20) NULL,
	[RegisterOriginTypeID] [int] NULL,
	[RegisterOriginType_Identifier] [nvarchar](20) NULL,
	[CourseModeID] [int] NULL,
	[CourseMode_Identifier] [nvarchar](20) NULL,
	[EstimatedDuration] [smallint] NULL,
	[MinimumScoringGrade] [decimal] NULL,
	[Points] [tinyint] NULL,
	[Points_ScoreOnActivityConclusion] [bit] NULL,
	[AuditCreatedDate] [datetime] NOT NULL,
	[AuditLastUpdatedDate] [datetime] NOT NULL,
	[Page] [smallint] NOT NULL,
	[PageSize] [smallint] NOT NULL,
	[MaximumPageSize] [smallint] NOT NULL
); 