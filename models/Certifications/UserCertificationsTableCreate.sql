IF NOT EXISTS (
	SELECT * FROM sys.tables t JOIN sys.schemas s ON (t.schema_id = s.schema_id) 
	WHERE s.name='neolude' and t.name='usercertifications'
) 
CREATE TABLE [neolude].[usercertifications](
	[CertificationID] [bigint] NULL,
	[UserID] [bigint] NULL,
	[CourseID] [bigint] NULL,
	[GrantedDate] [nvarchar](max) NULL,
	[ExpirationDate] [nvarchar](max) NULL,
	[Status] [nvarchar](max) NULL,
	[AuditCreatedDate] [nvarchar](max) NULL,
	[AuditLastUpdatedDate] [nvarchar](max) NULL,
	[Page] [bigint] NULL,
	[PageSize] [bigint] NULL,
	[MaximumPageSize] [bigint] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]; 
