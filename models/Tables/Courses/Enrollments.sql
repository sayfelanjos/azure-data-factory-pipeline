IF NOT EXISTS (
SELECT *
FROM sys.tables t JOIN sys.schemas s ON (t.schema_id = s.schema_id)
WHERE s.name='Courses' and t.name='Enrollments'
) 
CREATE TABLE [Courses].[Enrollments]
(
	[EnrollmentID] [int] NOT NULL PRIMARY KEY,
	[ClientUniqueIdentifier] [nvarchar](80) NULL,
	[IsDeleted] [bit] NULL,
	[IsBlocked] [bit] NULL,
	[EnrollmentTypeID] [int] NOT NULL,
	[EnrollmentType_Identifier] [nvarchar](20) NULL,
	[EnrollableID] [int] NOT NULL FOREIGN KEY (EnrollableID) REFERENCES Courses.Enrollables(EnrollableID),
	[UserID] [int] NOT NULL FOREIGN KEY (UserID) REFERENCES Users.Users(UserID),
	[Progress] [decimal] NULL,
	[AverageGrade] [decimal] NULL,
	[EnrollmentDate] [datetime] NULL,
	[LastAccessDate] [datetime] NULL,
	[ConclusionDate] [datetime] NULL,
	[CourseUserStatusID] [int] NULL,
	[CourseUserStatus_Identifier] [nvarchar](10) NULL,
	[AuditCreatedDate] [datetime] NULL,
	[AuditLastUpdatedDate] [datetime] NULL,
	[Page] [smallint] NULL,
	[PageSize] [smallint] NULL,
	[MaximumPageSize] [smallint] NULL
); 