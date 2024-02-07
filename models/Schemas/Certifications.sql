IF NOT EXISTS (SELECT 1 FROM sys.schemas WHERE name = 'Certifications')
BEGIN
    EXEC('CREATE SCHEMA Certifications')
END