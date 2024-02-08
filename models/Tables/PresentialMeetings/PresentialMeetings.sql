IF NOT EXISTS (
SELECT *
FROM sys.tables t JOIN sys.schemas s ON (t.schema_id = s.schema_id)
WHERE s.name='PresentialMeetings' and t.name='PresentialMeetings'
) 
CREATE TABLE [PresentialMeetings].[PresentialMeetings]
(
	[PresentialMeetingID] [int] NOT NULL PRIMARY KEY,
	[PresentialMeetingActivityID] [int] NOT NULL,
	[ModuleActivityTypeID] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[Beginning] [datetime] NOT NULL,
	[Ending] [datetime] NOT NULL,
	[PlaceID] [int] NULL,
	[PlaceName] [nvarchar](200) NOT NULL,
	[PlaceCity] [nvarchar](40) NULL,
	[PlaceState] [nvarchar](40) NULL,
	[PlaceCountry] [nvarchar](40) NULL,
	[PlaceRoomID] [int] NULL,
	[PlaceRoom] [nvarchar](200) NULL,
	[PlaceRoomCapacity] [smallint] NULL,
	[PlaceRoomHasAccessibility] [bit] NULL,
	[AuditCreatedDate] [datetime] NOT NULL,
	[AuditLastUpdatedDate] [datetime] NOT NULL,
	[Page] [smallint] NOT NULL,
	[PageSize] [smallint] NOT NULL,
	[MaximumPageSize] [smallint] NOT NULL
); 