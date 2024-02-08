IF NOT EXISTS (
SELECT *
FROM sys.tables t JOIN sys.schemas s ON (t.schema_id = s.schema_id)
WHERE s.name='Users' and t.name='Users'
) 
CREATE TABLE [Users].[Users]
(
	[UserID] [int] NOT NULL PRIMARY KEY,
	[ClientUniqueIdentifier] [char](80) NULL,
	[FirstName] [nvarchar](80) NOT NULL,
	[LastName] [nvarchar](80) NULL,
	[Login] [nvarchar](80) NOT NULL,
	[CPF] [nvarchar](20) NULL,
	[RG] [nvarchar](20) NULL,
	[Email] [nvarchar](80) NULL,
	[BirthDate] [date] NULL,
	[GenderIdentifier] [nvarchar](20) NULL,
	[IsDeleted] [bit] NOT NULL,
	[AuditCreatedDate] [datetime] NOT NULL,
	[AuditLastUpdatedDate] [datetime] NOT NULL,
	[LastLogin] [datetime] NULL,
	[RegisterOriginTypeID] [int] NOT NULL,
	[RegisterOriginType_Identifier] [nvarchar](80) NULL,
	[TermsOfUseAcceptance] [smallint] NOT NULL,
	[DefaultPictureURL] [nvarchar](4000) NULL,
	[Suspension_IsActive] [bit] NULL,
	[Suspension_Motive] [nvarchar](4000) NULL,
	[Suspension_Feedback] [nvarchar](4000) NULL,
	[Suspension_StartDate] [datetime] NULL,
	[Suspension_ExpirationDate] [datetime] NULL,
	[Suspension_AuditLastUpdatedDate] [datetime] NULL,
	[Page] [smallint] NOT NULL,
	[PageSize] [smallint] NOT NULL,
	[MaximumPageSize] [smallint] NOT NULL
); 