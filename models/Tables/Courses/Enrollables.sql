IF NOT EXISTS (
SELECT *
FROM sys.tables t JOIN sys.schemas s ON (t.schema_id = s.schema_id)
WHERE s.name='Courses' and t.name='Enrollables'
) 
CREATE TABLE [Courses].[Enrollables]
(
	[EnrollableID] [int] NOT NULL PRIMARY KEY,
	[ClientUniqueIdentifier] [nvarchar](50) NULL,
	[IsDeleted] [bit] NULL,
	[EnrollableName] [nvarchar](200) NULL,
	[SourceEnrollableID] [int] NULL,
	[CourseID] [int] NOT NULL FOREIGN KEY (CourseID) REFERENCES Courses.Courses(CourseID),
	[Status_ID] [int] NULL,
	[Status_Identifier] [nvarchar](20) NULL,
	[EnrollableCancellationReasonID] [int] NULL,
	[Beginning] [datetime] NULL,
	[Ending] [datetime] NULL,
	[EstimatedDuration] [int] NULL,
	[EnrollableEnrollmentMethodID] [int] NULL,
	[EnrollableEnrollmentMethod_Identifier] [nvarchar](20) NULL,
	[MinimumScoringGrade] [decimal] NULL,
	[KeepInProgress] [bit] NULL,
	[PlaceID] [int] NULL,
	[PlaceRoomID] [decimal] NULL,
	[AuditCreatedDate] [datetime] NULL,
	[AuditLastUpdatedDate] [datetime] NULL,
	[Page] [smallint] NULL,
	[PageSize] [smallint] NULL,
	[MaximumPageSize] [smallint] NULL
); 