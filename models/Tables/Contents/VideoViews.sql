IF NOT EXISTS (
SELECT *
FROM sys.tables t JOIN sys.schemas s ON (t.schema_id = s.schema_id)
WHERE s.name='Contents' and t.name='VideoViews'
) 
CREATE TABLE [Contents].[VideoViews]
(
    [VideoAccessHistoryID] [int] NOT NULL PRIMARY KEY,
    [IsDeleted] [bit] NULL,
    [UserID] [int] NOT NULL FOREIGN KEY (UserID) REFERENCES Users.Users(UserID),
    [VideoID] [int] NULL,
    [AccessDate] [datetime] NULL,
    [AuditCreatedDate] [datetime] NULL,
    [AuditLastUpdatedDate] [datetime] NULL,
    [Page] [smallint] NULL,
    [PageSize] [smallint] NULL,
    [MaximumPageSize] [smallint] NULL
); 