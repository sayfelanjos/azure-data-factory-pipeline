IF NOT EXISTS (
SELECT *
FROM sys.tables t JOIN sys.schemas s ON (t.schema_id = s.schema_id)
WHERE s.name='Campaigns' and t.name='CampaignPermissions'
) 
CREATE TABLE [Campaigns].[CampaignPermissions]
(
	[CampaignPermissionID] [int] NOT NULL PRIMARY KEY,
	[IsDeleted] [bit] NULL,
	[CampaignID] [int] NOT NULL FOREIGN KEY (CampaignID) REFERENCES Campaigns.Campaigns(CampaignID),
	[OccupationAreaID] [int] NULL,
	[BusinessUnitID] [int] NULL FOREIGN KEY (BusinessUnitID) REFERENCES Users.BusinessUnits(BusinessUnitID),
	[UserID] [int] NULL FOREIGN KEY (UserID) REFERENCES Users.Users(UserID),
	[Inheritable] [bit] NULL,
	[AuditCreatedDate] [datetime] NULL,
	[AuditLastUpdatedDate] [datetime] NULL,
	[Page] [smallint] NULL,
	[PageSize] [smallint] NULL,
	[MaximumPageSize] [smallint] NULL
); 