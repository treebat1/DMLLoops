--Migrate data from old behavior_events table to new behavior_events table


set nocount on

declare @StartDate	datetime
declare @EndDate	datetime
declare @Interval	int
declare @ApplicationID varchar(100)
declare @TargetEvent varchar(100)
declare @RetentionIntervalMonths int
declare @ThresholdDate datetime

set @EndDate = '2011-12-28 13:00:00' 
set	@StartDate = '2011-12-29'
set	@Interval = -5 --seconds
set @ApplicationID = 'ECommerceApp'
set @RetentionIntervalMonths = 15

select @TargetEvent = Value 
from dbo.Application_Settings 
where Keyword = 'Target Event' 
and Application_ID = @ApplicationID
print @TargetEvent

select @ThresholdDate = DATEADD(mm, -1 * ABS(@RetentionIntervalMonths),GETDATE())

if @StartDate <= @ThresholdDate
begin
	while @StartDate > @EndDate
	begin
		insert into dbo.Behavior_Events 
			(Application_ID, Session_ID, Subject_ID, Object_ID, Event, Duration, Timestamp, Segment)
		select Application_ID, Session_ID, Subject_ID, Object_ID, Event, Duration, Timestamp, Segment
		from dbo.Behavior_Events_Old as BE with (nolock, forceseek)
		where timestamp > dateadd(second, @Interval, @StartDate) 
		and timestamp <= @StartDate
		and Application_ID = @ApplicationID
		and Event = @TargetEvent

		delete dbo.Behavior_Events_Old
		where timestamp > dateadd(second, @Interval, @StartDate) 
		and timestamp <= @StartDate
		and Application_ID = @ApplicationID
		and Event = @TargetEvent

		select @StartDate = dateadd(second, @Interval, @StartDate)
	end
end
else
begin
	while @StartDate > @EndDate
	begin
		insert into dbo.Behavior_Events 
			(Application_ID, Session_ID, Subject_ID, Object_ID, Event, Duration, Timestamp, Segment)
		select Application_ID, Session_ID, Subject_ID, Object_ID, Event, Duration, Timestamp, Segment
		from dbo.Behavior_Events_Old as BE with (nolock, forceseek)
		where timestamp > dateadd(second, @Interval, @StartDate) 
		and timestamp <= @StartDate
		and Application_ID = @ApplicationID

		delete dbo.Behavior_Events_Old
		where timestamp > dateadd(second, @Interval, @StartDate) 
		and timestamp <= @StartDate
		and Application_ID = @ApplicationID

		select @StartDate = dateadd(second, @Interval, @StartDate)
	end
end

set nocount off











