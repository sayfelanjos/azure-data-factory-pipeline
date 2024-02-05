IF NOT EXISTS (
	SELECT * FROM sys.tables t JOIN sys.schemas s ON (t.schema_id = s.schema_id) 
	WHERE s.name='neolude' and t.name='certifications'
) 
CREATE TABLE [neolude].[certifications](
	[CertificationID] [bigint] NULL,
	[ClientUniqueIdentifier] [nvarchar](max) NULL,
	[IsDeleted] [bit] NULL,
	[Name] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[ExpirationType] [nvarchar](max) NULL,
	[ExpirationValue] [bigint] NULL,
	[DaysBeforeRenewal] [bigint] NULL,
	[UseCoursePermission] [bit] NULL,
	[AllowCustomExpirationDate] [bit] NULL,
	[CertificationStatusID] [bigint] NULL,
	[CertificationStatusIdentifier] [nvarchar](max) NULL,
	[AuditCreatedDate] [nvarchar](max) NULL,
	[AuditLastUpdatedDate] [nvarchar](max) NULL,
	[Page] [bigint] NULL,
	[PageSize] [bigint] NULL,
	[MaximumPageSize] [bigint] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY];