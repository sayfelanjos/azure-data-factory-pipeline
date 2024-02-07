IF NOT EXISTS (
SELECT *
FROM sys.tables t JOIN sys.schemas s ON (t.schema_id = s.schema_id)
WHERE s.name='Categories' and t.name='Categories'
) 
CREATE TABLE [Categories].[Categories]
(
	[CategoryID] [int] NOT NULL PRIMARY KEY,
	[IsDeleted] [bit] NOT NULL,
	[CategoryName] [nvarchar](200) NULL,
	[CategoryTypeID] [int] NOT NULL,
	[CategoryTypeIdentifier] [nvarchar](20) NULL,
	[ParentCategoryID] [int] NULL,
	[AuditCreatedDate] [datetime] NOT NULL,
	[AuditLastUpdatedDate] [datetime] NOT NULL,
	[Page] [smallint] NOT NULL,
	[PageSize] [smallint] NOT NULL,
	[MaximumPageSize] [smallint] NOT NULL
); 