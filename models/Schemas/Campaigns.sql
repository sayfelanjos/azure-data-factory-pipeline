IF NOT EXISTS (SELECT 1 FROM sys.schemas WHERE name = 'Campaigns')
BEGIN
    EXEC('CREATE SCHEMA Campaigns')
END