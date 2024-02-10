IF NOT EXISTS (
SELECT *
FROM sys.tables t JOIN sys.schemas s ON (t.schema_id = s.schema_id)
WHERE s.name='Users' and t.name='UserBusinessUnits'
) 
CREATE TABLE [Users].[UserBusinessUnits]
(
	[UserBusinessUnitID] [int] NOT NULL PRIMARY KEY,
	[IsDeleted] [bit] NULL,
	[UserID] [int] NOT NULL FOREIGN KEY (UserID) REFERENCES Users.Users(UserID),
	[BusinessUnitID] [int] NOT NULL FOREIGN KEY (BusinessUnitID) REFERENCES Users.BusinessUnits(BusinessUnitID),
	[OccupationAreaID] [int] NULL,
	[MonitorIndirectSubordinates] [bit] NULL,
	[DirectSuperiorID] [int] NULL,
	[PositionID] [int] NULL,
	[AdmissionDate] [datetime] NULL,
	[DismissalDate] [datetime] NULL,
	[RegistrationNumber] [nvarchar](20) NULL,
	[IsActive] [bit] NULL,
	[StateID] [int] NULL,
	[State_Identifier] [nvarchar](20) NULL,
	[AuditCreatedDate] [datetime] NULL,
	[AuditLastUpdatedDate] [datetime] NULL,
	[Page] [smallint] NULL,
	[PageSize] [smallint] NULL,
	[MaximumPageSize] [smallint] NULL
); 