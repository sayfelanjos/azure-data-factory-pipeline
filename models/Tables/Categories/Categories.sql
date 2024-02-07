IF NOT EXISTS (
SELECT *
FROM sys.tables t JOIN sys.schemas s ON (t.schema_id = s.schema_id)
WHERE s.name='Categories' and t.name='Categories'
) 
CREATE TABLE [Categories].[Categories]
(
	[CategoryID] [bigint] NULL,
	[IsDeleted] [bit] NULL,
	[CategoryName] [nvarchar](max) NULL,
	[CategoryTypeID] [bigint] NULL,
	[CategoryTypeIdentifier] [nvarchar](max) NULL,
	[ParentCategoryID] [bigint] NULL,
	[AuditCreatedDate] [datetime] NOT NULL,
	[AuditLastUpdatedDate] [datetime] NOT NULL,
	[Page] [smallint] NOT NULL,
	[PageSize] [smallint] NOT NULL,
	[MaximumPageSize] [smallint] NOT NULL
); 