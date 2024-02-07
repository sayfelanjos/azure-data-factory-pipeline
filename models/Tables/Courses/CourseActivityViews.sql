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
	[Identifier] [nvarchar](80) NOT NULL,
	[ModuleActivityTypeID] [int] NOT NULL,
	[ModuleActivityID] [int] NOT NULL,
	[Activity] [nvarchar](200) NOT NULL,
	[Attempt] [tinyint] NOT NULL,
	[timeSpent] [smallint] NOT NULL,
	[ConclusionDate] [datetime] NOT NULL,
	[AuditCreatedDate] [datetime] NOT NULL,
	[AuditLastUpdatedDate] [datetime] NOT NULL,
	[Page] [smallint] NOT NULL,
	[PageSize] [smallint] NOT NULL,
	[MaximumPageSize] [smallint] NOT NULL
); 