IF NOT EXISTS (
SELECT *
FROM sys.tables t JOIN sys.schemas s ON (t.schema_id = s.schema_id)
WHERE s.name='Contents' and t.name='VideoViews'
) 
CREATE TABLE [Contents].[VideoViews]
(
    [VideoAccessHistoryID] [int] NOT NULL,
    [IsDeleted] [bit] NOT NULL,
    [UserID] [int] NOT NULL FOREIGN KEY (UserID) REFERENCES Users.Users(UserID),
    [VideoID] [int] NOT NULL FOREIGN KEY (VideoID) REFERENCES Contents.Videos(VideoID),
    [AccessDate] [datetime] NOT NULL,
    [AuditCreatedDate] [datetime] NOT NULL,
    [AuditLastUpdatedDate] [datetime] NOT NULL,
    [Page] [smallint] NOT NULL,
    [PageSize] [smallint] NOT NULL,
    [MaximumPageSize] [smallint] NOT NULL
); 