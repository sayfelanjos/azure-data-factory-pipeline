IF NOT EXISTS (
SELECT *
FROM sys.tables t JOIN sys.schemas s ON (t.schema_id = s.schema_id)
WHERE s.name='Users' and t.name='UserAccessHistorys'
) 
CREATE TABLE [Users].[UserAccessHistorys]
(
	[UserID] [int] NOT NULL FOREIGN KEY (UserID) REFERENCES Users.Users(UserID),
	[Device] [nvarchar](40) NULL,
	[AuditCreatedDate] [datetime] NULL,
	[BusinessUnitLinks] [nvarchar](4000) NULL,
	[Identifier] [nvarchar](80) NULL,
	[Page] [smallint] NULL,
	[PageSize] [smallint] NULL,
	[MaximumPageSize] [smallint] NULL
); 