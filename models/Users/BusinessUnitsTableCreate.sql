IF NOT EXISTS (
	SELECT * FROM sys.tables t JOIN sys.schemas s ON (t.schema_id = s.schema_id) 
	WHERE s.name='neolude' and t.name='businessunits'
) 
CREATE TABLE [neolude].[businessunits](
	[BusinessUnitID] [bigint] NULL,
	[ClientUniqueIdentifier] [nvarchar](max) NULL,
	[BusinessUnitName] [nvarchar](max) NULL,
	[BusinessUnitTypeID] [bigint] NULL,
	[BusinessUnitType_Identifier] [nvarchar](max) NULL,
	[BusinessUnitStatusID] [bigint] NULL,
	[BusinessUnitStatus_Identifier] [nvarchar](max) NULL,
	[ParentBusinessUnitID] [bigint] NULL,
	[IsDeleted] [bit] NULL,
	[AuditCreatedDate] [nvarchar](max) NULL,
	[AuditLastUpdatedDate] [nvarchar](max) NULL,
	[Page] [bigint] NULL,
	[PageSize] [bigint] NULL,
	[MaximumPageSize] [bigint] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY];