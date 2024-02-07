IF NOT EXISTS (SELECT 1 FROM sys.schemas WHERE name = 'Courses')
BEGIN
    EXEC('CREATE SCHEMA Courses')
END