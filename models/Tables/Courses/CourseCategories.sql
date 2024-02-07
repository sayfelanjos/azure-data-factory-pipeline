IF NOT EXISTS (
SELECT *
FROM sys.tables t JOIN sys.schemas s ON (t.schema_id = s.schema_id)
WHERE s.name='Courses' and t.name='CourseCategories'
) 
CREATE TABLE [Courses].[CourseCategories]
(
	[CourseCategoryID] [bigint] NULL,
	[CourseID] [bigint] NULL,
	[CategoryID] [bigint] NULL,
	[IsDeleted] [bit] NULL,
	[AuditCreatedDate] [datetime] NOT NULL,
	[AuditLastUpdatedDate] [datetime] NOT NULL,
	[Page] [smallint] NOT NULL,
	[PageSize] [smallint] NOT NULL,
	[MaximumPageSize] [smallint] NOT NULL
); 