IF NOT EXISTS (
	SELECT * FROM sys.tables t JOIN sys.schemas s ON (t.schema_id = s.schema_id) 
	WHERE s.name='neolude' and t.name='enrollments'
) 
CREATE TABLE [neolude].[enrollments](
	[EnrollmentID] [bigint] NULL,
	[ClientUniqueIdentifier] [nvarchar](max) NULL,
	[IsDeleted] [bit] NULL,
	[IsBlocked] [bit] NULL,
	[EnrollmentTypeID] [bigint] NULL,
	[EnrollmentType_Identifier] [nvarchar](max) NULL,
	[EnrollableID] [bigint] NULL,
	[UserID] [bigint] NULL,
	[Progress] [float] NULL,
	[AverageGrade] [float] NULL,
	[EnrollmentDate] [nvarchar](max) NULL,
	[LastAccessDate] [nvarchar](max) NULL,
	[ConclusionDate] [nvarchar](max) NULL,
	[CourseUserStatusID] [bigint] NULL,
	[CourseUserStatus_Identifier] [nvarchar](max) NULL,
	[AuditCreatedDate] [nvarchar](max) NULL,
	[AuditLastUpdatedDate] [nvarchar](max) NULL,
	[Page] [bigint] NULL,
	[PageSize] [bigint] NULL,
	[MaximumPageSize] [bigint] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]; 