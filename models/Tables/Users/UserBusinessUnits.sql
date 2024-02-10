IF NOT EXISTS (
SELECT *
FROM sys.tables t JOIN sys.schemas s ON (t.schema_id = s.schema_id)
WHERE s.name='Users' and t.name='UserBusinessUnits'
) 
CREATE TABLE [Users].[UserBusinessUnits]
(
	[UserBusinessUnitID] [int] NOT NULL PRIMARY KEY,
	[IsDeleted] [bit] NOT NULL,
	[UserID] [int] NOT NULL FOREIGN KEY (UserID) REFERENCES Users.Users(UserID),
	[BusinessUnitID] [int] NOT NULL FOREIGN KEY (BusinessUnitID) REFERENCES Users.BusinessUnits(BusinessUnitID),
	[OccupationAreaID] [int] NOT NULL,
	[MonitorIndirectSubordinates] [bit] NULL,
	[DirectSuperiorID] [int] NULL,
	[PositionID] [int] NULL,
	[AdmissionDate] [datetime] NULL,
	[DismissalDate] [datetime] NULL,
	[RegistrationNumber] [nvarchar](20) NULL,
	[IsActive] [bit] NOT NULL,
	[StateID] [int] NOT NULL,
	[State_Identifier] [nvarchar](20) NOT NULL,
	[AuditCreatedDate] [datetime] NOT NULL,
	[AuditLastUpdatedDate] [datetime] NOT NULL,
	[Page] [smallint] NOT NULL,
	[PageSize] [smallint] NOT NULL,
	[MaximumPageSize] [smallint] NOT NULL
); 