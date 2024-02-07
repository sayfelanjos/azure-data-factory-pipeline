IF NOT EXISTS (
SELECT *
FROM sys.tables t JOIN sys.schemas s ON (t.schema_id = s.schema_id)
WHERE s.name='VideoConference' and t.name='WebMeetings'
) 
CREATE TABLE [VideoConference].[WebMeetings]
(
	[WebMeetingID] [int] NOT NULL,
	[WebMeetingActivityID] [int] NOT NULL,
	[ModuleActivityTypeID] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[Title] [nvarchar](200) NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NOT NULL,
	[type] [nvarchar](40) NOT NULL,
	[AuditCreatedDate] [datetime] NOT NULL,
	[AuditLastUpdatedDate] [datetime] NOT NULL,
	[Page] [smallint] NOT NULL,
	[PageSize] [smallint] NOT NULL,
	[MaximumPageSize] [smallint] NOT NULL
); 