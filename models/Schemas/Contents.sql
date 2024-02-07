IF NOT EXISTS (SELECT 1 FROM sys.schemas WHERE name = 'Contents')
BEGIN
    EXEC('CREATE SCHEMA Contents')
END