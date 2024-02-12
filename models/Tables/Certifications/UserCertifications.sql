IF NOT EXISTS (
SELECT *
FROM sys.tables t JOIN sys.schemas s ON (t.schema_id = s.schema_id)
WHERE s.name='Certifications' and t.name='UserCertifications'
) 
CREATE TABLE [Certifications].[UserCertifications]
(
	[CertificationID] [int] NOT NULL FOREIGN KEY (CertificationID) REFERENCES Certifications.Certifications(CertificationID),
	[UserID] [int] NOT NULL,
	[CourseID] [int] NOT NULL FOREIGN KEY (CourseID) REFERENCES Courses.Courses(CourseID),
	[GrantedDate] [datetime] NULL,
	[ExpirationDate] [datetime] NULL,
	[Status] [nvarchar](20) NULL,
	[AuditCreatedDate] [datetime] NULL,
	[AuditLastUpdatedDate] [datetime] NULL,
	[Page] [smallint] NULL,
	[PageSize] [smallint] NULL,
	[MaximumPageSize] [smallint] NULL
); 
