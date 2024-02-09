IF NOT EXISTS (
SELECT *
FROM sys.tables t JOIN sys.schemas s ON (t.schema_id = s.schema_id)
WHERE s.name='Users' and t.name='OccupationAreas'
) 
CREATE TABLE [Users].[OccupationAreas]
(
	[OccupationAreaID] [int] NOT NULL PRIMARY KEY,
	[ClientUniqueIdentifier] [nvarchar](80) NULL,
	[OccupationAreaName] [nvarchar](200) NOT NULL,
	[IsManager] [bit] NOT NULL,
	[OccupationAreaStatusID] [int] NOT NULL,
	[OccupationAreaStatus_Identifier] [nvarchar](20) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[AuditCreatedDate] [datetime] NOT NULL,
	[AuditLastUpdatedDate] [datetime] NOT NULL,
	[Page] [smallint] NOT NULL,
	[PageSize] [smallint] NOT NULL,
	[MaximumPageSize] [smallint] NOT NULL
); 