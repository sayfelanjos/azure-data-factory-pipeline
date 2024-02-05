IF NOT EXISTS (
	SELECT * FROM sys.tables t JOIN sys.schemas s ON (t.schema_id = s.schema_id) 
	WHERE s.name='neolude' and t.name='placerooms'
) 
CREATE TABLE [neolude].[placerooms](
	[PlaceRoomID] [bigint] NULL,
	[PlaceID] [bigint] NULL,
	[PlaceRoomName] [nvarchar](max) NULL,
	[Capacity] [bigint] NULL,
	[HasAccessibility] [bit] NULL,
	[Observations] [nvarchar](max) NULL,
	[IsDeleted] [bit] NULL,
	[AuditCreatedDate] [nvarchar](max) NULL,
	[AuditLastUpdatedDate] [nvarchar](max) NULL,
	[Page] [bigint] NULL,
	[PageSize] [bigint] NULL,
	[MaximumPageSize] [bigint] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]; 