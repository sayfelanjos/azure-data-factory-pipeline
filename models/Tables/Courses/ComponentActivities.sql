IF NOT EXISTS (
SELECT *
FROM sys.tables t JOIN sys.schemas s ON (t.schema_id = s.schema_id)
WHERE s.name='Courses' and t.name='ComponentActivities'
) 
CREATE TABLE [Courses].[ComponentActivities]
(
	[ComponentActivityID] [int] NOT NULL PRIMARY KEY,
	[IsDeleted] [bit] NOT NULL,
	[ComponentActivityName] [nvarchar](200) NOT NULL,
	[ComponentActivityOrder] [smallint] NOT NULL,
	[ModuleActivityID] [int] NOT NULL,
	[ModuleActivityTypeID] [int] NOT NULL,
	[ModuleActivityTypeIdentifier] [nvarchar](80) NULL,
	[IsGradable] [bit] NOT NULL,
	[GradeTypeID] [int] NULL,
	[GradeTypeIdentifier] [nvarchar](20) NULL,
	[GradeScale] [smallint] NULL,
	[AccountProgress] [bit] NOT NULL,
	[EvidenceIsMandatory] [bit] NOT NULL,
	[VisibilityID] [int] NOT NULL,
	[VisibilityIdentifier] [nvarchar](20) NULL,
	[VisibilityBeginning] [datetime] NULL,
	[VisibilityEnding] [datetime] NULL,
	[VisibilityHoldDays] [smallint] NULL,
	[VisibilityAvailableDays] [smallint] NULL,
	[ComponentID] [int] NOT NULL,
	[ComponentName] [nvarchar](200) NULL,
	[ComponentOrder] [smallint] NOT NULL,
	[EnrollableID] [int] NOT NULL FOREIGN KEY (EnrollableID) REFERENCES Courses.Enrollables(EnrollableID),
	[CourseID] [int] NOT NULL FOREIGN KEY (CourseID) REFERENCES Courses.Courses(CourseID),
	[AuditCreatedDate] [datetime] NOT NULL,
	[AuditLastUpdatedDate] [datetime] NOT NULL,
	[Page] [smallint] NOT NULL,
	[PageSize] [smallint] NOT NULL,
	[MaximumPageSize] [smallint] NOT NULL
); 