IF NOT EXISTS (
	SELECT * FROM sys.tables t JOIN sys.schemas s ON (t.schema_id = s.schema_id) 
	WHERE s.name='neolude' and t.name='campaignpermissions'
) 
CREATE TABLE [neolude].[campaignpermissions](
	[CampaignPermissionID] [bigint] NULL,
	[IsDeleted] [bit] NULL,
	[CampaignID] [bigint] NULL,
	[OccupationAreaID] [bigint] NULL,
	[BusinessUnitID] [bigint] NULL,
	[UserID] [bigint] NULL,
	[Inheritable] [bit] NULL,
	[AuditCreatedDate] [nvarchar](max) NULL,
	[AuditLastUpdatedDate] [nvarchar](max) NULL,
	[Page] [bigint] NULL,
	[PageSize] [bigint] NULL,
	[MaximumPageSize] [bigint] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY];