IF NOT EXISTS (
SELECT *
FROM sys.tables t JOIN sys.schemas s ON (t.schema_id = s.schema_id)
WHERE s.name='Certifications' and t.name='CertificationPermissions'
) 
CREATE TABLE [Certifications].[CertificationPermissions]
(
	[CertificationID] [int]	NOT NULL FOREIGN KEY (CertificationID) REFERENCES Certifications.Certifications(CertificationID),
	[UserID] [int] NOT NULL FOREIGN KEY (UserID) REFERENCES Users.Users(UserID),
	[CourseID] [int] NULL FOREIGN KEY (CourseID) REFERENCES Courses.Courses(CourseID),
	[GranteDate] [datetime] NULL,
	[ExpirationDate] [datetime] NULL,
	[Status] [nvarchar](20) NOT NULL,
	[Page] [smallint] NOT NULL,
	[PageSize] [smallint] NOT NULL,
	[MaximumPageSize] [smallint] NOT NULL
); 