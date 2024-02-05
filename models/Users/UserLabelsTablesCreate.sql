IF NOT EXISTS (
	SELECT * FROM sys.tables t JOIN sys.schemas s ON (t.schema_id = s.schema_id) 
	WHERE s.name='neolude' and t.name='userlabels'
) 
CREATE TABLE [neolude].[userlabels](
	[UserLabelID] [bigint] NULL,
	[ClientUniqueIdentifier] [nvarchar](max) NULL,
	[UserID] [bigint] NULL,
	[LabelID] [bigint] NULL,
	[IsDeleted] [bit] NULL,
	[AuditCreatedDate] [nvarchar](max) NULL,
	[AuditLastUpdatedDate] [nvarchar](max) NULL,
	[Page] [bigint] NULL,
	[PageSize] [bigint] NULL,
	[MaximumPageSize] [bigint] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]; 