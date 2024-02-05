IF NOT EXISTS (
	SELECT * FROM sys.tables t JOIN sys.schemas s ON (t.schema_id = s.schema_id) 
	WHERE s.name='neolude' and t.name='users'
) 
CREATE TABLE [neolude].[users](
	[UserID] [bigint] NULL,
	[ClientUniqueIdentifier] [nvarchar](max) NULL,
	[FirstName] [nvarchar](max) NULL,
	[LastName] [nvarchar](max) NULL,
	[Login] [nvarchar](max) NULL,
	[CPF] [nvarchar](max) NULL,
	[RG] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NULL,
	[BirthDate] [nvarchar](max) NULL,
	[GenderIdentifier] [nvarchar](max) NULL,
	[IsDeleted] [bit] NULL,
	[AuditCreatedDate] [nvarchar](max) NULL,
	[AuditLastUpdatedDate] [nvarchar](max) NULL,
	[LastLogin] [nvarchar](max) NULL,
	[RegisterOriginTypeID] [bigint] NULL,
	[RegisterOriginType_Identifier] [nvarchar](max) NULL,
	[TermsOfUseAcceptance] [bigint] NULL,
	[DefaultPictureURL] [nvarchar](max) NULL,
	[Suspension_IsActive] [bigint] NULL,
	[Suspension_Motive] [nvarchar](max) NULL,
	[Suspension_Feedback] [nvarchar](max) NULL,
	[Suspension_StartDate] [nvarchar](max) NULL,
	[Suspension_ExpirationDate] [nvarchar](max) NULL,
	[Suspension_AuditLastUpdatedDate] [nvarchar](max) NULL,
	[Page] [bigint] NULL,
	[PageSize] [bigint] NULL,
	[MaximumPageSize] [bigint] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]; 