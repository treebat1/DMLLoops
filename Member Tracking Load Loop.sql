--I:\DBA\SQL Scripts\ChrisMisc\WhileLoop\Member Tracking Load Loop.sql


USE Report -- DB1



-- FYI check
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
select count(1) 
from cjrMemberTracking
--575502

--check to make sure idid field is in order 1,2,3,4,etc.:

select top 10 * from cjrMemberTracking
       idid   member_id   client_id     item_id last_update_date        RAProduct Page_Url                                                                                                                      Page_Arguments                                                                                                                Page_ID                   session_id                           machine_id                           From_Url                                                                                                                      From_UrlArguments                                                                                                             CBR                       ItemType   To_Url                                                                                                                        To_UrlArguments                                                                                                               session_datetime
----------- ----------- ----------- ----------- ----------------------- --------- ----------------------------------------------------------------------------------------------------------------------------- ----------------------------------------------------------------------------------------------------------------------------- ------------------------- ------------------------------------ ------------------------------------ ----------------------------------------------------------------------------------------------------------------------------- ----------------------------------------------------------------------------------------------------------------------------- ------------------------- ---------- ----------------------------------------------------------------------------------------------------------------------------- ----------------------------------------------------------------------------------------------------------------------------- -----------------------
          1           0           2         322 2010-10-01 00:00:00     RA        cls.realage.com/reg/MyAcnt.aspx                                                                                               cbr=ADISN88&mod=&refpg=                                                                                                       myacnt                    00E2568E-3626-46FE-A948-1546EADCFBFA 4D440B86-73ED-44B4-8140-351AE7F01065                                                                                                                                                                                                                                                             ADISN88                   IT                                                                                                                                                                                                                                                                     2010-10-01 00:00:00.200
          2    33201470           2         322 2010-10-01 00:00:00     RA        cls.realage.com/ralong/qa/ls.aspx                                                                                             fix                                                                                                                           ls                        A92E3A4B-58EB-469B-8D20-37D2D31D0A95 E3EBD3B2-839C-4CD8-9AC5-20ABD5759778 cls.realage.com/ralong/qa/ls.aspx                                                                                             fix                                                                                                                           DARA58                    IT                                                                                                                                                                                                                                                                     2010-10-01 00:00:00.213
          3    33201460           2         322 2010-10-01 00:01:00     RA        cls.realage.com/ralong/qa/pa.aspx                                                                                             fix                                                                                                                           pa                        4931B505-C9AE-4082-963B-7CACEEF6275D 774454B1-139D-4C8B-9AEA-91B6EBEF75EE cls.realage.com/ralong/qa/pa.aspx                                                                                             fix                                                                                                                           ADISN86                   IT                                                                                                                                                                                                                                                                     2010-10-01 00:00:39.650
          4    20822702           2         322 2010-10-01 00:01:00     RA        cls.realage.com/ralong/qa/pa.aspx                                                                                             fix                                                                                                                           pa                        72B5CC12-4C75-47A9-A50E-672AC60E3AF4 2ACE1645-8340-4E80-A635-8585082EAA40 cls.realage.com/ralong/qa/nt.aspx                                                                                             fix                                                                                                                           ADISN82                   IT                                                                                                                                                                                                                                                                     2010-10-01 00:00:40.137
          5    33201491           2         322 2010-10-01 00:01:00     RA        cls.realage.com/ralong/qa/ls.aspx                                                                                             fix                                                                                                                           ls                        31688930-82F7-4344-95F5-90ABA918B275 772EEFA5-B711-49C5-9C2E-E50CAE177222 cls.realage.com/ralong/qa/md.aspx                                                                                             fix                                                                                                                           ADISN148                  IT                                                                                                                                                                                                                                                                     2010-10-01 00:00:42.150
          6    33201500           2         322 2010-10-01 00:01:00     RA        cls.realage.com/ralong/qa/mh.aspx                                                                                             fix                                                                                                                           mh                        637B1F6F-B74E-4777-9099-8A0E34BDD5C5 5E2FAF88-F067-4DD0-8D09-914405D1C149 cls.realage.com/ralong/qa/mh.aspx                                                                                             fix                                                                                                                           CARA30                    IT                                                                                                                                                                                                                                                                     2010-10-01 00:00:42.290
          7    33201481           2         322 2010-10-01 00:01:00     RA        cls.realage.com/ralong/qa/mh.aspx                                                                                             fix                                                                                                                           mh                        B99925C8-B256-4BB3-93A7-2B84DDFBAE3A 86621AED-257E-491A-AA3D-B773E8E99129 cls.realage.com/ralong/qa/mh.aspx                                                                                             fix                                                                                                                           DDCP4645                  IT                                                                                                                                                                                                                                                                     2010-10-01 00:00:43.323
          8           0           2         322 2010-10-01 00:01:00     RA        cls.realage.com/reg/regvar/st1.aspx                                                                                           mod=LONGFORM                                                                                                                  st1                       6CF4BE2E-2DEB-484D-9ADB-6BBF77C85A62 47AE7BE0-ECC8-4A37-8874-092F05C68CEC cls.realage.com/reg/MyAcnt.aspx                                                                                               cbr=ADISN257&mod=&refpg=                                                                                                      ADISN257                  IT                                                                                                                                                                                                                                                                     2010-10-01 00:00:43.493
          9    30243323           2         373 2010-10-01 00:01:00     RA        www.realage.com/                                                                                                              Dest=cholesterol-recs                                                                                                         index                     B12D9914-2630-4414-A417-CA0C36352936 D89B85C2-2DE8-4868-83A8-6AF97C1C7335 www.realage.com/raap/cholesterol-recs                                                                                         recs                                                                                                                                                    IT         www.realage.com/                                                                                                              Dest=cholesterol-recs                                                                                                         2010-10-01 00:00:43.730
         10     5079631           2         373 2010-10-01 00:01:00     RA        www.realage.com/tips/safeguard-your-memory-with-this-snack                                                                    eid=7209&memberid=5079631                                                                                                     safeguard-your-memory-wit 48DF5BB1-7D8A-4CF6-994B-6ABD527A2DB0 3E4B3892-C429-4098-8776-A269B4DE3456 us.mc543.mail.yahoo.com/mc/welcome                                                                                            .gx=1&.tm=1285915364&.rand=dvg82h5mcb2oa                                                                                                                IT         www.realage.com/tips/safeguard-your-memory-with-this-snack                                                                    eid=7209&memberid=5079631                                                                                                     2010-10-01 00:00:44.150


select top 10 *
from production..Member_Tracking_20101001
order by session_datetime asc

  member_id   client_id     item_id last_update_date        RAProduct Page_Url                                                                                                                      Page_Arguments                                                                                                                Page_ID                   session_id                           machine_id                           From_Url                                                                                                                      From_UrlArguments                                                                                                             CBR                       ItemType   To_Url                                                                                                                        To_UrlArguments                                                                                                               session_datetime
----------- ----------- ----------- ----------------------- --------- ----------------------------------------------------------------------------------------------------------------------------- ----------------------------------------------------------------------------------------------------------------------------- ------------------------- ------------------------------------ ------------------------------------ ----------------------------------------------------------------------------------------------------------------------------- ----------------------------------------------------------------------------------------------------------------------------- ------------------------- ---------- ----------------------------------------------------------------------------------------------------------------------------- ----------------------------------------------------------------------------------------------------------------------------- -----------------------
   22415922           2         373 2010-10-01 11:08:00     RA        www.realage.com/tips/the-common-thread-gum-disease-and-heart-disease                                                          eid=7222&memberid=22415922                                                                                                    the-common-thread-gum-dis 3EE0001C-E40B-4C50-995D-3224A1B6FE78 FE446BA1-F3BE-496A-9C1E-69D862C6CF23                                                                                                                                                                                                                                                                                       IT         www.realage.com/tips/the-common-thread-gum-disease-and-heart-disease                                                          eid=7222&memberid=22415922                                                                                                    2010-10-01 11:07:51.720
   26831407           2         373 2010-10-01 11:08:00     RA        www.realage.com/tips/the-common-thread-gum-disease-and-heart-disease                                                          eid=7222&memberid=26831407                                                                                                    the-common-thread-gum-dis D19E0952-1EBA-45EB-A4EC-EAF1EDA1C33D 6A72A8C8-667B-42EB-973F-F7A0DBAFCDE6                                                                                                                                                                                                                                                                                       IT         www.realage.com/tips/the-common-thread-gum-disease-and-heart-disease                                                          eid=7222&memberid=26831407                                                                                                    2010-10-01 11:07:51.753
   27215721           2         373 2010-10-01 11:08:00     RA        www.realage.com/tips/cheese-and-cancer-an-ounce-of-prevention                                                                 eid=7222&memberid=27215721                                                                                                    cheese-and-cancer-an-ounc 27E3F1E8-37DF-44CC-B6FA-1D310B4C342B 3810782D-D199-4CB6-A22B-5E3C7DE7F3E0                                                                                                                                                                                                                                                                                       IT         www.realage.com/tips/cheese-and-cancer-an-ounce-of-prevention                                                                 eid=7222&memberid=27215721                                                                                                    2010-10-01 11:07:51.770
   33203757           2         322 2010-10-01 11:08:00     RA        cls.realage.com/ralong/qa/ss.aspx                                                                                             fix                                                                                                                           ss                        44AF9F2C-00EA-4FAC-B8FE-DE46D6B87315 9F326EDC-AC23-4EA1-B63E-AD1D3BFAFA40 cls.realage.com/ralong/qa/ls.aspx                                                                                             fix                                                                                                                           ASKJ10025                 IT                                                                                                                                                                                                                                                                     2010-10-01 11:07:51.783
   33157987           2         373 2010-10-01 11:08:00     RA        www.realage.com/blogs/doctor-oz-roizen/the-household-staple-that-steadies-blood-sugar                                                                                                                                                                       the-household-staple-that 823F78BD-3D67-4421-9F10-8EC22F442FE1 E8A22248-800E-4E93-9A20-0C0AD134E73B                                                                                                                                                                                                                                                                                       IT         www.realage.com/blogs/doctor-oz-roizen/the-household-staple-that-steadies-blood-sugar                                                                                                                                                                       2010-10-01 11:07:51.847
   30667159           2         136 2010-10-01 11:08:00     RA        cls.realage.com/reg/regassess.aspx                                                                                            mod=MYACNT                                                                                                                    regassess                 6683E07A-2B7E-43F9-AC22-007C4850BDC4 0300AECF-41F2-4F66-9EC1-8B66B9C9E33A cls.realage.com/Reg/MyAcntTC.aspx                                                                                                                                                                                                                                                     IT                                                                                                                                                                                                                                                                     2010-10-01 11:07:52.063
   33147182           2         206 2010-10-01 11:08:00     RA        cls.realage.com/Home_Care/heartburn/qa/questions.asp                                                                          memberId=94998*11925960&cbr=&question=2&direction=next&error=                                                                 questions                 FBDF4194-263B-4A38-AC46-C013956FA875 12C27CA2-8188-49D4-B6A1-00241B4DFBE6 cls.realage.com/Home_Care/heartburn/qa/Questions.asp                                                                          memberid=94998*11925960&cbr=                                                                                                                            IT                                                                                                                                                                                                                                                                     2010-10-01 11:07:52.143
          0           2         322 2010-10-01 11:08:00     RA        cls.realage.com/reg/MyAcnt.aspx                                                                                               cbr=&mod=&refpg=                                                                                                              myacnt                    B7EA9444-CEEA-4E2F-B3A1-61930B5DB6EB 3FEE1A14-3659-4C29-9270-DC6611221CB2                                                                                                                                                                                                                                                                                       IT                                                                                                                                                                                                                                                                     2010-10-01 11:07:52.300
   18991952           2         373 2010-10-01 11:08:00     RA        www.realage.com/tips/cheese-and-cancer-an-ounce-of-prevention                                                                 eid=7222&memberid=18991952                                                                                                    cheese-and-cancer-an-ounc 105A38E3-8355-4A25-B018-49742B16AEE7 F5BB41C6-1AA2-4459-AC78-C834B9288620                                                                                                                                                                                                                                                                                       IT         www.realage.com/tips/cheese-and-cancer-an-ounce-of-prevention                                                                 eid=7222&memberid=18991952                                                                                                    2010-10-01 11:07:52.457
   19747632           2         373 2010-10-01 11:08:00     RA        www.realage.com/blogs/doctor-oz-roizen/pills-that-prevent-memory-loss                                                         eid=7222&memberid=19747632                                                                                                    pills-that-prevent-memory E36FD46E-5FA5-4DD9-BDC9-B99FBFCD09D6 A20FD4E4-2968-4390-B611-7757A4DEAC93 us.mg203.mail.yahoo.com/dc/launch                                                                                             .partner=sbc&.gx=1&.rand=272gfo6r469tq                                                                                                                  IT         www.realage.com/blogs/doctor-oz-roizen/pills-that-prevent-memory-loss                                                         eid=7222&memberid=19747632                                                                                                    2010-10-01 11:07:52.470


select min(session_datetime) 
from production.dbo.Member_Tracking_20101001
--2010-10-01 11:07:51.720

--make sure you update the DESTINATION for the insert!!!


----------------------------------------------------------------------------------------------------
-- Load Loop
----------------------------------------------------------------------------------------------------
set nocount on
Declare @mDate datetime, @mCount  int, @mMaxCount int, @mPerc varchar(7), @mDesc Varchar(100)
Declare @member_id int, @client_id int, @item_id int, @last_update_date smalldatetime, @RAProduct char(2), @Page_Url varchar(125)
Declare @Page_Arguments varchar(125), @Page_ID varchar(25), @session_id uniqueidentifier, @machine_id uniqueidentifier, @From_Url varchar(125)
Declare @From_UrlArguments varchar(125), @CBR varchar(25), @ItemType varchar(10), @To_Url varchar(125), @To_UrlArguments varchar(125)
Declare @session_datetime datetime
set @mDate = getdate()
set @mCount = 1
set @mMaxCount = (select max(idid) from cjrMemberTracking)
--(select max(idid) from cjrMemberTracking)  = 575502
--	select (2520000 *2)

WHILE @mCount <=  @mMaxCount
  begin
	IF @mCount%5000 = 0
	  begin
		Set @mPerc = CONVERT(varchar(7),convert(numeric(6,2),ROUND(((  convert(float,@mCount)  / convert(float,@mMaxCount) ) * 100),2)))
		set @mDesc = 'Records Processed: '+ ltrim(convert(varchar(10),@mCount))
				+ ', Percentage Completed: ' + @mPerc + '%'
		PRINT @mDesc
	  end
	-- Load Fields into Parameters 
	select    @member_id = member_id
			, @client_id = client_id
			, @item_id = item_id
			, @last_update_date = last_update_date
			, @RAProduct = RAProduct
			, @Page_Url = Page_Url
			, @Page_Arguments = Page_Arguments
			, @Page_ID = Page_ID
			, @session_id = session_id
			, @machine_id = machine_id
			, @From_Url = From_Url
			, @From_UrlArguments = From_UrlArguments
			, @CBR = CBR
			, @ItemType = ItemType
			, @To_Url = To_Url
			, @To_UrlArguments = To_UrlArguments
			, @session_datetime = session_datetime
			from cjrMemberTracking
				where idid = @mCount	

	begin tran	-- Insert Date in single Rec Transaction

-------------------------------------------------------------------------
-------------------------------------------------------------------------
--UPDATE THIS DESTINATION TO NEW VALUE!!!
	insert into production..Member_Tracking_20101001
-------------------------------------------------------------------------
-------------------------------------------------------------------------

		(member_id, client_id, item_id, last_update_date, RAProduct, Page_Url, Page_Arguments, Page_ID, session_id, machine_id,
				 From_Url, From_UrlArguments, CBR, ItemType, To_Url, To_UrlArguments, session_datetime)
	values  (@member_id, @client_id, @item_id, @last_update_date, @RAProduct, @Page_Url, @Page_Arguments, @Page_ID, @session_id, @machine_id,
				 @From_Url, @From_UrlArguments, @CBR, @ItemType, @To_Url, @To_UrlArguments, @session_datetime)

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
--


--FYI check:
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
select count(1)
from production..Member_Tracking_20101001
where SESSION_DATETIME < '2010-10-01 11:07:51.720'
--575502


-- Done


