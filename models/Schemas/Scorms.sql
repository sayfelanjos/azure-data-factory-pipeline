IF NOT EXISTS (SELECT 1 FROM sys.schemas WHERE name = 'Scorms')
BEGIN
    EXEC('CREATE SCHEMA Scorms')
END