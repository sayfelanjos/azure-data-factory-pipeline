IF NOT EXISTS (
SELECT *
FROM sys.tables t JOIN sys.schemas s ON (t.schema_id = s.schema_id)
WHERE s.name='Courses' and t.name='PlaceRooms'
) 
CREATE TABLE [Courses].[PlaceRooms]
(
	[PlaceRoomID] [int] NOT NULL PRIMARY KEY,
	[PlaceID] [int] NOT NULL FOREIGN KEY (PlaceID) REFERENCES Courses.Places(PlaceID),
	[PlaceRoomName] [nvarchar](200) NULL,
	[Capacity] [smallint] NOT NULL,
	[HasAccessibility] [bit] NOT NULL,
	[Observations] [nvarchar](400) NULL,
	[IsDeleted] [bit] NOT NULL,
	[AuditCreatedDate] [datetime] NOT NULL,
	[AuditLastUpdatedDate] [datetime] NOT NULL,
	[Page] [smallint] NOT NULL,
	[PageSize] [smallint] NOT NULL,
	[MaximumPageSize] [smallint] NOT NULL
); 