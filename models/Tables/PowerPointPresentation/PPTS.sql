IF NOT EXISTS (
SELECT *
FROM sys.tables t JOIN sys.schemas s ON (t.schema_id = s.schema_id)
WHERE s.name='PowerPointPresentation' and t.name='PPTS'
) 
CREATE TABLE [PowerPointPresentation].[PPTS]
(
	[PresentationID] [int] NOT NULL PRIMARY KEY,
	[PresentationActivityID] [int] NOT NULL,
	[ModuleActivityTypeID] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[Title] [nvarchar](200) NOT NULL,
	[SlideCount] [smallint] NOT NULL,
	[LastUploadedFileInfo] [nvarchar](400) NULL,
	[AuditCreatedDate] [datetime] NOT NULL,
	[AuditLastUpdatedDate] [datetime] NOT NULL,
	[Page] [smallint] NOT NULL,
	[PageSize] [smallint] NOT NULL,
	[MaximumPageSize] [smallint] NOT NULL
); 