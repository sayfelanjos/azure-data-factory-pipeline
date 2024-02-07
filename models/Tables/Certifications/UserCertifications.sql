IF NOT EXISTS (
SELECT *
FROM sys.tables t JOIN sys.schemas s ON (t.schema_id = s.schema_id)
WHERE s.name='Certifications' and t.name='UserCertifications'
) 
CREATE TABLE [Certifications].[UserCertifications]
(
	[CertificationID] [int] NOT NULL PRIMARY KEY,
	[UserID] [int] NOT NULL FOREIGN KEY (UserID) REFERENCES Users.Users(UserID),
	[CourseID] [int] NOT NULL FOREIGN KEY (CourseID) REFERENCES Courses.Courses(CourseID),
	[GrantedDate] [datetime] NOT NULL,
	[ExpirationDate] [datetime] NULL,
	[Status] [nvarchar](20) NULL,
	[AuditCreatedDate] [datetime] NOT NULL,
	[AuditLastUpdatedDate] [datetime] NOT NULL,
	[Page] [smallint] NOT NULL,
	[PageSize] [smallint] NOT NULL,
	[MaximumPageSize] [smallint] NOT NULL
); 
