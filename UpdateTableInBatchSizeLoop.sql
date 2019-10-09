/*
From https://stackoverflow.com/questions/35903375/how-to-update-large-table-with-millions-of-rows-in-sql-server
*/


DECLARE @Rows INT,
        @BatchSize INT; -- keep below 5000 to be safe

SET @BatchSize = 2000;

SET @Rows = @BatchSize; -- initialize just to enter the loop

BEGIN TRY    
  WHILE (@Rows = @BatchSize)
  BEGIN
      UPDATE TOP (@BatchSize) tab
      SET    tab.Value = 'abc1'
      FROM  TableName tab
      WHERE tab.Parameter1 = 'abc'
      AND   tab.Parameter2 = 123
      AND   tab.Value <> 'abc1' COLLATE Latin1_General_100_BIN2;
      -- Use a binary Collation (ending in _BIN2, not _BIN) to make sure
      -- that you don't skip differences that compare the same due to
      -- insensitivity of case, accent, etc, or linguistic equivalence.

      SET @Rows = @@ROWCOUNT;
  END;
END TRY
BEGIN CATCH
  RAISERROR(stuff);
  RETURN;
END CATCH;