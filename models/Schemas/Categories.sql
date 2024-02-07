IF NOT EXISTS (SELECT 1 FROM sys.schemas WHERE name = 'Categories')
BEGIN
    EXEC('CREATE SCHEMA Categories')
END