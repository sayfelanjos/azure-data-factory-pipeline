IF NOT EXISTS (SELECT 1 FROM sys.schemas WHERE name = 'PresentialMeetings')
BEGIN
    EXEC('CREATE SCHEMA PresentialMeetings')
END