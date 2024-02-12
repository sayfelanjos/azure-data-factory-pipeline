IF NOT EXISTS (
SELECT *
FROM sys.tables t JOIN sys.schemas s ON (t.schema_id = s.schema_id)
WHERE s.name='Courses' and t.name='CourseActivityViews'
) 
CREATE TABLE [Courses].[CourseActivityViews]
(
	[CompletedActivityID] [int] NOT NULL PRIMARY KEY,
	[CourseID] [int] NOT NULL FOREIGN KEY (CourseID) REFERENCES Courses.Courses(CourseID),
	[EnrollableID] [int] NOT NULL FOREIGN KEY (EnrollableID) REFERENCES Courses.Enrollables(EnrollableID),
	[EnrollmentID] [int] NOT NULL FOREIGN KEY (EnrollmentID) REFERENCES Courses.Enrollments(EnrollmentID),
	[UserID] [int] NOT NULL FOREIGN KEY (UserID) REFERENCES Users.Users(UserID),
	[Identifier] [nvarchar](200) NULL,
	[ModuleActivityTypeID] [int] NULL,
	[ModuleActivityID] [int] NULL,
	[Activity] [nvarchar](400) NULL,
	[Attempt] [tinyint] NULL,
	[timeSpent] [smallint] NULL,
	[ConclusionDate] [datetime] NULL,
	[AuditCreatedDate] [datetime] NULL,
	[AuditLastUpdatedDate] [datetime] NULL,
	[Page] [smallint] NULL,
	[PageSize] [smallint] NULL,
	[MaximumPageSize] [smallint] NULL
); 