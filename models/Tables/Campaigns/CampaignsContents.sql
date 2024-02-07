IF NOT EXISTS (
SELECT *
FROM sys.tables t JOIN sys.schemas s ON (t.schema_id = s.schema_id)
WHERE s.name='Campaigns' and t.name='CampaignContents'
) 
CREATE TABLE [Campaigns].[CampaignContents]
(
	[CampaignRepositoryContentID] [bigint] NULL,
	[IsDeleted] [bit] NULL,
	[CampaignContentID] [bigint] NULL,
	[RepositoryContentName] [nvarchar](max) NULL,
	[Size] [bigint] NULL,
	[IsTrash] [bit] NULL,
	[FullPath] [nvarchar](max) NULL,
	[CampaignContentTypeID] [bigint] NULL,
	[CampaignContentTypeIdentifier] [nvarchar](max) NULL,
	[AuditCreatedDate] [datetime] NOT NULL,
	[AuditLastUpdatedDate] [datetime] NOT NULL,
	[Page] [smallint] NOT NULL,
	[PageSize] [smallint] NOT NULL,
	[MaximumPageSize] [smallint] NOT NULL
); 