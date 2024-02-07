IF NOT EXISTS (
SELECT *
FROM sys.tables t JOIN sys.schemas s ON (t.schema_id = s.schema_id)
WHERE s.name='HtmlPages' and t.name='Htmls'
) 
CREATE TABLE [HtmlPages].[Htmls]
(
	[HTMLPageID] [int] NOT NULL PRIMARY KEY,
	[ModuleActivityTypeID] [int] NOT NULL,
	[Title] [nvarchar](200) NOT NULL,
	[FullPath] [nvarchar](400) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[AuditCreatedDate] [datetime] NOT NULL,
	[AuditLastUpdatedDate] [datetime] NOT NULL,
	[Page] [smallint] NOT NULL,
	[PageSize] [smallint] NOT NULL,
	[MaximumPageSize] [smallint] NOT NULL
); 