IF NOT EXISTS (
	SELECT * FROM sys.tables t JOIN sys.schemas s ON (t.schema_id = s.schema_id) 
	WHERE s.name='Assessments' and t.name='ExamTakens'
) 
CREATE TABLE [Assessments].[ExamTakens](
	[ExamTakenID] [bigint] NULL,
	[IsDeleted] [bit] NULL,
	[ExamID] [bigint] NULL,
	[EnrollmentID] [bigint] NULL,
	[UserID] [bigint] NULL,
	[Attempt] [bigint] NULL,
	[TimeSpent] [bigint] NULL,
	[NeedsGrading] [bit] NULL,
	[Grade] [float] NULL,
	[Finished] [bit] NULL,
	[CompletionDate] [datetimeoffset](7) NULL,
	[Locked] [bit] NULL,
	[CreatedByLock] [bit] NULL,
	[AuditCreatedDate] [nvarchar](max) NULL,
	[AuditLastUpdatedDate] [nvarchar](max) NULL,
	[Page] [bigint] NULL,
	[PageSize] [bigint] NULL,
	[MaximumPageSize] [bigint] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY];