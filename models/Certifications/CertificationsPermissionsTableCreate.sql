IF NOT EXISTS (
	SELECT * FROM sys.tables t JOIN sys.schemas s ON (t.schema_id = s.schema_id) 
	WHERE s.name='neolude' and t.name='certificationpermissions'
) 
CREATE TABLE [neolude].[certificationpermissions](
	[CertificationID] [bigint] NULL,
	[UserID] [bigint] NULL,
	[CourseID] [bigint] NULL,
	[GranteDate] [nvarchar](max) NULL,
	[ExpirationDate] [nvarchar](max) NULL,
	[Status] [nvarchar](max) NULL,
	[Page] [bigint] NULL,
	[PageSize] [bigint] NULL,
	[MaximumPageSize] [bigint] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY];