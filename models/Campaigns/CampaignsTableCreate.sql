IF NOT EXISTS (
	SELECT * FROM sys.tables t JOIN sys.schemas s ON (t.schema_id = s.schema_id) 
	WHERE s.name='neolude' and t.name='campaigns'
) 
CREATE TABLE [neolude].[campaigns](
	[CampaignID] [bigint] NULL,
	[IsDeleted] [bit] NULL,
	[CampaignName] [nvarchar](max) NULL,
	[Beginning] [nvarchar](max) NULL,
	[Ending] [nvarchar](max) NULL,
	[IsActive] [bit] NULL,
	[CampaignContentID] [bigint] NULL,
	[ContentName] [nvarchar](max) NULL,
	[ContentTypeID] [bigint] NULL,
	[CampaignContentTypeIdentifier] [nvarchar](max) NULL,
	[AuditCreatedDate] [nvarchar](max) NULL,
	[AuditLastUpdatedDate] [nvarchar](max) NULL,
	[Page] [bigint] NULL,
	[PageSize] [bigint] NULL,
	[MaximumPageSize] [bigint] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY];