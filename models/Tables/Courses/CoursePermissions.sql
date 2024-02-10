IF NOT EXISTS (
SELECT *
FROM sys.tables t JOIN sys.schemas s ON (t.schema_id = s.schema_id)
WHERE s.name='Courses' and t.name='CoursePermissions'
) 
CREATE TABLE [Courses].[CoursePermissions]
(
	[UserID] [int] NULL,
	[CourseID] [int] NOT NULL FOREIGN KEY (CourseID) REFERENCES Courses.Courses(CourseID),
	[CoursePermissionLevelID] [int] NULL,
	[Page] [smallint] NULL,
	[PageSize] [smallint] NULL,
	[MaximumPageSize] [smallint] NULL
);