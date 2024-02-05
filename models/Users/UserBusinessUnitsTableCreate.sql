IF NOT EXISTS (
	SELECT * FROM sys.tables t JOIN sys.schemas s ON (t.schema_id = s.schema_id) 
	WHERE s.name='neolude' and t.name='userbusinessunits'
) 
CREATE TABLE [neolude].[userbusinessunits](
	[UserBusinessUnitID] [bigint] NULL,
	[IsDeleted] [bit] NULL,
	[UserID] [bigint] NULL,
	[BusinessUnitID] [bigint] NULL,
	[OccupationAreaID] [bigint] NULL,
	[MonitorIndirectSubordinates] [bit] NULL,
	[DirectSuperiorID] [nvarchar](max) NULL,
	[PositionID] [bigint] NULL,
	[AdmissionDate] [nvarchar](max) NULL,
	[DismissalDate] [nvarchar](max) NULL,
	[RegistrationNumber] [nvarchar](max) NULL,
	[IsActive] [bit] NULL,
	[StateID] [bigint] NULL,
	[State_Identifier] [nvarchar](max) NULL,
	[AuditCreatedDate] [nvarchar](max) NULL,
	[AuditLastUpdatedDate] [nvarchar](max) NULL,
	[Page] [bigint] NULL,
	[PageSize] [bigint] NULL,
	[MaximumPageSize] [bigint] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]; 