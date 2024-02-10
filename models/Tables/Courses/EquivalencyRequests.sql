IF NOT EXISTS (
SELECT *
FROM sys.tables t JOIN sys.schemas s ON (t.schema_id = s.schema_id)
WHERE s.name='Courses' and t.name='EquivalencyRequests'
) 
CREATE TABLE [Courses].[EquivalencyRequests]
(
	[CourseEquivalencyRequestID] [int] NOT NULL PRIMARY KEY,
	[RequestedCourseID] [int] NULL,
	[EnrollmentID] [int] NULL FOREIGN KEY (EnrollmentID) REFERENCES Courses.Enrollments(EnrollmentID),
	[RequesterUserID] [int] NULL,
	[RequestCreatedDate] [datetime] NULL,
	[Course] [nvarchar](400) NULL,
	[Institution] [nvarchar](400) NULL,
	[Description] [nvarchar](2000) NULL,
	[Duration] [smallint] NULL,
	[Notes] [nvarchar](2000) NULL,
	[ExpirationDate] [datetime] NULL,
	[ConclusionDate] [datetime] NULL,
	[Status] [bit] NULL,
	[LastActionUserID] [nvarchar](200) NULL,
	[LastActionDate] [datetime] NULL,
	[Feedback] [nvarchar](2000) NULL,
	[AuditCreatedDate] [datetime] NULL,
	[AuditLastUpdatedDate] [datetime] NULL,
	[IsDeleted] [bit] NULL,
	[Page] [smallint] NULL,
	[PageSize] [smallint] NULL,
	[MaximumPageSize] [smallint] NULL
); 