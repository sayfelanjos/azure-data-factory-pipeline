IF NOT EXISTS (SELECT 1 FROM sys.schemas WHERE name = 'neolude')
BEGIN
    EXEC('CREATE SCHEMA neolude')
END

SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE TABLE [neolude].[users](
	[id] [bigint] NOT NULL,
	[name] [NVARCHAR](MAX) NOT NULL,
	[username] [NVARCHAR](MAX) NOT NULL,
	[email] [NVARCHAR](MAX) NOT NULL,
	[street] [NVARCHAR](MAX) NULL,
	[suite] [NVARCHAR](MAX) NULL,
	[city] [NVARCHAR](MAX) NULL,
	[zipcode] [NVARCHAR](MAX) NULL,
	[lat] [NVARCHAR](MAX) NULL,
	[lng] [NVARCHAR](MAX) NULL,
	[phone] [NVARCHAR](MAX) NULL,
	[website] [NVARCHAR](MAX) NULL,
	[company_name] [NVARCHAR](MAX) NULL,
	[company_catch_phrase] [NVARCHAR](MAX) NULL,
	[company_bs] [NVARCHAR](MAX) NULL

)