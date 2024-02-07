IF NOT EXISTS (
SELECT *
FROM sys.tables t JOIN sys.schemas s ON (t.schema_id = s.schema_id)
WHERE s.name='Assessments' and t.name='ExamTakens'
) 
CREATE TABLE [Assessments].[ExamTakens]
(
	[ExamTakenID] [int] NOT NULL PRIMARY KEY,
	[IsDeleted] [bit] NOT NULL,
	[ExamID] [int] NOT NULL FOREIGN KEY (ExamID) REFERENCES Assessments.Exams(ExamID),
	[EnrollmentID] [int] NOT NULL,
	[UserID] [int] NOT NULL FOREIGN KEY (UserID) REFERENCES Users.Users(UserID),
	[Attempt] [int] NOT NULL,
	[TimeSpent] [int] NOT NULL,
	[NeedsGrading] [bit] NOT NULL,
	[Grade] [decimal] NULL,
	[Finished] [bit] NOT NULL,
	[CompletionDate] [datetimeoffset](7) NULL,
	[Locked] [bit] NOT NULL,
	[CreatedByLock] [bit] NOT NULL,
	[AuditCreatedDate] [datetime] NOT NULL,
	[AuditLastUpdatedDate] [datetime] NOT NULL,
	[Page] [smallint] NOT NULL,
	[PageSize] [smallint] NOT NULL,
	[MaximumPageSize] [smallint] NOT NULL
); 