IF NOT EXISTS (SELECT 1 FROM sys.schemas WHERE name = 'VideoConference')
BEGIN
    EXEC('CREATE SCHEMA VideoConference')
END