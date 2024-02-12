IF NOT EXISTS (
SELECT *
FROM sys.tables t JOIN sys.schemas s ON (t.schema_id = s.schema_id)
WHERE s.name='FilesSend' and t.name='UploadActivities'
) 
CREATE TABLE [FilesSend].[UploadActivities]
(
	[FileAssignmentID] [int] NOT NULL PRIMARY KEY,
	[FileAssignmentUploadActivityID] [int] NULL,
	[ModuleActivityTypeID] [int] NULL,
	[IsDeleted] [bit] NULL,
	[Title] [nvarchar](400) NULL,
	[AuditCreatedDate] [datetime] NULL,
	[AuditLastUpdatedDate] [datetime] NULL,
	[Page] [smallint] NULL,
	[PageSize] [smallint] NULL,
	[MaximumPageSize] [smallint] NULL
); 