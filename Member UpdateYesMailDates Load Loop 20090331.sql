--\Member Update LoadLoop


USE Report -- DB1
IF exists (select 1 from report..sysobjects where name = 'msgUpdateMembers' and type = 'U')
  begin
	drop table msgUpdateMembers
  end

Create table msgUpdateMembers
(idid int not null identity(1,1) constraint PK_msgUpdateMemberss Primary Key
,member_id int null)


-- Load your data now
truncate table msgUpdateMembers

set rowcount 0
insert into msgUpdateMembers (member_id) --
select member_id 
from production.dbo.member
where yesmail_date between '03/27/2009 06:30:00' and '03/28/2009 06:38:53'
--21769

select *
into report.dbo.cjrUpdateMembersYesMailDate20090330
from report.dbo.msgUpdateMembers
--21769


-- FYI check
select count(1) MbrCount
from msgUpdateMembers
MbrCount
-----------
21769



--check to make sure idid field is in order 1,2,3,4,etc.:
select top 5 * from msgUpdateMembers
idid        member_id
----------- -----------
1           28345780
2           27605220
3           28346248
4           27882477
5           28322767



----------------------------------------------------------------------------------------------------
-- Load Loop
----------------------------------------------------------------------------------------------------
set nocount on
Declare @mDate datetime, @mCount  int, @mMaxCount int, @mPerc varchar(7), @mDesc Varchar(100), @mMemberID int, @mProductID int
set @mDate = getdate()
set @mCount = 1
set @mMaxCount = (select max(idid) from msgUpdateMembers)

WHILE @mCount <= @mMaxCount
  begin
	IF @mCount%1000 = 0
	  begin
		Set @mPerc = CONVERT(varchar(7),convert(numeric(6,2),ROUND(((  convert(float,@mCount)  / convert(float,@mMaxCount) ) * 100),2)))
		set @mDesc = 'Records Processed: '+ ltrim(convert(varchar(10),@mCount))
				+ ', Percentage Completed: ' + @mPerc + '%'
		PRINT @mDesc
	  end
	-- Load Memberid and Product 
	select @mMemberID = member_id from msgUpdateMembers l
				where idid = @mCount	

	begin tran	-- Insert Date in single Rec Transaction
	update production.dbo.member
		set	Yesmail_date = getdate()
		where member_id = @mMemberID

	IF @@ERROR = 0		-- Proper Record Handling
	  begin
		commit		-- Save Data
	  end
	ELSE
	  begin
		rollback	-- Error, DOn't save Data
	  end
	
	set @mCount = @mCount + 1		-- Increment Counter
	
  end		-- End of While Loop
set nocount off
----------------------------------------------------------------------------------------------------
-- End of Load Loop
----------------------------------------------------------------------------------------------------

----Update statistics after significant amount in load loop to improve performance  --added by cjr(it) 5/9/08
--use production
--
--update statistics member


--FYI check:

use report

set transaction isolation level read uncommitted

select count(distinct member_id) MbrCount
from production..member m
		where exists (select 1 from report.dbo.msgUpdateMembers u where m.member_id = u.member_id)
--21769


--clean up
drop table report.dbo.msgUpdateMembers

-- Done

--Reporting for Diane

select m.daily_tip, m.weekly_tip, m.product_notification, count(1) MbrCount
from production..member m
where exists (select 1 from report.dbo.cjrUpdateMembersYesMailDate20090330 u where m.member_id = u.member_id)
group by m.daily_tip, m.weekly_tip, m.product_notification
order by count(1) desc

daily_tip weekly_tip product_notification MbrCount
--------- ---------- -------------------- -----------
1         0          1                    13740
0         0          0                    7623
0         1          0                    133
1         NULL       1                    118
0         NULL       0                    45
1         1          1                    33
1         0          0                    30
0         1          1                    29
0         0          1                    9
0         NULL       1                    7
1         NULL       0                    2





