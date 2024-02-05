IF NOT EXISTS (
	SELECT * FROM sys.tables t JOIN sys.schemas s ON (t.schema_id = s.schema_id) 
	WHERE s.name='neolude' and t.name='equivalencyrequests'
) 
CREATE TABLE [neolude].[equivalencyrequests](
	[CourseEquivalencyRequestID] [bigint] NULL,
	[RequestedCourseID] [bigint] NULL,
	[EnrollmentID] [bigint] NULL,
	[RequesterUserID] [bigint] NULL,
	[RequestCreatedDate] [nvarchar](max) NULL,
	[Course] [nvarchar](max) NULL,
	[Institution] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[Duration] [bigint] NULL,
	[Notes] [nvarchar](max) NULL,
	[ExpirationDate] [nvarchar](max) NULL,
	[ConclusionDate] [nvarchar](max) NULL,
	[Status] [bigint] NULL,
	[LastActionUserID] [nvarchar](max) NULL,
	[LastActionDate] [nvarchar](max) NULL,
	[Feedback] [nvarchar](max) NULL,
	[AuditCreatedDate] [nvarchar](max) NULL,
	[AuditLastUpdatedDate] [nvarchar](max) NULL,
	[IsDeleted] [bit] NULL,
	[Page] [bigint] NULL,
	[PageSize] [bigint] NULL,
	[MaximumPageSize] [bigint] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]; 