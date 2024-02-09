IF NOT EXISTS (
SELECT *
FROM sys.tables t JOIN sys.schemas s ON (t.schema_id = s.schema_id)
WHERE s.name='Users' and t.name='BusinessUnits'
) 
CREATE TABLE [Users].[BusinessUnits]
(
	[BusinessUnitID] [int] NOT NULL PRIMARY KEY,
	[ClientUniqueIdentifier] [nvarchar](200) NULL,
	[BusinessUnitName] [nvarchar](200) NOT NULL,
	[BusinessUnitTypeID] [int] NOT NULL,
	[BusinessUnitType_Identifier] [nvarchar](20) NOT NULL,
	[BusinessUnitStatusID] [int] NOT NULL,
	[BusinessUnitStatus_Identifier] [nvarchar](20) NOT NULL,
	[ParentBusinessUnitID] [int] NULL,
	[IsDeleted] [bit] NOT NULL,
	[AuditCreatedDate] [datetime] NOT NULL,
	[AuditLastUpdatedDate] [datetime] NULL,
	[Page] [smallint] NOT NULL,
	[PageSize] [smallint] NOT NULL,
	[MaximumPageSize] [smallint] NOT NULL
); 