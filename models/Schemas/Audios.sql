IF NOT EXISTS (SELECT 1 FROM sys.schemas WHERE name = 'Audios')
BEGIN
    EXEC('CREATE SCHEMA Audios')
END