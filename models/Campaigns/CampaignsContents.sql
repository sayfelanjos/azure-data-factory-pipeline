IF NOT EXISTS (
	SELECT * FROM sys.tables t JOIN sys.schemas s ON (t.schema_id = s.schema_id) 
	WHERE s.name='neolude' and t.name='campaigncontents'
) 
CREATE TABLE [neolude].[campaigncontents](
	[CampaignRepositoryContentID] [bigint] NULL,
	[IsDeleted] [bit] NULL,
	[CampaignContentID] [bigint] NULL,
	[RepositoryContentName] [nvarchar](max) NULL,
	[Size] [bigint] NULL,
	[IsTrash] [bit] NULL,
	[FullPath] [nvarchar](max) NULL,
	[CampaignContentTypeID] [bigint] NULL,
	[CampaignContentTypeIdentifier] [nvarchar](max) NULL,
	[AuditCreatedDate] [nvarchar](max) NULL,
	[AuditLastUpdatedDate] [nvarchar](max) NULL,
	[Page] [bigint] NULL,
	[PageSize] [bigint] NULL,
	[MaximumPageSize] [bigint] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY];