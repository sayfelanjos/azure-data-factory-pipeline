IF NOT EXISTS (
SELECT *
FROM sys.tables t JOIN sys.schemas s ON (t.schema_id = s.schema_id)
WHERE s.name='Tags' and t.name='EnrollableTags'
) 
CREATE TABLE [Tags].[EnrollableTags]
(
	[TagID] [int] NOT NULL PRIMARY KEY,
	[EnrollableID] [int] NOT NULL FOREIGN KEY (EnrollableID) REFERENCES Courses.Enrollables(EnrollableID),
	[Page] [smallint] NOT NULL,
	[PageSize] [smallint] NOT NULL,
	[MaximumPageSize] [smallint] NOT NULL
);