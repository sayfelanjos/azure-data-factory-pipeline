IF NOT EXISTS (
SELECT *
FROM sys.tables t JOIN sys.schemas s ON (t.schema_id = s.schema_id)
WHERE s.name='Campaigns' and t.name='CampaignPermissions'
) 
CREATE TABLE [Campaigns].[CampaignPermissions]
(
	[CampaignPermissionID] [bigint] NULL,
	[IsDeleted] [bit] NULL,
	[CampaignID] [bigint] NULL,
	[OccupationAreaID] [bigint] NULL,
	[BusinessUnitID] [bigint] NULL,
	[UserID] [bigint] NULL,
	[Inheritable] [bit] NULL,
	[AuditCreatedDate] [datetime] NOT NULL,
	[AuditLastUpdatedDate] [datetime] NOT NULL,
	[Page] [smallint] NOT NULL,
	[PageSize] [smallint] NOT NULL,
	[MaximumPageSize] [smallint] NOT NULL
); 