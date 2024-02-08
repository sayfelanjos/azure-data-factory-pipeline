IF NOT EXISTS (
SELECT *
FROM sys.tables t JOIN sys.schemas s ON (t.schema_id = s.schema_id)
WHERE s.name='Campaigns' and t.name='CampaignPermissions'
) 
CREATE TABLE [Campaigns].[CampaignPermissions]
(
	[CampaignPermissionID] [int] NOT NULL PRIMARY KEY,
	[IsDeleted] [bit] NOT NULL,
	[CampaignID] [int] NOT NULL FOREIGN KEY (CampaignID) REFERENCES Campaigns.Campaigns(CampaignID),
	[OccupationAreaID] [int] NULL,
	[BusinessUnitID] [int] NOT NULL FOREIGN KEY (BusinessUnitID) REFERENCES Users.BusinessUnits(BusinessUnitID),
	[UserID] [int] NULL FOREIGN KEY (UserID) REFERENCES Users.Users(UserID),
	[Inheritable] [bit] NOT NULL,
	[AuditCreatedDate] [datetime] NOT NULL,
	[AuditLastUpdatedDate] [datetime] NOT NULL,
	[Page] [smallint] NOT NULL,
	[PageSize] [smallint] NOT NULL,
	[MaximumPageSize] [smallint] NOT NULL
); 