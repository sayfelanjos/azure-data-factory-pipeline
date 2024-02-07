IF NOT EXISTS (
SELECT *
FROM sys.tables t JOIN sys.schemas s ON (t.schema_id = s.schema_id)
WHERE s.name='Certifications' and t.name='Certifications'
) 
CREATE TABLE [Certifications].[Certifications]
(
	[CertificationID] [int] NOT NULL PRIMARY KEY,
	[ClientUniqueIdentifier] [nvarchar](40) NULL,
	[IsDeleted] [bit] NOT NULL,
	[Name] [nvarchar](200) NULL,
	[Description] [nvarchar](400) NULL,
	[ExpirationType] [nvarchar](10) NULL,
	[ExpirationValue] [smallint] NULL,
	[DaysBeforeRenewal] [smallint] NULL,
	[UseCoursePermission] [bit] NULL,
	[AllowCustomExpirationDate] [bit] NULL,
	[CertificationStatusID] [int] NULL,
	[CertificationStatusIdentifier] [nvarchar](20) NULL,
	[AuditCreatedDate] [datetime] NOT NULL,
	[AuditLastUpdatedDate] [datetime] NOT NULL,
	[Page] [smallint] NOT NULL,
	[PageSize] [smallint] NOT NULL,
	[MaximumPageSize] [smallint] NOT NULL
); 