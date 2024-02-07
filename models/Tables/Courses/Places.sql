IF NOT EXISTS (
SELECT *
FROM sys.tables t JOIN sys.schemas s ON (t.schema_id = s.schema_id)
WHERE s.name='Courses' and t.name='Places'
) 
CREATE TABLE [Courses].[Places]
(
	[PlaceID] [int] NOT NULL PRIMARY KEY,
	[PlaceName] [nvarchar](200) NOT NULL,
	[PlaceStatusID] [int] NOT NULL,
	[PlaceStatus_Identifier] [nvarchar](20) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[AuditCreatedDate] [datetime] NOT NULL,
	[AuditLastUpdatedDate] [datetime] NOT NULL,
	[Page] [smallint] NOT NULL,
	[PageSize] [smallint] NOT NULL,
	[MaximumPageSize] [smallint] NOT NULL
); 
