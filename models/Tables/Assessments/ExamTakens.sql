IF NOT EXISTS (
SELECT *
FROM sys.tables t JOIN sys.schemas s ON (t.schema_id = s.schema_id)
WHERE s.name='Assessments' and t.name='ExamTakens'
) 
CREATE TABLE [Assessments].[ExamTakens]
(
	[ExamTakenID] [int] NOT NULL PRIMARY KEY,
	[IsDeleted] [bit] NULL,
	[ExamID] [int] NULL,
	[EnrollmentID] [int] NULL,
	[UserID] [int] NOT NULL FOREIGN KEY (UserID) REFERENCES Users.Users(UserID),
	[Attempt] [int] NULL,
	[TimeSpent] [int] NULL,
	[NeedsGrading] [bit] NULL,
	[Grade] [decimal] NULL,
	[Finished] [bit] NULL,
	[CompletionDate] [datetimeoffset](7) NULL,
	[Locked] [bit] NULL,
	[CreatedByLock] [bit] NULL,
	[AuditCreatedDate] [datetime] NULL,
	[AuditLastUpdatedDate] [datetime] NULL,
	[Page] [smallint] NULL,
	[PageSize] [smallint] NULL,
	[MaximumPageSize] [smallint] NULL
); 