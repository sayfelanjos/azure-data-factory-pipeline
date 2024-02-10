IF NOT EXISTS (
SELECT *
FROM sys.tables t JOIN sys.schemas s ON (t.schema_id = s.schema_id)
WHERE s.name='Campaigns' and t.name='CampaignContents'
) 
CREATE TABLE [Campaigns].[CampaignContents]
(
	[CampaignRepositoryContentID] [int] NULL,
	[IsDeleted] [bit] NULL,
	[CampaignContentID] [int] NOT NULL PRIMARY KEY,
	[RepositoryContentName] [nvarchar](200) NULL,
	[Size] [tinyint] NULL,
	[IsTrash] [bit] NULL,
	[FullPath] [nvarchar](4000) NULL,
	[CampaignContentTypeID] [int] NULL,
	[CampaignContentTypeIdentifier] [nvarchar](200) NULL,
	[AuditCreatedDate] [datetime] NULL,
	[AuditLastUpdatedDate] [datetime] NULL,
	[Page] [smallint] NULL,
	[PageSize] [smallint] NULL,
	[MaximumPageSize] [smallint] NULL
); 