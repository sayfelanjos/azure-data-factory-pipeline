IF NOT EXISTS (
SELECT *
FROM sys.tables t JOIN sys.schemas s ON (t.schema_id = s.schema_id)
WHERE s.name='Courses' and t.name='Enrollables'
) 
CREATE TABLE [Courses].[Enrollables]
(
	[EnrollableID] [int] NOT NULL PRIMARY KEY,
	[ClientUniqueIdentifier] [nvarchar](50) NULL,
	[IsDeleted] [bit] NOT NULL,
	[EnrollableName] [nvarchar](200) NULL,
	[SourceEnrollableID] [int] NULL,
	[CourseID] [int] NOT NULL FOREIGN KEY (CourseID) REFERENCES Courses.Courses(CourseID),
	[Status_ID] [int] NOT NULL,
	[Status_Identifier] [nvarchar](20) NOT NULL,
	[EnrollableCancellationReasonID] [int] NULL,
	[Beginning] [datetime] NOT NULL,
	[Ending] [datetime] NOT NULL,
	[EstimatedDuration] [int] NULL,
	[EnrollableEnrollmentMethodID] [int] NOT NULL,
	[EnrollableEnrollmentMethod_Identifier] [nvarchar](20) NOT NULL,
	[MinimumScoringGrade] [decimal] NOT NULL,
	[KeepInProgress] [bit] NOT NULL,
	[PlaceID] [int] NULL,
	[PlaceRoomID] [decimal] NULL,
	[AuditCreatedDate] [datetime] NOT NULL,
	[AuditLastUpdatedDate] [datetime] NOT NULL,
	[Page] [smallint] NOT NULL,
	[PageSize] [smallint] NOT NULL,
	[MaximumPageSize] [smallint] NOT NULL
); 