IF NOT EXISTS (
SELECT *
FROM sys.tables t JOIN sys.schemas s ON (t.schema_id = s.schema_id)
WHERE s.name='Users' and t.name='UserLabels'
) 
CREATE TABLE [Users].[UserLabels]
(
	[UserLabelID] [int] NOT NULL PRIMARY KEY,
	[ClientUniqueIdentifier] [nvarchar](80) NULL,
	[UserID] [int] NOT NULL FOREIGN KEY (UserID) REFERENCES Users.Users(UserID),
	[LabelID] [int] NOT NULL FOREIGN KEY (LabelID) REFERENCES Users.Labels(LabelID),
	[IsDeleted] [bit] NOT NULL,
	[AuditCreatedDate] [datetime] NOT NULL,
	[AuditLastUpdatedDate] [datetime] NOT NULL,
	[Page] [smallint] NOT NULL,
	[PageSize] [smallint] NOT NULL,
	[MaximumPageSize] [smallint] NOT NULL
); 