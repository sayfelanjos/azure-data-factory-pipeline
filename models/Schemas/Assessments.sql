IF NOT EXISTS (SELECT 1 FROM sys.schemas WHERE name = 'Assessments')
BEGIN
    EXEC('CREATE SCHEMA Assessments')
END