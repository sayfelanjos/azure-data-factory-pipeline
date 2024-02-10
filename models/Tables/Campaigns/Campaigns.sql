IF NOT EXISTS (
SELECT *
FROM sys.tables t JOIN sys.schemas s ON (t.schema_id = s.schema_id)
WHERE s.name='Campaigns' and t.name='Campaigns'
) 
CREATE TABLE [Campaigns].[Campaigns]
(
	[CampaignID] [int] NOT NULL PRIMARY KEY,
	[IsDeleted] [bit] NULL,
	[CampaignName] [nvarchar](400) NULL,
	[Beginning] [datetime] NULL,
	[Ending] [datetime] NULL,
	[IsActive] [bit] NULL,
	[CampaignContentID] [int] NULL FOREIGN KEY (CampaignContentID) REFERENCES Camppaigns.Campaigns(CampaignContentID),
	[ContentName] [nvarchar](400) NULL,
	[ContentTypeID] [int] NULL,
	[CampaignContentTypeIdentifier] [nvarchar](200) NULL,
	[AuditCreatedDate] [datetime] NULL,
	[AuditLastUpdatedDate] [datetime] NULL,
	[Page] [smallint] NULL,
	[PageSize] [smallint] NULL,
	[MaximumPageSize] [smallint] NULL
); 