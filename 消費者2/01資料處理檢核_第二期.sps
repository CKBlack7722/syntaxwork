* Encoding: UTF-8.
*臺灣消費者資料檢核.

*資料處理 讀a檔合併會員資料 四個專案.
GET FILE="\\140.109.171.240\worker\worker_sec\網調協辦計畫\W202603 臺灣消費者預期和政策反應調查(6月)\02資料檔及不符合品\02資料檔\01原始\0609\data_a1原始.sav".
compute id=Rtrim(Ltrim(id)).
SORT CASES by id.
ALTER TYPE id (A14).

save outfile="\\140.109.171.240\worker\worker_sec\網調協辦計畫\W202603 臺灣消費者預期和政策反應調查(6月)\02資料檔及不符合品\02資料檔\01原始\0609\data_a1.sav"
/COMPRESSED.

GET FILE="\\140.109.171.240\worker\worker_sec\網調協辦計畫\W202603 臺灣消費者預期和政策反應調查(6月)\02資料檔及不符合品\02資料檔\01原始\0609\data_a2原始.sav".
compute id=Rtrim(Ltrim(id)).
SORT CASES by id.
ALTER TYPE id (A14).


save outfile="\\140.109.171.240\worker\worker_sec\網調協辦計畫\W202603 臺灣消費者預期和政策反應調查(6月)\02資料檔及不符合品\02資料檔\01原始\0609\data_a2.sav"
/COMPRESSED.

*GET FILE="\\140.109.171.240\worker\worker_sec\網調協辦計畫\W202603 臺灣消費者預期和政策反應調查(6月)\02資料檔及不符合品\02資料檔\01原始\0609\data_b1原始.sav".
*compute id=Rtrim(Ltrim(id)).
*SORT CASES by id.
*ALTER TYPE id (A14).

*save outfile="\\140.109.171.240\worker\worker_sec\網調協辦計畫\W202603 臺灣消費者預期和政策反應調查(6月)\02資料檔及不符合品\02資料檔\01原始\0609\data_b1.sav"
/COMPRESSED.

MATCH FILES
  /FILE="\\140.109.171.240\worker\worker_sec\網調協辦計畫\W202603 臺灣消費者預期和政策反應調查(6月)\02資料檔及不符合品\02資料檔\01原始\0609\data_a1.sav"
  /FILE="\\140.109.171.240\worker\worker_sec\網調協辦計畫\W202603 臺灣消費者預期和政策反應調查(6月)\02資料檔及不符合品\02資料檔\01原始\0609\data_a2.sav"
  /FILE="\\140.109.171.240\worker\worker_sec\網調協辦計畫\W202603 臺灣消費者預期和政策反應調查(6月)\01樣本\第二期\第二期全套.sav"
  /BY id.

select if (email ~="" | cellphone ~="").
exe.

*沒有wendtime 的時間，用end3的時間補上.
do if sys(wendtime).
compute wendtime= vEND3.
end if.
EXECUTE.
fre wendtime.

save outfile="\\140.109.171.240\worker\worker_sec\網調協辦計畫\W202603 臺灣消費者預期和政策反應調查(6月)\02資料檔及不符合品\02資料檔\01原始\0609\data_a.sav"
/COMPRESSED.

GET FILE="\\140.109.171.240\worker\worker_sec\網調協辦計畫\W202603 臺灣消費者預期和政策反應調查(6月)\02資料檔及不符合品\02資料檔\01原始\0609\data_a.sav".
***************************************************************.
*變項名稱修改.
RENAME VARIABLES vC1U5 = vC1U4.
RENAME VARIABLES vC1U5R = vC1U4R.
RENAME VARIABLES vC1U5Ro2 =vC1U4Ro2.
  variable labels
  vC1U4  "vC1U4 您上一題勾選預期一年後，消費者物價指數年增率將會落於「3.00％（含）以上」，請問是多少％呢？（本題答案應大於等於3，可輸入至小數點2位）"
  vC1U4R "vC1U4R 115年4、5月平均消費者物價指數比去年同期上漲幅度為1.97％，而您預期一年後年增率為${Q:C1U4}％。 請確認您的回答是否與您的想法相符，或是輸入有誤。"
  vC1U4Ro2 "vC1U4R 115年4、5月平均消費者物價指數比去年同期上漲幅度為1.97％，而您預期一年後年增率為${Q:C1U4}％。 請確認您的回答是否與您的想法相符，或是輸入有誤。 (2) 輸入錯誤，正確應為".
EXECUTE.
*小數點修改.
ALTER TYPE vC1U4 vC1D1 vC2U7 vC2D1 vD1D5 vD1U5 (f10.2).

***************************************************************.
*網路會員調查(必做)：人口變項比對，僅產生識別變項.
***************************************************************.

*性別不一致 gender2026. 
  do if any(vG5,1,2) & any(gender2026,1,2) & gender2026~=vG5 & not sys(vEND3).
  compute CKgender=1.
  else if any(vG5,1,2).
  compute CKgender=0.
  end if.

  variable labels
  CKgender "與會員資料比對結果_性別".
  value labels
  CKgender 1 "不一致" 0 "一致".
*****************************.
*****************************.
*年次不一致 birth2026.
  do if birth2026~=vG1 &  not sys(vEND3).
  compute CKbirth=1.
  else.
  compute CKbirth=0.
  end if.

  variable labels
  CKbirth "與會員資料比對結果_年次".
  value labels
  CKbirth 1 "不一致" 0 "一致".
*****************************.
*****************************.
*教育程度下降或上升2級.
*edu2026分類如后：2未上學但識字   3小學  4國（初）中/初職  5高中職  6五專/二專/三專  7技術學院/大學  8碩博士  9其他，請說明 98 拒答 .
do if range(edu2026,2,8) & range(vG2,1,6) & ((any(vG2,1)&any(edu2026,4,5,6,7,8))|(any(vG2,2)&any(edu2026,5,6,7,8))|(any(vG2,3)&any(edu2026,6,7,8))|
    (any(vG2,4,5)&any(edu2026,8))|(range(vG2,3,6)&any(edu2026,2,3))|(range(vG2,4,6) & any(edu2026,4))|(any(vG2,6)&any(edu2026,5))).
  compute CKedu=1.
  else.
  compute CKedu=0.
  end if.

  variable labels
  CKedu "與會員資料比對結果_教育程度".
  value labels
  CKedu 1 "不一致" 0 "一致".

EXECUTE.
*****************************.
*****************************.
*婚姻狀況由「已婚」變為「未婚」 marry2026 ( 1從未結婚   2同居  3已婚  4離婚  5分居  6喪偶 98 拒答).
 do if any(marry2026 ,3,4,5,6) & any(vG6,1).
  compute CKmarry=1.
  else.
  compute CKmarry=0.
 end if.
  exec.

  variable labels
  CKmarry "與會員資料比對結果_婚姻".
  value labels
  CKmarry 1 "不一致" 0 "一致".


ALTER TYPE CKgender CKbirth CKedu CKmarry(f2.0).

*現居地區分類.
NUMERIC areanow (f2.0).
do if range(vG0city,1,6,19,19).
compute areanow=1.
else if range(vG0city,7,11).
compute areanow=2.
else if range(vG0city,12,16,20,20).
compute areanow=3.
else if range(vG0city,17,18,21,22).
compute areanow=4.
end if.
  variable labels
  areanow "現居地區".
  value labels
  areanow 1 "北部區域" 2 "中部區域" 3 "南部區域" 4 "東部區域及其他".

*填答年齡分組.
NUMERIC agenow (f4.0) agegpnow(f2.0).
compute agenow = 115-vG1.
  variable labels
  agenow "受訪者年齡" agegpnow "受訪者年齡分組".
RECODE agenow 
  (20 THRU 24 = 1) 
  (25 THRU 29 = 2) 
  (30 THRU 34 = 3) 
  (35 THRU 39 = 4) 
  (40 THRU 44 = 5) 
  (45 THRU 49 = 6) 
  (50 THRU 54 = 7) 
  (55 THRU 59 = 8) 
  (60 THRU 64 = 9) 
  (65 THRU HIGHEST = 10) 
  INTO agegpnow.

VALUE LABELS agegpnow
  1 "20-24歲"
  2 "25-29歲"
  3 "30-34歲"
  4 "35-39歲"
  5 "40-44歲"
  6 "45-49歲"
  7 "50-54歲"
  8 "55-59歲"
  9 "60-64歲"
  10 "65歲以上".
EXECUTE.

*中止題標記-計畫特殊.
NUMERIC END1check END2check group(f2.0).
do if vEND1>0 & vEND1<99969696969696.
compute END1check=1.
else if not sys(vEND1).
compute END1check=0.
end if.

do if vEND2>0 &vEND2<99969696969696.
compute END2check=1.
else if not sys(vEND2).
compute END2check=0.
end if.

*合併數值資料-計畫特殊.
NUMERIC vA7f (F10.0) vB7f (F2.0) vB7Uf vB7Df (F10.0).
VARIABLE LABELS
vA7f "A7R(已合併) "
vB7f "B7(已合併) "
vB7Uf "B7R(已合併) "
vB7Df "B7D(已合併) ".
VALUE LABELS
vB7f 1"增加" 2"減少" 3"大致不變"/
vB7Uf 9999999996"跳答"/
vB7Df 9999999996"跳答".

compute vA7f=vA7R.
do if any(vA7R,9999999996).
compute vA7f=vA7.
end if.

compute vB7f=vB7R.
do if vB7R=96.
compute vB7f=vB7.
end if.

compute vB7Uf=vB7UR.
do if any(vB7UR,9999999996).
compute vB7Uf=vB7U.
end if.

compute vB7Df=vB7DR.
do if any(vB7DR,9999999996).
compute vB7Df=vB7D.
end if.

*計畫需求變項1.A7<A1~A6標記.
NUMERIC A7check (f2.0).
do if (vA1+vA2+vA3+vA4+vA5+vA6)>vA7f.
compute A7check = 1.
else.
compute A7check = 0.
end if.

variable labels
A7check "A7填答是否符合邏輯(A7應大於等於A1~A6總計)".
value labels
A7check 1 "A7小於A1~A6總計(不合理)" 0 "A7大於等於A1~A6總計(合理)".

**結束後處理.
*條件Q1房租和房貸：100萬以上
Q2食物：大於0且小於二位數、50萬以上
Q3交通：大於0且小於二位數
Q4經常性開銷：0、100萬以上.
*do if   (vQ1>=1000000 | (vQ2>0 & vQ2<100) | vQ2>=500000 | (vQ3>0 & vQ3<100) | vQ4f=0 | vQ4f>=1000000) & not sys(vQ32).
*compute checkQ1_Q4=1.
*ELSE if not sys(vQ32).
*compute checkQ1_Q4=0.
*end if.
*ALTER TYPE checkQ1_Q4 (F2.0).
*  variable labels
* checkQ1_Q4 "確認Q1~Q4狀況".
*  value labels
*  checkQ1_Q4 1 "異常狀況" 0 "正常狀況".

*wlast_new.
NUMERIC wlast_new (F2.0).
*DO IF NOT SYSMIS(vQ32).
 *   DO IF (checkQ1_Q4 = 0).
 *       COMPUTE wlast_new = 1.
 *   ELSE IF (checkQ1_Q4 = 1).
 *       COMPUTE wlast_new = 3.
 *   END IF.
*ELSE IF NOT SYSMIS(v1).
*    COMPUTE wlast_new = 4.
*ELSE.
*    COMPUTE wlast_new = 5.
*END IF.

*do if END2check=1.
*compute wlast_new=3.
*end if.
*EXECUTE.
variable labels
wlast_new "填答結果".

value labels
wlast_new
1 "完成填答_成功樣本"
2 "部分填答_成功樣本"
3 "因故列為失敗案_未通過計畫品質條件_失敗案"
4 "部分填答_失敗樣本"
5 "未填答"/.
FREQUENCIES wlast_new.
EXECUTE.
*完成日期.
do if vEnd3<20260619000000.
compute group=1.
else.
compute group=2.
end if.

NUMERIC date (F8.0).
compute date=trunc(vEnd3/1000000).
EXECUTE.

  variable labels
  END1check "居住地區條件篩選"
  END2check "生活經常性開銷合理值篩選"
  group "完成填答批次"
  date "完成填答日期".

  value labels
  END1check 1 "未通過" 0 "通過"/
  group 1"第一批6/9-18" 2"第二批6/19-28"/
  END2check 1 "未通過" 0 "通過".
FREQUENCIES END1check END2check.

NUMERIC wave (F2.0).
compute wave=2.
  variable labels
  wave "樣本期次".
  value labels
  wave 1"第一期" 2 "第二期" 3 "第三期" 4 "第四期".
EXECUTE.


save outfile="\\140.109.171.240\worker\worker_sec\網調協辦計畫\W202603 臺灣消費者預期和政策反應調查(6月)\02資料檔及不符合品\02資料檔\02修改後\0609\data_a.sav"
/COMPRESSED.

*篩出s檔.
GET FILE="\\140.109.171.240\worker\worker_sec\網調協辦計畫\W202603 臺灣消費者預期和政策反應調查(6月)\02資料檔及不符合品\02資料檔\02修改後\0609\data_a.sav".
SELECT IF not sys(vEnd3).
EXECUTE.
*FREQUENCIES areanow group date.

save outfile="\\140.109.171.240\worker\worker_sec\網調協辦計畫\W202603 臺灣消費者預期和政策反應調查(6月)\02資料檔及不符合品\02資料檔\02修改後\0609\data_s.sav"
/COMPRESSED.

*處理給計畫的s檔.
*檢查ip次數.
save outfile="\\140.109.171.240\worker\worker_sec\網調協辦計畫\W202603 臺灣消費者預期和政策反應調查(6月)\02資料檔及不符合品\02資料檔\03給計畫\data_s0615.sav"
/drop name
email
cellphone
sendtime
smstime1
rt
smst
ic
wstarttime
wendtime
ip1
wst1
device1
browser1
ip2
wst2
device2
browser2
ip3
wst3
device3
browser3
ip4
wst4
device4
browser4
ct
termination
r
wlast
wno
email2026
cellphone2026
gender2026
birth2026
marry2026
marry2026_oth
edu2026
edu2026_oth
city2026
city2026_oth
town2026
agegp
sampling_group
subgroup
group_priority
年齡分組
地理區碼
casenum
source
CKgender
CKbirth
CKedu
CKmarry
areanow
agenow
agegpnow
END1check
END2check
group
vA7f
vB7f
vB7Uf
vB7Df
A7check
wlast_new
/COMPRESSED.

*進行資料處理及檢核.
GET FILE="\\140.109.171.240\worker\worker_sec\網調協辦計畫\W202603 臺灣消費者預期和政策反應調查(6月)\02資料檔及不符合品\02資料檔\02修改後\0609\data_s.sav".

**產生檢核及不合品所需變項-前置作業***************************************************************************************.
*定義調查開始日期與調查結束日期.
compute startdate=20260609000000.
compute enddate=20260629000000.
exec.

*1.產生檢核日期.
string month (a3)  today (a8).
compute month=char.substr($date,4,3).
recode month ('JAN'="01")('FEB'="02")('MAR'="03")('APR'="04")('MAY'="05")('JUN'="06")
('JUL'="07") ('AUG'="08")('SEP'="09")('OCT'="10")('NOV'="11")('DEC'="12") into month.
compute today=concat("20",char.substr($date,8,2),char.substr(month,1,2),char.substr($date,1,2)).
alter type today (f8.0).

*2.利用資料檔結束時間產生日期變項，日期變項一般是需要用後面的連線時間去補齊. 
compute sdate=trunc(wstarttime/1000000).
compute edate=trunc(wendtime/1000000).
format sdate edate (f8.0).

*3.產生開放欄位檢查日期變項（每日修改），有需要可以彈性列出某些天的開放欄位.
compute keyindate1=20260609.
compute keyindate2=20260629.
format keyindate1 keyindate2(f8.0).
compute keyin=edate.
format keyin (f8.0).
**********************************************************************************************************.
*建立m p 變項放置不符合品中文說明.
string m100 to m600 p100 to p600(a900).
ALTER TYPE id(a14).

*樣本編號檢核.                                 
* 識別重複觀察值.
SORT CASES BY id(A).
MATCH FILES
  /FILE=*
  /BY id
  /FIRST=PrimaryFirst
  /LAST=PrimaryLast.
DO IF (PrimaryFirst).
COMPUTE  MatchSequence=1-PrimaryLast.
ELSE.
COMPUTE  MatchSequence=MatchSequence+1.
END IF.
LEAVE  MatchSequence.
FORMATS  MatchSequence (f7).
COMPUTE  InDupGrp=MatchSequence>0.
SORT CASES InDupGrp(D).
MATCH FILES
  /FILE=*
  /DROP=PrimaryFirst PrimaryLast InDupGrp.
VARIABLE LABELS  MatchSequence '相符觀察值的循序個數'.
VARIABLE LEVEL  MatchSequence (SCALE).
FREQUENCIES VARIABLES=MatchSequence.
EXECUTE.
do if MatchSequence>0 | id="" .    
  compute m100=concat("id=",id).                     
  compute p100="id為重複樣本/漏答".     
end if.                                                         
exec.     

**1.不合理值檢核.

*vG0city=1,29   .
do if not range(vG0city,1,29) | sys(vG0city).
compute m101=concat("vG0city=",string(vG0city,f2)).
compute p101="vG0city為不合理值或遺漏值".
end if.
Exec.

 

*vEND1=20260609000000,2026062900000 99969696969696  .
do if not range(vEND1,20260609000000,20260629000000,99969696969696,99969696969696) | sys(vEND1).
compute m102=concat("vEND1=",string(vEND1,f14)).
compute p102="vEND1為不合理值或遺漏值".
end if.
Exec.

 

*vA0=20260609000000,20260629000000   .
do if not range(vA0,1,1) | sys(vA0).
compute m103=concat("vA0=",string(vA0,f2)).
compute p103="vA0為不合理值或遺漏值".
end if.
Exec.

 

*vA1=0,999999999   .
do if not range(vA1,0,999999999) | sys(vA1).
compute m104=concat("vA1=",string(vA1,f10)).
compute p104="vA1為不合理值或遺漏值".
end if.
Exec.

 

*vA2=0,999999999   .
do if not range(vA2,0,999999999) | sys(vA2).
compute m105=concat("vA2=",string(vA2,f10)).
compute p105="vA2為不合理值或遺漏值".
end if.
Exec.

 

*vA3=0,999999999   .
do if not range(vA3,0,999999999) | sys(vA3).
compute m106=concat("vA3=",string(vA3,f10)).
compute p106="vA3為不合理值或遺漏值".
end if.
Exec.

 

*vA4=0,999999999   .
do if not range(vA4,0,999999999) | sys(vA4).
compute m107=concat("vA4=",string(vA4,f10)).
compute p107="vA4為不合理值或遺漏值".
end if.
Exec.

 

*vA5=0,999999999   .
do if not range(vA5,0,999999999) | sys(vA5).
compute m108=concat("vA5=",string(vA5,f10)).
compute p108="vA5為不合理值或遺漏值".
end if.
Exec.

 

*vA6=0,999999999   .
do if not range(vA6,0,999999999) | sys(vA6).
compute m109=concat("vA6=",string(vA6,f10)).
compute p109="vA6為不合理值或遺漏值".
end if.
Exec.

 

*vA7=0,999999999   .
do if not range(vA7,0,999999999) | sys(vA7).
compute m110=concat("vA7=",string(vA7,f10)).
compute p110="vA7為不合理值或遺漏值".
end if.
Exec.

 

*vA7R=1,999999999   .
do if not range(vA7R,1,999999999,9999999996,9999999996) | sys(vA7R).
compute m111=concat("vA7R=",string(vA7R,f10)).
compute p111="vA7R為不合理值或遺漏值".
end if.
Exec.

 

*vEND2=20260609000000,20260629000000 99969696969696  .
do if not range(vEND2,20260609000000,20260629000000,99969696969696,99969696969696) | sys(vEND2).
compute m112=concat("vEND2=",string(vEND2,f14)).
compute p112="vEND2為不合理值或遺漏值".
end if.
Exec.

 

*vB1=1,3   .
do if not range(vB1,1,3) | sys(vB1).
compute m113=concat("vB1=",string(vB1,f2)).
compute p113="vB1為不合理值或遺漏值".
end if.
Exec.

 

*vB1U=1,999999999 9999999996  .
do if not range(vB1U,1,999999999,9999999996,9999999996) | sys(vB1U).
compute m114=concat("vB1U=",string(vB1U,f10)).
compute p114="vB1U為不合理值或遺漏值".
end if.
Exec.

 

*vB1D=1,999999999 9999999996  .
do if not range(vB1D,1,999999999,9999999996,9999999996) | (vB1D>vA1 & vB1D<9999999996) | sys(vB1D).
compute m115=concat("vB1D=",string(vB1D,f10)).
compute p115="vB1D為不合理值或遺漏值".
end if.

 

*vB2=1,3   .
do if not range(vB2,1,3) | sys(vB2).
compute m116=concat("vB2=",string(vB2,f2)).
compute p116="vB2為不合理值或遺漏值".
end if.
Exec.

 

*vB2U=1,999999999 9999999996  .
do if not range(vB2U,1,999999999,9999999996,9999999996) | sys(vB2U).
compute m117=concat("vB2U=",string(vB2U,f10)).
compute p117="vB2U為不合理值或遺漏值".
end if.
Exec.

 

*vB2D=1,999999999 9999999996  .
do if not range(vB2D,1,999999999,9999999996,9999999996) |(vB2D>vA2 & vB2D<9999999996) | sys(vB2D).
compute m118=concat("vB2D=",string(vB2D,f10)).
compute p118="vB2D為不合理值或遺漏值".
end if.
Exec.

 

*vB3=1,3   .
do if not range(vB3,1,3) | sys(vB3).
compute m119=concat("vB3=",string(vB3,f2)).
compute p119="vB3為不合理值或遺漏值".
end if.
Exec.

 

*vB3U=1,999999999 9999999996  .
do if not range(vB3U,1,999999999,9999999996,9999999996) | sys(vB3U).
compute m120=concat("vB3U=",string(vB3U,f10)).
compute p120="vB3U為不合理值或遺漏值".
end if.
Exec.

 

*vB3D=1,999999999 9999999996  .
do if not range(vB3D,1,999999999,9999999996,9999999996) |(vB3D>vA3 & vB3D<9999999996) | sys(vB3D).
compute m121=concat("vB3D=",string(vB3D,f10)).
compute p121="vB3D為不合理值或遺漏值".
end if.
Exec.

 

*vB4=1,3   .
do if not range(vB4,1,3) | sys(vB4).
compute m122=concat("vB4=",string(vB4,f2)).
compute p122="vB4為不合理值或遺漏值".
end if.
Exec.

 

*vB4U=1,999999999 9999999996  .
do if not range(vB4U,1,999999999,9999999996,9999999996) | sys(vB4U).
compute m123=concat("vB4U=",string(vB4U,f10)).
compute p123="vB4U為不合理值或遺漏值".
end if.
Exec.

 

*vB4D=1,999999999 9999999996  .
do if not range(vB4D,1,999999999,9999999996,9999999996) |(vB4D>vA4 & vB4D<9999999996) | sys(vB4D).
compute m124=concat("vB4D=",string(vB4D,f10)).
compute p124="vB4D為不合理值或遺漏值".
end if.
Exec.

 

*vB5=1,3   .
do if not range(vB5,1,3) | sys(vB5).
compute m125=concat("vB5=",string(vB5,f2)).
compute p125="vB5為不合理值或遺漏值".
end if.
Exec.

 

*vB5U=1,999999999 9999999996  .
do if not range(vB5U,1,999999999,9999999996,9999999996) | sys(vB5U).
compute m126=concat("vB5U=",string(vB5U,f10)).
compute p126="vB5U為不合理值或遺漏值".
end if.
Exec.

 

*vB5D=1,999999999 9999999996  .
do if not range(vB5D,1,999999999,9999999996,9999999996) |(vB5D>vA5 & vB5D<9999999996) | sys(vB5D).
compute m127=concat("vB5D=",string(vB5D,f10)).
compute p127="vB5D為不合理值或遺漏值".
end if.
Exec.

 

*vB6=1,3   .
do if not range(vB6,1,3) | sys(vB6).
compute m128=concat("vB6=",string(vB6,f2)).
compute p128="vB6為不合理值或遺漏值".
end if.
Exec.

 

*vB6U=1,999999999 9999999996  .
do if not range(vB6U,1,999999999,9999999996,9999999996) | sys(vB6U).
compute m129=concat("vB6U=",string(vB6U,f10)).
compute p129="vB6U為不合理值或遺漏值".
end if.
Exec.

 

*vB6D=1,999999999 9999999996  .
do if not range(vB6D,1,999999999,9999999996,9999999996) |(vB6D>vA6 & vB6D<9999999996) | sys(vB6D).
compute m130=concat("vB6D=",string(vB6D,f10)).
compute p130="vB6D為不合理值或遺漏值".
end if.
Exec.

 

*vB7=1,3   .
do if not range(vB7,1,3,96,96) | sys(vB7).
compute m131=concat("vB7=",string(vB7,f2)).
compute p131="vB7為不合理值或遺漏值".
end if.
Exec.

 

*vB7U=1,999999999 9999999996  .
do if not range(vB7U,1,999999999,9999999996,9999999996) | sys(vB7U).
compute m132=concat("vB7U=",string(vB7U,f10)).
compute p132="vB7U為不合理值或遺漏值".
end if.
Exec.

 

*vB7D=1,999999999 9999999996  .
do if not range(vB7D,1,999999999,9999999996,9999999996) |(vB7D>vA7 & vB7D<9999999996) | sys(vB7D).
compute m133=concat("vB7D=",string(vB7D,f10)).
compute p133="vB7D為不合理值或遺漏值".
end if.
Exec.

 

*vB7R=1,3   .
do if not range(vB7R,1,3,96,96) | sys(vB7R).
compute m134=concat("vB7R=",string(vB7R,f2)).
compute p134="vB7R為不合理值或遺漏值".
end if.
Exec.

 

*vB7UR=1,999999999 9999999996  .
do if not range(vB7UR,1,999999999,9999999996,9999999996) | sys(vB7UR).
compute m135=concat("vB7UR=",string(vB7UR,f10)).
compute p135="vB7UR為不合理值或遺漏值".
end if.
Exec.

 

*vB7DR=1,999999999 9999999996  .
do if not range(vB7DR,1,999999999,9999999996,9999999996) | sys(vB7DR).
compute m136=concat("vB7DR=",string(vB7DR,f10)).
compute p136="vB7DR為不合理值或遺漏值".
end if.
Exec.

*vC1=1,3   .
do if not range(vC1,1,3) | sys(vC1).
compute m137=concat("vC1=",string(vC1,f2)).
compute p137="vC1為不合理值或遺漏值".
end if.
Exec.

 

*vC1U=1,4 96  .
do if not range(vC1U,1,4,96,96) | sys(vC1U).
compute m138=concat("vC1U=",string(vC1U,f2)).
compute p138="vC1U為不合理值或遺漏值".
end if.
Exec.

 

*vC1U4=3,999 9999999996  .
do if not range(vC1U4,3,999,9999999996,9999999996) | sys(vC1U4).
compute m139=concat("vC1U4=",string(vC1U4,f10)).
compute p139="vC1U4為不合理值或遺漏值".
end if.
Exec.

 

*vC1U4R=1,2 96  .
do if not range(vC1U4R,1,2,96,96) | sys(vC1U4R).
compute m140=concat("vC1U4R=",string(vC1U4R,f2)).
compute p140="vC1U4R為不合理值或遺漏值".
end if.
Exec.

 

*vC1D=1,4 96  .
do if not range(vC1D,1,4,96,96) | sys(vC1D).
compute m141=concat("vC1D=",string(vC1D,f2)).
compute p141="vC1D為不合理值或遺漏值".
end if.
Exec.

 

*vC1D1=-100000,0.49999 9999999996  .
do if not range(vC1D1,-100000,0.49999,9999999996,9999999996) | sys(vC1D1).
compute m142=concat("vC1D1=",string(vC1D1,f10)).
compute p142="vC1D1為不合理值或遺漏值".
end if.
Exec.

 

*vC1D1R=1,2 96  .
do if not range(vC1D1R,1,2,96,96) | sys(vC1D1R).
compute m143=concat("vC1D1R=",string(vC1D1R,f2)).
compute p143="vC1D1R為不合理值或遺漏值".
end if.
Exec.

 

*vC3=1,7 96  .
do if not range(vC3,1,7,96,96) | sys(vC3).
compute m144=concat("vC3=",string(vC3,f2)).
compute p144="vC3為不合理值或遺漏值".
end if.
Exec.

 

*vC2=1,7 96  .
do if not range(vC2,1,7,96,96) | sys(vC2).
compute m145=concat("vC2=",string(vC2,f2)).
compute p145="vC2為不合理值或遺漏值".
end if.
Exec.

 

*vC2U7=3,999 9999999996  .
do if not range(vC2U7,3,999,9999999996,9999999996) | sys(vC2U7).
compute m146=concat("vC2U7=",string(vC2U7,f6)).
compute p146="vC2U7為不合理值或遺漏值".
end if.
Exec.

 

*vC2U7R=1,2 96  .
do if not range(vC2U7R,1,2,96,96) | sys(vC2U7R).
compute m147=concat("vC2U7R=",string(vC2U7R,f2)).
compute p147="vC2U7R為不合理值或遺漏值".
end if.
Exec.

 

*vC2D1=-100000,0.49999 9999999996  .
do if not range(vC2D1,-100000,0.49999,9999999996,9999999996) | sys(vC2D1).
compute m148=concat("vC2D1=",string(vC2D1,f6)).
compute p148="vC2D1為不合理值或遺漏值".
end if.
Exec.

 

*vC2D1R=1,2 96  .
do if not range(vC2D1R,1,2,96,96) | sys(vC2D1R).
compute m149=concat("vC2D1R=",string(vC2D1R,f2)).
compute p149="vC2D1R為不合理值或遺漏值".
end if.
Exec.

 

*vD1=1,3 7 96 .
do if not range(vD1,1,3,7,7,96,96) | sys(vD1).
compute m150=concat("vD1=",string(vD1,f2)).
compute p150="vD1為不合理值或遺漏值".
end if.
Exec.

 

*vD1D=1,5 96  .
do if not range(vD1D,1,5,96,96) | sys(vD1D).
compute m151=concat("vD1D=",string(vD1D,f2)).
compute p151="vD1D為不合理值或遺漏值".
end if.
Exec.

 

*vD1D5=20,999999 9999996  .
do if not range(vD1D5,20,999999,9999999996,9999999996) | sys(vD1D5).
compute m152=concat("vD1D5=",string(vD1D5,f10)).
compute p152="vD1D5為不合理值或遺漏值".
end if.
Exec.

 

*vD1U=1,5 96  .
do if not range(vD1U,1,5,96,96) | sys(vD1U).
compute m153=concat("vD1U=",string(vD1U,f2)).
compute p153="vD1U為不合理值或遺漏值".
end if.
Exec.

 

*vD1U5=20,999999 9999996  .
do if not range(vD1U5,20,999999,9999999996,9999999996) | sys(vD1U5).
compute m154=concat("vD1U5=",string(vD1U5,f10)).
compute p154="vD1U5為不合理值或遺漏值".
end if.
Exec.

 

*vE1=1,3 96  .
do if not range(vE1,1,3,96,96) | sys(vE1).
compute m155=concat("vE1=",string(vE1,f2)).
compute p155="vE1為不合理值或遺漏值".
end if.
Exec.

 

*vF1m1=0,1 96  .
do if not range(vF1m1,0,1,96,96) | sys(vF1m1).
compute m156=concat("vF1m1=",string(vF1m1,f2)).
compute p156="vF1m1為不合理值或遺漏值".
end if.
Exec.

 

*vF1m2=0,1 96  .
do if not range(vF1m2,0,1,96,96) | sys(vF1m2).
compute m157=concat("vF1m2=",string(vF1m2,f2)).
compute p157="vF1m2為不合理值或遺漏值".
end if.
Exec.

 

*vF1m3=0,1 96  .
do if not range(vF1m3,0,1,96,96) | sys(vF1m3).
compute m158=concat("vF1m3=",string(vF1m3,f2)).
compute p158="vF1m3為不合理值或遺漏值".
end if.
Exec.

 

*vF1m4=0,1 96  .
do if not range(vF1m4,0,1,96,96) | sys(vF1m4).
compute m159=concat("vF1m4=",string(vF1m4,f2)).
compute p159="vF1m4為不合理值或遺漏值".
end if.
Exec.

 


 

**2.開放欄位檢核.

*vG0city_oth 開放欄位檢核 是否為複選題=0.
do if vG0city=29 & vG0city_oth="".
Compute m201=concat("vG0city=",string(vG0city,n2),";vG0city_oth=",char.substr(vG0city_oth,1,150)).
compute p201="vG0city_oth開放欄位應答而未答".
else if vG0city~=29 & vG0city_oth~="".
compute m201=concat("vG0city=",string(vG0city,n2),";vG0city_oth=",char.substr(vG0city_oth,1,150)).
compute p201="vG0city_oth開放欄位不該答而答".
else if vG0city=29 & vG0city_oth~="".
compute m201=concat("vG0city=",string(vG0city,n2),";vG0city_oth=",char.substr(vG0city_oth,1,150)).
compute p201="vG0city_oth開放欄位內容列出確認".
end if.
Exec.

 

*vC1U4R 開放欄位檢核 是否為複選題=0.
do if vC1U4R=2 & vC1U4Ro2="".
Compute m202=concat("vC1U4R=",string(vC1U4R,n2),";vC1U4Ro2=",char.substr(vC1U4Ro2,1,150)).
compute p202="vC1U4Ro2開放欄位應答而未答".
else if vC1U4R~=2 & vC1U4Ro2~="".
compute m202=concat("vC1U4R=",string(vC1U4R,n2),";vC1U4Ro2=",char.substr(vC1U4Ro2,1,150)).
compute p202="vC1U4Ro2開放欄位不該答而答".
else if vC1U4R=2 & vC1U4Ro2~="".
compute m202=concat("vC1U4R=",string(vC1U4R,n2),";vC1U4Ro2=",char.substr(vC1U4Ro2,1,150)).
compute p202="vC1U4Ro2開放欄位內容列出確認".
end if.
Exec.

 

*vC1D1R 開放欄位檢核 是否為複選題=0.
do if vC1D1R=2 & vC1D1Ro2="".
Compute m203=concat("vC1D1R=",string(vC1D1R,n2),";vC1D1Ro2=",char.substr(vC1D1Ro2,1,150)).
compute p203="vC1D1Ro2開放欄位應答而未答".
else if vC1D1R~=2 & vC1D1Ro2~="".
compute m203=concat("vC1D1R=",string(vC1D1R,n2),";vC1D1Ro2=",char.substr(vC1D1Ro2,1,150)).
compute p203="vC1D1Ro2開放欄位不該答而答".
else if vC1D1R=2 & vC1D1Ro2~="".
compute m203=concat("vC1D1R=",string(vC1D1R,n2),";vC1D1Ro2=",char.substr(vC1D1Ro2,1,150)).
compute p203="vC1D1Ro2開放欄位內容列出確認".
end if.
Exec.

 

*vC3 開放欄位檢核 是否為複選題=0.
do if vC3=7 & vC3o7="".
Compute m204=concat("vC3=",string(vC3,n2),";vC3o7=",char.substr(vC3o7,1,150)).
compute p204="vC3o7開放欄位應答而未答".
else if vC3~=7 & vC3o7~="".
compute m204=concat("vC3=",string(vC3,n2),";vC3o7=",char.substr(vC3o7,1,150)).
compute p204="vC3o7開放欄位不該答而答".
else if vC3=7 & vC3o7~="".
compute m204=concat("vC3=",string(vC3,n2),";vC3o7=",char.substr(vC3o7,1,150)).
compute p204="vC3o7開放欄位內容列出確認".
end if.
Exec.

 

*vC2U7R 開放欄位檢核 是否為複選題=0.
do if vC2U7R=2 & vC2U7Ro2="".
Compute m205=concat("vC2U7R=",string(vC2U7R,n2),";vC2U7Ro2=",char.substr(vC2U7Ro2,1,150)).
compute p205="vC2U7Ro2開放欄位應答而未答".
else if vC2U7R~=2 & vC2U7Ro2~="".
compute m205=concat("vC2U7R=",string(vC2U7R,n2),";vC2U7Ro2=",char.substr(vC2U7Ro2,1,150)).
compute p205="vC2U7Ro2開放欄位不該答而答".
else if vC2U7R=2 & vC2U7Ro2~="".
compute m205=concat("vC2U7R=",string(vC2U7R,n2),";vC2U7Ro2=",char.substr(vC2U7Ro2,1,150)).
compute p205="vC2U7Ro2開放欄位內容列出確認".
end if.
Exec.

 

*vC2D1R 開放欄位檢核 是否為複選題=0.
do if vC2D1R=2 & vC2D1Ro2="".
Compute m206=concat("vC2D1R=",string(vC2D1R,n2),";vC2D1Ro2=",char.substr(vC2D1Ro2,1,150)).
compute p206="vC2D1Ro2開放欄位應答而未答".
else if vC2D1R~=2 & vC2D1Ro2~="".
compute m206=concat("vC2D1R=",string(vC2D1R,n2),";vC2D1Ro2=",char.substr(vC2D1Ro2,1,150)).
compute p206="vC2D1Ro2開放欄位不該答而答".
else if vC2D1R=2 & vC2D1Ro2~="".
compute m206=concat("vC2D1R=",string(vC2D1R,n2),";vC2D1Ro2=",char.substr(vC2D1Ro2,1,150)).
compute p206="vC2D1Ro2開放欄位內容列出確認".
end if.
Exec.

**3.複選題檢核.
* vF1 F2 組合.
STRING F1 F2 (A600).
COMPUTE F1 = Rtrim(Ltrim(concat("vF1m1=",string(vF1m1,f2)," , ","vF1m2=",string(vF1m2,f2)," , ","vF1m3=",string(vF1m3,f2)
    ,", ","vF1m4=",string(vF1m4,f2)," , ","vF1m5=",string(vF1m5,f2)," , ","vF1m6=",string(vF1m6,f2)," , ","vF1m7=",string(vF1m7,f2)
    ," , ","vF1m8=",string(vF1m8,f2)," , ","vF1m9=",string(vF1m9,f2)," , ","vF1m10=",string(vF1m10,f2)," , ","vF1m11=",string(vF1m11,f2)))).
COMPUTE F2 = Rtrim(Ltrim(concat("vF2m1=",string(vF2m1,f2)," , ","vF2m2=",string(vF2m2,f2)," , ","vF2m3=",string(vF2m3,f2)
    ,", ","vF2m4=",string(vF2m4,f2)," , ","vF2m5=",string(vF2m5,f2)," , ","vF2m6=",string(vF2m6,f2)," , ","vF2m7=",string(vF2m7,f2)
    ," , ","vF2m8=",string(vF2m8,f2)," , ","vF2m9=",string(vF2m9,f2)," , ","vF2m10=",string(vF2m10,f2)," , ","vF2m11=",string(vF2m11,f2)))).

*F1.
vector a=vF1m1 to vF1m11.
COMPUTE #F1zero = (SUM(vF1m1 TO vF1m11) = 0).
loop #i=1 to 10.
do if (any(a(#i),0,1) & any(a(#i+1),96))
| (any(a(#i),96) and not any(a(#i+1),96))| #F1zero=1.
compute m251=Rtrim(Ltrim(F1)).
compute p251="F1至少選1項或選特殊碼應一致".
end if.
end loop.
exec.

 
*F2.
vector a=vF2m1 to vF2m11.
COMPUTE #F2zero = (SUM(vF2m1 TO vF2m11) = 0).
loop #i=1 to 10.
do if (any(a(#i),0,1) & any(a(#i+1),96))
| (any(a(#i),96) and not any(a(#i+1),96))| #F2zero=1.
compute m252=Rtrim(Ltrim(F2)).
compute p252="F2至少選1項或選特殊碼應一致".
end if.
end loop.
exec.

**3.1複選互斥邏輯.
*F2=10 複選題內互斥.
do if any(vF2m10,1) & any(1,vF2m1 to vF2m9).
compute m253=Rtrim(Ltrim(F2)).
compute p253="vF2(10)複選題選項應互斥".
end if.
Exec.

**4.邏輯檢核.
SET MPRINT= no.
*///////////////////////////////.
DEFINE macro1(!POS !CHAREND('/'))
!do !i !in (!1).
do if  any(!i,96,996,999996,9999996,9999999996,99969696969696).
compute !concat(!i,"_96")=1.
else.
compute !concat(!i,"_96")=0.
end if.
!doend.
exec.

!ENDDEFINE.
*///////////////////////////////.
*請使用者輸入要處理的變項.
macro1
vG0city
vEND1
vA0
vA1
vA2
vA3
vA4
vA5
vA6
vA7
vA7R
vEND2
vB1
vB1U
vB1D
vB2
vB2U
vB2D
vB3
vB3U
vB3D
vB4
vB4U
vB4D
vB5
vB5U
vB5D
vB6
vB6U
vB6D
vB7
vB7U
vB7D
vB7R
vB7UR
vB7DR
vC1
vC1U
vC1U4
vC1U4R
vC1D
vC1D1
vC1D1R
vC3
vC2
vC2U7
vC2U7R
vC2D1
vC2D1R
vD1
vD1D
vD1D5
vD1U
vD1U5
vE1
vF1m1
vF1m2
vF1m3
vF1m4
vF1m5
vF1m6
vF1m7
vF1m8
vF1m9
vF1m10
vF1m11
vF1_1
vF1_2
vF1_3
vF2m1
vF2m2
vF2m3
vF2m4
vF2m5
vF2m6
vF2m7
vF2m8
vF2m9
vF2m10
vF2m11
vF3
vF4
vF5
vF6
vF7
vG1
vG2
vG3
vG4
vG5
vG6
vG7
vX1
vEND3 /.

* logic check show vEND1.
do if (vG0city=29) & any(1,vEND1_96).
compute m301=concat("vG0city=",string(vG0city,n2),",vEND1=",string(vA0,n14)).
compute p301="vG0city=29，應答vEND1而未答".
end if.

* logic check hide vEND1.
do if (vG0city~=29) & any(0,vEND1_96).
compute m302=concat("vG0city=",string(vG0city,n2),",vEND1=",string(vEND1,n14)).
compute p302="vG0city~=29，不應答vEND1而答".
end if.

* logic check show vA7R,vB7R.
do if ((vA1+vA2+vA3+vA4+vA5+vA6)>vA7) & (any(1,vA7R_96) | any(1,vB7R_96)).
compute m303=concat(
  "vA1=",
  string(vA1,n10),
  ",vA2=",
  string(vA2,n10),
  ",vA3=",
  string(vA3,n10),
  ",vA4=",
  string(vA4,n10),
  ",vA5=",
  string(vA5,n10),
  ",vA6=",
  string(vA6,n10),
  ",vA7=",
  string(vA7,n10),
  ",vA7R=",
  string(vA7R,n10),
  ",vB7R=",
  string(vB7R,n2)
).
compute p303="(vA1+vA2+vA3+vA4+vA5+vA6)>vA7，應答vA7R,vB7R而未答".
end if.

* logic check hide vA7R,vB7R.
do if ((vA1+vA2+vA3+vA4+vA5+vA6)<=vA7) & (any(0,vA7R_96) | any(0,vB7R_96)).
compute m304=concat(
  "vA1=",
  string(vA1,n10),
  ",vA2=",
  string(vA2,n10),
  ",vA3=",
  string(vA3,n10),
  ",vA4=",
  string(vA4,n10),
  ",vA5=",
  string(vA5,n10),
  ",vA6=",
  string(vA6,n10),
  ",vA7=",
  string(vA7,n10),
  ",vA7R=",
  string(vA7R,n10),
  ",vB7R=",
  string(vB7R,n2)
).
compute p304="(vA1+vA2+vA3+vA4+vA5+vA6)<=vA7，不應答vA7R,vB7R而答".
end if.

* logic check show vEND2.
do if ((vA1+vA2+vA3+vA4+vA5+vA6)>(vA7R*1.1)) & any(1,vEND2_96).
compute m305=concat(
  "vA1=",
  string(vA1,n10),
  ",vA2=",
  string(vA2,n10),
  ",vA3=",
  string(vA3,n10),
  ",vA4=",
  string(vA4,n10),
  ",vA5=",
  string(vA5,n10),
  ",vA6=",
  string(vA6,n10),
  ",vA7R=",
  string(vA7R,n10),
  ",vEND2=",
  string(vEND2,n14)
).
compute p305="(vA1+vA2+vA3+vA4+vA5+vA6)>(vA7R*1.1)，應答vEND2而未答".
end if.

* logic check hide vEND2.
do if ((vA1+vA2+vA3+vA4+vA5+vA6)<=(vA7R*1.1)) & any(0,vEND2_96).
compute m306=concat(
  "vA1=",
  string(vA1,n10),
  ",vA2=",
  string(vA2,n10),
  ",vA3=",
  string(vA3,n10),
  ",vA4=",
  string(vA4,n10),
  ",vA5=",
  string(vA5,n10),
  ",vA6=",
  string(vA6,n10),
  ",vA7R=",
  string(vA7R,n10),
  ",vEND2=",
  string(vEND2,n14)
).
compute p306="(vA1+vA2+vA3+vA4+vA5+vA6)<=(vA7R*1.1)，不應答vEND2而答".
end if.

* logic check show vB1U.
do if (vB1=1) & any(1,vB1U_96).
compute m307=concat("vB1=",string(vB1,n2),",vB1U=",string(vB1U,n10)).
compute p307="vB1=1，應答vB1U而未答".
end if.

* logic check hide vB1U.
do if (vB1~=1) & any(0,vB1U_96).
compute m308=concat("vB1=",string(vB1,n2),",vB1U=",string(vB1U,n10)).
compute p308="vB1~=1，不應答vB1U而答".
end if.

* logic check show vB1D.
do if (vB1=2) & any(1,vB1D_96).
compute m309=concat("vB1=",string(vB1,n2),",vB1D=",string(vB1D,n10)).
compute p309="vB1=2，應答vB1D而未答".
end if.

* logic check hide vB1D.
do if (vB1~=2) & any(0,vB1D_96).
compute m310=concat("vB1=",string(vB1,n2),",vB1D=",string(vB1D,n10)).
compute p310="vB1~=2，不應答vB1D而答".
end if.

* logic check show vB2U.
do if (vB2=1) & any(1,vB2U_96).
compute m311=concat("vB2=",string(vB2,n2),",vB2U=",string(vB2U,n10)).
compute p311="vB2=1，應答vB2U而未答".
end if.

* logic check hide vB2U.
do if (vB2~=1) & any(0,vB2U_96).
compute m312=concat("vB2=",string(vB2,n2),",vB2U=",string(vB2U,n10)).
compute p312="vB2~=1，不應答vB2U而答".
end if.

* logic check show vB2D.
do if (vB2=2) & any(1,vB2D_96).
compute m313=concat("vB2=",string(vB2,n2),",vB2D=",string(vB2D,n10)).
compute p313="vB2=2，應答vB2D而未答".
end if.

* logic check hide vB2D.
do if (vB2~=2) & any(0,vB2D_96).
compute m314=concat("vB2=",string(vB2,n2),",vB2D=",string(vB2D,n10)).
compute p314="vB2~=2，不應答vB2D而答".
end if.

* logic check show vB3U.
do if (vB3=1) & any(1,vB3U_96).
compute m315=concat("vB3=",string(vB3,n2),",vB3U=",string(vB3U,n10)).
compute p315="vB3=1，應答vB3U而未答".
end if.

* logic check hide vB3U.
do if (vB3~=1) & any(0,vB3U_96).
compute m316=concat("vB3=",string(vB3,n2),",vB3U=",string(vB3U,n10)).
compute p316="vB3~=1，不應答vB3U而答".
end if.

* logic check show vB3D.
do if (vB3=2) & any(1,vB3D_96).
compute m317=concat("vB3=",string(vB3,n2),",vB3D=",string(vB3D,n10)).
compute p317="vB3=2，應答vB3D而未答".
end if.

* logic check hide vB3D.
do if (vB3~=2) & any(0,vB3D_96).
compute m318=concat("vB3=",string(vB3,n2),",vB3D=",string(vB3D,n10)).
compute p318="vB3~=2，不應答vB3D而答".
end if.

* logic check show vB4U.
do if (vB4=1) & any(1,vB4U_96).
compute m319=concat("vB4=",string(vB4,n2),",vB4U=",string(vB4U,n10)).
compute p319="vB4=1，應答vB4U而未答".
end if.

* logic check hide vB4U.
do if (vB4~=1) & any(0,vB4U_96).
compute m320=concat("vB4=",string(vB4,n2),",vB4U=",string(vB4U,n10)).
compute p320="vB4~=1，不應答vB4U而答".
end if.

* logic check show vB4D.
do if (vB4=2) & any(1,vB4D_96).
compute m321=concat("vB4=",string(vB4,n2),",vB4D=",string(vB4D,n10)).
compute p321="vB4=2，應答vB4D而未答".
end if.

* logic check hide vB4D.
do if (vB4~=2) & any(0,vB4D_96).
compute m322=concat("vB4=",string(vB4,n2),",vB4D=",string(vB4D,n10)).
compute p322="vB4~=2，不應答vB4D而答".
end if.

* logic check show vB5U.
do if (vB5=1) & any(1,vB5U_96).
compute m323=concat("vB5=",string(vB5,n2),",vB5U=",string(vB5U,n10)).
compute p323="vB5=1，應答vB5U而未答".
end if.

* logic check hide vB5U.
do if (vB5~=1) & any(0,vB5U_96).
compute m324=concat("vB5=",string(vB5,n2),",vB5U=",string(vB5U,n10)).
compute p324="vB5~=1，不應答vB5U而答".
end if.

* logic check show vB5D.
do if (vB5=2) & any(1,vB5D_96).
compute m325=concat("vB5=",string(vB5,n2),",vB5D=",string(vB5D,n10)).
compute p325="vB5=2，應答vB5D而未答".
end if.

* logic check hide vB5D.
do if (vB5~=2) & any(0,vB5D_96).
compute m326=concat("vB5=",string(vB5,n2),",vB5D=",string(vB5D,n10)).
compute p326="vB5~=2，不應答vB5D而答".
end if.

* logic check show vB6U.
do if (vB6=1) & any(1,vB6U_96).
compute m327=concat("vB6=",string(vB6,n2),",vB6U=",string(vB6U,n10)).
compute p327="vB6=1，應答vB6U而未答".
end if.

* logic check hide vB6U.
do if (vB6~=1) & any(0,vB6U_96).
compute m328=concat("vB6=",string(vB6,n2),",vB6U=",string(vB6U,n10)).
compute p328="vB6~=1，不應答vB6U而答".
end if.

* logic check show vB6D.
do if (vB6=2) & any(1,vB6D_96).
compute m329=concat("vB6=",string(vB6,n2),",vB6D=",string(vB6D,n10)).
compute p329="vB6=2，應答vB6D而未答".
end if.

* logic check hide vB6D.
do if (vB6~=2) & any(0,vB6D_96).
compute m330=concat("vB6=",string(vB6,n2),",vB6D=",string(vB6D,n10)).
compute p330="vB6~=2，不應答vB6D而答".
end if.

* logic check show vB7U.
do if (vB7=1) & any(1,vB7U_96).
compute m331=concat("vB7=",string(vB7,n2),",vB7U=",string(vB7U,n10)).
compute p331="vB7=1，應答vB7U而未答".
end if.

* logic check hide vB7U.
do if (vB7~=1) & any(0,vB7U_96).
compute m332=concat("vB7=",string(vB7,n2),",vB7U=",string(vB7U,n10)).
compute p332="vB7~=1，不應答vB7U而答".
end if.

* logic check show vB7D.
do if (vB7=2) & any(1,vB7D_96).
compute m333=concat("vB7=",string(vB7,n2),",vB7D=",string(vB7D,n10)).
compute p333="vB7=2，應答vB7D而未答".
end if.

* logic check hide vB7D.
do if (vB7~=2) & any(0,vB7D_96).
compute m334=concat("vB7=",string(vB7,n2),",vB7D=",string(vB7D,n10)).
compute p334="vB7~=2，不應答vB7D而答".
end if.

* logic check show vB7UR.
do if (vB7R=1) & any(1,vB7UR_96).
compute m335=concat("vB7R=",string(vB7R,n2),",vB7UR=",string(vB7UR,n10)).
compute p335="vB7R=1，應答vB7UR而未答".
end if.

* logic check hide vB7UR.
do if (vB7R~=1) & any(0,vB7UR_96).
compute m336=concat("vB7R=",string(vB7R,n2),",vB7UR=",string(vB7UR,n10)).
compute p336="vB7R~=1，不應答vB7UR而答".
end if.

* logic check show vB7DR.
do if (vB7R=2) & any(1,vB7DR_96).
compute m337=concat("vB7R=",string(vB7R,n2),",vB7DR=",string(vB7DR,n10)).
compute p337="vB7R=2，應答vB7DR而未答".
end if.

* logic check hide vB7DR.
do if (vB7R~=2) & any(0,vB7DR_96).
compute m338=concat("vB7R=",string(vB7R,n2),",vB7DR=",string(vB7DR,n10)).
compute p338="vB7R~=2，不應答vB7DR而答".
end if.

* logic check show vC1U,vC3.
do if (vC1=1) & (any(1,vC1U_96) | any(1,vC3_96)).
compute m339=concat(
  "vC1=",
  string(vC1,n2),
  ",vC1U=",
  string(vC1U,n2),
  ",vC3=",
  string(vC3,n2)
).
compute p339="vC1=1，應答vC1U,vC3而未答".
end if.

* logic check hide vC1U,vC3.
do if (vC1~=1) & (any(0,vC1U_96) | any(0,vC3_96)).
compute m340=concat(
  "vC1=",
  string(vC1,n2),
  ",vC1U=",
  string(vC1U,n2),
  ",vC3=",
  string(vC3,n2)
).
compute p340="vC1~=1，不應答vC1U,vC3而答".
end if.

* logic check show vC1D.
do if (vC1=2) & any(1,vC1D_96).
compute m341=concat("vC1=",string(vC1,n2),",vC1D=",string(vC1D,n2)).
compute p341="vC1=2，應答vC1D而未答".
end if.

* logic check hide vC1D.
do if (vC1~=2) & any(0,vC1D_96).
compute m342=concat("vC1=",string(vC1,n2),",vC1D=",string(vC1D,n2)).
compute p342="vC1~=2，不應答vC1D而答".
end if.

* logic check show vC1U4.
do if (vC1U=4) & any(1,vC1U4_96).
compute m343=concat("vC1U=",string(vC1U,n2),",vC1U4=",string(vC1U4,n10)).
compute p343="vC1U=4，應答vC1U4而未答".
end if.

* logic check hide vC1U4.
do if (vC1U<4) & any(0,vC1U4_96).
compute m344=concat("vC1U=",string(vC1U,n2),",vC1U4=",string(vC1U4,n10)).
compute p344="vC1U<4，不應答vC1U4而答".
end if.

* logic check show vC1U4R.
do if (vC1U4>=50 & vC1U4<9999999996) & any(1,vC1U4R_96).
compute m345=concat("vC1U4=",string(vC1U4,n10),",vC1U4R=",string(vC1U4R,n2)).
compute p345="vC1U4>=50 & vC1U4<9999999996，應答vC1U4R而未答".
end if.

* logic check hide vC1U4R.
do if (vC1U4<50 | vC1U4=9999999996) & any(0,vC1U4R_96).
compute m346=concat("vC1U4=",string(vC1U4,n10),",vC1U4R=",string(vC1U4R,n2)).
compute p346="vC1U4<50 | vC1U4=9999999996，不應答vC1U4R而答".
end if.

* logic check show vC1D1.
do if (vC1D=1) & any(1,vC1D1_96).
compute m347=concat("vC1D=",string(vC1D,n2),",vC1D1=",string(vC1D1,n10)).
compute p347="vC1D=1，應答vC1D1而未答".
end if.

* logic check hide vC1D1.
do if (vC1D~=1) & any(0,vC1D1_96).
compute m348=concat("vC1D=",string(vC1D,n2),",vC1D1=",string(vC1D1,n10)).
compute p348="vC1D~=1，不應答vC1D1而答".
end if.

* logic check show vC1D1R.
do if (vC1D1<=0) & any(1,vC1D1R_96).
compute m349=concat("vC1D1=",string(vC1D1,n10),",vC1D1R=",string(vC1D1R,n2)).
compute p349="vC1D1<=0，應答vC1D1R而未答".
end if.

* logic check hide vC1D1R.
do if (vC1D1>0 & vC1D1<0.5) & any(0,vC1D1R_96).
compute m350=concat("vC1D1=",string(vC1D1,n10),",vC1D1R=",string(vC1D1R,n2)).
compute p350="vC1D1>0 & vC1D1<0.5，不應答vC1D1R而答".
end if.

* logic check show vC2U7.
do if (vC2=7) & any(1,vC2U7_96).
compute m351=concat("vC2=",string(vC2,n2),",vC2U7=",string(vC2U7,n6)).
compute p351="vC2=7，應答vC2U7而未答".
end if.

* logic check hide vC2U7.
do if (vC2<7) & any(0,vC2U7_96).
compute m352=concat("vC2=",string(vC2,n2),",vC2U7=",string(vC2U7,n6)).
compute p352="vC2<7，不應答vC2U7而答".
end if.

* logic check show vC2U7R.
do if (vC2U7>=50 & vC2U7<999996) & any(1,vC2U7R_96).
compute m353=concat("vC2U7=",string(vC2U7,n6),",vC2U7R=",string(vC2U7R,n2)).
compute p353="vC2U7>=50 & vC2U7<999996，應答vC2U7R而未答".
end if.

* logic check hide vC2U7R.
do if (vC2U7<50 | vC2U7=999996) & any(0,vC2U7R_96).
compute m354=concat("vC2U7=",string(vC2U7,n6),",vC2U7R=",string(vC2U7R,n2)).
compute p354="vC2U7<50 | vC2U7=999996，不應答vC2U7R而答".
end if.

* logic check show vC2D1.
do if (vC2=1) & any(1,vC2D1_96).
compute m355=concat("vC2=",string(vC2,n2),",vC2D1=",string(vC2D1,n6)).
compute p355="vC2=1，應答vC2D1而未答".
end if.

* logic check hide vC2D1.
do if (vC2>1) & any(0,vC2D1_96).
compute m356=concat("vC2=",string(vC2,n2),",vC2D1=",string(vC2D1,n6)).
compute p356="vC2>1，不應答vC2D1而答".
end if.

* logic check show vC2D1R.
do if (vC2D1<=0) & any(1,vC2D1R_96).
compute m357=concat("vC2D1=",string(vC2D1,n6),",vC2D1R=",string(vC2D1R,n2)).
compute p357="vC2D1<=0，應答vC2D1R而未答".
end if.

* logic check hide vC2D1R.
do if (vC2D1>0) & any(0,vC2D1R_96).
compute m358=concat("vC2D1=",string(vC2D1,n6),",vC2D1R=",string(vC2D1R,n2)).
compute p358="vC2D1>0，不應答vC2D1R而答".
end if.

* logic check show vD1D.
do if (vD1=1) & any(1,vD1D_96).
compute m359=concat("vD1=",string(vD1,n2),",vD1D=",string(vD1D,n2)).
compute p359="vD1=1，應答vD1D而未答".
end if.

* logic check hide vD1D.
do if (vD1~=1) & any(0,vD1D_96).
compute m360=concat("vD1=",string(vD1,n2),",vD1D=",string(vD1D,n2)).
compute p360="vD1~=1，不應答vD1D而答".
end if.

* logic check show vD1U.
do if (vD1=2) & any(1,vD1U_96).
compute m361=concat("vD1=",string(vD1,n2),",vD1U=",string(vD1U,n2)).
compute p361="vD1=2，應答vD1U而未答".
end if.

* logic check hide vD1U.
do if (vD1~=2) & any(0,vD1U_96).
compute m362=concat("vD1=",string(vD1,n2),",vD1U=",string(vD1U,n2)).
compute p362="vD1~=2，不應答vD1U而答".
end if.

* logic check show vD1D5.
do if (vD1D=5) & any(1,vD1D5_96).
compute m363=concat("vD1D=",string(vD1D,n2),",vD1D5=",string(vD1D5,n7)).
compute p363="vD1D=5，應答vD1D5而未答".
end if.

* logic check hide vD1D5.
do if (vD1D~=5) & any(0,vD1D5_96).
compute m364=concat("vD1D=",string(vD1D,n2),",vD1D5=",string(vD1D5,n7)).
compute p364="vD1D~=5，不應答vD1D5而答".
end if.

* logic check show vD1U5.
do if (vD1U=5) & any(1,vD1U5_96).
compute m365=concat("vD1U=",string(vD1U,n2),",vD1U5=",string(vD1U5,n7)).
compute p365="vD1U=5，應答vD1U5而未答".
end if.

* logic check hide vD1U5.
do if (vD1U~=5) & any(0,vD1U5_96).
compute m366=concat("vD1U=",string(vD1U,n2),",vD1U5=",string(vD1U5,n7)).
compute p366="vD1U~=5，不應答vD1U5而答".
end if.

* logic check show vF1_1.
do if (vF1m3=1) & any(1,vF1_1_96).
compute m367=concat("vF1m3=",string(vF1m3,n2),",vF1_1=",string(vF1_1,n2)).
compute p367="vF1m3=1，應答vF1_1而未答".
end if.

* logic check hide vF1_1.
do if (vF1m3=0) & any(0,vF1_1_96).
compute m368=concat("vF1m3=",string(vF1m3,n2),",vF1_1=",string(vF1_1,n2)).
compute p368="vF1m3=0，不應答vF1_1而答".
end if.

* logic check show vF1_2,vF1_3.
do if (vF1m4=1) & (any(1,vF1_2_96) | any(1,vF1_3_96)).
compute m369=concat(
  "vF1m4=",
  string(vF1m4,n2),
  ",vF1_2=",
  string(vF1_2,n2),
  ",vF1_3=",
  string(vF1_3,n2)
).
compute p369="vF1m4=1，應答vF1_2,vF1_3而未答".
end if.

* logic check hide vF1_2,vF1_3.
do if (vF1m4=0) & (any(0,vF1_2_96) | any(0,vF1_3_96)).
compute m370=concat(
  "vF1m4=",
  string(vF1m4,n2),
  ",vF1_2=",
  string(vF1_2,n2),
  ",vF1_3=",
  string(vF1_3,n2)
).
compute p370="vF1m4=0，不應答vF1_2,vF1_3而答".
end if.

* logic check limit vB1.
do if (vA1=0) & any(vB1,2).
compute m371=concat("vA1=",string(vA1,n10),",vB1=",string(vB1,n2)).
compute p371="vA1=0，vB1不可為2".
end if.

* logic check limit vB1D.
do if (vB1=2) & vB1D>vA1.
compute m372=concat(
  "vB1=",
  string(vB1,n2),
  ",vB1D=",
  string(vB1D,n10),
  ",vA1=",
  string(vA1,n10)
).
compute p372="vB1=2，vB1D應<=vA1".
end if.

* logic check limit vB2.
do if (vA2=0) & any(vB2,2).
compute m373=concat("vA2=",string(vA2,n10),",vB2=",string(vB2,n2)).
compute p373="vA2=0，vB2不可為2".
end if.

* logic check limit vB2D.
do if (vB2=2) & vB2D>vA2.
compute m374=concat(
  "vB2=",
  string(vB2,n2),
  ",vB2D=",
  string(vB2D,n10),
  ",vA2=",
  string(vA2,n10)
).
compute p374="vB2=2，vB2D應<=vA2".
end if.

* logic check limit vB3.
do if (vA3=0) & any(vB3,2).
compute m375=concat("vA3=",string(vA3,n10),",vB3=",string(vB3,n2)).
compute p375="vA3=0，vB3不可為2".
end if.

* logic check limit vB3D.
do if (vB3=2) & vB3D>vA3.
compute m376=concat(
  "vB3=",
  string(vB3,n2),
  ",vB3D=",
  string(vB3D,n10),
  ",vA3=",
  string(vA3,n10)
).
compute p376="vB3=2，vB3D應<=vA3".
end if.

* logic check limit vB4.
do if (vA4=0) & any(vB4,2).
compute m377=concat("vA4=",string(vA4,n10),",vB4=",string(vB4,n2)).
compute p377="vA4=0，vB4不可為2".
end if.

* logic check limit vB4D.
do if (vB4=2) & vB4D>vA4.
compute m378=concat(
  "vB4=",
  string(vB4,n2),
  ",vB4D=",
  string(vB4D,n10),
  ",vA4=",
  string(vA4,n10)
).
compute p378="vB4=2，vB4D應<=vA4".
end if.

* logic check limit vB5.
do if (vA5=0) & any(vB5,2).
compute m379=concat("vA5=",string(vA5,n10),",vB5=",string(vB5,n2)).
compute p379="vA5=0，vB5不可為2".
end if.

* logic check limit vB5D.
do if (vB5=2) & vB5D>vA5.
compute m380=concat(
  "vB5=",
  string(vB5,n2),
  ",vB5D=",
  string(vB5D,n10),
  ",vA5=",
  string(vA5,n10)
).
compute p380="vB5=2，vB5D應<=vA5".
end if.

* logic check limit vB6.
do if (vA6=0) & any(vB6,2).
compute m381=concat("vA6=",string(vA6,n10),",vB6=",string(vB6,n2)).
compute p381="vA6=0，vB6不可為2".
end if.

* logic check limit vB6D.
do if (vB6=2) & vB6D>vA6.
compute m382=concat(
  "vB6=",
  string(vB6,n2),
  ",vB6D=",
  string(vB6D,n10),
  ",vA6=",
  string(vA6,n10)
).
compute p382="vB6=2，vB6D應<=vA6".
end if.

* logic check limit vB7.
do if (vA7=0) & any(vB7,2).
compute m383=concat("vA7=",string(vA7,n10),",vB7=",string(vB7,n2)).
compute p383="vA7=0，vB7不可為2".
end if.

* logic check limit vB7D.
do if (vB7=2) & vB7D>vA7.
compute m384=concat(
  "vB7=",
  string(vB7,n2),
  ",vB7D=",
  string(vB7D,n10),
  ",vA7=",
  string(vA7,n10)
).
compute p384="vB7=2，vB7D應<=vA7".
end if.

* logic check limit vB7DR.
do if (vB7R=2) & vB7DR>vA7R.
compute m385=concat(
  "vB7R=",
  string(vB7R,n2),
  ",vB7DR=",
  string(vB7DR,n10),
  ",vA7R=",
  string(vA7R,n10)
).
compute p385="vB7R=2，vB7DR應<=vA7R".
end if.
EXECUTE.

* SYNTAXWORK_END_LOGIC.
*教育程度上升2階列出本人填答.
 do if  ((range(vG2,3,6)&any(edu2026,2,3))|(range(vG2,4,6) & any(edu2026,4))|(any(vG2,6)&any(edu2026,5))) & CKgender=0 & CKbirth=0 & CKedu=1.
compute m501=concat('vG2=',string(vG2,n2),',edu2026=',string(edu2026,n2),',gender2026=',string(gender2026,n2),',birth2026=',string(birth2026,n2)).
compute p501="本人填答教育程度上升兩階".
end if.

*教育程度上升2階列出非本人填答.
do if  ((range(vG2,3,6)&any(edu2026,2,3))|(range(vG2,4,6) & any(edu2026,4))|(any(vG2,6)&any(edu2026,5))) & (CKgender=1 or CKbirth=1) & CKedu=1.
compute m502=concat('vG2=',string(vG2,n2),',edu2026=',string(edu2026,n2),',gender2026=',string(gender2026,n2),',birth2026=',string(birth2026,n2)).
compute p502="非本人填答教育程度上升兩階".
end if.

save  outfile="\\140.109.171.240\worker\worker_sec\網調協辦計畫\W202603 臺灣消費者預期和政策反應調查(6月)\02資料檔及不符合品\02資料檔\04檢核程式\0609\data_s_check.sav".
exec.
***************************************************************.
*資料轉置.
get file="\\140.109.171.240\worker\worker_sec\網調協辦計畫\W202603 臺灣消費者預期和政策反應調查(6月)\02資料檔及不符合品\02資料檔\04檢核程式\0609\data_s_check.sav".
exec.
***************************************************************.
sort cases by id .
VARSTOCASES  
 /MAKE 變項名稱原始答案 from m100 to m600
 /MAKE 不符合說明 from p100 to p600
 /KEEP =id  wno vG1 vG5 
 /null = drop                                                                         
 /count = count.   

string 檢核日期(a4).
compute 檢核日期="0609".

save  outfile="\\140.109.171.240\worker\worker_sec\網調協辦計畫\W202603 臺灣消費者預期和政策反應調查(6月)\02資料檔及不符合品\02資料檔\04檢核程式\0609\data_s檢核結果.sav".
exec.

*輸出問卷不符合品.
temp.
select if char.index(不符合說明,"開放欄位")=0  .
SAVE TRANSLATE OUTFILE="\\140.109.171.240\worker\worker_sec\網調協辦計畫\W202603 臺灣消費者預期和政策反應調查(6月)\02資料檔及不符合品\01不符合品\不符合品0609.xlsx"
  /TYPE=XLS
  /VERSION=12
  /MAP
  /FIELDNAMES VALUE=NAMES
  /CELLS=VALUES
  /EXCELOPTIONS SHEET='問卷不符合品'
  /MISSING=RECODE
  /rename=(id,vG1,vG5=樣本編號,年次,性別)
  /replace
  /keep=檢核日期  樣本編號 wno  性別 年次 變項名稱原始答案 不符合說明. 

*輸出開放欄位.
temp.
select if char.index(不符合說明,"開放欄位")>0.
SAVE TRANSLATE OUTFILE="\\140.109.171.240\worker\worker_sec\網調協辦計畫\W202603 臺灣消費者預期和政策反應調查(6月)\02資料檔及不符合品\01不符合品\不符合品0609.xlsx"
  /TYPE=XLS
  /VERSION=12
  /MAP
  /FIELDNAMES VALUE=NAMES
  /CELLS=VALUES
  /EXCELOPTIONS SHEET='開放欄位'
  /MISSING=RECODE
  /rename=(id,vG1,vG5=樣本編號,年次,性別)
  /APPEND
  /keep=檢核日期  樣本編號 wno  性別 年次 變項名稱原始答案 不符合說明. 


