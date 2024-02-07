IF NOT EXISTS (SELECT 1 FROM sys.schemas WHERE name = 'HtmlPages')
BEGIN
    EXEC('CREATE SCHEMA HtmlPages')
END