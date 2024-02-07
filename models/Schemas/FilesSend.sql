IF NOT EXISTS (SELECT 1 FROM sys.schemas WHERE name = 'FilesSend')
BEGIN
    EXEC('CREATE SCHEMA FilesSend')
END