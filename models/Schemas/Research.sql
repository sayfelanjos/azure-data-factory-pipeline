IF NOT EXISTS (SELECT 1 FROM sys.schemas WHERE name = 'Research')
BEGIN
    EXEC('CREATE SCHEMA Research')
END