* Encoding: UTF-8.
* Encoding: .
GET 
   FILE="\\140.109.171.240\worker\worker_sec\面訪協辦計畫\F202603傳播調查資料庫第四期第一次正式調查\10資料檔及不符合品\02修改後\0616\data_a.sav".
EXECUTE.

**產生檢核及不合品所需變項-前置作業***************************************************************************************.
*定義每週檢核時間範圍日期.
 * compute tstartdate=2024061200000.
 * compute tenddate=202310051330.

*1.產生檢核日期.
string mon (a3)  today (a8).
compute mon=char.substr($date,4,3).
recode mon ('JAN'="01")('FEB'="02")('MAR'="03")('APR'="04")('MAY'="05")('JUN'="06")
('JUL'="07") ('AUG'="08")('SEP'="09")('OCT'="10")('NOV'="11")('DEC'="12") into mon.
compute today=concat("20",char.substr($date,8,2),char.substr(mon,1,2),char.substr($date,1,2)).
alter type today (f8.0).
fre today.

*2.利用資料檔(問卷/訪問紀錄)結束時間產生日期變項.
compute csdate=trunc(starttime/1000000).
compute cedate=trunc(endtime/1000000).
compute zsdate=trunc(zstarttime/1000000).
compute zedate=trunc(zendtime/1000000).
compute HCEND=trunc(vCK01/1000000).
compute HEND=trunc(vCKEND/1000000).
compute QEND=trunc(vvckend/1000000).
compute ZEND=trunc(vEND/1000000).
format csdate cedate zsdate zedate  HCEND HEND QEND ZEND(f8.0).
fre csdate cedate .

*format hsdate hedate csdate cedate zsdate zedate HCEND HEND QEND ZEND(f8.0).
*fre csdate cedate .

RENAME VARIABLES week=週次.
alter type vvckend vEND (a14).
alter type vCK01 vCKEND vvckend vEND (a14).

*拆時間.戶抽訪問紀錄開始.
do if vCK01~="".
compute hcy=number(char.substr(vCK01,1,4),f4).
compute hcm=number(char.substr(vCK01,5,2),f2).
compute hcd=number(char.substr(vCK01,7,2),f2).
compute hch=number(char.substr(vCK01,9,2),f2).
compute hcmin=number(char.substr(vCK01,11,2),f2).
compute hcs=number(char.substr(vCK01,13,2),f2).
end if.
EXECUTE.

*拆時間.戶抽訪問紀錄結束.
do if vCKEND~="".
compute hy=number(char.substr(vCKEND,1,4),f4).
compute hm=number(char.substr(vCKEND,5,2),f2).
compute hd=number(char.substr(vCKEND,7,2),f2).
compute hh=number(char.substr(vCKEND,9,2),f2).
compute hmin=number(char.substr(vCKEND,11,2),f2).
compute hs=number(char.substr(vCKEND,13,2),f2).
end if.
EXECUTE.

*拆時間.問卷結束.
do if vvckend~="".
compute qy=number(char.substr(vvckend,1,4),f4).
compute qm=number(char.substr(vvckend,5,2),f2).
compute qd=number(char.substr(vvckend,7,2),f2).
compute qh=number(char.substr(vvckend,9,2),f2).
compute qmin=number(char.substr(vvckend,11,2),f2).
compute qs=number(char.substr(vvckend,13,2),f2).
end if.
EXECUTE.


*拆時間.訪問紀錄結束.
do if vEND~="".
compute zy=number(char.substr(vEND,1,4),f4).
compute zm=number(char.substr(vEND,5,2),f2).
compute zd=number(char.substr(vEND,7,2),f2).
compute zh=number(char.substr(vEND,9,2),f2).
compute zmin=number(char.substr(vEND,11,2),f2).
compute zs=number(char.substr(vEND,13,2),f2).
end if.
EXECUTE.

alter type vCK01 vCKEND vvckend vEND  (f14).

*建立m p 變項放置不符合品中文說明.
string m1 to m20 p1 to p20  (a500).
NUMERIC s1 to s20 (f2.0).

STRING 檢核類型  處理順序  提示卡(A150).

COMPUTE 檢核類型="問卷檢核".

do if vZB5_2=1.
compute 提示卡="有".
else if vZB5_2=2.
compute 提示卡="沒有".
end if.

COMPUTE no=RTRIM(LTRIM(no)).
COMPUTE zno=RTRIM(LTRIM(zno)).
EXECUTE.

SAVE OUTFILE="\\140.109.171.240\worker\worker_sec\面訪協辦計畫\F202603傳播調查資料庫第四期第一次正式調查\10資料檔及不符合品\05檢核程式\問卷檢核程式\歷程\問卷檢核整理a.sav".
exec.

***********************************************************************************************************************.
 * GET 
   FILE="\\140.109.171.240\worker\worker_sec\面訪協辦計畫\F202603傳播調查資料庫第四期第一次正式調查\10資料檔及不符合品\05檢核程式\問卷檢核程式\歷程\問卷檢核整理a.sav".
 * EXECUTE.

***********************************************************************************************************************.
*開始進入基本檢核項目 m1-m20.
ALTER TYPE id(a20).

*0.樣本編號檢核.                                 
* 識別重複觀察值.
SORT CASES BY id(A).
MATCH FILES
  /FILE=*
  /BY id
  /FIRST=PrimaryFirstid
  /LAST=PrimaryLast.
DO IF (PrimaryFirstid).
COMPUTE  MatchSequenceid=1-PrimaryLast.
ELSE.
COMPUTE  MatchSequenceid=MatchSequenceid+1.
END IF.
LEAVE  MatchSequenceid.
FORMATS  MatchSequenceid (f7).
COMPUTE  InDupGrp=MatchSequenceid>0.
SORT CASES InDupGrp(D).
MATCH FILES
  /FILE=*
  /DROP=PrimaryLast InDupGrp.
VARIABLE LABELS  PrimaryFirstid '將所有第一個相符觀察值標為「主要」指標' MatchSequenceid '相符觀察值的循序計數'.
VALUE LABELS  PrimaryFirstid 0 '重複觀察值' 1 '主要觀察值'.
VARIABLE LEVEL  PrimaryFirstid (ORDINAL) /MatchSequenceid (SCALE).
FREQUENCIES VARIABLES=PrimaryFirstid MatchSequenceid.
EXECUTE.

do if MatchSequenceid>0 | id="" .    
  compute m1=concat("id=",id).                     
  compute p1="0.id為重複樣本/漏答，請確認".  
  compute s1=1.                
end if.                                                         


*問卷.
alter type vCK01 vCKEND vvckend vEND (f14).

*問4-問卷開始時間【starttime】晚於問卷結束(提交)時間【endtime】.
do if (starttime>endtime) .
compute m2=concat("問卷開始時間starttime =",string(starttime,n14),",問卷結束(提交)時間endtime =",string(endtime,n14)).
compute p2="問4.問卷開始時間【starttime】晚於問卷結束(提交)時間【endtime】".
compute s2=1. 
end if.

*問5-問卷結束(提交)時間【endtime】晚於訪問紀錄結束(提交)時間【zendtime】.
do if endtime>zendtime & not sys(endtime) & not sys(zendtime).
compute m3=concat("問卷結束(提交)時間endtime=",string(endtime,n14),",訪問紀錄結束(提交)時間zendtime=",string(zendtime,n14)).
compute p3="問5.問卷結束(提交)時間【endtime】晚於訪問紀錄結束(提交)時間【zendtime】".
compute s3=1. 
end if.


*問6-問卷結束(提交)時間【endtime】與訪問紀錄結束(提交)時間【zendtime】相差24小時以上.
compute q1submit=date.mdy(qm,qd,qy)+time.hms(qh,qmin,qs).
formats q1submit(YMDHMS21).
fre q1submit.

compute q2submit=date.mdy(zm,zd,zy)+time.hms(zh,zmin,zs).
formats q2submit(YMDHMS21).
fre q2submit.

*計算時間差.
do if q2submit>=q1submit.
compute hdiff1=datediff(q2submit,q1submit,"hours").
else if q2submit<q1submit.
compute hdiff1=datediff(q1submit,q2submit,"hours").
end if.
fre hdiff1.


****周次每周改當週****.
 * do if hdiff1>24 & 週次=1.
do if hdiff1>24 .
compute m4=concat("問卷結束(提交)時間endtime=",string(endtime,n14),",訪問紀錄結束(提交)時間zendtime=",string(zendtime,n14)).
compute p4="問6.問卷結束(提交)時間【endtime】與訪問紀錄結束(提交)時間【zendtime】相差24小時以上".
compute s4=1. 
end if.


*問7.問卷已提交，但戶抽訪問紀錄未提交(含未填寫).
 * do if success_q=1 & success_h=0.
 * compute m5=concat("問卷提交時間=",string(vvckend,n14),",訪問紀錄提交時間=",string(vEND,n14),",戶抽紀錄提交時間=",string(vCKEND,n14)).
 * compute p5="問7.問卷已提交，但戶抽訪問紀錄未提交(含未填寫)".
 * compute s5=1. 
 * end if.


*問8.問卷已提交，但訪問紀錄未提交(含未填寫).
do if (not sys(vvckend) & sys(vEND)) | (success_q=1 & success_z=0) .
compute m6= concat("問卷提交時間=",string(vvckend,n14),",訪問紀錄提交時間=",string(vEND,n14)).
compute p6="問8.問卷已提交，但訪問紀錄未提交(含未填寫)".
compute s6=1. 
end if.


*問17.問卷與訪問紀錄訪員編號不一致.
compute zno=RTRIM(LTRIM(zno)).

do if zno~=no &  (success_q=1 & success_z=1) .
compute m7= concat("no=",char.substr(no,1,150),",zno=",char.substr(zno,1,150)).
compute p7="問17.問卷與訪問紀錄訪員編號不一致".
compute s7=1. 
end if.


*問18.訪問紀錄訪員編號缺漏.
do if zno="" & vZX~="".
compute m8= concat("zno=",char.substr(zno,1,150)).
compute p8="問18.訪問紀錄訪員編號缺漏".
compute s8=1. 
end if.

*問卷訪問紀錄.

*訪3.訪問紀錄開始時間晚於訪問紀錄結束時間【zendtime】.
do if (zstarttime>zendtime) .
compute m9=concat("訪問紀錄開始時間zstarttime =",string(zstarttime,n14),",訪問紀錄結束(提交)時間zendtime =",string(zendtime,n14)).
compute p9="訪3.訪問紀錄開始時間晚於訪問紀錄結束時間【zendtime】".
compute s9=1. 
end if.
EXECUTE.


SAVE OUTFILE="\\140.109.171.240\worker\worker_sec\面訪協辦計畫\F202603傳播調查資料庫第四期第一次正式調查\10資料檔及不符合品\05檢核程式\問卷檢核程式\歷程\問卷檢核結果-基本檢核ac.sav".
exec.


***********************************************************************************************************************.
 * GET 
   FILE="\\140.109.171.240\worker\worker_sec\面訪協辦計畫\F202603傳播調查資料庫第四期第一次正式調查\10資料檔及不符合品\05檢核程式\問卷檢核程式\歷程\問卷檢核結果-基本檢核ac.sav".
 * EXECUTE.

*產出不符合品資料檔.
*****資料轉置.
sort cases by lno id .


VARSTOCASES  
 /MAKE 錯誤說明 from p1 to p20
 /MAKE 錯誤狀況 from m1 to m20
 /MAKE 使用對象 from s1 to s20
 /KEEP =today id fno lno last note_i note_s  vZX 訪員訪期 週次 檢核類型  處理順序 提示卡
 /null = drop                                                                         
 /count = count.  

COMPUTE 處理順序="基本項目".
ALTER TYPE  錯誤說明 錯誤狀況(a1200).
EXECUTE.

***********************************************************************************************************************.
SAVE OUTFILE="\\140.109.171.240\worker\worker_sec\面訪協辦計畫\F202603傳播調查資料庫第四期第一次正式調查\10資料檔及不符合品\05檢核程式\問卷檢核程式\歷程\問卷檢核結果-基本檢核_acf.sav".
exec.
***********************************************************************************************************************.


*進入成功檔問卷邏輯檢核.
get  file="\\140.109.171.240\worker\worker_sec\面訪協辦計畫\F202603傳播調查資料庫第四期第一次正式調查\10資料檔及不符合品\02修改後\0616\data_s.sav".
exec.


*1.產生檢核日期.
string mon (a3)  today (a8).
compute mon=char.substr($date,4,3).
recode mon ('JAN'="01")('FEB'="02")('MAR'="03")('APR'="04")('MAY'="05")('JUN'="06")
('JUL'="07") ('AUG'="08")('SEP'="09")('OCT'="10")('NOV'="11")('DEC'="12") into mon.
compute today=concat("20",char.substr($date,8,2),char.substr(mon,1,2),char.substr($date,1,2)).
alter type today (f8.0).
fre today.

STRING  提示卡(A150) .
RENAME VARIABLES week=週次.
do if vZB5_2=1.
compute 提示卡="有".
else if vZB5_2=2.
compute 提示卡="沒有".
end if.
EXECUTE.


*執行96程式產生新變項，將有選跳答碼的資料過錄為1，方便檢核程式邏輯撰寫.
 INSERT FILE="\\140.109.171.240\worker\worker_sec\面訪協辦計畫\F202603傳播調查資料庫第四期第一次正式調查\10資料檔及不符合品\05檢核程式\問卷檢核程式\01-96_新抽.sps"
  SYNTAX=INTERACTIVE ERROR=STOP CD=YES ENCODING='UTF8'.
exec.

save  outfile="\\140.109.171.240\worker\worker_sec\面訪協辦計畫\F202603傳播調查資料庫第四期第一次正式調查\10資料檔及不符合品\05檢核程式\問卷檢核程式\歷程\問卷as.sav".
EXECUTE.

*先執行01-1電話檢核.sps（項目6-7電話重複性檢核）.
INSERT FILE="\\140.109.171.240\worker\worker_sec\面訪協辦計畫\F202603傳播調查資料庫第四期第一次正式調查\10資料檔及不符合品\05檢核程式\問卷檢核程式\01-1 電話重複性檢核(會自動執行).sps"
  SYNTAX=INTERACTIVE ERROR=STOP CD=YES ENCODING='UTF8'.
exec.

*讀取網域清單整理程式，產生最新網域清單資料檔.
INSERT FILE='\\140.109.171.240\samplingweighting\00-1母體資料\14.網域清單\讀取網域清單.sps'
  SYNTAX=INTERACTIVE ERROR=STOP CD=YES ENCODING='UTF8'.
exec.

INSERT FILE="\\140.109.171.240\worker\worker_sec\面訪協辦計畫\F202603傳播調查資料庫第四期第一次正式調查\10資料檔及不符合品\05檢核程式\問卷檢核程式\01-2 email檢核.sps"
  SYNTAX=INTERACTIVE ERROR=STOP CD=YES ENCODING='UTF8'.
exec.

get  file="\\140.109.171.240\worker\worker_sec\面訪協辦計畫\F202603傳播調查資料庫第四期第一次正式調查\10資料檔及不符合品\05檢核程式\問卷檢核程式\歷程\問卷as.sav".
exec.

*建立放置錯誤說明變項.
string m101 to m2200(a1200) .
string p101 to p2200(a1200) .
NUMERIC s101 to s2200 (f2.0).
exec.


save outfile="\\140.109.171.240\worker\worker_sec\面訪協辦計畫\F202603傳播調查資料庫第四期第一次正式調查\10資料檔及不符合品\05檢核程式\問卷檢核程式\歷程\問卷as.sav".
EXECUTE.
*問卷檢核****************************************************.

*vZA=1,3   .
do if not range(vZA,1,3) | sys(vZA).
compute m101=concat("vZA=",string(vZA,f2)).
compute p101="vZA為不合理值或遺漏值".
Compute s101=2.
end if.
Exec.


*vZA0=1,2   .
do if not range(vZA0,1,2) | sys(vZA0).
compute m102=concat("vZA0=",string(vZA0,f2)).
compute p102="vZA0為不合理值或遺漏值".
Compute s102=2.
end if.
Exec.


*vZA0_1=1,2   .
do if not range(vZA0_1,1,2) | sys(vZA0_1).
compute m103=concat("vZA0_1=",string(vZA0_1,f2)).
compute p103="vZA0_1為不合理值或遺漏值".
Compute s103=2.
end if.
Exec.


*vSF0=1   .
do if not range(vSF0,1,1) | sys(vSF0).
compute m104=concat("vSF0=",string(vSF0,f2)).
compute p104="vSF0為不合理值或遺漏值".
Compute s104=2.
end if.
Exec.


*vA1=1,96 997,998  .
do if not range(vA1,1,96,997,998) | sys(vA1).
compute m105=concat("vA1=",string(vA1,f4)).
compute p105="vA1為不合理值或遺漏值".
Compute s105=2.
end if.
Exec.


*vA2=1,12 96,98  .
do if not range(vA2,1,12,96,98) | sys(vA2).
compute m106=concat("vA2=",string(vA2,f2)).
compute p106="vA2為不合理值或遺漏值".
Compute s106=2.
end if.
Exec.


*vA3=1,22 88 97,98 .
do if not range(vA3,1,22,88,88,97,98) | sys(vA3).
compute m107=concat("vA3=",string(vA3,f2)).
compute p107="vA3為不合理值或遺漏值".
Compute s107=2.
end if.
Exec.


*vA4=1,2 97,98  .
do if not range(vA4,1,2,97,98) | sys(vA4).
compute m108=concat("vA4=",string(vA4,f2)).
compute p108="vA4為不合理值或遺漏值".
Compute s108=2.
end if.
Exec.


*vA5city=1,29 96,98  .
do if not range(vA5city,1,29,96,98) | sys(vA5city).
compute m109=concat("vA5city=",string(vA5city,f2)).
compute p109="vA5city為不合理值或遺漏值".
Compute s109=2.
end if.
Exec.


*vA5town=100,103,104,105,106,108,110,111,112,114,115,116,200,201,202,203,204,205,206,207,208,209,210,211,212,220,
221,222,223,224,226,227,228,231,232,233,234,235,236,237,238,239,241,242,243,244,247,248,249,251,252,253,260,261,262,263,264,
265,266,267,268,269,270,2   .
do if not any(vA5town,100,103,104,105,106,108,110,111,112,114,115,116,200,201,202,203,204,205,206,207,208,209,210,211,212,220,
221,222,223,224,226,227,228,231,232,233,234,235,236,237,238,239,241,242,243,244,247,248,249,251,252,253,260,261,262,263,264,
265,266,267,268,269,270,272,302,303,304,305,306,307,308,310,311,312,313,314,315,320,324,325,326,327,328,330,333,334,335,336,
337,338,350,351,352,353,354,356,357,358,360,361,362,363,364,365,366,367,368,369,400,401,402,403,404,406,407,408,411,412,413,
414,420,421,422,423,424,426,427,428,429,432,433,434,435,436,437,438,439,500,502,503,504,505,506,507,508,509,510,511,512,513,
514,515,516,520,521,522,523,524,525,526,527,528,530,540,541,542,544,545,546,551,552,553,555,556,557,558,602,603,604,605,606,
607,608,611,612,613,614,615,616,621,622,623,624,625,630,631,632,633,634,635,636,637,638,640,643,646,647,648,649,651,652,653,
654,655,700,701,702,704,708,709,710,711,712,713,714,715,716,717,718,719,720,721,722,723,724,725,726,727,730,731,732,733,734,
735,736,737,741,742,743,744,745,800,801,802,803,804,805,806,807,811,812,813,814,815,820,821,822,823,824,825,826,827,828,829,
830,831,832,833,840,842,843,844,845,846,847,848,849,851,852,880,881,882,883,884,885,890,891,892,893,894,896,900,901,902,903,
904,905,906,907,908,909,911,912,913,920,921,922,923,924,925,926,927,928,929,931,932,940,941,942,943,944,945,946,947,950,951,
952,953,954,955,956,957,958,959,961,962,963,964,965,966,970,971,972,973,974,975,976,977,978,979,981,982,983,3001,3002,3003,
6001,6002,9997,9998,9996) | (vA5city~=29&sys(vA5town)).
compute m110=concat("vA5town=",string(vA5town,f4)).
compute p110="vA5town為不合理值或遺漏值".
Compute s110=2.
end if.
Exec.


*vA6=1,6 97,98  .
do if not range(vA6,1,6,97,98) | sys(vA6).
compute m111=concat("vA6=",string(vA6,f2)).
compute p111="vA6為不合理值或遺漏值".
Compute s111=2.
end if.
Exec.


*vA7=1,6 88 97,98 .
do if not range(vA7,1,6,88,88,97,98) | sys(vA7).
compute m112=concat("vA7=",string(vA7,f2)).
compute p112="vA7為不合理值或遺漏值".
Compute s112=2.
end if.
Exec.


*vA8=1,7 88 97,98 .
do if not range(vA8,1,7,88,88,97,98) | sys(vA8).
compute m113=concat("vA8=",string(vA8,f2)).
compute p113="vA8為不合理值或遺漏值".
Compute s113=2.
end if.
Exec.


*vA9=1,8 88 97.98 .
do if not range(vA9,1,8,88,88,97.98,97.98) | sys(vA9).
compute m114=concat("vA9=",string(vA9,f2)).
compute p114="vA9為不合理值或遺漏值".
Compute s114=2.
end if.
Exec.


*vO1_1=1,5 88 97.98 .
do if not range(vO1_1,1,5,88,88,97.98,97.98) | sys(vO1_1).
compute m115=concat("vO1_1=",string(vO1_1,f2)).
compute p115="vO1_1為不合理值或遺漏值".
Compute s115=2.
end if.
Exec.


*vO1=1,14 88 97,98 .
do if not range(vO1,1,14,88,88,97,98) | sys(vO1).
compute m116=concat("vO1=",string(vO1,f2)).
compute p116="vO1為不合理值或遺漏值".
Compute s116=2.
end if.
Exec.


*vO2=1,19 88 96,98 .
do if not range(vO2,1,19,88,88,96,98) | sys(vO2).
compute m117=concat("vO2=",string(vO2,f2)).
compute p117="vO2為不合理值或遺漏值".
Compute s117=2.
end if.
Exec.


*vO3=1,6 88 96,98 .
do if not range(vO3,1,6,88,88,96,98) | sys(vO3).
compute m118=concat("vO3=",string(vO3,f2)).
compute p118="vO3為不合理值或遺漏值".
Compute s118=2.
end if.
Exec.


*vO4=0,5000 9991 9996,9998 .
do if not range(vO4,0,5000,9991,9991,99996,99998) | sys(vO4).
compute m119=concat("vO4=",string(vO4,f5)).
compute p119="vO4為不合理值或遺漏值".
Compute s119=2.
end if.
Exec.


*vD1=1,3 97,98  .
do if not range(vD1,1,3,97,98) | sys(vD1).
compute m120=concat("vD1=",string(vD1,f2)).
compute p120="vD1為不合理值或遺漏值".
Compute s120=2.
end if.
Exec.


*vD2=0.5,1,1.5,2,2.5,3,3.5,4,4.5,5,5.5,6,6.5,7,95,9996,97,98   .
do if not any(vD2,0.5,1,1.5,2,2.5,3,3.5,4,4.5,5,5.5,6,6.5,7,95,9996,97,98) | sys(vD2).
compute m121=concat("vD2=",string(vD2,n4)).
compute p121="vD2為不合理值或遺漏值".
Compute s121=2.
end if.
Exec.


*vD3=0001,0059,0100,0159,0200,0259,0300,0359,0400,0459,0500,0559,0600,0659,0700,0759,0800,0859,0900,0959,
1000,1059,1100,1159,1200,1259,1300,1359,1400,1459,1500,1559,1600,1659,1700,1759,1800,1859,1900,1959,2000,2059,
2100,2159,2200,2259,2300,2359,99996,99996,9   .
do if not range(vD3,0001,0059,0100,0159,0200,0259,0300,0359,0400,0459,0500,0559,0600,0659,0700,0759,0800,0859,0900,0959,
1000,1059,1100,1159,1200,1259,1300,1359,1400,1459,1500,1559,1600,1659,1700,1759,1800,1859,1900,1959,2000,2059,
2100,2159,2200,2259,2300,2359,99996,99996,9797,9797,9898,9898) | sys(vD3).
compute m122=concat("vD3=",string(vD3,f5)).
compute p122="vD3為不合理值或遺漏值".
Compute s122=2.
end if.
Exec.


*vD4sD4=1,4 96,98  .
do if not range(vD4sD4,1,4,96,98) | sys(vD4sD4).
compute m123=concat("vD4sD4=",string(vD4sD4,f2)).
compute p123="vD4sD4為不合理值或遺漏值".
Compute s123=2.
end if.
Exec.


*vD4sD5=1,4 96,98  .
do if not range(vD4sD5,1,4,96,98) | sys(vD4sD5).
compute m124=concat("vD4sD5=",string(vD4sD5,f2)).
compute p124="vD4sD5為不合理值或遺漏值".
Compute s124=2.
end if.
Exec.


*vD4sD6=1,4 96,98  .
do if not range(vD4sD6,1,4,96,98) | sys(vD4sD6).
compute m125=concat("vD4sD6=",string(vD4sD6,f2)).
compute p125="vD4sD6為不合理值或遺漏值".
Compute s125=2.
end if.
Exec.


*vD4sD7=1,4 96,98  .
do if not range(vD4sD7,1,4,96,98) | sys(vD4sD7).
compute m126=concat("vD4sD7=",string(vD4sD7,f2)).
compute p126="vD4sD7為不合理值或遺漏值".
Compute s126=2.
end if.
Exec.


*vD4sD8=1,4 96,98  .
do if not range(vD4sD8,1,4,96,98) | sys(vD4sD8).
compute m127=concat("vD4sD8=",string(vD4sD8,f2)).
compute p127="vD4sD8為不合理值或遺漏值".
Compute s127=2.
end if.
Exec.


*vK1m01=0,1 97,98  .
do if not range(vK1m01,0,1,97,98) | sys(vK1m01).
compute m128=concat("vK1m01=",string(vK1m01,f2)).
compute p128="vK1m01為不合理值或遺漏值".
Compute s128=2.
end if.
Exec.


*vK1m02=0,1 97,98  .
do if not range(vK1m02,0,1,97,98) | sys(vK1m02).
compute m129=concat("vK1m02=",string(vK1m02,f2)).
compute p129="vK1m02為不合理值或遺漏值".
Compute s129=2.
end if.
Exec.


*vK1m03=0,1 97,98  .
do if not range(vK1m03,0,1,97,98) | sys(vK1m03).
compute m130=concat("vK1m03=",string(vK1m03,f2)).
compute p130="vK1m03為不合理值或遺漏值".
Compute s130=2.
end if.
Exec.


*vK1m04=0,1 97,98  .
do if not range(vK1m04,0,1,97,98) | sys(vK1m04).
compute m131=concat("vK1m04=",string(vK1m04,f2)).
compute p131="vK1m04為不合理值或遺漏值".
Compute s131=2.
end if.
Exec.


*vK1m05=0,1 97,98  .
do if not range(vK1m05,0,1,97,98) | sys(vK1m05).
compute m132=concat("vK1m05=",string(vK1m05,f2)).
compute p132="vK1m05為不合理值或遺漏值".
Compute s132=2.
end if.
Exec.


*vK1m06=0,1 97,98  .
do if not range(vK1m06,0,1,97,98) | sys(vK1m06).
compute m133=concat("vK1m06=",string(vK1m06,f2)).
compute p133="vK1m06為不合理值或遺漏值".
Compute s133=2.
end if.
Exec.


*vK1m07=0,1 97,98  .
do if not range(vK1m07,0,1,97,98) | sys(vK1m07).
compute m134=concat("vK1m07=",string(vK1m07,f2)).
compute p134="vK1m07為不合理值或遺漏值".
Compute s134=2.
end if.
Exec.


*vK1m08=0,1 97,98  .
do if not range(vK1m08,0,1,97,98) | sys(vK1m08).
compute m135=concat("vK1m08=",string(vK1m08,f2)).
compute p135="vK1m08為不合理值或遺漏值".
Compute s135=2.
end if.
Exec.


*vK1m09=0,1 97,98  .
do if not range(vK1m09,0,1,97,98) | sys(vK1m09).
compute m136=concat("vK1m09=",string(vK1m09,f2)).
compute p136="vK1m09為不合理值或遺漏值".
Compute s136=2.
end if.
Exec.


*vK1m10=0,1 97,98  .
do if not range(vK1m10,0,1,97,98) | sys(vK1m10).
compute m137=concat("vK1m10=",string(vK1m10,f2)).
compute p137="vK1m10為不合理值或遺漏值".
Compute s137=2.
end if.
Exec.


*vK1m11=0,1 97,98  .
do if not range(vK1m11,0,1,97,98) | sys(vK1m11).
compute m138=concat("vK1m11=",string(vK1m11,f2)).
compute p138="vK1m11為不合理值或遺漏值".
Compute s138=2.
end if.
Exec.


*vK1m12=0,1 97,98  .
do if not range(vK1m12,0,1,97,98) | sys(vK1m12).
compute m139=concat("vK1m12=",string(vK1m12,f2)).
compute p139="vK1m12為不合理值或遺漏值".
Compute s139=2.
end if.
Exec.


*vK1m13=0,1 97,98  .
do if not range(vK1m13,0,1,97,98) | sys(vK1m13).
compute m140=concat("vK1m13=",string(vK1m13,f2)).
compute p140="vK1m13為不合理值或遺漏值".
Compute s140=2.
end if.
Exec.


*vK1m88=0,1 97,98  .
do if not range(vK1m88,0,1,97,98) | sys(vK1m88).
compute m141=concat("vK1m88=",string(vK1m88,f2)).
compute p141="vK1m88為不合理值或遺漏值".
Compute s141=2.
end if.
Exec.


*vK1m90=0,1 97,98  .
do if not range(vK1m90,0,1,97,98) | sys(vK1m90).
compute m142=concat("vK1m90=",string(vK1m90,f2)).
compute p142="vK1m90為不合理值或遺漏值".
Compute s142=2.
end if.
Exec.


*vK2m01=0,1 97,98  .
do if not range(vK2m01,0,1,97,98) | sys(vK2m01).
compute m143=concat("vK2m01=",string(vK2m01,f2)).
compute p143="vK2m01為不合理值或遺漏值".
Compute s143=2.
end if.
Exec.


*vK2m02=0,1 97,98  .
do if not range(vK2m02,0,1,97,98) | sys(vK2m02).
compute m144=concat("vK2m02=",string(vK2m02,f2)).
compute p144="vK2m02為不合理值或遺漏值".
Compute s144=2.
end if.
Exec.


*vK2m03=0,1 97,98  .
do if not range(vK2m03,0,1,97,98) | sys(vK2m03).
compute m145=concat("vK2m03=",string(vK2m03,f2)).
compute p145="vK2m03為不合理值或遺漏值".
Compute s145=2.
end if.
Exec.


*vK2m04=0,1 97,98  .
do if not range(vK2m04,0,1,97,98) | sys(vK2m04).
compute m146=concat("vK2m04=",string(vK2m04,f2)).
compute p146="vK2m04為不合理值或遺漏值".
Compute s146=2.
end if.
Exec.


*vK2m05=0,1 97,98  .
do if not range(vK2m05,0,1,97,98) | sys(vK2m05).
compute m147=concat("vK2m05=",string(vK2m05,f2)).
compute p147="vK2m05為不合理值或遺漏值".
Compute s147=2.
end if.
Exec.


*vK2m06=0,1 97,98  .
do if not range(vK2m06,0,1,97,98) | sys(vK2m06).
compute m148=concat("vK2m06=",string(vK2m06,f2)).
compute p148="vK2m06為不合理值或遺漏值".
Compute s148=2.
end if.
Exec.


*vK2m07=0,1 97,98  .
do if not range(vK2m07,0,1,97,98) | sys(vK2m07).
compute m149=concat("vK2m07=",string(vK2m07,f2)).
compute p149="vK2m07為不合理值或遺漏值".
Compute s149=2.
end if.
Exec.


*vK2m08=0,1 97,98  .
do if not range(vK2m08,0,1,97,98) | sys(vK2m08).
compute m150=concat("vK2m08=",string(vK2m08,f2)).
compute p150="vK2m08為不合理值或遺漏值".
Compute s150=2.
end if.
Exec.


*vK2m09=0,1 97,98  .
do if not range(vK2m09,0,1,97,98) | sys(vK2m09).
compute m151=concat("vK2m09=",string(vK2m09,f2)).
compute p151="vK2m09為不合理值或遺漏值".
Compute s151=2.
end if.
Exec.


*vK2m11=0,1 97,98  .
do if not range(vK2m11,0,1,97,98) | sys(vK2m11).
compute m152=concat("vK2m11=",string(vK2m11,f2)).
compute p152="vK2m11為不合理值或遺漏值".
Compute s152=2.
end if.
Exec.


*vK2m12=0,1 97,98  .
do if not range(vK2m12,0,1,97,98) | sys(vK2m12).
compute m153=concat("vK2m12=",string(vK2m12,f2)).
compute p153="vK2m12為不合理值或遺漏值".
Compute s153=2.
end if.
Exec.


*vK2m13=0,1 97,98  .
do if not range(vK2m13,0,1,97,98) | sys(vK2m13).
compute m154=concat("vK2m13=",string(vK2m13,f2)).
compute p154="vK2m13為不合理值或遺漏值".
Compute s154=2.
end if.
Exec.


*vK2m88=0,1 97,98  .
do if not range(vK2m88,0,1,97,98) | sys(vK2m88).
compute m155=concat("vK2m88=",string(vK2m88,f2)).
compute p155="vK2m88為不合理值或遺漏值".
Compute s155=2.
end if.
Exec.


*vK2m90=0,1 97,98  .
do if not range(vK2m90,0,1,97,98) | sys(vK2m90).
compute m156=concat("vK2m90=",string(vK2m90,f2)).
compute p156="vK2m90為不合理值或遺漏值".
Compute s156=2.
end if.
Exec.


*vE17=1,3 88 96,98 .
do if not range(vE17,1,3,88,88,96,98) | sys(vE17).
compute m157=concat("vE17=",string(vE17,f2)).
compute p157="vE17為不合理值或遺漏值".
Compute s157=2.
end if.
Exec.


*vKLI1=0.5,1,1.5,2,2.5,3,3.5,4,4.5,5,5.5,6,6.5,7,95,9996,97,98   .
do if not any(vKLI1,0.5,1,1.5,2,2.5,3,3.5,4,4.5,5,5.5,6,6.5,7,95,9996,97,98) | sys(vKLI1).
compute m158=concat("vKLI1=",string(vKLI1,n4)).
compute p158="vKLI1為不合理值或遺漏值".
Compute s158=2.
end if.
Exec.


*vKLI2=0001,0059,0100,0159,0200,0259,0300,0359,0400,0459,0500,0559,0600,0659,0700,0759,0800,0859,0900,0959,
1000,1059,1100,1159,1200,1259,1300,1359,1400,1459,1500,1559,1600,1659,1700,1759,1800,1859,1900,1959,2000,2059,
2100,2159,2200,2259,2300,2359,99996,99996,9   .
do if not range(vKLI2,0001,0059,0100,0159,0200,0259,0300,0359,0400,0459,0500,0559,0600,0659,0700,0759,0800,0859,0900,0959,
1000,1059,1100,1159,1200,1259,1300,1359,1400,1459,1500,1559,1600,1659,1700,1759,1800,1859,1900,1959,2000,2059,
2100,2159,2200,2259,2300,2359,99996,99996,9797,9797,9898,9898) | sys(vKLI2).
compute m159=concat("vKLI2=",string(vKLI2,f5)).
compute p159="vKLI2為不合理值或遺漏值".
Compute s159=2.
end if.
Exec.


*vKFB1=0.5,1,1.5,2,2.5,3,3.5,4,4.5,5,5.5,6,6.5,7,95,9996,97,98   .
do if not any(vKFB1,0.5,1,1.5,2,2.5,3,3.5,4,4.5,5,5.5,6,6.5,7,95,9996,97,98) | sys(vKFB1).
compute m160=concat("vKFB1=",string(vKFB1,n4)).
compute p160="vKFB1為不合理值或遺漏值".
Compute s160=2.
end if.
Exec.


*vKFB2=0001,0059,0100,0159,0200,0259,0300,0359,0400,0459,0500,0559,0600,0659,0700,0759,0800,0859,0900,0959,
1000,1059,1100,1159,1200,1259,1300,1359,1400,1459,1500,1559,1600,1659,1700,1759,1800,1859,1900,1959,2000,2059,
2100,2159,2200,2259,2300,2359,99996,99996,9   .
do if not range(vKFB2,0001,0059,0100,0159,0200,0259,0300,0359,0400,0459,0500,0559,0600,0659,0700,0759,0800,0859,0900,0959,
1000,1059,1100,1159,1200,1259,1300,1359,1400,1459,1500,1559,1600,1659,1700,1759,1800,1859,1900,1959,2000,2059,
2100,2159,2200,2259,2300,2359,99996,99996,9797,9797,9898,9898) | sys(vKFB2).
compute m161=concat("vKFB2=",string(vKFB2,f5)).
compute p161="vKFB2為不合理值或遺漏值".
Compute s161=2.
end if.
Exec.


*vKFB3m01=0,1 96,98  .
do if not range(vKFB3m01,0,1,96,98) | sys(vKFB3m01).
compute m162=concat("vKFB3m01=",string(vKFB3m01,f2)).
compute p162="vKFB3m01為不合理值或遺漏值".
Compute s162=2.
end if.
Exec.


*vKFB3m02=0,1 96,98  .
do if not range(vKFB3m02,0,1,96,98) | sys(vKFB3m02).
compute m163=concat("vKFB3m02=",string(vKFB3m02,f2)).
compute p163="vKFB3m02為不合理值或遺漏值".
Compute s163=2.
end if.
Exec.


*vKFB3m03=0,1 96,98  .
do if not range(vKFB3m03,0,1,96,98) | sys(vKFB3m03).
compute m164=concat("vKFB3m03=",string(vKFB3m03,f2)).
compute p164="vKFB3m03為不合理值或遺漏值".
Compute s164=2.
end if.
Exec.


*vKFB3m04=0,1 96,98  .
do if not range(vKFB3m04,0,1,96,98) | sys(vKFB3m04).
compute m165=concat("vKFB3m04=",string(vKFB3m04,f2)).
compute p165="vKFB3m04為不合理值或遺漏值".
Compute s165=2.
end if.
Exec.


*vKFB3m05=0,1 96,98  .
do if not range(vKFB3m05,0,1,96,98) | sys(vKFB3m05).
compute m166=concat("vKFB3m05=",string(vKFB3m05,f2)).
compute p166="vKFB3m05為不合理值或遺漏值".
Compute s166=2.
end if.
Exec.


*vKFB3m06=0,1 96,98  .
do if not range(vKFB3m06,0,1,96,98) | sys(vKFB3m06).
compute m167=concat("vKFB3m06=",string(vKFB3m06,f2)).
compute p167="vKFB3m06為不合理值或遺漏值".
Compute s167=2.
end if.
Exec.


*vKFB3m07=0,1 96,98  .
do if not range(vKFB3m07,0,1,96,98) | sys(vKFB3m07).
compute m168=concat("vKFB3m07=",string(vKFB3m07,f2)).
compute p168="vKFB3m07為不合理值或遺漏值".
Compute s168=2.
end if.
Exec.


*vKFB3m08=0,1 96,98  .
do if not range(vKFB3m08,0,1,96,98) | sys(vKFB3m08).
compute m169=concat("vKFB3m08=",string(vKFB3m08,f2)).
compute p169="vKFB3m08為不合理值或遺漏值".
Compute s169=2.
end if.
Exec.


*vKFB3m09=0,1 96,98  .
do if not range(vKFB3m09,0,1,96,98) | sys(vKFB3m09).
compute m170=concat("vKFB3m09=",string(vKFB3m09,f2)).
compute p170="vKFB3m09為不合理值或遺漏值".
Compute s170=2.
end if.
Exec.


*vKFB3m10=0,1 96,98  .
do if not range(vKFB3m10,0,1,96,98) | sys(vKFB3m10).
compute m171=concat("vKFB3m10=",string(vKFB3m10,f2)).
compute p171="vKFB3m10為不合理值或遺漏值".
Compute s171=2.
end if.
Exec.


*vKFB3m11=0,1 96,98  .
do if not range(vKFB3m11,0,1,96,98) | sys(vKFB3m11).
compute m172=concat("vKFB3m11=",string(vKFB3m11,f2)).
compute p172="vKFB3m11為不合理值或遺漏值".
Compute s172=2.
end if.
Exec.


*vKFB3m12=0,1 96,98  .
do if not range(vKFB3m12,0,1,96,98) | sys(vKFB3m12).
compute m173=concat("vKFB3m12=",string(vKFB3m12,f2)).
compute p173="vKFB3m12為不合理值或遺漏值".
Compute s173=2.
end if.
Exec.


*vKFB3m13=0,1 96,98  .
do if not range(vKFB3m13,0,1,96,98) | sys(vKFB3m13).
compute m174=concat("vKFB3m13=",string(vKFB3m13,f2)).
compute p174="vKFB3m13為不合理值或遺漏值".
Compute s174=2.
end if.
Exec.


*vKFB3m14=0,1 96,98  .
do if not range(vKFB3m14,0,1,96,98) | sys(vKFB3m14).
compute m175=concat("vKFB3m14=",string(vKFB3m14,f2)).
compute p175="vKFB3m14為不合理值或遺漏值".
Compute s175=2.
end if.
Exec.


*vKFB3m15=0,1 96,98  .
do if not range(vKFB3m15,0,1,96,98) | sys(vKFB3m15).
compute m176=concat("vKFB3m15=",string(vKFB3m15,f2)).
compute p176="vKFB3m15為不合理值或遺漏值".
Compute s176=2.
end if.
Exec.


*vKFB3m16=0,1 96,98  .
do if not range(vKFB3m16,0,1,96,98) | sys(vKFB3m16).
compute m177=concat("vKFB3m16=",string(vKFB3m16,f2)).
compute p177="vKFB3m16為不合理值或遺漏值".
Compute s177=2.
end if.
Exec.


*vKFB3m17=0,1 96,98  .
do if not range(vKFB3m17,0,1,96,98) | sys(vKFB3m17).
compute m178=concat("vKFB3m17=",string(vKFB3m17,f2)).
compute p178="vKFB3m17為不合理值或遺漏值".
Compute s178=2.
end if.
Exec.


*vKFB3m88=0,1 96,98  .
do if not range(vKFB3m88,0,1,96,98) | sys(vKFB3m88).
compute m179=concat("vKFB3m88=",string(vKFB3m88,f2)).
compute p179="vKFB3m88為不合理值或遺漏值".
Compute s179=2.
end if.
Exec.


*vKFB4m01=0,1 96,98  .
do if not range(vKFB4m01,0,1,96,98) | sys(vKFB4m01).
compute m180=concat("vKFB4m01=",string(vKFB4m01,f2)).
compute p180="vKFB4m01為不合理值或遺漏值".
Compute s180=2.
end if.
Exec.


*vKFB4m02=0,1 96,98  .
do if not range(vKFB4m02,0,1,96,98) | sys(vKFB4m02).
compute m181=concat("vKFB4m02=",string(vKFB4m02,f2)).
compute p181="vKFB4m02為不合理值或遺漏值".
Compute s181=2.
end if.
Exec.


*vKFB4m03=0,1 96,98  .
do if not range(vKFB4m03,0,1,96,98) | sys(vKFB4m03).
compute m182=concat("vKFB4m03=",string(vKFB4m03,f2)).
compute p182="vKFB4m03為不合理值或遺漏值".
Compute s182=2.
end if.
Exec.


*vKFB4m04=0,1 96,98  .
do if not range(vKFB4m04,0,1,96,98) | sys(vKFB4m04).
compute m183=concat("vKFB4m04=",string(vKFB4m04,f2)).
compute p183="vKFB4m04為不合理值或遺漏值".
Compute s183=2.
end if.
Exec.


*vKFB4m05=0,1 96,98  .
do if not range(vKFB4m05,0,1,96,98) | sys(vKFB4m05).
compute m184=concat("vKFB4m05=",string(vKFB4m05,f2)).
compute p184="vKFB4m05為不合理值或遺漏值".
Compute s184=2.
end if.
Exec.


*vKFB4m06=0,1 96,98  .
do if not range(vKFB4m06,0,1,96,98) | sys(vKFB4m06).
compute m185=concat("vKFB4m06=",string(vKFB4m06,f2)).
compute p185="vKFB4m06為不合理值或遺漏值".
Compute s185=2.
end if.
Exec.


*vKFB4m07=0,1 96,98  .
do if not range(vKFB4m07,0,1,96,98) | sys(vKFB4m07).
compute m186=concat("vKFB4m07=",string(vKFB4m07,f2)).
compute p186="vKFB4m07為不合理值或遺漏值".
Compute s186=2.
end if.
Exec.


*vKFB4m08=0,1 96,98  .
do if not range(vKFB4m08,0,1,96,98) | sys(vKFB4m08).
compute m187=concat("vKFB4m08=",string(vKFB4m08,f2)).
compute p187="vKFB4m08為不合理值或遺漏值".
Compute s187=2.
end if.
Exec.


*vKFB4m09=0,1 96,98  .
do if not range(vKFB4m09,0,1,96,98) | sys(vKFB4m09).
compute m188=concat("vKFB4m09=",string(vKFB4m09,f2)).
compute p188="vKFB4m09為不合理值或遺漏值".
Compute s188=2.
end if.
Exec.


*vKFB4m10=0,1 96,98  .
do if not range(vKFB4m10,0,1,96,98) | sys(vKFB4m10).
compute m189=concat("vKFB4m10=",string(vKFB4m10,f2)).
compute p189="vKFB4m10為不合理值或遺漏值".
Compute s189=2.
end if.
Exec.


*vKFB4m11=0,1 96,98  .
do if not range(vKFB4m11,0,1,96,98) | sys(vKFB4m11).
compute m190=concat("vKFB4m11=",string(vKFB4m11,f2)).
compute p190="vKFB4m11為不合理值或遺漏值".
Compute s190=2.
end if.
Exec.


*vKFB4m12=0,1 96,98  .
do if not range(vKFB4m12,0,1,96,98) | sys(vKFB4m12).
compute m191=concat("vKFB4m12=",string(vKFB4m12,f2)).
compute p191="vKFB4m12為不合理值或遺漏值".
Compute s191=2.
end if.
Exec.


*vKFB4m13=0,1 96,98  .
do if not range(vKFB4m13,0,1,96,98) | sys(vKFB4m13).
compute m192=concat("vKFB4m13=",string(vKFB4m13,f2)).
compute p192="vKFB4m13為不合理值或遺漏值".
Compute s192=2.
end if.
Exec.


*vKFB4m14=0,1 96,98  .
do if not range(vKFB4m14,0,1,96,98) | sys(vKFB4m14).
compute m193=concat("vKFB4m14=",string(vKFB4m14,f2)).
compute p193="vKFB4m14為不合理值或遺漏值".
Compute s193=2.
end if.
Exec.


*vKFB4m15=0,1 96,98  .
do if not range(vKFB4m15,0,1,96,98) | sys(vKFB4m15).
compute m194=concat("vKFB4m15=",string(vKFB4m15,f2)).
compute p194="vKFB4m15為不合理值或遺漏值".
Compute s194=2.
end if.
Exec.


*vKFB4m16=0,1 96,98  .
do if not range(vKFB4m16,0,1,96,98) | sys(vKFB4m16).
compute m195=concat("vKFB4m16=",string(vKFB4m16,f2)).
compute p195="vKFB4m16為不合理值或遺漏值".
Compute s195=2.
end if.
Exec.


*vKFB4m17=0,1 96,98  .
do if not range(vKFB4m17,0,1,96,98) | sys(vKFB4m17).
compute m196=concat("vKFB4m17=",string(vKFB4m17,f2)).
compute p196="vKFB4m17為不合理值或遺漏值".
Compute s196=2.
end if.
Exec.


*vKFB4m18=0,1 96,98  .
do if not range(vKFB4m18,0,1,96,98) | sys(vKFB4m18).
compute m197=concat("vKFB4m18=",string(vKFB4m18,f2)).
compute p197="vKFB4m18為不合理值或遺漏值".
Compute s197=2.
end if.
Exec.


*vKFB4m88=0,1 96,98  .
do if not range(vKFB4m88,0,1,96,98) | sys(vKFB4m88).
compute m198=concat("vKFB4m88=",string(vKFB4m88,f2)).
compute p198="vKFB4m88為不合理值或遺漏值".
Compute s198=2.
end if.
Exec.


*vKIG1=0.5,1,1.5,2,2.5,3,3.5,4,4.5,5,5.5,6,6.5,7,95,9996,97,98   .
do if not any(vKIG1,0.5,1,1.5,2,2.5,3,3.5,4,4.5,5,5.5,6,6.5,7,95,9996,97,98) | sys(vKIG1).
compute m199=concat("vKIG1=",string(vKIG1,n4)).
compute p199="vKIG1為不合理值或遺漏值".
Compute s199=2.
end if.
Exec.


*vKIG2=0001,0059,0100,0159,0200,0259,0300,0359,0400,0459,0500,0559,0600,0659,0700,0759,0800,0859,0900,0959,
1000,1059,1100,1159,1200,1259,1300,1359,1400,1459,1500,1559,1600,1659,1700,1759,1800,1859,1900,1959,2000,2059,
2100,2159,2200,2259,2300,2359,99996,99996,9   .
do if not range(vKIG2,0001,0059,0100,0159,0200,0259,0300,0359,0400,0459,0500,0559,0600,0659,0700,0759,0800,0859,0900,0959,
1000,1059,1100,1159,1200,1259,1300,1359,1400,1459,1500,1559,1600,1659,1700,1759,1800,1859,1900,1959,2000,2059,
2100,2159,2200,2259,2300,2359,99996,99996,9797,9797,9898,9898) | sys(vKIG2).
compute m200=concat("vKIG2=",string(vKIG2,f5)).
compute p200="vKIG2為不合理值或遺漏值".
Compute s200=2.
end if.
Exec.


*vKIG3m01=0,1 96,98  .
do if not range(vKIG3m01,0,1,96,98) | sys(vKIG3m01).
compute m201=concat("vKIG3m01=",string(vKIG3m01,f2)).
compute p201="vKIG3m01為不合理值或遺漏值".
Compute s201=2.
end if.
Exec.


*vKIG3m02=0,1 96,98  .
do if not range(vKIG3m02,0,1,96,98) | sys(vKIG3m02).
compute m202=concat("vKIG3m02=",string(vKIG3m02,f2)).
compute p202="vKIG3m02為不合理值或遺漏值".
Compute s202=2.
end if.
Exec.


*vKIG3m03=0,1 96,98  .
do if not range(vKIG3m03,0,1,96,98) | sys(vKIG3m03).
compute m203=concat("vKIG3m03=",string(vKIG3m03,f2)).
compute p203="vKIG3m03為不合理值或遺漏值".
Compute s203=2.
end if.
Exec.


*vKIG3m04=0,1 96,98  .
do if not range(vKIG3m04,0,1,96,98) | sys(vKIG3m04).
compute m204=concat("vKIG3m04=",string(vKIG3m04,f2)).
compute p204="vKIG3m04為不合理值或遺漏值".
Compute s204=2.
end if.
Exec.


*vKIG3m05=0,1 96,98  .
do if not range(vKIG3m05,0,1,96,98) | sys(vKIG3m05).
compute m205=concat("vKIG3m05=",string(vKIG3m05,f2)).
compute p205="vKIG3m05為不合理值或遺漏值".
Compute s205=2.
end if.
Exec.


*vKIG3m06=0,1 96,98  .
do if not range(vKIG3m06,0,1,96,98) | sys(vKIG3m06).
compute m206=concat("vKIG3m06=",string(vKIG3m06,f2)).
compute p206="vKIG3m06為不合理值或遺漏值".
Compute s206=2.
end if.
Exec.


*vKIG3m07=0,1 96,98  .
do if not range(vKIG3m07,0,1,96,98) | sys(vKIG3m07).
compute m207=concat("vKIG3m07=",string(vKIG3m07,f2)).
compute p207="vKIG3m07為不合理值或遺漏值".
Compute s207=2.
end if.
Exec.


*vKIG3m08=0,1 96,98  .
do if not range(vKIG3m08,0,1,96,98) | sys(vKIG3m08).
compute m208=concat("vKIG3m08=",string(vKIG3m08,f2)).
compute p208="vKIG3m08為不合理值或遺漏值".
Compute s208=2.
end if.
Exec.


*vKIG3m09=0,1 96,98  .
do if not range(vKIG3m09,0,1,96,98) | sys(vKIG3m09).
compute m209=concat("vKIG3m09=",string(vKIG3m09,f2)).
compute p209="vKIG3m09為不合理值或遺漏值".
Compute s209=2.
end if.
Exec.


*vKIG3m10=0,1 96,98  .
do if not range(vKIG3m10,0,1,96,98) | sys(vKIG3m10).
compute m210=concat("vKIG3m10=",string(vKIG3m10,f2)).
compute p210="vKIG3m10為不合理值或遺漏值".
Compute s210=2.
end if.
Exec.


*vKIG3m11=0,1 96,98  .
do if not range(vKIG3m11,0,1,96,98) | sys(vKIG3m11).
compute m211=concat("vKIG3m11=",string(vKIG3m11,f2)).
compute p211="vKIG3m11為不合理值或遺漏值".
Compute s211=2.
end if.
Exec.


*vKIG3m12=0,1 96,98  .
do if not range(vKIG3m12,0,1,96,98) | sys(vKIG3m12).
compute m212=concat("vKIG3m12=",string(vKIG3m12,f2)).
compute p212="vKIG3m12為不合理值或遺漏值".
Compute s212=2.
end if.
Exec.


*vKIG3m13=0,1 96,98  .
do if not range(vKIG3m13,0,1,96,98) | sys(vKIG3m13).
compute m213=concat("vKIG3m13=",string(vKIG3m13,f2)).
compute p213="vKIG3m13為不合理值或遺漏值".
Compute s213=2.
end if.
Exec.


*vKIG3m14=0,1 96,98  .
do if not range(vKIG3m14,0,1,96,98) | sys(vKIG3m14).
compute m214=concat("vKIG3m14=",string(vKIG3m14,f2)).
compute p214="vKIG3m14為不合理值或遺漏值".
Compute s214=2.
end if.
Exec.


*vKIG3m15=0,1 96,98  .
do if not range(vKIG3m15,0,1,96,98) | sys(vKIG3m15).
compute m215=concat("vKIG3m15=",string(vKIG3m15,f2)).
compute p215="vKIG3m15為不合理值或遺漏值".
Compute s215=2.
end if.
Exec.


*vKIG3m16=0,1 96,98  .
do if not range(vKIG3m16,0,1,96,98) | sys(vKIG3m16).
compute m216=concat("vKIG3m16=",string(vKIG3m16,f2)).
compute p216="vKIG3m16為不合理值或遺漏值".
Compute s216=2.
end if.
Exec.


*vKIG3m17=0,1 96,98  .
do if not range(vKIG3m17,0,1,96,98) | sys(vKIG3m17).
compute m217=concat("vKIG3m17=",string(vKIG3m17,f2)).
compute p217="vKIG3m17為不合理值或遺漏值".
Compute s217=2.
end if.
Exec.


*vKIG3m88=0,1 96,98  .
do if not range(vKIG3m88,0,1,96,98) | sys(vKIG3m88).
compute m218=concat("vKIG3m88=",string(vKIG3m88,f2)).
compute p218="vKIG3m88為不合理值或遺漏值".
Compute s218=2.
end if.
Exec.


*vKIG4m01=0,1 96,98  .
do if not range(vKIG4m01,0,1,96,98) | sys(vKIG4m01).
compute m219=concat("vKIG4m01=",string(vKIG4m01,f2)).
compute p219="vKIG4m01為不合理值或遺漏值".
Compute s219=2.
end if.
Exec.


*vKIG4m02=0,1 96,98  .
do if not range(vKIG4m02,0,1,96,98) | sys(vKIG4m02).
compute m220=concat("vKIG4m02=",string(vKIG4m02,f2)).
compute p220="vKIG4m02為不合理值或遺漏值".
Compute s220=2.
end if.
Exec.


*vKIG4m03=0,1 96,98  .
do if not range(vKIG4m03,0,1,96,98) | sys(vKIG4m03).
compute m221=concat("vKIG4m03=",string(vKIG4m03,f2)).
compute p221="vKIG4m03為不合理值或遺漏值".
Compute s221=2.
end if.
Exec.


*vKIG4m04=0,1 96,98  .
do if not range(vKIG4m04,0,1,96,98) | sys(vKIG4m04).
compute m222=concat("vKIG4m04=",string(vKIG4m04,f2)).
compute p222="vKIG4m04為不合理值或遺漏值".
Compute s222=2.
end if.
Exec.


*vKIG4m05=0,1 96,98  .
do if not range(vKIG4m05,0,1,96,98) | sys(vKIG4m05).
compute m223=concat("vKIG4m05=",string(vKIG4m05,f2)).
compute p223="vKIG4m05為不合理值或遺漏值".
Compute s223=2.
end if.
Exec.


*vKIG4m06=0,1 96,98  .
do if not range(vKIG4m06,0,1,96,98) | sys(vKIG4m06).
compute m224=concat("vKIG4m06=",string(vKIG4m06,f2)).
compute p224="vKIG4m06為不合理值或遺漏值".
Compute s224=2.
end if.
Exec.


*vKIG4m07=0,1 96,98  .
do if not range(vKIG4m07,0,1,96,98) | sys(vKIG4m07).
compute m225=concat("vKIG4m07=",string(vKIG4m07,f2)).
compute p225="vKIG4m07為不合理值或遺漏值".
Compute s225=2.
end if.
Exec.


*vKIG4m08=0,1 96,98  .
do if not range(vKIG4m08,0,1,96,98) | sys(vKIG4m08).
compute m226=concat("vKIG4m08=",string(vKIG4m08,f2)).
compute p226="vKIG4m08為不合理值或遺漏值".
Compute s226=2.
end if.
Exec.


*vKIG4m09=0,1 96,98  .
do if not range(vKIG4m09,0,1,96,98) | sys(vKIG4m09).
compute m227=concat("vKIG4m09=",string(vKIG4m09,f2)).
compute p227="vKIG4m09為不合理值或遺漏值".
Compute s227=2.
end if.
Exec.


*vKIG4m10=0,1 96,98  .
do if not range(vKIG4m10,0,1,96,98) | sys(vKIG4m10).
compute m228=concat("vKIG4m10=",string(vKIG4m10,f2)).
compute p228="vKIG4m10為不合理值或遺漏值".
Compute s228=2.
end if.
Exec.


*vKIG4m11=0,1 96,98  .
do if not range(vKIG4m11,0,1,96,98) | sys(vKIG4m11).
compute m229=concat("vKIG4m11=",string(vKIG4m11,f2)).
compute p229="vKIG4m11為不合理值或遺漏值".
Compute s229=2.
end if.
Exec.


*vKIG4m12=0,1 96,98  .
do if not range(vKIG4m12,0,1,96,98) | sys(vKIG4m12).
compute m230=concat("vKIG4m12=",string(vKIG4m12,f2)).
compute p230="vKIG4m12為不合理值或遺漏值".
Compute s230=2.
end if.
Exec.


*vKIG4m13=0,1 96,98  .
do if not range(vKIG4m13,0,1,96,98) | sys(vKIG4m13).
compute m231=concat("vKIG4m13=",string(vKIG4m13,f2)).
compute p231="vKIG4m13為不合理值或遺漏值".
Compute s231=2.
end if.
Exec.


*vKIG4m14=0,1 96,98  .
do if not range(vKIG4m14,0,1,96,98) | sys(vKIG4m14).
compute m232=concat("vKIG4m14=",string(vKIG4m14,f2)).
compute p232="vKIG4m14為不合理值或遺漏值".
Compute s232=2.
end if.
Exec.


*vKIG4m88=0,1 96,98  .
do if not range(vKIG4m88,0,1,96,98) | sys(vKIG4m88).
compute m233=concat("vKIG4m88=",string(vKIG4m88,f2)).
compute p233="vKIG4m88為不合理值或遺漏值".
Compute s233=2.
end if.
Exec.


*vKTT1=0.5,1,1.5,2,2.5,3,3.5,4,4.5,5,5.5,6,6.5,7,95,9996,97,98   .
do if not any(vKTT1,0.5,1,1.5,2,2.5,3,3.5,4,4.5,5,5.5,6,6.5,7,95,9996,97,98) | sys(vKTT1).
compute m234=concat("vKTT1=",string(vKTT1,n4)).
compute p234="vKTT1為不合理值或遺漏值".
Compute s234=2.
end if.
Exec.


*vKTT2=0001,0059,0100,0159,0200,0259,0300,0359,0400,0459,0500,0559,0600,0659,0700,0759,0800,0859,0900,0959,
1000,1059,1100,1159,1200,1259,1300,1359,1400,1459,1500,1559,1600,1659,1700,1759,1800,1859,1900,1959,2000,2059,
2100,2159,2200,2259,2300,2359,99996,99996,9   .
do if not range(vKTT2,0001,0059,0100,0159,0200,0259,0300,0359,0400,0459,0500,0559,0600,0659,0700,0759,0800,0859,0900,0959,
1000,1059,1100,1159,1200,1259,1300,1359,1400,1459,1500,1559,1600,1659,1700,1759,1800,1859,1900,1959,2000,2059,
2100,2159,2200,2259,2300,2359,99996,99996,9797,9797,9898,9898) | sys(vKTT2).
compute m235=concat("vKTT2=",string(vKTT2,f5)).
compute p235="vKTT2為不合理值或遺漏值".
Compute s235=2.
end if.
Exec.


*vKTT3m01=0,1 96,98  .
do if not range(vKTT3m01,0,1,96,98) | sys(vKTT3m01).
compute m236=concat("vKTT3m01=",string(vKTT3m01,f2)).
compute p236="vKTT3m01為不合理值或遺漏值".
Compute s236=2.
end if.
Exec.


*vKTT3m02=0,1 96,98  .
do if not range(vKTT3m02,0,1,96,98) | sys(vKTT3m02).
compute m237=concat("vKTT3m02=",string(vKTT3m02,f2)).
compute p237="vKTT3m02為不合理值或遺漏值".
Compute s237=2.
end if.
Exec.


*vKTT3m03=0,1 96,98  .
do if not range(vKTT3m03,0,1,96,98) | sys(vKTT3m03).
compute m238=concat("vKTT3m03=",string(vKTT3m03,f2)).
compute p238="vKTT3m03為不合理值或遺漏值".
Compute s238=2.
end if.
Exec.


*vKTT3m04=0,1 96,98  .
do if not range(vKTT3m04,0,1,96,98) | sys(vKTT3m04).
compute m239=concat("vKTT3m04=",string(vKTT3m04,f2)).
compute p239="vKTT3m04為不合理值或遺漏值".
Compute s239=2.
end if.
Exec.


*vKTT3m05=0,1 96,98  .
do if not range(vKTT3m05,0,1,96,98) | sys(vKTT3m05).
compute m240=concat("vKTT3m05=",string(vKTT3m05,f2)).
compute p240="vKTT3m05為不合理值或遺漏值".
Compute s240=2.
end if.
Exec.


*vKTT3m06=0,1 96,98  .
do if not range(vKTT3m06,0,1,96,98) | sys(vKTT3m06).
compute m241=concat("vKTT3m06=",string(vKTT3m06,f2)).
compute p241="vKTT3m06為不合理值或遺漏值".
Compute s241=2.
end if.
Exec.


*vKTT3m07=0,1 96,98  .
do if not range(vKTT3m07,0,1,96,98) | sys(vKTT3m07).
compute m242=concat("vKTT3m07=",string(vKTT3m07,f2)).
compute p242="vKTT3m07為不合理值或遺漏值".
Compute s242=2.
end if.
Exec.


*vKTT3m08=0,1 96,98  .
do if not range(vKTT3m08,0,1,96,98) | sys(vKTT3m08).
compute m243=concat("vKTT3m08=",string(vKTT3m08,f2)).
compute p243="vKTT3m08為不合理值或遺漏值".
Compute s243=2.
end if.
Exec.


*vKTT3m09=0,1 96,98  .
do if not range(vKTT3m09,0,1,96,98) | sys(vKTT3m09).
compute m244=concat("vKTT3m09=",string(vKTT3m09,f2)).
compute p244="vKTT3m09為不合理值或遺漏值".
Compute s244=2.
end if.
Exec.


*vKTT3m10=0,1 96,98  .
do if not range(vKTT3m10,0,1,96,98) | sys(vKTT3m10).
compute m245=concat("vKTT3m10=",string(vKTT3m10,f2)).
compute p245="vKTT3m10為不合理值或遺漏值".
Compute s245=2.
end if.
Exec.


*vKTT3m11=0,1 96,98  .
do if not range(vKTT3m11,0,1,96,98) | sys(vKTT3m11).
compute m246=concat("vKTT3m11=",string(vKTT3m11,f2)).
compute p246="vKTT3m11為不合理值或遺漏值".
Compute s246=2.
end if.
Exec.


*vKTT3m12=0,1 96,98  .
do if not range(vKTT3m12,0,1,96,98) | sys(vKTT3m12).
compute m247=concat("vKTT3m12=",string(vKTT3m12,f2)).
compute p247="vKTT3m12為不合理值或遺漏值".
Compute s247=2.
end if.
Exec.


*vKTT3m13=0,1 96,98  .
do if not range(vKTT3m13,0,1,96,98) | sys(vKTT3m13).
compute m248=concat("vKTT3m13=",string(vKTT3m13,f2)).
compute p248="vKTT3m13為不合理值或遺漏值".
Compute s248=2.
end if.
Exec.


*vKTT3m14=0,1 96,98  .
do if not range(vKTT3m14,0,1,96,98) | sys(vKTT3m14).
compute m249=concat("vKTT3m14=",string(vKTT3m14,f2)).
compute p249="vKTT3m14為不合理值或遺漏值".
Compute s249=2.
end if.
Exec.


*vKTT3m15=0,1 96,98  .
do if not range(vKTT3m15,0,1,96,98) | sys(vKTT3m15).
compute m250=concat("vKTT3m15=",string(vKTT3m15,f2)).
compute p250="vKTT3m15為不合理值或遺漏值".
Compute s250=2.
end if.
Exec.


*vKTT3m16=0,1 96,98  .
do if not range(vKTT3m16,0,1,96,98) | sys(vKTT3m16).
compute m251=concat("vKTT3m16=",string(vKTT3m16,f2)).
compute p251="vKTT3m16為不合理值或遺漏值".
Compute s251=2.
end if.
Exec.


*vKTT3m88=0,1 96,98  .
do if not range(vKTT3m88,0,1,96,98) | sys(vKTT3m88).
compute m252=concat("vKTT3m88=",string(vKTT3m88,f2)).
compute p252="vKTT3m88為不合理值或遺漏值".
Compute s252=2.
end if.
Exec.


*vKTT4m01=0,1 96,98  .
do if not range(vKTT4m01,0,1,96,98) | sys(vKTT4m01).
compute m253=concat("vKTT4m01=",string(vKTT4m01,f2)).
compute p253="vKTT4m01為不合理值或遺漏值".
Compute s253=2.
end if.
Exec.


*vKTT4m02=0,1 96,98  .
do if not range(vKTT4m02,0,1,96,98) | sys(vKTT4m02).
compute m254=concat("vKTT4m02=",string(vKTT4m02,f2)).
compute p254="vKTT4m02為不合理值或遺漏值".
Compute s254=2.
end if.
Exec.


*vKTT4m03=0,1 96,98  .
do if not range(vKTT4m03,0,1,96,98) | sys(vKTT4m03).
compute m255=concat("vKTT4m03=",string(vKTT4m03,f2)).
compute p255="vKTT4m03為不合理值或遺漏值".
Compute s255=2.
end if.
Exec.


*vKTT4m04=0,1 96,98  .
do if not range(vKTT4m04,0,1,96,98) | sys(vKTT4m04).
compute m256=concat("vKTT4m04=",string(vKTT4m04,f2)).
compute p256="vKTT4m04為不合理值或遺漏值".
Compute s256=2.
end if.
Exec.


*vKTT4m05=0,1 96,98  .
do if not range(vKTT4m05,0,1,96,98) | sys(vKTT4m05).
compute m257=concat("vKTT4m05=",string(vKTT4m05,f2)).
compute p257="vKTT4m05為不合理值或遺漏值".
Compute s257=2.
end if.
Exec.


*vKTT4m06=0,1 96,98  .
do if not range(vKTT4m06,0,1,96,98) | sys(vKTT4m06).
compute m258=concat("vKTT4m06=",string(vKTT4m06,f2)).
compute p258="vKTT4m06為不合理值或遺漏值".
Compute s258=2.
end if.
Exec.


*vKTT4m07=0,1 96,98  .
do if not range(vKTT4m07,0,1,96,98) | sys(vKTT4m07).
compute m259=concat("vKTT4m07=",string(vKTT4m07,f2)).
compute p259="vKTT4m07為不合理值或遺漏值".
Compute s259=2.
end if.
Exec.


*vKTT4m08=0,1 96,98  .
do if not range(vKTT4m08,0,1,96,98) | sys(vKTT4m08).
compute m260=concat("vKTT4m08=",string(vKTT4m08,f2)).
compute p260="vKTT4m08為不合理值或遺漏值".
Compute s260=2.
end if.
Exec.


*vKTT4m09=0,1 96,98  .
do if not range(vKTT4m09,0,1,96,98) | sys(vKTT4m09).
compute m261=concat("vKTT4m09=",string(vKTT4m09,f2)).
compute p261="vKTT4m09為不合理值或遺漏值".
Compute s261=2.
end if.
Exec.


*vKTT4m10=0,1 96,98  .
do if not range(vKTT4m10,0,1,96,98) | sys(vKTT4m10).
compute m262=concat("vKTT4m10=",string(vKTT4m10,f2)).
compute p262="vKTT4m10為不合理值或遺漏值".
Compute s262=2.
end if.
Exec.


*vKTT4m11=0,1 96,98  .
do if not range(vKTT4m11,0,1,96,98) | sys(vKTT4m11).
compute m263=concat("vKTT4m11=",string(vKTT4m11,f2)).
compute p263="vKTT4m11為不合理值或遺漏值".
Compute s263=2.
end if.
Exec.


*vKTT4m12=0,1 96,98  .
do if not range(vKTT4m12,0,1,96,98) | sys(vKTT4m12).
compute m264=concat("vKTT4m12=",string(vKTT4m12,f2)).
compute p264="vKTT4m12為不合理值或遺漏值".
Compute s264=2.
end if.
Exec.


*vKTT4m13=0,1 96,98  .
do if not range(vKTT4m13,0,1,96,98) | sys(vKTT4m13).
compute m265=concat("vKTT4m13=",string(vKTT4m13,f2)).
compute p265="vKTT4m13為不合理值或遺漏值".
Compute s265=2.
end if.
Exec.


*vKTT4m14=0,1 96,98  .
do if not range(vKTT4m14,0,1,96,98) | sys(vKTT4m14).
compute m266=concat("vKTT4m14=",string(vKTT4m14,f2)).
compute p266="vKTT4m14為不合理值或遺漏值".
Compute s266=2.
end if.
Exec.


*vKTT4m88=0,1 96,98  .
do if not range(vKTT4m88,0,1,96,98) | sys(vKTT4m88).
compute m267=concat("vKTT4m88=",string(vKTT4m88,f2)).
compute p267="vKTT4m88為不合理值或遺漏值".
Compute s267=2.
end if.
Exec.


*vKTT5m01=0,1 96,98  .
do if not range(vKTT5m01,0,1,96,98) | sys(vKTT5m01).
compute m268=concat("vKTT5m01=",string(vKTT5m01,f2)).
compute p268="vKTT5m01為不合理值或遺漏值".
Compute s268=2.
end if.
Exec.


*vKTT5m02=0,1 96,98  .
do if not range(vKTT5m02,0,1,96,98) | sys(vKTT5m02).
compute m269=concat("vKTT5m02=",string(vKTT5m02,f2)).
compute p269="vKTT5m02為不合理值或遺漏值".
Compute s269=2.
end if.
Exec.


*vKTT5m03=0,1 96,98  .
do if not range(vKTT5m03,0,1,96,98) | sys(vKTT5m03).
compute m270=concat("vKTT5m03=",string(vKTT5m03,f2)).
compute p270="vKTT5m03為不合理值或遺漏值".
Compute s270=2.
end if.
Exec.


*vKTT5m04=0,1 96,98  .
do if not range(vKTT5m04,0,1,96,98) | sys(vKTT5m04).
compute m271=concat("vKTT5m04=",string(vKTT5m04,f2)).
compute p271="vKTT5m04為不合理值或遺漏值".
Compute s271=2.
end if.
Exec.


*vKTT5m05=0,1 96,98  .
do if not range(vKTT5m05,0,1,96,98) | sys(vKTT5m05).
compute m272=concat("vKTT5m05=",string(vKTT5m05,f2)).
compute p272="vKTT5m05為不合理值或遺漏值".
Compute s272=2.
end if.
Exec.


*vKTT5m06=0,1 96,98  .
do if not range(vKTT5m06,0,1,96,98) | sys(vKTT5m06).
compute m273=concat("vKTT5m06=",string(vKTT5m06,f2)).
compute p273="vKTT5m06為不合理值或遺漏值".
Compute s273=2.
end if.
Exec.


*vKTT5m07=0,1 96,98  .
do if not range(vKTT5m07,0,1,96,98) | sys(vKTT5m07).
compute m274=concat("vKTT5m07=",string(vKTT5m07,f2)).
compute p274="vKTT5m07為不合理值或遺漏值".
Compute s274=2.
end if.
Exec.


*vKTT5m08=0,1 96,98  .
do if not range(vKTT5m08,0,1,96,98) | sys(vKTT5m08).
compute m275=concat("vKTT5m08=",string(vKTT5m08,f2)).
compute p275="vKTT5m08為不合理值或遺漏值".
Compute s275=2.
end if.
Exec.


*vKTT5m09=0,1 96,98  .
do if not range(vKTT5m09,0,1,96,98) | sys(vKTT5m09).
compute m276=concat("vKTT5m09=",string(vKTT5m09,f2)).
compute p276="vKTT5m09為不合理值或遺漏值".
Compute s276=2.
end if.
Exec.


*vKTT5m10=0,1 96,98  .
do if not range(vKTT5m10,0,1,96,98) | sys(vKTT5m10).
compute m277=concat("vKTT5m10=",string(vKTT5m10,f2)).
compute p277="vKTT5m10為不合理值或遺漏值".
Compute s277=2.
end if.
Exec.


*vKTT5m11=0,1 96,98  .
do if not range(vKTT5m11,0,1,96,98) | sys(vKTT5m11).
compute m278=concat("vKTT5m11=",string(vKTT5m11,f2)).
compute p278="vKTT5m11為不合理值或遺漏值".
Compute s278=2.
end if.
Exec.


*vKTT5m12=0,1 96,98  .
do if not range(vKTT5m12,0,1,96,98) | sys(vKTT5m12).
compute m279=concat("vKTT5m12=",string(vKTT5m12,f2)).
compute p279="vKTT5m12為不合理值或遺漏值".
Compute s279=2.
end if.
Exec.


*vKTT5m88=0,1 96,98  .
do if not range(vKTT5m88,0,1,96,98) | sys(vKTT5m88).
compute m280=concat("vKTT5m88=",string(vKTT5m88,f2)).
compute p280="vKTT5m88為不合理值或遺漏值".
Compute s280=2.
end if.
Exec.


*vP5_1=0.5,1,1.5,2,2.5,3,3.5,4,4.5,5,5.5,6,6.5,7,95,9996,97,98   .
do if not any(vP5_1,0.5,1,1.5,2,2.5,3,3.5,4,4.5,5,5.5,6,6.5,7,95,9996,97,98) | sys(vP5_1).
compute m281=concat("vP5_1=",string(vP5_1,n4)).
compute p281="vP5_1為不合理值或遺漏值".
Compute s281=2.
end if.
Exec.


*vP5_2=0001,0059,0100,0159,0200,0259,0300,0359,0400,0459,0500,0559,0600,0659,0700,0759,0800,0859,0900,0959,
1000,1059,1100,1159,1200,1259,1300,1359,1400,1459,1500,1559,1600,1659,1700,1759,1800,1859,1900,1959,2000,2059,
2100,2159,2200,2259,2300,2359,99996,99996,9   .
do if not range(vP5_2,0001,0059,0100,0159,0200,0259,0300,0359,0400,0459,0500,0559,0600,0659,0700,0759,0800,0859,0900,0959,
1000,1059,1100,1159,1200,1259,1300,1359,1400,1459,1500,1559,1600,1659,1700,1759,1800,1859,1900,1959,2000,2059,
2100,2159,2200,2259,2300,2359,99996,99996,9797,9797,9898,9898) | sys(vP5_2).
compute m282=concat("vP5_2=",string(vP5_2,f5)).
compute p282="vP5_2為不合理值或遺漏值".
Compute s282=2.
end if.
Exec.


*vK3m01=0,1 96,98  .
do if not range(vK3m01,0,1,96,98) | sys(vK3m01).
compute m283=concat("vK3m01=",string(vK3m01,f2)).
compute p283="vK3m01為不合理值或遺漏值".
Compute s283=2.
end if.
Exec.


*vK3m02=0,1 96,98  .
do if not range(vK3m02,0,1,96,98) | sys(vK3m02).
compute m284=concat("vK3m02=",string(vK3m02,f2)).
compute p284="vK3m02為不合理值或遺漏值".
Compute s284=2.
end if.
Exec.


*vK3m03=0,1 96,98  .
do if not range(vK3m03,0,1,96,98) | sys(vK3m03).
compute m285=concat("vK3m03=",string(vK3m03,f2)).
compute p285="vK3m03為不合理值或遺漏值".
Compute s285=2.
end if.
Exec.


*vK3m04=0,1 96,98  .
do if not range(vK3m04,0,1,96,98) | sys(vK3m04).
compute m286=concat("vK3m04=",string(vK3m04,f2)).
compute p286="vK3m04為不合理值或遺漏值".
Compute s286=2.
end if.
Exec.


*vK3m05=0,1 96,98  .
do if not range(vK3m05,0,1,96,98) | sys(vK3m05).
compute m287=concat("vK3m05=",string(vK3m05,f2)).
compute p287="vK3m05為不合理值或遺漏值".
Compute s287=2.
end if.
Exec.


*vK3m06=0,1 96,98  .
do if not range(vK3m06,0,1,96,98) | sys(vK3m06).
compute m288=concat("vK3m06=",string(vK3m06,f2)).
compute p288="vK3m06為不合理值或遺漏值".
Compute s288=2.
end if.
Exec.


*vK3m07=0,1 96,98  .
do if not range(vK3m07,0,1,96,98) | sys(vK3m07).
compute m289=concat("vK3m07=",string(vK3m07,f2)).
compute p289="vK3m07為不合理值或遺漏值".
Compute s289=2.
end if.
Exec.


*vK3m08=0,1 96,98  .
do if not range(vK3m08,0,1,96,98) | sys(vK3m08).
compute m290=concat("vK3m08=",string(vK3m08,f2)).
compute p290="vK3m08為不合理值或遺漏值".
Compute s290=2.
end if.
Exec.


*vK3m09=0,1 96,98  .
do if not range(vK3m09,0,1,96,98) | sys(vK3m09).
compute m291=concat("vK3m09=",string(vK3m09,f2)).
compute p291="vK3m09為不合理值或遺漏值".
Compute s291=2.
end if.
Exec.


*vK3m88=0,1 96,98  .
do if not range(vK3m88,0,1,96,98) | sys(vK3m88).
compute m292=concat("vK3m88=",string(vK3m88,f2)).
compute p292="vK3m88為不合理值或遺漏值".
Compute s292=2.
end if.
Exec.


*vK3m90=0,1 96,98  .
do if not range(vK3m90,0,1,96,98) | sys(vK3m90).
compute m293=concat("vK3m90=",string(vK3m90,f2)).
compute p293="vK3m90為不合理值或遺漏值".
Compute s293=2.
end if.
Exec.


*vE18=1,4 88 96,98 .
do if not range(vE18,1,4,88,88,96,98) | sys(vE18).
compute m294=concat("vE18=",string(vE18,f2)).
compute p294="vE18為不合理值或遺漏值".
Compute s294=2.
end if.
Exec.


*vKYT1=0.5,1,1.5,2,2.5,3,3.5,4,4.5,5,5.5,6,6.5,7,95,9996,97,98   .
do if not any(vKYT1,0.5,1,1.5,2,2.5,3,3.5,4,4.5,5,5.5,6,6.5,7,95,9996,97,98) | sys(vKYT1).
compute m295=concat("vKYT1=",string(vKYT1,n4)).
compute p295="vKYT1為不合理值或遺漏值".
Compute s295=2.
end if.
Exec.


*vKYT2=0001,0059,0100,0159,0200,0259,0300,0359,0400,0459,0500,0559,0600,0659,0700,0759,0800,0859,0900,0959,
1000,1059,1100,1159,1200,1259,1300,1359,1400,1459,1500,1559,1600,1659,1700,1759,1800,1859,1900,1959,2000,2059,
2100,2159,2200,2259,2300,2359,99996,99996,9   .
do if not range(vKYT2,0001,0059,0100,0159,0200,0259,0300,0359,0400,0459,0500,0559,0600,0659,0700,0759,0800,0859,0900,0959,
1000,1059,1100,1159,1200,1259,1300,1359,1400,1459,1500,1559,1600,1659,1700,1759,1800,1859,1900,1959,2000,2059,
2100,2159,2200,2259,2300,2359,99996,99996,9797,9797,9898,9898) | sys(vKYT2).
compute m296=concat("vKYT2=",string(vKYT2,f5)).
compute p296="vKYT2為不合理值或遺漏值".
Compute s296=2.
end if.
Exec.


*vE1=1,2 97,98  .
do if not range(vE1,1,2,97,98) | sys(vE1).
compute m297=concat("vE1=",string(vE1,f2)).
compute p297="vE1為不合理值或遺漏值".
Compute s297=2.
end if.
Exec.


*vE2m01=0,1 96,98  .
do if not range(vE2m01,0,1,96,98) | sys(vE2m01).
compute m298=concat("vE2m01=",string(vE2m01,f2)).
compute p298="vE2m01為不合理值或遺漏值".
Compute s298=2.
end if.
Exec.


*vE2m02=0,1 96,98  .
do if not range(vE2m02,0,1,96,98) | sys(vE2m02).
compute m299=concat("vE2m02=",string(vE2m02,f2)).
compute p299="vE2m02為不合理值或遺漏值".
Compute s299=2.
end if.
Exec.


*vE2m03=0,1 96,98  .
do if not range(vE2m03,0,1,96,98) | sys(vE2m03).
compute m300=concat("vE2m03=",string(vE2m03,f2)).
compute p300="vE2m03為不合理值或遺漏值".
Compute s300=2.
end if.
Exec.


*vE2m04=0,1 96,98  .
do if not range(vE2m04,0,1,96,98) | sys(vE2m04).
compute m301=concat("vE2m04=",string(vE2m04,f2)).
compute p301="vE2m04為不合理值或遺漏值".
Compute s301=2.
end if.
Exec.


*vE2m88=0,1 96,98  .
do if not range(vE2m88,0,1,96,98) | sys(vE2m88).
compute m302=concat("vE2m88=",string(vE2m88,f2)).
compute p302="vE2m88為不合理值或遺漏值".
Compute s302=2.
end if.
Exec.


*vE4=0.5,1,1.5,2,2.5,3,3.5,4,4.5,5,5.5,6,6.5,7,95,9996,97,98   .
do if not any(vE4,0.5,1,1.5,2,2.5,3,3.5,4,4.5,5,5.5,6,6.5,7,95,9996,97,98) | sys(vE4).
compute m303=concat("vE4=",string(vE4,n4)).
compute p303="vE4為不合理值或遺漏值".
Compute s303=2.
end if.
Exec.


*vE5=0000,0059,0100,0159,0200,0259,0300,0359,0400,0459,0500,0559,0600,0659,0700,0759,0800,0859,0900,0959,
1000,1059,1100,1159,1200,1259,1300,1359,1400,1459,1500,1559,1600,1659,1700,1759,1800,1859,1900,1959,2000,2059,
2100,2159,2200,2259,2300,2359,99996,99996,9   .
do if not range(vE5,0000,0059,0100,0159,0200,0259,0300,0359,0400,0459,0500,0559,0600,0659,0700,0759,0800,0859,0900,0959,
1000,1059,1100,1159,1200,1259,1300,1359,1400,1459,1500,1559,1600,1659,1700,1759,1800,1859,1900,1959,2000,2059,
2100,2159,2200,2259,2300,2359,99996,99996,9797,9797,9898,9898) | sys(vE5).
compute m305=concat("vE5=",string(vE5,f5)).
compute p305="vE5為不合理值或遺漏值".
Compute s305=2.
end if.
Exec.


*vE6=0000,0059,0100,0159,0200,0259,0300,0359,0400,0459,0500,0559,0600,0659,0700,0759,0800,0859,0900,0959,
1000,1059,1100,1159,1200,1259,1300,1359,1400,1459,1500,1559,1600,1659,1700,1759,1800,1859,1900,1959,2000,2059,
2100,2159,2200,2259,2300,2359,99996,99996,9   .
do if not range(vE6,0000,0059,0100,0159,0200,0259,0300,0359,0400,0459,0500,0559,0600,0659,0700,0759,0800,0859,0900,0959,
1000,1059,1100,1159,1200,1259,1300,1359,1400,1459,1500,1559,1600,1659,1700,1759,1800,1859,1900,1959,2000,2059,
2100,2159,2200,2259,2300,2359,99996,99996,9797,9797,9898,9898) | sys(vE6).
compute m306=concat("vE6=",string(vE6,f5)).
compute p306="vE6為不合理值或遺漏值".
Compute s306=2.
end if.
Exec.


*vE7=0.5,1,1.5,2,2.5,3,3.5,4,4.5,5,5.5,6,6.5,7,95,9996,97,98   .
do if not any(vE7,0.5,1,1.5,2,2.5,3,3.5,4,4.5,5,5.5,6,6.5,7,95,9996,97,98) | sys(vE7).
compute m307=concat("vE7=",string(vE7,n4)).
compute p307="vE7為不合理值或遺漏值".
Compute s307=2.
end if.
Exec.


*vE8=0000,0059,0100,0159,0200,0259,0300,0359,0400,0459,0500,0559,0600,0659,0700,0759,0800,0859,0900,0959,
1000,1059,1100,1159,1200,1259,1300,1359,1400,1459,1500,1559,1600,1659,1700,1759,1800,1859,1900,1959,2000,2059,
2100,2159,2200,2259,2300,2359,99996,99996,9   .
do if not range(vE8,0000,0059,0100,0159,0200,0259,0300,0359,0400,0459,0500,0559,0600,0659,0700,0759,0800,0859,0900,0959,
1000,1059,1100,1159,1200,1259,1300,1359,1400,1459,1500,1559,1600,1659,1700,1759,1800,1859,1900,1959,2000,2059,
2100,2159,2200,2259,2300,2359,99996,99996,9797,9797,9898,9898) | sys(vE8).
compute m308=concat("vE8=",string(vE8,f5)).
compute p308="vE8為不合理值或遺漏值".
Compute s308=2.
end if.
Exec.


*vE9=0000,0059,0100,0159,0200,0259,0300,0359,0400,0459,0500,0559,0600,0659,0700,0759,0800,0859,0900,0959,
1000,1059,1100,1159,1200,1259,1300,1359,1400,1459,1500,1559,1600,1659,1700,1759,1800,1859,1900,1959,2000,2059,
2100,2159,2200,2259,2300,2359,99996,99996,9   .
do if not range(vE9,0000,0059,0100,0159,0200,0259,0300,0359,0400,0459,0500,0559,0600,0659,0700,0759,0800,0859,0900,0959,
1000,1059,1100,1159,1200,1259,1300,1359,1400,1459,1500,1559,1600,1659,1700,1759,1800,1859,1900,1959,2000,2059,
2100,2159,2200,2259,2300,2359,99996,99996,9797,9797,9898,9898) | sys(vE9).
compute m309=concat("vE9=",string(vE9,f5)).
compute p309="vE9為不合理值或遺漏值".
Compute s309=2.
end if.
Exec.


*vE10=0.5,1,1.5,2,2.5,3,3.5,4,4.5,5,5.5,6,6.5,7,95,9996,97,98   .
do if not any(vE10,0.5,1,1.5,2,2.5,3,3.5,4,4.5,5,5.5,6,6.5,7,95,9996,97,98) | sys(vE10).
compute m310=concat("vE10=",string(vE10,n4)).
compute p310="vE10為不合理值或遺漏值".
Compute s310=2.
end if.
Exec.


*vE11=0000,0059,0100,0159,0200,0259,0300,0359,0400,0459,0500,0559,0600,0659,0700,0759,0800,0859,0900,0959,
1000,1059,1100,1159,1200,1259,1300,1359,1400,1459,1500,1559,1600,1659,1700,1759,1800,1859,1900,1959,2000,2059,
2100,2159,2200,2259,2300,2359,99996,99996,9   .
do if not range(vE11,0000,0059,0100,0159,0200,0259,0300,0359,0400,0459,0500,0559,0600,0659,0700,0759,0800,0859,0900,0959,
1000,1059,1100,1159,1200,1259,1300,1359,1400,1459,1500,1559,1600,1659,1700,1759,1800,1859,1900,1959,2000,2059,
2100,2159,2200,2259,2300,2359,99996,99996,9797,9797,9898,9898) | sys(vE11).
compute m311=concat("vE11=",string(vE11,f5)).
compute p311="vE11為不合理值或遺漏值".
Compute s311=2.
end if.
Exec.


*vE12=0000,0059,0100,0159,0200,0259,0300,0359,0400,0459,0500,0559,0600,0659,0700,0759,0800,0859,0900,0959,
1000,1059,1100,1159,1200,1259,1300,1359,1400,1459,1500,1559,1600,1659,1700,1759,1800,1859,1900,1959,2000,2059,
2100,2159,2200,2259,2300,2359,99996,99996,9   .
do if not range(vE12,0000,0059,0100,0159,0200,0259,0300,0359,0400,0459,0500,0559,0600,0659,0700,0759,0800,0859,0900,0959,
1000,1059,1100,1159,1200,1259,1300,1359,1400,1459,1500,1559,1600,1659,1700,1759,1800,1859,1900,1959,2000,2059,
2100,2159,2200,2259,2300,2359,99996,99996,9797,9797,9898,9898) | sys(vE12).
compute m312=concat("vE12=",string(vE12,f5)).
compute p312="vE12為不合理值或遺漏值".
Compute s312=2.
end if.
Exec.


*vE3=0000,0059,0100,0159,0200,0259,0300,0359,0400,0459,0500,0559,0600,0659,0700,0759,0800,0859,0900,0959,
1000,1059,1100,1159,1200,1259,1300,1359,1400,1459,1500,1559,1600,1659,1700,1759,1800,1859,1900,1959,2000,2059,
2100,2159,2200,2259,2300,2359,99996,99996,9   .
do if not range(vE3,0000,0059,0100,0159,0200,0259,0300,0359,0400,0459,0500,0559,0600,0659,0700,0759,0800,0859,0900,0959,
1000,1059,1100,1159,1200,1259,1300,1359,1400,1459,1500,1559,1600,1659,1700,1759,1800,1859,1900,1959,2000,2059,
2100,2159,2200,2259,2300,2359,99996,99996,9797,9797,9898,9898) | sys(vE3).
compute m313=concat("vE3=",string(vE3,f5)).
compute p313="vE3為不合理值或遺漏值".
Compute s313=2.
end if.
Exec.


*vE13m01=0,1 96,98  .
do if not range(vE13m01,0,1,96,98) | sys(vE13m01).
compute m314=concat("vE13m01=",string(vE13m01,f2)).
compute p314="vE13m01為不合理值或遺漏值".
Compute s314=2.
end if.
Exec.


*vE13m02=0,1 96,98  .
do if not range(vE13m02,0,1,96,98) | sys(vE13m02).
compute m315=concat("vE13m02=",string(vE13m02,f2)).
compute p315="vE13m02為不合理值或遺漏值".
Compute s315=2.
end if.
Exec.


*vE13m03=0,1 96,98  .
do if not range(vE13m03,0,1,96,98) | sys(vE13m03).
compute m316=concat("vE13m03=",string(vE13m03,f2)).
compute p316="vE13m03為不合理值或遺漏值".
Compute s316=2.
end if.
Exec.


*vE13m04=0,1 96,98  .
do if not range(vE13m04,0,1,96,98) | sys(vE13m04).
compute m317=concat("vE13m04=",string(vE13m04,f2)).
compute p317="vE13m04為不合理值或遺漏值".
Compute s317=2.
end if.
Exec.


*vE13m05=0,1 96,98  .
do if not range(vE13m05,0,1,96,98) | sys(vE13m05).
compute m318=concat("vE13m05=",string(vE13m05,f2)).
compute p318="vE13m05為不合理值或遺漏值".
Compute s318=2.
end if.
Exec.


*vE13m06=0,1 96,98  .
do if not range(vE13m06,0,1,96,98) | sys(vE13m06).
compute m319=concat("vE13m06=",string(vE13m06,f2)).
compute p319="vE13m06為不合理值或遺漏值".
Compute s319=2.
end if.
Exec.


*vE13m88=0,1 96,98  .
do if not range(vE13m88,0,1,96,98) | sys(vE13m88).
compute m320=concat("vE13m88=",string(vE13m88,f2)).
compute p320="vE13m88為不合理值或遺漏值".
Compute s320=2.
end if.
Exec.


*vE14=0,100000,999991,999991,999997,999997,9999996,9999996   .
do if not range(vE14,0,100000,999991,999991,999997,999997,9999996,9999996) | sys(vE14).
compute m321=concat("vE14=",string(vE14,f7)).
compute p321="vE14為不合理值或遺漏值".
Compute s321=2.
end if.
Exec.


*vG7m01=0,1 96,98  .
do if not range(vG7m01,0,1,96,98) | sys(vG7m01).
compute m322=concat("vG7m01=",string(vG7m01,f2)).
compute p322="vG7m01為不合理值或遺漏值".
Compute s322=2.
end if.
Exec.


*vG7m02=0,1 96,98  .
do if not range(vG7m02,0,1,96,98) | sys(vG7m02).
compute m323=concat("vG7m02=",string(vG7m02,f2)).
compute p323="vG7m02為不合理值或遺漏值".
Compute s323=2.
end if.
Exec.


*vG7m03=0,1 96,98  .
do if not range(vG7m03,0,1,96,98) | sys(vG7m03).
compute m324=concat("vG7m03=",string(vG7m03,f2)).
compute p324="vG7m03為不合理值或遺漏值".
Compute s324=2.
end if.
Exec.


*vG7m04=0,1 96,98  .
do if not range(vG7m04,0,1,96,98) | sys(vG7m04).
compute m325=concat("vG7m04=",string(vG7m04,f2)).
compute p325="vG7m04為不合理值或遺漏值".
Compute s325=2.
end if.
Exec.


*vG7m05=0,1 96,98  .
do if not range(vG7m05,0,1,96,98) | sys(vG7m05).
compute m326=concat("vG7m05=",string(vG7m05,f2)).
compute p326="vG7m05為不合理值或遺漏值".
Compute s326=2.
end if.
Exec.


*vG7m06=0,1 96,98  .
do if not range(vG7m06,0,1,96,98) | sys(vG7m06).
compute m327=concat("vG7m06=",string(vG7m06,f2)).
compute p327="vG7m06為不合理值或遺漏值".
Compute s327=2.
end if.
Exec.


*vG7m07=0,1 96,98  .
do if not range(vG7m07,0,1,96,98) | sys(vG7m07).
compute m328=concat("vG7m07=",string(vG7m07,f2)).
compute p328="vG7m07為不合理值或遺漏值".
Compute s328=2.
end if.
Exec.


*vG7m08=0,1 96,98  .
do if not range(vG7m08,0,1,96,98) | sys(vG7m08).
compute m329=concat("vG7m08=",string(vG7m08,f2)).
compute p329="vG7m08為不合理值或遺漏值".
Compute s329=2.
end if.
Exec.


*vG7m09=0,1 96,98  .
do if not range(vG7m09,0,1,96,98) | sys(vG7m09).
compute m330=concat("vG7m09=",string(vG7m09,f2)).
compute p330="vG7m09為不合理值或遺漏值".
Compute s330=2.
end if.
Exec.


*vG7m10=0,1 96,98  .
do if not range(vG7m10,0,1,96,98) | sys(vG7m10).
compute m331=concat("vG7m10=",string(vG7m10,f2)).
compute p331="vG7m10為不合理值或遺漏值".
Compute s331=2.
end if.
Exec.


*vG7m11=0,1 96,98  .
do if not range(vG7m11,0,1,96,98) | sys(vG7m11).
compute m332=concat("vG7m11=",string(vG7m11,f2)).
compute p332="vG7m11為不合理值或遺漏值".
Compute s332=2.
end if.
Exec.


*vG7m12=0,1 96,98  .
do if not range(vG7m12,0,1,96,98) | sys(vG7m12).
compute m333=concat("vG7m12=",string(vG7m12,f2)).
compute p333="vG7m12為不合理值或遺漏值".
Compute s333=2.
end if.
Exec.


*vG7m88=0,1 96,98  .
do if not range(vG7m88,0,1,96,98) | sys(vG7m88).
compute m334=concat("vG7m88=",string(vG7m88,f2)).
compute p334="vG7m88為不合理值或遺漏值".
Compute s334=2.
end if.
Exec.


*vG7m90=0,1 96,98  .
do if not range(vG7m90,0,1,96,98) | sys(vG7m90).
compute m335=concat("vG7m90=",string(vG7m90,f2)).
compute p335="vG7m90為不合理值或遺漏值".
Compute s335=2.
end if.
Exec.


*vG8m01=0,1 96,98  .
do if not range(vG8m01,0,1,96,98) | sys(vG8m01).
compute m336=concat("vG8m01=",string(vG8m01,f2)).
compute p336="vG8m01為不合理值或遺漏值".
Compute s336=2.
end if.
Exec.


*vG8m02=0,1 96,98  .
do if not range(vG8m02,0,1,96,98) | sys(vG8m02).
compute m337=concat("vG8m02=",string(vG8m02,f2)).
compute p337="vG8m02為不合理值或遺漏值".
Compute s337=2.
end if.
Exec.


*vG8m03=0,1 96,98  .
do if not range(vG8m03,0,1,96,98) | sys(vG8m03).
compute m338=concat("vG8m03=",string(vG8m03,f2)).
compute p338="vG8m03為不合理值或遺漏值".
Compute s338=2.
end if.
Exec.


*vG8m04=0,1 96,98  .
do if not range(vG8m04,0,1,96,98) | sys(vG8m04).
compute m339=concat("vG8m04=",string(vG8m04,f2)).
compute p339="vG8m04為不合理值或遺漏值".
Compute s339=2.
end if.
Exec.


*vG8m05=0,1 96,98  .
do if not range(vG8m05,0,1,96,98) | sys(vG8m05).
compute m340=concat("vG8m05=",string(vG8m05,f2)).
compute p340="vG8m05為不合理值或遺漏值".
Compute s340=2.
end if.
Exec.


*vG8m06=0,1 96,98  .
do if not range(vG8m06,0,1,96,98) | sys(vG8m06).
compute m341=concat("vG8m06=",string(vG8m06,f2)).
compute p341="vG8m06為不合理值或遺漏值".
Compute s341=2.
end if.
Exec.


*vG8m07=0,1 96,98  .
do if not range(vG8m07,0,1,96,98) | sys(vG8m07).
compute m342=concat("vG8m07=",string(vG8m07,f2)).
compute p342="vG8m07為不合理值或遺漏值".
Compute s342=2.
end if.
Exec.


*vG8m08=0,1 96,98  .
do if not range(vG8m08,0,1,96,98) | sys(vG8m08).
compute m343=concat("vG8m08=",string(vG8m08,f2)).
compute p343="vG8m08為不合理值或遺漏值".
Compute s343=2.
end if.
Exec.


*vG8m09=0,1 96,98  .
do if not range(vG8m09,0,1,96,98) | sys(vG8m09).
compute m344=concat("vG8m09=",string(vG8m09,f2)).
compute p344="vG8m09為不合理值或遺漏值".
Compute s344=2.
end if.
Exec.


*vG8m10=0,1 96,98  .
do if not range(vG8m10,0,1,96,98) | sys(vG8m10).
compute m345=concat("vG8m10=",string(vG8m10,f2)).
compute p345="vG8m10為不合理值或遺漏值".
Compute s345=2.
end if.
Exec.


*vG8m11=0,1 96,98  .
do if not range(vG8m11,0,1,96,98) | sys(vG8m11).
compute m346=concat("vG8m11=",string(vG8m11,f2)).
compute p346="vG8m11為不合理值或遺漏值".
Compute s346=2.
end if.
Exec.


*vG8m12=0,1 96,98  .
do if not range(vG8m12,0,1,96,98) | sys(vG8m12).
compute m347=concat("vG8m12=",string(vG8m12,f2)).
compute p347="vG8m12為不合理值或遺漏值".
Compute s347=2.
end if.
Exec.


*vG8m13=0,1 96,98  .
do if not range(vG8m13,0,1,96,98) | sys(vG8m13).
compute m348=concat("vG8m13=",string(vG8m13,f2)).
compute p348="vG8m13為不合理值或遺漏值".
Compute s348=2.
end if.
Exec.


*vG8m14=0,1 96,98  .
do if not range(vG8m14,0,1,96,98) | sys(vG8m14).
compute m349=concat("vG8m14=",string(vG8m14,f2)).
compute p349="vG8m14為不合理值或遺漏值".
Compute s349=2.
end if.
Exec.


*vG8m15=0,1 96,98  .
do if not range(vG8m15,0,1,96,98) | sys(vG8m15).
compute m350=concat("vG8m15=",string(vG8m15,f2)).
compute p350="vG8m15為不合理值或遺漏值".
Compute s350=2.
end if.
Exec.


*vG8m16=0,1 96,98  .
do if not range(vG8m16,0,1,96,98) | sys(vG8m16).
compute m351=concat("vG8m16=",string(vG8m16,f2)).
compute p351="vG8m16為不合理值或遺漏值".
Compute s351=2.
end if.
Exec.


*vG8m88=0,1 96,98  .
do if not range(vG8m88,0,1,96,98) | sys(vG8m88).
compute m352=concat("vG8m88=",string(vG8m88,f2)).
compute p352="vG8m88為不合理值或遺漏值".
Compute s352=2.
end if.
Exec.


*vG8m90=0,1 96,98  .
do if not range(vG8m90,0,1,96,98) | sys(vG8m90).
compute m353=concat("vG8m90=",string(vG8m90,f2)).
compute p353="vG8m90為不合理值或遺漏值".
Compute s353=2.
end if.
Exec.


*vG9m01=0,1 96,98  .
do if not range(vG9m01,0,1,96,98) | sys(vG9m01).
compute m354=concat("vG9m01=",string(vG9m01,f2)).
compute p354="vG9m01為不合理值或遺漏值".
Compute s354=2.
end if.
Exec.


*vG9m02=0,1 96,98  .
do if not range(vG9m02,0,1,96,98) | sys(vG9m02).
compute m355=concat("vG9m02=",string(vG9m02,f2)).
compute p355="vG9m02為不合理值或遺漏值".
Compute s355=2.
end if.
Exec.


*vG9m03=0,1 96,98  .
do if not range(vG9m03,0,1,96,98) | sys(vG9m03).
compute m356=concat("vG9m03=",string(vG9m03,f2)).
compute p356="vG9m03為不合理值或遺漏值".
Compute s356=2.
end if.
Exec.


*vG9m04=0,1 96,98  .
do if not range(vG9m04,0,1,96,98) | sys(vG9m04).
compute m357=concat("vG9m04=",string(vG9m04,f2)).
compute p357="vG9m04為不合理值或遺漏值".
Compute s357=2.
end if.
Exec.


*vG9m05=0,1 96,98  .
do if not range(vG9m05,0,1,96,98) | sys(vG9m05).
compute m358=concat("vG9m05=",string(vG9m05,f2)).
compute p358="vG9m05為不合理值或遺漏值".
Compute s358=2.
end if.
Exec.


*vG9m06=0,1 96,98  .
do if not range(vG9m06,0,1,96,98) | sys(vG9m06).
compute m359=concat("vG9m06=",string(vG9m06,f2)).
compute p359="vG9m06為不合理值或遺漏值".
Compute s359=2.
end if.
Exec.


*vG9m07=0,1 96,98  .
do if not range(vG9m07,0,1,96,98) | sys(vG9m07).
compute m360=concat("vG9m07=",string(vG9m07,f2)).
compute p360="vG9m07為不合理值或遺漏值".
Compute s360=2.
end if.
Exec.


*vG9m08=0,1 96,98  .
do if not range(vG9m08,0,1,96,98) | sys(vG9m08).
compute m361=concat("vG9m08=",string(vG9m08,f2)).
compute p361="vG9m08為不合理值或遺漏值".
Compute s361=2.
end if.
Exec.


*vG9m09=0,1 96,98  .
do if not range(vG9m09,0,1,96,98) | sys(vG9m09).
compute m362=concat("vG9m09=",string(vG9m09,f2)).
compute p362="vG9m09為不合理值或遺漏值".
Compute s362=2.
end if.
Exec.


*vG9m10=0,1 96,98  .
do if not range(vG9m10,0,1,96,98) | sys(vG9m10).
compute m363=concat("vG9m10=",string(vG9m10,f2)).
compute p363="vG9m10為不合理值或遺漏值".
Compute s363=2.
end if.
Exec.


*vG9m11=0,1 96,98  .
do if not range(vG9m11,0,1,96,98) | sys(vG9m11).
compute m364=concat("vG9m11=",string(vG9m11,f2)).
compute p364="vG9m11為不合理值或遺漏值".
Compute s364=2.
end if.
Exec.


*vG9m12=0,1 96,98  .
do if not range(vG9m12,0,1,96,98) | sys(vG9m12).
compute m365=concat("vG9m12=",string(vG9m12,f2)).
compute p365="vG9m12為不合理值或遺漏值".
Compute s365=2.
end if.
Exec.


*vG9m13=0,1 96,98  .
do if not range(vG9m13,0,1,96,98) | sys(vG9m13).
compute m366=concat("vG9m13=",string(vG9m13,f2)).
compute p366="vG9m13為不合理值或遺漏值".
Compute s366=2.
end if.
Exec.


*vG9m88=0,1 96,98  .
do if not range(vG9m88,0,1,96,98) | sys(vG9m88).
compute m367=concat("vG9m88=",string(vG9m88,f2)).
compute p367="vG9m88為不合理值或遺漏值".
Compute s367=2.
end if.
Exec.


*vG9m90=0,1 96,98  .
do if not range(vG9m90,0,1,96,98) | sys(vG9m90).
compute m368=concat("vG9m90=",string(vG9m90,f2)).
compute p368="vG9m90為不合理值或遺漏值".
Compute s368=2.
end if.
Exec.


*vG10m01=0,1 96,98  .
do if not range(vG10m01,0,1,96,98) | sys(vG10m01).
compute m369=concat("vG10m01=",string(vG10m01,f2)).
compute p369="vG10m01為不合理值或遺漏值".
Compute s369=2.
end if.
Exec.


*vG10m02=0,1 96,98  .
do if not range(vG10m02,0,1,96,98) | sys(vG10m02).
compute m370=concat("vG10m02=",string(vG10m02,f2)).
compute p370="vG10m02為不合理值或遺漏值".
Compute s370=2.
end if.
Exec.


*vG10m03=0,1 96,98  .
do if not range(vG10m03,0,1,96,98) | sys(vG10m03).
compute m371=concat("vG10m03=",string(vG10m03,f2)).
compute p371="vG10m03為不合理值或遺漏值".
Compute s371=2.
end if.
Exec.


*vG10m04=0,1 96,98  .
do if not range(vG10m04,0,1,96,98) | sys(vG10m04).
compute m372=concat("vG10m04=",string(vG10m04,f2)).
compute p372="vG10m04為不合理值或遺漏值".
Compute s372=2.
end if.
Exec.


*vG10m05=0,1 96,98  .
do if not range(vG10m05,0,1,96,98) | sys(vG10m05).
compute m373=concat("vG10m05=",string(vG10m05,f2)).
compute p373="vG10m05為不合理值或遺漏值".
Compute s373=2.
end if.
Exec.


*vG10m06=0,1 96,98  .
do if not range(vG10m06,0,1,96,98) | sys(vG10m06).
compute m374=concat("vG10m06=",string(vG10m06,f2)).
compute p374="vG10m06為不合理值或遺漏值".
Compute s374=2.
end if.
Exec.


*vG10m07=0,1 96,98  .
do if not range(vG10m07,0,1,96,98) | sys(vG10m07).
compute m375=concat("vG10m07=",string(vG10m07,f2)).
compute p375="vG10m07為不合理值或遺漏值".
Compute s375=2.
end if.
Exec.


*vG10m08=0,1 96,98  .
do if not range(vG10m08,0,1,96,98) | sys(vG10m08).
compute m376=concat("vG10m08=",string(vG10m08,f2)).
compute p376="vG10m08為不合理值或遺漏值".
Compute s376=2.
end if.
Exec.


*vG10m09=0,1 96,98  .
do if not range(vG10m09,0,1,96,98) | sys(vG10m09).
compute m377=concat("vG10m09=",string(vG10m09,f2)).
compute p377="vG10m09為不合理值或遺漏值".
Compute s377=2.
end if.
Exec.


*vG10m10=0,1 96,98  .
do if not range(vG10m10,0,1,96,98) | sys(vG10m10).
compute m378=concat("vG10m10=",string(vG10m10,f2)).
compute p378="vG10m10為不合理值或遺漏值".
Compute s378=2.
end if.
Exec.


*vG10m11=0,1 96,98  .
do if not range(vG10m11,0,1,96,98) | sys(vG10m11).
compute m379=concat("vG10m11=",string(vG10m11,f2)).
compute p379="vG10m11為不合理值或遺漏值".
Compute s379=2.
end if.
Exec.


*vG10m12=0,1 96,98  .
do if not range(vG10m12,0,1,96,98) | sys(vG10m12).
compute m380=concat("vG10m12=",string(vG10m12,f2)).
compute p380="vG10m12為不合理值或遺漏值".
Compute s380=2.
end if.
Exec.


*vG10m13=0,1 96,98  .
do if not range(vG10m13,0,1,96,98) | sys(vG10m13).
compute m381=concat("vG10m13=",string(vG10m13,f2)).
compute p381="vG10m13為不合理值或遺漏值".
Compute s381=2.
end if.
Exec.


*vG10m14=0,1 96,98  .
do if not range(vG10m14,0,1,96,98) | sys(vG10m14).
compute m382=concat("vG10m14=",string(vG10m14,f2)).
compute p382="vG10m14為不合理值或遺漏值".
Compute s382=2.
end if.
Exec.


*vG10m15=0,1 96,98  .
do if not range(vG10m15,0,1,96,98) | sys(vG10m15).
compute m383=concat("vG10m15=",string(vG10m15,f2)).
compute p383="vG10m15為不合理值或遺漏值".
Compute s383=2.
end if.
Exec.


*vG10m16=0,1 96,98  .
do if not range(vG10m16,0,1,96,98) | sys(vG10m16).
compute m384=concat("vG10m16=",string(vG10m16,f2)).
compute p384="vG10m16為不合理值或遺漏值".
Compute s384=2.
end if.
Exec.


*vG10m17=0,1 96,98  .
do if not range(vG10m17,0,1,96,98) | sys(vG10m17).
compute m385=concat("vG10m17=",string(vG10m17,f2)).
compute p385="vG10m17為不合理值或遺漏值".
Compute s385=2.
end if.
Exec.


*vG10m18=0,1 96,98  .
do if not range(vG10m18,0,1,96,98) | sys(vG10m18).
compute m386=concat("vG10m18=",string(vG10m18,f2)).
compute p386="vG10m18為不合理值或遺漏值".
Compute s386=2.
end if.
Exec.


*vG10m19=0,1 96,98  .
do if not range(vG10m19,0,1,96,98) | sys(vG10m19).
compute m387=concat("vG10m19=",string(vG10m19,f2)).
compute p387="vG10m19為不合理值或遺漏值".
Compute s387=2.
end if.
Exec.


*vG10m88=0,1 96,98  .
do if not range(vG10m88,0,1,96,98) | sys(vG10m88).
compute m388=concat("vG10m88=",string(vG10m88,f2)).
compute p388="vG10m88為不合理值或遺漏值".
Compute s388=2.
end if.
Exec.


*vG10m90=0,1 96,98  .
do if not range(vG10m90,0,1,96,98) | sys(vG10m90).
compute m389=concat("vG10m90=",string(vG10m90,f2)).
compute p389="vG10m90為不合理值或遺漏值".
Compute s389=2.
end if.
Exec.


*vG11m01=0,1 96,98  .
do if not range(vG11m01,0,1,96,98) | sys(vG11m01).
compute m390=concat("vG11m01=",string(vG11m01,f2)).
compute p390="vG11m01為不合理值或遺漏值".
Compute s390=2.
end if.
Exec.


*vG11m02=0,1 96,98  .
do if not range(vG11m02,0,1,96,98) | sys(vG11m02).
compute m391=concat("vG11m02=",string(vG11m02,f2)).
compute p391="vG11m02為不合理值或遺漏值".
Compute s391=2.
end if.
Exec.


*vG11m03=0,1 96,98  .
do if not range(vG11m03,0,1,96,98) | sys(vG11m03).
compute m392=concat("vG11m03=",string(vG11m03,f2)).
compute p392="vG11m03為不合理值或遺漏值".
Compute s392=2.
end if.
Exec.


*vG11m04=0,1 96,98  .
do if not range(vG11m04,0,1,96,98) | sys(vG11m04).
compute m393=concat("vG11m04=",string(vG11m04,f2)).
compute p393="vG11m04為不合理值或遺漏值".
Compute s393=2.
end if.
Exec.


*vG11m05=0,1 96,98  .
do if not range(vG11m05,0,1,96,98) | sys(vG11m05).
compute m394=concat("vG11m05=",string(vG11m05,f2)).
compute p394="vG11m05為不合理值或遺漏值".
Compute s394=2.
end if.
Exec.


*vG11m88=0,1 96,98  .
do if not range(vG11m88,0,1,96,98) | sys(vG11m88).
compute m395=concat("vG11m88=",string(vG11m88,f2)).
compute p395="vG11m88為不合理值或遺漏值".
Compute s395=2.
end if.
Exec.


*vG11m90=0,1 96,98  .
do if not range(vG11m90,0,1,96,98) | sys(vG11m90).
compute m396=concat("vG11m90=",string(vG11m90,f2)).
compute p396="vG11m90為不合理值或遺漏值".
Compute s396=2.
end if.
Exec.


*vG4=0,0.5,1,1.5,2,2.5,3,3.5,4,4.5,5,5.5,6,6.5,7,95,9996,97,98   .
do if not any(vG4,0,0.5,1,1.5,2,2.5,3,3.5,4,4.5,5,5.5,6,6.5,7,95,9996,97,98) | sys(vG4).
compute m397=concat("vG4=",string(vG4,n4)).
compute p397="vG4為不合理值或遺漏值".
Compute s397=2.
end if.
Exec.


*vG5=0001,0059,0100,0159,0200,0259,0300,0359,0400,0459,0500,0559,0600,0659,0700,0759,0800,0859,0900,0959,
1000,1059,1100,1159,1200,1259,1300,1359,1400,1459,1500,1559,1600,1659,1700,1759,1800,1859,1900,1959,2000,2059,
2100,2159,2200,2259,2300,2359,99996,99996,9   .
do if not range(vG5,0001,0059,0100,0159,0200,0259,0300,0359,0400,0459,0500,0559,0600,0659,0700,0759,0800,0859,0900,0959,
1000,1059,1100,1159,1200,1259,1300,1359,1400,1459,1500,1559,1600,1659,1700,1759,1800,1859,1900,1959,2000,2059,
2100,2159,2200,2259,2300,2359,99996,99996,9797,9797,9898,9898) | sys(vG5).
compute m398=concat("vG5=",string(vG5,f5)).
compute p398="vG5為不合理值或遺漏值".
Compute s398=2.
end if.
Exec.


*vB1=0,0.5,1,1.5,2,2.5,3,3.5,4,4.5,5,5.5,6,6.5,7,95,9996,97,98   .
do if not any(vB1,0,0.5,1,1.5,2,2.5,3,3.5,4,4.5,5,5.5,6,6.5,7,95,9996,97,98) | sys(vB1).
compute m399=concat("vB1=",string(vB1,n4)).
compute p399="vB1為不合理值或遺漏值".
Compute s399=2.
end if.
Exec.


*vB2=0001,0059,0100,0159,0200,0259,0300,0359,0400,0459,0500,0559,0600,0659,0700,0759,0800,0859,0900,0959,
1000,1059,1100,1159,1200,1259,1300,1359,1400,1459,1500,1559,1600,1659,1700,1759,1800,1859,1900,1959,2000,2059,
2100,2159,2200,2259,2300,2359,99996,99996,9   .
do if not range(vB2,0001,0059,0100,0159,0200,0259,0300,0359,0400,0459,0500,0559,0600,0659,0700,0759,0800,0859,0900,0959,
1000,1059,1100,1159,1200,1259,1300,1359,1400,1459,1500,1559,1600,1659,1700,1759,1800,1859,1900,1959,2000,2059,
2100,2159,2200,2259,2300,2359,99996,99996,9797,9797,9898,9898)| sys(vB2).
compute m400=concat("vB2=",string(vB2,f5)).
compute p400="vB2為不合理值或遺漏值".
Compute s400=2.
end if.
Exec.


*vB3=0,0.5,1,1.5,2,2.5,3,3.5,4,4.5,5,5.5,6,6.5,7,95,9996,97,98   .
do if not any(vB3,0,0.5,1,1.5,2,2.5,3,3.5,4,4.5,5,5.5,6,6.5,7,95,9996,97,98) | sys(vB3).
compute m401=concat("vB3=",string(vB3,n4)).
compute p401="vB3為不合理值或遺漏值".
Compute s401=2.
end if.
Exec.


*vB4=0001,0059,0100,0159,0200,0259,0300,0359,0400,0459,0500,0559,0600,0659,0700,0759,0800,0859,0900,0959,
1000,1059,1100,1159,1200,1259,1300,1359,1400,1459,1500,1559,1600,1659,1700,1759,1800,1859,1900,1959,2000,2059,
2100,2159,2200,2259,2300,2359,99996,99996,9   .
do if not range(vB4,0001,0059,0100,0159,0200,0259,0300,0359,0400,0459,0500,0559,0600,0659,0700,0759,0800,0859,0900,0959,
1000,1059,1100,1159,1200,1259,1300,1359,1400,1459,1500,1559,1600,1659,1700,1759,1800,1859,1900,1959,2000,2059,
2100,2159,2200,2259,2300,2359,99996,99996,9797,9797,9898,9898) | sys(vB4).
compute m402=concat("vB4=",string(vB4,f5)).
compute p402="vB4為不合理值或遺漏值".
Compute s402=2.
end if.
Exec.


*vB5=0,0.5,1,1.5,2,2.5,3,3.5,4,4.5,5,5.5,6,6.5,7,95,9996,97,98   .
do if not any(vB5,0,0.5,1,1.5,2,2.5,3,3.5,4,4.5,5,5.5,6,6.5,7,95,9996,97,98) | sys(vB5).
compute m403=concat("vB5=",string(vB5,n4)).
compute p403="vB5為不合理值或遺漏值".
Compute s403=2.
end if.
Exec.


*vB6=0001,0059,0100,0159,0200,0259,0300,0359,0400,0459,0500,0559,0600,0659,0700,0759,0800,0859,0900,0959,
1000,1059,1100,1159,1200,1259,1300,1359,1400,1459,1500,1559,1600,1659,1700,1759,1800,1859,1900,1959,2000,2059,
2100,2159,2200,2259,2300,2359,99996,99996,9   .
do if not range(vB6,0001,0059,0100,0159,0200,0259,0300,0359,0400,0459,0500,0559,0600,0659,0700,0759,0800,0859,0900,0959,
1000,1059,1100,1159,1200,1259,1300,1359,1400,1459,1500,1559,1600,1659,1700,1759,1800,1859,1900,1959,2000,2059,
2100,2159,2200,2259,2300,2359,99996,99996,9797,9797,9898,9898) | sys(vB6).
compute m405=concat("vB6=",string(vB6,f5)).
compute p405="vB6為不合理值或遺漏值".
Compute s405=2.
end if.
Exec.


*vB7am01=0,1 96,98  .
do if not range(vB7am01,0,1,96,98) | sys(vB7am01).
compute m406=concat("vB7am01=",string(vB7am01,f2)).
compute p406="vB7am01為不合理值或遺漏值".
Compute s406=2.
end if.
Exec.


*vB7am02=0,1 96,98  .
do if not range(vB7am02,0,1,96,98) | sys(vB7am02).
compute m407=concat("vB7am02=",string(vB7am02,f2)).
compute p407="vB7am02為不合理值或遺漏值".
Compute s407=2.
end if.
Exec.


*vB7am03=0,1 96,98  .
do if not range(vB7am03,0,1,96,98) | sys(vB7am03).
compute m408=concat("vB7am03=",string(vB7am03,f2)).
compute p408="vB7am03為不合理值或遺漏值".
Compute s408=2.
end if.
Exec.


*vB7am04=0,1 96,98  .
do if not range(vB7am04,0,1,96,98) | sys(vB7am04).
compute m409=concat("vB7am04=",string(vB7am04,f2)).
compute p409="vB7am04為不合理值或遺漏值".
Compute s409=2.
end if.
Exec.


*vB7am05=0,1 96,98  .
do if not range(vB7am05,0,1,96,98) | sys(vB7am05).
compute m410=concat("vB7am05=",string(vB7am05,f2)).
compute p410="vB7am05為不合理值或遺漏值".
Compute s410=2.
end if.
Exec.


*vB7am06=0,1 96,98  .
do if not range(vB7am06,0,1,96,98) | sys(vB7am06).
compute m411=concat("vB7am06=",string(vB7am06,f2)).
compute p411="vB7am06為不合理值或遺漏值".
Compute s411=2.
end if.
Exec.


*vB7am07=0,1 96,98  .
do if not range(vB7am07,0,1,96,98) | sys(vB7am07).
compute m412=concat("vB7am07=",string(vB7am07,f2)).
compute p412="vB7am07為不合理值或遺漏值".
Compute s412=2.
end if.
Exec.


*vB7am08=0,1 96,98  .
do if not range(vB7am08,0,1,96,98) | sys(vB7am08).
compute m413=concat("vB7am08=",string(vB7am08,f2)).
compute p413="vB7am08為不合理值或遺漏值".
Compute s413=2.
end if.
Exec.


*vB7am09=0,1 96,98  .
do if not range(vB7am09,0,1,96,98) | sys(vB7am09).
compute m414=concat("vB7am09=",string(vB7am09,f2)).
compute p414="vB7am09為不合理值或遺漏值".
Compute s414=2.
end if.
Exec.


*vB7am10=0,1 96,98  .
do if not range(vB7am10,0,1,96,98) | sys(vB7am10).
compute m415=concat("vB7am10=",string(vB7am10,f2)).
compute p415="vB7am10為不合理值或遺漏值".
Compute s415=2.
end if.
Exec.


*vB7am11=0,1 96,98  .
do if not range(vB7am11,0,1,96,98) | sys(vB7am11).
compute m416=concat("vB7am11=",string(vB7am11,f2)).
compute p416="vB7am11為不合理值或遺漏值".
Compute s416=2.
end if.
Exec.


*vB7am12=0,1 96,98  .
do if not range(vB7am12,0,1,96,98) | sys(vB7am12).
compute m417=concat("vB7am12=",string(vB7am12,f2)).
compute p417="vB7am12為不合理值或遺漏值".
Compute s417=2.
end if.
Exec.


*vB7am13=0,1 96,98  .
do if not range(vB7am13,0,1,96,98) | sys(vB7am13).
compute m418=concat("vB7am13=",string(vB7am13,f2)).
compute p418="vB7am13為不合理值或遺漏值".
Compute s418=2.
end if.
Exec.


*vB7am14=0,1 96,98  .
do if not range(vB7am14,0,1,96,98) | sys(vB7am14).
compute m419=concat("vB7am14=",string(vB7am14,f2)).
compute p419="vB7am14為不合理值或遺漏值".
Compute s419=2.
end if.
Exec.


*vB7am15=0,1 96,98  .
do if not range(vB7am15,0,1,96,98) | sys(vB7am15).
compute m420=concat("vB7am15=",string(vB7am15,f2)).
compute p420="vB7am15為不合理值或遺漏值".
Compute s420=2.
end if.
Exec.


*vB7am16=0,1 96,98  .
do if not range(vB7am16,0,1,96,98) | sys(vB7am16).
compute m421=concat("vB7am16=",string(vB7am16,f2)).
compute p421="vB7am16為不合理值或遺漏值".
Compute s421=2.
end if.
Exec.


*vB7am17=0,1 96,98  .
do if not range(vB7am17,0,1,96,98) | sys(vB7am17).
compute m422=concat("vB7am17=",string(vB7am17,f2)).
compute p422="vB7am17為不合理值或遺漏值".
Compute s422=2.
end if.
Exec.


*vB7am18=0,1 96,98  .
do if not range(vB7am18,0,1,96,98) | sys(vB7am18).
compute m423=concat("vB7am18=",string(vB7am18,f2)).
compute p423="vB7am18為不合理值或遺漏值".
Compute s423=2.
end if.
Exec.


*vB7am19=0,1 96,98  .
do if not range(vB7am19,0,1,96,98) | sys(vB7am19).
compute m424=concat("vB7am19=",string(vB7am19,f2)).
compute p424="vB7am19為不合理值或遺漏值".
Compute s424=2.
end if.
Exec.


*vB7am20=0,1 96,98  .
do if not range(vB7am20,0,1,96,98) | sys(vB7am20).
compute m425=concat("vB7am20=",string(vB7am20,f2)).
compute p425="vB7am20為不合理值或遺漏值".
Compute s425=2.
end if.
Exec.


*vB7am21=0,1 96,98  .
do if not range(vB7am21,0,1,96,98) | sys(vB7am21).
compute m426=concat("vB7am21=",string(vB7am21,f2)).
compute p426="vB7am21為不合理值或遺漏值".
Compute s426=2.
end if.
Exec.


*vB7am22=0,1 96,98  .
do if not range(vB7am22,0,1,96,98) | sys(vB7am22).
compute m427=concat("vB7am22=",string(vB7am22,f2)).
compute p427="vB7am22為不合理值或遺漏值".
Compute s427=2.
end if.
Exec.


*vB7am23=0,1 96,98  .
do if not range(vB7am23,0,1,96,98) | sys(vB7am23).
compute m428=concat("vB7am23=",string(vB7am23,f2)).
compute p428="vB7am23為不合理值或遺漏值".
Compute s428=2.
end if.
Exec.


*vB7am24=0,1 96,98  .
do if not range(vB7am24,0,1,96,98) | sys(vB7am24).
compute m429=concat("vB7am24=",string(vB7am24,f2)).
compute p429="vB7am24為不合理值或遺漏值".
Compute s429=2.
end if.
Exec.


*vB7am25=0,1 96,98  .
do if not range(vB7am25,0,1,96,98) | sys(vB7am25).
compute m430=concat("vB7am25=",string(vB7am25,f2)).
compute p430="vB7am25為不合理值或遺漏值".
Compute s430=2.
end if.
Exec.


*vB7am26=0,1 96,98  .
do if not range(vB7am26,0,1,96,98) | sys(vB7am26).
compute m431=concat("vB7am26=",string(vB7am26,f2)).
compute p431="vB7am26為不合理值或遺漏值".
Compute s431=2.
end if.
Exec.


*vB7am27=0,1 96,98  .
do if not range(vB7am27,0,1,96,98) | sys(vB7am27).
compute m432=concat("vB7am27=",string(vB7am27,f2)).
compute p432="vB7am27為不合理值或遺漏值".
Compute s432=2.
end if.
Exec.


*vB7am28=0,1 96,98  .
do if not range(vB7am28,0,1,96,98) | sys(vB7am28).
compute m433=concat("vB7am28=",string(vB7am28,f2)).
compute p433="vB7am28為不合理值或遺漏值".
Compute s433=2.
end if.
Exec.


*vB7am29=0,1 96,98  .
do if not range(vB7am29,0,1,96,98) | sys(vB7am29).
compute m434=concat("vB7am29=",string(vB7am29,f2)).
compute p434="vB7am29為不合理值或遺漏值".
Compute s434=2.
end if.
Exec.


*vB7am30=0,1 96,98  .
do if not range(vB7am30,0,1,96,98) | sys(vB7am30).
compute m435=concat("vB7am30=",string(vB7am30,f2)).
compute p435="vB7am30為不合理值或遺漏值".
Compute s435=2.
end if.
Exec.


*vB7am31=0,1 96,98  .
do if not range(vB7am31,0,1,96,98) | sys(vB7am31).
compute m436=concat("vB7am31=",string(vB7am31,f2)).
compute p436="vB7am31為不合理值或遺漏值".
Compute s436=2.
end if.
Exec.


*vB7am32=0,1 96,98  .
do if not range(vB7am32,0,1,96,98) | sys(vB7am32).
compute m437=concat("vB7am32=",string(vB7am32,f2)).
compute p437="vB7am32為不合理值或遺漏值".
Compute s437=2.
end if.
Exec.


*vB7am33=0,1 96,98  .
do if not range(vB7am33,0,1,96,98) | sys(vB7am33).
compute m438=concat("vB7am33=",string(vB7am33,f2)).
compute p438="vB7am33為不合理值或遺漏值".
Compute s438=2.
end if.
Exec.


*vB7am34=0,1 96,98  .
do if not range(vB7am34,0,1,96,98) | sys(vB7am34).
compute m439=concat("vB7am34=",string(vB7am34,f2)).
compute p439="vB7am34為不合理值或遺漏值".
Compute s439=2.
end if.
Exec.


*vB7am35=0,1 96,98  .
do if not range(vB7am35,0,1,96,98) | sys(vB7am35).
compute m440=concat("vB7am35=",string(vB7am35,f2)).
compute p440="vB7am35為不合理值或遺漏值".
Compute s440=2.
end if.
Exec.


*vB7am36=0,1 96,98  .
do if not range(vB7am36,0,1,96,98) | sys(vB7am36).
compute m441=concat("vB7am36=",string(vB7am36,f2)).
compute p441="vB7am36為不合理值或遺漏值".
Compute s441=2.
end if.
Exec.


*vB7am37=0,1 96,98  .
do if not range(vB7am37,0,1,96,98) | sys(vB7am37).
compute m442=concat("vB7am37=",string(vB7am37,f2)).
compute p442="vB7am37為不合理值或遺漏值".
Compute s442=2.
end if.
Exec.


*vB7am38=0,1 96,98  .
do if not range(vB7am38,0,1,96,98) | sys(vB7am38).
compute m443=concat("vB7am38=",string(vB7am38,f2)).
compute p443="vB7am38為不合理值或遺漏值".
Compute s443=2.
end if.
Exec.


*vB7am39=0,1 96,98  .
do if not range(vB7am39,0,1,96,98) | sys(vB7am39).
compute m444=concat("vB7am39=",string(vB7am39,f2)).
compute p444="vB7am39為不合理值或遺漏值".
Compute s444=2.
end if.
Exec.


*vB7am40=0,1 96,98  .
do if not range(vB7am40,0,1,96,98) | sys(vB7am40).
compute m445=concat("vB7am40=",string(vB7am40,f2)).
compute p445="vB7am40為不合理值或遺漏值".
Compute s445=2.
end if.
Exec.


*vB7am41=0,1 96,98  .
do if not range(vB7am41,0,1,96,98) | sys(vB7am41).
compute m446=concat("vB7am41=",string(vB7am41,f2)).
compute p446="vB7am41為不合理值或遺漏值".
Compute s446=2.
end if.
Exec.


*vB7am42=0,1 96,98  .
do if not range(vB7am42,0,1,96,98) | sys(vB7am42).
compute m447=concat("vB7am42=",string(vB7am42,f2)).
compute p447="vB7am42為不合理值或遺漏值".
Compute s447=2.
end if.
Exec.


*vB7am43=0,1 96,98  .
do if not range(vB7am43,0,1,96,98) | sys(vB7am43).
compute m448=concat("vB7am43=",string(vB7am43,f2)).
compute p448="vB7am43為不合理值或遺漏值".
Compute s448=2.
end if.
Exec.


*vB7am44=0,1 96,98  .
do if not range(vB7am44,0,1,96,98) | sys(vB7am44).
compute m449=concat("vB7am44=",string(vB7am44,f2)).
compute p449="vB7am44為不合理值或遺漏值".
Compute s449=2.
end if.
Exec.


*vB7am45=0,1 96,98  .
do if not range(vB7am45,0,1,96,98) | sys(vB7am45).
compute m450=concat("vB7am45=",string(vB7am45,f2)).
compute p450="vB7am45為不合理值或遺漏值".
Compute s450=2.
end if.
Exec.


*vB7am46=0,1 96,98  .
do if not range(vB7am46,0,1,96,98) | sys(vB7am46).
compute m451=concat("vB7am46=",string(vB7am46,f2)).
compute p451="vB7am46為不合理值或遺漏值".
Compute s451=2.
end if.
Exec.


*vB7am47=0,1 96,98  .
do if not range(vB7am47,0,1,96,98) | sys(vB7am47).
compute m452=concat("vB7am47=",string(vB7am47,f2)).
compute p452="vB7am47為不合理值或遺漏值".
Compute s452=2.
end if.
Exec.


*vB7am48=0,1 96,98  .
do if not range(vB7am48,0,1,96,98) | sys(vB7am48).
compute m453=concat("vB7am48=",string(vB7am48,f2)).
compute p453="vB7am48為不合理值或遺漏值".
Compute s453=2.
end if.
Exec.


*vB7am49=0,1 96,98  .
do if not range(vB7am49,0,1,96,98) | sys(vB7am49).
compute m454=concat("vB7am49=",string(vB7am49,f2)).
compute p454="vB7am49為不合理值或遺漏值".
Compute s454=2.
end if.
Exec.


*vB7am50=0,1 96,98  .
do if not range(vB7am50,0,1,96,98) | sys(vB7am50).
compute m455=concat("vB7am50=",string(vB7am50,f2)).
compute p455="vB7am50為不合理值或遺漏值".
Compute s455=2.
end if.
Exec.


*vB7am51=0,1 96,98  .
do if not range(vB7am51,0,1,96,98) | sys(vB7am51).
compute m456=concat("vB7am51=",string(vB7am51,f2)).
compute p456="vB7am51為不合理值或遺漏值".
Compute s456=2.
end if.
Exec.


*vB7am52=0,1 96,98  .
do if not range(vB7am52,0,1,96,98) | sys(vB7am52).
compute m457=concat("vB7am52=",string(vB7am52,f2)).
compute p457="vB7am52為不合理值或遺漏值".
Compute s457=2.
end if.
Exec.


*vB7am53=0,1 96,98  .
do if not range(vB7am53,0,1,96,98) | sys(vB7am53).
compute m458=concat("vB7am53=",string(vB7am53,f2)).
compute p458="vB7am53為不合理值或遺漏值".
Compute s458=2.
end if.
Exec.


*vB7am54=0,1 96,98  .
do if not range(vB7am54,0,1,96,98) | sys(vB7am54).
compute m459=concat("vB7am54=",string(vB7am54,f2)).
compute p459="vB7am54為不合理值或遺漏值".
Compute s459=2.
end if.
Exec.


*vB7am88=0,1 96,98  .
do if not range(vB7am88,0,1,96,98) | sys(vB7am88).
compute m460=concat("vB7am88=",string(vB7am88,f2)).
compute p460="vB7am88為不合理值或遺漏值".
Compute s460=2.
end if.
Exec.


*vB7=1,54 88 95,98 .
do if not range(vB7,1,54,88,88,95,98) | sys(vB7).
compute m461=concat("vB7=",string(vB7,f2)).
compute p461="vB7為不合理值或遺漏值".
Compute s461=2.
end if.
Exec.


*vB8m01=0,1 96,98  .
do if not range(vB8m01,0,1,96,98) | sys(vB8m01).
compute m462=concat("vB8m01=",string(vB8m01,f2)).
compute p462="vB8m01為不合理值或遺漏值".
Compute s462=2.
end if.
Exec.


*vB8m02=0,1 96,98  .
do if not range(vB8m02,0,1,96,98) | sys(vB8m02).
compute m463=concat("vB8m02=",string(vB8m02,f2)).
compute p463="vB8m02為不合理值或遺漏值".
Compute s463=2.
end if.
Exec.


*vB8m03=0,1 96,98  .
do if not range(vB8m03,0,1,96,98) | sys(vB8m03).
compute m464=concat("vB8m03=",string(vB8m03,f2)).
compute p464="vB8m03為不合理值或遺漏值".
Compute s464=2.
end if.
Exec.


*vB8m04=0,1 96,98  .
do if not range(vB8m04,0,1,96,98) | sys(vB8m04).
compute m465=concat("vB8m04=",string(vB8m04,f2)).
compute p465="vB8m04為不合理值或遺漏值".
Compute s465=2.
end if.
Exec.


*vB8m05=0,1 96,98  .
do if not range(vB8m05,0,1,96,98) | sys(vB8m05).
compute m466=concat("vB8m05=",string(vB8m05,f2)).
compute p466="vB8m05為不合理值或遺漏值".
Compute s466=2.
end if.
Exec.


*vB8m06=0,1 96,98  .
do if not range(vB8m06,0,1,96,98) | sys(vB8m06).
compute m467=concat("vB8m06=",string(vB8m06,f2)).
compute p467="vB8m06為不合理值或遺漏值".
Compute s467=2.
end if.
Exec.


*vB8m07=0,1 96,98  .
do if not range(vB8m07,0,1,96,98) | sys(vB8m07).
compute m468=concat("vB8m07=",string(vB8m07,f2)).
compute p468="vB8m07為不合理值或遺漏值".
Compute s468=2.
end if.
Exec.


*vB8m08=0,1 96,98  .
do if not range(vB8m08,0,1,96,98) | sys(vB8m08).
compute m469=concat("vB8m08=",string(vB8m08,f2)).
compute p469="vB8m08為不合理值或遺漏值".
Compute s469=2.
end if.
Exec.


*vB8m09=0,1 96,98  .
do if not range(vB8m09,0,1,96,98) | sys(vB8m09).
compute m470=concat("vB8m09=",string(vB8m09,f2)).
compute p470="vB8m09為不合理值或遺漏值".
Compute s470=2.
end if.
Exec.


*vB8m10=0,1 96,98  .
do if not range(vB8m10,0,1,96,98) | sys(vB8m10).
compute m471=concat("vB8m10=",string(vB8m10,f2)).
compute p471="vB8m10為不合理值或遺漏值".
Compute s471=2.
end if.
Exec.


*vB8m88=0,1 96,98  .
do if not range(vB8m88,0,1,96,98) | sys(vB8m88).
compute m472=concat("vB8m88=",string(vB8m88,f2)).
compute p472="vB8m88為不合理值或遺漏值".
Compute s472=2.
end if.
Exec.


*vI1=0,0.5,1,1.5,2,2.5,3,3.5,4,4.5,5,5.5,6,6.5,7,95,9996,97,98   .
do if not any(vI1,0,0.5,1,1.5,2,2.5,3,3.5,4,4.5,5,5.5,6,6.5,7,95,9996,97,98) | sys(vI1).
compute m473=concat("vI1=",string(vI1,n4)).
compute p473="vI1為不合理值或遺漏值".
Compute s473=2.
end if.
Exec.


*vI2=0001,0059,0100,0159,0200,0259,0300,0359,0400,0459,0500,0559,0600,0659,0700,0759,0800,0859,0900,0959,
1000,1059,1100,1159,1200,1259,1300,1359,1400,1459,1500,1559,1600,1659,1700,1759,1800,1859,1900,1959,2000,2059,
2100,2159,2200,2259,2300,2359,99996,99996,9   .
do if not range(vI2,0001,0059,0100,0159,0200,0259,0300,0359,0400,0459,0500,0559,0600,0659,0700,0759,0800,0859,0900,0959,
1000,1059,1100,1159,1200,1259,1300,1359,1400,1459,1500,1559,1600,1659,1700,1759,1800,1859,1900,1959,2000,2059,
2100,2159,2200,2259,2300,2359,99996,99996,9797,9797,9898,9898) | sys(vI2).
compute m474=concat("vI2=",string(vI2,f5)).
compute p474="vI2為不合理值或遺漏值".
Compute s474=2.
end if.
Exec.


*vI3=0,0.5,1,1.5,2,2.5,3,3.5,4,4.5,5,5.5,6,6.5,7,95,9996,97,98   .
do if not any(vI3,0,0.5,1,1.5,2,2.5,3,3.5,4,4.5,5,5.5,6,6.5,7,95,9996,97,98) | sys(vI3).
compute m475=concat("vI3=",string(vI3,n4)).
compute p475="vI3為不合理值或遺漏值".
Compute s475=2.
end if.
Exec.


*vI4=0001,0059,0100,0159,0200,0259,0300,0359,0400,0459,0500,0559,0600,0659,0700,0759,0800,0859,0900,0959,
1000,1059,1100,1159,1200,1259,1300,1359,1400,1459,1500,1559,1600,1659,1700,1759,1800,1859,1900,1959,2000,2059,
2100,2159,2200,2259,2300,2359,99996,99996,9   .
do if not range(vI4,0001,0059,0100,0159,0200,0259,0300,0359,0400,0459,0500,0559,0600,0659,0700,0759,0800,0859,0900,0959,
1000,1059,1100,1159,1200,1259,1300,1359,1400,1459,1500,1559,1600,1659,1700,1759,1800,1859,1900,1959,2000,2059,
2100,2159,2200,2259,2300,2359,99996,99996,9797,9797,9898,9898) | sys(vI4).
compute m476=concat("vI4=",string(vI4,f5)).
compute p476="vI4為不合理值或遺漏值".
Compute s476=2.
end if.
Exec.


*vG1=0,0.5,1,1.5,2,2.5,3,3.5,4,4.5,5,5.5,6,6.5,7,95,9996,97,98   .
do if not any(vG1,0,0.5,1,1.5,2,2.5,3,3.5,4,4.5,5,5.5,6,6.5,7,95,9996,97,98) | sys(vG1).
compute m478=concat("vG1=",string(vG1,n4)).
compute p478="vG1為不合理值或遺漏值".
Compute s478=2.
end if.
Exec.


*vG2=0001,0059,0100,0159,0200,0259,0300,0359,0400,0459,0500,0559,0600,0659,0700,0759,0800,0859,0900,0959,
1000,1059,1100,1159,1200,1259,1300,1359,1400,1459,1500,1559,1600,1659,1700,1759,1800,1859,1900,1959,2000,2059,
2100,2159,2200,2259,2300,2359,99996,99996,9   .
do if not range(vG2,0001,0059,0100,0159,0200,0259,0300,0359,0400,0459,0500,0559,0600,0659,0700,0759,0800,0859,0900,0959,
1000,1059,1100,1159,1200,1259,1300,1359,1400,1459,1500,1559,1600,1659,1700,1759,1800,1859,1900,1959,2000,2059,
2100,2159,2200,2259,2300,2359,99996,99996,9797,9797,9898,9898) | sys(vG2).
compute m479=concat("vG2=",string(vG2,f5)).
compute p479="vG2為不合理值或遺漏值".
Compute s479=2.
end if.
Exec.


*vG3m01=0,1 96,98  .
do if not range(vG3m01,0,1,96,98) | sys(vG3m01).
compute m480=concat("vG3m01=",string(vG3m01,f2)).
compute p480="vG3m01為不合理值或遺漏值".
Compute s480=2.
end if.
Exec.


*vG3m02=0,1 96,98  .
do if not range(vG3m02,0,1,96,98) | sys(vG3m02).
compute m481=concat("vG3m02=",string(vG3m02,f2)).
compute p481="vG3m02為不合理值或遺漏值".
Compute s481=2.
end if.
Exec.


*vG3m03=0,1 96,98  .
do if not range(vG3m03,0,1,96,98) | sys(vG3m03).
compute m482=concat("vG3m03=",string(vG3m03,f2)).
compute p482="vG3m03為不合理值或遺漏值".
Compute s482=2.
end if.
Exec.


*vG3m04=0,1 96,98  .
do if not range(vG3m04,0,1,96,98) | sys(vG3m04).
compute m483=concat("vG3m04=",string(vG3m04,f2)).
compute p483="vG3m04為不合理值或遺漏值".
Compute s483=2.
end if.
Exec.


*vG3m05=0,1 96,98  .
do if not range(vG3m05,0,1,96,98) | sys(vG3m05).
compute m484=concat("vG3m05=",string(vG3m05,f2)).
compute p484="vG3m05為不合理值或遺漏值".
Compute s484=2.
end if.
Exec.


*vG3m06=0,1 96,98  .
do if not range(vG3m06,0,1,96,98) | sys(vG3m06).
compute m485=concat("vG3m06=",string(vG3m06,f2)).
compute p485="vG3m06為不合理值或遺漏值".
Compute s485=2.
end if.
Exec.


*vG3m07=0,1 96,98  .
do if not range(vG3m07,0,1,96,98) | sys(vG3m07).
compute m486=concat("vG3m07=",string(vG3m07,f2)).
compute p486="vG3m07為不合理值或遺漏值".
Compute s486=2.
end if.
Exec.


*vG3m08=0,1 96,98  .
do if not range(vG3m08,0,1,96,98) | sys(vG3m08).
compute m487=concat("vG3m08=",string(vG3m08,f2)).
compute p487="vG3m08為不合理值或遺漏值".
Compute s487=2.
end if.
Exec.


*vG3m09=0,1 96,98  .
do if not range(vG3m09,0,1,96,98) | sys(vG3m09).
compute m488=concat("vG3m09=",string(vG3m09,f2)).
compute p488="vG3m09為不合理值或遺漏值".
Compute s488=2.
end if.
Exec.


*vG3m10=0,1 96,98  .
do if not range(vG3m10,0,1,96,98) | sys(vG3m10).
compute m489=concat("vG3m10=",string(vG3m10,f2)).
compute p489="vG3m10為不合理值或遺漏值".
Compute s489=2.
end if.
Exec.


*vG3m11=0,1 96,98  .
do if not range(vG3m11,0,1,96,98) | sys(vG3m11).
compute m490=concat("vG3m11=",string(vG3m11,f2)).
compute p490="vG3m11為不合理值或遺漏值".
Compute s490=2.
end if.
Exec.


*vG3m12=0,1 96,98  .
do if not range(vG3m12,0,1,96,98) | sys(vG3m12).
compute m491=concat("vG3m12=",string(vG3m12,f2)).
compute p491="vG3m12為不合理值或遺漏值".
Compute s491=2.
end if.
Exec.


*vG3m13=0,1 96,98  .
do if not range(vG3m13,0,1,96,98) | sys(vG3m13).
compute m492=concat("vG3m13=",string(vG3m13,f2)).
compute p492="vG3m13為不合理值或遺漏值".
Compute s492=2.
end if.
Exec.


*vG3m14=0,1 96,98  .
do if not range(vG3m14,0,1,96,98) | sys(vG3m14).
compute m493=concat("vG3m14=",string(vG3m14,f2)).
compute p493="vG3m14為不合理值或遺漏值".
Compute s493=2.
end if.
Exec.


*vG3m15=0,1 96,98  .
do if not range(vG3m15,0,1,96,98) | sys(vG3m15).
compute m494=concat("vG3m15=",string(vG3m15,f2)).
compute p494="vG3m15為不合理值或遺漏值".
Compute s494=2.
end if.
Exec.


*vG3m16=0,1 96,98  .
do if not range(vG3m16,0,1,96,98) | sys(vG3m16).
compute m495=concat("vG3m16=",string(vG3m16,f2)).
compute p495="vG3m16為不合理值或遺漏值".
Compute s495=2.
end if.
Exec.


*vG3m18=0,1 96,98  .
do if not range(vG3m18,0,1,96,98) | sys(vG3m18).
compute m496=concat("vG3m18=",string(vG3m18,f2)).
compute p496="vG3m18為不合理值或遺漏值".
Compute s496=2.
end if.
Exec.


*vG3m19=0,1 96,98  .
do if not range(vG3m19,0,1,96,98) | sys(vG3m19).
compute m497=concat("vG3m19=",string(vG3m19,f2)).
compute p497="vG3m19為不合理值或遺漏值".
Compute s497=2.
end if.
Exec.


*vG3m20=0,1 96,98  .
do if not range(vG3m20,0,1,96,98) | sys(vG3m20).
compute m498=concat("vG3m20=",string(vG3m20,f2)).
compute p498="vG3m20為不合理值或遺漏值".
Compute s498=2.
end if.
Exec.


*vG3m21=0,1 96,98  .
do if not range(vG3m21,0,1,96,98) | sys(vG3m21).
compute m499=concat("vG3m21=",string(vG3m21,f2)).
compute p499="vG3m21為不合理值或遺漏值".
Compute s499=2.
end if.
Exec.


*vG3m22=0,1 96,98  .
do if not range(vG3m22,0,1,96,98) | sys(vG3m22).
compute m500=concat("vG3m22=",string(vG3m22,f2)).
compute p500="vG3m22為不合理值或遺漏值".
Compute s500=2.
end if.
Exec.


*vG3m23=0,1 96,98  .
do if not range(vG3m23,0,1,96,98) | sys(vG3m23).
compute m501=concat("vG3m23=",string(vG3m23,f2)).
compute p501="vG3m23為不合理值或遺漏值".
Compute s501=2.
end if.
Exec.


*vG3m24=0,1 96,98  .
do if not range(vG3m24,0,1,96,98) | sys(vG3m24).
compute m502=concat("vG3m24=",string(vG3m24,f2)).
compute p502="vG3m24為不合理值或遺漏值".
Compute s502=2.
end if.
Exec.


*vG3m25=0,1 96,98  .
do if not range(vG3m25,0,1,96,98) | sys(vG3m25).
compute m503=concat("vG3m25=",string(vG3m25,f2)).
compute p503="vG3m25為不合理值或遺漏值".
Compute s503=2.
end if.
Exec.


*vG3m26=0,1 96,98  .
do if not range(vG3m26,0,1,96,98) | sys(vG3m26).
compute m504=concat("vG3m26=",string(vG3m26,f2)).
compute p504="vG3m26為不合理值或遺漏值".
Compute s504=2.
end if.
Exec.


*vG3m27=0,1 96,98  .
do if not range(vG3m27,0,1,96,98) | sys(vG3m27).
compute m505=concat("vG3m27=",string(vG3m27,f2)).
compute p505="vG3m27為不合理值或遺漏值".
Compute s505=2.
end if.
Exec.


*vG3m28=0,1 96,98  .
do if not range(vG3m28,0,1,96,98) | sys(vG3m28).
compute m506=concat("vG3m28=",string(vG3m28,f2)).
compute p506="vG3m28為不合理值或遺漏值".
Compute s506=2.
end if.
Exec.


*vG3m29=0,1 96,98  .
do if not range(vG3m29,0,1,96,98) | sys(vG3m29).
compute m507=concat("vG3m29=",string(vG3m29,f2)).
compute p507="vG3m29為不合理值或遺漏值".
Compute s507=2.
end if.
Exec.


*vG3m30=0,1 96,98  .
do if not range(vG3m30,0,1,96,98) | sys(vG3m30).
compute m508=concat("vG3m30=",string(vG3m30,f2)).
compute p508="vG3m30為不合理值或遺漏值".
Compute s508=2.
end if.
Exec.


*vG3m31=0,1 96,98  .
do if not range(vG3m31,0,1,96,98) | sys(vG3m31).
compute m509=concat("vG3m31=",string(vG3m31,f2)).
compute p509="vG3m31為不合理值或遺漏值".
Compute s509=2.
end if.
Exec.


*vG3m32=0,1 96,98  .
do if not range(vG3m32,0,1,96,98) | sys(vG3m32).
compute m510=concat("vG3m32=",string(vG3m32,f2)).
compute p510="vG3m32為不合理值或遺漏值".
Compute s510=2.
end if.
Exec.


*vG3m33=0,1 96,98  .
do if not range(vG3m33,0,1,96,98) | sys(vG3m33).
compute m511=concat("vG3m33=",string(vG3m33,f2)).
compute p511="vG3m33為不合理值或遺漏值".
Compute s511=2.
end if.
Exec.


*vG3m88=0,1 96,98  .
do if not range(vG3m88,0,1,96,98) | sys(vG3m88).
compute m512=concat("vG3m88=",string(vG3m88,f2)).
compute p512="vG3m88為不合理值或遺漏值".
Compute s512=2.
end if.
Exec.


*vF0=1,2 89,90 96,98 .
do if not range(vF0,1,2,89,90,96,98) | sys(vF0).
compute m513=concat("vF0=",string(vF0,f2)).
compute p513="vF0為不合理值或遺漏值".
Compute s513=2.
end if.
Exec.


*vF1=0.5,1,1.5,2,2.5,3,3.5,4,4.5,5,5.5,6,6.5,7,7.5,8,8.5,9,9.5,10,
10.5,11,11.5,12,12.5,13,13.5,14,14.5,15,15.5,16,16.5,17,17.5,18,
18.5,19,19.5,20,20.5,21,21.5,22,22.5,23,23.5,24,24.5,25,25.5,26,26.5,27,
27.5,28,28.5,29,29.5,30,30.5,31,95,97,98,99996   .
do if not any(vF1,0.5,1,1.5,2,2.5,3,3.5,4,4.5,5,5.5,6,6.5,7,7.5,8,8.5,9,9.5,10,
10.5,11,11.5,12,12.5,13,13.5,14,14.5,15,15.5,16,16.5,17,17.5,18,
18.5,19,19.5,20,20.5,21,21.5,22,22.5,23,23.5,24,24.5,25,25.5,26,26.5,27,
27.5,28,28.5,29,29.5,30,30.5,31,95,97,98,99996) | sys(vF1).
compute m514=concat("vF1=",string(vF1,n5)).
compute p514="vF1為不合理值或遺漏值".
Compute s514=2.
end if.
Exec.


*vF2=0001,0059,0100,0159,0200,0259,0300,0359,0400,0459,0500,0559,0600,0659,0700,0759,0800,0859,0900,0959,
1000,1059,1100,1159,1200,1259,1300,1359,1400,1459,1500,1559,1600,1659,1700,1759,1800,1859,1900,1959,2000,2059,
2100,2159,2200,2259,2300,2359,99996,99996,9   .
do if not range(vF2,0001,0059,0100,0159,0200,0259,0300,0359,0400,0459,0500,0559,0600,0659,0700,0759,0800,0859,0900,0959,
1000,1059,1100,1159,1200,1259,1300,1359,1400,1459,1500,1559,1600,1659,1700,1759,1800,1859,1900,1959,2000,2059,
2100,2159,2200,2259,2300,2359,99996,99996,9797,9797,9898,9898) | sys(vF2).
compute m515=concat("vF2=",string(vF2,f5)).
compute p515="vF2為不合理值或遺漏值".
Compute s515=2.
end if.
Exec.


*vF3=0.5,1,1.5,2,2.5,3,3.5,4,4.5,5,5.5,6,6.5,7,7.5,8,8.5,9,9.5,10,
10.5,11,11.5,12,12.5,13,13.5,14,14.5,15,15.5,16,16.5,17,17.5,18,
18.5,19,19.5,20,20.5,21,21.5,22,22.5,23,23.5,24,24.5,25,25.5,26,26.5,27,
27.5,28,28.5,29,29.5,30,30.5,31,95,97,98,99996   .
do if not any(vF3,0.5,1,1.5,2,2.5,3,3.5,4,4.5,5,5.5,6,6.5,7,7.5,8,8.5,9,9.5,10,
10.5,11,11.5,12,12.5,13,13.5,14,14.5,15,15.5,16,16.5,17,17.5,18,
18.5,19,19.5,20,20.5,21,21.5,22,22.5,23,23.5,24,24.5,25,25.5,26,26.5,27,
27.5,28,28.5,29,29.5,30,30.5,31,95,97,98,99996) | sys(vF3).
compute m516=concat("vF3=",string(vF3,n5)).
compute p516="vF3為不合理值或遺漏值".
Compute s516=2.
end if.
Exec.


*vF4=0001,0059,0100,0159,0200,0259,0300,0359,0400,0459,0500,0559,0600,0659,0700,0759,0800,0859,0900,0959,
1000,1059,1100,1159,1200,1259,1300,1359,1400,1459,1500,1559,1600,1659,1700,1759,1800,1859,1900,1959,2000,2059,
2100,2159,2200,2259,2300,2359,99996,99996,9   .
do if not range(vF4,0001,0059,0100,0159,0200,0259,0300,0359,0400,0459,0500,0559,0600,0659,0700,0759,0800,0859,0900,0959,
1000,1059,1100,1159,1200,1259,1300,1359,1400,1459,1500,1559,1600,1659,1700,1759,1800,1859,1900,1959,2000,2059,
2100,2159,2200,2259,2300,2359,99996,99996,9797,9797,9898,9898) | sys(vF4).
compute m517=concat("vF4=",string(vF4,f5)).
compute p517="vF4為不合理值或遺漏值".
Compute s517=2.
end if.
Exec.


*vF5m01=0,1 96,98  .
do if not range(vF5m01,0,1,96,98) | sys(vF5m01).
compute m518=concat("vF5m01=",string(vF5m01,f2)).
compute p518="vF5m01為不合理值或遺漏值".
Compute s518=2.
end if.
Exec.


*vF5m02=0,1 96,98  .
do if not range(vF5m02,0,1,96,98) | sys(vF5m02).
compute m519=concat("vF5m02=",string(vF5m02,f2)).
compute p519="vF5m02為不合理值或遺漏值".
Compute s519=2.
end if.
Exec.


*vF5m03=0,1 96,98  .
do if not range(vF5m03,0,1,96,98) | sys(vF5m03).
compute m520=concat("vF5m03=",string(vF5m03,f2)).
compute p520="vF5m03為不合理值或遺漏值".
Compute s520=2.
end if.
Exec.


*vF5m04=0,1 96,98  .
do if not range(vF5m04,0,1,96,98) | sys(vF5m04).
compute m521=concat("vF5m04=",string(vF5m04,f2)).
compute p521="vF5m04為不合理值或遺漏值".
Compute s521=2.
end if.
Exec.


*vF5m05=0,1 96,98  .
do if not range(vF5m05,0,1,96,98) | sys(vF5m05).
compute m522=concat("vF5m05=",string(vF5m05,f2)).
compute p522="vF5m05為不合理值或遺漏值".
Compute s522=2.
end if.
Exec.


*vF5m06=0,1 96,98  .
do if not range(vF5m06,0,1,96,98) | sys(vF5m06).
compute m523=concat("vF5m06=",string(vF5m06,f2)).
compute p523="vF5m06為不合理值或遺漏值".
Compute s523=2.
end if.
Exec.


*vF5m07=0,1 96,98  .
do if not range(vF5m07,0,1,96,98) | sys(vF5m07).
compute m524=concat("vF5m07=",string(vF5m07,f2)).
compute p524="vF5m07為不合理值或遺漏值".
Compute s524=2.
end if.
Exec.


*vF5m08=0,1 96,98  .
do if not range(vF5m08,0,1,96,98) | sys(vF5m08).
compute m525=concat("vF5m08=",string(vF5m08,f2)).
compute p525="vF5m08為不合理值或遺漏值".
Compute s525=2.
end if.
Exec.


*vF5m88=0,1 96,98  .
do if not range(vF5m88,0,1,96,98) | sys(vF5m88).
compute m526=concat("vF5m88=",string(vF5m88,f2)).
compute p526="vF5m88為不合理值或遺漏值".
Compute s526=2.
end if.
Exec.


*vC1=0,0.5,1,1.5,2,2.5,3,3.5,4,4.5,5,5.5,6,6.5,7,95,9996,97,98   .
do if not any(vC1,0,0.5,1,1.5,2,2.5,3,3.5,4,4.5,5,5.5,6,6.5,7,95,9996,97,98) | sys(vC1).
compute m527=concat("vC1=",string(vC1,n4)).
compute p527="vC1為不合理值或遺漏值".
Compute s527=2.
end if.
Exec.


*vC2=0001,0059,0100,0159,0200,0259,0300,0359,0400,0459,0500,0559,0600,0659,0700,0759,0800,0859,0900,0959,
1000,1059,1100,1159,1200,1259,1300,1359,1400,1459,1500,1559,1600,1659,1700,1759,1800,1859,1900,1959,2000,2059,
2100,2159,2200,2259,2300,2359,99996,99996,9   .
do if not range(vC2,0001,0059,0100,0159,0200,0259,0300,0359,0400,0459,0500,0559,0600,0659,0700,0759,0800,0859,0900,0959,
1000,1059,1100,1159,1200,1259,1300,1359,1400,1459,1500,1559,1600,1659,1700,1759,1800,1859,1900,1959,2000,2059,
2100,2159,2200,2259,2300,2359,99996,99996,9797,9797,9898,9898) | sys(vC2).
compute m528=concat("vC2=",string(vC2,f5)).
compute p528="vC2為不合理值或遺漏值".
Compute s528=2.
end if.
Exec.


*vC3m01=0,1 96,98  .
do if not range(vC3m01,0,1,96,98) | sys(vC3m01).
compute m529=concat("vC3m01=",string(vC3m01,f2)).
compute p529="vC3m01為不合理值或遺漏值".
Compute s529=2.
end if.
Exec.


*vC3m02=0,1 96,98  .
do if not range(vC3m02,0,1,96,98) | sys(vC3m02).
compute m530=concat("vC3m02=",string(vC3m02,f2)).
compute p530="vC3m02為不合理值或遺漏值".
Compute s530=2.
end if.
Exec.


*vC3m03=0,1 96,98  .
do if not range(vC3m03,0,1,96,98) | sys(vC3m03).
compute m531=concat("vC3m03=",string(vC3m03,f2)).
compute p531="vC3m03為不合理值或遺漏值".
Compute s531=2.
end if.
Exec.


*vC3m04=0,1 96,98  .
do if not range(vC3m04,0,1,96,98) | sys(vC3m04).
compute m532=concat("vC3m04=",string(vC3m04,f2)).
compute p532="vC3m04為不合理值或遺漏值".
Compute s532=2.
end if.
Exec.


*vC3m05=0,1 96,98  .
do if not range(vC3m05,0,1,96,98) | sys(vC3m05).
compute m533=concat("vC3m05=",string(vC3m05,f2)).
compute p533="vC3m05為不合理值或遺漏值".
Compute s533=2.
end if.
Exec.


*vC3m06=0,1 96,98  .
do if not range(vC3m06,0,1,96,98) | sys(vC3m06).
compute m534=concat("vC3m06=",string(vC3m06,f2)).
compute p534="vC3m06為不合理值或遺漏值".
Compute s534=2.
end if.
Exec.


*vC3m07=0,1 96,98  .
do if not range(vC3m07,0,1,96,98) | sys(vC3m07).
compute m535=concat("vC3m07=",string(vC3m07,f2)).
compute p535="vC3m07為不合理值或遺漏值".
Compute s535=2.
end if.
Exec.


*vC3m08=0,1 96,98  .
do if not range(vC3m08,0,1,96,98) | sys(vC3m08).
compute m536=concat("vC3m08=",string(vC3m08,f2)).
compute p536="vC3m08為不合理值或遺漏值".
Compute s536=2.
end if.
Exec.


*vC3m09=0,1 96,98  .
do if not range(vC3m09,0,1,96,98) | sys(vC3m09).
compute m537=concat("vC3m09=",string(vC3m09,f2)).
compute p537="vC3m09為不合理值或遺漏值".
Compute s537=2.
end if.
Exec.


*vC3m10=0,1 96,98  .
do if not range(vC3m10,0,1,96,98) | sys(vC3m10).
compute m538=concat("vC3m10=",string(vC3m10,f2)).
compute p538="vC3m10為不合理值或遺漏值".
Compute s538=2.
end if.
Exec.


*vC3m11=0,1 96,98  .
do if not range(vC3m11,0,1,96,98) | sys(vC3m11).
compute m539=concat("vC3m11=",string(vC3m11,f2)).
compute p539="vC3m11為不合理值或遺漏值".
Compute s539=2.
end if.
Exec.


*vC3m88=0,1 96,98  .
do if not range(vC3m88,0,1,96,98) | sys(vC3m88).
compute m540=concat("vC3m88=",string(vC3m88,f2)).
compute p540="vC3m88為不合理值或遺漏值".
Compute s540=2.
end if.
Exec.


*vJ4_1=0,100 996,998  .
do if not range(vJ4_1,0,100,996,998) | sys(vJ4_1).
compute m541=concat("vJ4_1=",string(vJ4_1,f4)).
compute p541="vJ4_1為不合理值或遺漏值".
Compute s541=2.
end if.
Exec.


*vJ4_2=0,100 996,998  .
do if not range(vJ4_2,0,100,996,998) | sys(vJ4_2).
compute m542=concat("vJ4_2=",string(vJ4_2,f4)).
compute p542="vJ4_2為不合理值或遺漏值".
Compute s542=2.
end if.
Exec.


*vJ4_3=0,100 996,998  .
do if not range(vJ4_3,0,100,996,998) | sys(vJ4_3).
compute m543=concat("vJ4_3=",string(vJ4_3,f4)).
compute p543="vJ4_3為不合理值或遺漏值".
Compute s543=2.
end if.
Exec.


*vJ4_4=0,100 996,998  .
do if not range(vJ4_4,0,100,996,998) | sys(vJ4_4).
compute m544=concat("vJ4_4=",string(vJ4_4,f4)).
compute p544="vJ4_4為不合理值或遺漏值".
Compute s544=2.
end if.
Exec.


*vJ4_5=0,100 996,998  .
do if not range(vJ4_5,0,100,996,998) | sys(vJ4_5).
compute m545=concat("vJ4_5=",string(vJ4_5,f4)).
compute p545="vJ4_5為不合理值或遺漏值".
Compute s545=2.
end if.
Exec.


*vJB1m01=0,1 96,98  .
do if not range(vJB1m01,0,1,96,98) | sys(vJB1m01).
compute m546=concat("vJB1m01=",string(vJB1m01,f2)).
compute p546="vJB1m01為不合理值或遺漏值".
Compute s546=2.
end if.
Exec.


*vJB1m02=0,1 96,98  .
do if not range(vJB1m02,0,1,96,98) | sys(vJB1m02).
compute m547=concat("vJB1m02=",string(vJB1m02,f2)).
compute p547="vJB1m02為不合理值或遺漏值".
Compute s547=2.
end if.
Exec.


*vJB1m03=0,1 96,98  .
do if not range(vJB1m03,0,1,96,98) | sys(vJB1m03).
compute m548=concat("vJB1m03=",string(vJB1m03,f2)).
compute p548="vJB1m03為不合理值或遺漏值".
Compute s548=2.
end if.
Exec.


*vJB1m04=0,1 96,98  .
do if not range(vJB1m04,0,1,96,98) | sys(vJB1m04).
compute m549=concat("vJB1m04=",string(vJB1m04,f2)).
compute p549="vJB1m04為不合理值或遺漏值".
Compute s549=2.
end if.
Exec.


*vJB1m05=0,1 96,98  .
do if not range(vJB1m05,0,1,96,98) | sys(vJB1m05).
compute m550=concat("vJB1m05=",string(vJB1m05,f2)).
compute p550="vJB1m05為不合理值或遺漏值".
Compute s550=2.
end if.
Exec.


*vJB1m06=0,1 96,98  .
do if not range(vJB1m06,0,1,96,98) | sys(vJB1m06).
compute m551=concat("vJB1m06=",string(vJB1m06,f2)).
compute p551="vJB1m06為不合理值或遺漏值".
Compute s551=2.
end if.
Exec.


*vJB1m07=0,1 96,98  .
do if not range(vJB1m07,0,1,96,98) | sys(vJB1m07).
compute m552=concat("vJB1m07=",string(vJB1m07,f2)).
compute p552="vJB1m07為不合理值或遺漏值".
Compute s552=2.
end if.
Exec.


*vJB1m08=0,1 96,98  .
do if not range(vJB1m08,0,1,96,98) | sys(vJB1m08).
compute m553=concat("vJB1m08=",string(vJB1m08,f2)).
compute p553="vJB1m08為不合理值或遺漏值".
Compute s553=2.
end if.
Exec.


*vJB1m09=0,1 96,98  .
do if not range(vJB1m09,0,1,96,98) | sys(vJB1m09).
compute m554=concat("vJB1m09=",string(vJB1m09,f2)).
compute p554="vJB1m09為不合理值或遺漏值".
Compute s554=2.
end if.
Exec.


*vJB1m10=0,1 96,98  .
do if not range(vJB1m10,0,1,96,98) | sys(vJB1m10).
compute m555=concat("vJB1m10=",string(vJB1m10,f2)).
compute p555="vJB1m10為不合理值或遺漏值".
Compute s555=2.
end if.
Exec.


*vJB1m11=0,1 96,98  .
do if not range(vJB1m11,0,1,96,98) | sys(vJB1m11).
compute m556=concat("vJB1m11=",string(vJB1m11,f2)).
compute p556="vJB1m11為不合理值或遺漏值".
Compute s556=2.
end if.
Exec.


*vJB1m88=0,1 96,98  .
do if not range(vJB1m88,0,1,96,98) | sys(vJB1m88).
compute m557=concat("vJB1m88=",string(vJB1m88,f2)).
compute p557="vJB1m88為不合理值或遺漏值".
Compute s557=2.
end if.
Exec.


*vJB1m90=0,1 96,98  .
do if not range(vJB1m90,0,1,96,98) | sys(vJB1m90).
compute m558=concat("vJB1m90=",string(vJB1m90,f2)).
compute p558="vJB1m90為不合理值或遺漏值".
Compute s558=2.
end if.
Exec.


*vJB2m01=0,1 96,98  .
do if not range(vJB2m01,0,1,96,98) | sys(vJB2m01).
compute m559=concat("vJB2m01=",string(vJB2m01,f2)).
compute p559="vJB2m01為不合理值或遺漏值".
Compute s559=2.
end if.
Exec.


*vJB2m02=0,1 96,98  .
do if not range(vJB2m02,0,1,96,98) | sys(vJB2m02).
compute m560=concat("vJB2m02=",string(vJB2m02,f2)).
compute p560="vJB2m02為不合理值或遺漏值".
Compute s560=2.
end if.
Exec.


*vJB2m03=0,1 96,98  .
do if not range(vJB2m03,0,1,96,98) | sys(vJB2m03).
compute m561=concat("vJB2m03=",string(vJB2m03,f2)).
compute p561="vJB2m03為不合理值或遺漏值".
Compute s561=2.
end if.
Exec.


*vJB2m04=0,1 96,98  .
do if not range(vJB2m04,0,1,96,98) | sys(vJB2m04).
compute m562=concat("vJB2m04=",string(vJB2m04,f2)).
compute p562="vJB2m04為不合理值或遺漏值".
Compute s562=2.
end if.
Exec.


*vJB2m05=0,1 96,98  .
do if not range(vJB2m05,0,1,96,98) | sys(vJB2m05).
compute m563=concat("vJB2m05=",string(vJB2m05,f2)).
compute p563="vJB2m05為不合理值或遺漏值".
Compute s563=2.
end if.
Exec.


*vJB2m06=0,1 96,98  .
do if not range(vJB2m06,0,1,96,98) | sys(vJB2m06).
compute m564=concat("vJB2m06=",string(vJB2m06,f2)).
compute p564="vJB2m06為不合理值或遺漏值".
Compute s564=2.
end if.
Exec.


*vJB2m07=0,1 96,98  .
do if not range(vJB2m07,0,1,96,98) | sys(vJB2m07).
compute m565=concat("vJB2m07=",string(vJB2m07,f2)).
compute p565="vJB2m07為不合理值或遺漏值".
Compute s565=2.
end if.
Exec.


*vJB2m88=0,1 96,98  .
do if not range(vJB2m88,0,1,96,98) | sys(vJB2m88).
compute m566=concat("vJB2m88=",string(vJB2m88,f2)).
compute p566="vJB2m88為不合理值或遺漏值".
Compute s566=2.
end if.
Exec.


*vJB2m90=0,1 96,98  .
do if not range(vJB2m90,0,1,96,98) | sys(vJB2m90).
compute m567=concat("vJB2m90=",string(vJB2m90,f2)).
compute p567="vJB2m90為不合理值或遺漏值".
Compute s567=2.
end if.
Exec.


*vH1=0,991 996,998  .
do if not range(vH1,0,991,996,998) | sys(vH1).
compute m568=concat("vH1=",string(vH1,f4)).
compute p568="vH1為不合理值或遺漏值".
Compute s568=2.
end if.
Exec.


*vH2=1,5 96,98  .
do if not range(vH2,1,5,96,98) | sys(vH2).
compute m569=concat("vH2=",string(vH2,f2)).
compute p569="vH2為不合理值或遺漏值".
Compute s569=2.
end if.
Exec.


*vH3=1,5 96,98  .
do if not range(vH3,1,5,96,98) | sys(vH3).
compute m570=concat("vH3=",string(vH3,f2)).
compute p570="vH3為不合理值或遺漏值".
Compute s570=2.
end if.
Exec.


*vH4=0,991 996,998  .
do if not range(vH4,0,991,996,998) | sys(vH4).
compute m571=concat("vH4=",string(vH4,f4)).
compute p571="vH4為不合理值或遺漏值".
Compute s571=2.
end if.
Exec.


*vH5=1,5 96,98  .
do if not range(vH5,1,5,96,98) | sys(vH5).
compute m572=concat("vH5=",string(vH5,f2)).
compute p572="vH5為不合理值或遺漏值".
Compute s572=2.
end if.
Exec.


*vH6=1,5 96,98  .
do if not range(vH6,1,5,96,98) | sys(vH6).
compute m573=concat("vH6=",string(vH6,f2)).
compute p573="vH6為不合理值或遺漏值".
Compute s573=2.
end if.
Exec.


*vH7=0,991 996,998  .
do if not range(vH7,0,991,9996,9998) | sys(vH7).
compute m574=concat("vH7=",string(vH7,f4)).
compute p574="vH7為不合理值或遺漏值".
Compute s574=2.
end if.
Exec.


*vH7_1=0,991 996,998  .
do if not range(vH7_1,0,991,9996,9998) | sys(vH7_1).
compute m575=concat("vH7_1=",string(vH7_1,f4)).
compute p575="vH7_1為不合理值或遺漏值".
Compute s575=2.
end if.
Exec.


*vH7_2=0,991 996,998  .
do if not range(vH7_2,0,991,9996,9998) | sys(vH7_2).
compute m576=concat("vH7_2=",string(vH7_2,f4)).
compute p576="vH7_2為不合理值或遺漏值".
Compute s576=2.
end if.
Exec.


*vH7_3=0,991 996,998  .
do if not range(vH7_3,0,991,9996,9998) | sys(vH7_3).
compute m577=concat("vH7_3=",string(vH7_3,f4)).
compute p577="vH7_3為不合理值或遺漏值".
Compute s577=2.
end if.
Exec.


*vH8=0,500 991 997,998 .
do if not range(vH8,0,500,991,991,997,998) | sys(vH8).
compute m582=concat("vH8=",string(vH8,f4)).
compute p582="vH8為不合理值或遺漏值".
Compute s582=2.
end if.
Exec.


*vM1g1=0,140,997,998   .
do if not range(vM1g1,0,140,997,998) | sys(vM1g1).
compute m583=concat("vM1g1=",string(vM1g1,f4)).
compute p583="vM1g1為不合理值或遺漏值".
Compute s583=2.
end if.
Exec.


*vM1g2=00,59,97,98   .
do if not range(vM1g2,00,59,97,98) | sys(vM1g2).
compute m584=concat("vM1g2=",string(vM1g2,f3)).
compute p584="vM1g2為不合理值或遺漏值".
Compute s584=2.
end if.
Exec.


*vM2m01=0,1 96,98  .
do if not range(vM2m01,0,1,96,98) | sys(vM2m01).
compute m585=concat("vM2m01=",string(vM2m01,f2)).
compute p585="vM2m01為不合理值或遺漏值".
Compute s585=2.
end if.
Exec.


*vM2m02=0,1 96,98  .
do if not range(vM2m02,0,1,96,98) | sys(vM2m02).
compute m586=concat("vM2m02=",string(vM2m02,f2)).
compute p586="vM2m02為不合理值或遺漏值".
Compute s586=2.
end if.
Exec.


*vM2m03=0,1 96,98  .
do if not range(vM2m03,0,1,96,98) | sys(vM2m03).
compute m587=concat("vM2m03=",string(vM2m03,f2)).
compute p587="vM2m03為不合理值或遺漏值".
Compute s587=2.
end if.
Exec.


*vM2m04=0,1 96,98  .
do if not range(vM2m04,0,1,96,98) | sys(vM2m04).
compute m588=concat("vM2m04=",string(vM2m04,f2)).
compute p588="vM2m04為不合理值或遺漏值".
Compute s588=2.
end if.
Exec.


*vM2m05=0,1 96,98  .
do if not range(vM2m05,0,1,96,98) | sys(vM2m05).
compute m589=concat("vM2m05=",string(vM2m05,f2)).
compute p589="vM2m05為不合理值或遺漏值".
Compute s589=2.
end if.
Exec.


*vM2m06=0,1 96,98  .
do if not range(vM2m06,0,1,96,98) | sys(vM2m06).
compute m590=concat("vM2m06=",string(vM2m06,f2)).
compute p590="vM2m06為不合理值或遺漏值".
Compute s590=2.
end if.
Exec.


*vM2m07=0,1 96,98  .
do if not range(vM2m07,0,1,96,98) | sys(vM2m07).
compute m591=concat("vM2m07=",string(vM2m07,f2)).
compute p591="vM2m07為不合理值或遺漏值".
Compute s591=2.
end if.
Exec.


*vM2m08=0,1 96,98  .
do if not range(vM2m08,0,1,96,98) | sys(vM2m08).
compute m592=concat("vM2m08=",string(vM2m08,f2)).
compute p592="vM2m08為不合理值或遺漏值".
Compute s592=2.
end if.
Exec.


*vM2m09=0,1 96,98  .
do if not range(vM2m09,0,1,96,98) | sys(vM2m09).
compute m593=concat("vM2m09=",string(vM2m09,f2)).
compute p593="vM2m09為不合理值或遺漏值".
Compute s593=2.
end if.
Exec.


*vM2m10=0,1 96,98  .
do if not range(vM2m10,0,1,96,98) | sys(vM2m10).
compute m594=concat("vM2m10=",string(vM2m10,f2)).
compute p594="vM2m10為不合理值或遺漏值".
Compute s594=2.
end if.
Exec.


*vM2m11=0,1 96,98  .
do if not range(vM2m11,0,1,96,98) | sys(vM2m11).
compute m595=concat("vM2m11=",string(vM2m11,f2)).
compute p595="vM2m11為不合理值或遺漏值".
Compute s595=2.
end if.
Exec.


*vM2m12=0,1 96,98  .
do if not range(vM2m12,0,1,96,98) | sys(vM2m12).
compute m596=concat("vM2m12=",string(vM2m12,f2)).
compute p596="vM2m12為不合理值或遺漏值".
Compute s596=2.
end if.
Exec.


*vM2m13=0,1 96,98  .
do if not range(vM2m13,0,1,96,98) | sys(vM2m13).
compute m597=concat("vM2m13=",string(vM2m13,f2)).
compute p597="vM2m13為不合理值或遺漏值".
Compute s597=2.
end if.
Exec.


*vM2m14=0,1 96,98  .
do if not range(vM2m14,0,1,96,98) | sys(vM2m14).
compute m598=concat("vM2m14=",string(vM2m14,f2)).
compute p598="vM2m14為不合理值或遺漏值".
Compute s598=2.
end if.
Exec.


*vM2m15=0,1 96,98  .
do if not range(vM2m15,0,1,96,98) | sys(vM2m15).
compute m599=concat("vM2m15=",string(vM2m15,f2)).
compute p599="vM2m15為不合理值或遺漏值".
Compute s599=2.
end if.
Exec.


*vM2m16=0,1 96,98  .
do if not range(vM2m16,0,1,96,98) | sys(vM2m16).
compute m600=concat("vM2m16=",string(vM2m16,f2)).
compute p600="vM2m16為不合理值或遺漏值".
Compute s600=2.
end if.
Exec.


*vM2m88=0,1 96,98  .
do if not range(vM2m88,0,1,96,98) | sys(vM2m88).
compute m601=concat("vM2m88=",string(vM2m88,f2)).
compute p601="vM2m88為不合理值或遺漏值".
Compute s601=2.
end if.
Exec.


*vM3m01=0,1 96,98  .
do if not range(vM3m01,0,1,96,98) | sys(vM3m01).
compute m602=concat("vM3m01=",string(vM3m01,f2)).
compute p602="vM3m01為不合理值或遺漏值".
Compute s602=2.
end if.
Exec.


*vM3m02=0,1 96,98  .
do if not range(vM3m02,0,1,96,98) | sys(vM3m02).
compute m603=concat("vM3m02=",string(vM3m02,f2)).
compute p603="vM3m02為不合理值或遺漏值".
Compute s603=2.
end if.
Exec.


*vM3m03=0,1 96,98  .
do if not range(vM3m03,0,1,96,98) | sys(vM3m03).
compute m604=concat("vM3m03=",string(vM3m03,f2)).
compute p604="vM3m03為不合理值或遺漏值".
Compute s604=2.
end if.
Exec.


*vM3m04=0,1 96,98  .
do if not range(vM3m04,0,1,96,98) | sys(vM3m04).
compute m605=concat("vM3m04=",string(vM3m04,f2)).
compute p605="vM3m04為不合理值或遺漏值".
Compute s605=2.
end if.
Exec.


*vM3m05=0,1 96,98  .
do if not range(vM3m05,0,1,96,98) | sys(vM3m05).
compute m606=concat("vM3m05=",string(vM3m05,f2)).
compute p606="vM3m05為不合理值或遺漏值".
Compute s606=2.
end if.
Exec.


*vM3m06=0,1 96,98  .
do if not range(vM3m06,0,1,96,98) | sys(vM3m06).
compute m607=concat("vM3m06=",string(vM3m06,f2)).
compute p607="vM3m06為不合理值或遺漏值".
Compute s607=2.
end if.
Exec.


*vM3m07=0,1 96,98  .
do if not range(vM3m07,0,1,96,98) | sys(vM3m07).
compute m608=concat("vM3m07=",string(vM3m07,f2)).
compute p608="vM3m07為不合理值或遺漏值".
Compute s608=2.
end if.
Exec.


*vM3m08=0,1 96,98  .
do if not range(vM3m08,0,1,96,98) | sys(vM3m08).
compute m609=concat("vM3m08=",string(vM3m08,f2)).
compute p609="vM3m08為不合理值或遺漏值".
Compute s609=2.
end if.
Exec.


*vM3m09=0,1 96,98  .
do if not range(vM3m09,0,1,96,98) | sys(vM3m09).
compute m610=concat("vM3m09=",string(vM3m09,f2)).
compute p610="vM3m09為不合理值或遺漏值".
Compute s610=2.
end if.
Exec.


*vM3m10=0,1 96,98  .
do if not range(vM3m10,0,1,96,98) | sys(vM3m10).
compute m611=concat("vM3m10=",string(vM3m10,f2)).
compute p611="vM3m10為不合理值或遺漏值".
Compute s611=2.
end if.
Exec.


*vM3m11=0,1 96,98  .
do if not range(vM3m11,0,1,96,98) | sys(vM3m11).
compute m612=concat("vM3m11=",string(vM3m11,f2)).
compute p612="vM3m11為不合理值或遺漏值".
Compute s612=2.
end if.
Exec.


*vM3m12=0,1 96,98  .
do if not range(vM3m12,0,1,96,98) | sys(vM3m12).
compute m613=concat("vM3m12=",string(vM3m12,f2)).
compute p613="vM3m12為不合理值或遺漏值".
Compute s613=2.
end if.
Exec.


*vM3m13=0,1 96,98  .
do if not range(vM3m13,0,1,96,98) | sys(vM3m13).
compute m614=concat("vM3m13=",string(vM3m13,f2)).
compute p614="vM3m13為不合理值或遺漏值".
Compute s614=2.
end if.
Exec.


*vM3m88=0,1 96,98  .
do if not range(vM3m88,0,1,96,98) | sys(vM3m88).
compute m615=concat("vM3m88=",string(vM3m88,f2)).
compute p615="vM3m88為不合理值或遺漏值".
Compute s615=2.
end if.
Exec.


*vM4sM4=1,5 96,98  .
do if not range(vM4sM4,1,5,96,98) | sys(vM4sM4).
compute m616=concat("vM4sM4=",string(vM4sM4,f2)).
compute p616="vM4sM4為不合理值或遺漏值".
Compute s616=2.
end if.
Exec.


*vM4sM5=1,5 96,98  .
do if not range(vM4sM5,1,5,96,98) | sys(vM4sM5).
compute m617=concat("vM4sM5=",string(vM4sM5,f2)).
compute p617="vM4sM5為不合理值或遺漏值".
Compute s617=2.
end if.
Exec.


*vM4sM6=1,5 96,98  .
do if not range(vM4sM6,1,5,96,98) | sys(vM4sM6).
compute m618=concat("vM4sM6=",string(vM4sM6,f2)).
compute p618="vM4sM6為不合理值或遺漏值".
Compute s618=2.
end if.
Exec.


*vN1sN1=1,4 97,98  .
do if not range(vN1sN1,1,4,97,98) | sys(vN1sN1).
compute m619=concat("vN1sN1=",string(vN1sN1,f2)).
compute p619="vN1sN1為不合理值或遺漏值".
Compute s619=2.
end if.
Exec.


*vN1sN2=1,4 97,98  .
do if not range(vN1sN2,1,4,97,98) | sys(vN1sN2).
compute m620=concat("vN1sN2=",string(vN1sN2,f2)).
compute p620="vN1sN2為不合理值或遺漏值".
Compute s620=2.
end if.
Exec.


*vN1sN3=1,4 97,98  .
do if not range(vN1sN3,1,4,97,98) | sys(vN1sN3).
compute m621=concat("vN1sN3=",string(vN1sN3,f2)).
compute p621="vN1sN3為不合理值或遺漏值".
Compute s621=2.
end if.
Exec.


*vN1sN4=1,4 97,98  .
do if not range(vN1sN4,1,4,97,98) | sys(vN1sN4).
compute m622=concat("vN1sN4=",string(vN1sN4,f2)).
compute p622="vN1sN4為不合理值或遺漏值".
Compute s622=2.
end if.
Exec.


*vN1sN5=1,4 97,98  .
do if not range(vN1sN5,1,4,97,98) | sys(vN1sN5).
compute m623=concat("vN1sN5=",string(vN1sN5,f2)).
compute p623="vN1sN5為不合理值或遺漏值".
Compute s623=2.
end if.
Exec.


*vN6sN6=1,4 97,98  .
do if not range(vN6sN6,1,4,97,98) | sys(vN6sN6).
compute m624=concat("vN6sN6=",string(vN6sN6,f2)).
compute p624="vN6sN6為不合理值或遺漏值".
Compute s624=2.
end if.
Exec.


*vN6sN7=1,4 97,98  .
do if not range(vN6sN7,1,4,97,98) | sys(vN6sN7).
compute m625=concat("vN6sN7=",string(vN6sN7,f2)).
compute p625="vN6sN7為不合理值或遺漏值".
Compute s625=2.
end if.
Exec.


*vN6sN8=1,4 97,98  .
do if not range(vN6sN8,1,4,97,98) | sys(vN6sN8).
compute m626=concat("vN6sN8=",string(vN6sN8,f2)).
compute p626="vN6sN8為不合理值或遺漏值".
Compute s626=2.
end if.
Exec.


*vN6sN9=1,4 97,98  .
do if not range(vN6sN9,1,4,97,98) | sys(vN6sN9).
compute m627=concat("vN6sN9=",string(vN6sN9,f2)).
compute p627="vN6sN9為不合理值或遺漏值".
Compute s627=2.
end if.
Exec.


*vN6sN10=1,4 97,98  .
do if not range(vN6sN10,1,4,97,98) | sys(vN6sN10).
compute m628=concat("vN6sN10=",string(vN6sN10,f2)).
compute p628="vN6sN10為不合理值或遺漏值".
Compute s628=2.
end if.
Exec.


*vN11sN11=1,5 97,98  .
do if not range(vN11sN11,1,5,97,98) | sys(vN11sN11).
compute m629=concat("vN11sN11=",string(vN11sN11,f2)).
compute p629="vN11sN11為不合理值或遺漏值".
Compute s629=2.
end if.
Exec.


*vN11sN12=1,5 97,98  .
do if not range(vN11sN12,1,5,97,98) | sys(vN11sN12).
compute m630=concat("vN11sN12=",string(vN11sN12,f2)).
compute p630="vN11sN12為不合理值或遺漏值".
Compute s630=2.
end if.
Exec.


*vN11sN13=1,5 97,98  .
do if not range(vN11sN13,1,5,97,98) | sys(vN11sN13).
compute m631=concat("vN11sN13=",string(vN11sN13,f2)).
compute p631="vN11sN13為不合理值或遺漏值".
Compute s631=2.
end if.
Exec.


*vN11sN14=1,5 97,98  .
do if not range(vN11sN14,1,5,97,98) | sys(vN11sN14).
compute m632=concat("vN11sN14=",string(vN11sN14,f2)).
compute p632="vN11sN14為不合理值或遺漏值".
Compute s632=2.
end if.
Exec.


*vN11sN15=1,5 97,98  .
do if not range(vN11sN15,1,5,97,98) | sys(vN11sN15).
compute m633=concat("vN11sN15=",string(vN11sN15,f2)).
compute p633="vN11sN15為不合理值或遺漏值".
Compute s633=2.
end if.
Exec.


*vN11sN16=1,5 97,98  .
do if not range(vN11sN16,1,5,97,98) | sys(vN11sN16).
compute m634=concat("vN11sN16=",string(vN11sN16,f2)).
compute p634="vN11sN16為不合理值或遺漏值".
Compute s634=2.
end if.
Exec.


*vN17=1,5 90 97,98 .
do if not range(vN17,1,5,90,90,97,98) | sys(vN17).
compute m635=concat("vN17=",string(vN17,f2)).
compute p635="vN17為不合理值或遺漏值".
Compute s635=2.
end if.
Exec.


*vN18sN18=1,5 97,98  .
do if not range(vN18sN18,1,5,97,98) | sys(vN18sN18).
compute m636=concat("vN18sN18=",string(vN18sN18,f2)).
compute p636="vN18sN18為不合理值或遺漏值".
Compute s636=2.
end if.
Exec.


*vN18sN19=1,5 97,98  .
do if not range(vN18sN19,1,5,97,98) | sys(vN18sN19).
compute m637=concat("vN18sN19=",string(vN18sN19,f2)).
compute p637="vN18sN19為不合理值或遺漏值".
Compute s637=2.
end if.
Exec.


*vN18sN20=1,5 97,98  .
do if not range(vN18sN20,1,5,97,98) | sys(vN18sN20).
compute m638=concat("vN18sN20=",string(vN18sN20,f2)).
compute p638="vN18sN20為不合理值或遺漏值".
Compute s638=2.
end if.
Exec.


*vN21sN21=1,5 97,98  .
do if not range(vN21sN21,1,5,97,98) | sys(vN21sN21).
compute m639=concat("vN21sN21=",string(vN21sN21,f2)).
compute p639="vN21sN21為不合理值或遺漏值".
Compute s639=2.
end if.
Exec.


*vN21sN22=1,5 97,98  .
do if not range(vN21sN22,1,5,97,98) | sys(vN21sN22).
compute m640=concat("vN21sN22=",string(vN21sN22,f2)).
compute p640="vN21sN22為不合理值或遺漏值".
Compute s640=2.
end if.
Exec.


*vN23=1,5 97,98  .
do if not range(vN23,1,5,97,98) | sys(vN23).
compute m641=concat("vN23=",string(vN23,f2)).
compute p641="vN23為不合理值或遺漏值".
Compute s641=2.
end if.
Exec.


*vN24=1,5 97,98  .
do if not range(vN24,1,5,96,98) | sys(vN24).
compute m642=concat("vN24=",string(vN24,f2)).
compute p642="vN24為不合理值或遺漏值".
Compute s642=2.
end if.
Exec.


*vN25=1,5 90 97,98  .
do if not range(vN25,1,5,90,90,97,98) | sys(vN25).
compute m643=concat("vN25=",string(vN25,f2)).
compute p643="vN25為不合理值或遺漏值".
Compute s643=2.
end if.
Exec.


*vN26=1,5 97,98  .
do if not range(vN26,1,5,97,98) | sys(vN26).
compute m644=concat("vN26=",string(vN26,f2)).
compute p644="vN26為不合理值或遺漏值".
Compute s644=2.
end if.
Exec.


*vN27=1,5 97,98  .
do if not range(vN27,1,5,97,98) | sys(vN27).
compute m645=concat("vN27=",string(vN27,f2)).
compute p645="vN27為不合理值或遺漏值".
Compute s645=2.
end if.
Exec.


*vN28=1,5 97,98  .
do if not range(vN28,1,5,97,98) | sys(vN28).
compute m646=concat("vN28=",string(vN28,f2)).
compute p646="vN28為不合理值或遺漏值".
Compute s646=2.
end if.
Exec.


*vN29=1,5 97,98  .
do if not range(vN29,1,5,97,98) | sys(vN29).
compute m647=concat("vN29=",string(vN29,f2)).
compute p647="vN29為不合理值或遺漏值".
Compute s647=2.
end if.
Exec.


*vN30=0,10 90 97,98  .
do if not range(vN30,0,10,90,90,97,98) | sys(vN30).
compute m648=concat("vN30=",string(vN30,f3)).
compute p648="vN30為不合理值或遺漏值".
Compute s648=2.
end if.
Exec.


*vN31=0,10 97,98  .
do if not range(vN31,0,10,97,98) | sys(vN31).
compute m649=concat("vN31=",string(vN31,f3)).
compute p649="vN31為不合理值或遺漏值".
Compute s649=2.
end if.
Exec.


*vN32=0,10 97,98  .
do if not range(vN32,0,10,97,98) | sys(vN32).
compute m650=concat("vN32=",string(vN32,f3)).
compute p650="vN32為不合理值或遺漏值".
Compute s650=2.
end if.
Exec.


*vO5=1,23 97,98  .
do if not range(vO5,1,23,97,98) | sys(vO5).
compute m651=concat("vO5=",string(vO5,f2)).
compute p651="vO5為不合理值或遺漏值".
Compute s651=2.
end if.
Exec.


*vN33sN33=1,4 97,98  .
do if not range(vN33sN33,1,4,97,98) | sys(vN33sN33).
compute m652=concat("vN33sN33=",string(vN33sN33,f2)).
compute p652="vN33sN33為不合理值或遺漏值".
Compute s652=2.
end if.
Exec.


*vN33sN34=1,4 97,98  .
do if not range(vN33sN34,1,4,97,98) | sys(vN33sN34).
compute m653=concat("vN33sN34=",string(vN33sN34,f2)).
compute p653="vN33sN34為不合理值或遺漏值".
Compute s653=2.
end if.
Exec.


*vN35sN35=0,7 97,98  .
do if not range(vN35sN35,0,7,97,98) | sys(vN35sN35).
compute m654=concat("vN35sN35=",string(vN35sN35,f2)).
compute p654="vN35sN35為不合理值或遺漏值".
Compute s654=2.
end if.
Exec.


*vN35sN36=0,7 97,98  .
do if not range(vN35sN36,0,7,97,98) | sys(vN35sN36).
compute m655=concat("vN35sN36=",string(vN35sN36,f2)).
compute p655="vN35sN36為不合理值或遺漏值".
Compute s655=2.
end if.
Exec.


*vN35sN37=0,7 97,98  .
do if not range(vN35sN37,0,7,97,98) | sys(vN35sN37).
compute m656=concat("vN35sN37=",string(vN35sN37,f2)).
compute p656="vN35sN37為不合理值或遺漏值".
Compute s656=2.
end if.
Exec.


*vN35sN38=0,7 97,98  .
do if not range(vN35sN38,0,7,97,98) | sys(vN35sN38).
compute m657=concat("vN35sN38=",string(vN35sN38,f2)).
compute p657="vN35sN38為不合理值或遺漏值".
Compute s657=2.
end if.
Exec.


*vQ1=1,4 96,98  .
do if not range(vQ1,1,4,96,98) | sys(vQ1).
compute m659=concat("vQ1=",string(vQ1,f2)).
compute p659="vQ1為不合理值或遺漏值".
Compute s659=2.
end if.
Exec.


*vQ2=1,4 96,98  .
do if not range(vQ2,1,4,96,98) | sys(vQ2).
compute m660=concat("vQ2=",string(vQ2,f2)).
compute p660="vQ2為不合理值或遺漏值".
Compute s660=2.
end if.
Exec.


*vQ3=1,4 96,98  .
do if not range(vQ3,1,4,96,98) | sys(vQ3).
compute m661=concat("vQ3=",string(vQ3,f2)).
compute p661="vQ3為不合理值或遺漏值".
Compute s661=2.
end if.
Exec.


*vQ4=1,4 96,98  .
do if not range(vQ4,1,4,96,98) | sys(vQ4).
compute m662=concat("vQ4=",string(vQ4,f2)).
compute p662="vQ4為不合理值或遺漏值".
Compute s662=2.
end if.
Exec.


*vQ5=1,2 96,98  .
do if not range(vQ5,1,2,96,98) | sys(vQ5).
compute m663=concat("vQ5=",string(vQ5,f2)).
compute p663="vQ5為不合理值或遺漏值".
Compute s663=2.
end if.
Exec.


*vQ6=1,4 96,98  .
do if not range(vQ6,1,4,96,98) | sys(vQ6).
compute m664=concat("vQ6=",string(vQ6,f2)).
compute p664="vQ6為不合理值或遺漏值".
Compute s664=2.
end if.
Exec.


*vQ7=1,4 96,98  .
do if not range(vQ7,1,4,96,98) | sys(vQ7).
compute m665=concat("vQ7=",string(vQ7,f2)).
compute p665="vQ7為不合理值或遺漏值".
Compute s665=2.
end if.
Exec.


*vQ8=1,4 96,98  .
do if not range(vQ8,1,4,96,98) | sys(vQ8).
compute m666=concat("vQ8=",string(vQ8,f2)).
compute p666="vQ8為不合理值或遺漏值".
Compute s666=2.
end if.
Exec.


*vQ9=1,4 96,98  .
do if not range(vQ9,1,4,96,98) | sys(vQ9).
compute m667=concat("vQ9=",string(vQ9,f2)).
compute p667="vQ9為不合理值或遺漏值".
Compute s667=2.
end if.
Exec.


*vQ10=1,2 96,98  .
do if not range(vQ10,1,2,96,98) | sys(vQ10).
compute m668=concat("vQ10=",string(vQ10,f2)).
compute p668="vQ10為不合理值或遺漏值".
Compute s668=2.
end if.
Exec.


*vQ11=1,4 96,98  .
do if not range(vQ11,1,4,96,98) | sys(vQ11).
compute m670=concat("vQ11=",string(vQ11,f2)).
compute p670="vQ11為不合理值或遺漏值".
Compute s670=2.
end if.
Exec.


*vQ12=1,4 96,98  .
do if not range(vQ12,1,4,96,98) | sys(vQ12).
compute m671=concat("vQ12=",string(vQ12,f2)).
compute p671="vQ12為不合理值或遺漏值".
Compute s671=2.
end if.
Exec.


*vQ13=1,4 96,98  .
do if not range(vQ13,1,4,96,98) | sys(vQ13).
compute m672=concat("vQ13=",string(vQ13,f2)).
compute p672="vQ13為不合理值或遺漏值".
Compute s672=2.
end if.
Exec.


*vQ14=1,4 96,98  .
do if not range(vQ14,1,4,96,98) | sys(vQ14).
compute m673=concat("vQ14=",string(vQ14,f2)).
compute p673="vQ14為不合理值或遺漏值".
Compute s673=2.
end if.
Exec.


*vQ15=1,2 96,98  .
do if not range(vQ15,1,2,96,98) | sys(vQ15).
compute m674=concat("vQ15=",string(vQ15,f2)).
compute p674="vQ15為不合理值或遺漏值".
Compute s674=2.
end if.
Exec.


*vQ16=1,4 96,98  .
do if not range(vQ16,1,4,96,98) | sys(vQ16).
compute m675=concat("vQ16=",string(vQ16,f2)).
compute p675="vQ16為不合理值或遺漏值".
Compute s675=2.
end if.
Exec.


*vQ17=1,4 96,98  .
do if not range(vQ17,1,4,96,98) | sys(vQ17).
compute m676=concat("vQ17=",string(vQ17,f2)).
compute p676="vQ17為不合理值或遺漏值".
Compute s676=2.
end if.
Exec.


*vQ18=1,4 96,98  .
do if not range(vQ18,1,4,96,98) | sys(vQ18).
compute m677=concat("vQ18=",string(vQ18,f2)).
compute p677="vQ18為不合理值或遺漏值".
Compute s677=2.
end if.
Exec.


*vQ19=1,4 96,98  .
do if not range(vQ19,1,4,96,98) | sys(vQ19).
compute m678=concat("vQ19=",string(vQ19,f2)).
compute p678="vQ19為不合理值或遺漏值".
Compute s678=2.
end if.
Exec.


*vQ20m01=0,1 96,98  .
do if not range(vQ20m01,0,1,96,98) | sys(vQ20m01).
compute m679=concat("vQ20m01=",string(vQ20m01,f2)).
compute p679="vQ20m01為不合理值或遺漏值".
Compute s679=2.
end if.
Exec.


*vQ20m02=0,1 96,98  .
do if not range(vQ20m02,0,1,96,98) | sys(vQ20m02).
compute m680=concat("vQ20m02=",string(vQ20m02,f2)).
compute p680="vQ20m02為不合理值或遺漏值".
Compute s680=2.
end if.
Exec.


*vQ20m03=0,1 96,98  .
do if not range(vQ20m03,0,1,96,98) | sys(vQ20m03).
compute m681=concat("vQ20m03=",string(vQ20m03,f2)).
compute p681="vQ20m03為不合理值或遺漏值".
Compute s681=2.
end if.
Exec.


*vQ20m04=0,1 96,98  .
do if not range(vQ20m04,0,1,96,98) | sys(vQ20m04).
compute m682=concat("vQ20m04=",string(vQ20m04,f2)).
compute p682="vQ20m04為不合理值或遺漏值".
Compute s682=2.
end if.
Exec.


*vQ20m05=0,1 96,98  .
do if not range(vQ20m05,0,1,96,98) | sys(vQ20m05).
compute m683=concat("vQ20m05=",string(vQ20m05,f2)).
compute p683="vQ20m05為不合理值或遺漏值".
Compute s683=2.
end if.
Exec.


*vQ20m06=0,1 96,98  .
do if not range(vQ20m06,0,1,96,98) | sys(vQ20m06).
compute m684=concat("vQ20m06=",string(vQ20m06,f2)).
compute p684="vQ20m06為不合理值或遺漏值".
Compute s684=2.
end if.
Exec.


*vQ20m88=0,1 96,98  .
do if not range(vQ20m88,0,1,96,98) | sys(vQ20m88).
compute m685=concat("vQ20m88=",string(vQ20m88,f2)).
compute p685="vQ20m88為不合理值或遺漏值".
Compute s685=2.
end if.
Exec.


*vQ20m90=0,1 96,98  .
do if not range(vQ20m90,0,1,96,98) | sys(vQ20m90).
compute m686=concat("vQ20m90=",string(vQ20m90,f2)).
compute p686="vQ20m90為不合理值或遺漏值".
Compute s686=2.
end if.
Exec.


*vQ24g1=0,140,996,998   .
do if not range(vQ24g1,0,140,9996,9998) | sys(vQ24g1).
compute m688=concat("vQ24g1=",string(vQ24g1,f4)).
compute p688="vQ24g1為不合理值或遺漏值".
Compute s688=2.
end if.
Exec.


*vQ24g2=00,59,97,98   .
do if not range(vQ24g2,00,59,996,998) | sys(vQ24g2).
compute m689=concat("vQ24g2=",string(vQ24g2,f3)).
compute p689="vQ24g2為不合理值或遺漏值".
Compute s689=2.
end if.
Exec.


*vQ25m01=0,1 96,98  .
do if not range(vQ25m01,0,1,96,98) | sys(vQ25m01).
compute m691=concat("vQ25m01=",string(vQ25m01,f2)).
compute p691="vQ25m01為不合理值或遺漏值".
Compute s691=2.
end if.
Exec.


*vQ25m02=0,1 96,98  .
do if not range(vQ25m02,0,1,96,98) | sys(vQ25m02).
compute m692=concat("vQ25m02=",string(vQ25m02,f2)).
compute p692="vQ25m02為不合理值或遺漏值".
Compute s692=2.
end if.
Exec.


*vQ25m03=0,1 96,98  .
do if not range(vQ25m03,0,1,96,98) | sys(vQ25m03).
compute m693=concat("vQ25m03=",string(vQ25m03,f2)).
compute p693="vQ25m03為不合理值或遺漏值".
Compute s693=2.
end if.
Exec.


*vQ25m04=0,1 96,98  .
do if not range(vQ25m04,0,1,96,98) | sys(vQ25m04).
compute m694=concat("vQ25m04=",string(vQ25m04,f2)).
compute p694="vQ25m04為不合理值或遺漏值".
Compute s694=2.
end if.
Exec.


*vQ25m05=0,1 96,98  .
do if not range(vQ25m05,0,1,96,98) | sys(vQ25m05).
compute m695=concat("vQ25m05=",string(vQ25m05,f2)).
compute p695="vQ25m05為不合理值或遺漏值".
Compute s695=2.
end if.
Exec.


*vQ25m06=0,1 96,98  .
do if not range(vQ25m06,0,1,96,98) | sys(vQ25m06).
compute m696=concat("vQ25m06=",string(vQ25m06,f2)).
compute p696="vQ25m06為不合理值或遺漏值".
Compute s696=2.
end if.
Exec.


*vQ25m07=0,1 96,98  .
do if not range(vQ25m07,0,1,96,98) | sys(vQ25m07).
compute m697=concat("vQ25m07=",string(vQ25m07,f2)).
compute p697="vQ25m07為不合理值或遺漏值".
Compute s697=2.
end if.
Exec.


*vQ25m08=0,1 96,98  .
do if not range(vQ25m08,0,1,96,98) | sys(vQ25m08).
compute m698=concat("vQ25m08=",string(vQ25m08,f2)).
compute p698="vQ25m08為不合理值或遺漏值".
Compute s698=2.
end if.
Exec.


*vQ25m09=0,1 96,98  .
do if not range(vQ25m09,0,1,96,98) | sys(vQ25m09).
compute m699=concat("vQ25m09=",string(vQ25m09,f2)).
compute p699="vQ25m09為不合理值或遺漏值".
Compute s699=2.
end if.
Exec.


*vQ25m10=0,1 96,98  .
do if not range(vQ25m10,0,1,96,98) | sys(vQ25m10).
compute m700=concat("vQ25m10=",string(vQ25m10,f2)).
compute p700="vQ25m10為不合理值或遺漏值".
Compute s700=2.
end if.
Exec.


*vQ25m11=0,1 96,98  .
do if not range(vQ25m11,0,1,96,98) | sys(vQ25m11).
compute m701=concat("vQ25m11=",string(vQ25m11,f2)).
compute p701="vQ25m11為不合理值或遺漏值".
Compute s701=2.
end if.
Exec.


*vQ25m12=0,1 96,98  .
do if not range(vQ25m12,0,1,96,98) | sys(vQ25m12).
compute m702=concat("vQ25m12=",string(vQ25m12,f2)).
compute p702="vQ25m12為不合理值或遺漏值".
Compute s702=2.
end if.
Exec.


*vQ25m13=0,1 96,98  .
do if not range(vQ25m13,0,1,96,98) | sys(vQ25m13).
compute m703=concat("vQ25m13=",string(vQ25m13,f2)).
compute p703="vQ25m13為不合理值或遺漏值".
Compute s703=2.
end if.
Exec.


*vQ25m14=0,1 96,98  .
do if not range(vQ25m14,0,1,96,98) | sys(vQ25m14).
compute m704=concat("vQ25m14=",string(vQ25m14,f2)).
compute p704="vQ25m14為不合理值或遺漏值".
Compute s704=2.
end if.
Exec.


*vQ25m15=0,1 96,98  .
do if not range(vQ25m15,0,1,96,98) | sys(vQ25m15).
compute m705=concat("vQ25m15=",string(vQ25m15,f2)).
compute p705="vQ25m15為不合理值或遺漏值".
Compute s705=2.
end if.
Exec.


*vQ25m16=0,1 96,98  .
do if not range(vQ25m16,0,1,96,98) | sys(vQ25m16).
compute m706=concat("vQ25m16=",string(vQ25m16,f2)).
compute p706="vQ25m16為不合理值或遺漏值".
Compute s706=2.
end if.
Exec.


*vQ25m17=0,1 96,98  .
do if not range(vQ25m17,0,1,96,98) | sys(vQ25m17).
compute m707=concat("vQ25m17=",string(vQ25m17,f2)).
compute p707="vQ25m17為不合理值或遺漏值".
Compute s707=2.
end if.
Exec.


*vQ25m18=0,1 96,98  .
do if not range(vQ25m18,0,1,96,98) | sys(vQ25m18).
compute m708=concat("vQ25m18=",string(vQ25m18,f2)).
compute p708="vQ25m18為不合理值或遺漏值".
Compute s708=2.
end if.
Exec.


*vQ25m19=0,1 96,98  .
do if not range(vQ25m19,0,1,96,98) | sys(vQ25m19).
compute m709=concat("vQ25m19=",string(vQ25m19,f2)).
compute p709="vQ25m19為不合理值或遺漏值".
Compute s709=2.
end if.
Exec.


*vQ25m20=0,1 96,98  .
do if not range(vQ25m20,0,1,96,98) | sys(vQ25m20).
compute m710=concat("vQ25m20=",string(vQ25m20,f2)).
compute p710="vQ25m20為不合理值或遺漏值".
Compute s710=2.
end if.
Exec.


*vQ25m21=0,1 96,98  .
do if not range(vQ25m21,0,1,96,98) | sys(vQ25m21).
compute m711=concat("vQ25m21=",string(vQ25m21,f2)).
compute p711="vQ25m21為不合理值或遺漏值".
Compute s711=2.
end if.
Exec.


*vQ25m22=0,1 96,98  .
do if not range(vQ25m22,0,1,96,98) | sys(vQ25m22).
compute m712=concat("vQ25m22=",string(vQ25m22,f2)).
compute p712="vQ25m22為不合理值或遺漏值".
Compute s712=2.
end if.
Exec.


*vQ25m23=0,1 96,98  .
do if not range(vQ25m23,0,1,96,98) | sys(vQ25m23).
compute m713=concat("vQ25m23=",string(vQ25m23,f2)).
compute p713="vQ25m23為不合理值或遺漏值".
Compute s713=2.
end if.
Exec.


*vQ25m24=0,1 96,98  .
do if not range(vQ25m24,0,1,96,98) | sys(vQ25m24).
compute m714=concat("vQ25m24=",string(vQ25m24,f2)).
compute p714="vQ25m24為不合理值或遺漏值".
Compute s714=2.
end if.
Exec.


*vQ25m25=0,1 96,98  .
do if not range(vQ25m25,0,1,96,98) | sys(vQ25m25).
compute m715=concat("vQ25m25=",string(vQ25m25,f2)).
compute p715="vQ25m25為不合理值或遺漏值".
Compute s715=2.
end if.
Exec.


*vQ25m26=0,1 96,98  .
do if not range(vQ25m26,0,1,96,98) | sys(vQ25m26).
compute m716=concat("vQ25m26=",string(vQ25m26,f2)).
compute p716="vQ25m26為不合理值或遺漏值".
Compute s716=2.
end if.
Exec.


*vQ25m27=0,1 96,98  .
do if not range(vQ25m27,0,1,96,98) | sys(vQ25m27).
compute m717=concat("vQ25m27=",string(vQ25m27,f2)).
compute p717="vQ25m27為不合理值或遺漏值".
Compute s717=2.
end if.
Exec.


*vQ25m28=0,1 96,98  .
do if not range(vQ25m28,0,1,96,98) | sys(vQ25m28).
compute m718=concat("vQ25m28=",string(vQ25m28,f2)).
compute p718="vQ25m28為不合理值或遺漏值".
Compute s718=2.
end if.
Exec.


*vQ25m29=0,1 96,98  .
do if not range(vQ25m29,0,1,96,98) | sys(vQ25m29).
compute m719=concat("vQ25m29=",string(vQ25m29,f2)).
compute p719="vQ25m29為不合理值或遺漏值".
Compute s719=2.
end if.
Exec.


*vQ25m30=0,1 96,98  .
do if not range(vQ25m30,0,1,96,98) | sys(vQ25m30).
compute m720=concat("vQ25m30=",string(vQ25m30,f2)).
compute p720="vQ25m30為不合理值或遺漏值".
Compute s720=2.
end if.
Exec.


*vQ25m31=0,1 96,98  .
do if not range(vQ25m31,0,1,96,98) | sys(vQ25m31).
compute m721=concat("vQ25m31=",string(vQ25m31,f2)).
compute p721="vQ25m31為不合理值或遺漏值".
Compute s721=2.
end if.
Exec.


*vQ25m88=0,1 96,98  .
do if not range(vQ25m88,0,1,96,98) | sys(vQ25m88).
compute m722=concat("vQ25m88=",string(vQ25m88,f2)).
compute p722="vQ25m88為不合理值或遺漏值".
Compute s722=2.
end if.
Exec.


*vQ21g1=0,140,996,998   .
do if not range(vQ21g1,0,140,9996,9998) | sys(vQ21g1).
compute m723=concat("vQ21g1=",string(vQ21g1,f4)).
compute p723="vQ21g1為不合理值或遺漏值".
Compute s723=2.
end if.
Exec.


*vQ21g2=00,59,97,98   .
do if not range(vQ21g2,00,59,996,998) | sys(vQ21g2).
compute m724=concat("vQ21g2=",string(vQ21g2,f3)).
compute p724="vQ21g2為不合理值或遺漏值".
Compute s724=2.
end if.
Exec.


*vQ22m01=0,1 96,98  .
do if not range(vQ22m01,0,1,96,98) | sys(vQ22m01).
compute m726=concat("vQ22m01=",string(vQ22m01,f2)).
compute p726="vQ22m01為不合理值或遺漏值".
Compute s726=2.
end if.
Exec.


*vQ22m02=0,1 96,98  .
do if not range(vQ22m02,0,1,96,98) | sys(vQ22m02).
compute m727=concat("vQ22m02=",string(vQ22m02,f2)).
compute p727="vQ22m02為不合理值或遺漏值".
Compute s727=2.
end if.
Exec.


*vQ22m03=0,1 96,98  .
do if not range(vQ22m03,0,1,96,98) | sys(vQ22m03).
compute m728=concat("vQ22m03=",string(vQ22m03,f2)).
compute p728="vQ22m03為不合理值或遺漏值".
Compute s728=2.
end if.
Exec.


*vQ22m04=0,1 96,98  .
do if not range(vQ22m04,0,1,96,98) | sys(vQ22m04).
compute m729=concat("vQ22m04=",string(vQ22m04,f2)).
compute p729="vQ22m04為不合理值或遺漏值".
Compute s729=2.
end if.
Exec.


*vQ22m05=0,1 96,98  .
do if not range(vQ22m05,0,1,96,98) | sys(vQ22m05).
compute m730=concat("vQ22m05=",string(vQ22m05,f2)).
compute p730="vQ22m05為不合理值或遺漏值".
Compute s730=2.
end if.
Exec.


*vQ22m06=0,1 96,98  .
do if not range(vQ22m06,0,1,96,98) | sys(vQ22m06).
compute m731=concat("vQ22m06=",string(vQ22m06,f2)).
compute p731="vQ22m06為不合理值或遺漏值".
Compute s731=2.
end if.
Exec.


*vQ22m07=0,1 96,98  .
do if not range(vQ22m07,0,1,96,98) | sys(vQ22m07).
compute m732=concat("vQ22m07=",string(vQ22m07,f2)).
compute p732="vQ22m07為不合理值或遺漏值".
Compute s732=2.
end if.
Exec.


*vQ22m08=0,1 96,98  .
do if not range(vQ22m08,0,1,96,98) | sys(vQ22m08).
compute m733=concat("vQ22m08=",string(vQ22m08,f2)).
compute p733="vQ22m08為不合理值或遺漏值".
Compute s733=2.
end if.
Exec.


*vQ22m09=0,1 96,98  .
do if not range(vQ22m09,0,1,96,98) | sys(vQ22m09).
compute m734=concat("vQ22m09=",string(vQ22m09,f2)).
compute p734="vQ22m09為不合理值或遺漏值".
Compute s734=2.
end if.
Exec.


*vQ22m10=0,1 96,98  .
do if not range(vQ22m10,0,1,96,98) | sys(vQ22m10).
compute m735=concat("vQ22m10=",string(vQ22m10,f2)).
compute p735="vQ22m10為不合理值或遺漏值".
Compute s735=2.
end if.
Exec.


*vQ22m11=0,1 96,98  .
do if not range(vQ22m11,0,1,96,98) | sys(vQ22m11).
compute m736=concat("vQ22m11=",string(vQ22m11,f2)).
compute p736="vQ22m11為不合理值或遺漏值".
Compute s736=2.
end if.
Exec.


*vQ22m12=0,1 96,98  .
do if not range(vQ22m12,0,1,96,98) | sys(vQ22m12).
compute m737=concat("vQ22m12=",string(vQ22m12,f2)).
compute p737="vQ22m12為不合理值或遺漏值".
Compute s737=2.
end if.
Exec.


*vQ22m13=0,1 96,98  .
do if not range(vQ22m13,0,1,96,98) | sys(vQ22m13).
compute m738=concat("vQ22m13=",string(vQ22m13,f2)).
compute p738="vQ22m13為不合理值或遺漏值".
Compute s738=2.
end if.
Exec.


*vQ22m14=0,1 96,98  .
do if not range(vQ22m14,0,1,96,98) | sys(vQ22m14).
compute m739=concat("vQ22m14=",string(vQ22m14,f2)).
compute p739="vQ22m14為不合理值或遺漏值".
Compute s739=2.
end if.
Exec.


*vQ22m15=0,1 96,98  .
do if not range(vQ22m15,0,1,96,98) | sys(vQ22m15).
compute m740=concat("vQ22m15=",string(vQ22m15,f2)).
compute p740="vQ22m15為不合理值或遺漏值".
Compute s740=2.
end if.
Exec.


*vQ22m16=0,1 96,98  .
do if not range(vQ22m16,0,1,96,98) | sys(vQ22m16).
compute m741=concat("vQ22m16=",string(vQ22m16,f2)).
compute p741="vQ22m16為不合理值或遺漏值".
Compute s741=2.
end if.
Exec.


*vQ22m17=0,1 96,98  .
do if not range(vQ22m17,0,1,96,98) | sys(vQ22m17).
compute m742=concat("vQ22m17=",string(vQ22m17,f2)).
compute p742="vQ22m17為不合理值或遺漏值".
Compute s742=2.
end if.
Exec.


*vQ22m18=0,1 96,98  .
do if not range(vQ22m18,0,1,96,98) | sys(vQ22m18).
compute m743=concat("vQ22m18=",string(vQ22m18,f2)).
compute p743="vQ22m18為不合理值或遺漏值".
Compute s743=2.
end if.
Exec.


*vQ22m19=0,1 96,98  .
do if not range(vQ22m19,0,1,96,98) | sys(vQ22m19).
compute m744=concat("vQ22m19=",string(vQ22m19,f2)).
compute p744="vQ22m19為不合理值或遺漏值".
Compute s744=2.
end if.
Exec.


*vQ22m20=0,1 96,98  .
do if not range(vQ22m20,0,1,96,98) | sys(vQ22m20).
compute m745=concat("vQ22m20=",string(vQ22m20,f2)).
compute p745="vQ22m20為不合理值或遺漏值".
Compute s745=2.
end if.
Exec.


*vQ22m21=0,1 96,98  .
do if not range(vQ22m21,0,1,96,98) | sys(vQ22m21).
compute m746=concat("vQ22m21=",string(vQ22m21,f2)).
compute p746="vQ22m21為不合理值或遺漏值".
Compute s746=2.
end if.
Exec.


*vQ22m22=0,1 96,98  .
do if not range(vQ22m22,0,1,96,98) | sys(vQ22m22).
compute m747=concat("vQ22m22=",string(vQ22m22,f2)).
compute p747="vQ22m22為不合理值或遺漏值".
Compute s747=2.
end if.
Exec.


*vQ22m23=0,1 96,98  .
do if not range(vQ22m23,0,1,96,98) | sys(vQ22m23).
compute m748=concat("vQ22m23=",string(vQ22m23,f2)).
compute p748="vQ22m23為不合理值或遺漏值".
Compute s748=2.
end if.
Exec.


*vQ22m24=0,1 96,98  .
do if not range(vQ22m24,0,1,96,98) | sys(vQ22m24).
compute m749=concat("vQ22m24=",string(vQ22m24,f2)).
compute p749="vQ22m24為不合理值或遺漏值".
Compute s749=2.
end if.
Exec.


*vQ22m25=0,1 96,98  .
do if not range(vQ22m25,0,1,96,98) | sys(vQ22m25).
compute m750=concat("vQ22m25=",string(vQ22m25,f2)).
compute p750="vQ22m25為不合理值或遺漏值".
Compute s750=2.
end if.
Exec.


*vQ22m26=0,1 96,98  .
do if not range(vQ22m26,0,1,96,98) | sys(vQ22m26).
compute m751=concat("vQ22m26=",string(vQ22m26,f2)).
compute p751="vQ22m26為不合理值或遺漏值".
Compute s751=2.
end if.
Exec.


*vQ22m27=0,1 96,98  .
do if not range(vQ22m27,0,1,96,98) | sys(vQ22m27).
compute m752=concat("vQ22m27=",string(vQ22m27,f2)).
compute p752="vQ22m27為不合理值或遺漏值".
Compute s752=2.
end if.
Exec.


*vQ22m28=0,1 96,98  .
do if not range(vQ22m28,0,1,96,98) | sys(vQ22m28).
compute m753=concat("vQ22m28=",string(vQ22m28,f2)).
compute p753="vQ22m28為不合理值或遺漏值".
Compute s753=2.
end if.
Exec.


*vQ22m29=0,1 96,98  .
do if not range(vQ22m29,0,1,96,98) | sys(vQ22m29).
compute m754=concat("vQ22m29=",string(vQ22m29,f2)).
compute p754="vQ22m29為不合理值或遺漏值".
Compute s754=2.
end if.
Exec.


*vQ22m30=0,1 96,98  .
do if not range(vQ22m30,0,1,96,98) | sys(vQ22m30).
compute m755=concat("vQ22m30=",string(vQ22m30,f2)).
compute p755="vQ22m30為不合理值或遺漏值".
Compute s755=2.
end if.
Exec.


*vQ22m31=0,1 96,98  .
do if not range(vQ22m31,0,1,96,98) | sys(vQ22m31).
compute m756=concat("vQ22m31=",string(vQ22m31,f2)).
compute p756="vQ22m31為不合理值或遺漏值".
Compute s756=2.
end if.
Exec.


*vQ22m32=0,1 96,98  .
do if not range(vQ22m32,0,1,96,98) | sys(vQ22m32).
compute m757=concat("vQ22m32=",string(vQ22m32,f2)).
compute p757="vQ22m32為不合理值或遺漏值".
Compute s757=2.
end if.
Exec.


*vQ22m33=0,1 96,98  .
do if not range(vQ22m33,0,1,96,98) | sys(vQ22m33).
compute m758=concat("vQ22m33=",string(vQ22m33,f2)).
compute p758="vQ22m33為不合理值或遺漏值".
Compute s758=2.
end if.
Exec.


*vQ22m34=0,1 96,98  .
do if not range(vQ22m34,0,1,96,98) | sys(vQ22m34).
compute m759=concat("vQ22m34=",string(vQ22m34,f2)).
compute p759="vQ22m34為不合理值或遺漏值".
Compute s759=2.
end if.
Exec.


*vQ22m35=0,1 96,98  .
do if not range(vQ22m35,0,1,96,98) | sys(vQ22m35).
compute m760=concat("vQ22m35=",string(vQ22m35,f2)).
compute p760="vQ22m35為不合理值或遺漏值".
Compute s760=2.
end if.
Exec.


*vQ22m36=0,1 96,98  .
do if not range(vQ22m36,0,1,96,98) | sys(vQ22m36).
compute m761=concat("vQ22m36=",string(vQ22m36,f2)).
compute p761="vQ22m36為不合理值或遺漏值".
Compute s761=2.
end if.
Exec.


*vQ22m37=0,1 96,98  .
do if not range(vQ22m37,0,1,96,98) | sys(vQ22m37).
compute m762=concat("vQ22m37=",string(vQ22m37,f2)).
compute p762="vQ22m37為不合理值或遺漏值".
Compute s762=2.
end if.
Exec.


*vQ22m38=0,1 96,98  .
do if not range(vQ22m38,0,1,96,98) | sys(vQ22m38).
compute m763=concat("vQ22m38=",string(vQ22m38,f2)).
compute p763="vQ22m38為不合理值或遺漏值".
Compute s763=2.
end if.
Exec.


*vQ22m39=0,1 96,98  .
do if not range(vQ22m39,0,1,96,98) | sys(vQ22m39).
compute m764=concat("vQ22m39=",string(vQ22m39,f2)).
compute p764="vQ22m39為不合理值或遺漏值".
Compute s764=2.
end if.
Exec.


*vQ22m40=0,1 96,98  .
do if not range(vQ22m40,0,1,96,98) | sys(vQ22m40).
compute m765=concat("vQ22m40=",string(vQ22m40,f2)).
compute p765="vQ22m40為不合理值或遺漏值".
Compute s765=2.
end if.
Exec.


*vQ22m88=0,1 96,98  .
do if not range(vQ22m88,0,1,96,98) | sys(vQ22m88).
compute m766=concat("vQ22m88=",string(vQ22m88,f2)).
compute p766="vQ22m88為不合理值或遺漏值".
Compute s766=2.
end if.
Exec.


*vQ23m01=0,1 96,98  .
do if not range(vQ23m01,0,1,96,98) | sys(vQ23m01).
compute m767=concat("vQ23m01=",string(vQ23m01,f2)).
compute p767="vQ23m01為不合理值或遺漏值".
Compute s767=2.
end if.
Exec.


*vQ23m02=0,1 96,98  .
do if not range(vQ23m02,0,1,96,98) | sys(vQ23m02).
compute m768=concat("vQ23m02=",string(vQ23m02,f2)).
compute p768="vQ23m02為不合理值或遺漏值".
Compute s768=2.
end if.
Exec.


*vQ23m03=0,1 96,98  .
do if not range(vQ23m03,0,1,96,98) | sys(vQ23m03).
compute m769=concat("vQ23m03=",string(vQ23m03,f2)).
compute p769="vQ23m03為不合理值或遺漏值".
Compute s769=2.
end if.
Exec.


*vQ23m04=0,1 96,98  .
do if not range(vQ23m04,0,1,96,98) | sys(vQ23m04).
compute m770=concat("vQ23m04=",string(vQ23m04,f2)).
compute p770="vQ23m04為不合理值或遺漏值".
Compute s770=2.
end if.
Exec.


*vQ23m05=0,1 96,98  .
do if not range(vQ23m05,0,1,96,98) | sys(vQ23m05).
compute m771=concat("vQ23m05=",string(vQ23m05,f2)).
compute p771="vQ23m05為不合理值或遺漏值".
Compute s771=2.
end if.
Exec.


*vQ23m06=0,1 96,98  .
do if not range(vQ23m06,0,1,96,98) | sys(vQ23m06).
compute m772=concat("vQ23m06=",string(vQ23m06,f2)).
compute p772="vQ23m06為不合理值或遺漏值".
Compute s772=2.
end if.
Exec.


*vQ23m07=0,1 96,98  .
do if not range(vQ23m07,0,1,96,98) | sys(vQ23m07).
compute m773=concat("vQ23m07=",string(vQ23m07,f2)).
compute p773="vQ23m07為不合理值或遺漏值".
Compute s773=2.
end if.
Exec.


*vQ23m08=0,1 96,98  .
do if not range(vQ23m08,0,1,96,98) | sys(vQ23m08).
compute m774=concat("vQ23m08=",string(vQ23m08,f2)).
compute p774="vQ23m08為不合理值或遺漏值".
Compute s774=2.
end if.
Exec.


*vQ23m09=0,1 96,98  .
do if not range(vQ23m09,0,1,96,98) | sys(vQ23m09).
compute m775=concat("vQ23m09=",string(vQ23m09,f2)).
compute p775="vQ23m09為不合理值或遺漏值".
Compute s775=2.
end if.
Exec.


*vQ23m10=0,1 96,98  .
do if not range(vQ23m10,0,1,96,98) | sys(vQ23m10).
compute m776=concat("vQ23m10=",string(vQ23m10,f2)).
compute p776="vQ23m10為不合理值或遺漏值".
Compute s776=2.
end if.
Exec.


*vQ23m11=0,1 96,98  .
do if not range(vQ23m11,0,1,96,98) | sys(vQ23m11).
compute m777=concat("vQ23m11=",string(vQ23m11,f2)).
compute p777="vQ23m11為不合理值或遺漏值".
Compute s777=2.
end if.
Exec.


*vQ23m12=0,1 96,98  .
do if not range(vQ23m12,0,1,96,98) | sys(vQ23m12).
compute m778=concat("vQ23m12=",string(vQ23m12,f2)).
compute p778="vQ23m12為不合理值或遺漏值".
Compute s778=2.
end if.
Exec.


*vQ23m13=0,1 96,98  .
do if not range(vQ23m13,0,1,96,98) | sys(vQ23m13).
compute m779=concat("vQ23m13=",string(vQ23m13,f2)).
compute p779="vQ23m13為不合理值或遺漏值".
Compute s779=2.
end if.
Exec.


*vQ23m14=0,1 96,98  .
do if not range(vQ23m14,0,1,96,98) | sys(vQ23m14).
compute m780=concat("vQ23m14=",string(vQ23m14,f2)).
compute p780="vQ23m14為不合理值或遺漏值".
Compute s780=2.
end if.
Exec.


*vQ23m15=0,1 96,98  .
do if not range(vQ23m15,0,1,96,98) | sys(vQ23m15).
compute m781=concat("vQ23m15=",string(vQ23m15,f2)).
compute p781="vQ23m15為不合理值或遺漏值".
Compute s781=2.
end if.
Exec.


*vQ23m16=0,1 96,98  .
do if not range(vQ23m16,0,1,96,98) | sys(vQ23m16).
compute m782=concat("vQ23m16=",string(vQ23m16,f2)).
compute p782="vQ23m16為不合理值或遺漏值".
Compute s782=2.
end if.
Exec.


*vQ23m17=0,1 96,98  .
do if not range(vQ23m17,0,1,96,98) | sys(vQ23m17).
compute m783=concat("vQ23m17=",string(vQ23m17,f2)).
compute p783="vQ23m17為不合理值或遺漏值".
Compute s783=2.
end if.
Exec.


*vQ23m18=0,1 96,98  .
do if not range(vQ23m18,0,1,96,98) | sys(vQ23m18).
compute m784=concat("vQ23m18=",string(vQ23m18,f2)).
compute p784="vQ23m18為不合理值或遺漏值".
Compute s784=2.
end if.
Exec.


*vQ23m19=0,1 96,98  .
do if not range(vQ23m19,0,1,96,98) | sys(vQ23m19).
compute m785=concat("vQ23m19=",string(vQ23m19,f2)).
compute p785="vQ23m19為不合理值或遺漏值".
Compute s785=2.
end if.
Exec.


*vQ23m20=0,1 96,98  .
do if not range(vQ23m20,0,1,96,98) | sys(vQ23m20).
compute m786=concat("vQ23m20=",string(vQ23m20,f2)).
compute p786="vQ23m20為不合理值或遺漏值".
Compute s786=2.
end if.
Exec.


*vQ23m21=0,1 96,98  .
do if not range(vQ23m21,0,1,96,98) | sys(vQ23m21).
compute m787=concat("vQ23m21=",string(vQ23m21,f2)).
compute p787="vQ23m21為不合理值或遺漏值".
Compute s787=2.
end if.
Exec.


*vQ23m22=0,1 96,98  .
do if not range(vQ23m22,0,1,96,98) | sys(vQ23m22).
compute m788=concat("vQ23m22=",string(vQ23m22,f2)).
compute p788="vQ23m22為不合理值或遺漏值".
Compute s788=2.
end if.
Exec.


*vQ23m23=0,1 96,98  .
do if not range(vQ23m23,0,1,96,98) | sys(vQ23m23).
compute m789=concat("vQ23m23=",string(vQ23m23,f2)).
compute p789="vQ23m23為不合理值或遺漏值".
Compute s789=2.
end if.
Exec.


*vQ23m24=0,1 96,98  .
do if not range(vQ23m24,0,1,96,98) | sys(vQ23m24).
compute m790=concat("vQ23m24=",string(vQ23m24,f2)).
compute p790="vQ23m24為不合理值或遺漏值".
Compute s790=2.
end if.
Exec.


*vQ23m25=0,1 96,98  .
do if not range(vQ23m25,0,1,96,98) | sys(vQ23m25).
compute m791=concat("vQ23m25=",string(vQ23m25,f2)).
compute p791="vQ23m25為不合理值或遺漏值".
Compute s791=2.
end if.
Exec.


*vQ23m26=0,1 96,98  .
do if not range(vQ23m26,0,1,96,98) | sys(vQ23m26).
compute m792=concat("vQ23m26=",string(vQ23m26,f2)).
compute p792="vQ23m26為不合理值或遺漏值".
Compute s792=2.
end if.
Exec.


*vQ23m27=0,1 96,98  .
do if not range(vQ23m27,0,1,96,98) | sys(vQ23m27).
compute m793=concat("vQ23m27=",string(vQ23m27,f2)).
compute p793="vQ23m27為不合理值或遺漏值".
Compute s793=2.
end if.
Exec.


*vQ23m28=0,1 96,98  .
 * do if not range(vQ23m28,0,1,96,98) | sys(vQ23m28).
 * compute m794=concat("vQ23m28=",string(vQ23m28,f2)).
 * compute p794="vQ23m28為不合理值或遺漏值".
 * Compute s794=2.
 * end if.
 * Exec.


*vQ23m88=0,1 96,98  .
do if not range(vQ23m88,0,1,96,98) | sys(vQ23m88).
compute m795=concat("vQ23m88=",string(vQ23m88,f2)).
compute p795="vQ23m88為不合理值或遺漏值".
Compute s795=2.
end if.
Exec.


*vQ26Ag1=0,140,996,998   .
do if not range(vQ26Ag1,0,140,9996,9998) | sys(vQ26Ag1).
compute m796=concat("vQ26Ag1=",string(vQ26Ag1,f4)).
compute p796="vQ26Ag1為不合理值或遺漏值".
Compute s796=2.
end if.
Exec.


*vQ26Ag2=00,59,97,98   .
do if not range(vQ26Ag2,00,59,996,998) | sys(vQ26Ag2).
compute m797=concat("vQ26Ag2=",string(vQ26Ag2,f3)).
compute p797="vQ26Ag2為不合理值或遺漏值".
Compute s797=2.
end if.
Exec.


*vQ26m01=0,1 96,98  .
do if not range(vQ26m01,0,1,96,98) | sys(vQ26m01).
compute m799=concat("vQ26m01=",string(vQ26m01,f2)).
compute p799="vQ26m01為不合理值或遺漏值".
Compute s799=2.
end if.
Exec.


*vQ26m02=0,1 96,98  .
do if not range(vQ26m02,0,1,96,98) | sys(vQ26m02).
compute m800=concat("vQ26m02=",string(vQ26m02,f2)).
compute p800="vQ26m02為不合理值或遺漏值".
Compute s800=2.
end if.
Exec.


*vQ26m03=0,1 96,98  .
do if not range(vQ26m03,0,1,96,98) | sys(vQ26m03).
compute m801=concat("vQ26m03=",string(vQ26m03,f2)).
compute p801="vQ26m03為不合理值或遺漏值".
Compute s801=2.
end if.
Exec.


*vQ26m04=0,1 96,98  .
do if not range(vQ26m04,0,1,96,98) | sys(vQ26m04).
compute m802=concat("vQ26m04=",string(vQ26m04,f2)).
compute p802="vQ26m04為不合理值或遺漏值".
Compute s802=2.
end if.
Exec.


*vQ26m05=0,1 96,98  .
do if not range(vQ26m05,0,1,96,98) | sys(vQ26m05).
compute m803=concat("vQ26m05=",string(vQ26m05,f2)).
compute p803="vQ26m05為不合理值或遺漏值".
Compute s803=2.
end if.
Exec.


*vQ26m06=0,1 96,98  .
do if not range(vQ26m06,0,1,96,98) | sys(vQ26m06).
compute m804=concat("vQ26m06=",string(vQ26m06,f2)).
compute p804="vQ26m06為不合理值或遺漏值".
Compute s804=2.
end if.
Exec.


*vQ26m07=0,1 96,98  .
do if not range(vQ26m07,0,1,96,98) | sys(vQ26m07).
compute m805=concat("vQ26m07=",string(vQ26m07,f2)).
compute p805="vQ26m07為不合理值或遺漏值".
Compute s805=2.
end if.
Exec.


*vQ26m08=0,1 96,98  .
do if not range(vQ26m08,0,1,96,98) | sys(vQ26m08).
compute m806=concat("vQ26m08=",string(vQ26m08,f2)).
compute p806="vQ26m08為不合理值或遺漏值".
Compute s806=2.
end if.
Exec.


*vQ26m09=0,1 96,98  .
do if not range(vQ26m09,0,1,96,98) | sys(vQ26m09).
compute m807=concat("vQ26m09=",string(vQ26m09,f2)).
compute p807="vQ26m09為不合理值或遺漏值".
Compute s807=2.
end if.
Exec.


*vQ26m10=0,1 96,98  .
do if not range(vQ26m10,0,1,96,98) | sys(vQ26m10).
compute m808=concat("vQ26m10=",string(vQ26m10,f2)).
compute p808="vQ26m10為不合理值或遺漏值".
Compute s808=2.
end if.
Exec.


*vQ26m11=0,1 96,98  .
do if not range(vQ26m11,0,1,96,98) | sys(vQ26m11).
compute m809=concat("vQ26m11=",string(vQ26m11,f2)).
compute p809="vQ26m11為不合理值或遺漏值".
Compute s809=2.
end if.
Exec.


*vQ26m12=0,1 96,98  .
do if not range(vQ26m12,0,1,96,98) | sys(vQ26m12).
compute m810=concat("vQ26m12=",string(vQ26m12,f2)).
compute p810="vQ26m12為不合理值或遺漏值".
Compute s810=2.
end if.
Exec.


*vQ26m13=0,1 96,98  .
do if not range(vQ26m13,0,1,96,98) | sys(vQ26m13).
compute m811=concat("vQ26m13=",string(vQ26m13,f2)).
compute p811="vQ26m13為不合理值或遺漏值".
Compute s811=2.
end if.
Exec.


*vQ26m14=0,1 96,98  .
do if not range(vQ26m14,0,1,96,98) | sys(vQ26m14).
compute m812=concat("vQ26m14=",string(vQ26m14,f2)).
compute p812="vQ26m14為不合理值或遺漏值".
Compute s812=2.
end if.
Exec.


*vQ26m15=0,1 96,98  .
do if not range(vQ26m15,0,1,96,98) | sys(vQ26m15).
compute m813=concat("vQ26m15=",string(vQ26m15,f2)).
compute p813="vQ26m15為不合理值或遺漏值".
Compute s813=2.
end if.
Exec.


*vQ26m16=0,1 96,98  .
do if not range(vQ26m16,0,1,96,98) | sys(vQ26m16).
compute m814=concat("vQ26m16=",string(vQ26m16,f2)).
compute p814="vQ26m16為不合理值或遺漏值".
Compute s814=2.
end if.
Exec.


*vQ26m17=0,1 96,98  .
do if not range(vQ26m17,0,1,96,98) | sys(vQ26m17).
compute m815=concat("vQ26m17=",string(vQ26m17,f2)).
compute p815="vQ26m17為不合理值或遺漏值".
Compute s815=2.
end if.
Exec.


*vQ26m18=0,1 96,98  .
do if not range(vQ26m18,0,1,96,98) | sys(vQ26m18).
compute m816=concat("vQ26m18=",string(vQ26m18,f2)).
compute p816="vQ26m18為不合理值或遺漏值".
Compute s816=2.
end if.
Exec.


*vQ26m19=0,1 96,98  .
do if not range(vQ26m19,0,1,96,98) | sys(vQ26m19).
compute m817=concat("vQ26m19=",string(vQ26m19,f2)).
compute p817="vQ26m19為不合理值或遺漏值".
Compute s817=2.
end if.
Exec.


*vQ26m20=0,1 96,98  .
do if not range(vQ26m20,0,1,96,98) | sys(vQ26m20).
compute m818=concat("vQ26m20=",string(vQ26m20,f2)).
compute p818="vQ26m20為不合理值或遺漏值".
Compute s818=2.
end if.
Exec.


*vQ26m21=0,1 96,98  .
do if not range(vQ26m21,0,1,96,98) | sys(vQ26m21).
compute m819=concat("vQ26m21=",string(vQ26m21,f2)).
compute p819="vQ26m21為不合理值或遺漏值".
Compute s819=2.
end if.
Exec.


*vQ26m22=0,1 96,98  .
do if not range(vQ26m22,0,1,96,98) | sys(vQ26m22).
compute m820=concat("vQ26m22=",string(vQ26m22,f2)).
compute p820="vQ26m22為不合理值或遺漏值".
Compute s820=2.
end if.
Exec.


*vQ26m23=0,1 96,98  .
do if not range(vQ26m23,0,1,96,98) | sys(vQ26m23).
compute m821=concat("vQ26m23=",string(vQ26m23,f2)).
compute p821="vQ26m23為不合理值或遺漏值".
Compute s821=2.
end if.
Exec.


*vQ26m24=0,1 96,98  .
do if not range(vQ26m24,0,1,96,98) | sys(vQ26m24).
compute m822=concat("vQ26m24=",string(vQ26m24,f2)).
compute p822="vQ26m24為不合理值或遺漏值".
Compute s822=2.
end if.
Exec.


*vQ26m25=0,1 96,98  .
do if not range(vQ26m25,0,1,96,98) | sys(vQ26m25).
compute m823=concat("vQ26m25=",string(vQ26m25,f2)).
compute p823="vQ26m25為不合理值或遺漏值".
Compute s823=2.
end if.
Exec.


*vQ26m26=0,1 96,98  .
do if not range(vQ26m26,0,1,96,98) | sys(vQ26m26).
compute m824=concat("vQ26m26=",string(vQ26m26,f2)).
compute p824="vQ26m26為不合理值或遺漏值".
Compute s824=2.
end if.
Exec.


*vQ26m27=0,1 96,98  .
do if not range(vQ26m27,0,1,96,98) | sys(vQ26m27).
compute m825=concat("vQ26m27=",string(vQ26m27,f2)).
compute p825="vQ26m27為不合理值或遺漏值".
Compute s825=2.
end if.
Exec.


*vQ26m28=0,1 96,98  .
do if not range(vQ26m28,0,1,96,98) | sys(vQ26m28).
compute m826=concat("vQ26m28=",string(vQ26m28,f2)).
compute p826="vQ26m28為不合理值或遺漏值".
Compute s826=2.
end if.
Exec.


*vQ26m29=0,1 96,98  .
do if not range(vQ26m29,0,1,96,98) | sys(vQ26m29).
compute m827=concat("vQ26m29=",string(vQ26m29,f2)).
compute p827="vQ26m29為不合理值或遺漏值".
Compute s827=2.
end if.
Exec.


*vQ26m88=0,1 96,98  .
do if not range(vQ26m88,0,1,96,98) | sys(vQ26m88).
compute m828=concat("vQ26m88=",string(vQ26m88,f2)).
compute p828="vQ26m88為不合理值或遺漏值".
Compute s828=2.
end if.
Exec.


*vQ27m01=0,1 96,98  .
do if not range(vQ27m01,0,1,96,98) | sys(vQ27m01).
compute m829=concat("vQ27m01=",string(vQ27m01,f2)).
compute p829="vQ27m01為不合理值或遺漏值".
Compute s829=2.
end if.
Exec.


*vQ27m02=0,1 96,98  .
do if not range(vQ27m02,0,1,96,98) | sys(vQ27m02).
compute m830=concat("vQ27m02=",string(vQ27m02,f2)).
compute p830="vQ27m02為不合理值或遺漏值".
Compute s830=2.
end if.
Exec.


*vQ27m03=0,1 96,98  .
do if not range(vQ27m03,0,1,96,98) | sys(vQ27m03).
compute m831=concat("vQ27m03=",string(vQ27m03,f2)).
compute p831="vQ27m03為不合理值或遺漏值".
Compute s831=2.
end if.
Exec.


*vQ27m04=0,1 96,98  .
do if not range(vQ27m04,0,1,96,98) | sys(vQ27m04).
compute m832=concat("vQ27m04=",string(vQ27m04,f2)).
compute p832="vQ27m04為不合理值或遺漏值".
Compute s832=2.
end if.
Exec.


*vQ27m05=0,1 96,98  .
do if not range(vQ27m05,0,1,96,98) | sys(vQ27m05).
compute m833=concat("vQ27m05=",string(vQ27m05,f2)).
compute p833="vQ27m05為不合理值或遺漏值".
Compute s833=2.
end if.
Exec.


*vQ27m06=0,1 96,98  .
do if not range(vQ27m06,0,1,96,98) | sys(vQ27m06).
compute m834=concat("vQ27m06=",string(vQ27m06,f2)).
compute p834="vQ27m06為不合理值或遺漏值".
Compute s834=2.
end if.
Exec.


*vQ27m07=0,1 96,98  .
do if not range(vQ27m07,0,1,96,98) | sys(vQ27m07).
compute m835=concat("vQ27m07=",string(vQ27m07,f2)).
compute p835="vQ27m07為不合理值或遺漏值".
Compute s835=2.
end if.
Exec.


*vQ27m88=0,1 96,98  .
do if not range(vQ27m88,0,1,96,98) | sys(vQ27m88).
compute m836=concat("vQ27m88=",string(vQ27m88,f2)).
compute p836="vQ27m88為不合理值或遺漏值".
Compute s836=2.
end if.
Exec.


*vQ27m90=0,1 96,98  .
 * do if not range(vQ27m90,0,1,96,98) | sys(vQ27m90).
 * compute m837=concat("vQ27m90=",string(vQ27m90,f2)).
 * compute p837="vQ27m90為不合理值或遺漏值".
 * Compute s837=2.
 * end if.
 * Exec.


*vP3_4=1,4 96,98  .
do if not range(vP3_4,1,4,96,98) | sys(vP3_4).
compute m838=concat("vP3_4=",string(vP3_4,f2)).
compute p838="vP3_4為不合理值或遺漏值".
Compute s838=2.
end if.
Exec.


*vP3_5=1,4 96,98  .
do if not range(vP3_5,1,4,96,98) | sys(vP3_5).
compute m840=concat("vP3_5=",string(vP3_5,f2)).
compute p840="vP3_5為不合理值或遺漏值".
Compute s840=2.
end if.
Exec.


*vP3_6=1,4 96,98  .
do if not range(vP3_6,1,4,96,98) | sys(vP3_6).
compute m841=concat("vP3_6=",string(vP3_6,f2)).
compute p841="vP3_6為不合理值或遺漏值".
Compute s841=2.
end if.
Exec.


*vP5_3R=1,4 96,98  .
do if not range(vP5_3R,1,4,96,98) | sys(vP5_3R).
compute m842=concat("vP5_3R=",string(vP5_3R,f2)).
compute p842="vP5_3R為不合理值或遺漏值".
Compute s842=2.
end if.
Exec.


*vP5_4R=1,4 96,98  .
do if not range(vP5_4R,1,4,96,98) | sys(vP5_4R).
compute m843=concat("vP5_4R=",string(vP5_4R,f2)).
compute p843="vP5_4R為不合理值或遺漏值".
Compute s843=2.
end if.
Exec.


*vP5_5=1,5 96,98  .
do if not range(vP5_5,1,5,96,98) | sys(vP5_5).
compute m844=concat("vP5_5=",string(vP5_5,f2)).
compute p844="vP5_5為不合理值或遺漏值".
Compute s844=2.
end if.
Exec.


*vQ28=0,500 991 997,998 .
do if not range(vQ28,0,500,991,991,997,998) | sys(vQ28).
compute m845=concat("vQ28=",string(vQ28,f4)).
compute p845="vQ28為不合理值或遺漏值".
Compute s845=2.
end if.
Exec.


*vQ30m01=0,1 96,98  .
do if not range(vQ30m01,0,1,96,98) | sys(vQ30m01).
compute m846=concat("vQ30m01=",string(vQ30m01,f2)).
compute p846="vQ30m01為不合理值或遺漏值".
Compute s846=2.
end if.
Exec.


*vQ30m02=0,1 96,98  .
do if not range(vQ30m02,0,1,96,98) | sys(vQ30m02).
compute m847=concat("vQ30m02=",string(vQ30m02,f2)).
compute p847="vQ30m02為不合理值或遺漏值".
Compute s847=2.
end if.
Exec.


*vQ30m03=0,1 96,98  .
do if not range(vQ30m03,0,1,96,98) | sys(vQ30m03).
compute m848=concat("vQ30m03=",string(vQ30m03,f2)).
compute p848="vQ30m03為不合理值或遺漏值".
Compute s848=2.
end if.
Exec.


*vQ30m04=0,1 96,98  .
do if not range(vQ30m04,0,1,96,98) | sys(vQ30m04).
compute m849=concat("vQ30m04=",string(vQ30m04,f2)).
compute p849="vQ30m04為不合理值或遺漏值".
Compute s849=2.
end if.
Exec.


*vQ30m05=0,1 96,98  .
do if not range(vQ30m05,0,1,96,98) | sys(vQ30m05).
compute m850=concat("vQ30m05=",string(vQ30m05,f2)).
compute p850="vQ30m05為不合理值或遺漏值".
Compute s850=2.
end if.
Exec.


*vQ30m06=0,1 96,98  .
do if not range(vQ30m06,0,1,96,98) | sys(vQ30m06).
compute m851=concat("vQ30m06=",string(vQ30m06,f2)).
compute p851="vQ30m06為不合理值或遺漏值".
Compute s851=2.
end if.
Exec.


*vQ30m07=0,1 96,98  .
do if not range(vQ30m07,0,1,96,98) | sys(vQ30m07).
compute m852=concat("vQ30m07=",string(vQ30m07,f2)).
compute p852="vQ30m07為不合理值或遺漏值".
Compute s852=2.
end if.
Exec.


*vQ30m08=0,1 96,98  .
do if not range(vQ30m08,0,1,96,98) | sys(vQ30m08).
compute m853=concat("vQ30m08=",string(vQ30m08,f2)).
compute p853="vQ30m08為不合理值或遺漏值".
Compute s853=2.
end if.
Exec.


*vQ30m90=0,1 96,98  .
do if not range(vQ30m90,0,1,96,98) | sys(vQ30m90).
compute m854=concat("vQ30m90=",string(vQ30m90,f2)).
compute p854="vQ30m90為不合理值或遺漏值".
Compute s854=2.
end if.
Exec.


*vQ31m01=0,1 96,98  .
do if not range(vQ31m01,0,1,96,98) | sys(vQ31m01).
compute m855=concat("vQ31m01=",string(vQ31m01,f2)).
compute p855="vQ31m01為不合理值或遺漏值".
Compute s855=2.
end if.
Exec.


*vQ31m02=0,1 96,98  .
do if not range(vQ31m02,0,1,96,98) | sys(vQ31m02).
compute m856=concat("vQ31m02=",string(vQ31m02,f2)).
compute p856="vQ31m02為不合理值或遺漏值".
Compute s856=2.
end if.
Exec.


*vQ31m03=0,1 96,98  .
do if not range(vQ31m03,0,1,96,98) | sys(vQ31m03).
compute m857=concat("vQ31m03=",string(vQ31m03,f2)).
compute p857="vQ31m03為不合理值或遺漏值".
Compute s857=2.
end if.
Exec.


*vQ31m04=0,1 96,98  .
do if not range(vQ31m04,0,1,96,98) | sys(vQ31m04).
compute m858=concat("vQ31m04=",string(vQ31m04,f2)).
compute p858="vQ31m04為不合理值或遺漏值".
Compute s858=2.
end if.
Exec.


*vQ31m05=0,1 96,98  .
do if not range(vQ31m05,0,1,96,98) | sys(vQ31m05).
compute m859=concat("vQ31m05=",string(vQ31m05,f2)).
compute p859="vQ31m05為不合理值或遺漏值".
Compute s859=2.
end if.
Exec.


*vQ31m06=0,1 96,98  .
do if not range(vQ31m06,0,1,96,98) | sys(vQ31m06).
compute m860=concat("vQ31m06=",string(vQ31m06,f2)).
compute p860="vQ31m06為不合理值或遺漏值".
Compute s860=2.
end if.
Exec.


*vQ31m07=0,1 96,98  .
do if not range(vQ31m07,0,1,96,98) | sys(vQ31m07).
compute m861=concat("vQ31m07=",string(vQ31m07,f2)).
compute p861="vQ31m07為不合理值或遺漏值".
Compute s861=2.
end if.
Exec.


*vQ31m08=0,1 96,98  .
do if not range(vQ31m08,0,1,96,98) | sys(vQ31m08).
compute m862=concat("vQ31m08=",string(vQ31m08,f2)).
compute p862="vQ31m08為不合理值或遺漏值".
Compute s862=2.
end if.
Exec.


*vQ31m90=0,1 96,98  .
do if not range(vQ31m90,0,1,96,98) | sys(vQ31m90).
compute m863=concat("vQ31m90=",string(vQ31m90,f2)).
compute p863="vQ31m90為不合理值或遺漏值".
Compute s863=2.
end if.
Exec.


*vQ32sQ32=1,5 97,98  .
do if not range(vQ32sQ32,1,5,97,98) | sys(vQ32sQ32).
compute m864=concat("vQ32sQ32=",string(vQ32sQ32,f2)).
compute p864="vQ32sQ32為不合理值或遺漏值".
Compute s864=2.
end if.
Exec.


*vQ32sQ33=1,5 97,98  .
do if not range(vQ32sQ33,1,5,97,98) | sys(vQ32sQ33).
compute m865=concat("vQ32sQ33=",string(vQ32sQ33,f2)).
compute p865="vQ32sQ33為不合理值或遺漏值".
Compute s865=2.
end if.
Exec.


*vQ32sQ34=1,5 97,98  .
do if not range(vQ32sQ34,1,5,97,98) | sys(vQ32sQ34).
compute m866=concat("vQ32sQ34=",string(vQ32sQ34,f2)).
compute p866="vQ32sQ34為不合理值或遺漏值".
Compute s866=2.
end if.
Exec.


*vQ58s58=1,5 97,98  .
do if not range(vQ58s58,1,5,97,98) | sys(vQ58s58).
compute m867=concat("vQ58s58=",string(vQ58s58,f2)).
compute p867="vQ58s58為不合理值或遺漏值".
Compute s867=2.
end if.
Exec.


*vQ58s59=1,5 97,98  .
do if not range(vQ58s59,1,5,97,98) | sys(vQ58s59).
compute m868=concat("vQ58s59=",string(vQ58s59,f2)).
compute p868="vQ58s59為不合理值或遺漏值".
Compute s868=2.
end if.
Exec.


*vQ58s60=1,5 97,98  .
do if not range(vQ58s60,1,5,97,98) | sys(vQ58s60).
compute m869=concat("vQ58s60=",string(vQ58s60,f2)).
compute p869="vQ58s60為不合理值或遺漏值".
Compute s869=2.
end if.
Exec.


*vQ58s61=1,5 97,98  .
do if not range(vQ58s61,1,5,97,98) | sys(vQ58s61).
compute m870=concat("vQ58s61=",string(vQ58s61,f2)).
compute p870="vQ58s61為不合理值或遺漏值".
Compute s870=2.
end if.
Exec.


*vQ46=1,5 97,98  .
do if not range(vQ46,1,5,97,98) | sys(vQ46).
compute m871=concat("vQ46=",string(vQ46,f2)).
compute p871="vQ46為不合理值或遺漏值".
Compute s871=2.
end if.
Exec.


*vP3_2=1,5 97,98  .
do if not range(vP3_2,1,5,97,98) | sys(vP3_2).
compute m872=concat("vP3_2=",string(vP3_2,f2)).
compute p872="vP3_2為不合理值或遺漏值".
Compute s872=2.
end if.
Exec.


*vP3_3=1,5 97,98  .
do if not range(vP3_3,1,5,97,98) | sys(vP3_3).
compute m873=concat("vP3_3=",string(vP3_3,f2)).
compute p873="vP3_3為不合理值或遺漏值".
Compute s873=2.
end if.
Exec.


*vP2_1=1,4 97,98  .
do if not range(vP2_1,1,4,97,98) | sys(vP2_1).
compute m874=concat("vP2_1=",string(vP2_1,f2)).
compute p874="vP2_1為不合理值或遺漏值".
Compute s874=2.
end if.
Exec.


*vP2_2=1,4 97,98  .
do if not range(vP2_2,1,4,97,98) | sys(vP2_2).
compute m875=concat("vP2_2=",string(vP2_2,f2)).
compute p875="vP2_2為不合理值或遺漏值".
Compute s875=2.
end if.
Exec.


*vP2_3=1,4 97,98  .
do if not range(vP2_3,1,4,97,98) | sys(vP2_3).
compute m876=concat("vP2_3=",string(vP2_3,f2)).
compute p876="vP2_3為不合理值或遺漏值".
Compute s876=2.
end if.
Exec.


*vP2_4=1,5 97,98  .
do if not range(vP2_4,1,5,97,98) | sys(vP2_4).
compute m877=concat("vP2_4=",string(vP2_4,f2)).
compute p877="vP2_4為不合理值或遺漏值".
Compute s877=2.
end if.
Exec.


*vP2_5=1,5 97,98  .
do if not range(vP2_5,1,5,97,98) | sys(vP2_5).
compute m878=concat("vP2_5=",string(vP2_5,f2)).
compute p878="vP2_5為不合理值或遺漏值".
Compute s878=2.
end if.
Exec.


*vP2_6=1,5 97,98  .
do if not range(vP2_6,1,5,97,98) | sys(vP2_6).
compute m879=concat("vP2_6=",string(vP2_6,f2)).
compute p879="vP2_6為不合理值或遺漏值".
Compute s879=2.
end if.
Exec.


*vQ43=1,8 97,98  .
do if not range(vQ43,1,8,97,98) | sys(vQ43).
compute m880=concat("vQ43=",string(vQ43,f2)).
compute p880="vQ43為不合理值或遺漏值".
Compute s880=2.
end if.
Exec.


*vQ44=1,12 88,98  .
do if not range(vQ44,1,12,88,98) | sys(vQ44).
compute m881=concat("vQ44=",string(vQ44,f2)).
compute p881="vQ44為不合理值或遺漏值".
Compute s881=2.
end if.
Exec.


*vQ45=1,12 88,98  .
do if not range(vQ45,1,12,88,98) | sys(vQ45).
compute m882=concat("vQ45=",string(vQ45,f2)).
compute p882="vQ45為不合理值或遺漏值".
Compute s882=2.
end if.
Exec.


*vQ47=0,100 997,998  .
do if not range(vQ47,0,100,997,998) | sys(vQ47).
compute m883=concat("vQ47=",string(vQ47,f4)).
compute p883="vQ47為不合理值或遺漏值".
Compute s883=2.
end if.
Exec.


*vQ48=0,100 997,998  .
do if not range(vQ48,0,100,997,998) | sys(vQ48).
compute m884=concat("vQ48=",string(vQ48,f4)).
compute p884="vQ48為不合理值或遺漏值".
Compute s884=2.
end if.
Exec.


*vQ62=0,100 997,998  .
do if not range(vQ62,0,100,997,998) | sys(vQ62).
compute m885=concat("vQ62=",string(vQ62,f4)).
compute p885="vQ62為不合理值或遺漏值".
Compute s885=2.
end if.
Exec.


*vQ49=1,2 97,98  .
do if not range(vQ49,1,2,97,98) | sys(vQ49).
compute m886=concat("vQ49=",string(vQ49,f2)).
compute p886="vQ49為不合理值或遺漏值".
Compute s886=2.
end if.
Exec.


*vQ50=1,2 97,98  .
do if not range(vQ50,1,2,96,98) | sys(vQ50).
compute m887=concat("vQ50=",string(vQ50,f2)).
compute p887="vQ50為不合理值或遺漏值".
Compute s887=2.
end if.
Exec.


*vQ51=1,18 88 96,98 .
do if not range(vQ51,1,18,88,88,96,98) | sys(vQ51).
compute m888=concat("vQ51=",string(vQ51,f2)).
compute p888="vQ51為不合理值或遺漏值".
Compute s888=2.
end if.
Exec.


*vQ52=1,3 94,98  .
do if not range(vQ52,1,3,94,98) | sys(vQ52).
compute m889=concat("vQ52=",string(vQ52,f2)).
compute p889="vQ52為不合理值或遺漏值".
Compute s889=2.
end if.
Exec.


*vQ53=1,6 88 93 95,98.
do if not range(vQ53,1,6,88,88,93,93,95,98) | sys(vQ53).
compute m890=concat("vQ53=",string(vQ53,f2)).
compute p890="vQ53為不合理值或遺漏值".
Compute s890=2.
end if.
Exec.


*vP3_1=0,10 97,98  .
do if not range(vP3_1,0,10,97,98) | sys(vP3_1).
compute m891=concat("vP3_1=",string(vP3_1,f3)).
compute p891="vP3_1為不合理值或遺漏值".
Compute s891=2.
end if.
Exec.


*vQ54=1,3 88 97,98 .
do if not range(vQ54,1,3,88,88,97,98) | sys(vQ54).
compute m892=concat("vQ54=",string(vQ54,f2)).
compute p892="vQ54為不合理值或遺漏值".
Compute s892=2.
end if.
Exec.


*vP5_6=0,10 97,98  .
do if not range(vP5_6,0,10,97,98) | sys(vP5_6).
compute m893=concat("vP5_6=",string(vP5_6,f2)).
compute p893="vP5_6為不合理值或遺漏值".
Compute s893=2.
end if.
Exec.


*vQ55=1,3 97,98  .
do if not range(vQ55,1,3,97,98) | sys(vQ55).
compute m894=concat("vQ55=",string(vQ55,f2)).
compute p894="vQ55為不合理值或遺漏值".
Compute s894=2.
end if.
Exec.


*vQ56=1,4 97,98  .
do if not range(vQ56,1,4,97,98) | sys(vQ56).
compute m895=concat("vQ56=",string(vQ56,f2)).
compute p895="vQ56為不合理值或遺漏值".
Compute s895=2.
end if.
Exec.


*vQ57=1,4 97,98  .
do if not range(vQ57,1,4,97,98) | sys(vQ57).
compute m896=concat("vQ57=",string(vQ57,f2)).
compute p896="vQ57為不合理值或遺漏值".
Compute s896=2.
end if.
Exec.


*vZE1=1,4   .
do if not range(vZE1,1,4) | sys(vZE1).
compute m900=concat("vZE1=",string(vZE1,f2)).
compute p900="vZE1為不合理值或遺漏值".
Compute s900=2.
end if.
Exec.


*vZE2m01=0,1 96  .
do if not range(vZE2m01,0,1,96,96) | sys(vZE2m01).
compute m902=concat("vZE2m01=",string(vZE2m01,f2)).
compute p902="vZE2m01為不合理值或遺漏值".
Compute s902=2.
end if.
Exec.


*vZE2m02=0,1 96  .
do if not range(vZE2m02,0,1,96,96) | sys(vZE2m02).
compute m903=concat("vZE2m02=",string(vZE2m02,f2)).
compute p903="vZE2m02為不合理值或遺漏值".
Compute s903=2.
end if.
Exec.


*vZE2m03=0,1 96  .
do if not range(vZE2m03,0,1,96,96) | sys(vZE2m03).
compute m904=concat("vZE2m03=",string(vZE2m03,f2)).
compute p904="vZE2m03為不合理值或遺漏值".
Compute s904=2.
end if.
Exec.


*vCKE4=96   .
do if not range(vCKE4,96,96) | sys(vCKE4).
compute m905=concat("vCKE4=",string(vCKE4,f14)).
compute p905="vCKE4為不合理值或遺漏值".
Compute s905=2.
end if.
Exec.


*vCKB5=96   .
do if not range(vCKB5,96,96) | sys(vCKB5).
compute m906=concat("vCKB5=",string(vCKB5,f14)).
compute p906="vCKB5為不合理值或遺漏值".
Compute s906=2.
end if.
Exec.


*vCKI4=96   .
do if not range(vCKI4,96,96) | sys(vCKI4).
compute m907=concat("vCKI4=",string(vCKI4,f14)).
compute p907="vCKI4為不合理值或遺漏值".
Compute s907=2.
end if.
Exec.


*vCKH7=20260615000000,20260930000000 99969696969696  .
do if not range(vCKH7,20260615000000,20260930000000,99969696969696,99969696969696) | sys(vCKH7).
compute m908=concat("vCKH7=",string(vCKH7,f14)).
compute p908="vCKH7為不合理值或遺漏值".
Compute s908=2.
end if.
Exec.


*vCKH7_1=20260615000000,20260930000000 99969696969696  .
do if not range(vCKH7_1,20260615000000,20260930000000,99969696969696,99969696969696) | sys(vCKH7_1).
compute m909=concat("vCKH7_1=",string(vCKH7_1,f14)).
compute p909="vCKH7_1為不合理值或遺漏值".
Compute s909=2.
end if.
Exec.


*vCKH7_2=20260615000000,20260930000000 99969696969696  .
do if not range(vCKH7_2,20260615000000,20260930000000,99969696969696,99969696969696) | sys(vCKH7_2).
compute m910=concat("vCKH7_2=",string(vCKH7_2,f14)).
compute p910="vCKH7_2為不合理值或遺漏值".
Compute s910=2.
end if.
Exec.


*vCKH7_3=20260615000000,20260930000000 99969696969696  .
do if not range(vCKH7_3,20260615000000,20260930000000,99969696969696,99969696969696) | sys(vCKH7_3).
compute m911=concat("vCKH7_3=",string(vCKH7_3,f14)).
compute p911="vCKH7_3為不合理值或遺漏值".
Compute s911=2.
end if.
Exec.


*vQa=20260615000000,20260930000000 99969696969696  .
do if not range(vQa,20260615000000,20260930000000,99969696969696,99969696969696) | sys(vQa).
compute m912=concat("vQa=",string(vQa,f14)).
compute p912="vQa為不合理值或遺漏值".
Compute s912=2.
end if.
Exec.


*vCKQ10=96   .
do if not range(vCKQ10,96,96) | sys(vCKQ10).
compute m913=concat("vCKQ10=",string(vCKQ10,f14)).
compute p913="vCKQ10為不合理值或遺漏值".
Compute s913=2.
end if.
Exec.


*vCKQ20=99969696969696   .
 * do if not range(vCKQ20,99969696969696,99969696969696) | sys(vCKQ20).
 * compute m914=concat("vCKQ20=",string(vCKQ20,f14)).
 * compute p914="vCKQ20為不合理值或遺漏值".
 * Compute s914=2.
 * end if.
 * Exec.


*vCKQ24=96   .
do if not range(vCKQ24,96,96) | sys(vCKQ24).
compute m915=concat("vCKQ24=",string(vCKQ24,f14)).
compute p915="vCKQ24為不合理值或遺漏值".
Compute s915=2.
end if.
Exec.


*vCKQ21=96   .
do if not range(vCKQ21,96,96) | sys(vCKQ21).
compute m916=concat("vCKQ21=",string(vCKQ21,f14)).
compute p916="vCKQ21為不合理值或遺漏值".
Compute s916=2.
end if.
Exec.


*vCKQ26A=96   .
do if not range(vCKQ26A,96,96) | sys(vCKQ26A).
compute m917=concat("vCKQ26A=",string(vCKQ26A,f14)).
compute p917="vCKQ26A為不合理值或遺漏值".
Compute s917=2.
end if.
Exec.


*vCKP3_4=96   .
do if not range(vCKP3_4,96,96) | sys(vCKP3_4).
compute m918=concat("vCKP3_4=",string(vCKP3_4,f14)).
compute p918="vCKP3_4為不合理值或遺漏值".
Compute s918=2.
end if.
Exec.


*vCkZE1=20260615000000,20260930000000   .
do if not range(vCkZE1,20260615000000,20260930000000,99969696969696,99969696969696) | sys(vCkZE1).
compute m922=concat("vCkZE1=",string(vCkZE1,f14)).
compute p922="vCkZE1為不合理值或遺漏值".
Compute s922=2.
end if.
Exec.


*vvckend=20260615000000,20260930000000   .
do if not range(vvckend,20260615000000,20260930000000) | sys(vvckend).
compute m923=concat("vvckend=",string(vvckend,f14)).
compute p923="vvckend為不合理值或遺漏值".
Compute s923=2.
end if.
Exec.

*vCKE5=96   .
do if not range(vCKE5,96,96) | sys(vCKE5).
compute m924=concat("vCKE5=",string(vCKE5,f2)).
compute p924="vCKE5為不合理值或遺漏值".
Compute s924=2.
end if.
Exec.


*vCKE8=96   .
do if not range(vCKE8,96,96) | sys(vCKE8).
compute m925=concat("vCKE8=",string(vCKE8,f2)).
compute p925="vCKE8為不合理值或遺漏值".
Compute s925=2.
end if.
Exec.


*vCKE11=96   .
do if not range(vCKE11,96,96) | sys(vCKE11).
compute m926=concat("vCKE11=",string(vCKE11,f2)).
compute p926="vCKE11為不合理值或遺漏值".
Compute s926=2.
end if.
Exec.


*vCKQ20A=96   .
do if not range(vCKQ20A,96,96) | sys(vCKQ20A).
compute m927=concat("vCKQ20A=",string(vCKQ20A,f2)).
compute p927="vCKQ20A為不合理值或遺漏值".
Compute s927=2.
end if.
Exec.


*vCKQ20B=96   .
do if not range(vCKQ20B,96,96) | sys(vCKQ20B).
compute m928=concat("vCKQ20B=",string(vCKQ20B,f2)).
compute p928="vCKQ20B為不合理值或遺漏值".
Compute s928=2.
end if.
Exec.




*ZA   .
do if any(vZA,2,3).
compute m929=concat("vZA=",string(vZA,F2),",vZAo03=",char.substr(vZAo03,1,150)).
compute p929="vZA答(02)、(03)".
Compute s929=1.
end if.
Exec.

 * ----------------------------------------------------------------------

 
*vZA 開放欄位檢核 是否為複選題=0.
do if vZA=3 & vZAo03="".
Compute m1101=concat("vZA=",string(vZA,F2),",vZAo03=",char.substr(vZAo03,1,150)).
compute p1101="vZAo03開放欄位應答而未答".
compute s1101=1.
else if vZA~=3 & vZAo03~="".
compute m1101=concat("vZA=",string(vZA,F2),",vZAo03=",char.substr(vZAo03,1,150)).
compute p1101="vZAo03開放欄位不該答而答".
compute s1101=1.
else if vZA=3 & vZAo03~="".
compute m1101=concat("vZA=",string(vZA,F2),",vZAo03=",char.substr(vZAo03,1,150)).
compute p1101="vZAo03開放欄位內容列出確認".
compute s1101=1.
end if.
Exec.


*vA3 開放欄位檢核 是否為複選題=0.
do if vA3=88 & vA3o88="".
Compute m1102=concat("vA3=",string(vA3,F2),",vA3o88=",char.substr(vA3o88,1,150)).
compute p1102="vA3o88開放欄位應答而未答".
compute s1102=2.
else if vA3~=88 & vA3o88~="".
compute m1102=concat("vA3=",string(vA3,F2),",vA3o88=",char.substr(vA3o88,1,150)).
compute p1102="vA3o88開放欄位不該答而答".
compute s1102=2.
else if vA3=88 & vA3o88~="".
compute m1102=concat("vA3=",string(vA3,F2),",vA3o88=",char.substr(vA3o88,1,150)).
compute p1102="vA3o88開放欄位內容列出確認".
compute s1102=2.
end if.
Exec.


*vA5city 開放欄位檢核 是否為複選題=0.
do if vA5city=29 & vA5city_oth="".
Compute m1103=concat("vA5city=",string(vA5city,F2),",vA5city_oth=",char.substr(vA5city_oth,1,150)).
compute p1103="vA5city_oth開放欄位應答而未答".
compute s1103=2.
else if vA5city~=29 & vA5city_oth~="".
compute m1103=concat("vA5city=",string(vA5city,F2),",vA5city_oth=",char.substr(vA5city_oth,1,150)).
compute p1103="vA5city_oth開放欄位不該答而答".
compute s1103=2.
else if vA5city=29 & vA5city_oth~="".
compute m1103=concat("vA5city=",string(vA5city,F2),",vA5city_oth=",char.substr(vA5city_oth,1,150)).
compute p1103="vA5city_oth開放欄位內容列出確認".
compute s1103=2.
end if.
Exec.


*vA6 開放欄位檢核 是否為複選題=0.
do if vA6=88 & vA6o88="".
Compute m1104=concat("vA6=",string(vA6,F2),",vA6o88=",char.substr(vA6o88,1,150)).
compute p1104="vA6o88開放欄位應答而未答".
compute s1104=2.
else if vA6~=88 & vA6o88~="".
compute m1104=concat("vA6=",string(vA6,F2),",vA6o88=",char.substr(vA6o88,1,150)).
compute p1104="vA6o88開放欄位不該答而答".
compute s1104=2.
else if vA6=88 & vA6o88~="".
compute m1104=concat("vA6=",string(vA6,F2),",vA6o88=",char.substr(vA6o88,1,150)).
compute p1104="vA6o88開放欄位內容列出確認".
compute s1104=2.
end if.
Exec.


*vA7 開放欄位檢核 是否為複選題=0.
do if vA7=88 & vA7o88="".
Compute m1105=concat("vA7=",string(vA7,F2),",vA7o88=",char.substr(vA7o88,1,150)).
compute p1105="vA7o88開放欄位應答而未答".
compute s1105=2.
else if vA7~=88 & vA7o88~="".
compute m1105=concat("vA7=",string(vA7,F2),",vA7o88=",char.substr(vA7o88,1,150)).
compute p1105="vA7o88開放欄位不該答而答".
compute s1105=2.
else if vA7=88 & vA7o88~="".
compute m1105=concat("vA7=",string(vA7,F2),",vA7o88=",char.substr(vA7o88,1,150)).
compute p1105="vA7o88開放欄位內容列出確認".
compute s1105=2.
end if.
Exec.


*vA8 開放欄位檢核 是否為複選題=0.
do if vA8=88 & vA8o88="".
Compute m1106=concat("vA8=",string(vA8,F2),",vA8o88=",char.substr(vA8o88,1,150)).
compute p1106="vA8o88開放欄位應答而未答".
compute s1106=2.
else if vA8~=88 & vA8o88~="".
compute m1106=concat("vA8=",string(vA8,F2),",vA8o88=",char.substr(vA8o88,1,150)).
compute p1106="vA8o88開放欄位不該答而答".
compute s1106=2.
else if vA8=88 & vA8o88~="".
compute m1106=concat("vA8=",string(vA8,F2),",vA8o88=",char.substr(vA8o88,1,150)).
compute p1106="vA8o88開放欄位內容列出確認".
compute s1106=2.
end if.
Exec.


*vA9 開放欄位檢核 是否為複選題=0.
do if vA9=88 & vA9o88="".
Compute m1107=concat("vA9=",string(vA9,F2),",vA9o88=",char.substr(vA9o88,1,150)).
compute p1107="vA9o88開放欄位應答而未答".
compute s1107=2.
else if vA9~=88 & vA9o88~="".
compute m1107=concat("vA9=",string(vA9,F2),",vA9o88=",char.substr(vA9o88,1,150)).
compute p1107="vA9o88開放欄位不該答而答".
compute s1107=2.
else if vA9=88 & vA9o88~="".
compute m1107=concat("vA9=",string(vA9,F2),",vA9o88=",char.substr(vA9o88,1,150)).
compute p1107="vA9o88開放欄位內容列出確認".
compute s1107=2.
end if.
Exec.


*vO1_1 開放欄位檢核 是否為複選題=0.
do if vO1_1=88 & vO1_1o88="".
Compute m1108=concat("vO1_1=",string(vO1_1,F2),",vO1_1o88=",char.substr(vO1_1o88,1,150)).
compute p1108="vO1_1o88開放欄位應答而未答".
compute s1108=2.
else if vO1_1~=88 & vO1_1o88~="".
compute m1108=concat("vO1_1=",string(vO1_1,F2),",vO1_1o88=",char.substr(vO1_1o88,1,150)).
compute p1108="vO1_1o88開放欄位不該答而答".
compute s1108=2.
else if vO1_1=88 & vO1_1o88~="".
compute m1108=concat("vO1_1=",string(vO1_1,F2),",vO1_1o88=",char.substr(vO1_1o88,1,150)).
compute p1108="vO1_1o88開放欄位內容列出確認".
compute s1108=2.
end if.
Exec.


*vO1 開放欄位檢核 是否為複選題=0.
do if vO1=88 & vO1o88="".
Compute m1109=concat("vO1=",string(vO1,F2),",vO1o88=",char.substr(vO1o88,1,150)).
compute p1109="vO1o88開放欄位應答而未答".
compute s1109=2.
else if vO1~=88 & vO1o88~="".
compute m1109=concat("vO1=",string(vO1,F2),",vO1o88=",char.substr(vO1o88,1,150)).
compute p1109="vO1o88開放欄位不該答而答".
compute s1109=2.
else if vO1=88 & vO1o88~="".
compute m1109=concat("vO1=",string(vO1,F2),",vO1o88=",char.substr(vO1o88,1,150)).
compute p1109="vO1o88開放欄位內容列出確認".
compute s1109=2.
end if.
Exec.


*vO2 開放欄位檢核 是否為複選題=0.
do if vO2=88 & vO2o88="".
Compute m1110=concat("vO2=",string(vO2,F2),",vO2o88=",char.substr(vO2o88,1,150)).
compute p1110="vO2o88開放欄位應答而未答".
compute s1110=2.
else if vO2~=88 & vO2o88~="".
compute m1110=concat("vO2=",string(vO2,F2),",vO2o88=",char.substr(vO2o88,1,150)).
compute p1110="vO2o88開放欄位不該答而答".
compute s1110=2.
else if vO2=88 & vO2o88~="".
compute m1110=concat("vO2=",string(vO2,F2),",vO2o88=",char.substr(vO2o88,1,150)).
compute p1110="vO2o88開放欄位內容列出確認".
compute s1110=2.
end if.
Exec.


*vO3 開放欄位檢核 是否為複選題=0.
do if vO3=88 & vO3o88="".
Compute m1111=concat("vO3=",string(vO3,F2),",vO3o88=",char.substr(vO3o88,1,150)).
compute p1111="vO3o88開放欄位應答而未答".
compute s1111=2.
else if vO3~=88 & vO3o88~="".
compute m1111=concat("vO3=",string(vO3,F2),",vO3o88=",char.substr(vO3o88,1,150)).
compute p1111="vO3o88開放欄位不該答而答".
compute s1111=2.
else if vO3=88 & vO3o88~="".
compute m1111=concat("vO3=",string(vO3,F2),",vO3o88=",char.substr(vO3o88,1,150)).
compute p1111="vO3o88開放欄位內容列出確認".
compute s1111=2.
end if.
Exec.


*vK1m88 開放欄位檢核 是否為複選題=1.
do if vK1m88=1 & vK1o88="".
Compute m1112=concat("vK1m88=",string(vK1m88,F2),",vK1o88=",char.substr(vK1o88,1,150)).
compute p1112="vK1o88開放欄位應答而未答".
compute s1112=2.
else if vK1m88~=1 & vK1o88~="".
compute m1112=concat("vK1m88=",string(vK1m88,F2),",vK1o88=",char.substr(vK1o88,1,150)).
compute p1112="vK1o88開放欄位不該答而答".
compute s1112=2.
else if vK1m88=1 & vK1o88~="".
compute m1112=concat("vK1m88=",string(vK1m88,F2),",vK1o88=",char.substr(vK1o88,1,150)).
compute p1112="vK1o88開放欄位內容列出確認".
compute s1112=2.
end if.
Exec.


*vK2m88 開放欄位檢核 是否為複選題=1.
do if vK2m88=1 & vK2o88="".
Compute m1113=concat("vK2m88=",string(vK2m88,F2),",vK2o88=",char.substr(vK2o88,1,150)).
compute p1113="vK2o88開放欄位應答而未答".
compute s1113=2.
else if vK2m88~=1 & vK2o88~="".
compute m1113=concat("vK2m88=",string(vK2m88,F2),",vK2o88=",char.substr(vK2o88,1,150)).
compute p1113="vK2o88開放欄位不該答而答".
compute s1113=2.
else if vK2m88=1 & vK2o88~="".
compute m1113=concat("vK2m88=",string(vK2m88,F2),",vK2o88=",char.substr(vK2o88,1,150)).
compute p1113="vK2o88開放欄位內容列出確認".
compute s1113=2.
end if.
Exec.


*vE17 開放欄位檢核 是否為複選題=0.
do if vE17=88 & vE17o88="".
Compute m1114=concat("vE17=",string(vE17,F2),",vE17o88=",char.substr(vE17o88,1,150)).
compute p1114="vE17o88開放欄位應答而未答".
compute s1114=2.
else if vE17~=88 & vE17o88~="".
compute m1114=concat("vE17=",string(vE17,F2),",vE17o88=",char.substr(vE17o88,1,150)).
compute p1114="vE17o88開放欄位不該答而答".
compute s1114=2.
else if vE17=88 & vE17o88~="".
compute m1114=concat("vE17=",string(vE17,F2),",vE17o88=",char.substr(vE17o88,1,150)).
compute p1114="vE17o88開放欄位內容列出確認".
compute s1114=2.
end if.
Exec.


*vKFB3m88 開放欄位檢核 是否為複選題=1.
do if vKFB3m88=1 & vKFB3o88="".
Compute m1115=concat("vKFB3m88=",string(vKFB3m88,F2),",vKFB3o88=",char.substr(vKFB3o88,1,150)).
compute p1115="vKFB3o88開放欄位應答而未答".
compute s1115=2.
else if vKFB3m88~=1 & vKFB3o88~="".
compute m1115=concat("vKFB3m88=",string(vKFB3m88,F2),",vKFB3o88=",char.substr(vKFB3o88,1,150)).
compute p1115="vKFB3o88開放欄位不該答而答".
compute s1115=2.
else if vKFB3m88=1 & vKFB3o88~="".
compute m1115=concat("vKFB3m88=",string(vKFB3m88,F2),",vKFB3o88=",char.substr(vKFB3o88,1,150)).
compute p1115="vKFB3o88開放欄位內容列出確認".
compute s1115=2.
end if.
Exec.


*vKFB4m88 開放欄位檢核 是否為複選題=1.
do if vKFB4m88=1 & vKFB4o88="".
Compute m1116=concat("vKFB4m88=",string(vKFB4m88,F2),",vKFB4o88=",char.substr(vKFB4o88,1,150)).
compute p1116="vKFB4o88開放欄位應答而未答".
compute s1116=2.
else if vKFB4m88~=1 & vKFB4o88~="".
compute m1116=concat("vKFB4m88=",string(vKFB4m88,F2),",vKFB4o88=",char.substr(vKFB4o88,1,150)).
compute p1116="vKFB4o88開放欄位不該答而答".
compute s1116=2.
else if vKFB4m88=1 & vKFB4o88~="".
compute m1116=concat("vKFB4m88=",string(vKFB4m88,F2),",vKFB4o88=",char.substr(vKFB4o88,1,150)).
compute p1116="vKFB4o88開放欄位內容列出確認".
compute s1116=2.
end if.
Exec.


*vKIG3m88 開放欄位檢核 是否為複選題=1.
do if vKIG3m88=1 & vKIG3o88="".
Compute m1117=concat("vKIG3m88=",string(vKIG3m88,F2),",vKIG3o88=",char.substr(vKIG3o88,1,150)).
compute p1117="vKIG3o88開放欄位應答而未答".
compute s1117=2.
else if vKIG3m88~=1 & vKIG3o88~="".
compute m1117=concat("vKIG3m88=",string(vKIG3m88,F2),",vKIG3o88=",char.substr(vKIG3o88,1,150)).
compute p1117="vKIG3o88開放欄位不該答而答".
compute s1117=2.
else if vKIG3m88=1 & vKIG3o88~="".
compute m1117=concat("vKIG3m88=",string(vKIG3m88,F2),",vKIG3o88=",char.substr(vKIG3o88,1,150)).
compute p1117="vKIG3o88開放欄位內容列出確認".
compute s1117=2.
end if.
Exec.


*vKIG4m88 開放欄位檢核 是否為複選題=1.
do if vKIG4m88=1 & vKIG4o88="".
Compute m1118=concat("vKIG4m88=",string(vKIG4m88,F2),",vKIG4o88=",char.substr(vKIG4o88,1,150)).
compute p1118="vKIG4o88開放欄位應答而未答".
compute s1118=2.
else if vKIG4m88~=1 & vKIG4o88~="".
compute m1118=concat("vKIG4m88=",string(vKIG4m88,F2),",vKIG4o88=",char.substr(vKIG4o88,1,150)).
compute p1118="vKIG4o88開放欄位不該答而答".
compute s1118=2.
else if vKIG4m88=1 & vKIG4o88~="".
compute m1118=concat("vKIG4m88=",string(vKIG4m88,F2),",vKIG4o88=",char.substr(vKIG4o88,1,150)).
compute p1118="vKIG4o88開放欄位內容列出確認".
compute s1118=2.
end if.
Exec.


*vKTT3m88 開放欄位檢核 是否為複選題=1.
do if vKTT3m88=1 & vKTT3o88="".
Compute m1119=concat("vKTT3m88=",string(vKTT3m88,F2),",vKTT3o88=",char.substr(vKTT3o88,1,150)).
compute p1119="vKTT3o88開放欄位應答而未答".
compute s1119=2.
else if vKTT3m88~=1 & vKTT3o88~="".
compute m1119=concat("vKTT3m88=",string(vKTT3m88,F2),",vKTT3o88=",char.substr(vKTT3o88,1,150)).
compute p1119="vKTT3o88開放欄位不該答而答".
compute s1119=2.
else if vKTT3m88=1 & vKTT3o88~="".
compute m1119=concat("vKTT3m88=",string(vKTT3m88,F2),",vKTT3o88=",char.substr(vKTT3o88,1,150)).
compute p1119="vKTT3o88開放欄位內容列出確認".
compute s1119=2.
end if.
Exec.


*vKTT4m88 開放欄位檢核 是否為複選題=1.
do if vKTT4m88=1 & vKTT4o88="".
Compute m1120=concat("vKTT4m88=",string(vKTT4m88,F2),",vKTT4o88=",char.substr(vKTT4o88,1,150)).
compute p1120="vKTT4o88開放欄位應答而未答".
compute s1120=2.
else if vKTT4m88~=1 & vKTT4o88~="".
compute m1120=concat("vKTT4m88=",string(vKTT4m88,F2),",vKTT4o88=",char.substr(vKTT4o88,1,150)).
compute p1120="vKTT4o88開放欄位不該答而答".
compute s1120=2.
else if vKTT4m88=1 & vKTT4o88~="".
compute m1120=concat("vKTT4m88=",string(vKTT4m88,F2),",vKTT4o88=",char.substr(vKTT4o88,1,150)).
compute p1120="vKTT4o88開放欄位內容列出確認".
compute s1120=2.
end if.
Exec.


*vKTT5m88 開放欄位檢核 是否為複選題=1.
do if vKTT5m88=1 & vKTT5o88="".
Compute m1121=concat("vKTT5m88=",string(vKTT5m88,F2),",vKTT5o88=",char.substr(vKTT5o88,1,150)).
compute p1121="vKTT5o88開放欄位應答而未答".
compute s1121=2.
else if vKTT5m88~=1 & vKTT5o88~="".
compute m1121=concat("vKTT5m88=",string(vKTT5m88,F2),",vKTT5o88=",char.substr(vKTT5o88,1,150)).
compute p1121="vKTT5o88開放欄位不該答而答".
compute s1121=2.
else if vKTT5m88=1 & vKTT5o88~="".
compute m1121=concat("vKTT5m88=",string(vKTT5m88,F2),",vKTT5o88=",char.substr(vKTT5o88,1,150)).
compute p1121="vKTT5o88開放欄位內容列出確認".
compute s1121=2.
end if.
Exec.


*vK3m88 開放欄位檢核 是否為複選題=1.
do if vK3m88=1 & vK3o88="".
Compute m1122=concat("vK3m88=",string(vK3m88,F2),",vK3o88=",char.substr(vK3o88,1,150)).
compute p1122="vK3o88開放欄位應答而未答".
compute s1122=2.
else if vK3m88~=1 & vK3o88~="".
compute m1122=concat("vK3m88=",string(vK3m88,F2),",vK3o88=",char.substr(vK3o88,1,150)).
compute p1122="vK3o88開放欄位不該答而答".
compute s1122=2.
else if vK3m88=1 & vK3o88~="".
compute m1122=concat("vK3m88=",string(vK3m88,F2),",vK3o88=",char.substr(vK3o88,1,150)).
compute p1122="vK3o88開放欄位內容列出確認".
compute s1122=2.
end if.
Exec.


*vE18 開放欄位檢核 是否為複選題=0.
do if vE18=88 & vE18o88="".
Compute m1123=concat("vE18=",string(vE18,F2),",vE18o88=",char.substr(vE18o88,1,150)).
compute p1123="vE18o88開放欄位應答而未答".
compute s1123=2.
else if vE18~=88 & vE18o88~="".
compute m1123=concat("vE18=",string(vE18,F2),",vE18o88=",char.substr(vE18o88,1,150)).
compute p1123="vE18o88開放欄位不該答而答".
compute s1123=2.
else if vE18=88 & vE18o88~="".
compute m1123=concat("vE18=",string(vE18,F2),",vE18o88=",char.substr(vE18o88,1,150)).
compute p1123="vE18o88開放欄位內容列出確認".
compute s1123=2.
end if.
Exec.


*vE2m88 開放欄位檢核 是否為複選題=1.
do if vE2m88=1 & vE2o88="".
Compute m1124=concat("vE2m88=",string(vE2m88,F2),",vE2o88=",char.substr(vE2o88,1,150)).
compute p1124="vE2o88開放欄位應答而未答".
compute s1124=2.
else if vE2m88~=1 & vE2o88~="".
compute m1124=concat("vE2m88=",string(vE2m88,F2),",vE2o88=",char.substr(vE2o88,1,150)).
compute p1124="vE2o88開放欄位不該答而答".
compute s1124=2.
else if vE2m88=1 & vE2o88~="".
compute m1124=concat("vE2m88=",string(vE2m88,F2),",vE2o88=",char.substr(vE2o88,1,150)).
compute p1124="vE2o88開放欄位內容列出確認".
compute s1124=2.
end if.
Exec.


*vE13m88 開放欄位檢核 是否為複選題=1.
do if vE13m88=1 & vE13o88="".
Compute m1126=concat("vE13m88=",string(vE13m88,F2),",vE13o88=",char.substr(vE13o88,1,150)).
compute p1126="vE13o88開放欄位應答而未答".
compute s1126=2.
else if vE13m88~=1 & vE13o88~="".
compute m1126=concat("vE13m88=",string(vE13m88,F2),",vE13o88=",char.substr(vE13o88,1,150)).
compute p1126="vE13o88開放欄位不該答而答".
compute s1126=2.
else if vE13m88=1 & vE13o88~="".
compute m1126=concat("vE13m88=",string(vE13m88,F2),",vE13o88=",char.substr(vE13o88,1,150)).
compute p1126="vE13o88開放欄位內容列出確認".
compute s1126=2.
end if.
Exec.


*vG7m88 開放欄位檢核 是否為複選題=1.
do if vG7m88=1 & vG7o88="".
Compute m1127=concat("vG7m88=",string(vG7m88,F2),",vG7o88=",char.substr(vG7o88,1,150)).
compute p1127="vG7o88開放欄位應答而未答".
compute s1127=2.
else if vG7m88~=1 & vG7o88~="".
compute m1127=concat("vG7m88=",string(vG7m88,F2),",vG7o88=",char.substr(vG7o88,1,150)).
compute p1127="vG7o88開放欄位不該答而答".
compute s1127=2.
else if vG7m88=1 & vG7o88~="".
compute m1127=concat("vG7m88=",string(vG7m88,F2),",vG7o88=",char.substr(vG7o88,1,150)).
compute p1127="vG7o88開放欄位內容列出確認".
compute s1127=2.
end if.
Exec.


*vG8m88 開放欄位檢核 是否為複選題=1.
do if vG8m88=1 & vG8o88="".
Compute m1128=concat("vG8m88=",string(vG8m88,F2),",vG8o88=",char.substr(vG8o88,1,150)).
compute p1128="vG8o88開放欄位應答而未答".
compute s1128=2.
else if vG8m88~=1 & vG8o88~="".
compute m1128=concat("vG8m88=",string(vG8m88,F2),",vG8o88=",char.substr(vG8o88,1,150)).
compute p1128="vG8o88開放欄位不該答而答".
compute s1128=2.
else if vG8m88=1 & vG8o88~="".
compute m1128=concat("vG8m88=",string(vG8m88,F2),",vG8o88=",char.substr(vG8o88,1,150)).
compute p1128="vG8o88開放欄位內容列出確認".
compute s1128=2.
end if.
Exec.


*vG9m88 開放欄位檢核 是否為複選題=1.
do if vG9m88=1 & vG9o88="".
Compute m1129=concat("vG9m88=",string(vG9m88,F2),",vG9o88=",char.substr(vG9o88,1,150)).
compute p1129="vG9o88開放欄位應答而未答".
compute s1129=2.
else if vG9m88~=1 & vG9o88~="".
compute m1129=concat("vG9m88=",string(vG9m88,F2),",vG9o88=",char.substr(vG9o88,1,150)).
compute p1129="vG9o88開放欄位不該答而答".
compute s1129=2.
else if vG9m88=1 & vG9o88~="".
compute m1129=concat("vG9m88=",string(vG9m88,F2),",vG9o88=",char.substr(vG9o88,1,150)).
compute p1129="vG9o88開放欄位內容列出確認".
compute s1129=2.
end if.
Exec.


*vG10m88 開放欄位檢核 是否為複選題=1.
do if vG10m88=1 & vG10o88="".
Compute m1130=concat("vG10m88=",string(vG10m88,F2),",vG10o88=",char.substr(vG10o88,1,150)).
compute p1130="vG10o88開放欄位應答而未答".
compute s1130=2.
else if vG10m88~=1 & vG10o88~="".
compute m1130=concat("vG10m88=",string(vG10m88,F2),",vG10o88=",char.substr(vG10o88,1,150)).
compute p1130="vG10o88開放欄位不該答而答".
compute s1130=2.
else if vG10m88=1 & vG10o88~="".
compute m1130=concat("vG10m88=",string(vG10m88,F2),",vG10o88=",char.substr(vG10o88,1,150)).
compute p1130="vG10o88開放欄位內容列出確認".
compute s1130=2.
end if.
Exec.


*vG11m88 開放欄位檢核 是否為複選題=1.
do if vG11m88=1 & vG11o88="".
Compute m1131=concat("vG11m88=",string(vG11m88,F2),",vG11o88=",char.substr(vG11o88,1,150)).
compute p1131="vG11o88開放欄位應答而未答".
compute s1131=2.
else if vG11m88~=1 & vG11o88~="".
compute m1131=concat("vG11m88=",string(vG11m88,F2),",vG11o88=",char.substr(vG11o88,1,150)).
compute p1131="vG11o88開放欄位不該答而答".
compute s1131=2.
else if vG11m88=1 & vG11o88~="".
compute m1131=concat("vG11m88=",string(vG11m88,F2),",vG11o88=",char.substr(vG11o88,1,150)).
compute p1131="vG11o88開放欄位內容列出確認".
compute s1131=2.
end if.
Exec.


*vB7am88 開放欄位檢核 是否為複選題=1.
do if vB7am88=1 & vB7ao88="".
Compute m1132=concat("vB7am88=",string(vB7am88,F2),",vB7ao88=",char.substr(vB7ao88,1,150)).
compute p1132="vB7ao88開放欄位應答而未答".
compute s1132=2.
else if vB7am88~=1 & vB7ao88~="".
compute m1132=concat("vB7am88=",string(vB7am88,F2),",vB7ao88=",char.substr(vB7ao88,1,150)).
compute p1132="vB7ao88開放欄位不該答而答".
compute s1132=2.
else if vB7am88=1 & vB7ao88~="".
compute m1132=concat("vB7am88=",string(vB7am88,F2),",vB7ao88=",char.substr(vB7ao88,1,150)).
compute p1132="vB7ao88開放欄位內容列出確認".
compute s1132=2.
end if.
Exec.


*vB7 開放欄位檢核 是否為複選題=0.
do if vB7=88 & vB7o88="".
Compute m1133=concat("vB7=",string(vB7,F2),",vB7o88=",char.substr(vB7o88,1,150)).
compute p1133="vB7o88開放欄位應答而未答".
compute s1133=2.
else if vB7~=88 & vB7o88~="".
compute m1133=concat("vB7=",string(vB7,F2),",vB7o88=",char.substr(vB7o88,1,150)).
compute p1133="vB7o88開放欄位不該答而答".
compute s1133=2.
else if vB7=88 & vB7o88~="".
compute m1133=concat("vB7=",string(vB7,F2),",vB7o88=",char.substr(vB7o88,1,150)).
compute p1133="vB7o88開放欄位內容列出確認".
compute s1133=2.
end if.
Exec.


*vB8m88 開放欄位檢核 是否為複選題=1.
do if vB8m88=1 & vB8o88="".
Compute m1134=concat("vB8m88=",string(vB8m88,F2),",vB8o88=",char.substr(vB8o88,1,150)).
compute p1134="vB8o88開放欄位應答而未答".
compute s1134=2.
else if vB8m88~=1 & vB8o88~="".
compute m1134=concat("vB8m88=",string(vB8m88,F2),",vB8o88=",char.substr(vB8o88,1,150)).
compute p1134="vB8o88開放欄位不該答而答".
compute s1134=2.
else if vB8m88=1 & vB8o88~="".
compute m1134=concat("vB8m88=",string(vB8m88,F2),",vB8o88=",char.substr(vB8o88,1,150)).
compute p1134="vB8o88開放欄位內容列出確認".
compute s1134=2.
end if.
Exec.


*vG3m88 開放欄位檢核 是否為複選題=1.
do if vG3m88=1 & vG3o88="".
Compute m1135=concat("vG3m88=",string(vG3m88,F2),",vG3o88=",char.substr(vG3o88,1,150)).
compute p1135="vG3o88開放欄位應答而未答".
compute s1135=2.
else if vG3m88~=1 & vG3o88~="".
compute m1135=concat("vG3m88=",string(vG3m88,F2),",vG3o88=",char.substr(vG3o88,1,150)).
compute p1135="vG3o88開放欄位不該答而答".
compute s1135=2.
else if vG3m88=1 & vG3o88~="".
compute m1135=concat("vG3m88=",string(vG3m88,F2),",vG3o88=",char.substr(vG3o88,1,150)).
compute p1135="vG3o88開放欄位內容列出確認".
compute s1135=2.
end if.
Exec.


*vF5m88 開放欄位檢核 是否為複選題=1.
do if vF5m88=1 & vF5o88="".
Compute m1136=concat("vF5m88=",string(vF5m88,F2),",vF5o88=",char.substr(vF5o88,1,150)).
compute p1136="vF5o88開放欄位應答而未答".
compute s1136=2.
else if vF5m88~=1 & vF5o88~="".
compute m1136=concat("vF5m88=",string(vF5m88,F2),",vF5o88=",char.substr(vF5o88,1,150)).
compute p1136="vF5o88開放欄位不該答而答".
compute s1136=2.
else if vF5m88=1 & vF5o88~="".
compute m1136=concat("vF5m88=",string(vF5m88,F2),",vF5o88=",char.substr(vF5o88,1,150)).
compute p1136="vF5o88開放欄位內容列出確認".
compute s1136=2.
end if.
Exec.


*vC3m88 開放欄位檢核 是否為複選題=1.
do if vC3m88=1 & vC3o88="".
Compute m1137=concat("vC3m88=",string(vC3m88,F2),",vC3o88=",char.substr(vC3o88,1,150)).
compute p1137="vC3o88開放欄位應答而未答".
compute s1137=2.
else if vC3m88~=1 & vC3o88~="".
compute m1137=concat("vC3m88=",string(vC3m88,F2),",vC3o88=",char.substr(vC3o88,1,150)).
compute p1137="vC3o88開放欄位不該答而答".
compute s1137=2.
else if vC3m88=1 & vC3o88~="".
compute m1137=concat("vC3m88=",string(vC3m88,F2),",vC3o88=",char.substr(vC3o88,1,150)).
compute p1137="vC3o88開放欄位內容列出確認".
compute s1137=2.
end if.
Exec.


*vJB1m88 開放欄位檢核 是否為複選題=1.
do if vJB1m88=1 & vJB1o88="".
Compute m1138=concat("vJB1m88=",string(vJB1m88,F2),",vJB1o88=",char.substr(vJB1o88,1,150)).
compute p1138="vJB1o88開放欄位應答而未答".
compute s1138=2.
else if vJB1m88~=1 & vJB1o88~="".
compute m1138=concat("vJB1m88=",string(vJB1m88,F2),",vJB1o88=",char.substr(vJB1o88,1,150)).
compute p1138="vJB1o88開放欄位不該答而答".
compute s1138=2.
else if vJB1m88=1 & vJB1o88~="".
compute m1138=concat("vJB1m88=",string(vJB1m88,F2),",vJB1o88=",char.substr(vJB1o88,1,150)).
compute p1138="vJB1o88開放欄位內容列出確認".
compute s1138=2.
end if.
Exec.


*vJB2m88 開放欄位檢核 是否為複選題=1.
do if vJB2m88=1 & vJB2o88="".
Compute m1139=concat("vJB2m88=",string(vJB2m88,F2),",vJB2o88=",char.substr(vJB2o88,1,150)).
compute p1139="vJB2o88開放欄位應答而未答".
compute s1139=2.
else if vJB2m88~=1 & vJB2o88~="".
compute m1139=concat("vJB2m88=",string(vJB2m88,F2),",vJB2o88=",char.substr(vJB2o88,1,150)).
compute p1139="vJB2o88開放欄位不該答而答".
compute s1139=2.
else if vJB2m88=1 & vJB2o88~="".
compute m1139=concat("vJB2m88=",string(vJB2m88,F2),",vJB2o88=",char.substr(vJB2o88,1,150)).
compute p1139="vJB2o88開放欄位內容列出確認".
compute s1139=2.
end if.
Exec.


*vM2m88 開放欄位檢核 是否為複選題=1.
do if vM2m88=1 & vM2o88="".
Compute m1140=concat("vM2m88=",string(vM2m88,F2),",vM2o88=",char.substr(vM2o88,1,150)).
compute p1140="vM2o88開放欄位應答而未答".
compute s1140=2.
else if vM2m88~=1 & vM2o88~="".
compute m1140=concat("vM2m88=",string(vM2m88,F2),",vM2o88=",char.substr(vM2o88,1,150)).
compute p1140="vM2o88開放欄位不該答而答".
compute s1140=2.
else if vM2m88=1 & vM2o88~="".
compute m1140=concat("vM2m88=",string(vM2m88,F2),",vM2o88=",char.substr(vM2o88,1,150)).
compute p1140="vM2o88開放欄位內容列出確認".
compute s1140=2.
end if.
Exec.


*vM3m88 開放欄位檢核 是否為複選題=1.
do if vM3m88=1 & vM3o88="".
Compute m1141=concat("vM3m88=",string(vM3m88,F2),",vM3o88=",char.substr(vM3o88,1,150)).
compute p1141="vM3o88開放欄位應答而未答".
compute s1141=2.
else if vM3m88~=1 & vM3o88~="".
compute m1141=concat("vM3m88=",string(vM3m88,F2),",vM3o88=",char.substr(vM3o88,1,150)).
compute p1141="vM3o88開放欄位不該答而答".
compute s1141=2.
else if vM3m88=1 & vM3o88~="".
compute m1141=concat("vM3m88=",string(vM3m88,F2),",vM3o88=",char.substr(vM3o88,1,150)).
compute p1141="vM3o88開放欄位內容列出確認".
compute s1141=2.
end if.
Exec.


*vQ20m88 開放欄位檢核 是否為複選題=1.
do if vQ20m88=1 & vQ20o88="".
Compute m1142=concat("vQ20m88=",string(vQ20m88,F2),",vQ20o88=",char.substr(vQ20o88,1,150)).
compute p1142="vQ20o88開放欄位應答而未答".
compute s1142=2.
else if vQ20m88~=1 & vQ20o88~="".
compute m1142=concat("vQ20m88=",string(vQ20m88,F2),",vQ20o88=",char.substr(vQ20o88,1,150)).
compute p1142="vQ20o88開放欄位不該答而答".
compute s1142=2.
else if vQ20m88=1 & vQ20o88~="".
compute m1142=concat("vQ20m88=",string(vQ20m88,F2),",vQ20o88=",char.substr(vQ20o88,1,150)).
compute p1142="vQ20o88開放欄位內容列出確認".
compute s1142=2.
end if.
Exec.


*vQ25m88 開放欄位檢核 是否為複選題=1.
do if vQ25m88=1 & vQ25o88="".
Compute m1143=concat("vQ25m88=",string(vQ25m88,F2),",vQ25o88=",char.substr(vQ25o88,1,150)).
compute p1143="vQ25o88開放欄位應答而未答".
compute s1143=2.
else if vQ25m88~=1 & vQ25o88~="".
compute m1143=concat("vQ25m88=",string(vQ25m88,F2),",vQ25o88=",char.substr(vQ25o88,1,150)).
compute p1143="vQ25o88開放欄位不該答而答".
compute s1143=2.
else if vQ25m88=1 & vQ25o88~="".
compute m1143=concat("vQ25m88=",string(vQ25m88,F2),",vQ25o88=",char.substr(vQ25o88,1,150)).
compute p1143="vQ25o88開放欄位內容列出確認".
compute s1143=2.
end if.
Exec.


*vQ22m88 開放欄位檢核 是否為複選題=1.
do if vQ22m88=1 & vQ22o88="".
Compute m1144=concat("vQ22m88=",string(vQ22m88,F2),",vQ22o88=",char.substr(vQ22o88,1,150)).
compute p1144="vQ22o88開放欄位應答而未答".
compute s1144=2.
else if vQ22m88~=1 & vQ22o88~="".
compute m1144=concat("vQ22m88=",string(vQ22m88,F2),",vQ22o88=",char.substr(vQ22o88,1,150)).
compute p1144="vQ22o88開放欄位不該答而答".
compute s1144=2.
else if vQ22m88=1 & vQ22o88~="".
compute m1144=concat("vQ22m88=",string(vQ22m88,F2),",vQ22o88=",char.substr(vQ22o88,1,150)).
compute p1144="vQ22o88開放欄位內容列出確認".
compute s1144=2.
end if.
Exec.


*vQ23m88 開放欄位檢核 是否為複選題=1.
do if vQ23m88=1 & vQ23o88="".
Compute m1145=concat("vQ23m88=",string(vQ23m88,F2),",vQ23o88=",char.substr(vQ23o88,1,150)).
compute p1145="vQ23o88開放欄位應答而未答".
compute s1145=2.
else if vQ23m88~=1 & vQ23o88~="".
compute m1145=concat("vQ23m88=",string(vQ23m88,F2),",vQ23o88=",char.substr(vQ23o88,1,150)).
compute p1145="vQ23o88開放欄位不該答而答".
compute s1145=2.
else if vQ23m88=1 & vQ23o88~="".
compute m1145=concat("vQ23m88=",string(vQ23m88,F2),",vQ23o88=",char.substr(vQ23o88,1,150)).
compute p1145="vQ23o88開放欄位內容列出確認".
compute s1145=2.
end if.
Exec.


*vQ26m88 開放欄位檢核 是否為複選題=1.
do if vQ26m88=1 & vQ26o88="".
Compute m1146=concat("vQ26m88=",string(vQ26m88,F2),",vQ26o88=",char.substr(vQ26o88,1,150)).
compute p1146="vQ26o88開放欄位應答而未答".
compute s1146=2.
else if vQ26m88~=1 & vQ26o88~="".
compute m1146=concat("vQ26m88=",string(vQ26m88,F2),",vQ26o88=",char.substr(vQ26o88,1,150)).
compute p1146="vQ26o88開放欄位不該答而答".
compute s1146=2.
else if vQ26m88=1 & vQ26o88~="".
compute m1146=concat("vQ26m88=",string(vQ26m88,F2),",vQ26o88=",char.substr(vQ26o88,1,150)).
compute p1146="vQ26o88開放欄位內容列出確認".
compute s1146=2.
end if.
Exec.


*vQ27m88 開放欄位檢核 是否為複選題=1.
do if vQ27m88=1 & vQ27o88="".
Compute m1147=concat("vQ27m88=",string(vQ27m88,F2),",vQ27o88=",char.substr(vQ27o88,1,150)).
compute p1147="vQ27o88開放欄位應答而未答".
compute s1147=2.
else if vQ27m88~=1 & vQ27o88~="".
compute m1147=concat("vQ27m88=",string(vQ27m88,F2),",vQ27o88=",char.substr(vQ27o88,1,150)).
compute p1147="vQ27o88開放欄位不該答而答".
compute s1147=2.
else if vQ27m88=1 & vQ27o88~="".
compute m1147=concat("vQ27m88=",string(vQ27m88,F2),",vQ27o88=",char.substr(vQ27o88,1,150)).
compute p1147="vQ27o88開放欄位內容列出確認".
compute s1147=2.
end if.
Exec.


*vQ44 開放欄位檢核 是否為複選題=0.
do if vQ44=88 & vQ44o88="".
Compute m1148=concat("vQ44=",string(vQ44,F2),",vQ44o88=",char.substr(vQ44o88,1,150)).
compute p1148="vQ44o88開放欄位應答而未答".
compute s1148=2.
else if vQ44~=88 & vQ44o88~="".
compute m1148=concat("vQ44=",string(vQ44,F2),",vQ44o88=",char.substr(vQ44o88,1,150)).
compute p1148="vQ44o88開放欄位不該答而答".
compute s1148=2.
else if vQ44=88 & vQ44o88~="".
compute m1148=concat("vQ44=",string(vQ44,F2),",vQ44o88=",char.substr(vQ44o88,1,150)).
compute p1148="vQ44o88開放欄位內容列出確認".
compute s1148=2.
end if.
Exec.


*vQ45 開放欄位檢核 是否為複選題=0.
do if vQ45=88 & vQ45o88="".
Compute m1149=concat("vQ45=",string(vQ45,F2),",vQ45o88=",char.substr(vQ45o88,1,150)).
compute p1149="vQ45o88開放欄位應答而未答".
compute s1149=2.
else if vQ45~=88 & vQ45o88~="".
compute m1149=concat("vQ45=",string(vQ45,F2),",vQ45o88=",char.substr(vQ45o88,1,150)).
compute p1149="vQ45o88開放欄位不該答而答".
compute s1149=2.
else if vQ45=88 & vQ45o88~="".
compute m1149=concat("vQ45=",string(vQ45,F2),",vQ45o88=",char.substr(vQ45o88,1,150)).
compute p1149="vQ45o88開放欄位內容列出確認".
compute s1149=2.
end if.
Exec.


*vQ51 開放欄位檢核 是否為複選題=0.
do if vQ51=88 & vQ51o88="".
Compute m1150=concat("vQ51=",string(vQ51,F2),",vQ51o88=",char.substr(vQ51o88,1,150)).
compute p1150="vQ51o88開放欄位應答而未答".
compute s1150=2.
else if vQ51~=88 & vQ51o88~="".
compute m1150=concat("vQ51=",string(vQ51,F2),",vQ51o88=",char.substr(vQ51o88,1,150)).
compute p1150="vQ51o88開放欄位不該答而答".
compute s1150=2.
else if vQ51=88 & vQ51o88~="".
compute m1150=concat("vQ51=",string(vQ51,F2),",vQ51o88=",char.substr(vQ51o88,1,150)).
compute p1150="vQ51o88開放欄位內容列出確認".
compute s1150=2.
end if.
Exec.


*vQ53 開放欄位檢核 是否為複選題=0.
do if vQ53=88 & vQ53o88="".
Compute m1151=concat("vQ53=",string(vQ53,F2),",vQ53o88=",char.substr(vQ53o88,1,150)).
compute p1151="vQ53o88開放欄位應答而未答".
compute s1151=2.
else if vQ53~=88 & vQ53o88~="".
compute m1151=concat("vQ53=",string(vQ53,F2),",vQ53o88=",char.substr(vQ53o88,1,150)).
compute p1151="vQ53o88開放欄位不該答而答".
compute s1151=2.
else if vQ53=88 & vQ53o88~="".
compute m1151=concat("vQ53=",string(vQ53,F2),",vQ53o88=",char.substr(vQ53o88,1,150)).
compute p1151="vQ53o88開放欄位內容列出確認".
compute s1151=2.
end if.
Exec.


*vQ54 開放欄位檢核 是否為複選題=0.
do if vQ54=88 & vQ54o88="".
Compute m1152=concat("vQ54=",string(vQ54,F2),",vQ54o88=",char.substr(vQ54o88,1,150)).
compute p1152="vQ54o88開放欄位應答而未答".
compute s1152=2.
else if vQ54~=88 & vQ54o88~="".
compute m1152=concat("vQ54=",string(vQ54,F2),",vQ54o88=",char.substr(vQ54o88,1,150)).
compute p1152="vQ54o88開放欄位不該答而答".
compute s1152=2.
else if vQ54=88 & vQ54o88~="".
compute m1152=concat("vQ54=",string(vQ54,F2),",vQ54o88=",char.substr(vQ54o88,1,150)).
compute p1152="vQ54o88開放欄位內容列出確認".
compute s1152=2.
end if.
Exec.


*vZE1o03 開放欄位檢核 是否為複選題=1.
do if vZE1=3 & vZE1o03="".
Compute m1153=concat("vZE1=",string(vZE1,F2),",vZE1o03=",char.substr(vZE1o03,1,150)).
compute p1153="vZE1o03開放欄位應答而未答".
compute s1153=2.
else if vZE1~=3 & vZE1o03~="".
compute m1153=concat("vZE1=",string(vZE1,F2),",vZE1o03=",char.substr(vZE1o03,1,150)).
compute p1153="vZE1o03開放欄位不該答而答".
compute s1153=2.
else if vZE1=3 & vZE1o03~="".
compute m1153=concat("vZE1=",string(vZE1,F2),",vZE1o03=",char.substr(vZE1o03,1,150)).
compute p1153="vZE1o03開放欄位內容列出確認".
compute s1153=2.
end if.
Exec.


*vZE1o04 開放欄位檢核 是否為複選題=1.
do if vZE1=4 & vZE1o04="".
Compute m1154=concat("vZE1=",string(vZE1,F2),",vZE1o04=",char.substr(vZE1o04,1,150)).
compute p1154="vZE1o04開放欄位應答而未答".
compute s1154=2.
else if vZE1~=4 & vZE1o04~="".
compute m1154=concat("vZE1=",string(vZE1,F2),",vZE1o04=",char.substr(vZE1o04,1,150)).
compute p1154="vZE1o04開放欄位不該答而答".
compute s1154=2.
else if vZE1=4 & vZE1o04~="".
compute m1154=concat("vZE1=",string(vZE1,F2),",vZE1o04=",char.substr(vZE1o04,1,150)).
compute p1154="vZE1o04開放欄位內容列出確認".
compute s1154=2.
end if.
Exec.

count vK1_sum=vK1m01 to vK1m90(1).
count vK2_sum=vK2m01 to vK2m90(1).
count vKFB3_sum=vKFB3m01 to vKFB3m88(1).
count vKFB4_sum=vKFB4m01 to vKFB4m88(1).
count vKIG3_sum=vKIG3m01 to vKIG3m88(1).
count vKIG4_sum=vKIG4m01 to vKIG4m88(1).
count vKTT3_sum=vKTT3m01 to vKTT3m88(1).
count vKTT4_sum=vKTT4m01 to vKTT4m88(1).
count vKTT5_sum=vKTT5m01 to vKTT5m88(1).
count vK3_sum=vK3m01 to vK3m90(1).
count vE2_sum=vE2m01 to vE2m88(1).
count vE13_sum=vE13m01 to vE13m88(1).
count vG7_sum=vG7m01 to vG7m90(1).
count vG8_sum=vG8m01 to vG8m90(1).
count vG9_sum=vG9m01 to vG9m90(1).
count vG10_sum=vG10m01 to vG10m90(1).
count vG11_sum=vG11m01 to vG11m90(1).
count vB7a_sum=vB7am01 to vB7am88(1).
count vB8_sum=vB8m01 to vB8m88(1).
count vG3_sum=vG3m01 to vG3m88(1).
count vF5_sum=vF5m01 to vF5m88(1).
count vC3_sum=vC3m01 to vC3m88(1).
count vJB1_sum=vJB1m01 to vJB1m90(1).
count vJB2_sum=vJB2m01 to vJB2m90(1).
count vM2_sum=vM2m01 to vM2m88(1).
count vM3_sum=vM3m01 to vM3m88(1).
count vQ20_sum=vQ20m01 to vQ20m90(1).
count vQ25_sum=vQ25m01 to vQ25m88(1).
count vQ22_sum=vQ22m01 to vQ22m88(1).
count vQ23_sum=vQ23m01 to vQ23m88(1).
count vQ26_sum=vQ26m01 to vQ26m88(1).
count vQ27_sum=vQ27m01 to vQ27m88(1).
count vQ30_sum=vQ30m01 to vQ30m90(1).
count vQ31_sum=vQ31m01 to vQ31m90(1).
count vZE2_sum=vZE2m01 to vZE2m03(1).
exe.

string 列出_K1 列出_K2 列出_KFB3 列出_KFB4 列出_KIG3 列出_KIG4 列出_KTT3 列出_KTT4 列出_KTT5 列出_K3 列出_E2 列出_E13 列出_G7
列出_G8 列出_G9 列出_G10 列出_G11 列出_B7a 列出_B8 列出_G3 列出_F5 列出_C3 列出_JB1 列出_JB2 列出_M2 列出_M3 列出_Q20 列出_Q25
列出_Q22 列出_Q23 列出_Q26 列出_Q27 列出_Q30 列出_Q31 列出_ZE2(a2000).

compute 列出_K1=conact('共選=',string(vK1_sum,F2),'項',',vK1m01=',string(vK1m01,F2),',vK1m02=',string(vK1m02,F2),',vK1m03=',string(vK1m03,F2),',vK1m04=',string(vK1m04,F2),
',vK1m05=',string(vK1m05,F2),',vK1m06=',string(vK1m06,F2),',vK1m07=',string(vK1m07,F2),',vK1m08=',string(vK1m08,F2),',vK1m09=',string(vK1m09,F2),
',vK1m10=',string(vK1m10,F2),',vK1m11=',string(vK1m11,F2),',vK1m12=',string(vK1m12,F2),',vK1m13=',string(vK1m13,F2),',vK1m88=',string(vK1m88,F2),',vK1m90=',string(vK1m90,F2),',vK1o88=',char.substr(vK1o88,1,150)).
compute 列出_K2=conact('共選=',string(vK2_sum,F2),'項',',vK2m01=',string(vK2m01,F2),',vK2m02=',string(vK2m02,F2),',vK2m03=',string(vK2m03,F2),',vK2m04=',string(vK2m04,F2),
',vK2m05=',string(vK2m05,F2),',vK2m06=',string(vK2m06,F2),',vK2m07=',string(vK2m07,F2),',vK2m08=',string(vK2m08,F2),',vK2m09=',string(vK2m09,F2),
',vK2m11=',string(vK2m11,F2),',vK2m12=',string(vK2m12,F2),',vK2m13=',string(vK2m13,F2),',vK2m88=',string(vK2m88,F2),',vK2m90=',string(vK2m90,F2),',vK2o88=',char.substr(vK2o88,1,150)).
compute 列出_KFB3=conact('共選=',string(vKFB3_sum,F2),'項',',vKFB3m01=',string(vKFB3m01,F2),',vKFB3m02=',string(vKFB3m02,F2),',vKFB3m03=',string(vKFB3m03,F2),',vKFB3m04=',string(vKFB3m04,F2),
',vKFB3m05=',string(vKFB3m05,F2),',vKFB3m06=',string(vKFB3m06,F2),',vKFB3m07=',string(vKFB3m07,F2),',vKFB3m08=',string(vKFB3m08,F2),
',vKFB3m09=',string(vKFB3m09,F2),',vKFB3m10=',string(vKFB3m10,F2),',vKFB3m11=',string(vKFB3m11,F2),',vKFB3m12=',string(vKFB3m12,F2),
',vKFB3m13=',string(vKFB3m13,F2),',vKFB3m14=',string(vKFB3m14,F2),',vKFB3m15=',string(vKFB3m15,F2),',vKFB3m16=',string(vKFB3m16,F2),
',vKFB3m17=',string(vKFB3m17,F2),',vKFB3m88=',string(vKFB3m88,F2),',vKFB3o88=',char.substr(vKFB3o88,1,150)).
compute 列出_KFB4=conact('共選=',string(vKFB4_sum,F2),'項',',vKFB4m01=',string(vKFB4m01,F2),',vKFB4m02=',string(vKFB4m02,F2),',vKFB4m03=',string(vKFB4m03,F2),',vKFB4m04=',string(vKFB4m04,F2),
',vKFB4m05=',string(vKFB4m05,F2),',vKFB4m06=',string(vKFB4m06,F2),',vKFB4m07=',string(vKFB4m07,F2),',vKFB4m08=',string(vKFB4m08,F2),
',vKFB4m09=',string(vKFB4m09,F2),',vKFB4m10=',string(vKFB4m10,F2),',vKFB4m11=',string(vKFB4m11,F2),',vKFB4m12=',string(vKFB4m12,F2),
',vKFB4m13=',string(vKFB4m13,F2),',vKFB4m14=',string(vKFB4m14,F2),',vKFB4m15=',string(vKFB4m15,F2),',vKFB4m16=',string(vKFB4m16,F2),
',vKFB4m17=',string(vKFB4m17,F2),',vKFB4m18=',string(vKFB4m18,F2),',vKFB4m88=',string(vKFB4m88,F2),',vKFB4o88=',char.substr(vKFB4o88,1,150)).
compute 列出_KIG3=conact('共選=',string(vKIG3_sum,F2),'項',',vKIG3m01=',string(vKIG3m01,F2),',vKIG3m02=',string(vKIG3m02,F2),',vKIG3m03=',string(vKIG3m03,F2),',vKIG3m04=',string(vKIG3m04,F2),
',vKIG3m05=',string(vKIG3m05,F2),',vKIG3m06=',string(vKIG3m06,F2),',vKIG3m07=',string(vKIG3m07,F2),',vKIG3m08=',string(vKIG3m08,F2),
',vKIG3m09=',string(vKIG3m09,F2),',vKIG3m10=',string(vKIG3m10,F2),',vKIG3m11=',string(vKIG3m11,F2),',vKIG3m12=',string(vKIG3m12,F2),
',vKIG3m13=',string(vKIG3m13,F2),',vKIG3m14=',string(vKIG3m14,F2),',vKIG3m15=',string(vKIG3m15,F2),',vKIG3m16=',string(vKIG3m16,F2),
',vKIG3m17=',string(vKIG3m17,F2),',vKIG3m88=',string(vKIG3m88,F2),',vKIG3o88=',char.substr(vKIG3o88,1,150)).
compute 列出_KIG4=conact('共選=',string(vKIG4_sum,F2),'項',',vKIG4m01=',string(vKIG4m01,F2),',vKIG4m02=',string(vKIG4m02,F2),',vKIG4m03=',string(vKIG4m03,F2),',vKIG4m04=',string(vKIG4m04,F2),
',vKIG4m05=',string(vKIG4m05,F2),',vKIG4m06=',string(vKIG4m06,F2),',vKIG4m07=',string(vKIG4m07,F2),',vKIG4m08=',string(vKIG4m08,F2),
',vKIG4m09=',string(vKIG4m09,F2),',vKIG4m10=',string(vKIG4m10,F2),',vKIG4m11=',string(vKIG4m11,F2),',vKIG4m12=',string(vKIG4m12,F2),
',vKIG4m13=',string(vKIG4m13,F2),',vKIG4m14=',string(vKIG4m14,F2),',vKIG4m88=',string(vKIG4m88,F2),',vKIG4o88=',char.substr(vKIG4o88,1,150)).
compute 列出_KTT3=conact('共選=',string(vKTT3_sum,F2),'項',',vKTT3m01=',string(vKTT3m01,F2),',vKTT3m02=',string(vKTT3m02,F2),',vKTT3m03=',string(vKTT3m03,F2),',vKTT3m04=',string(vKTT3m04,F2),
',vKTT3m05=',string(vKTT3m05,F2),',vKTT3m06=',string(vKTT3m06,F2),',vKTT3m07=',string(vKTT3m07,F2),',vKTT3m08=',string(vKTT3m08,F2),
',vKTT3m09=',string(vKTT3m09,F2),',vKTT3m10=',string(vKTT3m10,F2),',vKTT3m11=',string(vKTT3m11,F2),',vKTT3m12=',string(vKTT3m12,F2),
',vKTT3m13=',string(vKTT3m13,F2),',vKTT3m14=',string(vKTT3m14,F2),',vKTT3m15=',string(vKTT3m15,F2),',vKTT3m16=',string(vKTT3m16,F2),
',vKTT3m88=',string(vKTT3m88,F2),',vKTT3o88=',char.substr(vKTT3o88,1,150)).
compute 列出_KTT4=conact('共選=',string(vKTT4_sum,F2),'項',',vKTT4m01=',string(vKTT4m01,F2),',vKTT4m02=',string(vKTT4m02,F2),',vKTT4m03=',string(vKTT4m03,F2),',vKTT4m04=',string(vKTT4m04,F2),
',vKTT4m05=',string(vKTT4m05,F2),',vKTT4m06=',string(vKTT4m06,F2),',vKTT4m07=',string(vKTT4m07,F2),',vKTT4m08=',string(vKTT4m08,F2),
',vKTT4m09=',string(vKTT4m09,F2),',vKTT4m10=',string(vKTT4m10,F2),',vKTT4m11=',string(vKTT4m11,F2),',vKTT4m12=',string(vKTT4m12,F2),
',vKTT4m13=',string(vKTT4m13,F2),',vKTT4m14=',string(vKTT4m14,F2),',vKTT4m88=',string(vKTT4m88,F2),',vKTT4o88=',char.substr(vKTT4o88,1,150)).
compute 列出_KTT5=conact('共選=',string(vKTT5_sum,F2),'項',',vKTT5m01=',string(vKTT5m01,F2),',vKTT5m02=',string(vKTT5m02,F2),',vKTT5m03=',string(vKTT5m03,F2),',vKTT5m04=',string(vKTT5m04,F2),
',vKTT5m05=',string(vKTT5m05,F2),',vKTT5m06=',string(vKTT5m06,F2),',vKTT5m07=',string(vKTT5m07,F2),',vKTT5m08=',string(vKTT5m08,F2),
',vKTT5m09=',string(vKTT5m09,F2),',vKTT5m10=',string(vKTT5m10,F2),',vKTT5m11=',string(vKTT5m11,F2),',vKTT5m12=',string(vKTT5m12,F2),
',vKTT5m88=',string(vKTT5m88,F2),',vKTT5o88=',char.substr(vKTT5o88,1,150)).
compute 列出_K3=conact('共選=',string(vK3_sum,F2),'項',',vK3m01=',string(vK3m01,F2),',vK3m02=',string(vK3m02,F2),',vK3m03=',string(vK3m03,F2),',vK3m04=',string(vK3m04,F2),
',vK3m05=',string(vK3m05,F2),',vK3m06=',string(vK3m06,F2),',vK3m07=',string(vK3m07,F2),',vK3m08=',string(vK3m08,F2),',vK3m09=',string(vK3m09,F2),
',vK3m88=',string(vK3m88,F2),',vK3m90=',string(vK3m90,F2),',vK3o88=',char.substr(vK3o88,1,150)).
compute 列出_E2=conact('共選=',string(vE2_sum,F2),'項',',vE2m01=',string(vE2m01,F2),',vE2m02=',string(vE2m02,F2),',vE2m03=',string(vE2m03,F2),',vE2m04=',string(vE2m04,F2),
',vE2m88=',string(vE2m88,F2),',vE2o88=',char.substr(vE2o88,1,150)).
compute 列出_E13=conact('共選=',string(vE13_sum,F2),'項',',vE13m01=',string(vE13m01,F2),',vE13m02=',string(vE13m02,F2),',vE13m03=',string(vE13m03,F2),',vE13m04=',string(vE13m04,F2),
',vE13m05=',string(vE13m05,F2),',vE13m06=',string(vE13m06,F2),',vE13m88=',string(vE13m88,F2),',vE13o88=',char.substr(vE13o88,1,150)).
compute 列出_G7=conact('共選=',string(vG7_sum,F2),'項',',vG7m01=',string(vG7m01,F2),',vG7m02=',string(vG7m02,F2),',vG7m03=',string(vG7m03,F2),
',vG7m04=',string(vG7m04,F2),',vG7m05=',string(vG7m05,F2),',vG7m06=',string(vG7m06,F2),',vG7m07=',string(vG7m07,F2),
',vG7m08=',string(vG7m08,F2),',vG7m09=',string(vG7m09,F2),',vG7m10=',string(vG7m10,F2),',vG7m11=',string(vG7m11,F2),
',vG7m12=',string(vG7m12,F2),',vG7m88=',string(vG7m88,F2),',vG7m90=',string(vG7m90,F2),',vG7o88=',char.substr(vG7o88,1,150)).
compute 列出_G8=conact('共選=',string(vG8_sum,F2),'項',',vG8m01=',string(vG8m01,F2),',vG8m02=',string(vG8m02,F2),',vG8m03=',string(vG8m03,F2),
',vG8m04=',string(vG8m04,F2),',vG8m05=',string(vG8m05,F2),',vG8m06=',string(vG8m06,F2),',vG8m07=',string(vG8m07,F2),
',vG8m08=',string(vG8m08,F2),',vG8m09=',string(vG8m09,F2),',vG8m10=',string(vG8m10,F2),',vG8m11=',string(vG8m11,F2),
',vG8m12=',string(vG8m12,F2),',vG8m13=',string(vG8m13,F2),',vG8m14=',string(vG8m14,F2),',vG8m15=',string(vG8m15,F2),
',vG8m16=',string(vG8m16,F2),',vG8m88=',string(vG8m88,F2),',vG8m90=',string(vG8m90,F2),',vG8o88=',char.substr(vG8o88,1,150)).
compute 列出_G9=conact('共選=',string(vG9_sum,F2),'項',',vG9m01=',string(vG9m01,F2),',vG9m02=',string(vG9m02,F2),',vG9m03=',string(vG9m03,F2),
',vG9m04=',string(vG9m04,F2),',vG9m05=',string(vG9m05,F2),',vG9m06=',string(vG9m06,F2),',vG9m07=',string(vG9m07,F2),
',vG9m08=',string(vG9m08,F2),',vG9m09=',string(vG9m09,F2),',vG9m10=',string(vG9m10,F2),',vG9m11=',string(vG9m11,F2),
',vG9m12=',string(vG9m12,F2),',vG9m13=',string(vG9m13,F2),',vG9m88=',string(vG9m88,F2),',vG9m90=',string(vG9m90,F2),',vG9o88=',char.substr(vG9o88,1,150)).
compute 列出_G10=conact('共選=',string(vG10_sum,F2),'項',',vG10m01=',string(vG10m01,F2),',vG10m02=',string(vG10m02,F2),',vG10m03=',string(vG10m03,F2),
',vG10m04=',string(vG10m04,F2),',vG10m05=',string(vG10m05,F2),',vG10m06=',string(vG10m06,F2),',vG10m07=',string(vG10m07,F2),
',vG10m08=',string(vG10m08,F2),',vG10m09=',string(vG10m09,F2),',vG10m10=',string(vG10m10,F2),',vG10m11=',string(vG10m11,F2),
',vG10m12=',string(vG10m12,F2),',vG10m13=',string(vG10m13,F2),',vG10m14=',string(vG10m14,F2),',vG10m15=',string(vG10m15,F2),
',vG10m16=',string(vG10m16,F2),',vG10m17=',string(vG10m17,F2),',vG10m18=',string(vG10m18,F2),',vG10m19=',string(vG10m19,F2),
',vG10m88=',string(vG10m88,F2),',vG10m90=',string(vG10m90,F2),',vG10o88=',char.substr(vG10o88,1,150)).
compute 列出_G11=conact('共選=',string(vG11_sum,F2),'項',',vG11m01=',string(vG11m01,F2),',vG11m02=',string(vG11m02,F2),',vG11m03=',string(vG11m03,F2),',vG11m04=',string(vG11m04,F2),',vG11m05=',string(vG11m05,F2),
',vG11m88=',string(vG11m88,F2),',vG11m90=',string(vG11m90,F2),',vG11o88=',char.substr(vG11o88,1,150)).
compute 列出_B7a=conact('共選=',string(vB7a_sum,F2),'項',',vB7am01=',string(vB7am01,F2),',vB7am02=',string(vB7am02,F2),',vB7am03=',string(vB7am03,F2),
',vB7am04=',string(vB7am04,F2),',vB7am05=',string(vB7am05,F2),',vB7am06=',string(vB7am06,F2),',vB7am07=',string(vB7am07,F2),',vB7am08=',string(vB7am08,F2),',vB7am09=',string(vB7am09,F2),
',vB7am10=',string(vB7am10,F2),',vB7am11=',string(vB7am11,F2),',vB7am12=',string(vB7am12,F2),',vB7am13=',string(vB7am13,F2),
',vB7am14=',string(vB7am14,F2),',vB7am15=',string(vB7am15,F2),',vB7am16=',string(vB7am16,F2),',vB7am17=',string(vB7am17,F2),
',vB7am18=',string(vB7am18,F2),',vB7am19=',string(vB7am19,F2),',vB7am20=',string(vB7am20,F2),',vB7am21=',string(vB7am21,F2),
',vB7am22=',string(vB7am22,F2),',vB7am23=',string(vB7am23,F2),',vB7am24=',string(vB7am24,F2),',vB7am25=',string(vB7am25,F2),
',vB7am26=',string(vB7am26,F2),',vB7am27=',string(vB7am27,F2),',vB7am28=',string(vB7am28,F2),',vB7am29=',string(vB7am29,F2),
',vB7am30=',string(vB7am30,F2),',vB7am31=',string(vB7am31,F2),',vB7am32=',string(vB7am32,F2),',vB7am33=',string(vB7am33,F2),
',vB7am34=',string(vB7am34,F2),',vB7am35=',string(vB7am35,F2),',vB7am36=',string(vB7am36,F2),',vB7am37=',string(vB7am37,F2),
',vB7am38=',string(vB7am38,F2),',vB7am39=',string(vB7am39,F2),',vB7am40=',string(vB7am40,F2),',vB7am41=',string(vB7am41,F2),
',vB7am42=',string(vB7am42,F2),',vB7am43=',string(vB7am43,F2),',vB7am44=',string(vB7am44,F2),',vB7am45=',string(vB7am45,F2),
',vB7am46=',string(vB7am46,F2),',vB7am47=',string(vB7am47,F2),',vB7am48=',string(vB7am48,F2),',vB7am49=',string(vB7am49,F2),
',vB7am50=',string(vB7am50,F2),',vB7am51=',string(vB7am51,F2),',vB7am52=',string(vB7am52,F2),',vB7am53=',string(vB7am53,F2),
',vB7am54=',string(vB7am54,F2),',vB7am88=',string(vB7am88,F2),',vB7ao88=',char.substr(vB7ao88,1,150)).
compute 列出_B8=conact('共選=',string(vB8_sum,F2),'項',',vB8m01=',string(vB8m01,F2),',vB8m02=',string(vB8m02,F2),',vB8m03=',string(vB8m03,F2),',vB8m04=',string(vB8m04,F2),',vB8m05=',string(vB8m05,F2),',vB8m06=',string(vB8m06,F2),
',vB8m07=',string(vB8m07,F2),',vB8m08=',string(vB8m08,F2),',vB8m09=',string(vB8m09,F2),',vB8m10=',string(vB8m10,F2),',vB8m88=',string(vB8m88,F2),',vB8o88=',char.substr(vB8o88,1,150)).
compute 列出_G3=conact('共選=',string(vG3_sum,F2),'項',',vG3m01=',string(vG3m01,F2),',vG3m02=',string(vG3m02,F2),',vG3m03=',string(vG3m03,F2),',vG3m04=',string(vG3m04,F2),',vG3m05=',string(vG3m05,F2),',vG3m06=',string(vG3m06,F2),
',vG3m07=',string(vG3m07,F2),',vG3m08=',string(vG3m08,F2),',vG3m09=',string(vG3m09,F2),',vG3m10=',string(vG3m10,F2),',vG3m11=',string(vG3m11,F2),',vG3m12=',string(vG3m12,F2),
',vG3m13=',string(vG3m13,F2),',vG3m14=',string(vG3m14,F2),',vG3m15=',string(vG3m15,F2),',vG3m16=',string(vG3m16,F2),',vG3m19=',string(vG3m19,F2),',vG3m20=',string(vG3m20,F2),
',vG3m21=',string(vG3m21,F2),',vG3m22=',string(vG3m22,F2),',vG3m23=',string(vG3m23,F2),',vG3m24=',string(vG3m24,F2),',vG3m25=',string(vG3m25,F2),',vG3m26=',string(vG3m26,F2),
',vG3m27=',string(vG3m27,F2),',vG3m28=',string(vG3m28,F2),',vG3m29=',string(vG3m29,F2),',vG3m30=',string(vG3m30,F2),',vG3m31=',string(vG3m31,F2),',vG3m32=',string(vG3m32,F2),',vG3m33=',string(vG3m33,F2),
',vG3m88=',string(vG3m88,F2),',vG3o88=',char.substr(vG3o88,1,150)).
compute 列出_F5=conact('共選=',string(vF5_sum,F2),'項',',vF5m01=',string(vF5m01,F2),',vF5m02=',string(vF5m02,F2),',vF5m03=',string(vF5m03,F2),',vF5m04=',string(vF5m04,F2),',vF5m05=',string(vF5m05,F2),',vF5m06=',string(vF5m06,F2),
',vF5m07=',string(vF5m07,F2),',vF5m08=',string(vF5m08,F2),',vF5m88=',string(vF5m88,F2),',vF5o88=',char.substr(vF5o88,1,150)).
compute 列出_C3=conact('共選=',string(vC3_sum,F2),'項',',vC3m01=',string(vC3m01,F2),',vC3m02=',string(vC3m02,F2),',vC3m03=',string(vC3m03,F2),',vC3m04=',string(vC3m04,F2),',vC3m05=',string(vC3m05,F2),
',vC3m06=',string(vC3m06,F2)
,',vC3m07=',string(vC3m07,F2),',vC3m08=',string(vC3m08,F2),',vC3m09=',string(vC3m09,F2),',vC3m10=',string(vC3m10,F2),',vC3m11=',string(vC3m11,F2),',vC3m88=',string(vC3m88,F2),',vC3o88=',char.substr(vC3o88,1,150)).
compute 列出_JB1=conact('共選=',string(vJB1_sum,F2),'項',',vJB1m01=',string(vJB1m01,F2),',vJB1m02=',string(vJB1m02,F2),',vJB1m03=',string(vJB1m03,F2),',vJB1m04=',string(vJB1m04,F2),',vJB1m05=',string(vJB1m05,F2),',vJB1m06=',string(vJB1m06,F2),
',vJB1m07=',string(vJB1m07,F2),',vJB1m08=',string(vJB1m08,F2),',vJB1m09=',string(vJB1m09,F2),',vJB1m10=',string(vJB1m10,F2),',vJB1m11=',string(vJB1m11,F2),',vJB1m88=',string(vJB1m88,F2),',vJB1m90=',string(vJB1m90,F2),
',vJB1o88=',char.substr(vJB1o88,1,150)).
compute 列出_JB2=conact('共選=',string(vJB2_sum,F2),'項',',vJB2m01=',string(vJB2m01,F2),',vJB2m02=',string(vJB2m02,F2),',vJB2m03=',string(vJB2m03,F2),',vJB2m04=',string(vJB2m04,F2),',vJB2m05=',string(vJB2m05,F2),',vJB2m06=',string(vJB2m06,F2),
',vJB2m07=',string(vJB2m07,F2),',vJB2m88=',string(vJB2m88,F2),',vJB2m90=',string(vJB2m90,F2),',vJB2o88=',char.substr(vJB2o88,1,150)).
compute 列出_M2=conact('共選=',string(vM2_sum,F2),'項',',vM2m01=',string(vM2m01,F2),',vM2m02=',string(vM2m02,F2),',vM2m03=',string(vM2m03,F2),',vM2m04=',string(vM2m04,F2),',vM2m05=',string(vM2m05,F2),
',vM2m06=',string(vM2m06,F2),',vM2m07=',string(vM2m07,F2),',vM2m08=',string(vM2m08,F2),',vM2m09=',string(vM2m09,F2),',vM2m10=',string(vM2m10,F2),',vM2m11=',string(vM2m11,F2),',vM2m12=',string(vM2m12,F2),',vM2m13=',string(vM2m13,F2),
',vM2m14=',string(vM2m14,F2),',vM2m15=',string(vM2m15,F2),',vM2m16=',string(vM2m16,F2),',vM2m88=',string(vM2m88,F2),',vM2o88=',char.substr(vM2o88,1,150)).
compute 列出_M3=conact('共選=',string(vM3_sum,F2),'項',',vM3m01=',string(vM3m01,F2),',vM3m02=',string(vM3m02,F2),',vM3m03=',string(vM3m03,F2),',vM3m04=',string(vM3m04,F2),',vM3m05=',string(vM3m05,F2),',vM3m06=',string(vM3m06,F2),',vM3m07=',string(vM3m07,F2),
',vM3m08=',string(vM3m08,F2),',vM3m09=',string(vM3m09,F2),',vM3m10=',string(vM3m10,F2),',vM3m11=',string(vM3m11,F2),',vM3m12=',string(vM3m12,F2),',vM3m13=',string(vM3m13,F2),',vM3m88=',string(vM3m88,F2),',vM3o88=',char.substr(vM3o88,1,150)).
compute 列出_Q20=conact('共選=',string(vQ20_sum,F2),'項',',vQ20m01=',string(vQ20m01,F2),',vQ20m02=',string(vQ20m02,F2),',vQ20m03=',string(vQ20m03,F2),
',vQ20m04=',string(vQ20m04,F2),',vQ20m05=',string(vQ20m05,F2),',vQ20m06=',string(vQ20m06,F2),',vQ20m88=',string(vQ20m88,F2),',vQ20o88=',char.substr(vQ20o88,1,150)).
compute 列出_Q25=conact('共選=',string(vQ25_sum,F2),'項',',vQ25m01=',string(vQ25m01,F2),',vQ25m02=',string(vQ25m02,F2),',vQ25m03=',string(vQ25m03,F2),',vQ25m04=',string(vQ25m04,F2),',vQ25m05=',string(vQ25m05,F2),
',vQ25m06=',string(vQ25m06,F2),',vQ25m07=',string(vQ25m07,F2),',vQ25m08=',string(vQ25m08,F2),',vQ25m09=',string(vQ25m09,F2),',vQ25m10=',string(vQ25m10,F2),
',vQ25m11=',string(vQ25m11,F2),',vQ25m12=',string(vQ25m12,F2),',vQ25m13=',string(vQ25m13,F2),',vQ25m14=',string(vQ25m14,F2),',vQ25m15=',string(vQ25m15,F2),
',vQ25m16=',string(vQ25m16,F2),',vQ25m17=',string(vQ25m17,F2),',vQ25m18=',string(vQ25m18,F2),',vQ25m19=',string(vQ25m19,F2),',vQ25m20=',string(vQ25m20,F2),
',vQ25m21=',string(vQ25m21,F2),',vQ25m22=',string(vQ25m22,F2),',vQ25m23=',string(vQ25m23,F2),',vQ25m24=',string(vQ25m24,F2),',vQ25m25=',string(vQ25m25,F2),
',vQ25m26=',string(vQ25m26,F2),',vQ25m27=',string(vQ25m27,F2),',vQ25m28=',string(vQ25m28,F2),',vQ25m29=',string(vQ25m29,F2),',vQ25m30=',string(vQ25m30,F2),
',vQ25m31=',string(vQ25m31,F2),',vQ25m88=',string(vQ25m88,F2),',vQ25o88=',char.substr(vQ25o88,1,150)).
compute 列出_Q22=conact('共選=',string(vQ22_sum,F2),'項',',vQ22m01=',string(vQ22m01,F2),',vQ22m02=',string(vQ22m02,F2),',vQ22m03=',string(vQ22m03,F2),',vQ22m04=',string(vQ22m04,F2),
',vQ22m05=',string(vQ22m05,F2),',vQ22m06=',string(vQ22m06,F2),',vQ22m07=',string(vQ22m07,F2),',vQ22m08=',string(vQ22m08,F2),',vQ22m09=',string(vQ22m09,F2),
',vQ22m10=',string(vQ22m10,F2),',vQ22m11=',string(vQ22m11,F2),',vQ22m12=',string(vQ22m12,F2),',vQ22m13=',string(vQ22m13,F2),',vQ22m14=',string(vQ22m14,F2),
',vQ22m15=',string(vQ22m15,F2),',vQ22m16=',string(vQ22m16,F2),',vQ22m17=',string(vQ22m17,F2),',vQ22m18=',string(vQ22m18,F2),',vQ22m19=',string(vQ22m19,F2),
',vQ22m20=',string(vQ22m20,F2),',vQ22m21=',string(vQ22m21,F2),',vQ22m22=',string(vQ22m22,F2),',vQ22m23=',string(vQ22m23,F2),',vQ22m24=',string(vQ22m24,F2),
',vQ22m25=',string(vQ22m25,F2),',vQ22m26=',string(vQ22m26,F2),',vQ22m27=',string(vQ22m27,F2),',vQ22m28=',string(vQ22m28,F2),',vQ22m29=',string(vQ22m29,F2),
',vQ22m30=',string(vQ22m30,F2),',vQ22m31=',string(vQ22m31,F2),',vQ22m32=',string(vQ22m32,F2),',vQ22m33=',string(vQ22m33,F2),',vQ22m34=',string(vQ22m34,F2),
',vQ22m35=',string(vQ22m35,F2),',vQ22m36=',string(vQ22m36,F2),',vQ22m37=',string(vQ22m37,F2),',vQ22m38=',string(vQ22m38,F2),',vQ22m39=',string(vQ22m39,F2),
',vQ22m40=',string(vQ22m40,F2),',vQ22m88=',string(vQ22m88,F2),',vQ22o88=',char.substr(vQ22o88,1,150)).
compute 列出_Q23=conact('共選=',string(vQ23_sum,F2),'項',',vQ23m01=',string(vQ23m01,F2),',vQ23m02=',string(vQ23m02,F2),',vQ23m03=',string(vQ23m03,F2),',vQ23m04=',string(vQ23m04,F2),
',vQ23m05=',string(vQ23m05,F2),',vQ23m06=',string(vQ23m06,F2),',vQ23m07=',string(vQ23m07,F2),',vQ23m08=',string(vQ23m08,F2),',vQ23m09=',string(vQ23m09,F2),
',vQ23m10=',string(vQ23m10,F2),',vQ23m11=',string(vQ23m11,F2),',vQ23m12=',string(vQ23m12,F2),',vQ23m13=',string(vQ23m13,F2),',vQ23m14=',string(vQ23m14,F2),
',vQ23m15=',string(vQ23m15,F2),',vQ23m16=',string(vQ23m16,F2),',vQ23m17=',string(vQ23m17,F2),',vQ23m18=',string(vQ23m18,F2),',vQ23m19=',string(vQ23m19,F2),
',vQ23m20=',string(vQ23m20,F2),',vQ23m21=',string(vQ23m21,F2),',vQ23m22=',string(vQ23m22,F2),',vQ23m23=',string(vQ23m23,F2),',vQ23m24=',string(vQ23m24,F2),
',vQ23m25=',string(vQ23m25,F2),',vQ23m26=',string(vQ23m26,F2),',vQ23m27=',string(vQ23m27,F2),',vQ23m88=',string(vQ23m88,F2),',vQ23o88=',char.substr(vQ23o88,1,150)).
compute 列出_Q26=conact('共選=',string(vQ26_sum,F2),'項',',vQ26m01=',string(vQ26m01,F2),',vQ26m02=',string(vQ26m02,F2),',vQ26m03=',string(vQ26m03,F2),',vQ26m04=',string(vQ26m04,F2),
',vQ26m05=',string(vQ26m05,F2),',vQ26m06=',string(vQ26m06,F2),',vQ26m07=',string(vQ26m07,F2),',vQ26m08=',string(vQ26m08,F2),',vQ26m09=',string(vQ26m09,F2),
',vQ26m10=',string(vQ26m10,F2),',vQ26m11=',string(vQ26m11,F2),',vQ26m12=',string(vQ26m12,F2),',vQ26m13=',string(vQ26m13,F2),',vQ26m14=',string(vQ26m14,F2),
',vQ26m15=',string(vQ26m15,F2),',vQ26m16=',string(vQ26m16,F2),',vQ26m17=',string(vQ26m17,F2),',vQ26m18=',string(vQ26m18,F2),',vQ26m19=',string(vQ26m19,F2),
',vQ26m20=',string(vQ26m20,F2),',vQ26m21=',string(vQ26m21,F2),',vQ26m22=',string(vQ26m22,F2),',vQ26m23=',string(vQ26m23,F2),',vQ26m24=',string(vQ26m24,F2),
',vQ26m25=',string(vQ26m25,F2),',vQ26m26=',string(vQ26m26,F2),',vQ26m27=',string(vQ26m27,F2),',vQ26m28=',string(vQ26m28,F2),',vQ26m29=',string(vQ26m29,F2),
',vQ26m88=',string(vQ26m88,F2),',vQ26o88=',char.substr(vQ26o88,1,150)).
compute 列出_Q27=conact('共選=',string(vQ27_sum,F2),'項',',vQ27m01=',string(vQ27m01,F2),',vQ27m02=',string(vQ27m02,F2),',vQ27m03=',string(vQ27m03,F2),',vQ27m04=',string(vQ27m04,F2),',vQ27m05=',string(vQ27m05,F2),',vQ27m06=',string(vQ27m06,F2),
',vQ27m07=',string(vQ27m07,F2),',vQ27m88=',string(vQ27m88,F2),',vQ27o88=',char.substr(vQ27o88,1,150)).
compute 列出_Q30=conact('共選=',string(vQ30_sum,F2),'項',',vQ30m01=',string(vQ30m01,F2),',vQ30m02=',string(vQ30m02,F2),',vQ30m03=',string(vQ30m03,F2),',vQ30m04=',string(vQ30m04,F2),
',vQ30m05=',string(vQ30m05,F2),',vQ30m06=',string(vQ30m06,F2),',vQ30m07=',string(vQ30m07,F2),',vQ30m08=',string(vQ30m08,F2),',vQ30m90=',string(vQ30m90,F2)).
compute 列出_Q31=conact('共選=',string(vQ31_sum,F2),'項',',vQ31m01=',string(vQ31m01,F2),',vQ31m02=',string(vQ31m02,F2),',vQ31m03=',string(vQ31m03,F2),',vQ31m04=',string(vQ31m04,F2),
',vQ31m05=',string(vQ31m05,F2),',vQ31m06=',string(vQ31m06,F2),',vQ31m07=',string(vQ31m07,F2),',vQ31m08=',string(vQ31m08,F2),',vQ31m90=',string(vQ31m90,F2)).
compute 列出_ZE2=conact('共選=',string(vZE2_sum,F2),'項',',vZE2m01=',string(vZE2m01,F2),',vZE2m02=',string(vZE2m02,F2),',vZE2m03=',string(vZE2m03,F2)).
exe.
******複選題.

*K1.
vector a=vK1m01 to vK1m90.
loop #i=1 to 14.
do if  (any(a(#i),0,1) & any(a(#i+1),96,97,98)) |
 (any(a(#i),96) & not any(a(#i+1),96)) |
 (any(a(#i),97) & not any(a(#i+1),97)) |
 (any(a(#i),98) & not any(a(#i+1),98)) |
 (sum(vK1m01 to vK1m90)=0).
compute m1202=列出_K1.
compute p1202="K1至少選1項或選特殊碼應一致".
compute s1202=2.
end if.
end loop.
exec.
do if  sum(vK1m01 to vK1m88)>0&vK1m90=1.
compute m1203=列出_K1.
compute p1203='K1選90，應與其他選項互斥'.
compute s1203=2.
end if.
*K2.
vector a=vK2m01 to vK2m90.
loop #i=1 to 13.
do if  (any(a(#i),0,1) & any(a(#i+1),96,97,98)) |
 (any(a(#i),96) & not any(a(#i+1),96)) |
 (any(a(#i),97) & not any(a(#i+1),97)) |
 (any(a(#i),98) & not any(a(#i+1),98)) |
 (sum(vK2m01 to vK2m90)=0).
compute m1204=列出_K2.
compute p1204="K2至少選1項或選特殊碼應一致".
compute s1204=2.
end if.
end loop.
exec.
do if  sum(vK2m01 to vK2m88)>0&vK2m90=1.
compute m1205=列出_K2.
compute p1205='K2選90，應與其他選項互斥'.
compute s1205=2.
end if.

*KFB3.
vector a=vKFB3m01 to vKFB3m88.
loop #i=1 to 17.
do if  (any(a(#i),0,1) & any(a(#i+1),96,97,98)) |
 (any(a(#i),96) & not any(a(#i+1),96)) |
 (any(a(#i),97) & not any(a(#i+1),97)) |
 (any(a(#i),98) & not any(a(#i+1),98)) |
 (sum(vKFB3m01 to vKFB3m88)=0).
compute m1206=列出_KFB3.
compute p1206="KFB3至少選1項或選特殊碼應一致".
compute s1206=2.
end if.
end loop.
exec.

 
*KFB4.
vector a=vKFB4m01 to vKFB4m88.
loop #i=1 to 18.
do if  (any(a(#i),0,1) & any(a(#i+1),96,97,98)) |
 (any(a(#i),96) & not any(a(#i+1),96)) |
 (any(a(#i),97) & not any(a(#i+1),97)) |
 (any(a(#i),98) & not any(a(#i+1),98)) |
 (sum(vKFB4m01 to vKFB4m88)=0).
compute m1207=列出_KFB4.
compute p1207="KFB4至少選1項或選特殊碼應一致".
compute s1207=2.
end if.
end loop.
exec.

*KIG3.
vector a=vKIG3m01 to vKIG3m88.
loop #i=1 to 17.
do if  (any(a(#i),0,1) & any(a(#i+1),96,97,98)) |
 (any(a(#i),96) & not any(a(#i+1),96)) |
 (any(a(#i),97) & not any(a(#i+1),97)) |
 (any(a(#i),98) & not any(a(#i+1),98)) |
 (sum(vKIG3m01 to vKIG3m88)=0).
compute m1208=列出_KIG3.
compute p1208="KIG3至少選1項或選特殊碼應一致".
compute s1208=2.
end if.
end loop.
exec.

*KIG4.
vector a=vKIG4m01 to vKIG4m88.
loop #i=1 to 14.
do if  (any(a(#i),0,1) & any(a(#i+1),96,97,98)) |
 (any(a(#i),96) & not any(a(#i+1),96)) |
 (any(a(#i),97) & not any(a(#i+1),97)) |
 (any(a(#i),98) & not any(a(#i+1),98)) |
 (sum(vKIG4m01 to vKIG4m88)=0).
compute m1209=列出_KIG4.
compute p1209="KIG4至少選1項或選特殊碼應一致".
compute s1209=2.
end if.
end loop.
exec.

*KTT3.
vector a=vKTT3m01 to vKTT3m88.
loop #i=1 to 16.
do if  (any(a(#i),0,1) & any(a(#i+1),96,97,98)) |
 (any(a(#i),96) & not any(a(#i+1),96)) |
 (any(a(#i),97) & not any(a(#i+1),97)) |
 (any(a(#i),98) & not any(a(#i+1),98)) |
 (sum(vKTT3m01 to vKTT3m88)=0).
compute m1210=列出_KTT3.
compute p1210="KTT3至少選1項或選特殊碼應一致".
compute s1210=2.
end if.
end loop.
exec.


*KTT4.
vector a=vKTT4m01 to vKTT4m88.
loop #i=1 to 14.
do if  (any(a(#i),0,1) & any(a(#i+1),96,97,98)) |
 (any(a(#i),96) & not any(a(#i+1),96)) |
 (any(a(#i),97) & not any(a(#i+1),97)) |
 (any(a(#i),98) & not any(a(#i+1),98)) |
 (sum(vKTT4m01 to vKTT4m88)=0).
compute m1211=列出_KTT4.
compute p1211="KTT4至少選1項或選特殊碼應一致".
compute s1211=2.
end if.
end loop.
exec.


*KTT5.
vector a=vKTT5m01 to vKTT5m88.
loop #i=1 to 12.
do if  (any(a(#i),0,1) & any(a(#i+1),96,97,98)) |
 (any(a(#i),96) & not any(a(#i+1),96)) |
 (any(a(#i),97) & not any(a(#i+1),97)) |
 (any(a(#i),98) & not any(a(#i+1),98)) |
 (sum(vKTT5m01 to vKTT5m88)=0).
compute m1212=列出_KTT5.
compute p1212="KTT5至少選1項或選特殊碼應一致".
compute s1212=2.
end if.
end loop.
exec.

*K3.
vector a=vK3m01 to vK3m90.
loop #i=1 to 10.
do if  (any(a(#i),0,1) & any(a(#i+1),96,97,98)) |
 (any(a(#i),96) & not any(a(#i+1),96)) |
 (any(a(#i),97) & not any(a(#i+1),97)) |
 (any(a(#i),98) & not any(a(#i+1),98)) |
 (sum(vK3m01 to vK3m90)=0).
compute m1213=列出_K3.
compute p1213="K3至少選1項或選特殊碼應一致".
compute s1213=2.
end if.
end loop.
exec.
do if  sum(vK3m01 to vK3m88)>0&vK3m90=1.
compute m1214=列出_K3.
compute p1214='K3選90，應與其他選項互斥'.
compute s1214=2.
end if.

*E2.
vector a=vE2m01 to vE2m88.
loop #i=1 to 4.
do if  (any(a(#i),0,1) & any(a(#i+1),96,97,98)) |
 (any(a(#i),96) & not any(a(#i+1),96)) |
 (any(a(#i),97) & not any(a(#i+1),97)) |
 (any(a(#i),98) & not any(a(#i+1),98)) |
 (sum(vE2m01 to vE2m88)=0).
compute m1215=列出_E2.
compute p1215="E2至少選1項或選特殊碼應一致".
compute s1215=2.
end if.
end loop.
exec.


*E13.
vector a=vE13m01 to vE13m88.
loop #i=1 to 6.
do if  (any(a(#i),0,1) & any(a(#i+1),96,97,98)) |
 (any(a(#i),96) & not any(a(#i+1),96)) |
 (any(a(#i),97) & not any(a(#i+1),97)) |
 (any(a(#i),98) & not any(a(#i+1),98)) |
 (sum(vE13m01 to vE13m88)=0).
compute m1216=列出_E13.
compute p1216="E13至少選1項或選特殊碼應一致".
compute s1216=2.
end if.
end loop.
exec.

*G7.
vector a=vG7m01 to vG7m90.
loop #i=1 to 13.
do if  (any(a(#i),0,1) & any(a(#i+1),96,97,98)) |
 (any(a(#i),96) & not any(a(#i+1),96)) |
 (any(a(#i),97) & not any(a(#i+1),97)) |
 (any(a(#i),98) & not any(a(#i+1),98)) |
 (sum(vG7m01 to vG7m90)=0).
compute m1217=列出_G7.
compute p1217="G7至少選1項或選特殊碼應一致".
compute s1217=2.
end if.
end loop.
exec.
do if  sum(vG7m01 to vG7m88)>0&vG7m90=1.
compute m1218=列出_G7.
compute p1218='G7選90，應與其他選項互斥'.
compute s1218=2.
end if.

*G8.
vector a=vG8m01 to vG8m90.
loop #i=1 to 17.
do if  (any(a(#i),0,1) & any(a(#i+1),96,97,98)) |
 (any(a(#i),96) & not any(a(#i+1),96)) |
 (any(a(#i),97) & not any(a(#i+1),97)) |
 (any(a(#i),98) & not any(a(#i+1),98)) |
 (sum(vG8m01 to vG8m90)=0).
compute m1219=列出_G8.
compute p1219="G8至少選1項或選特殊碼應一致".
compute s1219=2.
end if.
end loop.
exec.
do if  sum(vG8m01 to vG8m88)>0&vG8m90=1.
compute m1220=列出_G8.
compute p1220='G8選90，應與其他選項互斥'.
compute s1220=2.
end if.


*G9.
vector a=vG9m01 to vG9m90.
loop #i=1 to 14.
do if  (any(a(#i),0,1) & any(a(#i+1),96,97,98)) |
 (any(a(#i),96) & not any(a(#i+1),96)) |
 (any(a(#i),97) & not any(a(#i+1),97)) |
 (any(a(#i),98) & not any(a(#i+1),98)) |
 (sum(vG9m01 to vG9m90)=0).
compute m1221=列出_G9.
compute p1221="G9至少選1項或選特殊碼應一致".
compute s1221=2.
end if.
end loop.
exec.
do if  sum(vG9m01 to vG9m88)>0&vG9m90=1.
compute m1222=列出_G9.
compute p1222='G9選90，應與其他選項互斥'.
compute s1222=2.
end if.
*G10.
vector a=vG10m01 to vG10m90.
loop #i=1 to 13.
do if  (any(a(#i),0,1) & any(a(#i+1),96,97,98)) |
 (any(a(#i),96) & not any(a(#i+1),96)) |
 (any(a(#i),97) & not any(a(#i+1),97)) |
 (any(a(#i),98) & not any(a(#i+1),98)) |
 (sum(vG10m01 to vG10m90)=0).
compute m1223=列出_G10.
compute p1223="G10至少選1項或選特殊碼應一致".
compute s1223=2.
end if.
end loop.
exec.
do if  sum(vG10m01 to vG10m88)>0&vG10m90=1.
compute m1224=列出_G10.
compute p1224='G10選90，應與其他選項互斥'.
compute s1224=2.
end if.
*G11.
vector a=vG11m01 to vG11m90.
loop #i=1 to 6.
do if  (any(a(#i),0,1) & any(a(#i+1),96,97,98)) |
 (any(a(#i),96) & not any(a(#i+1),96)) |
 (any(a(#i),97) & not any(a(#i+1),97)) |
 (any(a(#i),98) & not any(a(#i+1),98)) |
 (sum(vG11m01 to vG11m90)=0).
compute m1225=列出_G11.
compute p1225="G11至少選1項或選特殊碼應一致".
compute s1225=2.
end if.
end loop.
exec.
do if  sum(vG11m01 to vG11m88)>0&vG11m90=1.
compute m1226=列出_G11.
compute p1226='G11選90，應與其他選項互斥'.
compute s1226=2.
end if.


*B7a.
vector a=vB7am01 to vB7am88.
loop #i=1 to 54.
do if  (any(a(#i),0,1) & any(a(#i+1),96,97,98)) |
 (any(a(#i),96) & not any(a(#i+1),96)) |
 (any(a(#i),97) & not any(a(#i+1),97)) |
 (any(a(#i),98) & not any(a(#i+1),98)) |
 (sum(vB7am01 to vB7am88)=0).
compute m1227=列出_B7a.
compute p1227="B7a至少選1項或選特殊碼應一致".
compute s1227=2.
end if.
end loop.
exec.

*B8.
vector a=vB8m01 to vB8m88.
loop #i=1 to 10.
do if  (any(a(#i),0,1) & any(a(#i+1),96,97,98)) |
 (any(a(#i),96) & not any(a(#i+1),96)) |
 (any(a(#i),97) & not any(a(#i+1),97)) |
 (any(a(#i),98) & not any(a(#i+1),98)) |
 (sum(vB8m01 to vB8m88)=0).
compute m1228=列出_B8.
compute p1228="B8至少選1項或選特殊碼應一致".
compute s1228=2.
end if.
end loop.
exec.

*G3.
vector a=vG3m01 to vG3m88.
loop #i=1 to 32.
do if  (any(a(#i),0,1) & any(a(#i+1),96,97,98)) |
 (any(a(#i),96) & not any(a(#i+1),96)) |
 (any(a(#i),97) & not any(a(#i+1),97)) |
 (any(a(#i),98) & not any(a(#i+1),98)) |
 (sum(vG3m01 to vG3m88)=0).
compute m1229=列出_G3.
compute p1229="G3至少選1項或選特殊碼應一致".
compute s1229=2.
end if.
end loop.
exec.

*F5.
vector a=vF5m01 to vF5m88.
loop #i=1 to 8.
do if  (any(a(#i),0,1) & any(a(#i+1),96,97,98)) |
 (any(a(#i),96) & not any(a(#i+1),96)) |
 (any(a(#i),97) & not any(a(#i+1),97)) |
 (any(a(#i),98) & not any(a(#i+1),98)) |
 (sum(vF5m01 to vF5m88)=0).
compute m1230=列出_F5.
compute p1230="F5至少選1項或選特殊碼應一致".
compute s1230=2.
end if.
end loop.
exec.

*C3.
vector a=vC3m01 to vC3m88.
loop #i=1 to 11.
do if  (any(a(#i),0,1) & any(a(#i+1),96,97,98)) |
 (any(a(#i),96) & not any(a(#i+1),96)) |
 (any(a(#i),97) & not any(a(#i+1),97)) |
 (any(a(#i),98) & not any(a(#i+1),98)) |
 (sum(vC3m01 to vC3m88)=0).
compute m1231=列出_C3.
compute p1231="C3至少選1項或選特殊碼應一致".
compute s1231=2.
end if.
end loop.
exec.


*JB1.
vector a=vJB1m01 to vJB1m90.
loop #i=1 to 12.
do if  (any(a(#i),0,1) & any(a(#i+1),96,97,98)) |
 (any(a(#i),96) & not any(a(#i+1),96)) |
 (any(a(#i),97) & not any(a(#i+1),97)) |
 (any(a(#i),98) & not any(a(#i+1),98)) |
 (sum(vJB1m01 to vJB1m90)=0).
compute m1232=列出_JB1.
compute p1232="JB1至少選1項或選特殊碼應一致".
compute s1232=2.
end if.
end loop.
exec.
do if  sum(vJB1m01 to vJB1m88)>0&vJB1m90=1.
compute m1233=列出_JB1.
compute p1233='JB1選90，應與其他選項互斥'.
compute s1233=2.
end if.
*JB2.
vector a=vJB2m01 to vJB2m90.
loop #i=1 to 8.
do if  (any(a(#i),0,1) & any(a(#i+1),96,97,98)) |
 (any(a(#i),96) & not any(a(#i+1),96)) |
 (any(a(#i),97) & not any(a(#i+1),97)) |
 (any(a(#i),98) & not any(a(#i+1),98)) |
 (sum(vJB2m01 to vJB2m90)=0).
compute m1234=列出_JB2.
compute p1234="JB2至少選1項或選特殊碼應一致".
compute s1234=2.
end if.
end loop.
exec.
do if  sum(vJB2m01 to vJB2m88)>0&vJB2m90=1.
compute m1235=列出_JB2.
compute p1235='JB2選90，應與其他選項互斥'.
compute s1235=2.
end if.

*M2.
vector a=vM2m01 to vM2m88.
loop #i=1 to 16.
do if  (any(a(#i),0,1) & any(a(#i+1),96,97,98)) |
 (any(a(#i),96) & not any(a(#i+1),96)) |
 (any(a(#i),97) & not any(a(#i+1),97)) |
 (any(a(#i),98) & not any(a(#i+1),98)) |
 (sum(vM2m01 to vM2m88)=0).
compute m1236=列出_M2.
compute p1236="M2至少選1項或選特殊碼應一致".
compute s1236=2.
end if.
end loop.
exec.

*M3.
vector a=vM3m01 to vM3m88.
loop #i=1 to 13.
do if  (any(a(#i),0,1) & any(a(#i+1),96,97,98)) |
 (any(a(#i),96) & not any(a(#i+1),96)) |
 (any(a(#i),97) & not any(a(#i+1),97)) |
 (any(a(#i),98) & not any(a(#i+1),98)) |
 (sum(vM3m01 to vM3m88)=0).
compute m1237=列出_M3.
compute p1237="M3至少選1項或選特殊碼應一致".
compute s1237=2.
end if.
end loop.
exec.

*Q20.
vector a=vQ20m01 to vQ20m90.
loop #i=1 to 7.
do if  (any(a(#i),0,1) & any(a(#i+1),96,97,98)) |
 (any(a(#i),96) & not any(a(#i+1),96)) |
 (any(a(#i),97) & not any(a(#i+1),97)) |
 (any(a(#i),98) & not any(a(#i+1),98)) |
 (sum(vQ20m01 to vQ20m90)=0).
compute m1238=列出_Q20.
compute p1238="Q20至少選1項或選特殊碼應一致".
compute s1238=2.
end if.
end loop.
exec.

do if  sum(vQ20m01 to vQ20m88)>0&vQ20m90=1.
compute m1239=列出_Q20.
compute p1239='Q20選90，應與其他選項互斥'.
compute s1239=2.
end if.


*Q25.
vector a=vQ25m01 to vQ25m88.
loop #i=1 to 31.
do if  (any(a(#i),0,1) & any(a(#i+1),96,97,98)) |
 (any(a(#i),96) & not any(a(#i+1),96)) |
 (any(a(#i),97) & not any(a(#i+1),97)) |
 (any(a(#i),98) & not any(a(#i+1),98)) |
 (sum(vQ25m01 to vQ25m88)=0).
compute m1240=列出_Q25.
compute p1240="Q25至少選1項或選特殊碼應一致".
compute s1240=2.
end if.
end loop.
exec.

*Q22.
vector a=vQ22m01 to vQ22m88.
loop #i=1 to 40.
do if  (any(a(#i),0,1) & any(a(#i+1),96,97,98)) |
 (any(a(#i),96) & not any(a(#i+1),96)) |
 (any(a(#i),97) & not any(a(#i+1),97)) |
 (any(a(#i),98) & not any(a(#i+1),98)) |
 (sum(vQ22m01 to vQ22m88)=0).
compute m1241=列出_Q22.
compute p1241="Q22至少選1項或選特殊碼應一致".
compute s1241=2.
end if.
end loop.
EXECUTE.

*Q23.
vector a=vQ23m01 to vQ23m88.
loop #i=1 to 27.
do if  (any(a(#i),0,1) & any(a(#i+1),96,97,98)) |
 (any(a(#i),96) & not any(a(#i+1),96)) |
 (any(a(#i),97) & not any(a(#i+1),97)) |
 (any(a(#i),98) & not any(a(#i+1),98)) |
 (sum(vQ23m01 to vQ23m88)=0).
compute m1242=列出_Q23.
compute p1242="Q23至少選1項或選特殊碼應一致".
compute s1242=2.
end if.
end loop.
exec.

*Q26.
vector a=vQ26m01 to vQ26m88.
loop #i=1 to 29.
do if  (any(a(#i),0,1) & any(a(#i+1),96,97,98)) |
 (any(a(#i),96) & not any(a(#i+1),96)) |
 (any(a(#i),97) & not any(a(#i+1),97)) |
 (any(a(#i),98) & not any(a(#i+1),98)) |
 (sum(vQ26m01 to vQ26m88)=0).
compute m1243=列出_Q26.
compute p1243="Q26至少選1項或選特殊碼應一致".
compute s1243=2.
end if.
end loop.
exec.

*Q27.
vector a=vQ27m01 to vQ27m88.
loop #i=1 to 7.
do if  (any(a(#i),0,1) & any(a(#i+1),96,97,98)) |
 (any(a(#i),96) & not any(a(#i+1),96)) |
 (any(a(#i),97) & not any(a(#i+1),97)) |
 (any(a(#i),98) & not any(a(#i+1),98)) |
 (sum(vQ27m01 to vQ27m88)=0).
compute m1244=列出_Q27.
compute p1244="Q27至少選1項或選特殊碼應一致".
compute s1244=2.
end if.
end loop.
exec.

*Q30.
vector a=vQ30m01 to vQ30m90.
loop #i=1 to 8.
do if  (any(a(#i),0,1) & any(a(#i+1),96,97,98)) |
 (any(a(#i),96) & not any(a(#i+1),96)) |
 (any(a(#i),97) & not any(a(#i+1),97)) |
 (any(a(#i),98) & not any(a(#i+1),98)) |
 (sum(vQ30m01 to vQ30m90)=0).
compute m1245=列出_Q30.
compute p1245="Q30至少選1項或選特殊碼應一致".
compute s1245=2.
end if.
end loop.
exec.

do if  sum(vQ30m01 to vQ30m08)>0&vQ30m90=1.
compute m1246=列出_Q30.
compute p1246='Q30選90，應與其他選項互斥'.
compute s1246=2.
end if.


*Q31.
vector a=vQ31m01 to vQ31m90.
loop #i=1 to 8.
do if  (any(a(#i),0,1) & any(a(#i+1),96,97,98)) |
 (any(a(#i),96) & not any(a(#i+1),96)) |
 (any(a(#i),97) & not any(a(#i+1),97)) |
 (any(a(#i),98) & not any(a(#i+1),98)) |
 (sum(vQ31m01 to vQ31m90)=0).
compute m1247=列出_Q31.
compute p1247="Q31至少選1項或選特殊碼應一致".
compute s1247=2.
end if.
end loop.
exec.

*ZE2.
vector a=vZE2m01 to vZE2m03.
loop #i=1 to 2.
do if  (any(a(#i),0,1) & any(a(#i+1),96,97,98)) |
 (any(a(#i),96) & not any(a(#i+1),96)) |
 (any(a(#i),97) & not any(a(#i+1),97)) |
 (any(a(#i),98) & not any(a(#i+1),98)) |
 (sum(vZE2m01 to vZE2m03)=0).
compute m1248=列出_ZE2.
compute p1248="ZE2至少選1項或選特殊碼應一致".
compute s1248=2.
end if.
end loop.
exec.

do if  sum(vZE2m01 to vZE2m02)>0&vZE2m03=1.
compute m1249=列出_ZE2.
compute p1249='ZE2選03，應與其他選項互斥'.
compute s1249=2.
end if.


*跳題邏輯.
do if any(vA1,997,998)&vA2=96.
compute m1301=CONCAT('vA1=',string(vA1,F3),',vA2=',string(vA2,F2)).
compute p1301='vA1答97、98，vA2不應跳答'.
compute s1301=2.
else if not any(vA1,97,98) &vA2~=96.
compute m1301=CONCAT('vA1=',string(vA1,F3),',vA2=',string(vA2,F2)).
compute p1301='vA1非答97、98，vA2應跳答'.
compute s1301=2.
end if.


do if vA4=2&(vA5city=96|vA5town=9996).
compute m1302=CONCAT('vA4=',string(vA4,F2),',vA5city=',string(vA5city,F2),',vA5town=',string(vA5town,F4)).
compute p1302='vA4答2，vA5不應跳答'.
compute s1302=2.
else if vA4~=2&(vA5city~=96|vA5town~=9996).
compute m1302=CONCAT('vA4=',string(vA4,F2),',vA5city=',string(vA5city,F2),',vA5town=',string(vA5town,F4)).
compute p1302='vA4非答2，vA5應跳答'.
compute s1302=2.
end if.

do if any(vO1,1,2,3,4,5,88)&any(1,vO2_96,vO3_96).
compute m1303=CONCAT('vO1=',string(vO1,F2),',vO2=',string(vO2,F2),',vO3=',string(vO3,F2)).
compute p1303='vO1答1-5、88，vO2、vO3不應跳答'.
compute s1303=2.
else if not any(vO1,1,2,3,4,5,88)&any(0,vO2_96,vO3_96,vO4_96).
compute m1303=CONCAT('vO1=',string(vO1,F2),',vO2=',string(vO2,F2),',vO3=',string(vO3,F2),',vO4=',string(vO4,f5)).
compute p1303='vO1非答1-5、88，vO2、vO3、vO4應跳答'.
compute s1303=2.
end if.


do if any(vO3,1,3,4,5,6,88)&any(1,vO4_96).
compute m1304=CONCAT('vO3=',string(vO3,F2),',vO4=',string(vO4,f5)).
compute p1304='vO3答1、3-6、88，vO4不應跳答'.
compute s1304=2.
else if not any(vO3,1,3,4,5,6,88)&any(0,vO4_96).
compute m1304=CONCAT('vO3=',string(vO3,F2),',vO4=',string(vO4,f5)).
compute p1304='vO3非答1、3-6、88，vO4應跳答'.
compute s1304=2.
end if.

do if any(vD1,1,2)&any(1,vD2_96 to vD4sD8_96).
compute m1305=CONCAT('vD1=',string(vD1,F2),',vD2=',string(vD2,n4),',vD3=',string(vD3,f5),',vD4sD4=',string(vD4sD4,F2),
',vD4sD5=',string(vD4sD5,F2),',vD4sD6=',string(vD4sD6,F2),',vD4sD7=',string(vD4sD7,F2),',vD4sD8=',string(vD4sD8,F2)).
compute p1305='vD1答1、2，vD2-vD4_D8不應跳答'.
compute s1305=2.
else if not any(vD1,1,2)&any(0,vD2_96 to vD4sD8_96).
compute m1305=CONCAT('vD1=',string(vD1,F2),',vD2=',string(vD2,n4),',vD3=',string(vD3,f5),',vD4sD4=',string(vD4sD4,F2),
',vD4sD5=',string(vD4sD5,F2),',vD4sD6=',string(vD4sD6,F2),',vD4sD7=',string(vD4sD7,F2),',vD4sD8=',string(vD4sD8,F2)).
compute p1305='vD1非答1、2，vD2-vD4_D8應跳答'.
compute s1305=2.
end if.


do if (vK1m01=1|vK2m13=1)&any(1,vE17_96,vKLI1_96,vKLI2_96).
compute m1306=CONCAT('vK1m01=',string(vK1m01,F2),',vK2m13=',string(vK2m13,F2),',vE17=',string(vE17,F2),',vKLI1=',string(vKLI1,n4),',vKLI2=',string(vKLI2,f5)).
compute p1306='vK1答1或vK2答13，vE17-vKLI2不應跳答'.
compute s1306=2.
else if (vK1m01~=1&vK2m13~=1)&any(0,vE17_96,vKLI1_96,vKLI2_96).
compute m1306=CONCAT('vK1m01=',string(vK1m01,F2),',vK2m13=',string(vK2m13,F2),',vE17=',string(vE17,F2),',vKLI1=',string(vKLI1,n4),',vKLI2=',string(vKLI2,f5)).
compute p1306='vK1未答1且vK2未答13，vE17-vKLI2應跳答'.
compute s1306=2.
end if.

do if (vK2m01=1|vK1m02=1)&any(1,vKFB1_96,vKFB2_96).
compute m1307=CONCAT('vK2m01=',string(vK2m01,F2),',vK1m02=',string(vK1m02,F2),',vKFB1=',string(vKFB1,n4),',vKFB2=',string(vKFB2,f5)).
compute p1307='vK2答1或vK1答2，vKFB1-vKFB2不應跳答'.
compute s1307=2.
else if (vK2m01~=1&vK1m02~=1)&any(0,vKFB1_96,vKFB2_96).
compute m1307=CONCAT('vK2m01=',string(vK2m01,F2),',vK1m02=',string(vK1m02,F2),',vKFB1=',string(vKFB1,n4),',vKFB2=',string(vKFB2,f5)).
compute p1307='vK2未答1且vK1未答2，vKFB1-vKFB2應跳答'.
compute s1307=2.
end if.

do if (vK2m01=1|vK1m02=1)&any(1,vKFB3m01_96 to vKFB3m88_96).
compute m1308=CONCAT('vK2m01=',string(vK2m01,F2),',vK1m02=',string(vK1m02,F2),',',列出_KFB3).
compute p1308='vK2答1或vK1答2，vKFB3不應跳答'.
compute s1308=2.
else if  (vK2m01~=1&vK1m02~=1)&any(0,vKFB3m01_96 to vKFB3m88_96).
compute m1308=CONCAT('vK2m01=',string(vK2m01,F2),',vK1m02=',string(vK1m02,F2),',',列出_KFB3).
compute p1308='vK2未答1且vK1未答2，vKFB3應跳答'.
compute s1308=2.
end if.

do if (vK2m01=1|vK1m02=1)&any(1,vKFB4m01_96 to vKFB4m88_96).
compute m1309=CONCAT('vK2m01=',string(vK2m01,F2),',vK1m02=',string(vK1m02,F2),',',列出_KFB4).
compute p1309='vK2答1或vK1答2，vKFB4不應跳答'.
compute s1309=2.
else if (vK2m01~=1&vK1m02~=1)&any(0,vKFB4m01_96 to vKFB4m88_96).
compute m1309=CONCAT('vK2m01=',string(vK2m01,F2),',vK1m02=',string(vK1m02,F2),',',列出_KFB4).
compute p1309='vK2未答1且vK1未答2，vKFB4應跳答'.
compute s1309=2.
end if.

do if (vK2m02=1|vK1m03=1)&any(1,vKIG1_96,vKIG2_96).
compute m1310=CONCAT('vK2m02=',string(vK2m02,F2),',vK1m03=',string(vK1m03,F2),',vKIG1=',string(vKIG1,n4),',vKIG2=',string(vKIG2,f5)).
compute p1310='vK2答2或vK1答3，vKIG1-vKIG2不應跳答'.
compute s1310=2.
else if (vK2m02~=1&vK1m03~=1)&any(0,vKIG1_96,vKIG2_96).
compute m1310=CONCAT('vK2m02=',string(vK2m02,F2),',vK1m03=',string(vK1m03,F2),',vKIG1=',string(vKIG1,n4),',vKIG2=',string(vKIG2,f5)).
compute p1310='vK2未答2且vK1未答3，vKIG1-vKIG2應跳答'.
compute s1310=2.
end if.

do if  (vK2m02=1|vK1m03=1)&any(1,vKIG3m01_96 to vKIG3m88_96).
compute m1311=CONCAT('vK2m02=',string(vK2m02,F2),',',列出_KIG3).
compute p1311='vK2答2或vK1答3，vKIG3不應跳答'.
compute s1311=2.
else if  (vK2m02~=1&vK1m03~=1)&any(0,vKIG3m01_96 to vKIG3m88_96).
compute m1311=CONCAT('vK2m02=',string(vK2m02,F2),',',列出_KIG3).
compute p1311='vK2未答2且vK1未答3，vKIG3應跳答'.
compute s1311=2.
end if.

do if  (vK2m02=1|vK1m03=1)&any(1,vKIG4m01_96 to vKIG4m88_96).
compute m1312=CONCAT('vK2m02=',string(vK2m02,F2),',',列出_KIG4).
compute p1312='vK2答2或vK1答3，vKIG4不應跳答'.
compute s1312=2.
else if  (vK2m02~=1&vK1m03~=1)&any(0,vKIG4m01_96 to vKIG4m88_96).
compute m1312=CONCAT('vK2m02=',string(vK2m02,F2),',',列出_KIG4).
compute p1312='vK2未答2且vK1未答3，vKIG4應跳答'.
compute s1312=2.
end if.

do if (vK2m07=1|vK1m11=1)&any(1,vKTT1_96,vKTT2_96).
compute m1314=CONCAT('vK2m07=',string(vK2m07,F2),',vK1m11=',string(vK1m11,F2),',vKTT1=',string(vKTT1,n4),',vKTT2=',string(vKTT2,f5)).
compute p1314='vK2答7或vK1答11，vKTT1-vKTT2不應跳答'.
compute s1314=2.
else if (vK2m07~=1&vK1m11~=1)&any(0,vKTT1_96,vKTT2_96).
compute m1314=CONCAT('vK2m07=',string(vK2m07,F2),',vK1m11=',string(vK1m11,F2),',vKTT1=',string(vKTT1,n4),',vKTT2=',string(vKTT2,f5)).
compute p1314='vK2未答7且vK1未答11，vKTT1-vKTT2應跳答'.
compute s1314=2.
end if.

do if  (vK2m07=1|vK1m11=1)&any(1,vKTT3m01_96 to vKTT3m88_96).
compute m1315=CONCAT('vK2m07=',string(vK2m07,F2),',vK1m11=',string(vK1m11,F2),',',列出_KTT3).
compute p1315='vK2答7或vK1答11，vKTT3不應跳答'.
compute s1315=2.
else if (vK2m07~=1&vK1m11~=1)&any(0,vKTT3m01_96 to vKTT3m88_96).
compute m1315=CONCAT('vK2m07=',string(vK2m07,F2),',vK1m11=',string(vK1m11,F2),',',列出_KTT3).
compute p1315='vK2未答7且vK1未答11，vKTT3應跳答'.
compute s1315=2.
end if.

do if  (vK2m07=1|vK1m11=1)&any(1,vKTT4m01_96 to vKTT4m88_96).
compute m1316=CONCAT('vK2m07=',string(vK2m07,F2),',vK1m11=',string(vK1m11,F2),',',列出_KTT4).
compute p1316='vK2答7或vK1答11，vKTT4不應跳答'.
compute s1316=2.
else if (vK2m07~=1&vK1m11~=1)&any(0,vKTT4m01_96 to vKTT4m88_96).
compute m1316=CONCAT('vK2m07=',string(vK2m07,F2),',',列出_KTT4).
compute p1316='vK2未答7且vK1未答11，vKTT4應跳答'.
compute s1316=2.
end if.

do if  (vK2m07=1|vK1m11=1)&any(1,vKTT5m01_96 to vKTT5m88_96).
compute m1317=CONCAT('vK2m07=',string(vK2m07,F2),',vK1m11=',string(vK1m11,F2),',',列出_KTT5).
compute p1317='vK2答7或vK1答11，vKTT5不應跳答'.
compute s1317=2.
else if (vK2m07~=1&vK1m11~=1)&any(0,vKTT5m01_96 to vKTT5m88_96).
compute m1317=CONCAT('vK2m07=',string(vK2m07,F2),',vK1m11=',string(vK1m11,F2),',',列出_KTT5).
compute p1317='vK2未答7且vK1未答11，vKTT5應跳答'.
compute s1317=2.
end if.

do if  (vK2m11=1|vK1m13=1)&any(1,vP5_1_96,vP5_2_96).
compute m1318=CONCAT('vK2m11=',string(vK2m11,F2),',vK1m13=',string(vK1m13,F2),',vP5_1=',string(vP5_1,n4),',vP5_2=',string(vP5_2,F5)).
compute p1318='vK2答11或vK1答13，vP5_1、vP5_2不應跳答'.
compute s1318=2.
else if (vK2m11~=1&vK1m13~=1)&any(0,vP5_1_96,vP5_2_96).
compute m1318=CONCAT('vK2m11=',string(vK2m11,F2),',vK1m13=',string(vK1m13,F2),',vP5_1=',string(vP5_1,n4),',vP5_2=',string(vP5_2,F5)).
compute p1318='vK2未答11且vK1未答13，vP5_1、vP5_2應跳答'.
compute s1318=2.
end if.


do if vK3m01=1&any(1,vE18_96,vKYT1_96,vKYT2_96).
compute m1320=CONCAT('vK3m01=',string(vK3m01,F2),',vE18=',string(vE18,F2),',vKYT1=',string(vKYT1,n4),',vKYT2=',string(vKYT2,f5)).
compute p1320='vK1答1，vE18-vKYT2不應跳答'.
compute s1320=2.
else if vK3m01~=1&any(0,vE18_96,vKYT1_96,vKYT2_96).
compute m1320=CONCAT('vK3m01=',string(vK3m01,F2),',vE18=',string(vE18,F2),',vKYT1=',string(vKYT1,n4),',vKYT2=',string(vKYT2,f5)).
compute p1320='vK1未答1，vE18-vKYT2應跳答'.
compute s1320=2.
end if.

do if (vK1m90=0|vK2m90=0|vK3m90=0)&any(vE1,2,97,98).
compute m1321=CONCAT(列出_K1,',',列出_K2,',',列出_K3,',vE1=',string(vE1,F2)).
compute p1321='vK1、vK2、vK3未皆答90、97、98，vE1應答1'.
compute s1321=2.
 * else if any(vK1m90,1,97,98)&any(vK2m90,1,97,98)&any(vK3m90,1,97,98)&vE1=1.
 * compute m1321=CONCAT(列出_K1,',',列出_K2,',',列出_K3,',vE1=',string(vE1,F2)).
 * compute p1321='vK1、vK2、vK3皆答90、97、98，vE1不應答1'.
 * compute s1321=2.
end if.


do if  vE1=1&any(1,vE2m01_96,vE2m02_96,vE2m03_96,vE2m88_96).
compute m1322=CONCAT('vE1=',string(vE1,F2),',',列出_E2).
compute p1322='vE1答1，不應跳答vE2'.
compute s1322=2.
else if vE1~=1&any(0,vE2m01_96,vE2m02_96,vE2m03_96,vE2m88_96).
compute m1322=CONCAT('vE1=',string(vE1,F2),',',列出_E2).
compute p1322='vE1非答1，應跳答vE2'.
compute s1322=2.
end if.

do if  (vE2m01=1|vE17=1|vE18=1)&any(1,vE4_96,vE6_96).
compute m1323=CONCAT('vE2m01=',string(vE2m01,F2),',vE17=',string(vE17,F2),',vE18=',string(vE18,F2),',vE4=',string(vE4,n4),',vE5=',string(vE5,f5),',vE6=',string(vE6,f5)).
compute p1323='vE2有答1或vE17有答1或vE18有答1，不應跳答vE4、vE6'.
compute s1323=2.
else if (vE2m01~=1&vE17~=1&vE18~=1)&any(0,vE4_96,vE6_96).
compute m1323=CONCAT('vE2m01=',string(vE2m01,F2),',vE17=',string(vE17,F2),',vE18=',string(vE18,F2),',vE4=',string(vE4,n4),',vE5=',string(vE5,f5),',vE6=',string(vE6,f5)).
compute p1323='vE2未答1且vE17未答1或vE17未答1，應跳答vE4、vE6'.
compute s1323=2.
end if.


do if  ((range(vO1_1,1,4,88,88)|range(vO1,1,5,12,14,88,88))&(vE2m01=1|vE17=1|vE18=1))&any(1,vE5_96).
compute m1326=CONCAT('vO1_1=',string(vO1_1,F2),',vO1=',string(vO1,F2),',vE2m01=',string(vE2m01,F2),',vE17=',string(vE17,F2),',vE18=',string(vE18,F2),',vE5=',string(vE5,f5)).
compute p1326='vO1_1有答1-4、88或vO1有答1-5、12-14、88，且vE2有答1或vE17有答1或vE18有答1，不應跳答vE5'.
compute s1326=2.
else if  ((not range(vO1_1,1,4,88,88)& not range(vO1,1,5,12,14,88,88))|(vE2m01~=1&vE17~=1&vE18~=1))&any(0,vE5_96).
compute m1326=CONCAT('vO1_1=',string(vO1_1,F2),',vO1=',string(vO1,F2),',vE2m01=',string(vE2m01,F2),',vE17=',string(vE17,F2),',vE18=',string(vE18,F2),',vE5=',string(vE5,f5)).
Compute p1326='vO1_1未答1-4、88且vO1未答1-5、12-14、88，或vE2未答1且vE17未答1或vE17未答1，應跳答vE5'.
compute s1326=2.
end if.

do if  (vE2m02=1|vE17=2|vE18=2)&any(1,vE7_96,vE9_96).
compute m1324=CONCAT('vE2m02=',string(vE2m02,F2),',vE17=',string(vE17,F2),',vE18=',string(vE18,F2),',vE7=',string(vE7,n4),',vE8=',string(vE8,f5),',vE9=',string(vE9,f5)).
compute p1324='vE2有答2或vE17有答2或vE18有答2，不應跳答vE7、vE9'.
compute s1324=2.
else if (vE2m02~=1&vE17~=2&vE18~=2)&any(0,vE7_96,vE9_96).
compute m1324=CONCAT('vE2m02=',string(vE2m02,F2),',vE17=',string(vE17,F2),',vE18=',string(vE18,F2),',vE7=',string(vE7,n4),',vE8=',string(vE8,f5),',vE9=',string(vE9,f5)).
compute p1324='vE2未答2且vE17未答2或vE17未答2，應跳答vE7、vE9'.
compute s1324=2.
end if.

do if  ((range(vO1_1,1,4,88,88)|range(vO1,1,5,12,14,88,88))&(vE2m02=1|vE17=2|vE18=2))&any(1,vE8_96).
compute m1607=CONCAT('vO1_1=',string(vO1_1,F2),',vO1=',string(vO1,F2),',vE2m02=',string(vE2m02,F2),',vE17=',string(vE17,F2),',vE18=',string(vE18,F2),',vE8=',string(vE8,f5)).
compute p1607='vO1_1有答1-4、88或vO1有答1-5、12-14、88，且vE2有答2或vE17有答2或vE18有答2，不應跳答vE8'.
compute s1607=2.
else if  ((not range(vO1_1,1,4,88,88)& not range(vO1,1,5,12,14,88,88))|(vE2m02~=1&vE17~=2&vE18~=2))&any(0,vE8_96).
compute m1607=CONCAT('vO1_1=',string(vO1_1,F2),',vO1=',string(vO1,F2),',vE2m02=',string(vE2m02,F2),',vE17=',string(vE17,F2),',vE18=',string(vE18,F2),',vE8=',string(vE8,f5)).
Compute p1307='vO1_1未答1-4、88且vO1未答1-5、12-14、88，或vE2未答2且vE17未答2或vE17未答2，應跳答vE8'.
compute s1607=2.
end if.


do if  (vE2m03=1|vE17=3|vE18=3)&any(1,vE10_96,vE12_96).
compute m1325=CONCAT('vE2m03=',string(vE2m03,F2),',vE17=',string(vE17,F2),',vE18=',string(vE18,F2),',vE10=',string(vE10,n4),',vE11=',string(vE11,f5),',vE12=',string(vE12,f5)).
compute p1325='vE2有答3或vE17有答3或vE18有答3，不應跳答vE10、vE12'.
compute s1325=2.
else if (vE2m03~=1&vE17~=3&vE18~=3)&any(0,vE10_96,vE12_96).
compute m1325=CONCAT('vE2m03=',string(vE2m03,F2),',vE17=',string(vE17,F2),',vE18=',string(vE18,F2),',vE10=',string(vE10,n4),',vE11=',string(vE11,f5),',vE12=',string(vE12,f5)).
Compute p1325='vE2未答3且vE17未答3或vE17未答3，應跳答vE10、vE12'.
compute s1325=2.
end if.


do if  ((range(vO1_1,1,4,88,88)|range(vO1,1,5,12,14,88,88))&(vE2m03=1|vE17=3|vE18=3))&any(1,vE11_96).
compute m1608=CONCAT('vO1_1=',string(vO1_1,F2),',vO1=',string(vO1,F2),',vE2m03=',string(vE2m03,F2),',vE17=',string(vE17,F2),',vE18=',string(vE18,F2),',vE11=',string(vE11,f5)).
compute p1608='vO1_1有答1-4、88或vO1有答1-5、12-14、88，且vE2有答3或vE17有答3或vE18有答3，不應跳答vE11'.
compute s1608=2.
else if  ((not range(vO1_1,1,4,88,88)& not range(vO1,1,5,12,14,88,88))|(vE2m03~=1&vE17~=3&vE18~=3))&any(0,vE11_96).
compute m1608=CONCAT('vO1_1=',string(vO1_1,F2),',vO1=',string(vO1,F2),',vE2m03=',string(vE2m03,F2),',vE17=',string(vE17,F2),',vE18=',string(vE18,F2),',vE11=',string(vE11,f5)).
Compute p1608='vO1_1未答1-4、88且vO1未答1-5、12-14、88，或vE2未答3且vE17未答3或vE17未答3，應跳答vE11'.
compute s1608=2.
end if.



do if  vE1=1&any(1,vE3_96).
compute m1327=CONCAT('vE1=',string(vE1,F2),',vE3=',string(vE3,f5)).
compute p1327='vE1答1，不應跳答vE3'.
compute s1327=2.
else if vE1~=1&any(0,vE3_96).
compute m1327=CONCAT('vE1=',string(vE1,F2),',vE3=',string(vE3,f5)).
compute p1327='vE1非答1，應跳答vE3'.
compute s1327=2.
end if.



do if any(D3_1,97,98,96).
compute D3_1n=0.
else if not any(D3_1,97,98,96).
compute D3_1n=D3_1.
end if.
do if any(D3_2,97,98,96).
compute D3_2n=0.
else if not any(D3_2,97,98,96).
compute D3_2n=D3_2.
end if.
do if any(E5_1,97,98,96).
compute E5_1n=0.
else if not any(E5_1,97,98,96).
compute E5_1n=E5_1.
end if.
do if any(E6_1,97,98,96).
compute E6_1n=0.
else if not any(E6_1,97,98,96).
compute E6_1n=E6_1.
end if.
do if any(E8_1,97,98,96).
compute E8_1n=0.
else if not any(E8_1,97,98,96).
compute E8_1n=E8_1.
end if.
do if any(E9_1,97,98,96).
compute E9_1n=0.
else if not any(E9_1,97,98,96).
compute E9_1n=E9_1.
end if.
do if any(E11_1,97,98,96).
compute E11_1n=0.
else if not any(E11_1,97,98,96).
compute E11_1n=E11_1.
end if.
do if any(E12_1,97,98,96).
compute E12_1n=0.
else if not any(E12_1,97,98,96).
compute E12_1n=E12_1.
end if.
do if any(E5_2,97,98,96).
compute E5_2n=0.
else if not any(E5_2,97,98,96).
compute E5_2n=E5_2.
end if.
do if any(E6_2,97,98,96).
compute E6_2n=0.
else if not any(E6_2,97,98,96).
compute E6_2n=E6_2.
end if.
do if any(E8_2,97,98,96).
compute E8_2n=0.
else if not any(E8_2,97,98,96).
compute E8_2n=E8_2.
end if.
do if any(E9_2,97,98,96).
compute E9n_2=0.
else if not any(E9_2,97,98,96).
compute E9_2n=E9_2.
end if.
do if any(E11_2,97,98,96).
compute E11_2n=0.
else if not any(E11_2,97,98,96).
compute E11_2n=E11_2.
end if.
do if any(E12_2,97,98,96).
compute E12_2n=0.
else if not any(E12_2,97,98,96).
compute E12_2n=E12_2.
end if.
compute E3_1sum=sum(E5_1n,E6_1n,E8_1n,E9_1n,E11_1n,E12_1n)+
(sum(E5_2n,E6_2n,E8_2n,E9_2n,E11_2n,E12_2n)/60).



do if E3_1sum>24&vE3_1="96".
compute m1328=CONCAT('vE3_1=',char.substr(vE3_1,1,150),',vE5=',string(vE5,f5),',vE6=',string(vE6,f5),
',vE8=',string(vE8,f5),',vE9=',string(vE9,f5),',vE11=',string(vE11,f5),',vE12=',string(vE12,f5)).
compute p1328='E5、E6、E8、E9、E11、E12總計超過2400，不應跳答vE3_1'.
compute s1328=2.
else if E3_1sum<=24&vE3_1~="96".
compute m1328=CONCAT('vE3_1=',char.substr(vE3_1,1,150),',vE5=',string(vE5,f5),',vE6=',string(vE6,f5),
',vE8=',string(vE8,f5),',vE9=',string(vE9,f5),',vE11=',string(vE11,f5),',vE12=',string(vE12,f5)).
compute p1328='E5、E6、E8、E9、E11、E12總計未超過2400，應跳答vE3_1'.
compute s1328=2.
end if.

do if  vE1=1&any(1,vE13m01_96 to vE13m88_96).
compute m1329=CONCAT('vE1=',string(vE1,F2),',',列出_E13).
compute p1329='vE1答1，不應跳答vE13'.
compute s1329=2.
else if vE1~=1&any(0,vE13m01_96 to vE13m88_96).
compute m1329=CONCAT('vE1=',string(vE1,F2),',',列出_E13).
compute p1329='vE1非答1，應跳答vE13'.
compute s1329=2.
end if.

do if  vE1=1&any(1,vE14_96).
compute m1330=CONCAT('vE1=',string(vE1,F2),',vE14=',string(vE14,f7)).
compute p1330='vE1答1，不應跳答vE14'.
compute s1330=2.
else if vE1~=1&any(0,vE14_96).
compute m1330=CONCAT('vE1=',string(vE1,F2),',vE14=',string(vE14,f7)).
compute p1330='vE1非答1，應跳答vE14'.
compute s1330=2.
end if.

do if  vE1=1&any(1,vG7m01_96 to vG7m90_96).
compute m1331=CONCAT('vE1=',string(vE1,F2),',',列出_G7).
compute p1331='vE1答1，不應跳答vG7'.
compute s1331=2.
else if vE1~=1&any(0,vG7m01_96 to vG7m90_96).
compute m1331=CONCAT('vE1=',string(vE1,F2),',',列出_G7).
compute p1331='vE1非答1，應跳答vG7'.
compute s1331=2.
end if.

do if  vE1=1&any(1,vG8m01_96 to vG8m90_96).
compute m1332=CONCAT('vE1=',string(vE1,F2),',',列出_G8).
compute p1332='vE1答1，不應跳答vG8'.
compute s1332=2.
else if vE1~=1&any(0,vG8m01_96 to vG8m90_96).
compute m1332=CONCAT('vE1=',string(vE1,F2),',',列出_G8).
compute p1332='vE1非答1，應跳答vG8'.
compute s1332=2.
end if.

do if  vE1=1&any(1,vG9m01_96 to vG9m90_96).
compute m1333=CONCAT('vE1=',string(vE1,F2),',',列出_G9).
compute p1333='vE1答1，不應跳答vG9'.
compute s1333=2.
else if vE1~=1&any(0,vG9m01_96 to vG9m90_96).
compute m1333=CONCAT('vE1=',string(vE1,F2),',',列出_G9).
compute p1333='vE1非答1，應跳答vG9'.
compute s1333=2.
end if.

do if  vE1=1&any(1,vG10m01_96 to vG10m90_96).
compute m1334=CONCAT('vE1=',string(vE1,F2),',',列出_G10).
compute p1334='vE1答1，不應跳答vG10'.
compute s1334=2.
else if vE1~=1&any(0,vG10m01_96 to vG10m90_96).
compute m1334=CONCAT('vE1=',string(vE1,F2),',',列出_G10).
compute p1334='vE1非答1，應跳答vG10'.
compute s1334=2.
end if.

do if  vE1=1&any(1,vG11m01_96 to vG11m90_96).
compute m1335=CONCAT('vE1=',string(vE1,F2),',',列出_G11).
compute p1335='vE1答1，不應跳答vG11'.
compute s1335=2.
else if vE1~=1&any(0,vG11m01_96 to vG11m90_96).
compute m1335=CONCAT('vE1=',string(vE1,F2),',',列出_G11).
compute p1335='vE1非答1，應跳答vG11'.
compute s1335=2.
end if.

do if  (any(1,vG7m01 to vG7m88)|any(1,vG8m01 to vG8m88)|any(1,vG9m01 to vG9m88)|any(1,vG10m01 to vG10m88)|any(1,vG11m01 to vG11m88))&vE1=1&
any(1,vG4_96).
compute m1336=CONCAT(列出_G7,',',列出_G8,',',列出_G9,',',列出_G10,',',列出_G11,',vG4=',string(vG4,n4)).
compute p1336='vG7-G11答1-88任一項，不應跳答vG4'.
compute s1336=2.
else if ((sum(vG7m01 to vG7m88)+sum(vG8m01 to vG8m88)+sum(vG9m01 to vG9m88)+sum(vG10m01 to vG10m88)+sum(vG11m01 to vG11m88))=0|vE1~=1)&
any(0,vG4_96).
compute m1336=CONCAT(列出_G7,',',列出_G8,',',列出_G9,',',列出_G10,',',列出_G11,',vG4=',string(vG4,n4)).
compute p1336='vG7-G11未答1-88任一項或跳答，應跳答vG4'.
compute s1336=2.
end if.

do if  (any(1,vG7m01 to vG7m88)|any(1,vG8m01 to vG8m88)|any(1,vG9m01 to vG9m88)|any(1,vG10m01 to vG10m88)|any(1,vG11m01 to vG11m88))&vE1=1&
any(1,vG5_96).
compute m1337=CONCAT(列出_G7,',',列出_G8,',',列出_G9,',',列出_G10,',',列出_G11,',vG5=',string(vG5,f5)).
compute p1337='vG7-G11答1-88任一項，不應跳答vG5'.
compute s1337=2.
else if ((sum(vG7m01 to vG7m88)+sum(vG8m01 to vG8m88)+sum(vG9m01 to vG9m88)+sum(vG10m01 to vG10m88)+sum(vG11m01 to vG11m88))=0|vE1~=1)&
any(0,vG5_96).
compute m1337=CONCAT(列出_G7,',',列出_G8,',',列出_G9,',',列出_G10,',',列出_G11,',vG5=',string(vG5,f5)).
compute p1337='vG7-G11未答1-88任一項或跳答，應跳答vG5'.
compute s1337=2.
end if.

do if  range(vB1,0.5,5,95,95,97,98)&any(1,vB2_96).
compute m1338=CONCAT('vB1=',string(vB1,n4),',vB2=',string(vB2,f5)).
compute p1338='vB1答0.5-5、95、97-98，不應跳答vB2'.
compute s1338=2.
else if not range(vB1,0.5,5,95,95,97,98)&any(0,vB2_96).
compute m1338=CONCAT('vB1=',string(vB1,n4),',vB2=',string(vB2,f5)).
compute p1338='vB1未答0.5-5、95、97-98，應跳答vB2'.
compute s1338=2.
end if.

do if  range(vB3,0.5,2,95,95,97,98)&any(1,vB4_96).
compute m1339=CONCAT('vB3=',string(vB3,n4),',vB4=',string(vB4,f5)).
compute p1339='vB3答0.5-2、95、97-98，不應跳答vB4'.
compute s1339=2.
else if not range(vB3,0.5,2,95,95,97,98)&any(0,vB4_96).
compute m1339=CONCAT('vB3=',string(vB3,n4),',vB4=',string(vB4,f5)).
compute p1339='vB3未答0.5-2、95、97-98，應跳答vB4'.
compute s1339=2.
end if.


do if  vB1+vB3>0&any(1,vB5_96).
compute m1340=CONCAT('vB1=',string(vB1,n4),',vB3=',string(vB3,n4),',vB5=',string(vB5,n4)).
compute p1340='vB1及vB3非皆答0，不應跳答vB5'.
compute s1340=2.
else if vB1+vB3=0&any(0,vB5_96).
compute m1340=CONCAT('vB1=',string(vB1,n4),',vB3=',string(vB3,n4),',vB5=',string(vB5,n4)).
compute p1340='vB1及vB3皆答0，應跳答vB5'.
compute s1340=2.
end if.
do if  range(vB5,0.5,7,95,95,97,98)&any(1,vB6_96).
compute m1341=CONCAT('vB5=',string(vB5,n4),',vB6=',string(vB6,f5)).
compute p1341='vB5答0.5-7、95、97-98，不應跳答vB6'.
compute s1341=2.
else if not range(vB5,0.5,7,95,95,97,98)&any(0,vB6_96).
compute m1341=CONCAT('vB5=',string(vB5,n4),',vB6=',string(vB6,f5)).
compute p1341='vB5未答0.5-7、95、97-98，應跳答vB6'.
compute s1341=2.
end if.

do if  range(vB5,0.5,7,95,95,97,98)&any(1,vB7am01_96 to vB7am88_96).
compute m1342=CONCAT('vB5=',string(vB5,n4),',',列出_B7a,',vB7=',string(vB7,F2)).
compute p1342='vB5答0.5-7、95、97-98，不應跳答vB7a、vB7'.
compute s1342=2.
else if not range(vB5,0.5,7,95,95,97,98)&any(0,vB7am01_96 to vB7am88_96).
compute m1342=CONCAT('vB5=',string(vB5,n4),',',列出_B7a,',vB7=',string(vB7,F2)).
compute p1342='vB5未答0.5-7、95、97-98，應跳答vB7a、vB7'.
compute s1342=2.
end if.

do if  range(vB5,0.5,7,95,95,97,98)&not any(vB7am01,96,97,98)&sum(vB7am01 to vB7am88)>1&any(1,vB7_96).
compute m1343=CONCAT(列出_B7a,',vB7=',string(vB7,F2)).
compute p1343='vB7a1-88答超過1項，不應跳答vB7'.
compute s1343=2.
else if (any(vB7am01,96,97,98)|sum(vB7am01 to vB7am88)=1)&any(0,vB7_96).
compute m1343=CONCAT(列出_B7a,',vB7=',string(vB7,F2)).
compute p1343='vB7a1-88未答超過1項，應跳答vB7'.
compute s1343=2.
end if.

do if  vB1+vB3>0&any(1,vB8m01_96 to vB8m88_96).
compute m1344=CONCAT('vB1=',string(vB1,n4),',vB3=',string(vB3,n4),',',列出_B8).
compute p1344='vB1及vB3非皆答0，不應跳答vB8'.
compute s1344=2.
else if vB1+vB3=0&any(0,vB8m01_96 to vB8m88_96).
compute m1344=CONCAT('vB1=',string(vB1,n4),',vB3=',string(vB3,n4),',',列出_B8).
compute p1344='vB1及vB3皆答0，應跳答vB8'.
compute s1344=2.
end if.

do if  range(vI1,0.5,5,95,95,97,98)&any(1,vI2_96).
compute m1345=CONCAT('vI1=',string(vI1,n4),',vI2=',string(vI2,f5)).
compute p1345='vI1答0.5-5、95、97-98，不應跳答vI2'.
compute s1345=2.
else if not range(vI1,0.5,5,95,95,97,98)&any(0,vI2_96).
compute m1345=CONCAT('vI1=',string(vI1,n4),',vI2=',string(vI2,f5)).
compute p1345='vI1未答0.5-5、95、97-98，應跳答vI2'.
compute s1345=2.
end if.

do if  range(vI3,0.5,2,95,95,97,98)&any(1,vI4_96).
compute m1346=CONCAT('vI3=',string(vI3,n4),',vI4=',string(vI4,f5)).
compute p1346='vI3答0.5-2、95、97-98，不應跳答vI4'.
compute s1346=2.
else if not range(vI3,0.5,2,95,95,97,98)&any(0,vI4_96).
compute m1346=CONCAT('vI3=',string(vI3,n4),',vI4=',string(vI4,f5)).
compute p1346='vI3未答0.5-2、95、97-98，應跳答vI4'.
compute s1346=2.
end if.


do if  vA9~=1&any(1,vG1_96).
compute m1347=CONCAT('vA9=',string(vA9,F2),'vG1=',string(vG1,n4)).
compute p1347='vA9非答1，不應跳答vG1'.
compute s1347=2.
else if vA9=1&any(0,vG1_96).
compute m1347=CONCAT('vA9=',string(vA9,F2),'vG1=',string(vG1,n4)).
compute p1347='vA9答1，應跳答vG1'.
compute s1347=2.
end if.

do if  range(vG1,0.5,7,95,95,97,98)&any(1,vG2_96).
compute m1348=CONCAT('vG1=',string(vG1,n4),',vG2=',string(vG2,f5)).
compute p1348='vG1答0.5-7、95、97-98，不應跳答vG2'.
compute s1348=2.
else if not range(vG1,0.5,7,95,95,97,98)&any(0,vG2_96).
compute m1348=CONCAT('vG1=',string(vG1,n4),',vG2=',string(vG2,f5)).
compute p1348='vG1未答0.5-7、95、97-98，應跳答vG2'.
compute s1348=2.
end if.

do if  range(vG1,0.5,7,95,95,97,98)&any(1,vG3m01_96 to vG3m88_96).
compute m1349=CONCAT('vG1=',string(vG1,n4),',',列出_G3).
compute p1349='vG1答0.5-7、95、97-98，不應跳答vG3'.
compute s1349=2.
else if not range(vG1,0.5,7,95,95,97,98)&any(0,vG3m01_96 to vG3m88_96).
compute m1349=CONCAT('vG1=',string(vG1,n4),',',列出_G3).
compute p1349='vG1未答0.5-7、95、97-98，應跳答vG3'.
compute s1349=2.
end if.


do if  vA9~=1&any(1,vF0_96).
compute m1350=CONCAT('vA9=',string(vA9,F2),'vF0=',string(vF0,F2)).
compute p1350='vA9非答1，不應跳答vF0'.
compute s1350=2.
else if vA9=1&any(0,vF0_96).
compute m1350=CONCAT('vA9=',string(vA9,F2),'vF0=',string(vF0,F2)).
compute p1350='vA9答1，應跳答vF0'.
compute s1350=2.
end if.

do if  any(vF0,1,89)&any(1,vF1_96).
compute m1351=CONCAT('vF0=',string(vF0,F2),'vF1=',string(vF1,n5)).
compute p1351='vF0答1、89，不應跳答vF1'.
compute s1351=2.
else if not any(vF0,1,89)&any(0,vF1_96).
compute m1351=CONCAT('vF0=',string(vF0,F2),'vF1=',string(vF1,n5)).
compute p1351='vF0非答1、89，應跳答vF1'.
compute s1351=2.
end if.


do if  range(vF1,0.5,31,95,95,97,98)&any(1,vF2_96).
compute m1352=CONCAT('vF1=',string(vF1,n5),',vF2=',string(vF2,f5)).
compute p1352='vF1答0.5-31、95、97-98，不應跳答vF2'.
compute s1352=2.
else if not range(vF1,0.5,31,95,95,97,98)&any(0,vF2_96).
compute m1352=CONCAT('vF1=',string(vF1,n5),',vF2=',string(vF2,f5)).
compute p1352='vF1未答0.5-31、95、97-98，應跳答vF2'.
compute s1352=2.
end if.


do if  any(vF0,2,89)&any(1,vF3_96).
compute m1353=CONCAT('vF0=',string(vF0,F2),'vF3=',string(vF3,n5)).
compute p1353='vF0答2、89，不應跳答vF3'.
compute s1353=2.
else if not any(vF0,2,89)&any(0,vF3_96).
compute m1353=CONCAT('vF0=',string(vF0,F2),'vF3=',string(vF3,n5)).
compute p1353='vF0非答2、89，應跳答vF3'.
compute s1353=2.
end if.


do if  range(vF3,0.5,31,95,95,97,98)&any(1,vF4_96).
compute m1354=CONCAT('vF3=',string(vF3,n5),',vF4=',string(vF4,f5)).
compute p1354='vF3答0.5-31、95、97-98，不應跳答vF4'.
compute s1354=2.
else if not range(vF3,0.5,31,95,95,97,98)&any(0,vF4_96).
compute m1354=CONCAT('vF3=',string(vF3,n5),',vF4=',string(vF4,f5)).
compute p1354='vF3未答0.5-31、95、97-98，應跳答vF4'.
compute s1354=2.
end if.

do if  any(vF0,1,2,89)&any(1,vF5m01_96 to vF5m88_96).
compute m1355=CONCAT('vF0=',string(vF0,F2),',',列出_F5).
compute p1355='vF0答1、2、89，不應跳答vF5'.
compute s1355=2.
else if  not any(vF0,1,2,89)&any(0,vF5m01_96 to vF5m88_96).
compute m1355=CONCAT('vF0=',string(vF0,F2),',',列出_F5).
compute p1355='vF0未答1、2、89，應跳答vF5'.
compute s1355=2.
end if.

do if  range(vC1,0.5,7,95,95,97,98)&any(1,vC2_96).
compute m1356=CONCAT('vC1=',string(vC1,n4),',vC2=',string(vC2,f5)).
compute p1356='vC1答0.5-7、95、97-98，不應跳答vC2'.
compute s1356=2.
else if not range(vC1,0.5,7,95,95,97,98)&any(0,vC2_96).
compute m1356=CONCAT('vC1=',string(vC1,n4),',vC2=',string(vC2,f5)).
compute p1356='vC1未答0.5-7、95、97-98，應跳答vC2'.
compute s1356=2.
end if.

do if  range(vC1,0.5,7,95,95,97,98)&any(1,vC3m01_96 to vC3m88_96).
compute m1357=CONCAT('vC1=',string(vC1,n4),',',列出_C3).
compute p1357='vC1答0.5-7、95、97-98，不應跳答vC3'.
compute s1357=2.
else if not range(vC1,0.5,7,95,95,97,98)&any(0,vC3m01_96 to vC3m88_96).
compute m1357=CONCAT('vC1=',string(vC1,n4),',',列出_C3).
compute p1357='vC1未答0.5-7、95、97-98，應跳答vC3'.
compute s1357=2.
end if.

do if  vA9~=1&any(1,vJ4_2_96,vJ4_4_96).
compute m1358=CONCAT('vA9=',string(vA9,F2),',vJ4_2=',string(vJ4_2,F4),',vJ4_4=',string(vJ4_4,F4)).
compute p1358='vA9非答1，不應跳答vJ4_2、J4_4'.
compute s1358=2.
else if vA9=1&any(0,vJ4_2_96,vJ4_4_96).
compute m1358=CONCAT('vA9=',string(vA9,F2),',vJ4_2=',string(vJ4_2,F4),',vJ4_4=',string(vJ4_4,F4)).
compute p1358='vA9答1，應跳答vJ4_2、J4_4'.
compute s1358=2.
end if.

do if  vE1=1&any(1,vJ4_5_96).
compute m1359=CONCAT('vE1=',string(vE1,F2),',vJ4_5=',string(vJ4_5,F4)).
compute p1359='vE1答1，不應跳答vJ4_5'.
compute s1359=2.
else if vE1~=1&any(0,vJ4_5_96).
compute m1359=CONCAT('vE1=',string(vE1,F2),',vJ4_5=',string(vJ4_5,F4)).
compute p1359='vE1非答1，應跳答vJ4_5'.
compute s1359=2.
end if.

do if  range(vB5,0.5,7,95,95,97,98)&any(1,vJB1m01_96 to vJB1m90_96).
compute m1360=CONCAT('vB5=',string(vB5,n4),',',列出_JB1).
compute p1360='vB5答0.5-7、95、97-98，不應跳答vJB1'.
compute s1360=2.
else if not range(vB5,0.5,7,95,95,97,98)&any(0,vJB1m01_96 to vJB1m90_96).
compute m1360=CONCAT('vB5=',string(vB5,n4),',',列出_JB1).
compute p1360='vB5非答0.5-7、95、97-98，應跳答vJB1'.
compute s1360=2.
end if.

do if  vE1=1&any(1,vJB2m01_96 to vJB2m90_96).
compute m1361=CONCAT('vE1=',string(vE1,F2),',',列出_JB2).
compute p1361='vE1答1，不應跳答vJB2'.
compute s1361=2.
else if vE1~=1&any(0,vJB2m01_96,vJB2m02_96,vJB2m03_96,vJB2m04_96,vJB2m05_96,
vJB2m06_96,vJB2m07_96,vJB2m88_96,vJB2m90_96).
compute m1361=CONCAT('vE1=',string(vE1,F2),',',列出_JB2).
compute p1361='vE1非答1，應跳答vJB2'.
compute s1361=2.
end if.

do if  (range(vH1,1,991)|(range(vH1,997,998)&range(vH2,2,5,97,98)))&any(1,vH3_96).
compute m1362=CONCAT('vH1=',string(vH1,F4),',vH2=',string(vH2,F2),',vH3=',string(vH3,F2)).
compute p1362='H1答1-991或H2答2-5、97、98，不應跳答H3'.
compute s1362=2.
else if ((vH1=0)|(range(vH1,997,998)&vH2=1))&any(0,vH3_96).
compute m1362=CONCAT('vH1=',string(vH1,F4),',vH2=',string(vH2,F2),',vH3=',string(vH3,F2)).
compute p1362='H1答0或H2答1，應跳答H3'.
compute s1362=2.
end if.

do if  vE1=1&any(1,vH4_96).
compute m1363=CONCAT('vE1=',string(vE1,F2),',vH4=',string(vH4,F4)).
compute p1363='vE1答1，不應跳答H4'.
compute s1363=2.
else if vE1~=1&any(0,vH4_96).
compute m1363=CONCAT('vE1=',string(vE1,F2),',vH4=',string(vH4,F4)).
compute p1363='vE1非答1，應跳答H4'.
compute s1363=2.
end if.

do if  (range(vH4,1,991)|(range(vH4,997,998)&range(vH5,2,5,97,98)))&any(1,vH6_96).
compute m1364=CONCAT('vH4=',string(vH4,F4),',vH5=',string(vH5,F2),',vH6=',string(vH6,F2)).
compute p1364='H4答1-991或H5答2-5、97、98，不應跳答H6'.
compute s1364=2.
else if ((any(vH4,0,96))|(range(vH4,997,998)&vH5=1))&any(0,vH6_96).
compute m1364=CONCAT('vH4=',string(vH4,F4),',vH5=',string(vH5,F2),',vH6=',string(vH6,F2)).
compute p1364='H4答0、跳答或H5答1，應跳答H6'.
compute s1364=2.
end if.

do if  (range(vH1,1,991)&range(vH4,1,991))&any(1,vH7_96).
compute m1365=CONCAT('vH1=',string(vH1,F4),',vH4=',string(vH4,F4),',vH7=',string(vH7,F4)).
compute p1365='H1答1-991且H4答1-991，不應跳答H7'.
compute s1365=2.
else if (not range(vH1,1,991)|not range(vH4,1,991))&any(0,vH7_96).
compute m1365=CONCAT('vH1=',string(vH1,F4),',vH4=',string(vH4,F4),',vH7=',string(vH7,F4)).
compute p1365='H1非答1-991或H4非答1-991，應跳答H7'.
compute s1365=2.
end if.
do if  (range(vH1,1,991)&range(vH5,2,5))&any(1,vH7_1_96).
compute m1366=CONCAT('vH1=',string(vH1,F4),',vH2=',string(vH2,F2),',vH4=',string(vH4,F4),',vH5=',string(vH5,F2),',vH7_1=',string(vH7_1,F4)).
compute p1366='H1答1-991且H5答2-5，不應跳答H7_1'.
compute s1366=2.
else if (not range(vH1,1,991)|not range(vH5,2,5))&any(0,vH7_1_96).
compute m1366=CONCAT('vH1=',string(vH1,F4),',vH2=',string(vH2,F2),',vH4=',string(vH4,F4),',vH5=',string(vH5,F2),',vH7_1=',string(vH7_1,F4)).
compute p1366='H1非答1-991或H5非答2-5，不應跳答H7_1'.
compute s1366=2.
end if.

do if  (range(vH4,1,991)&range(vH2,2,5))&any(1,vH7_2_96).
compute m1367=CONCAT('vH1=',string(vH1,F4),',vH2=',string(vH2,F2),',vH4=',string(vH4,F4),',vH5=',string(vH5,F2),',vH7_2=',string(vH7_2,F4)).
compute p1367='H4答1-991且H2答2-5，不應跳答H7_2'.
compute s1367=2.
else if (not range(vH4,1,991)|not range(vH2,2,5))&any(0,vH7_2_96).
compute m1367=CONCAT('vH1=',string(vH1,F4),',vH2=',string(vH2,F2),',vH4=',string(vH4,F4),',vH5=',string(vH5,F2),',vH7_2=',string(vH7_2,F4)).
compute p1367='H4非答1-991或H2非答2-5，不應跳答H7_2'.
compute s1367=2.
end if.

do if  (range(vH5,2,5)&range(vH2,2,5))&any(1,vH7_3_96).
compute m1368=CONCAT('vH1=',string(vH1,F4),',vH2=',string(vH2,F2),',vH4=',string(vH4,F4),',vH5=',string(vH5,F2),',vH7_3=',string(vH7_3,F4)).
compute p1368='H5答2-5且H2答2-5，不應跳答H7_3'.
compute s1368=2.
else if (not range(vH5,2,5)|not range(vH2,2,5))&any(0,vH7_3_96).
compute m1368=CONCAT('vH1=',string(vH1,F4),',vH2=',string(vH2,F2),',vH4=',string(vH4,F4),',vH5=',string(vH5,F2),',vH7_3=',string(vH7_3,F4)).
compute p1368='H5非答2-5或H2非答2-5，不應跳答H7_3'.
compute s1368=2.
end if.

do if  range(vH7,0,991)&(vH7>vH4|vH7>vH1)&any(1,vCKH7_96).
compute m1369=CONCAT('vH1=',string(vH1,F4),',vH4=',string(vH4,F4),',vH7=',string(vH7,F4),',vCKH7=',string(vCKH7,F14)).
compute p1369='H7大於H1或H4，不應跳答CKH7'.
compute s1369=2.
 * else if  (not range(vH7,0,991)|(range(vH7,0,991)&(vH7<vH4&vH7<vH1)))&any(0,vCKH7_96).
 * compute m1369=CONCAT('vH1=',string(vH1,F4),',vH4=',string(vH4,F4),',vH7=',string(vH7,F4),',vCKH7=',string(vCKH7,F14)).
 * compute p1369='H7不大於H1及H4，應跳答CKH7'.
 * compute s1369=2.
end if.

do if  (range(vH7_1,0,991)&(vH7_1>vH1|(vH7_1>=3&vH5=2)|(vH7_1>=6&vH5=3)|(vH7_1>=11&vH5=4)))&any(1,vCKH7_1_96).
compute m1370=CONCAT('vH1=',string(vH1,F4),',vH2=',string(vH2,F2),',vH4=',string(vH4,F4),',vH5=',string(vH5,F2),',vH7_1=',string(vH7_1,F4),',vCKH7_1=',string(vCKH7_1,F14)).
compute p1370='H7_1大於H1或H5，不應跳答CKH7_1'.
compute s1370=2.
else if (not range(vH7_1,0,991)|(range(vH7_1,0,991)&(vH7_1<vH1&((vH7_1<3&vH5=2)|(vH7_1<6&vH5=3)|(vH7_1<11&vH5=4)))))&any(0,vCKH7_1_96).
compute m1370=CONCAT('vH1=',string(vH1,F4),',vH2=',string(vH2,F2),',vH4=',string(vH4,F4),',vH5=',string(vH5,F2),',vH7_1=',string(vH7_1,F4),',vCKH7_1=',string(vCKH7_1,F14)).
compute p1370='H7_1不大於H1及H5，應跳答CKH7_1'.
compute s1370=2.
end if.

do if  (range(vH7_2,0,991)&(vH7_2>vH4|(vH7_2>=3&vH2=2)|(vH7_2>=6&vH2=3)|(vH7_2>=11&vH2=4)))&any(1,vCKH7_2_96).
compute m1371=CONCAT('vH1=',string(vH1,F4),',vH2=',string(vH2,F2),',vH4=',string(vH4,F4),',vH5=',string(vH5,F2),',vH7_2=',string(vH7_2,F4),',vCKH7_2=',string(vCKH7_2,F14)).
compute p1371='H7_2大於H2或H4，不應跳答CKH7_2'.
compute s1371=2.
else if (not range(vH7_2,0,991)|(range(vH7_2,0,991)&(vH7_2<vH4&((vH7_2<3&vH2=2)|(vH7_2<6&vH2=3)|(vH7_2<11&vH2=4)))))&any(0,vCKH7_2_96).
compute m1371=CONCAT('vH1=',string(vH1,F4),',vH2=',string(vH2,F2),',vH4=',string(vH4,F4),',vH5=',string(vH5,F2),',vH7_2=',string(vH7_2,F4),',vCKH7_2=',string(vCKH7_2,F14)).
compute p1371='H7_2不大於H2及H4，應跳答CKH7_2'.
compute s1371=2.
end if.


do if  (range(vH7_3,0,991)&((vH7_3>=3&vH2=2)|(vH7_3>=6&vH2=3)|(vH7_3>=11&vH2=4)|(vH7_3>=3&vH5=2)|(vH7_3>=6&vH5=3)|(vH7_3>=11&vH5=4)))&any(1,vCKH7_3_96).
compute m1372=CONCAT('vH1=',string(vH1,F4),',vH2=',string(vH2,F2),',vH4=',string(vH4,F4),',vH5=',string(vH5,F2),',vH7_3=',string(vH7_3,F4),',vCKH7_3=',string(vCKH7_3,F14)).
compute p1372='H7_3大於H2或H5，不應跳答CKH7_3'.
compute s1372=2.
else if (not range(vH7_3,0,991)|(range(vH7_3,0,991)&((vH7_3<3&vH5=2)|(vH7_3<6&vH5=3)|(vH7_3<11&vH5=4)&((vH7_3<3&vH2=2)|(vH7_3<6&vH2=3)|(vH7_3<11&vH2=4)))))&any(0,vCKH7_3_96).
compute m1372=CONCAT('vH1=',string(vH1,F4),',vH2=',string(vH2,F2),',vH4=',string(vH4,F4),',vH5=',string(vH5,F2),',vH7_3=',string(vH7_3,F4),',vCKH7_3=',string(vCKH7_3,F14)).
compute p1372='H7_3不大於H2及H5，應跳答CKH7_3'.
compute s1372=2.
end if.


do if  (vM1g1+vM1g2)>0&any(1,vM2m01_96 to vM2m88_96).
compute m1473=CONCAT('vM1g1=',string(vM1g1,F4),',vM1g2=',string(vM1g2,F3),',',列出_M2).
compute p1373='M1合計不為0，不應跳答vM2'.
compute s1373=2.
else if (vM1g1+vM1g2)=0&any(0,vM2m01_96 to vM2m88_96).
compute m1373=CONCAT('vM1g1=',string(vM1g1,F4),',vM1g2=',string(vM1g2,F3),',',列出_M2).
compute p1373='M1合計為0，應跳答vM2'.
compute s1373=2.
end if.

do if  (vM1g1+vM1g2)>0&any(1,vM3m01_96 to vM3m88_96).
compute m1374=CONCAT('vM1g1=',string(vM1g1,F4),',vM1g2=',string(vM1g2,F3),',',列出_M3).
compute p1374='M1合計不為0，不應跳答vM3'.
compute s1374=2.
else if (vM1g1+vM1g2)=0&any(0,vM3m01_96 to vM3m88_96).
compute m374=CONCAT('vM1g1=',string(vM1g1,F4),',vM1g2=',string(vM1g2,F3),',',列出_M3).
compute p1374='M1合計為0，應跳答vM3'.
compute s1374=2.
end if.

do if  (vM1g1+vM1g2)>0&any(1,vM4sM4_96,vM4sM5_96,vM4sM6_96).
compute m1375=CONCAT('vM1g1=',string(vM1g1,F4),',vM1g2=',string(vM1g2,F3),',vM4sM4=',string(vM4sM4,F2),
',vM4sM5=',string(vM4sM5,F2),',vM4sM6=',string(vM4sM6,F2)).
compute p1375='M1合計不為0，不應跳答vM4-6'.
compute s1375=2.
else if (vM1g1+vM1g2)=0&any(0,vM4sM4_96,vM4sM5_96,vM4sM6_96).
compute m1375=CONCAT('vM1g1=',string(vM1g1,F4),',vM1g2=',string(vM1g2,F3),',vM4sM4=',string(vM4sM4,F2),
',vM4sM5=',string(vM4sM5,F2),',vM4sM6=',string(vM4sM6,F2)).
compute p1375='M1合計為0，應跳答vM4-6'.
compute s1375=2.
end if.

do if  range(vO1,1,5,88,88)&any(1,vN24_96).
compute m1376=CONCAT('vO1=',string(vO1,F2),',vN24=',string(vN24,F4)).
compute p1376='vO1答1-5、88，不應跳答vN24'.
compute s1376=2.
else if not range(vO1,1,5,88,88)&any(0,vN24_96).
compute m1376=CONCAT('vO1=',string(vO1,F2),',vN24=',string(vN24,F4)).
compute p1376='vO1未答1-5、88，應跳答vN24'.
compute s1376=2.
end if.




do if  (vA9~=1&vG1~=0)&any(1,vQ1_96).
compute m1377=CONCAT('vA9=',string(vA9,F2),',vG1=',string(vG1,n4),',vQ1=',string(vQ1,F2)).
compute p1377='vA9非答1且vG1非答0，不應跳答vQ1'.
compute s1377=2.
else if (vA9=1|vG1=0)&any(0,vQ1_96).
compute m1377=CONCAT('vA9=',string(vA9,F2),',vG1=',string(vG1,n4),',vQ1=',string(vQ1,F2)).
compute p1377='vA9答1或vG1答0，應跳答vQ1'.
compute s1377=2.
end if.

do if  (vA9~=1&vF0~=90)&any(1,vQ2_96).
compute m1378=CONCAT('vA9=',string(vA9,F2),',vF0=',string(vF0,f2),',vQ2=',string(vQ2,F2)).
compute p1378='vA9非答1且vF0非答90，不應跳答vQ2'.
compute s1378=2.
else if (vA9=1|vF0=90)&any(0,vQ2_96).
compute m1378=CONCAT('vA9=',string(vA9,F2),',vF0=',string(vF0,f2),',vQ2=',string(vQ2,F2)).
compute p1378='vA9答1或vF0答90，應跳答vQ2'.
compute s1378=2.
end if.

do if  vC1~=0&any(1,vQ3_96).
compute m1379=CONCAT('vC1=',string(vC1,n4),',vQ3=',string(vQ3,F2)).
compute p1379='vC1非答0，不應跳答vQ3'.
compute s1379=2.
else if vC1=0&any(0,vQ3_96).
compute m1379=CONCAT('vC1=',string(vC1,n4),',vQ3=',string(vQ3,F2)).
compute p1379='vC1答0，應跳答vQ3'.
compute s1379=2.
end if.

do if  (vB1~=0|vB3~=0)&any(1,vQ4_96).
compute m1380=CONCAT('vB1=',string(vB1,n4),',vB3=',string(vB3,n4),',vQ4=',string(vQ4,F2)).
compute p1380='vB1或vB3非答0，不應跳答vQ4'.
compute s1380=2.
else if (vB1=0&vB3=0)&any(0,vQ4_96).
compute m1380=CONCAT('vB1=',string(vB1,n4),',vB3=',string(vB3,n4),',vQ4=',string(vQ4,F2)).
compute p1380='vB1及vB3答0，應跳答vQ4'.
compute s1380=2.
end if.

do if  vE1=1&any(1,vQ5_96).
compute m1381=CONCAT('vE1=',string(vE1,F2),',vQ5=',string(vQ5,F2)).
compute p1381='vE1答1，不應跳答vQ5'.
compute s1381=2.
else if vE1~=1&any(0,vQ5_96).
compute m1381=CONCAT('vE1=',string(vE1,F2),',vQ5=',string(vQ5,F2)).
compute p1381='vE1非答1，應跳答vQ5'.
compute s1381=2.
end if.

do if  (vQ5=1&vK2m90~=1)&any(1,vQ6_96).
compute m1382=CONCAT('vQ5=',string(vQ5,F2),',vK2m90=',string(vK2m90,F2),',vQ6=',string(vQ6,F2)).
compute p1382='vQ5答1且vK2未答90，不應跳答vQ6'.
compute s1382=2.
else if  (vQ5~=1|vK2m90=1)&any(0,vQ6_96).
compute m1382=CONCAT('vQ5=',string(vQ5,F2),',vK2m90=',string(vK2m90,F2),',vQ6=',string(vQ6,F2)).
compute p1382='vQ5非答1或vK2答90，應跳答vQ6'.
compute s1382=2.
end if.

do if  (vQ5=1&vK3m90~=1)&any(1,vQ7_96).
compute m1383=CONCAT('vQ5=',string(vQ5,F2),',vK3m90=',string(vK3m90,F2),',vQ7=',string(vQ7,F2)).
compute p1383='vQ5答1且vK3未答90，不應跳答vQ7'.
compute s1383=2.
else if  (vQ5~=1|vK3m90=1)&any(0,vQ7_96).
compute m1383=CONCAT('vQ5=',string(vQ5,F2),',vK3m90=',string(vK3m90,F2),',vQ7=',string(vQ7,F2)).
compute p1383='vQ5非答1或vK3答90，應跳答vQ7'.
compute s1383=2.
end if.
do if  (vQ5=1&vK1m90~=1)&any(1,vQ8_96).
compute m1384=CONCAT('vQ5=',string(vQ5,F2),',vK1m90=',string(vK1m90,F2),',vQ8=',string(vQ8,F2)).
compute p1384='vQ5答1且vK1未答90，不應跳答vQ8'.
compute s1384=2.
else if  (vQ5~=1|vK1m90=1)&any(0,vQ8_96).
compute m1384=CONCAT('vQ5=',string(vQ5,F2),',vK1m90=',string(vK1m90,F2),',vQ8=',string(vQ8,F2)).
compute p1384='vQ5非答1或vK1答90，應跳答vQ8'.
compute s1384=2.
end if.
do if  (vQ5=1&(vG7m90~=1|vG8m90~=1|vG9m90~=1|vG10m90~=1|vG11m90~=1))&any(1,vQ9_96).
compute m1385=CONCAT('vQ5=',string(vQ5,F2),',vG7m90=',string(vG7m90,F2),',vG8m90=',string(vG8m90,F2),',vG9m90=',string(vG9m90,F2)
,',vG10m90=',string(vG10m90,F2),',vG11m90=',string(vG11m90,F2),',vQ9=',string(vQ9,F2)).
compute p1385='vQ5答1且vG7-G11未都答90，不應跳答vQ9'.
compute s1385=2.
else if  (vQ5~=1|(vG7m90=1&vG8m90=1&vG9m90=1&vG10m90=1&vG11m90=1))&any(0,vQ9_96).
compute m1385=CONCAT('vQ5=',string(vQ5,F2),',vG7m90=',string(vG7m90,F2),',vG8m90=',string(vG8m90,F2),',vG9m90=',string(vG9m90,F2)
,',vG10m90=',string(vG10m90,F2),',vG11m90=',string(vG11m90,F2),',vQ9=',string(vQ9,F2)).
compute p1385='vQ5非答1或vG7-G11都答90，應跳答vQ9'.
compute s1385=2.
end if.
do if  vE1=1&any(1,vQ10_96).
compute m1386=CONCAT('vE1=',string(vE1,F2),',vQ10=',string(vQ10,F2)).
compute p1386='vE1答1，不應跳答vQ10'.
compute s1386=2.
else if vE1~=1&any(0,vQ10_96).
compute m1386=CONCAT('vE1=',string(vE1,F2),',vQ10=',string(vQ10,F2)).
compute p1386='vE1非答1，應跳答vQ10'.
compute s1386=2.
end if.

do if  (vQ10=1&vK2m90~=1&vQ6~=1)&any(1,vQ11_96).
compute m1387=CONCAT('vQ10=',string(vQ10,F2),',vK2m90=',string(vK2m90,F2),',vQ6=',string(vQ6,F2),',vQ11=',string(vQ11,F2)).
compute p1387='vQ10答1且vK2未答90且vQ6未答1，不應跳答vQ11'.
compute s1387=2.
else if  (vQ10~=1|vK2m90=1|vQ6=1)&any(0,vQ11_96).
compute m1387=CONCAT('vQ10=',string(vQ10,F2),',vK2m90=',string(vK2m90,F2),',vQ6=',string(vQ6,F2),',vQ11=',string(vQ11,F2)).
compute p1387='vQ10非答1或vK2答90或vQ6答1，應跳答vQ11'.
compute s1387=2.
end if.

do if  (vQ10=1&vK3m90~=1&vQ7~=1)&any(1,vQ12_96).
compute m1388=CONCAT('vQ10=',string(vQ10,F2),',vK3m90=',string(vK3m90,F2),',vQ7=',string(vQ7,F2),',vQ12=',string(vQ12,F2)).
compute p1388='vQ10答1且vK3未答90且vQ7未答1，不應跳答vQ12'.
compute s1388=2.
else if  (vQ10~=1|vK3m90=1|vQ7=1)&any(0,vQ12_96).
compute m1388=CONCAT('vQ10=',string(vQ10,F2),',vK3m90=',string(vK3m90,F2),',vQ7=',string(vQ7,F2),',vQ12=',string(vQ12,F2)).
compute p1388='vQ10非答1或vK3答90或vQ7答1，應跳答vQ12'.
compute s1388=2.
end if.
do if  (vQ10=1&vK1m90~=1&vQ8~=1)&any(1,vQ13_96).
compute m1389=CONCAT('vQ10=',string(vQ10,F2),',vK1m90=',string(vK1m90,F2),',vQ8=',string(vQ8,F2),',vQ13=',string(vQ13,F2)).
compute p1389='vQ10答1且vK1未答90且vQ未答1，不應跳答vQ13'.
compute s1389=2.
else if  (vQ10~=1|vK1m90=1&vQ8=1)&any(0,vQ13_96).
compute m1389=CONCAT('vQ10=',string(vQ10,F2),',vK1m90=',string(vK1m90,F2),',vQ8=',string(vQ8,F2),',vQ13=',string(vQ13,F2)).
compute p1389='vQ10非答1或vK1答90或vQ8答1，應跳答vQ13'.
compute s1389=2.
end if.
do if  (vQ10=1&(vG7m90~=1|vG8m90~=1|vG9m90~=1|vG10m90~=1|vG11m90~=1)&vQ9~=1)&any(1,vQ14_96).
compute m1390=CONCAT('vQ10=',string(vQ10,F2),',vG7m90=',string(vG7m90,F2),',vG8m90=',string(vG8m90,F2),',vG9m90=',string(vG9m90,F2)
,',vG10m90=',string(vG10m90,F2),',vG11m90=',string(vG11m90,F2),',vQ9=',string(vQ9,F2),',vQ14=',string(vQ14,F2)).
compute p1390='vQ10答1且vG7-G11未都答90且vQ9未答1，不應跳答vQ14'.
compute s1390=2.
else if  (vQ10~=1|(vG7m90=1&vG8m90=1&vG9m90=1&vG10m90=1&vG11m90=1)|vQ9=1)&any(0,vQ14_96).
compute m1390=CONCAT('vQ10=',string(vQ10,F2),',vG7m90=',string(vG7m90,F2),',vG8m90=',string(vG8m90,F2),',vG9m90=',string(vG9m90,F2)
,',vG10m90=',string(vG10m90,F2),',vG11m90=',string(vG11m90,F2),',vQ9=',string(vQ9,F2),',vQ14=',string(vQ14,F2)).
compute p1390='vQ10非答1或vG7-G11都答90或vQ9答1，應跳答vQ14'.
compute s1390=2.
end if.


do if  vE1=1&any(1,vQ15_96).
compute m1391=CONCAT('vE1=',string(vE1,F2),',vQ15=',string(vQ15,F2)).
compute p1391='vE1答1，不應跳答vQ15'.
compute s1391=2.
else if vE1~=1&any(0,vQ15_96).
compute m1391=CONCAT('vE1=',string(vE1,F2),',vQ15=',string(vQ15,F2)).
compute p1391='vE1非答1，應跳答vQ15'.
compute s1391=2.
end if.

do if  (vQ15=1&vK2m90~=1)&any(1,vQ16_96).
compute m1392=CONCAT('vQ15=',string(vQ15,F2),',vK2m90=',string(vK2m90,F2),',vQ16=',string(vQ16,F2)).
compute p1392='vQ15答1且vK2未答90，不應跳答vQ16'.
compute s1392=2.
else if  (vQ15~=1|vK2m90=1)&any(0,vQ16_96).
compute m1392=CONCAT('vQ15=',string(vQ15,F2),',vK2m90=',string(vK2m90,F2),',vQ16=',string(vQ16,F2)).
compute p1392='vQ15非答1或vK2答90，應跳答vQ16'.
compute s1392=2.
end if.

do if  (vQ15=1&vK3m90~=1)&any(1,vQ17_96).
compute m1393=CONCAT('vQ15=',string(vQ15,F2),',vK3m90=',string(vK3m90,F2),',vQ17=',string(vQ17,F2)).
compute p1393='vQ15答1且vK3未答90，不應跳答vQ17'.
compute s1393=2.
else if  (vQ15~=1|vK3m90=1)&any(0,vQ17_96).
compute m1393=CONCAT('vQ15=',string(vQ15,F2),',vK3m90=',string(vK3m90,F2),',vQ17=',string(vQ17,F2)).
compute p1393='vQ15非答1或vK3答90，應跳答vQ17'.
compute s1393=2.
end if.
do if  (vQ15=1&vK1m90~=1)&any(1,vQ18_96).
compute m1394=CONCAT('vQ15=',string(vQ15,F2),',vK1m90=',string(vK1m90,F2),',vQ18=',string(vQ18,F2)).
compute p1394='vQ15答1且vK1未答90，不應跳答vQ18'.
compute s1394=2.
else if  (vQ15~=1|vK1m90=1)&any(0,vQ18_96).
compute m1394=CONCAT('vQ15=',string(vQ15,F2),',vK1m90=',string(vK1m90,F2),',vQ18=',string(vQ18,F2)).
compute p1394='vQ15非答1或vK1答90，應跳答vQ18'.
compute s1394=2.
end if.
do if  (vQ15=1&(vG7m90~=1|vG8m90~=1|vG9m90~=1|vG10m90~=1|vG11m90~=1))&any(1,vQ19_96).
compute m1395=CONCAT('vQ15=',string(vQ15,F2),',vG7m90=',string(vG7m90,F2),',vG8m90=',string(vG8m90,F2),',vG9m90=',string(vG9m90,F2)
,',vG10m90=',string(vG10m90,F2),',vG11m90=',string(vG11m90,F2),',vQ9=',string(vQ19,F2)).
compute p1395='vQ15答1且vG7-G11未都答90，不應跳答vQ19'.
compute s1395=2.
else if  (vQ15~=1|(vG7m90=1&vG8m90=1&vG9m90=1&vG10m90=1&vG11m90=1))&any(0,vQ19_96).
compute m1395=CONCAT('vQ15=',string(vQ15,F2),',vG7m90=',string(vG7m90,F2),',vG8m90=',string(vG8m90,F2),',vG9m90=',string(vG9m90,F2)
,',vG10m90=',string(vG10m90,F2),',vG11m90=',string(vG11m90,F2),',vQ9=',string(vQ19,F2)).
compute p1395='vQ15非答1或vG7-G11都答90，應跳答vQ19'.
compute s1395=2.
end if.

do if vQ20m01=1&any(1,vQ24g1_96,vQ24g2_96).
compute m1396=CONCAT('vQ20m01=',string(vQ20m01,F2),',vQ24g1=',string(vQ24g1,F4),',vQ24g2=',string(vQ24g2,F3)).
compute p1396='vQ20答1，不應跳答vQ24'.
compute s1396=2.
else if  vQ20m01~=1&any(0,vQ24g1_96,vQ24g2_96).
compute m1396=CONCAT('vQ20m01=',string(vQ20m01,F2),',vQ24g1=',string(vQ24g1,F4),',vQ24g2=',string(vQ24g2,F3)).
compute p1396='vQ20未答1，應跳答vQ24'.
compute s1396=2.
end if.

do if vQ20m01=1&any(1,vQ25m01_96 to vQ25m88_96).
compute m1397=CONCAT('vQ20m01=',string(vQ20m01,F2),',',列出_Q25).
compute p1397='vQ20答1，不應跳答vQ25'.
compute s1397=2.
else if  vQ20m01~=1&any(0,vQ25m01_96 to vQ25m88_96).
compute m1397=CONCAT('vQ20m01=',string(vQ20m01,F2),',',列出_Q25).
compute p1397='vQ20未答1，應跳答vQ25'.
compute s1397=2.
end if.

do if (vQ20m02=1|vQ20m03=1)&any(1,vQ21g1_96,vQ21g2_96).
compute m1398=CONCAT('vQ20m02=',string(vQ20m02,F2),',vQ20m03=',string(vQ20m03,F2),',vQ21g1=',string(vQ21g1,F4),',vQ21g2=',string(vQ21g2,F3)).
compute p1398='vQ20答2或3，不應跳答vQ21'.
compute s1398=2.
else if  (vQ20m02~=1&vQ20m03~=1)&any(0,vQ21g1_96,vQ21g2_96).
compute m1398=CONCAT('vQ20m02=',string(vQ20m02,F2),',vQ20m03=',string(vQ20m03,F2),',vQ21g1=',string(vQ21g1,F4),',vQ21g2=',string(vQ21g2,F3)).
compute p1398='vQ20未答2或3，應跳答vQ21'.
compute s1398=2.
end if.

do if (vQ20m02=1)=1&any(1,vQ22m01_96 to vQ22m88_96).
compute m1399=CONCAT('vQ20m02=',string(vQ20m02,F2),',vQ20m03=',string(vQ20m03,F2),',',列出_Q22).
compute p1399='vQ20答2，不應跳答vQ22'.
compute s1399=2.
else if  (vQ20m02~=1)&any(0,vQ22m01_96 to vQ22m88_96).
compute m1399=CONCAT('vQ20m02=',string(vQ20m02,F2),',vQ20m03=',string(vQ20m03,F2),',',列出_Q22).
compute p1399='vQ20未答2，應跳答vQ22'.
compute s1399=2.
end if.


do if vQ20m03=1&any(1,vQ23m01_96 to vQ23m88_96).
compute m1504=CONCAT('vQ20m03=',string(vQ20m03,F2),',',列出_Q23).
compute p1504='vQ20答3，不應跳答vQ23'.
compute s1504=2.
else if  vQ20m03~=1&any(0,vQ23m01_96 to vQ23m88_96).
compute m1504=CONCAT('vQ20m03=',string(vQ20m03,F2),',',列出_Q23).
compute p1504='vQ20未答3，應跳答vQ23'.
compute s1504=2.
end if.

do if vQ20m04=1&any(1,vQ26Ag1_96,vQ26Ag2_96).
compute m1400=CONCAT('vQ20m04=',string(vQ20m04,F2),',vQ26Ag1=',string(vQ26Ag1,F4),',vQ26Ag2=',string(vQ26Ag2,F3)).
compute p1400='vQ20答4，不應跳答vQ26A'.
compute s1400=2.
else if  vQ20m04~=1&any(0,vQ26Ag1_96,vQ26Ag2_96).
compute m1400=CONCAT('vQ20m04=',string(vQ20m04,F2),',vQ26Ag1=',string(vQ26Ag1,F4),',vQ26Ag2=',string(vQ26Ag2,F3)).
compute p1400='vQ20未答4，應跳答vQ26A'.
compute s1400=2.
end if.

do if vQ20m04=1&any(1,vQ26m01_96 to vQ26m88_96).
compute m1401=CONCAT('vQ20m04=',string(vQ20m04,F2),',',列出_Q26).
compute p1401='vQ20答4，不應跳答vQ26'.
compute s1401=2.
else if  vQ20m04~=1&any(0,vQ26m01_96 to vQ26m88_96).
compute m1401=CONCAT('vQ20m04=',string(vQ20m04,F2),',',列出_Q26).
compute p1401='vQ20未答4，應跳答vQ26'.
compute s1401=2.
end if.

do if (any(vQ1,1,96)&any(vQ2,1,96)&any(vQ3,1,96)&any(vQ4,1,96)&any(vQ5,2,96)&any(vQ10,2,96)&any(vQ15,2,96)&vQ20m90=1)&any(0,vQ27m01_96 to vQ27m88_96).
compute m1402=CONCAT('vQ1=',string(vQ1,F2),',vQ2=',string(vQ2,F2),',vQ3=',string(vQ3,F2),',vQ4=',string(vQ4,F2),',vQ5=',string(vQ5,F2),',vQ10=',string(vQ10,F2),',vQ15=',string(vQ15,F2),
',',列出_Q27).
compute p1402='vQ1-4答1，vQ5、Q10、vQ15答2，vQ20答90，應跳答vQ27'.
compute s1402=2.
else if  ((any(vQ1,2,3,4,97,98)|any(vQ2,2,3,4,97,98)|any(vQ3,2,3,4,97,98)|any(vQ4,2,3,4,97,98)|any(vQ5,1,97,98)|any(vQ10,1,97,98)|any(vQ15,1,97,98)|vQ20m90~=1))&any(1,vQ27m01_96 to vQ27m88_96).
compute m1402=CONCAT('vQ1=',string(vQ1,F2),',vQ2=',string(vQ2,F2),',vQ3=',string(vQ3,F2),',vQ4=',string(vQ4,F2),',vQ5=',string(vQ5,F2),',vQ10=',string(vQ10,F2),',vQ15=',string(vQ15,F2),
',',列出_Q27).
compute p1402='vQ1-4未答1，vQ5、Q10、vQ15未答2，vQ20未答90，不應跳答vQ27'.
compute s1402=2.
end if.


do if  vE1=1&any(1,vP3_4_96).
compute m1403=CONCAT('vE1=',string(vE1,F2),',vP3_4=',string(vP3_4,F2)).
compute p1403='vE1答1，不應跳答vQ15'.
compute s1403=2.
else if vE1~=1&any(0,vP3_4_96).
compute m1403=CONCAT('vE1=',string(vE1,F2),',vP3_4=',string(vP3_4,F2)).
compute p1403='vE1非答1，應跳答vP3_4'.
compute s1403=2.
end if.

do if  (any(vK2m90,1,97,98)|any(vQ5,2,96))&any(0,vP3_5_96).
compute m1404=CONCAT('vK2m90=',string(vK2m90,F2),',vQ5=',string(vQ5,F2),',vP3_5=',string(vP3_5,F2)).
compute p1404='vK2答90、97、98或vQ5答2，應跳答vP3_5'.
compute s1404=2.
else if (not any(vK2m90,1,97,98)&not any(vQ5,2,96))&any(1,vP3_5_96).
compute m1404=CONCAT('vK2m90=',string(vK2m90,F2),',vQ5=',string(vQ5,F2),',vP3_5=',string(vP3_5,F2)).
compute p1404='vK2非答90、97、98且vQ5非答2，不應跳答vP3_5'.
compute s1404=2.
end if.




do if (vQ20m02=1|vQ20m03=1)=1&any(1,vP3_6_96).
compute m1405=CONCAT('vQ20m02=',string(vQ20m02,F2),',vQ20m03=',string(vQ20m03,F2),',vP3_6=',string(vP3_6,F2)).
compute p1405='vQ20答2或3，不應跳答vP3_6'.
compute s1405=2.
else if  (vQ20m02~=1&vQ20m03~=1)&any(0,vP3_6_96).
compute m1405=CONCAT('vQ20m02=',string(vQ20m02,F2),',vQ20m03=',string(vQ20m03,F2),',vP3_6=',string(vP3_6,F2)).
compute p1405='vQ20未答2或3，應跳答vP3_6'.
compute s1405=2.
end if.


do if  vE1=1&any(1,vQ30m01_96 to vQ30m90_96).
compute m1406=CONCAT('vE1=',string(vE1,F2),',',列出_Q30).
compute p1406='vE1答1，不應跳答vQ30'.
compute s1406=2.
else if vE1~=1&any(0,vQ30m01_96 to vQ30m90_96).
compute m1406=CONCAT('vE1=',string(vE1,F2),',',列出_Q30).
compute p1406='vE1非答1，應跳答vQ30'.
compute s1406=2.
end if.

do if  (vA1=96|vA2=1)&any(0,vQ44_96).
compute m1407=CONCAT('vA1=',string(vA1,F4),',vA2=',string(vA2,F2),',vQ44=',string(vQ44,F2)).
compute p1407='vA1答96或vA2答1，應跳答vQ44'.
compute s1407=2.
else if (vA1~=96&vA2~=1)&any(1,vQ44_96).
compute m1407=CONCAT('vA1=',string(vA1,F4),',vA2=',string(vA2,F2),',vQ44=',string(vQ44,F2)).
compute p1407='vA1非答96且vA2非答1，不應跳答vQ44'.
compute s1407=2.
end if.

do if  any(vQ44,89,90,91,92,94,95,97,98)&any(1,vQ45_96).
compute m1408=CONCAT('vQ44=',string(vQ44,F2),',vQ45=',string(vQ45,F2)).
compute p1408='vQ44答89-92、94-95、97-98，不應跳答vQ45'.
compute s1408=2.
else if not any(vQ44,89,90,91,92,94,95,97,98)&any(0,vQ45_96).
compute m1408=CONCAT('vQ44=',string(vQ44,F2),',vQ45=',string(vQ45,F2)).
compute p1408='vQ44非答89-92、94-95、97-98，應跳答vQ45'.
compute s1408=2.
end if.

do if  any(vQ49,2,97,98)&any(1,vQ50_96).
compute m1409=CONCAT('vQ49=',string(vQ49,F2),',vQ50=',string(vQ50,F2)).
compute p1409='vQ44答2、97-98，不應跳答vQ50'.
compute s1409=2.
else if not any(vQ49,2,97,98)&any(0,vQ50_96).
compute m1409=CONCAT('vQ49=',string(vQ49,F2),',vQ50=',string(vQ50,F2)).
compute p1409='vQ49非答2、97-98，應跳答vQ50'.
compute s1409=2.
end if.

do if (vQ49=1|vQ50=1)&any(1,vQ51_96).
compute m1410=CONCAT('vQ49=',string(vQ49,F2),',vQ50=',string(vQ50,F2),',vQ51=',string(vQ51,F2)).
compute p1410='vQ49或vQ50答1，不應跳答vQ51'.
compute s1410=2.
else if  (vQ49~=1&vQ50~=1)&any(0,vQ51_96).
compute m1410=CONCAT('vQ49=',string(vQ49,F2),',vQ50=',string(vQ50,F2),',vQ51=',string(vQ51,F2)).
compute p1410='vQ49及vQ50未答1，應跳答vQ51'.
compute s1410=2.
end if.

do if range(vQ51,1,88)&any(1,vQ52_96).
compute m1411=CONCAT('vQ51=',string(vQ51,F2),',vQ52=',string(vQ52,F2)).
compute p1411='vQ51答1-88，不應跳答vQ52'.
compute s1411=2.
else if  not range(vQ51,1,88)&any(0,vQ52_96).
compute m1411=CONCAT('vQ51=',string(vQ51,F2),',vQ52=',string(vQ52,F2)).
compute p1411='vQ51非答1-88，應跳答vQ52'.
compute s1411=2.
end if.

do if  vD1=3&vZ2_2~="96".
compute m1412=CONCAT('vD1=',string(vD1,F2),',vZ2_2=',char.substr(vZ2_2,1,150)).
compute p1412='vD1選3，應跳答vZ2_2'.
compute s1412=2.
else if vD1~=3&vZ2_2="96".
compute m1412=CONCAT('vD1=',string(vD1,F2),',vZ2_2=',char.substr(vZ2_2,1,150)).
compute p1412='vD1非選3，不應跳答vZ2_2'.
compute s1412=2.
end if.

do if  (vA9=1|any(vE1,2,97,98))&any(0,vZE2m01_96,vZE2m02_96,vZE2m03_96).
compute m1413=CONCAT('vA9=',string(vA9,F2),',vE1=',string(vE1,F2),',vZE2m01=',string(vZE2m01,F2),',vZE2m02=',string(vZE2m02,F2),',vZE2m03=',string(vZE2m03,F2)).
compute p1413='vA9答1或vE1答2、97-98，應跳答vZE2'.
compute s1413=2.
else if  (vA9~=1&not any(vE1,2,97,98))&any(1,vZE2m01_96,vZE2m02_96,vZE2m03_96).
compute m1413=CONCAT('vA9=',string(vA9,F2),',vE1=',string(vE1,F2),',vZE2m01=',string(vZE2m01,F2),',vZE2m02=',string(vZE2m02,F2),',vZE2m03=',string(vZE2m03,F2)).
compute p1413='vA9未答1且vE1未答2、97-98，不應跳答vZE2'.
compute s1413=2.
end if.

do if  (vZE2m02=1|vZE2m01=1)&vZE2_1='96'.
compute m1414=CONCAT('vZE2m01=',string(vZE2m01,F2),',vZE2m02=',string(vZE2m02,F2),',vZE2_1=',char.substr(vZE2_1,1,30)).
compute p1414='vZE2有選1或2，不應跳答vZE2_1'.
compute s1414=2.
else if (vZE2m03~=1&vZE2m02~=1&vZE2m01~=1)&vZE2_1~='96'.
compute m1414=CONCAT('vZE2m01=',string(vZE2m01,F2),',vZE2m02=',string(vZE2m02,F2),',vZE2_1=',char.substr(vZE2_1,1,30)).
compute p1414='vZE2沒有選1或2，應跳答vZE2_1'.
compute s1414=2.
end if.


do if  vZE2m01=1&vZE2_2='96'.
compute m1415=CONCAT('vZE2m01=',string(vZE2m01,F2),',vZE2_2=',char.substr(vZE2_2,1,30)).
compute p1415='vZE2有選1，不應跳答vZE2_2'.
compute s1415=2.
else if vZE2m01~=1&vZE2_2~='96'.
compute m1415=CONCAT('vZE2m01=',string(vZE2m01,F2),',vZE2_2=',char.substr(vZE2_2,1,30)).
compute p1415='vZE2沒有選1，應跳答vZE2_2'.
compute s1415=2.
end if.

do if  vZE2m02=1&vZE2_3='96'.
compute m1416=CONCAT('vZE2m02=',string(vZE2m02,F2),',vZE2_3=',char.substr(vZE2_3,1,900)).
compute p1416='vZE2有選2，不應跳答vZE2_3'.
compute s1416=2.
else if vZE2m02~=1&vZE2_3~='96'.
compute m1416=CONCAT('vZE2m02=',string(vZE2m02,F2),',vZE2_3=',char.substr(vZE2_3,1,900)).
compute p1416='vZE2沒有選2，應跳答vZE2_3'.
compute s1416=2.
end if.

do if vA9=1&vO1_1=1.
compute m1417=CONCAT('vA9=',string(vA9,F2),',vO1_1=',string(vO1_1,F2)).
compute p1417='vA9選1，vO1_1不可選1'.
compute s1417=2.
end if.
do if vA9=1&vO1_1=2.
compute m1418=CONCAT('vA9=',string(vA9,F2),',vO1_1=',string(vO1_1,F2)).
compute p1418='vA9選1，vO1_1不可選2'.
compute s1418=2.
end if.
do if vA9=1&vO1_1=3.
compute m1419=CONCAT('vA9=',string(vA9,F2),',vO1_1=',string(vO1_1,F2)).
compute p1419='vA9選1，vO1_1不可選3'.
compute s1419=2.
end if.
do if vA9=1&vO1_1=4.
compute m1420=CONCAT('vA9=',string(vA9,F2),',vO1_1=',string(vO1_1,F2)).
compute p1420='vA9選1，vO1_1不可選4'.
compute s1420=2.
end if.
do if vO1=14&vO1_1=5.
compute m1421=CONCAT('vO1=',string(vO1,F2),',vO1_1=',string(vO1_1,F2)).
compute p1421='vO1_1選5，vO1不可選14'.
compute s1421=2.
end if.



do if  vD1=3&vE17=1.
compute m1422=CONCAT('vD1=',string(vD1,F2),',vE17=',string(vE17,F2)).
compute p1422='vD1選3，E17不可選1'.
compute s1422=2.
end if.
do if  vD1=3&vE18=1.
compute m1423=CONCAT('vD1=',string(vD1,F2),',vE18=',string(vE18,F2)).
compute p1423='vD1選3，E18不可選1'.
compute s1423=2.
end if.

do if  vD1=3&vE2m01=1.
compute m1424=CONCAT('vD1=',string(vD1,F2),',vE2m01=',string(vE2m01,F2)).
compute p1424='vD1選3，E2不可選1'.
compute s1424=2.
end if.

do if  vK2m90=1&vG7m01=1.
compute m1425=CONCAT('vK2m90=',string(vK2m90,F2),',vG7m01=',string(vG7m01,F2)).
compute p1425='vK2選90，G7不可選1'.
compute s1425=2.
end if.
do if  vK1m90=1&vG7m02=1.
compute m1426=CONCAT('vK1m90=',string(vK1m90,F2),',vG7m02=',string(vG7m02,F2)).
compute p1426='vK1選90，G7不可選2'.
compute s1426=2.
end if.


do if not any(vB7am01,95,96,97,98)&sum(vB7am01 to vB7am88)>1.
do if  vB7=1&vB7am01=0.
compute m1427=CONCAT('vB7am01=',string(vB7am01,F2),',vB7=',string(vB7,F2)).
compute p1427='vB7a未選1，B7不可選1'.
compute s1427=2.
end if.

do if  vB7=01&vB7am01=0.
compute m1433=CONCAT('vB7am01=',string(vB7am01,F2),',vB7=',string(vB7,F2)).
compute p1433='vB7a未選01，B7不可選01'.
compute s1433=2.
end if.

do if  vB7=02&vB7am02=0.
compute m1434=CONCAT('vB7am02=',string(vB7am02,F2),',vB7=',string(vB7,F2)).
compute p1434='vB7a未選02，B7不可選02'.
compute s1434=2.
end if.

do if  vB7=03&vB7am03=0.
compute m1435=CONCAT('vB7am03=',string(vB7am03,F2),',vB7=',string(vB7,F2)).
compute p1435='vB7a未選03，B7不可選03'.
compute s1435=2.
end if.

do if  vB7=04&vB7am04=0.
compute m1436=CONCAT('vB7am04=',string(vB7am04,F2),',vB7=',string(vB7,F2)).
compute p1436='vB7a未選04，B7不可選04'.
compute s1436=2.
end if.

do if  vB7=05&vB7am05=0.
compute m1437=CONCAT('vB7am05=',string(vB7am05,F2),',vB7=',string(vB7,F2)).
compute p1437='vB7a未選05，B7不可選05'.
compute s1437=2.
end if.

do if  vB7=06&vB7am06=0.
compute m1438=CONCAT('vB7am06=',string(vB7am06,F2),',vB7=',string(vB7,F2)).
compute p1438='vB7a未選06，B7不可選06'.
compute s1438=2.
end if.

do if  vB7=07&vB7am07=0.
compute m1439=CONCAT('vB7am07=',string(vB7am07,F2),',vB7=',string(vB7,F2)).
compute p1439='vB7a未選07，B7不可選07'.
compute s1439=2.
end if.
do if  vB7=08&vB7am08=0.
compute m1440=CONCAT('vB7am08=',string(vB7am08,F2),',vB7=',string(vB7,F2)).
compute p1440='vB7a未選08，B7不可選08'.
compute s1440=2.
end if.
do if  vB7=09&vB7am09=0.
compute m1441=CONCAT('vB7am09=',string(vB7am09,F2),',vB7=',string(vB7,F2)).
compute p1441='vB7a未選09，B7不可選09'.
compute s1441=2.
end if.
do if  vB7=10&vB7am10=0.
compute m1442=CONCAT('vB7am10=',string(vB7am10,F2),',vB7=',string(vB7,F2)).
compute p1442='vB7a未選10，B7不可選10'.
compute s1442=2.
end if.
do if  vB7=11&vB7am11=0.
compute m1443=CONCAT('vB7am11=',string(vB7am11,F2),',vB7=',string(vB7,F2)).
compute p1443='vB7a未選11，B7不可選11'.
compute s1443=2.
end if.
do if  vB7=12&vB7am12=0.
compute m1444=CONCAT('vB7am12=',string(vB7am12,F2),',vB7=',string(vB7,F2)).
compute p1444='vB7a未選12，B7不可選12'.
compute s1444=2.
end if.
do if  vB7=13&vB7am13=0.
compute m1445=CONCAT('vB7am13=',string(vB7am13,F2),',vB7=',string(vB7,F2)).
compute p1445='vB7a未選13，B7不可選13'.
compute s1445=2.
end if.
do if  vB7=14&vB7am14=0.
compute m1446=CONCAT('vB7am14=',string(vB7am14,F2),',vB7=',string(vB7,F2)).
compute p1446='vB7a未選14，B7不可選14'.
compute s1446=2.
end if.
do if  vB7=15&vB7am15=0.
compute m1447=CONCAT('vB7am15=',string(vB7am15,F2),',vB7=',string(vB7,F2)).
compute p1447='vB7a未選15，B7不可選15'.
compute s1447=2.
end if.
do if  vB7=16&vB7am16=0.
compute m1448=CONCAT('vB7am16=',string(vB7am16,F2),',vB7=',string(vB7,F2)).
compute p1448='vB7a未選16，B7不可選16'.
compute s1448=2.
end if.
do if  vB7=17&vB7am17=0.
compute m1449=CONCAT('vB7am17=',string(vB7am17,F2),',vB7=',string(vB7,F2)).
compute p1449='vB7a未選17，B7不可選17'.
compute s1449=2.
end if.
do if  vB7=18&vB7am18=0.
compute m1450=CONCAT('vB7am18=',string(vB7am18,F2),',vB7=',string(vB7,F2)).
compute p1450='vB7a未選18，B7不可選18'.
compute s1450=2.
end if.
do if  vB7=19&vB7am19=0.
compute m1451=CONCAT('vB7am19=',string(vB7am19,F2),',vB7=',string(vB7,F2)).
compute p1451='vB7a未選19，B7不可選19'.
compute s1451=2.
end if.
do if  vB7=20&vB7am20=0.
compute m1452=CONCAT('vB7am20=',string(vB7am20,F2),',vB7=',string(vB7,F2)).
compute p1452='vB7a未選20，B7不可選20'.
compute s1452=2.
end if.
do if  vB7=21&vB7am21=0.
compute m1453=CONCAT('vB7am21=',string(vB7am21,F2),',vB7=',string(vB7,F2)).
compute p1453='vB7a未選21，B7不可選21'.
compute s1453=2.
end if.
do if  vB7=22&vB7am22=0.
compute m1454=CONCAT('vB7am22=',string(vB7am22,F2),',vB7=',string(vB7,F2)).
compute p1454='vB7a未選22，B7不可選22'.
compute s1454=2.
end if.
do if  vB7=23&vB7am23=0.
compute m1455=CONCAT('vB7am23=',string(vB7am23,F2),',vB7=',string(vB7,F2)).
compute p1455='vB7a未選23，B7不可選23'.
compute s1455=2.
end if.
do if  vB7=24&vB7am24=0.
compute m1456=CONCAT('vB7am24=',string(vB7am24,F2),',vB7=',string(vB7,F2)).
compute p1456='vB7a未選24，B7不可選24'.
compute s1456=2.
end if.
do if  vB7=25&vB7am25=0.
compute m1457=CONCAT('vB7am25=',string(vB7am25,F2),',vB7=',string(vB7,F2)).
compute p1457='vB7a未選25，B7不可選25'.
compute s1457=2.
end if.
do if  vB7=26&vB7am26=0.
compute m1458=CONCAT('vB7am26=',string(vB7am26,F2),',vB7=',string(vB7,F2)).
compute p1458='vB7a未選26，B7不可選26'.
compute s1458=2.
end if.
do if  vB7=27&vB7am27=0.
compute m1459=CONCAT('vB7am27=',string(vB7am27,F2),',vB7=',string(vB7,F2)).
compute p1459='vB7a未選27，B7不可選27'.
compute s1459=2.
end if.
do if  vB7=28&vB7am28=0.
compute m1460=CONCAT('vB7am28=',string(vB7am28,F2),',vB7=',string(vB7,F2)).
compute p1460='vB7a未選28，B7不可選28'.
compute s1460=2.
end if.
do if  vB7=29&vB7am29=0.
compute m1461=CONCAT('vB7am29=',string(vB7am29,F2),',vB7=',string(vB7,F2)).
compute p1461='vB7a未選29，B7不可選29'.
compute s1461=2.
end if.
do if  vB7=30&vB7am30=0.
compute m1462=CONCAT('vB7am30=',string(vB7am30,F2),',vB7=',string(vB7,F2)).
compute p1462='vB7a未選30，B7不可選30'.
compute s1462=2.
end if.
do if  vB7=31&vB7am31=0.
compute m1463=CONCAT('vB7am31=',string(vB7am31,F2),',vB7=',string(vB7,F2)).
compute p1463='vB7a未選31，B7不可選31'.
compute s1463=2.
end if.
do if  vB7=32&vB7am32=0.
compute m1464=CONCAT('vB7am32=',string(vB7am32,F2),',vB7=',string(vB7,F2)).
compute p1464='vB7a未選32，B7不可選32'.
compute s1464=2.
end if.
do if  vB7=33&vB7am33=0.
compute m1465=CONCAT('vB7am33=',string(vB7am33,F2),',vB7=',string(vB7,F2)).
compute p1465='vB7a未選33，B7不可選33'.
compute s1465=2.
end if.
do if  vB7=34&vB7am34=0.
compute m1466=CONCAT('vB7am34=',string(vB7am34,F2),',vB7=',string(vB7,F2)).
compute p1466='vB7a未選34，B7不可選34'.
compute s1466=2.
end if.
do if  vB7=35&vB7am35=0.
compute m1467=CONCAT('vB7am35=',string(vB7am35,F2),',vB7=',string(vB7,F2)).
compute p1467='vB7a未選35，B7不可選35'.
compute s1467=2.
end if.
do if  vB7=36&vB7am36=0.
compute m1468=CONCAT('vB7am36=',string(vB7am36,F2),',vB7=',string(vB7,F2)).
compute p1468='vB7a未選36，B7不可選36'.
compute s1468=2.
end if.
do if  vB7=37&vB7am37=0.
compute m1469=CONCAT('vB7am37=',string(vB7am37,F2),',vB7=',string(vB7,F2)).
compute p1469='vB7a未選37，B7不可選37'.
compute s1469=2.
end if.
do if  vB7=38&vB7am38=0.
compute m1470=CONCAT('vB7am38=',string(vB7am38,F2),',vB7=',string(vB7,F2)).
compute p1470='vB7a未選38，B7不可選38'.
compute s1470=2.
end if.
do if  vB7=39&vB7am39=0.
compute m1471=CONCAT('vB7am39=',string(vB7am39,F2),',vB7=',string(vB7,F2)).
compute p1471='vB7a未選39，B7不可選39'.
compute s1471=2.
end if.
do if  vB7=40&vB7am40=0.
compute m1472=CONCAT('vB7am40=',string(vB7am40,F2),',vB7=',string(vB7,F2)).
compute p1472='vB7a未選40，B7不可選40'.
compute s1472=2.
end if.
do if  vB7=41&vB7am41=0.
compute m1473=CONCAT('vB7am41=',string(vB7am41,F2),',vB7=',string(vB7,F2)).
compute p1473='vB7a未選41，B7不可選41'.
compute s1473=2.
end if.
do if  vB7=42&vB7am42=0.
compute m1474=CONCAT('vB7am42=',string(vB7am42,F2),',vB7=',string(vB7,F2)).
compute p1474='vB7a未選42，B7不可選42'.
compute s1474=2.
end if.
do if  vB7=43&vB7am43=0.
compute m1475=CONCAT('vB7am43=',string(vB7am43,F2),',vB7=',string(vB7,F2)).
compute p1475='vB7a未選43，B7不可選43'.
compute s1475=2.
end if.
do if  vB7=44&vB7am44=0.
compute m1476=CONCAT('vB7am44=',string(vB7am44,F2),',vB7=',string(vB7,F2)).
compute p1476='vB7a未選44，B7不可選44'.
compute s1476=2.
end if.
do if  vB7=45&vB7am45=0.
compute m1477=CONCAT('vB7am45=',string(vB7am45,F2),',vB7=',string(vB7,F2)).
compute p1477='vB7a未選45，B7不可選45'.
compute s1477=2.
end if.
do if  vB7=46&vB7am46=0.
compute m1478=CONCAT('vB7am46=',string(vB7am46,F2),',vB7=',string(vB7,F2)).
compute p1478='vB7a未選46，B7不可選46'.
compute s1478=2.
end if.
do if  vB7=47&vB7am47=0.
compute m1479=CONCAT('vB7am47=',string(vB7am47,F2),',vB7=',string(vB7,F2)).
compute p1479='vB7a未選47，B7不可選47'.
compute s1479=2.
end if.
do if  vB7=48&vB7am48=0.
compute m1480=CONCAT('vB7am48=',string(vB7am48,F2),',vB7=',string(vB7,F2)).
compute p1480='vB7a未選48，B7不可選48'.
compute s1480=2.
end if.
do if  vB7=49&vB7am49=0.
compute m1481=CONCAT('vB7am49=',string(vB7am49,F2),',vB7=',string(vB7,F2)).
compute p1481='vB7a未選49，B7不可選49'.
compute s1481=2.
end if.
do if  vB7=50&vB7am50=0.
compute m1482=CONCAT('vB7am50=',string(vB7am50,F2),',vB7=',string(vB7,F2)).
compute p1482='vB7a未選50，B7不可選50'.
compute s1482=2.
end if.
do if  vB7=51&vB7am51=0.
compute m1483=CONCAT('vB7am51=',string(vB7am51,F2),',vB7=',string(vB7,F2)).
compute p1483='vB7a未選51，B7不可選51'.
compute s1483=2.
end if.
do if  vB7=52&vB7am52=0.
compute m1484=CONCAT('vB7am52=',string(vB7am52,F2),',vB7=',string(vB7,F2)).
compute p1484='vB7a未選52，B7不可選52'.
compute s1484=2.
end if.
do if  vB7=53&vB7am53=0.
compute m1485=CONCAT('vB7am53=',string(vB7am53,F2),',vB7=',string(vB7,F2)).
compute p1485='vB7a未選53，B7不可選53'.
compute s1485=2.
end if.
do if  vB7=54&vB7am54=0.
compute m1486=CONCAT('vB7am54=',string(vB7am54,F2),',vB7=',string(vB7,F2)).
compute p1486='vB7a未選54，B7不可選54'.
compute s1486=2.
end if.
do if  vB7=88&vB7am88=0.
compute m1487=CONCAT(列出_B7a,',vB7=',string(vB7,F2)).
compute p1487='vB7a未選88，B7不可選88'.
compute s1487=2.
end if.
end if.

do if  vB5=0&vB8m01=1.
compute m1488=CONCAT('vB5=',string(vB5,n4),',vB8m01=',string(vB8m01,F2)).
compute p1488='vB5答0，B8不可選1'.
compute s1488=2.
end if.

do if  vF0=2&any(vE1,2,97,98).
compute m1489=CONCAT('vF0=',string(vF0,F2),',vE1=',string(vE1,F2)).
compute p1489='vF0答2，vE1不可選2、97、98'.
compute s1489=2.
end if.

do if  vF0=89&any(vE1,2,97,98).
compute m1490=CONCAT('vF0=',string(vF0,F2),',vE1=',string(vE1,F2)).
compute p1490='vF0答89，vE1不可選2、97、98'.
compute s1490=2.
end if.

do if  (vB1+vB3=0)&vE1=2&vQ20m01=1.
compute m1491=CONCAT('vB1=',string(vB1,n4),',vB3=',string(vB3,n4),',vE1=',string(vE1,F2),',vQ20m01=',string(vQ20m01,F2)).
compute p1491='vB1及vB3答0且vE1答2，vQ20不可選1'.
compute s1491=2.
end if.

do if vE1=2&vQ20m02=1.
compute m1492=CONCAT('vE1=',string(vE1,F2),',vQ20m02=',string(vQ20m02,F2)).
compute p1492='vE1答2，vQ20不可選2'.
compute s1492=2.
end if.

do if vE1=2&vQ20m03=1.
compute m1493=CONCAT('vE1=',string(vE1,F2),',vQ20m03=',string(vQ20m03,F2)).
compute p1493='vE1答2，vQ20不可選3'.
compute s1493=2.
end if.
do if vE1=2&vQ20m04=1.
compute m1494=CONCAT('vE1=',string(vE1,F2),',vQ20m04=',string(vQ20m04,F2)).
compute p1494='vE1答2，vQ20不可選4'.
compute s1494=2.
end if.

do if vE1=2&vQ20m05=1.
compute m1495=CONCAT('vE1=',string(vE1,F2),',vQ20m05=',string(vQ20m05,F2)).
compute p1495='vE1答2，vQ20不可選5'.
compute s1495=2.
end if.

do if vE1=2&vQ25m27=1.
compute m1496=CONCAT('vE1=',string(vE1,F2),',vQ25m27=',string(vQ25m27,F2)).
compute p1496='vE1答2，vQ25不可選27'.
compute s1496=2.
end if.

do if vE1=2&vQ25m28=1.
compute m1497=CONCAT('vE1=',string(vE1,F2),',vQ25m28=',string(vQ25m28,F2)).
compute p1497='vE1答2，vQ25不可選28'.
compute s1497=2.
end if.
do if vE1=2&vQ25m29=1.
compute m1498=CONCAT('vE1=',string(vE1,F2),',vQ25m29=',string(vQ25m29,F2)).
compute p1498='vE1答2，vQ25不可選29'.
compute s1498=2.
end if.

do if vE1=2&vQ25m30=1.
compute m1499=CONCAT('vE1=',string(vE1,F2),',vQ25m30=',string(vQ25m30,F2)).
compute p1499='vE1答2，vQ25不可選30'.
compute s1499=2.
end if.

do if vE1=2&vQ25m31=1.
compute m1500=CONCAT('vE1=',string(vE1,F2),',vQ25m31=',string(vQ25m31,F2)).
compute p1500='vE1答2，vQ25不可選31'.
compute s1500=2.
end if.

do if (any(vA1,94,95,96)|vA2=1)&vQ43~=8.
compute m1501=CONCAT('vA1=',string(vA1,F2),',vA2=',string(vA2,F2),',vQ43=',string(vQ43,F2)).
compute p1501='vA1答94-96或vA2答1，vQ43只能選8'.
compute s1501=2.
end if.

do if  (vA9=1|any(vE1,2,97,98))&any(0,vZE2m01_96,vZE2m02_96,vZE2m03_96).
compute m1502=CONCAT('vA9=',string(vA9,F2),',vE1=',string(vE1,F2),',vZE2m01=',string(vZE2m01,F2),
',vZE2m02=',string(vZE2m02,F2),',vZE2m03=',string(vZE2m03,F2)).
compute p1502='vE1答2、97、98或A9答1，應跳答ZE2'.
compute s1502=2.
else if  (vA9~=1&not any(vE1,2,97,98))&any(1,vZE2m01_96,vZE2m02_96,vZE2m03_96).
compute m1502=CONCAT('vA9=',string(vA9,F2),',vE1=',string(vE1,F2),',vZE2m01=',string(vZE2m01,F2),
',vZE2m02=',string(vZE2m02,F2),',vZE2m03=',string(vZE2m03,F2)).
compute p1502='vE1非答2、97、98且A9非答1，不應跳答ZE2'.
compute s1502=2.
end if.


do if  vD1=3&vZE2m01=1.
compute m1503=CONCAT('vD1=',string(vD1,F2),',vZE2m01=',string(vZE2m01,F2)).
compute p1503='vD1選3，vZE2不可選1'.
compute s1503=2.
end if.

do if  vC3m08=1&vQ3=1.
compute m1505=CONCAT('vC3m08=',string(vC3m08,F2),',vQ3=',string(vQ3,F2)).
compute p1505='vC3選8，vQ3不可選1'.
compute s1505=2.
end if.


do if  vB8m08=1&vQ4=1.
compute m1505=CONCAT('vB8m08=',string(vB8m08,F2),',vQ4=',string(vQ4,F2)).
compute p1505='vB8選8，vQ4不可選1'.
compute s1505=2.
end if.

*******無反應檢查.
do if (vM1g1=997&vM1g2~=97) | (vM1g1=998&vM1g2~=98).
compute m1598=concat('vM1g1=',string(vM1g1,F4),',vM1g2=',string(vM1g2,F3)).
compute p1598="vM1g1答997、998，vM1g2不一致".
compute s1598=2.
end if.

do if (vQ21g1=997&vQ21g2~=97) | (vQ21g1=998&vQ21g2~=98).
compute m1599=concat('vQ21g1=',string(vQ21g1,F4),',vQ21g2=',string(vQ21g2,F3)).
compute p1599="vQ21g1答997、998，vQ21g2不一致".
compute s1599=2.
end if.

do if (vQ24g1=997&vQ24g2~=97) | (vQ24g1=998&vQ24g2~=98).
compute m1600=concat('vQ24g1=',string(vQ24g1,F4),',vQ24g2=',string(vQ24g2,F3)).
compute p1600="vQ24g1答997、998，vQ24g2不一致".
compute s1600=2.
end if.

do if (vQ26Ag1=997&vQ26Ag2~=97) | (vQ26Ag1=998&vQ26Ag2~=98).
compute m1601=concat('vQ26Ag1=',string(vQ26Ag1,F4),',vQ26Ag2=',string(vQ26Ag2,F3)).
compute p1601="vQ26Ag1答997、998，vQ26Ag2不一致".
compute s1601=2.
end if.
exe.
*檢核項目清單******************************************************************************************.
*'A001 受訪者為女性，但vO1工作狀況選(12)服義務役或(13)服(研發)替代役。'.
do if any(sel_gen,2) & any(vO1,12,13)  .
compute m1551=concat("sel_gen=",string(sel_gen,F2),",vO1=",string(vO1,F2)).
compute p1551='【A001】受訪者為女性，但vO1工作狀況選(12)服義務役或(13)服(研發)替代役'.
compute s1551=3.
end if.

*'【B001】57年施行九年國民義務教育，出生年在57年次以後(57歲及以下)，且為台灣出生者(vA3選1-22、97、98)，於vA9教育程度，不應為(01)不識字、(02)自修/小學(年齡計算以112年減出生年)。'.
do if (range(vA1,57,94) | range(vA2,1,8))  &  range(vA3,1,22,97,98) & any(vA9,1,2).
compute m1552=concat("vA1=",string(vA1,F2),",vA2=",string(vA2,F2),",vA9=",string(vA9,F2)).
compute p1552="【B001】57年施行九年國民義務教育，出生年在57年次以後(57歲及以下)，且為台灣出生者(vA3選1-22、97、98)，於vA9教育程度，不應為(01)不識字、(02)自修/小學".
compute s1552=3.
end if.
*'【B002】出生年超過民國92年次(未滿22歲者)，vA9教育程度不應為(07)碩士、(08)博士(年齡計算以112年減出生年)。'.
do if (range(vA1,92,94) | any(vA2,1)) & any(vA9,7,8).
compute m1553=concat("vA1=",string(vA1,F2),",vA2=",string(vA2,F2),",vA9=",string(vA9,F2)).
compute p1553="【B002】出生年超過民國92年次(未滿22歲者)，vA9教育程度不應為(07)碩士、(08)博士(年齡計算以114年減出生年)".
compute s1553=3.
end if.
*'【B003】vB2看電視的平常日（週一到週五），一整天看超過12小時，列出確認。'.
do if range(vB2,1201,2359).
compute m1554=concat("vB2=",string(vB2,f5)).
compute p1554="【B003】vB2看電視的平常日（週一到週五)，一整天看超過12小時，列出確認".
compute s1554=2.
end if.
*'【B004】vB4有看電視的週六或週日，一整天看超過12小時，列出確認。'.
do if range(vB4,1201,2359).
compute m1555=concat("vB4=",string(vB4,f5)).
compute p1555="【B004】vB4看電視的週六或週日，一整天看超過12小時，列出確認".
compute s1555=2.
end if.
*'【B005】vB6看電視新聞的那一天，一整天看超過12小時，列出確認。'.
do if range(vB6,1201,2359).
compute m1556=concat("vB6=",string(vB6,f5)).
compute p1556="【B005】vB6看電視新聞的那一天，一整天看超過12小時，列出確認".
compute s1556=2.
end if.
*'【B006】vC2有聽廣播的那一天，一整天聽超過12小時，列出確認。'.
do if range(vC2,1201,2359).
compute m1557=concat("vC2=",string(vC2,f5)).
compute p1557="【B006】vC2有聽廣播的那一天，一整天聽超過12小時，列出確認".
compute s1557=2.
end if.
*'【B007】vD3有用手機的那一天，一整天用超過16小時，列出確認。'.
do if range(vD3,1601,2359).
compute m1558=concat("vD3=",string(vD3,f5)).
compute p1558="【B007】vD3有用手機的那一天，一整天用超過16小時，列出確認".
compute s1558=2.
end if.

*'【B008】各項裝置（手機、平板及電腦）因工作與課業而上網的時間相加超過16小時，列出確認。'.
compute work_sum=sum(E5_1n,E8_1n,E11_1n)+
(sum(E5_2n,E8_2n,E11_2n)/60).
compute nwork_sum=sum(E6_1n,E9_1n,E12_1n)+
(sum(E6_2n,E9_2n,E12_2n)/60).
compute phone_sum=sum(E5_1n,E6_1n)+
(sum(E5_2n,E6_2n)/60).
compute tablet_sum=sum(E8_1n,E9_1n)+
(sum(E8_2n,E9_2n)/60).
compute computer_sum=sum(E11_1n,E12_1n)+
(sum(E11_2n,E12_2n)/60).

do if work_sum>16.
compute m1559=concat('vE5=',string(vE5,f5),',vE8=',string(vE8,f5),',vE11=',string(vE11,f5),",合計=",string(work_sum,n4.1),"小時").
compute p1559="【B008】各項裝置（手機、平板及電腦）因工作與課業而上網的時間相加超過16小時，列出確認".
compute s1559=2.
end if.

*'【B009】各項裝置（手機、平板及電腦）因娛樂與休閒而上網的時間相加超過16小時，列出確認。'.
do if nwork_sum>16.
compute m1560=concat('vE6=',string(vE6,f5),',vE9=',string(vE9,f5),',vE12=',string(vE12,f5),",合計=",string(nwork_sum,n4.1),"小時").
compute p1560="【B009】各項裝置（手機、平板及電腦）非因工作與課業而上網的時間相加超過16小時，列出確認".
compute s1560=2.
end if.

*'【B010】vE5、vE6使用手機上網的時間相加超過16小時。'.
do if phone_sum>16.
compute m1561=concat('vE5=',string(vE5,f5),',vE6=',string(vE6,f5),",合計=",string(phone_sum,n4.1),"小時").
compute p1561="【B010】vE5、vE6使用手機上網的時間相加超過16小時".
compute s1561=2.
end if.

*'【B011】vE8、vE9使用平板上網的時間相加超過16小時。'.
do if tablet_sum>16.
compute m1562=concat('vE8=',string(vE8,f5),',vE9=',string(vE9,f5),",合計=",string(tablet_sum,n4.1),"小時").
compute p1562="【B011】vE8、vE9使用平板上網的時間相加超過16小時".
compute s1562=2.
end if.
*'【B012】vE11、vE12使用電腦上網的時間相加超過16小時。'.
do if computer_sum>16.
compute m1563=concat('vE11=',string(vE11,f5),',vE12=',string(vE12,f5),",合計=",string(computer_sum,n4.1),"小時").
compute p1563="【B012】vE11、vE12使用電腦上網的時間相加超過16小時".
compute s1563=2.
end if.
*'【B013】vE5、vE6使用手機上網的時間相加大於vD3的時間2小時，列出確認。'.
compute D3sum=D3_1n+(D3_2n/60).
do if phone_sum>D3sum+2&not any(D3_1,97,98).
compute m1564=concat('vE5=',string(vE5,f5),',vE6=',string(vE6,f5),',vD3=',string(vD3,f5),",手機上網合計=",string(phone_sum,n4.1),"小時").
compute p1564="【B013】vE5、vE6使用手機上網的時間相加大於vD3的時間2小時，列出確認".
compute s1564=2.
end if.

do if vO5=1.
compute O5n=0.
else if vO5=2.
Compute O5n=10000.
else if vO5=3.
Compute O5n=20000.
else if vO5=4.
Compute O5n=30000.
else if vO5=5.
Compute O5n=40000.
else if vO5=6.
Compute O5n=50000.
else if vO5=7.
Compute O5n=60000.
else if vO5=8.
Compute O5n=70000.
else if vO5=9.
Compute O5n=80000.
else if vO5=10.
Compute O5n=90000.
else if vO5=11.
Compute O5n=100000.
else if vO5=12.
Compute O5n=110000.
else if vO5=13.
Compute O5n=120000.
else if vO5=14.
Compute O5n=130000.
else if vO5=15.
Compute O5n=140000.
else if vO5=16.
Compute O5n=150000.
else if vO5=17.
Compute O5n=160000.
else if vO5=18.
Compute O5n=170000.
else if vO5=19.
Compute O5n=180000.
else if vO5=20.
Compute O5n=190000.
else if vO5=21.
Compute O5n=200000.
else if vO5=22.
Compute O5n=300000.
end if.

*'【B014】vE14平均每月在網路上消費（買東西）超過O5收入題，列出確認。'.
do if vE14>O5n.
compute m1565=concat("vE14=",string(vE14,f7),',vO5=',string(vO5,F2)).
compute p1565="【B014】vE14平均每月在網路上消費（買東西）超過O5收入題，列出確認".
compute s1565=2.
end if.

*'【B015】vF2有讀雜誌（紙本），一整天看超過5小時，列出確認。'.
do if range(vF2,0501,2359).
compute m1566=concat("vF2=",string(vF2,f5)).
compute p1566="【B015】vF2有讀雜誌（紙本），一整天看超過5小時，列出確認".
compute s1566=2.
end if.

*'【B016】vF4有讀雜誌（網路），一整天看超過5小時，列出確認。'.
do if range(vF4,0501,2359).
compute m1567=concat("vF4=",string(vF4,f5)).
compute p1567="【B016】vF4有讀雜誌（網路），一整天看超過5小時，列出確認".
compute s1567=2.
end if.

*'【B017】vG2有讀報紙（紙本），一整天看超過5小時，列出確認。'.
do if range(vG2,0501,2359).
compute m1568=concat("vG2=",string(vG2,f5)).
compute p1568="【B017】vG2有讀報紙（紙本），一整天看超過5小時，列出確認".
compute s1568=2.
end if.

*'【B018】vG5有上網看新聞的那一天，一整天看超過5小時，列出確認。'.
do if range(vG5,0501,2359).
compute m1569=concat("vG5=",string(vG5,f5)).
compute p1569="【B018】vG5有上網看新聞的那一天，一整天看超過5小時，列出確認".
compute s1569=2.
end if.

*'【B019】vH1「面對面」接觸人數回答0~990且vH4「網路上」接觸人數回答0~990，在vH7「面對面」且「網路上」接觸的人數卻回答(997)不知道。'.
do if range(vH1,0,990) & range(vH4,0,990) & any(vH7,997).
compute m1570=concat("vH1=",string(vH1,F4),",vH4=",string(vH4,F4),",vH7=",string(vH7,F4)).
compute p1570="【B019】vH1「面對面」接觸人數且vH4「網路上」接觸人數回答0~990，在vH7「面對面」且「網路上」接觸的人數卻回答(997)不知道".
compute s1570=3.
end if.
*'【B020】vH7平常一天「面對面」且「網路上」接觸的人數超過30人，列出確認。'.
do if range(vH7,31,990,991,991).
compute m1571=concat("vH7=",string(vH7,F4)).
compute p1571="【B020-1】vH7平常一天「面對面」且「網路上」接觸的人數超過30人，列出確認".
compute s1571=2.
else if range(vH7_1,31,990,991,991).
compute m1571=concat("vH7_1=",string(vH7_1,F4)).
compute p1571="【B020-2】vH7_1平常一天「面對面」且「網路上」接觸的人數超過30人，列出確認".
compute s1571=2.
else if range(vH7_2,31,990,991,991).
compute m1571=concat("vH7_2=",string(vH7_2,F4)).
compute p1571="【B020-3】vH7_2平常一天「面對面」且「網路上」接觸的人數超過30人，列出確認".
compute s1571=2.
else if range(vH7_3,31,990,991,991).
compute m1571=concat("vH7_3=",string(vH7_3,F4)).
compute p1571="【B020-4】vH7_3平常一天「面對面」且「網路上」接觸的人數超過30人，列出確認".
compute s1571=2.
end if.

*'【B021】vQ24看談話性政論節目，每星期看超過35小時，列出確認。'.
do if range(vQ24g1,36,140)| (vQ24g1=35&vQ24g2>0).
compute m1572=concat('vQ24g1=',string(vQ24g1,F4)).
compute p1572="【B022】vQ24看談話性政論節目，每星期看超過35小時，列出確認".
compute s1572=2.
end if.

*'【B022】vQ21看政治人物或政治網紅影片，每星期看超過35小時，列出確認。'.
do if range(vQ21g1,36,140)| (vQ21g1=35&vQ21g2>0).
compute m1573=concat('vQ21g1=',string(vQ21g1,F4)).
compute p1573="【B022】vQ21看政治人物或政治網紅影片，每星期看超過35小時，列出確認".
compute s1573=2.
end if.

*'【B023】vQ21看政治人物或政治網紅影片，每星期看超過35小時，列出確認。'.
do if range(vQ26Ag1,36,140)| (vQ26Ag1=35&vQ26Ag2>0).
compute m1574=concat('vQ26Ag1=',string(vQ26Ag1,F4)).
compute p1574="【B022】vQ26A聽政治或公共事務播客，每星期聽超過35小時，列出確認".
compute s1574=2.
end if.

*'【B024】vQ28經常一起討論政治或公共事務的人數超過50人，列出確認。'.
do if range(vQ28,51,140).
compute m1575=concat('vQ28=',string(vQ28,F4)).
compute p1575="【B022】vQ28經常一起討論政治或公共事務的人數超過50人，列出確認".
compute s1575=2.
end if.

*'【B025】vH8經常會一起討論「個人」問題或心事的人超過50人，列出確認。'.
do if range(vH8,51,500,991,991).
compute m1576=concat("vH8=",string(vH8,f5)).
compute p1576="【B025】vH8經常會一起討論「個人」問題或心事的人超過50人，列出確認".
compute s1576=2.
end if.
*'【B026】vI2看戲劇節目的平常日（週一到週五），一整天看超過12小時，列出確認。'.
do if range(vI2,1201,2359).
compute m1577=concat("vI2=",string(vI2,f5)).
compute p1577="【B026】vI2看戲劇節目的平常日（週一到週五），一整天看超過12小時，列出確認".
compute s1577=2.
end if.

*'【B027】vI4看戲劇節目的週六或週日，一整天看超過12小時，列出確認。'.
do if range(vI4,1201,2359).
compute m1578=concat("vI4=",string(vI4,f5)).
compute p1578="【B027】vI4看戲劇節目的週六或週日，一整天看超過12小時，列出確認".
compute s1578=2.
end if.

*'【B028】vKFB2有使用臉書，一整天用超過16小時，列出確認。'.
do if range(vKFB2,1601,2359).
compute m1579=concat("vKFB2=",string(vKFB2,f5)).
compute p1579="【B028】vKFB2有使用臉書，一整天用超過16小時，列出確認".
compute s1579=2.
end if.
*'【B029】vKIG2有使用IG，一整天用超過16小時，列出確認。'.
do if range(vKIG2,1601,2359).
compute m1580=concat("vKIG2=",string(vKIG2,f5)).
compute p1580="【B029】vKIG2有使用IG，一整天用超過16小時，列出確認".
compute s1580=2.
end if.
*'【B030】vKLI2有使用LINE，一整天用超過16小時，列出確認。'.
do if range(vKLI2,1601,2359).
compute m1581=concat("vKLI2=",string(vKLI2,f5)).
compute p1581="【B030】vKLI2有使用LINE，一整天用超過16小時，列出確認".
compute s1581=2.
end if.	

*'【B031】vKTT2有使用抖音，一整天用超過16小時，列出確認。'.
do if range(vKTT2,1601,2359).
compute m1582=concat("vKTT2=",string(vKTT2,f5)).
compute p1582="【B031】vKTT2有使用抖音，一整天用超過16小時，列出確認".
compute s1582=2.
end if.	
*'【B032】vKYT2有使用YouTube，一整天用超過16小時，列出確認。'.
do if range(vKYT2,1601,2359).
compute m1583=concat("vKYT2=",string(vKLI2,f5)).
compute p1583="【B032】vKYT2有使用YouTube，一整天用超過16小時，列出確認".
compute s1583=2.
end if.	

*'【B033】vP5_2有使用Threads，一整天用超過16小時，列出確認。'.
do if range(vP5_2,1601,2359).
compute m1584=concat("vP5_2=",string(vP5_2,f5)).
compute p1584="【B033】vP5_2有使用Threads，一整天用超過16小時，列出確認".
compute s1584=2.
end if.	


*'【B034】vM1玩電玩遊戲一週超過64小時列出確認。'.
do if range(vM1g1,65,140)|(vM1g1=64&range(vM1g2,1,59)).
compute m1585=concat('vM1g1=',string(vM1g1,F4),',vM1g2=',string(vM1g2,F3)).
compute p1585="【B034】vM1玩電玩遊戲一週超過64小時，列出確認".
compute s1585=2.
end if.	

*'【B035】出生年超過民國74年次(未滿40歲者)，vO1目前工作不應為(09)已經退休。'.
do if (range(vA1,75,94) | range(vA2,1,5)) & any(vO1,9).
compute m1586=concat("vA1=",string(vA1,F2),",vA2=",string(vA2,F2),",vO1=",string(vO1,F2)).
compute p1586="【B035】出生年超過民國72年次(未滿40歲者)，vO1目前工作不應為(09)已經退休".
compute s1586=2.
end if.


*'【B036-1】市話號碼長度為9碼（北北基、台中、南投以外縣市電話），前兩碼應為03、05、06、07、08或前三碼為047、048。'.
do if 電話長度1=9 & (複查區碼="02" | 複查區碼="042" | 複查區碼="043" | 複查區碼="049" |  複查區碼="" ).
compute m1587=concat("vZ2_1g1=",char.substr(vZ2_1g1,1,30),",vZ2_1g2=",複查分機).        
compute p1587="【B036-1】(複查)市話號碼長度為9碼（北北基、台中、南投以外縣市電話），前兩碼應為03、05、06、07、08或前三碼為047、048".
compute s1587=3.
end if.

*'【B036-2】市話號碼長度為10碼（北北基、台中、南投電話），前兩碼應為02或前三碼為042、043、049。'.
do if 電話長度1=10 & (複查區碼="03" | 複查區碼="05" | 複查區碼="06" | 複查區碼="07" | 複查區碼="08" 
| 複查區碼="047" | 複查區碼="048" | 複查區碼="037" | 複查區碼="089" |  複查區碼="" ).
compute m1588=concat("vZ2_1g1=",char.substr(vZ2_1g1,1,30),",vZ2_1g2=",複查分機).         
compute p1588="【B036-2】(複查)市話號碼長度為10碼（北北基、台中、南投電話），前兩碼應為02或前三碼為042、043、049".
compute s1588=3.
end if.

*'【B036-3】市話號碼不可重複。'.

*'【B036-4】分機號碼長度超過4碼，列出確認。'.
do if  char.length(ltrim(rtrim(複查分機)))>4.
compute m1589=concat("vZ2_1g2=",char.substr(複查分機,1,10)).
compute p1589="【B036-4】Z2_1分機號碼長度超過4".
compute s1589=3.
end if.

*'【B036-5】市話號碼不應該為系統範例電話0227887792或0212345678。'.
do if any(vZ2_1g1,"0227887792","0212345678").
compute m1590=concat("vZ2_1g1=",char.substr(vZ2_1g1,1,30)).         
compute p1590="【B036-5】市話號碼不應該為系統範例電話0227887792或0212345678".
compute s1590=3.
end if.

*'【B037-1】手機號碼長度應為10碼且前兩碼應為09。'.
do if (手機開頭1~="09" ) & 可複查手機~="".
compute m1591=concat("vZ2_2=",可複查手機).
compute p1591="【B037-1】vZ2_2手機號碼長度應為10碼且前兩碼應為09".
compute s1891=3.
end if.
do if ( 手機長度1~=10) & 可複查手機~="".
compute m1591=concat("vZ2_2=",可複查手機).
compute p1591="【B037-1】vZ2_2手機號碼長度應為10碼且前兩碼應為09".
compute s1591=3.
end if.
do if (手機開頭2~="09" ) & 可追蹤手機~="".
compute m1592=concat("vZE2_2=",可追蹤手機).
compute p1592="【B037-1】ZE2_2手機號碼長度應為10碼且前兩碼應為09".
compute s1592=3.
end if.
do if ( 手機長度2~=10) & 可追蹤手機~="".
compute m1592=concat("vZE2_2=",可追蹤手機).
compute p1592="【B037-1】ZE2_2手機號碼長度應為10碼且前兩碼應為09".
compute s1592=3.
end if.

*'【B037-2】手機號碼不可重複。'.

*'【B037-3】手機號碼不應該為0912345678。'.
do if any(vZE2_1,"0912345678").
compute m1593=concat("vZE2_1=",可追蹤手機).         
compute p1593="【B037-3】vZE2_1手機號碼不應該為0912345678".
compute s1593=3.
end if.

do if any(vZ2_2,"0912345678").
compute m1594=concat("vZ2_2=",可複查手機).         
compute p1594="【B037-3】vZ2_2手機號碼不應該為0912345678".
compute s1594=3.
end if.



*'【B038-1】Email的@為全形。'.

*'【B038-2】Email帳號長度<=2。'.

*'【B038-3】Email網域長度<=4或不在網域清單內。'.

*'【B038-4】Email不可有特殊符號。'.

*'【B038-5】Email不可重複。'.



*'【B039】K1有選(11)抖音，KTT4非選(97)不知道(98)拒答者，沒有選(13)分享或轉貼、轉寄影片，也沒有選(14)傳送訊息或視訊'.
do if vK1m11=1&(vKTT4m13=0&vKTT4m14=0).
compute m1595=concat("vK1m11=",string(vK1m11,F2),",vKTT4m13=",string(vKTT4m13,F2),",vKTT4m14=",string(vKTT4m14,F2),',vQ11=',string(vQ11,F2)).
compute p1595="【B039】K1有選(11)抖音，KTT4非選(97)不知道(98)拒答者，沒有選(13)分享或轉貼、轉寄影片，也沒有選(14)傳送訊息或視訊".
compute s1595=2.
end if.

*'【B040】Q5答有透過網路接觸到政治消息，但Q6-Q9皆回答(01)從來沒有'.
do if vQ5=1&vQ6=1&vQ7=1&vQ8=1&vQ9=1.
compute m1596=concat("vQ5=",string(vQ5,F2),',vQ6=',string(vQ6,F2),',vQ7=',string(vQ7,F2),',vQ8=',string(vQ8,F2),',vQ9=',string(vQ9,F2)).
compute p1596="【B040】Q5答有透過網路接觸到政治消息，但Q6-Q9皆回答(01)從來沒有".
compute s1596=2.
end if.

*'【B041】Q10答有透過網路轉貼或分享政治消息，但Q11-Q14皆回答(01)從來沒有'.
do if vQ10=1&vQ11=1&vQ12=1&vQ13=1&vQ14=1.
compute m1597=concat("vQ10=",string(vQ10,F2),',vQ11=',string(vQ11,F2),',vQ12=',string(vQ12,F2),',vQ13=',string(vQ13,F2),',vQ14=',string(vQ14,F2)).
compute p1597="【B041】Q10答有透過網路轉貼或分享政治消息，但Q11-Q14皆回答(01)從來沒有".
compute s1597=2.
end if.

*'【B042】Q47答0分者，在Q51答(01)國民黨，請列出檢核。.
do if vQ47=0&vQ51=1.
compute m1602=concat("vQ47=",string(vQ47,F2),',vQ51=',string(vQ51,F2)).
compute p1602="【B042】Q47答0分者，在Q51答(01)國民黨，請列出檢核".
compute s1602=2.
end if.

*'【B043】Q48答0分者，在Q51答(02)民進黨，請列出檢核。.
do if vQ48=0&vQ51=2.
compute m1603=concat("vQ48=",string(vQ48,F2),',vQ51=',string(vQ51,F2)).
compute p1603="【B043】Q48答0分者，在Q51答(02)民進黨，請列出檢核".
compute s1603=2.
end if.

*'【B044】Q62答0分者，在Q51答(08)台灣民眾黨，請列出檢核。.
do if vQ62=0&vQ51=8.
compute m1604=concat("vQ62=",string(vQ62,F2),',vQ51=',string(vQ51,F2)).
compute p1604="【B044】Q62答0分者，在Q51答(08)台灣民眾黨，請列出檢核".
compute s1604=2.
end if.

*'【B045】Q53答(01)儘快統一者，P3_1答0分者，請列出檢核。.
do if vQ53=1&vP3_1=0.
compute m1605=concat("vQ53=",string(vQ53,F2),',vP3_1=',string(vP3_1,F2)).
compute p1605="【B045】Q53答(01)儘快統一者，P3_1答0分者，請列出檢核".
compute s1605=2.
end if.


*'【B046】Q53答(02)儘快宣佈獨立，P3_1答10分者，請列出檢核。.
do if vQ53=2&vP3_1=10.
compute m1606=concat("vQ53=",string(vQ53,F2),',vP3_1=',string(vP3_1,F2)).
compute p1606="【B046】Q53答(02)儘快宣佈獨立，P3_1答10分者，請列出檢核".
compute s1606=2.
end if.
exe.

****訪問紀錄檢核******2001.

***訪問紀錄不合理值.

*vZB1m01=0,1   .
do if not range(vZB1m01,0,1) | sys(vZB1m01).
compute m2001=concat("vZB1m01=",string(vZB1m01,F2)).
compute p2001="vZB1m01 為不合理值或遺漏值".
compute s2001=1.
end if.
 

*vZB1m02=0,1   .
do if not range(vZB1m02,0,1) | sys(vZB1m02).
compute m2002=concat("vZB1m02=",string(vZB1m02,F2)).
compute p2002="vZB1m02 為不合理值或遺漏值".
compute s2002=1.
end if.
 

*vZB1m03=0,1   .
do if not range(vZB1m03,0,1) | sys(vZB1m03).
compute m2003=concat("vZB1m03=",string(vZB1m03,F2)).
compute p2003="vZB1m03 為不合理值或遺漏值".
compute s2003=1.
end if.
 

*vZB2=1,3   .
do if not range(vZB2,1,3) | sys(vZB2).
compute m2004=concat("vZB2=",string(vZB2,F2)).
compute p2004="vZB2 為不合理值或遺漏值".
compute s2004=1.
end if.
 

*vZB3m01=0,1   .
do if not range(vZB3m01,0,1) | sys(vZB3m01).
compute m2005=concat("vZB3m01=",string(vZB3m01,F2)).
compute p2005="vZB3m01 為不合理值或遺漏值".
compute s2005=1.
end if.
 

*vZB3m02=0,1   .
do if not range(vZB3m02,0,1) | sys(vZB3m02).
compute m2006=concat("vZB3m02=",string(vZB3m02,F2)).
compute p2006="vZB3m02 為不合理值或遺漏值".
compute s2006=1.
end if.
 

*vZB3m03=0,1   .
do if not range(vZB3m03,0,1) | sys(vZB3m03).
compute m2007=concat("vZB3m03=",string(vZB3m03,F2)).
compute p2007="vZB3m03 為不合理值或遺漏值".
compute s2007=1.
end if.
 

*vZB3m04=0,1   .
do if not range(vZB3m04,0,1) | sys(vZB3m04).
compute m2008=concat("vZB3m04=",string(vZB3m04,F2)).
compute p2008="vZB3m04 為不合理值或遺漏值".
compute s2008=1.
end if.
 

*vZB3m05=0,1   .
do if not range(vZB3m05,0,1) | sys(vZB3m05).
compute m2009=concat("vZB3m05=",string(vZB3m05,F2)).
compute p2009="vZB3m05 為不合理值或遺漏值".
compute s2009=1.
end if.
 

*vZB3m06=0,1   .
do if not range(vZB3m06,0,1) | sys(vZB3m06).
compute m2010=concat("vZB3m06=",string(vZB3m06,F2)).
compute p2010="vZB3m06 為不合理值或遺漏值".
compute s2010=1.
end if.
 

*vZB3m07=0,1   .
 * do if not range(vZB3m07,0,1) | sys(vZB3m07).
 * compute m2011=concat("vZB3m07=",string(vZB3m07,F2)).
 * compute p2011="vZB3m07 為不合理值或遺漏值".
 * compute s2011=1.
 * end if.
 

*vZB4=1,7   .
do if not range(vZB4,1,6) | sys(vZB4).
compute m2012=concat("vZB4=",string(vZB4,F2)).
compute p2012="vZB4 為不合理值或遺漏值".
compute s2012=1.
end if.
 

*vZB5_1=1,4   .
do if not range(vZB5_1,1,4) | sys(vZB5_1).
compute m2013=concat("vZB5_1=",string(vZB5_1,F2)).
compute p2013="vZB5_1 為不合理值或遺漏值".
compute s2013=1.
end if.
 

*vZB5_2=1,2   .
do if not range(vZB5_2,1,2) | sys(vZB5_2).
compute m2014=concat("vZB5_2=",string(vZB5_2,F2)).
compute p2014="vZB5_2 為不合理值或遺漏值".
compute s2014=1.
end if.
 

*vZB6=1,2   .
do if not range(vZB6,1,2) | sys(vZB6).
compute m2015=concat("vZB6=",string(vZB6,F2)).
compute p2015="vZB6 為不合理值或遺漏值".
compute s2015=1.
end if.
 

*vZB7m01=0,1 96  .
do if not range(vZB7m01,0,1,96,96) | sys(vZB7m01).
compute m2016=concat("vZB7m01=",string(vZB7m01,F2)).
compute p2016="vZB7m01 為不合理值或遺漏值".
compute s2016=1.
end if.
 

*vZB7m02=0,1 96  .
do if not range(vZB7m02,0,1,96,96) | sys(vZB7m02).
compute m2017=concat("vZB7m02=",string(vZB7m02,F2)).
compute p2017="vZB7m02 為不合理值或遺漏值".
compute s2017=1.
end if.
 

*vZB7m03=0,1 96  .
do if not range(vZB7m03,0,1,96,96) | sys(vZB7m03).
compute m2018=concat("vZB7m03=",string(vZB7m03,F2)).
compute p2018="vZB7m03 為不合理值或遺漏值".
compute s2018=1.
end if.
 

*vZB7m04=0,1 96  .
do if not range(vZB7m04,0,1,96,96) | sys(vZB7m04).
compute m2019=concat("vZB7m04=",string(vZB7m04,F2)).
compute p2019="vZB7m04 為不合理值或遺漏值".
compute s2019=1.
end if.
 

*vZB7m05=0,1 96  .
do if not range(vZB7m05,0,1,96,96) | sys(vZB7m05).
compute m2019=concat("vZB7m04=",string(vZB7m04,F2)).
compute p2019="vZB7m04 為不合理值或遺漏值".
compute s2019=1.
end if.
 

*vZB7m06=0,1 96  .
do if not range(vZB7m06,0,1,96,96) | sys(vZB7m06).
compute m2019=concat("vZB7m04=",string(vZB7m04,F2)).
compute p2019="vZB7m04 為不合理值或遺漏值".
compute s2019=1.
end if.
 

*vZB7m07=0,1 96  .
do if not range(vZB7m07,0,1,96,96) | sys(vZB7m07).
compute m2022=concat("vZB7m07=",string(vZB7m07,F2)).
compute p2022="vZB7m07 為不合理值或遺漏值".
compute s2022=1.
end if.
 

*vZB7m08=0,1 96  .
do if not range(vZB7m08,0,1,96,96) | sys(vZB7m08).
compute m2023=concat("vZB7m08=",string(vZB7m08,F2)).
compute p2023="vZB7m08 為不合理值或遺漏值".
compute s2023=1.
end if.
 

*vZB7m09=0,1 96  .
do if not range(vZB7m09,0,1,96,96) | sys(vZB7m09).
compute m2024=concat("vZB7m09=",string(vZB7m09,F2)).
compute p2024="vZB7m09 為不合理值或遺漏值".
compute s2024=1.
end if.
 

*vZB7m10=0,1 96  .
do if not range(vZB7m10,0,1,96,96) | sys(vZB7m10).
compute m2025=concat("vZB7m10=",string(vZB7m10,F2)).
compute p2025="vZB7m10 為不合理值或遺漏值".
compute s2025=1.
end if.
 

*vZB7m11=0,1 96  .
do if not range(vZB7m11,0,1,96,96) | sys(vZB7m11).
compute m2026=concat("vZB7m11=",string(vZB7m11,F2)).
compute p2026="vZB7m11 為不合理值或遺漏值".
compute s2026=1.
end if.
 

*vZB8=1,2 96  .
do if not range(vZB8,1,2,96,96) | sys(vZB8).
compute m2027=concat("vZB8=",string(vZB8,F2)).
compute p2027="vZB8 為不合理值或遺漏值".
compute s2027=1.
end if.
 

*vZB9m01=0,1   .
do if not range(vZB9m01,0,1) | sys(vZB9m01).
compute m2028=concat("vZB9m01=",string(vZB9m01,F2)).
compute p2028="vZB9m01 為不合理值或遺漏值".
compute s2028=1.
end if.
 

*vZB9m02=0,1   .
do if not range(vZB9m02,0,1) | sys(vZB9m02).
compute m2029=concat("vZB9m02=",string(vZB9m02,F2)).
compute p2029="vZB9m02 為不合理值或遺漏值".
compute s2029=1.
end if.
 

*vZB9m03=0,1   .
do if not range(vZB9m03,0,1) | sys(vZB9m03).
compute m2030=concat("vZB9m03=",string(vZB9m03,F2)).
compute p2030="vZB9m03 為不合理值或遺漏值".
compute s2030=1.
end if.
 

*vZB9m04=0,1   .
do if not range(vZB9m04,0,1) | sys(vZB9m04).
compute m2031=concat("vZB9m04=",string(vZB9m04,F2)).
compute p2031="vZB9m04 為不合理值或遺漏值".
compute s2031=1.
end if.
 

*vZB9m05=0,1   .
do if not range(vZB9m05,0,1) | sys(vZB9m05).
compute m2032=concat("vZB9m05=",string(vZB9m05,F2)).
compute p2032="vZB9m05 為不合理值或遺漏值".
compute s2032=1.
end if.
 

*vZB9m06=0,1   .
do if not range(vZB9m06,0,1) | sys(vZB9m06).
compute m2033=concat("vZB9m06=",string(vZB9m06,F2)).
compute p2033="vZB9m06 為不合理值或遺漏值".
compute s2033=1.
end if.
 

*vZC1m01=0,1   .
do if not range(vZC1m01,0,1) | sys(vZC1m01).
compute m2034=concat("vZC1m01=",string(vZC1m01,F2)).
compute p2034="vZC1m01 為不合理值或遺漏值".
compute s2034=1.
end if.
 

*vZC1m02=0,1   .
do if not range(vZC1m02,0,1) | sys(vZC1m02).
compute m2035=concat("vZC1m02=",string(vZC1m02,F2)).
compute p2035="vZC1m02 為不合理值或遺漏值".
compute s2035=1.
end if.
 

*vZC1m03=0,1   .
do if not range(vZC1m03,0,1) | sys(vZC1m03).
compute m2036=concat("vZC1m03=",string(vZC1m03,F2)).
compute p2036="vZC1m03 為不合理值或遺漏值".
compute s2036=1.
end if.
 

*vZC1m04=0,1   .
do if not range(vZC1m04,0,1) | sys(vZC1m04).
compute m2037=concat("vZC1m04=",string(vZC1m04,F2)).
compute p2037="vZC1m04 為不合理值或遺漏值".
compute s2037=1.
end if.
 

*vZC2=1,5   .
do if not range(vZC2,1,5) | sys(vZC2).
compute m2038=concat("vZC2=",string(vZC2,F2)).
compute p2038="vZC2 為不合理值或遺漏值".
compute s2038=1.
end if.
 

*vZC3=1,5   .
do if not range(vZC3,1,5) | sys(vZC3).
compute m2039=concat("vZC3=",string(vZC3,F2)).
compute p2039="vZC3 為不合理值或遺漏值".
compute s2039=1.
end if.
 

*vZC4=1,5   .
do if not range(vZC4,1,5) | sys(vZC4).
compute m2040=concat("vZC4=",string(vZC4,F2)).
compute p2040="vZC4 為不合理值或遺漏值".
compute s2040=1.
end if.
 

*vZC5=1,5   .
do if not range(vZC5,1,5) | sys(vZC5).
compute m2041=concat("vZC5=",string(vZC5,F2)).
compute p2041="vZC5 為不合理值或遺漏值".
compute s2041=1.
end if.
 

*vEND=20260615000000,20240930000000 9969696969696  .
do if not range(vEND,20260615000000,20260930000000,9969696969696,9969696969696) | sys(vEND).
compute m2042=concat("vEND=",string(vEND,n14)).
compute p2042="vEND 為不合理值或遺漏值".
compute s2042=1.
end if.
 



***訪問紀錄-開放題.

*vZB1m01 開放欄位檢核 是否為複選題=1.
do if vZB1m01=1 & vZB1o01="".
Compute m2050=concat("vZB1m01=",string(vZB1m01,F2),",vZB1o01=",char.substr(vZB1o01,1,150)).
compute p2050="vZB1m01開放欄位該答未答".
compute s2050=1.
else if vZB1m01~=1 & vZB1o01~="".
compute m2050=concat("vZB1m01=",string(vZB1m01,F2),",vZB1o01=",char.substr(vZB1o01,1,150)).
compute p2050="vZB1m01開放欄位不該答卻答".
compute s2050=1.
else if vZB1m01=1 & vZB1o01~="".
compute m2050=concat("vZB1m01=",string(vZB1m01,F2),",vZB1o01=",char.substr(vZB1o01,1,150)).
compute p2050="vZB1m01開放欄位答案確認".
compute s2050=1.
end if.


 

*vZB1m02 開放欄位檢核 是否為複選題=1.
do if vZB1m02=1 & vZB1o02="".
Compute m2051=concat("vZB1m02=",string(vZB1m02,F2),",vZB1o02=",char.substr(vZB1o02,1,150)).
compute p2051="vZB1m02開放欄位該答未答".
compute s2051=1.
else if vZB1m02~=1 & vZB1o02~="".
compute m2051=concat("vZB1m02=",string(vZB1m02,F2),",vZB1o02=",char.substr(vZB1o02,1,150)).
compute p2051="vZB1m02開放欄位不該答卻答".
compute s2051=1.
else if vZB1m02=1 & vZB1o02~="".
compute m2051=concat("vZB1m02=",string(vZB1m02,F2),",vZB1o02=",char.substr(vZB1o02,1,150)).
compute p2051="vZB1m02開放欄位答案確認".
compute s2051=1.
end if.
Exec.

 

*vZB3m06 開放欄位檢核 是否為複選題=1.
do if vZB3m06=1 & vZB3o06="".
Compute m2052=concat("vZB3m06=",string(vZB3m06,F2),",vZB3o06=",char.substr(vZB3o06,1,150)).
compute p2052="vZB3m06開放欄位該答未答".
compute s2052=1.
else if vZB3m06~=1 & vZB3o06~="".
compute m2052=concat("vZB3m06=",string(vZB3m06,F2),",vZB3o06=",char.substr(vZB3o06,1,150)).
compute p2052="vZB3m06開放欄位不該答卻答".
compute s2052=1.
else if vZB3m06=1 & vZB3o06~="".
compute m2052=concat("vZB3m06=",string(vZB3m06,F2),",vZB3o06=",char.substr(vZB3o06,1,150)).
compute p2052="vZB3m06開放欄位答案確認".
compute s2052=1.
end if.


 

*vZB4 開放欄位檢核 是否為複選題=0.
do if vZB4=6 & vZB4o06="".
Compute m2053=concat("vZB4=",string(vZB4,F2),",vZB4o06=",char.substr(vZB4o06,1,150)).
compute p2053="vZB4開放欄位該答未答".
compute s2053=1.
else if vZB4~=6 & vZB4o06~="".
compute m2053=concat("vZB4=",string(vZB4,F2),",vZB4o06=",char.substr(vZB4o06,1,150)).
compute p2053="vZB4開放欄位不該答卻答".
compute s2053=1.
else if vZB4=6 & vZB4o06~="".
compute m2053=concat("vZB4=",string(vZB4,F2),",vZB4o06=",char.substr(vZB4o06,1,150)).
compute p2053="vZB4開放欄位答案確認".
compute s2053=1.
end if.


 

*vZB5_1 開放欄位檢核 是否為複選題=0.
do if vZB5_1=3 & vZB5_1o03="".
Compute m2054=concat("vZB5_1=",string(vZB5_1,F2),",vZB5_1o03=",char.substr(vZB5_1o03,1,150)).
compute p2054="vZB5_1開放欄位該答未答".
compute s2054=1.
else if vZB5_1~=3 & vZB5_1o03~="".
compute m2054=concat("vZB5_1=",string(vZB5_1,F2),",vZB5_1o03=",char.substr(vZB5_1o03,1,150)).
compute p2054="vZB5_1開放欄位不該答卻答".
compute s2054=1.
else if vZB5_1=3 & vZB5_1o03~="".
compute m2054=concat("vZB5_1=",string(vZB5_1,F2),",vZB5_1o03=",char.substr(vZB5_1o03,1,150)).
compute p2054="vZB5_1開放欄位答案確認".
compute s2054=1.
end if.


 

*vZB5_1 開放欄位檢核 是否為複選題=0.
do if vZB5_1=4 & vZB5_1o04="".
Compute m2055=concat("vZB5_1=",string(vZB5_1,F2),",vZB5_1o04=",char.substr(vZB5_1o04,1,150)).
compute p2055="vZB5_1開放欄位該答未答".
compute s2055=1.
else if vZB5_1~=4 & vZB5_1o04~="".
compute m2055=concat("vZB5_1=",string(vZB5_1,F2),",vZB5_1o04=",char.substr(vZB5_1o04,1,150)).
compute p2055="vZB5_1開放欄位不該答卻答".
compute s2055=1.
else if vZB5_1=4 & vZB5_1o04~="".
compute m2055=concat("vZB5_1=",string(vZB5_1,F2),",vZB5_1o04=",char.substr(vZB5_1o04,1,150)).
compute p2055="vZB5_1開放欄位答案確認".
compute s2055=1.
end if.


 

*vZB7m11 開放欄位檢核 是否為複選題=1.
do if vZB7m11=1 & vZB7o11="".
Compute m2056=concat("vZB7m11=",string(vZB7m11,F2),",vZB7o11=",char.substr(vZB7o11,1,150)).
compute p2056="vZB7m11開放欄位該答未答".
compute s2056=1.
else if vZB7m11~=1 & vZB7o11~="".
compute m2056=concat("vZB7m11=",string(vZB7m11,F2),",vZB7o11=",char.substr(vZB7o11,1,150)).
compute p2056="vZB7m11開放欄位不該答卻答".
compute s2056=1.
else if vZB7m11=1 & vZB7o11~="".
compute m2056=concat("vZB7m11=",string(vZB7m11,F2),",vZB7o11=",char.substr(vZB7o11,1,150)).
compute p2056="vZB7m11開放欄位答案確認".
compute s2056=1.
end if.


 

*vZB8 開放欄位檢核 是否為複選題=0.
do if vZB8=1 & vZB8o01="".
Compute m2057=concat("vZB8=",string(vZB8,F2),",vZB8o01=",char.substr(vZB8o01,1,150)).
compute p2057="vZB8開放欄位該答未答".
compute s2057=1.
else if vZB8~=1 & vZB8o01~="".
compute m2057=concat("vZB8=",string(vZB8,F2),",vZB8o01=",char.substr(vZB8o01,1,150)).
compute p2057="vZB8開放欄位不該答卻答".
compute s2057=1.
 * else if vZB8=1 & vZB8o01~="".
 * compute m2057=concat("vZB8=",string(vZB8,F2),",vZB8o01=",char.substr(vZB8o01,1,150)).
 * compute p2057="vZB8開放欄位答案確認".
 * compute s2057=1.
end if.


 

*vZB9m03 開放欄位檢核 是否為複選題=1.
do if vZB9m03=1 & vZB9o03="".
Compute m2058=concat("vZB9m03=",string(vZB9m03,F2),",vZB9o03=",char.substr(vZB9o03,1,150)).
compute p2058="vZB9m03開放欄位該答未答".
compute s2058=1.
else if vZB9m03~=1 & vZB9o03~="".
compute m2058=concat("vZB9m03=",string(vZB9m03,F2),",vZB9o03=",char.substr(vZB9o03,1,150)).
compute p2058="vZB9m03開放欄位不該答卻答".
compute s2058=1.
else if vZB9m03=1 & vZB9o03~=""& today>20260726.
compute m2058=concat("vZB9m03=",string(vZB9m03,F2),",vZB9o03=",char.substr(vZB9o03,1,150)).
compute p2058="vZB9m03開放欄位答案確認".
compute s2058=1.
end if.


 

*vZB9m04 開放欄位檢核 是否為複選題=1.
do if vZB9m04=1 & vZB9o04="".
Compute m2059=concat("vZB9m04=",string(vZB9m04,F2),",vZB9o04=",char.substr(vZB9o04,1,150)).
compute p2059="vZB9m04開放欄位該答未答".
compute s2059=1.
else if vZB9m04~=1 & vZB9o04~="".
compute m2059=concat("vZB9m04=",string(vZB9m04,F2),",vZB9o04=",char.substr(vZB9o04,1,150)).
compute p2059="vZB9m04開放欄位不該答卻答".
compute s2059=1.
else if vZB9m04=1 & vZB9o04~=""& today>20260726.
compute m2059=concat("vZB9m04=",string(vZB9m04,F2),",vZB9o04=",char.substr(vZB9o04,1,150)).
compute p2059="vZB9m04開放欄位答案確認".
compute s2059=1.
end if.


 

*vZB9m05 開放欄位檢核 是否為複選題=1.
do if vZB9m05=1 & vZB9o05="".
Compute m2060=concat("vZB9m05=",string(vZB9m05,F2),",vZB9o05=",char.substr(vZB9o05,1,150)).
compute p2060="vZB9m05開放欄位該答未答".
compute s2060=1.
else if vZB9m05~=1 & vZB9o05~="".
compute m2060=concat("vZB9m05=",string(vZB9m05,F2),",vZB9o05=",char.substr(vZB9o05,1,150)).
compute p2060="vZB9m05開放欄位不該答卻答".
compute s2060=1.
else if vZB9m05=1 & vZB9o05~="".
compute m2060=concat("vZB9m05=",string(vZB9m05,F2),",vZB9o05=",char.substr(vZB9o05,1,150)).
compute p2060="vZB9m05開放欄位答案確認".
compute s2060=1.
end if.


 

*vZC3 開放欄位檢核 是否為複選題=0.
do if vZC3=1 & vZC3o01="".
Compute m2061=concat("vZC3=",string(vZC3,F2),",vZC3o01=",char.substr(vZC3o01,1,150)).
compute p2061="vZC3開放欄位該答未答".
compute s2061=1.
else if vZC3~=1 & vZC3o01~="".
compute m2061=concat("vZC3=",string(vZC3,F2),",vZC3o01=",char.substr(vZC3o01,1,150)).
compute p2061="vZC3開放欄位不該答卻答".
compute s2061=1.
else if vZC3=1 & vZC3o01~=""& today>20260726.
compute m2061=concat("vZC3=",string(vZC3,F2),",vZC3o01=",char.substr(vZC3o01,1,150)).
compute p2061="vZC3開放欄位答案確認".
compute s2061=1.
end if.


 

*vZC3 開放欄位檢核 是否為複選題=0.
do if vZC3=2 & vZC3o02="".
Compute m2062=concat("vZC3=",string(vZC3,F2),",vZC3o02=",char.substr(vZC3o02,1,150)).
compute p2062="vZC3開放欄位該答未答".
compute s2062=1.
else if vZC3~=2 & vZC3o02~="".
compute m2062=concat("vZC3=",string(vZC3,F2),",vZC3o02=",char.substr(vZC3o02,1,150)).
compute p2062="vZC3開放欄位不該答卻答".
compute s2062=1.
else if vZC3=2 & vZC3o02~=""& today>20260726.
compute m2062=concat("vZC3=",string(vZC3,F2),",vZC3o02=",char.substr(vZC3o02,1,150)).
compute p2062="vZC3開放欄位答案確認".
compute s2062=1.
end if.
Exec.



***訪問紀錄複選題.

*ZB1至少選1項.
vector a=vZB1m01 to vZB1m03.
loop #i=1 to 2.
do if  (any(a(#i),0,1) & any(a(#i+1),96,97,98)) |
 (any(a(#i),96) & not any(a(#i+1),96)) |
 (any(a(#i),97) & not any(a(#i+1),97)) |
 (any(a(#i),98) & not any(a(#i+1),98)) |
 (sum(vZB1m01 to vZB1m03)=0).
compute m2063=CONCAT('vZB1m01=',string(vZB1m01,F2),',vZB1m02=',string(vZB1m02,F2),',vZB1m03=',string(vZB1m03,F2)).
compute p2063="ZB1至少選1項或選特殊碼應一致".
compute s2063=1.
end if.
end loop.
exec.
*ZB3至少選1項.
vector a=vZB3m01 to vZB3m06.
loop #i=1 to 5.
do if  (any(a(#i),0,1) & any(a(#i+1),96,97,98)) |
 (any(a(#i),96) & not any(a(#i+1),96)) |
 (any(a(#i),97) & not any(a(#i+1),97)) |
 (any(a(#i),98) & not any(a(#i+1),98)) |
 (sum(vZB3m01 to vZB3m06)=0).
compute m2064=CONCAT('vZB3m01=',string(vZB3m01,F2),',vZB3m02=',string(vZB3m02,F2),',vZB3m03=',string(vZB3m03,F2),
',vZB3m04=',string(vZB3m04,F2),',vZB3m05=',string(vZB3m05,F2),',vZB3m06=',string(vZB3m06,F2)).
compute p2064="ZB3至少選1項或選特殊碼應一致".
compute s2064=1.
end if.
end loop.
exec.

*ZB7至少選1項.
vector a=vZB7m01 to vZB7m11.
loop #i=1 to 10.
do if  (any(a(#i),0,1) & any(a(#i+1),96,97,98)) |
 (any(a(#i),96) & not any(a(#i+1),96)) |
 (any(a(#i),97) & not any(a(#i+1),97)) |
 (any(a(#i),98) & not any(a(#i+1),98)) |
 (sum(vZB7m01 to vZB7m11)=0).
compute m2065=CONCAT('vZB7m01=',string(vZB7m01,F2),',vZB7m02=',string(vZB7m02,F2),',vZB7m03=',string(vZB7m03,F2),',vZB7m04=',string(vZB7m04,F2),
',vZB7m05=',string(vZB7m05,F2),',vZB7m06=',string(vZB7m06,F2),',vZB7m07=',string(vZB7m07,F2),',vZB7m08=',string(vZB7m08,F2),',vZB7m09=',string(vZB7m09,F2),
',vZB7m10=',string(vZB7m10,F2),',vZB7m11=',string(vZB7m11,F2)).
compute p2065="ZB7至少選1項或選特殊碼應一致".
compute s2065=1.
end if.
end loop.
exec.

*ZB9至少選1項.
vector a=vZB9m01 to vZB9m06.
loop #i=1 to 5.
do if  (any(a(#i),0,1) & any(a(#i+1),96,97,98)) |
 (any(a(#i),96) & not any(a(#i+1),96)) |
 (any(a(#i),97) & not any(a(#i+1),97)) |
 (any(a(#i),98) & not any(a(#i+1),98)) |
 (sum(vZB9m01 to vZB9m06)=0).
compute m2066=CONCAT('vZB9m01=',string(vZB9m01,F2),',vZB9m02=',string(vZB9m02,F2),',vZB9m03=',string(vZB9m03,F2),
',vZB9m04=',string(vZB9m04,F2),',vZB9m05=',string(vZB9m05,F2),',vZB9m06=',string(vZB9m06,F2)).
compute p2066="ZB9至少選1項或選特殊碼應一致".
compute s2066=1.
end if.
end loop.
exec.


*ZC1至少選1項.
vector a=vZC1m01 to vZC1m04.
loop #i=1 to 3.
do if  (any(a(#i),0,1) & any(a(#i+1),96,97,98)) |
 (any(a(#i),96) & not any(a(#i+1),96)) |
 (any(a(#i),97) & not any(a(#i+1),97)) |
 (any(a(#i),98) & not any(a(#i+1),98)) |
 (sum(vZC1m01 to vZC1m04)=0).
compute m2067=CONCAT('vZC1m01=',string(vZC1m01,F2),',vZC1m02=',string(vZC1m02,F2),',vZC1m03=',string(vZC1m03,F2),',vZC1m04=',string(vZC1m04,F2)).
compute p2067="ZC1至少選1項或選特殊碼應一致".
compute s2067=1.
end if.
end loop.
exec.

***訪問紀錄互斥.
*ZB1互斥.
do if any(vZB1m03,1) & any(1,vZB1m01 to vZB1m02) .
compute m2074=concat("vZB1m01=",string(vZB1m01,F2),",vZB1m02=",string(vZB1m02,F2),",vZB1m03=",string(vZB1m03,F2)).
compute p2074="ZB1選3，應與其他選項互斥".
compute s2074=1.
end if.

*ZB9互斥.
do if any(vZB9m06,1) & any(1,vZB9m01 to vZB9m05) .
compute m2068=concat("vZB9m01=",string(vZB9m01,F2),",vZB9m02=",string(vZB9m02,F2),",vZB9m03=",string(vZB9m03,F2),",vZB9m04=",string(vZB9m04,F2),
",vZB9m05=",string(vZB9m05,F2),",vZB9m06=",string(vZB9m06,F2)).
compute p2068="ZB9選6，應與其他選項互斥".
compute s2068=1.
end if.


*ZC1互斥.
do if any(vZC1m04,1) & any(1,vZC1m01 to vZC1m03) .
compute m2069=concat("vZC1m01=",string(vZC1m01,F2),",vZC1m02=",string(vZC1m02,F2),
",vZC1m03=",string(vZC1m03,F2),",vZC1m04=",string(vZC1m04,F2)).
compute p2069="ZC1選4，應與其他選項互斥".
compute s2069=1.
end if.


****訪問紀錄跳題*****.

*vZB6為1續問ZB7 .
do if vZB6=1 & any(96,vZB7m01 to vZB7m11) .
compute m2070=CONCAT("vZB6=",STRING(vZB6,F2),
",vZB7m01=",STRING(vZB7m01,F2),",vZB7m02=",STRING(vZB7m02,F2),",vZB7m03=",STRING(vZB7m03,F2),",vZB7m04=",STRING(vZB7m04,F2),",vZB7m05=",STRING(vZB7m05,F2),
",vZB7m06=",STRING(vZB7m06,F2),",vZB7m07=",STRING(vZB7m07,F2),",vZB7m08=",STRING(vZB7m08,F2),",vZB7m09=",STRING(vZB7m09,F2),",vZB7m10=",STRING(vZB7m10,F2),
",vZB7m11=",STRING(vZB7m11,F2)).
compute p2070="vZB6答1，ZB7不應跳答 ".
compute s2070=1.
else if vZB6~=1 & (any(1,vZB7m01 to vZB7m11)|any(0,vZB7m01 to vZB7m11) ).
compute m2070=CONCAT("vZB6=",STRING(vZB6,F2),
",vZB7m01=",STRING(vZB7m01,F2),",vZB7m02=",STRING(vZB7m02,F2),",vZB7m03=",STRING(vZB7m03,F2),",vZB7m04=",STRING(vZB7m04,F2),",vZB7m05=",STRING(vZB7m05,F2),
",vZB7m06=",STRING(vZB7m06,F2),",vZB7m07=",STRING(vZB7m07,F2),",vZB7m08=",STRING(vZB7m08,F2),",vZB7m09=",STRING(vZB7m09,F2),",vZB7m10=",STRING(vZB7m10,F2),
",vZB7m11=",STRING(vZB7m11,F2)).
compute p2070="vZB6非答1，ZB7應跳答 ".
compute s2070=1.
end if.

*vZB6為1續問vZB8.
do if vZB6=1 &vZB8=96 .
compute m2071=CONCAT("vZB6=",STRING(vZB6,F2),",vZB8=",STRING(vZB8,F2)).
compute p2071="vZB6答1，ZB8不應跳答 ".
compute s2071=1.
else if vZB6~=1 & vZB8~=96.
compute m2071=CONCAT("vZB6=",STRING(vZB6,F2),",vZB8=",STRING(vZB8,F2)).
compute p2071="vZB6非答1，ZB8應跳答 ".
compute s2071=1.
end if.


*ZB3與ZB4繼承邏輯.
do if  (vZB3m01~=1 & vZB4=1) | (vZB3m02~=1 & vZB4=2) |  (vZB3m03~=1 & vZB4=3) |  (vZB3m04~=1 & vZB4=4) |
 (vZB3m05~=1 & vZB4=5) |  (vZB3m06~=1 & vZB4=6) .
compute m2072=concat("vZB3m01=",string(vZB3m01,F2),",vZB3m02=",string(vZB3m02,F2),",vZB3m03=",string(vZB3m03,F2),
",vZB3m04=",string(vZB3m04,F2),",vZB3m05=",string(vZB3m05,F2),",vZB3m06=",string(vZB3m06,F2),
",vZB4=",string(vZB4,F2),",vZB4o06=",char.substr(vZB4o06,1,150)).
compute p2072="ZB4選項應繼承ZB3".
compute s2072=1.
end if.





*ZX檢核.
do if char.index(vZX,"＠")>0|char.index(vZX,"@")>0.
compute m2073=concat("vZX=",char.substr(vZX,1,300)).
compute p2073="【X001】ZX含有@  的檢核項".
compute s2073=3.
end if.
EXECUTE.





SORT CASES by id.

SAVE OUTFILE="\\140.109.171.240\worker\worker_sec\面訪協辦計畫\F202603傳播調查資料庫第四期第一次正式調查\10資料檔及不符合品\05檢核程式\問卷檢核程式\歷程\問卷檢核結果-問卷檢核_aca.sav"
/COMPRESSED.

match files
/file="\\140.109.171.240\worker\worker_sec\面訪協辦計畫\F202603傳播調查資料庫第四期第一次正式調查\10資料檔及不符合品\05檢核程式\問卷檢核程式\歷程\問卷檢核結果-問卷檢核_aca.sav"
/file="\\140.109.171.240\worker\worker_sec\面訪協辦計畫\F202603傳播調查資料庫第四期第一次正式調查\10資料檔及不符合品\05檢核程式\問卷檢核程式\歷程\電話重複性檢核結果.sav"
/file="\\140.109.171.240\worker\worker_sec\面訪協辦計畫\F202603傳播調查資料庫第四期第一次正式調查\10資料檔及不符合品\05檢核程式\問卷檢核程式\歷程\Email檢核結果f.sav"
/by id.

SAVE OUTFILE="\\140.109.171.240\worker\worker_sec\面訪協辦計畫\F202603傳播調查資料庫第四期第一次正式調查\10資料檔及不符合品\05檢核程式\問卷檢核程式\歷程\問卷檢核結果-問卷檢核_ac.sav"
/COMPRESSED.

STRING 檢核類型  處理順序  (A150).
COMPUTE 檢核類型="問卷檢核".

***********************************************************************************************************************.
*產出不符合品資料檔.
*****資料轉置.
sort cases by lno id .

VARSTOCASES  
 /MAKE 錯誤說明 from p101 to p2200  手機p1 手機p2 市話p Email_p
 /MAKE 錯誤狀況 from m101 to m2200 手機m1 手機m2 市話m Email_m
 /MAKE 使用對象 from s101 to s2200 手機s1 手機s2 市話s Email_s
 /KEEP =today id fno lno last note_i note_s  vZX 訪員訪期 週次 檢核類型 處理順序 提示卡
 /null = drop                                                                         
 /count = count.  


COMPUTE 處理順序="基本項目".
ALTER TYPE  錯誤說明 錯誤狀況(a1200).
EXECUTE.

***********************************************************************************************************************.
SAVE OUTFILE="\\140.109.171.240\worker\worker_sec\面訪協辦計畫\F202603傳播調查資料庫第四期第一次正式調查\10資料檔及不符合品\05檢核程式\問卷檢核程式\歷程\問卷檢核結果-問卷檢核_acf.sav".
exec.


**先合併兩報表.
add files
/file="\\140.109.171.240\worker\worker_sec\面訪協辦計畫\F202603傳播調查資料庫第四期第一次正式調查\10資料檔及不符合品\05檢核程式\問卷檢核程式\歷程\問卷檢核結果-基本檢核_acf.sav"
/file="\\140.109.171.240\worker\worker_sec\面訪協辦計畫\F202603傳播調查資料庫第四期第一次正式調查\10資料檔及不符合品\05檢核程式\問卷檢核程式\歷程\問卷檢核結果-問卷檢核_acf.sav".
exec.

do if char.index(錯誤說明,"【A").
COMPUTE 處理順序="檢核項目A邏輯".
else if char.index(錯誤說明,"【B").
COMPUTE 處理順序="檢核項目B邏輯".
end if.

sort cases id 錯誤說明.

do if 使用對象=1.
COMPUTE 檢核類型="問卷檢核_協辦".
ELSE if 使用對象=2.
COMPUTE 檢核類型="問卷檢核_計畫".
ELSE if 使用對象=3.
COMPUTE 檢核類型="問卷檢核_品管".
end if.

EXECUTE.

save outfile="\\140.109.171.240\worker\worker_sec\面訪協辦計畫\F202603傳播調查資料庫第四期第一次正式調查\10資料檔及不符合品\05檢核程式\問卷檢核程式\歷程\問卷檢核結果_acf.sav".
exec.

GET  FILE='\\140.109.171.240\worker\worker_sec\面訪協辦計畫\F202603傳播調查資料庫第四期第一次正式調查\10資料檔及不符合品\05檢核程式\問卷檢核程式\歷程\問卷檢核結果_acf.sav'.

alter type id (a20).
compute id = RTRIM(LTRIM(id)).

*讀入每週不再列出程式檔.
*7/1.
 * INSERT FILE="\\140.109.171.240\worker\worker_sec\面訪協辦計畫\F202603傳播調查資料庫第四期第一次正式調查\10資料檔及不符合品\05檢核程式\問卷檢核程式\歷程\整理報表結果\09-不再列出修改程式_協辦0701.sps"
  SYNTAX=INTERACTIVE  ERROR=STOP CD=YES ENCODING='UTF8'.
 * exec.

*依lno、id 、錯誤說明排序.
sort cases by  id 錯誤說明.

alter type id(a20) .

SAVE OUTFILE="\\140.109.171.240\worker\worker_sec\面訪協辦計畫\F202603傳播調查資料庫第四期第一次正式調查\10資料檔及不符合品\05檢核程式\問卷檢核程式\歷程\問卷檢核結果_f.sav".
exec.
***********************************************************************************************************************.
 * sort cases by  樣本編號 錯誤說明.

*先合併上週報表.(目的是為了吃進上週的文字).
 * add files
/file="\\140.109.171.240\worker\worker_sec\面訪協辦計畫\F202603傳播調查資料庫第四期第一次正式調查\10資料檔及不符合品\05檢核程式\問卷檢核程式\歷程\整理報表結果\問卷檢核報表_協辦_報表格式0616.sav"
/file="\\140.109.171.240\worker\worker_sec\面訪協辦計畫\F202603傳播調查資料庫第四期第一次正式調查\10資料檔及不符合品\05檢核程式\問卷檢核程式\歷程\整理報表結果\問卷檢核報表_計畫_報表格式0616.sav"
/file="\\140.109.171.240\worker\worker_sec\面訪協辦計畫\F202603傳播調查資料庫第四期第一次正式調查\10資料檔及不符合品\05檢核程式\問卷檢核程式\歷程\整理報表結果\問卷檢核報表_品管_報表格式0616.sav".
 * exec.
 * add files
/file="\\140.109.171.240\worker\worker_sec\面訪協辦計畫\F202603傳播調查資料庫第四期第一次正式調查\10資料檔及不符合品\05檢核程式\問卷檢核程式\歷程\整理報表結果\問卷檢核報表_協辦_報表格式1015.sav"
/file="\\140.109.171.240\worker\worker_sec\面訪協辦計畫\F202603傳播調查資料庫第四期第一次正式調查\10資料檔及不符合品\05檢核程式\問卷檢核程式\歷程\整理報表結果\問卷檢核報表_計畫_報表格式1015.sav".
 * exec.




 * ALTER TYPE 樣本編號(a20) 錯誤說明 錯誤狀況(a1200).

 * RENAME VARIABLES
(樣本編號=id).
 * exec.

 * compute id=RTRIM(LTRIM(id)).

 * sort cases BY id 錯誤說明 .

 * save outfile="\\140.109.171.240\worker\worker_sec\面訪協辦計畫\F202603傳播調查資料庫第四期第一次正式調查\10資料檔及不符合品\05檢核程式\問卷檢核程式\歷程\整理報表結果\問卷檢核報表_報表格式1021.sav".
 * exec.

***********************************************************************************************************************.
match files
/file="\\140.109.171.240\worker\worker_sec\面訪協辦計畫\F202603傳播調查資料庫第四期第一次正式調查\10資料檔及不符合品\05檢核程式\問卷檢核程式\歷程\問卷檢核結果_f.sav"
/TABLE="\\140.109.171.240\worker\worker_sec\面訪協辦計畫\F202603傳播調查資料庫第四期第一次正式調查\10資料檔及不符合品\05檢核程式\問卷檢核程式\歷程\整理報表結果\問卷檢核報表_報表格式1118.sav"
/by  id 錯誤說明.
exec.

SAVE OUTFILE="\\140.109.171.240\worker\worker_sec\面訪協辦計畫\F202603傳播調查資料庫第四期第一次正式調查\10資料檔及不符合品\05檢核程式\問卷檢核程式\歷程\問卷檢核結果.sav".
EXECUTE.

***********************************************************************************************************************
 
string 檢核日期(a30).

do if 檢核日期="".
compute 檢核日期="0616".
end if.
exec.

*第二週起不執行.
  STRING  錄音複查結果說明 協辦回覆說明 計畫錄音檔說明 計畫回覆說明
答案修正回覆 不再列出_請填1 需補問_請填1 補問內容說明 給訪員_請填1 回覆訪員說明(A300).


string  補問內容說明 (A300) .

alter type dropid(f2.0).

RENAME VARIABLES 
(id=樣本編號)
(lno=訪員編號)
(vZX=ZX回報特殊狀況).
EXECUTE.

alter type 不再列出_請填1	需補問_請填1	補問內容說明	給訪員_請填1(a30).


SAVE OUTFILE="\\140.109.171.240\worker\worker_sec\面訪協辦計畫\F202603傳播調查資料庫第四期第一次正式調查\10資料檔及不符合品\05檢核程式\問卷檢核程式\歷程\問卷檢核結果.sav"
/keep=檢核日期 檢核類型 訪員編號	訪員訪期 週次 樣本編號 提示卡 錯誤狀況 錯誤說明 處理順序 ZX回報特殊狀況
錄音複查結果說明 協辦回覆說明 計畫錄音檔說明 計畫回覆說明 答案修正回覆 不再列出_請填1 需補問_請填1 補問內容說明 給訪員_請填1 回覆訪員說明 使用對象 dropid .
exec.

***********************************************************************************************************************.
 * GET 
   FILE="\\140.109.171.240\worker\worker_sec\面訪協辦計畫\F202603傳播調查資料庫第四期第一次正式調查\10資料檔及不符合品\05檢核程式\問卷檢核程式\歷程\問卷檢核結果1005.sav".
 * EXECUTE.

 * SORT CASES BY 樣本編號.

 * match files
/file="\\140.109.171.240\worker\worker_sec\面訪協辦計畫\F202603傳播調查資料庫第四期第一次正式調查\10資料檔及不符合品\05檢核程式\問卷檢核程式\歷程\問卷檢核結果1005.sav"
/file="D:\F202302\是否修正過答案.sav"
/by 樣本編號.
 * exec.

 * SAVE OUTFILE="\\140.109.171.240\worker\worker_sec\面訪協辦計畫\F202603傳播調查資料庫第四期第一次正式調查\10資料檔及不符合品\05檢核程式\問卷檢核程式\歷程\問卷檢核結果1005.sav".
 * EXECUTE.

 * SORT CASES  BY 訪員編號 樣本編號 錯誤說明.
 * alter type 是否修正過答案(A1).

temp.

select if any(使用對象,1,2,3,4) & sys(dropid).
SAVE TRANSLATE OUTFILE='\\140.109.171.240\worker\worker_sec\面訪協辦計畫\F202603傳播調查資料庫第四期第一次正式調查\10資料檔及不符合品\05檢核程式\問卷檢核程式\歷程\問卷檢核結果報表.xlsx'
 /type=xls 
 /version=12 
 /map 
 /replace 
 /fieldnames
 /cells=values
 /keep=檢核日期 檢核類型 訪員編號	訪員訪期 週次 樣本編號 提示卡 錯誤狀況 錯誤說明 處理順序 ZX回報特殊狀況
錄音複查結果說明 協辦回覆說明 計畫錄音檔說明 計畫回覆說明 答案修正回覆 不再列出_請填1 需補問_請填1 補問內容說明 給訪員_請填1 回覆訪員說明 .


temp.
select if 使用對象=1 & sys(dropid) .
SAVE TRANSLATE OUTFILE='\\140.109.171.240\worker\worker_sec\面訪協辦計畫\F202603傳播調查資料庫第四期第一次正式調查\10資料檔及不符合品\05檢核程式\問卷檢核程式\歷程\問卷檢核結果報表(協辦).xlsx'
 /type=xls 
 /version=12 
 /map 
 /replace 
 /fieldnames
 /cells=values
 /keep=檢核日期 檢核類型 訪員編號	訪員訪期 週次 樣本編號 提示卡 錯誤狀況 錯誤說明 處理順序 ZX回報特殊狀況
錄音複查結果說明 協辦回覆說明 計畫錄音檔說明 計畫回覆說明 答案修正回覆 不再列出_請填1 需補問_請填1 補問內容說明 給訪員_請填1 回覆訪員說明.

temp.
select if (使用對象=2 | 使用對象=3)& sys(dropid).
SAVE TRANSLATE OUTFILE='\\140.109.171.240\worker\worker_sec\面訪協辦計畫\F202603傳播調查資料庫第四期第一次正式調查\10資料檔及不符合品\05檢核程式\問卷檢核程式\歷程\問卷檢核結果報表(計畫).xlsx'
 /type=xls 
 /version=12 
 /map 
 /replace 
 /fieldnames
 /cells=values
 /keep=檢核日期 檢核類型 訪員編號	訪員訪期 週次 樣本編號 提示卡 錯誤狀況 錯誤說明 處理順序 ZX回報特殊狀況
錄音複查結果說明 協辦回覆說明 計畫錄音檔說明 計畫回覆說明 答案修正回覆 不再列出_請填1 需補問_請填1 補問內容說明 給訪員_請填1 回覆訪員說明 .


*******************.



