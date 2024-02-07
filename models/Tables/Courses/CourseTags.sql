IF NOT EXISTS (
SELECT *
FROM sys.tables t JOIN sys.schemas s ON (t.schema_id = s.schema_id)
WHERE s.name='Courses' and t.name='CourseTags'
) 
CREATE TABLE [Courses].[CourseTags]
(
	[TagID] [int] NOT NULL PRIMARY KEY,
	[CourseID] [int] NOT NULL FOREIGN KEY (CourseID) REFERENCES Courses.Courses(CourseID),
	[Page] [smallint] NOT NULL,
	[PageSize] [smallint] NOT NULL,
	[MaximumPageSize] [smallint] NOT NULL
);