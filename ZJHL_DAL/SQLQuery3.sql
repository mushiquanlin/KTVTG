
ALTER TABLE dbo.SystemLogs DROP COLUMN ID 


ALTER TABLE dbo.SystemLogs ADD ID BIGINT NOT NULL PRIMARY KEY IDENTITY(1,1)
GO
