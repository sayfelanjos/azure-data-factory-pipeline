IF NOT EXISTS (
SELECT *
FROM sys.tables t JOIN sys.schemas s ON (t.schema_id = s.schema_id)
WHERE s.name='Users' and t.name='Labels'
) 
CREATE TABLE [Users].[Labels]
(
	[LabelID] [int] NOT NULL PRIMARY KEY,
	[ClientUniqueIdentifier] [nvarchar](80) NULL,
	[LabelName] [nvarchar](400) NULL,
	[IsDeleted] [bit] NOT NULL,
	[AuditCreatedDate] [datetime] NOT NULL,
	[AuditLastUpdatedDate] [datetime] NOT NULL,
	[Page] [smallint] NOT NULL,
	[PageSize] [smallint] NOT NULL,
	[MaximumPageSize] [smallint] NOT NULL
); 