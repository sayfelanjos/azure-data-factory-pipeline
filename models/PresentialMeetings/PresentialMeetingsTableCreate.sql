IF NOT EXISTS (
	SELECT * FROM sys.tables t JOIN sys.schemas s ON (t.schema_id = s.schema_id) 
	WHERE s.name='neolude' and t.name='presentialmeetings'
) 
CREATE TABLE [neolude].[presentialmeetings](
	[PresentialMeetingID] [bigint] NULL,
	[PresentialMeetingActivityID] [bigint] NULL,
	[ModuleActivityTypeID] [bigint] NULL,
	[IsDeleted] [bit] NULL,
	[Name] [nvarchar](max) NULL,
	[Beginning] [nvarchar](max) NULL,
	[Ending] [nvarchar](max) NULL,
	[PlaceID] [bigint] NULL,
	[PlaceName] [nvarchar](max) NULL,
	[PlaceCity] [nvarchar](max) NULL,
	[PlaceState] [nvarchar](max) NULL,
	[PlaceCountry] [nvarchar](max) NULL,
	[PlaceRoomID] [bigint] NULL,
	[PlaceRoom] [nvarchar](max) NULL,
	[PlaceRoomCapacity] [bigint] NULL,
	[PlaceRoomHasAccessibility] [nvarchar](max) NULL,
	[AuditCreatedDate] [nvarchar](max) NULL,
	[AuditLastUpdatedDate] [nvarchar](max) NULL,
	[Page] [bigint] NULL,
	[PageSize] [bigint] NULL,
	[MaximumPageSize] [bigint] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]; 