DECLARE @constraint sysname
SELECT @constraint = b.name FROM sys.all_columns a 
INNER JOIN
sys.default_constraints b
ON a.default_object_id = b.object_id
WHERE a.object_id = OBJECT_ID('KNIGHTS')
AND a.name = 'ClanPointFund'

IF (@constraint IS NOT NULL)
	EXEC('ALTER TABLE KNIGHTS DROP CONSTRAINT ' + @constraint)
GO
ALTER TABLE KNIGHTS DROP COLUMN ClanPointFund
GO
ALTER TABLE KNIGHTS ADD ClanPointFund int NOT NULL DEFAULT 0
