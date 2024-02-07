IF NOT EXISTS (
SELECT *
FROM sys.tables t JOIN sys.schemas s ON (t.schema_id = s.schema_id)
WHERE s.name='Users' and t.name='Users'
) 
CREATE TABLE [Users].[Users]
(
	[UserID] [int] NOT NULL PRIMARY KEY,
	[ClientUniqueIdentifier] [char](50) NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NULL,
	[Login] [nvarchar](50) NOT NULL,
	[CPF] [nvarchar](11) NULL,
	[RG] [nvarchar](256) NULL,
	[Email] [nvarchar](50) NULL,
	[BirthDate] [date] NULL,
	[GenderIdentifier] [nvarchar](20) NULL,
	[IsDeleted] [bit] NOT NULL,
	[AuditCreatedDate] [datetime] NOT NULL,
	[AuditLastUpdatedDate] [datetime] NOT NULL,
	[LastLogin] [datetime] NULL,
	[RegisterOriginTypeID] [int] NOT NULL,
	[RegisterOriginType_Identifier] [nvarchar](40) NULL,
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