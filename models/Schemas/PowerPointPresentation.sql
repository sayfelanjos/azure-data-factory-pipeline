IF NOT EXISTS (SELECT 1 FROM sys.schemas WHERE name = 'PowerPointPresentation')
BEGIN
    EXEC('CREATE SCHEMA PowerPointPresentation')
END