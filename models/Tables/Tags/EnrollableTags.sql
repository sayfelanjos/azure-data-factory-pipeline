IF NOT EXISTS (
SELECT *
FROM sys.tables t JOIN sys.schemas s ON (t.schema_id = s.schema_id)
WHERE s.name='Tags' and t.name='EnrollableTags'
) 
CREATE TABLE [Tags].[EnrollableTags]
(
	[TagID] [int] NOT NULL FOREIGN KEY (TagID) REFERENCES Tags.Tags(TagID),
	[EnrollableID] [int] NULL FOREIGN KEY (EnrollableID) REFERENCES Courses.Enrollables(EnrollableID),
	[Page] [smallint] NULL,
	[PageSize] [smallint] NULL,
	[MaximumPageSize] [smallint] NULL
);