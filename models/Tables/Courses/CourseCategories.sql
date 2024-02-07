IF NOT EXISTS (
SELECT *
FROM sys.tables t JOIN sys.schemas s ON (t.schema_id = s.schema_id)
WHERE s.name='Courses' and t.name='CourseCategories'
) 
CREATE TABLE [Courses].[CourseCategories]
(
	[CourseCategoryID] [int] NOT NULL PRIMARY KEY,
	[CourseID] [int] NOT NULL FOREIGN KEY (CourseID) REFERENCES Courses.Courses(CourseID),
	[CategoryID] [int] NOT NULL FOREIGN KEY (CategoryID) REFERENCES Categories.Categories(CategoryID),
	[IsDeleted] [bit] NOT NULL,
	[AuditCreatedDate] [datetime] NOT NULL,
	[AuditLastUpdatedDate] [datetime] NOT NULL,
	[Page] [smallint] NOT NULL,
	[PageSize] [smallint] NOT NULL,
	[MaximumPageSize] [smallint] NOT NULL
); 