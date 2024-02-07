IF NOT EXISTS (
SELECT *
FROM sys.tables t JOIN sys.schemas s ON (t.schema_id = s.schema_id)
WHERE s.name='Campaigns' and t.name='CampaignContents'
) 
CREATE TABLE [Campaigns].[CampaignContents]
(
	[CampaignRepositoryContentID] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[CampaignContentID] [int] NOT NULL PRIMARY KEY,
	[RepositoryContentName] [nvarchar](200) NOT NULL,
	[Size] [tinyint] NULL,
	[IsTrash] [bit] NULL,
	[FullPath] [nvarchar](400) NOT NULL,
	[CampaignContentTypeID] [int] NOT NULL,
	[CampaignContentTypeIdentifier] [nvarchar](80) NOT NULL,
	[AuditCreatedDate] [datetime] NOT NULL,
	[AuditLastUpdatedDate] [datetime] NOT NULL,
	[Page] [smallint] NOT NULL,
	[PageSize] [smallint] NOT NULL,
	[MaximumPageSize] [smallint] NOT NULL
); 