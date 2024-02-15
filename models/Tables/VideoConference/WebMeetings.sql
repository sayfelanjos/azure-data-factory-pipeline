IF NOT EXISTS (
SELECT *
FROM sys.tables t JOIN sys.schemas s ON (t.schema_id = s.schema_id)
WHERE s.name='VideoConference' and t.name='WebMeetings'
) 
CREATE TABLE [VideoConference].[WebMeetings]
(
	[WebMeetingID] [int] NOT NULL PRIMARY KEY,
	[WebMeetingActivityID] [int] NULL,
	[ModuleActivityTypeID] [int] NULL,
	[IsDeleted] [bit] NULL,
	[Title] [nvarchar](200) NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[type] [nvarchar](200) NULL,
	[AuditCreatedDate] [datetime] NULL,
	[AuditLastUpdatedDate] [datetime] NULL,
	[Page] [smallint] NULL,
	[PageSize] [smallint] NULL,
	[MaximumPageSize] [smallint] NULL
); 