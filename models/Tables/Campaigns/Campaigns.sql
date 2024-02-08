IF NOT EXISTS (
SELECT *
FROM sys.tables t JOIN sys.schemas s ON (t.schema_id = s.schema_id)
WHERE s.name='Campaigns' and t.name='Campaigns'
) 
CREATE TABLE [Campaigns].[Campaigns]
(
	[CampaignID] [int] NOT NULL PRIMARY KEY,
	[IsDeleted] [bit] NOT NULL,
	[CampaignName] [nvarchar](200) NOT NULL,
	[Beginning] [datetime] NOT NULL,
	[Ending] [datetime] NULL,
	[IsActive] [bit] NOT NULL,
	[CampaignContentID] [int] NULL FOREIGN KEY (CampaignContentID) REFERENCES Camppaigns.Campaigns(CampaignContentID),
	[ContentName] [nvarchar](200) NULL,
	[ContentTypeID] [int] NULL,
	[CampaignContentTypeIdentifier] [nvarchar](80) NULL,
	[AuditCreatedDate] [datetime] NOT NULL,
	[AuditLastUpdatedDate] [datetime] NOT NULL,
	[Page] [smallint] NOT NULL,
	[PageSize] [smallint] NOT NULL,
	[MaximumPageSize] [smallint] NOT NULL
); 