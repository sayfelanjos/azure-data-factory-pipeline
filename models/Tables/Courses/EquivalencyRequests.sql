IF NOT EXISTS (
SELECT *
FROM sys.tables t JOIN sys.schemas s ON (t.schema_id = s.schema_id)
WHERE s.name='Courses' and t.name='EquivalencyRequests'
) 
CREATE TABLE [Courses].[EquivalencyRequests]
(
	[CourseEquivalencyRequestID] [int] NOT NULL PRIMARY KEY,
	[RequestedCourseID] [int] NOT NULL,
	[EnrollmentID] [int] NOT NULL FOREIGN KEY (EnrollmentID) REFERENCES Courses.Enrollments(EnrollmentID),
	[RequesterUserID] [int] NOT NULL,
	[RequestCreatedDate] [datetime] NOT NULL,
	[Course] [nvarchar](200) NOT NULL,
	[Institution] [nvarchar](200) NOT NULL,
	[Description] [nvarchar](400) NULL,
	[Duration] [smallint] NULL,
	[Notes] [nvarchar](400) NULL,
	[ExpirationDate] [datetime] NOT NULL,
	[ConclusionDate] [datetime] NOT NULL,
	[Status] [bit] NULL,
	[LastActionUserID] [nvarchar](200) NULL,
	[LastActionDate] [datetime] NOT NULL,
	[Feedback] [nvarchar](400) NULL,
	[AuditCreatedDate] [datetime] NOT NULL,
	[AuditLastUpdatedDate] [datetime] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[Page] [smallint] NOT NULL,
	[PageSize] [smallint] NOT NULL,
	[MaximumPageSize] [smallint] NOT NULL
); 