* Encoding: UTF-8.
*臺灣消費者資料檢核.

*資料處理 讀a檔合併會員資料 三個專案.
GET FILE="\\140.109.171.240\worker\worker_sec\網調協辦計畫\W202603 臺灣消費者預期和政策反應調查\02資料檔及不符合品\02資料檔\01原始\0330\data_a1原始.sav".
compute id=Rtrim(Ltrim(id)).
SORT CASES by id.
ALTER TYPE id (A14).

save outfile="\\140.109.171.240\worker\worker_sec\網調協辦計畫\W202603 臺灣消費者預期和政策反應調查\02資料檔及不符合品\02資料檔\01原始\0330\data_a1.sav"
/COMPRESSED.

GET FILE="\\140.109.171.240\worker\worker_sec\網調協辦計畫\W202603 臺灣消費者預期和政策反應調查\02資料檔及不符合品\02資料檔\01原始\0330\data_a2原始.sav".
compute id=Rtrim(Ltrim(id)).
SORT CASES by id.
ALTER TYPE id (A14).

if id="004005C04NTa" sendtime=20260320015601.
SELECT IF not id="004005C04NT".
if id="004005C04NTa" id="004005C04NT".

save outfile="\\140.109.171.240\worker\worker_sec\網調協辦計畫\W202603 臺灣消費者預期和政策反應調查\02資料檔及不符合品\02資料檔\01原始\0330\data_a2.sav"
/COMPRESSED.

GET FILE="\\140.109.171.240\worker\worker_sec\網調協辦計畫\W202603 臺灣消費者預期和政策反應調查\02資料檔及不符合品\02資料檔\01原始\0330\data_ab原始.sav".
compute id=Rtrim(Ltrim(id)).
SORT CASES by id.
ALTER TYPE id (A14).

save outfile="\\140.109.171.240\worker\worker_sec\網調協辦計畫\W202603 臺灣消費者預期和政策反應調查\02資料檔及不符合品\02資料檔\01原始\0330\data_ab.sav"
/COMPRESSED.

MATCH FILES
  /FILE="\\140.109.171.240\worker\worker_sec\網調協辦計畫\W202603 臺灣消費者預期和政策反應調查\02資料檔及不符合品\02資料檔\01原始\0330\data_a1.sav"
  /FILE="\\140.109.171.240\worker\worker_sec\網調協辦計畫\W202603 臺灣消費者預期和政策反應調查\02資料檔及不符合品\02資料檔\01原始\0330\data_a2.sav"
  /FILE="\\140.109.171.240\worker\worker_sec\網調協辦計畫\W202603 臺灣消費者預期和政策反應調查\02資料檔及不符合品\02資料檔\01原始\0330\data_ab.sav"
  /FILE="\\140.109.171.240\worker\worker_sec\網調協辦計畫\W202603 臺灣消費者預期和政策反應調查\01樣本\W202603 全套.sav"
  /BY id.

select if (email ~="" | cellphone ~="").
exe.
ALTER TYPE wno (A10).
do if name="".
compute name=wno.
end if.
ALTER TYPE wno (F10.0).
compute name=Rtrim(Ltrim(name)).
EXECUTE.

*沒有wendtime 的時間，用end3的時間補上.
do if sys(wendtime).
compute wendtime= vEND3.
end if.
EXECUTE.
fre wendtime.

save outfile="\\140.109.171.240\worker\worker_sec\網調協辦計畫\W202603 臺灣消費者預期和政策反應調查\02資料檔及不符合品\02資料檔\01原始\0330\data_a.sav"
/COMPRESSED.

GET FILE="\\140.109.171.240\worker\worker_sec\網調協辦計畫\W202603 臺灣消費者預期和政策反應調查\02資料檔及不符合品\02資料檔\01原始\0330\data_a.sav".
***************************************************************.
*小數點修改.
ALTER TYPE vQ17_1A vQ17_2A (f10.2).

*欄位拉寬.
ALTER TYPE vQ18o7 (A180).
*答案修改.
if id="001493C02CT" vQ17_1A=5.65.
if id="001814G02NT" vQ17_1A=9999999996.
if id="001814G02NT" vQ17_1=3.
if id="005284C05NT" vQ18=1.
if id="005284C05NT" vQ18o7="".
if id="000078B01NT" vQ18=1.
if id="000078B01NT" vQ18o7="".
if id="005043K04ST" vQ18o7="物價上漲，非單一因素造成，個人的消費習性變動，也是可抵消物價波動的影響".
if id="003534K03NT" vQ18o7="此問題設計的不太適宜，因物價指數上漲往往不是單一因素，很多都是因調高最底工資而引起普遍物價上漲，或政治因素". 
*計畫回覆開放欄位.
if id="000003A01NT" vQ18o7="".
if id="000003A01NT" vQ18 = 1.
if id="000239C01CT" vQ18o7="".
if id="000239C01CT" vQ18 = 1.
if id="000317D01NT" vQ18o7="".
if id="000317D01NT" vQ18 = 1.
if id="000492G01NT" vQ18o7="".
if id="000492G01NT" vQ18 = 1.
if id="000502G01NT" vQ18o7="".
if id="000502G01NT" vQ18 = 1.
if id="000610H01NT" vQ18o7="".
if id="000610H01NT" vQ18 = 1.
if id="000706H01ST" vQ18o7="".
if id="000706H01ST" vQ18 = 1.
if id="000724I01NT" vQ18o7="".
if id="000724I01NT" vQ18 = 1.
if id="001205K01ST" vQ18o7="".
if id="001205K01ST" vQ18 = 1.
if id="001301A02NT" vQ18o7="".
if id="001301A02NT" vQ18 = 1.
if id="001406B02CT" vQ18o7="".
if id="001406B02CT" vQ18 = 1.
if id="001498C02CT" vQ18o7="".
if id="001498C02CT" vQ18 = 1.
if id="001561D02NT" vQ18o7="".
if id="001561D02NT" vQ18 = 1.
if id="001569D02NT" vQ18o7="".
if id="001569D02NT" vQ18 = 1.
if id="001582D02NT" vQ18o7="".
if id="001582D02NT" vQ18 = 1.
if id="001722F02ST" vQ18o7="".
if id="001722F02ST" vQ18 = 1.
if id="001748G02NT" vQ18o7="".
if id="001748G02NT" vQ18 = 1.
if id="001890H02NT" vQ18o7="".
if id="001890H02NT" vQ18 = 1.
if id="001987H02ST" vQ18o7="".
if id="001987H02ST" vQ18 = 1.
if id="002026I02NT" vQ18o7="".
if id="002026I02NT" vQ18 = 1.
if id="002546A03NT" vQ18o7="".
if id="002546A03NT" vQ18 = 1.
if id="002600A03ST" vQ18o7="".
if id="002600A03ST" vQ18 = 6.
if id="002713C03NT" vQ18o7="".
if id="002713C03NT" vQ18 = 1.
if id="002730C03NT" vQ18o7="".
if id="002730C03NT" vQ18 = 1.
if id="002841D03NT" vQ18o7="".
if id="002841D03NT" vQ18 = 1.
if id="002890D03ST" vQ18o7="".
if id="002890D03ST" vQ18 = 1.
if id="002903D03ET" vQ18o7="".
if id="002903D03ET" vQ18 = 1.
if id="002975F03CT" vQ18o7="".
if id="002975F03CT" vQ18 = 1.
if id="003053G03NT" vQ18o7="".
if id="003053G03NT" vQ18 = 1.
if id="003068G03NT" vQ18o7="".
if id="003068G03NT" vQ18 = 1.
if id="003133G03ST" vQ18o7="".
if id="003133G03ST" vQ18 = 1.
if id="003346I03ST" vQ18o7="".
if id="003346I03ST" vQ18 = 1.
if id="003519K03NT" vQ18o7="".
if id="003519K03NT" vQ18 = 1.
if id="003688K03CT" vQ18o7="".
if id="003688K03CT" vQ18 = 1.
if id="003785K03ST" vQ18o7="".
if id="003785K03ST" vQ18 = 1.
if id="004128D04CT" vQ18o7="".
if id="004128D04CT" vQ18 = 1.
if id="004246F04CT" vQ18o7="".
if id="004246F04CT" vQ18 = 1.
if id="004408G04ST" vQ18o7="".
if id="004408G04ST" vQ18 = 1.
if id="004494H04CT" vQ18o7="".
if id="004494H04CT" vQ18 = 1.
if id="004523H04ST" vQ18o7="".
if id="004523H04ST" vQ18 = 1.
if id="004571I04NT" vQ18o7="".
if id="004571I04NT" vQ18 = 1.
if id="004627I04ST" vQ18o7="".
if id="004627I04ST" vQ18 = 1.
if id="004638I04ST" vQ18o7="".
if id="004638I04ST" vQ18 = 1.
if id="004890K04NT" vQ18o7="".
if id="004890K04NT" vQ18 = 1.
if id="005338C05ST" vQ18o7="".
if id="005338C05ST" vQ18 = 1.
if id="005350D05NT" vQ18o7="不知道".
if id="005760H05CT" vQ18o7="".
if id="005760H05CT" vQ18 = 1.

***************************************************************.
*網路會員調查(必做)：人口變項比對，僅產生識別變項.
***************************************************************.

*性別不一致 gender2025. 
  do if any(vQ31,1,2) & any(gender2025,1,2) & gender2025~=vQ31.
  compute CKgender=1.
  else if any(vQ31,1,2).
  compute CKgender=0.
  end if.

  variable labels
  CKgender "與會員資料比對結果_性別".
  value labels
  CKgender 1 "不一致" 0 "一致".
*****************************.
*****************************.
*年次不一致 birth2025.
  do if birth2025~=vQ28 & vQ28<96.
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
*edu2025A分類如后：2未上學但識字   3小學  4國（初）中/初職  5高中職  6五專/二專/三專  7技術學院/大學  8碩博士  9其他，請說明 98 拒答 .
do if range(edu2025A,2,8) & range(vQ29,1,6) & ((any(vQ29,1)&any(edu2025A,4,5,6,7,8))|(any(vQ29,2)&any(edu2025A,5,6,7,8))|(any(vQ29,3)&any(edu2025A,6,7,8))|
    (any(vQ29,4,5)&any(edu2025A,8))|(range(vQ29,3,6)&any(edu2025A,2,3))|(range(vQ29,4,6) & any(edu2025A,4))|(any(vQ29,6)&any(edu2025A,5))).
  compute CKedu=1.
  else.
  compute CKedu=0.
  end if.

  variable labels
  CKedu "與會員資料比對結果_教育程度".
  value labels
  CKedu 1 "不一致" 0 "一致".
*CKedu修改.
if id="001274A02NT" CKedu=0.
if id="002613B03NT" CKedu=0.
if id="003841A04NT" CKedu=0.
if id="005350D05NT" CKedu=0.
EXECUTE.
*****************************.
*****************************.
*婚姻狀況由「已婚」變為「未婚」 marry2025 ( 1從未結婚   2同居  3已婚  4離婚  5分居  6喪偶 98 拒答)-本次無婚姻.
*  do if any(marry2025 ,3,4,5,6) & any(C1,1).
*  compute CKmarry=1.
*  else.
*  compute CKmarry=0.
*  end if.
*  exec.
*
*  variable labels
  CKmarry "與會員資料比對結果_婚姻".
*  value labels
  CKmarry 1 "不一致" 0 "一致".

*人口特徵不一致需列失敗案時使用-本次列為成功案.
*do if CKgender=1 | CKbirth=1 | CKedu=1.
*compute success=0.
*else.
*compute success=1.
*end if.

 * variable labels
 * success "會員資料填答結果判定".
 * value labels
 * success 1 "人口特徵全部一致" 0 "人口特徵任一不一致標記".
*exec.

ALTER TYPE CKgender CKbirth CKedu (f2.0).

***************************************************************.
*判斷注意力檢測題-本次無.
***************************************************************.
*compute  attention_AD3=0.
*do if (char.index(AD3_88_TEXT,"已讀")>0 | char.index(AD3_88_TEXT,"己讀")>0 | char.index(AD3_88_TEXT,"以讀")>0 | 
char.index(AD3_88_TEXT,"巳讀")>0 | char.index(AD3_88_TEXT,"已讀")>0 | char.index(AD3_88_TEXT,"己讀")>0 |
char.index(AD3_88_TEXT,"以讀")>0 |  char.index(AD3_88_TEXT,"巳讀")>0 |  char.index(AD3_88_TEXT,"已读")>0 |
char.index(AD3_88_TEXT,"已填")>0 | char.index(AD3_88_TEXT,"已說明")>0 |  char.index(AD3_88_TEXT,"請說明")>0 |
char.index(AD3_88_TEXT,"已ㄉㄅ")>0 | char.index(AD3_88_TEXT,"已請")>0).
*compute attention_AD3=1.
*else if any(id,5275).
*compute attention_AD3=1.
*end if.
*exec.
*現居地區分類.
NUMERIC areanow (f2.0).
do if range(vQ27city,1,6,19,19).
compute areanow=1.
else if range(vQ27city,7,11).
compute areanow=2.
else if range(vQ27city,12,16,20,20).
compute areanow=3.
else if range(vQ27city,17,18,21,22).
compute areanow=4.
end if.
  variable labels
  areanow "現居地區".
  value labels
  areanow 1 "北部區域" 2 "中部區域" 3 "南部區域" 4 "東部區域及其他".

*填答年齡分組.
NUMERIC agenow (f4.0) agegpnow(f2.0).
compute agenow = 114-vQ28.
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
NUMERIC vQ4f (F10.0) vQ12f (F2.0) vQ13_1f vQ13_2f (F10.0).
VARIABLE LABELS
vQ4f "Q4(已合併) 請問您個人（或同住家人的家庭）每個月在生活經常性的整體開銷，包含房租、貸款、水電、吃飯、交通、娛樂等等，大約是多少元？"
vQ12f "Q12(已合併) 請問您預計在 「 一年後 」 ，個人（或同住家人的家庭）每個月在「生活經常性的整體開銷」（包含房租、貸款、水電、吃飯、交通、娛樂等等），與目前每個月${Q:Q4}元相比"
vQ13_1f "Q13_1(已合併) 承上題，您預期一年後生活經常性的整體開銷會增加，請問相較於目前每個月${Q:Q4}元，大約會增加多少錢？（本題答案應為大於等於1的整數）"
vQ13_2f "Q13_2(已合併) 承上題，您預期一年後生活經常性的整體開銷會減少，請問相較於目前每個月${Q:Q4}元，每個月大約會減少多少錢？（本題答案應為大於等於1的整數）".
VALUE LABELS
vQ12f 1"增加" 2"減少" 3"大致不變"/
vQ13_1f 9999999996"跳答"/
vQ13_2f 9999999996"跳答".

compute vQ4f=vCKQ4.
do if any(vCKQ4,9999999996).
compute vQ4f=vQ4.
end if.

compute vQ12f=vQ12CK.
do if vQ12CK=96.
compute vQ12f=vQ12.
end if.

compute vQ13_1f=vQ13_1CK.
do if any(vQ13_1CK,9999999996).
compute vQ13_1f=vQ13_1.
end if.

compute vQ13_2f=vQ13_2CK.
do if any(vQ13_2CK,9999999996).
compute vQ13_2f=vQ13_2.
end if.
fre vQ4f vQ12f vQ13_1f vQ13_2f .

*計畫需求變項1.Q4<Q1+Q2+Q3標記.
NUMERIC Q4check (f2.0).
do if (vQ1+vQ2+vQ3)>vQ4f.
compute Q4check = 1.
else.
compute Q4check = 0.
end if.

variable labels
Q4check "Q4填答是否符合邏輯(Q4應大於等於Q1+Q2+Q3總計)".
value labels
Q4check 1 "Q4小於Q1+Q2+Q3總計(不合理)" 0 "Q4大於等於Q1+Q2+Q3總計(合理)".

**結束後處理.
*條件Q1房租和房貸：100萬以上
Q2食物：大於0且小於二位數、50萬以上
Q3交通：大於0且小於二位數
Q4經常性開銷：0、100萬以上.
do if   (vQ1>=1000000 | (vQ2>0 & vQ2<100) | vQ2>=500000 | (vQ3>0 & vQ3<100) | vQ4f=0 | vQ4f>=1000000) & not sys(vQ32).
compute checkQ1_Q4=1.
ELSE if not sys(vQ32).
compute checkQ1_Q4=0.
end if.
ALTER TYPE checkQ1_Q4 (F2.0).
  variable labels
  checkQ1_Q4 "確認Q1~Q4狀況".
  value labels
  checkQ1_Q4 1 "異常狀況" 0 "正常狀況".

*wlast_new.
NUMERIC wlast_new (F2.0).
DO IF NOT SYSMIS(vQ32).
    DO IF (checkQ1_Q4 = 0).
        COMPUTE wlast_new = 1.
    ELSE IF (checkQ1_Q4 = 1).
        COMPUTE wlast_new = 3.
    END IF.
ELSE IF NOT SYSMIS(v1).
    COMPUTE wlast_new = 4.
ELSE.
    COMPUTE wlast_new = 5.
END IF.

do if END2check=1.
compute wlast_new=3.
end if.
EXECUTE.
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
do if vEnd3<20260320000000.
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
  group 1"第一批3/11-19" 2"第二批3/20-29"/
  END2check 1 "未通過" 0 "通過".
FREQUENCIES END1check END2check.

NUMERIC wave (F2.0).
compute wave=1.
  variable labels
  wave "樣本期次".
  value labels
  wave 1"第一期" 2 "第二期" 3 "第三期" 4 "第四期".
EXECUTE.

save outfile="\\140.109.171.240\worker\worker_sec\網調協辦計畫\W202603 臺灣消費者預期和政策反應調查\02資料檔及不符合品\02資料檔\02修改後\調查結束處理\data_a.sav"
/drop agenow
agegpnow
END1check
END2check
/COMPRESSED.

*篩出s檔.
GET FILE="\\140.109.171.240\worker\worker_sec\網調協辦計畫\W202603 臺灣消費者預期和政策反應調查\02資料檔及不符合品\02資料檔\02修改後\調查結束處理\data_a.sav".
SELECT IF not sys(vQ32).
EXECUTE.
*FREQUENCIES areanow group date.

save outfile="\\140.109.171.240\worker\worker_sec\網調協辦計畫\W202603 臺灣消費者預期和政策反應調查\02資料檔及不符合品\02資料檔\02修改後\調查結束處理\data_s.sav"
/COMPRESSED.

*處理給計畫的s檔.
*檢查ip次數.
save outfile="\\140.109.171.240\worker\worker_sec\網調協辦計畫\W202603 臺灣消費者預期和政策反應調查\02資料檔及不符合品\02資料檔\03給計畫\data_s0330.sav"
/drop name email cellphone ic ip1 ip2 ip3 ip4 ip5 ip6 ip7 ip8 ip9
termination r wlast wno
email2026
cellphone2026
gender2025
birth2025
edu2025A
marry2025
marry2025_oth
city2025
city2025_oth
town2025
area2025
agegp
sampling_group
subgroup
group_priority
年齡分組
地理區碼
casenum
END1check
END2check
/COMPRESSED.
*進行資料處理及檢核.
GET FILE="\\140.109.171.240\worker\worker_sec\網調協辦計畫\W202603 臺灣消費者預期和政策反應調查\02資料檔及不符合品\02資料檔\02修改後\0330\data_s.sav".

**產生檢核及不合品所需變項-前置作業***************************************************************************************.
*定義調查開始日期與調查結束日期.
compute startdate=20260310000000.
compute enddate=20260330000000.
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
compute keyindate1=20260310.
compute keyindate2=20260330.
format keyindate1 keyindate2(f8.0).
compute keyin=edate.
format keyin (f8.0).
**********************************************************************************************************.
*建立m p 變項放置不符合品中文說明.
string m100 to m600 p100 to p600(a900).
ALTER TYPE id(a20).

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
*vQ27city=1,29   .
do if not range(vQ27city,1,28) | sys(vQ27city).
compute m101=concat("vQ27city=",string(vQ27city,f2)).
compute p101="vQ27city為不合理值或遺漏值".
end if.
Exec.

*vEND1=99969696969696   .
do if not range(vEND1,99969696969696,99969696969696) | sys(vEND1).
compute m102=concat("vEND1=",string(vEND1,f14)).
compute p102="vEND1為不合理值或遺漏值".
end if.
Exec.

*v1=1   .
do if not range(v1,1,1) | sys(v1).
compute m103=concat("v1=",string(v1,f2)).
compute p103="v1為不合理值或遺漏值".
end if.
Exec.

*vQ1=0,999999999   .
do if not range(vQ1,0,999999999) | sys(vQ1).
compute m104=concat("vQ1=",string(vQ1,f10)).
compute p104="vQ1為不合理值或遺漏值".
end if.
Exec.

*vQ2=0,999999999   .
do if not range(vQ2,0,999999999) | sys(vQ2).
compute m105=concat("vQ2=",string(vQ2,f10)).
compute p105="vQ2為不合理值或遺漏值".
end if.
Exec.

*vQ3=0,999999999   .
do if not range(vQ3,0,999999999) | sys(vQ3).
compute m106=concat("vQ3=",string(vQ3,f10)).
compute p106="vQ3為不合理值或遺漏值".
end if.
Exec.

*vQ4=0,999999999   .
do if not range(vQ4,0,999999999) | sys(vQ4).
compute m107=concat("vQ4=",string(vQ4,f10)).
compute p107="vQ4為不合理值或遺漏值".
end if.
Exec.

*vCKQ4=1,999999999   .
do if not range(vCKQ4,1,999999999,9999999996,9999999996) | sys(vCKQ4).
compute m108=concat("vCKQ4=",string(vCKQ4,f10)).
compute p108="vCKQ4為不合理值或遺漏值".
end if.
Exec.

*vEND2=99969696969696   .
do if not range(vEND2,99969696969696,99969696969696) | sys(vEND2).
compute m109=concat("vEND2=",string(vEND2,f14)).
compute p109="vEND2為不合理值或遺漏值".
end if.
Exec.

*vQ5=0,999999999   .
do if not range(vQ5,0,999999999) | sys(vQ5).
compute m110=concat("vQ5=",string(vQ5,f10)).
compute p110="vQ5為不合理值或遺漏值".
end if.
Exec.

*vQ6=1,3   .
do if not range(vQ6,1,3) | sys(vQ6).
compute m111=concat("vQ6=",string(vQ6,f2)).
compute p111="vQ6為不合理值或遺漏值".
end if.
Exec.

*vQ7_1=1,999999999 9999999996  .
do if not range(vQ7_1,1,999999999,9999999996,9999999996) | sys(vQ7_1).
compute m112=concat("vQ7_1=",string(vQ7_1,f10)).
compute p112="vQ7_1為不合理值或遺漏值".
end if.
Exec.

*vQ7_2=1,999999999 9999999996  .
do if not range(vQ7_2,1,999999999,9999999996,9999999996) | sys(vQ7_2).
compute m113=concat("vQ7_2=",string(vQ7_2,f10)).
compute p113="vQ7_2為不合理值或遺漏值".
end if.
Exec.

*vQ8=1,3   .
do if not range(vQ8,1,3) | sys(vQ8).
compute m114=concat("vQ8=",string(vQ8,f2)).
compute p114="vQ8為不合理值或遺漏值".
end if.
Exec.

*vQ9_1=1,999999999 9999999996  .
do if not range(vQ9_1,1,999999999,9999999996,9999999996) | sys(vQ9_1).
compute m115=concat("vQ9_1=",string(vQ9_1,f10)).
compute p115="vQ9_1為不合理值或遺漏值".
end if.
Exec.

*vQ9_2=1,999999999 9999999996  .
do if not range(vQ9_2,1,999999999,9999999996,9999999996) | sys(vQ9_2).
compute m116=concat("vQ9_2=",string(vQ9_2,f10)).
compute p116="vQ9_2為不合理值或遺漏值".
end if.
Exec.

*vQ10=1,3   .
do if not range(vQ10,1,3) | sys(vQ10).
compute m117=concat("vQ10=",string(vQ10,f2)).
compute p117="vQ10為不合理值或遺漏值".
end if.
Exec.

*vQ11_1=1,999999999 9999999996  .
do if not range(vQ11_1,1,999999999,9999999996,9999999996) | sys(vQ11_1).
compute m118=concat("vQ11_1=",string(vQ11_1,f10)).
compute p118="vQ11_1為不合理值或遺漏值".
end if.
Exec.

*vQ11_2=1,999999999 9999999996  .
do if not range(vQ11_2,1,999999999,9999999996,9999999996) | sys(vQ11_2).
compute m119=concat("vQ11_2=",string(vQ11_2,f10)).
compute p119="vQ11_2為不合理值或遺漏值".
end if.
Exec.

*vQ12=1,3   .
do if not range(vQ12,1,3,96,96) | sys(vQ12).
compute m120=concat("vQ12=",string(vQ12,f2)).
compute p120="vQ12為不合理值或遺漏值".
end if.
Exec.

*vQ13_1=1,999999999 9999999996  .
do if not range(vQ13_1,1,999999999,9999999996,9999999996) | sys(vQ13_1).
compute m121=concat("vQ13_1=",string(vQ13_1,f10)).
compute p121="vQ13_1為不合理值或遺漏值".
end if.
Exec.

*vQ13_2=1,999999999 9999999996  .
do if not range(vQ13_2,1,999999999,9999999996,9999999996) | sys(vQ13_2).
compute m122=concat("vQ13_2=",string(vQ13_2,f10)).
compute p122="vQ13_2為不合理值或遺漏值".
end if.
Exec.

*vQ12CK=1,3   .
do if not range(vQ12CK,1,3,96,96) | sys(vQ12CK).
compute m123=concat("vQ12CK=",string(vQ12CK,f2)).
compute p123="vQ12CK為不合理值或遺漏值".
end if.
Exec.

*vQ13_1CK=1,999999999 9999999996  .
do if not range(vQ13_1CK,1,999999999,9999999996,9999999996) | sys(vQ13_1CK).
compute m124=concat("vQ13_1CK=",string(vQ13_1CK,f10)).
compute p124="vQ13_1CK為不合理值或遺漏值".
end if.
Exec.

*vQ13_2CK=1,999999999 9999999996  .
do if not range(vQ13_2CK,1,999999999,9999999996,9999999996) | sys(vQ13_2CK).
compute m125=concat("vQ13_2CK=",string(vQ13_2CK,f10)).
compute p125="vQ13_2CK為不合理值或遺漏值".
end if.
Exec.

*vQ14=1,3   .
do if not range(vQ14,1,3) | sys(vQ14).
compute m126=concat("vQ14=",string(vQ14,f2)).
compute p126="vQ14為不合理值或遺漏值".
end if.
Exec.

*vQ15_1=1,999999999 9999999996  .
do if not range(vQ15_1,1,999999999,9999999996,9999999996) | sys(vQ15_1).
compute m127=concat("vQ15_1=",string(vQ15_1,f10)).
compute p127="vQ15_1為不合理值或遺漏值".
end if.
Exec.

*vQ15_2=1,999999999 9999999996  .
do if not range(vQ15_2,1,999999999,9999999996,9999999996) | sys(vQ15_2).
compute m128=concat("vQ15_2=",string(vQ15_2,f10)).
compute p128="vQ15_2為不合理值或遺漏值".
end if.
Exec.

*vQ16=1,3   .
do if not range(vQ16,1,3) | sys(vQ16).
compute m129=concat("vQ16=",string(vQ16,f2)).
compute p129="vQ16為不合理值或遺漏值".
end if.
Exec.

*vQ17_1=1,5 96  .
do if not range(vQ17_1,1,5,96,96) | sys(vQ17_1).
compute m130=concat("vQ17_1=",string(vQ17_1,f2)).
compute p130="vQ17_1為不合理值或遺漏值".
end if.
Exec.

*vQ17_1A=3,999 9999996  .
do if not range(vQ17_1A,3,999,9999999996,9999999996) | sys(vQ17_1A).
compute m131=concat("vQ17_1A=",string(vQ17_1A,f10.2)).
compute p131="vQ17_1A為不合理值或遺漏值".
end if.
Exec.

*vCK17_1A=1,2 96  .
do if not range(vCK17_1A,1,2,96,96) | sys(vCK17_1A).
compute m132=concat("vCK17_1A=",string(vCK17_1A,f2)).
compute p132="vCK17_1A為不合理值或遺漏值".
end if.
Exec.

*vQ18=1,7 96  .
do if not range(vQ18,1,7,96,96) | sys(vQ18).
compute m133=concat("vQ18=",string(vQ18,f2)).
compute p133="vQ18為不合理值或遺漏值".
end if.
Exec.

*vQ17_2=1,3 96  .
do if not range(vQ17_2,1,3,96,96) | sys(vQ17_2).
compute m134=concat("vQ17_2=",string(vQ17_2,f2)).
compute p134="vQ17_2為不合理值或遺漏值".
end if.
Exec.

*vQ17_2A=2,100 96  .
do if not range(vQ17_2A,-99999999,0.49,9999999996,9999999996) | sys(vQ17_2A).
compute m135=concat("vQ17_2A=",string(vQ17_2A,f10.2)).
compute p135="vQ17_2A為不合理值或遺漏值".
end if.
Exec.

*vCK17_2A=1,2 96  .
do if not range(vCK17_2A,1,2,96,96) | sys(vCK17_2A).
compute m136=concat("vCK17_2A=",string(vCK17_2A,f2)).
compute p136="vCK17_2A為不合理值或遺漏值".
end if.
Exec.

*vQ19=1,3   .
do if not range(vQ19,1,3) | sys(vQ19).
compute m137=concat("vQ19=",string(vQ19,f2)).
compute p137="vQ19為不合理值或遺漏值".
end if.
Exec.

*vQ20_1=1,5 96  .
do if not range(vQ20_1,1,4,96,96) | sys(vQ20_1).
compute m138=concat("vQ20_1=",string(vQ20_1,f2)).
compute p138="vQ20_1為不合理值或遺漏值".
end if.
Exec.


*vQ20_2=1,5 96  .
do if not range(vQ20_2,1,4,96,96) | sys(vQ20_2).
compute m140=concat("vQ20_2=",string(vQ20_2,f2)).
compute p140="vQ20_2為不合理值或遺漏值".
end if.
Exec.



*vQ21=1,3   .
do if not range(vQ21,1,3) | sys(vQ21).
compute m142=concat("vQ21=",string(vQ21,f2)).
compute p142="vQ21為不合理值或遺漏值".
end if.
Exec.

*vQ22=1,2   .
do if not range(vQ22,1,2) | sys(vQ22).
compute m143=concat("vQ22=",string(vQ22,f2)).
compute p143="vQ22為不合理值或遺漏值".
end if.
Exec.


*vQ23=1,10000 999996  .
do if not range(vQ23,1,10000,999996,999996) | sys(vQ23).
compute m144=concat("vQ23=",string(vQ23,f6)).
compute p144="vQ23為不合理值或遺漏值".
end if.
Exec.


*vQ24m1=0,1 96  .
do if not range(vQ24m1,0,1,96,96) | sys(vQ24m1).
compute m145=concat("vQ24m1=",string(vQ24m1,f2)).
compute p145="vQ24m1為不合理值或遺漏值".
end if.
Exec.


*vQ24m2=0,1 96  .
do if not range(vQ24m2,0,1,96,96) | sys(vQ24m2).
compute m146=concat("vQ24m2=",string(vQ24m2,f2)).
compute p146="vQ24m2為不合理值或遺漏值".
end if.
Exec.


*vQ24m3=0,1 96  .
do if not range(vQ24m3,0,1,96,96) | sys(vQ24m3).
compute m147=concat("vQ24m3=",string(vQ24m3,f2)).
compute p147="vQ24m3為不合理值或遺漏值".
end if.
Exec.

*vQ24m4=0,1 96  .
do if not range(vQ24m4,0,1,96,96) | sys(vQ24m4).
compute m148=concat("vQ24m4=",string(vQ24m4,f2)).
compute p148="vQ24m4為不合理值或遺漏值".
end if.


*vQ24m5=0,1 96  .
do if not range(vQ24m5,0,1,96,96) | sys(vQ24m5).
compute m149=concat("vQ24m5=",string(vQ24m5,f2)).
compute p149="vQ24m5為不合理值或遺漏值".
end if.


*vQ24m6=0,1 96  .
do if not range(vQ24m6,0,1,96,96) | sys(vQ24m6).
compute m150=concat("vQ24m6=",string(vQ24m6,f2)).
compute p150="vQ24m6為不合理值或遺漏值".
end if.


*vQ25=1,3 7  .
do if not range(vQ25,1,3,7,7) | sys(vQ25).
compute m151=concat("vQ25=",string(vQ25,f2)).
compute p151="vQ25為不合理值或遺漏值".
end if.


*vQ26_1=1,5 96  .
do if not range(vQ26_1,1,5,96,96) | sys(vQ26_1).
compute m152=concat("vQ26_1=",string(vQ26_1,f2)).
compute p152="vQ26_1為不合理值或遺漏值".
end if.


*vQ26_2=1,5 96  .
do if not range(vQ26_2,1,5,96,96) | sys(vQ26_2).
compute m153=concat("vQ26_2=",string(vQ26_2,f2)).
compute p153="vQ26_2為不合理值或遺漏值".
end if.


*vQ28=21,95   .
do if not range(vQ28,21,95) | sys(vQ28).
compute m154=concat("vQ28=",string(vQ28,f3)).
compute p154="vQ28為不合理值或遺漏值".
end if.


*vQ29=1,6   .
do if not range(vQ29,1,6) | sys(vQ29).
compute m155=concat("vQ29=",string(vQ29,f2)).
compute p155="vQ29為不合理值或遺漏值".
end if.


*vQ30=1,5   .
do if not range(vQ30,1,5) | sys(vQ30).
compute m156=concat("vQ30=",string(vQ30,f2)).
compute p156="vQ30為不合理值或遺漏值".
end if.


*vQ31=1,2   .
do if not range(vQ31,1,2) | sys(vQ31).
compute m157=concat("vQ31=",string(vQ31,f2)).
compute p157="vQ31為不合理值或遺漏值".
end if.


*vQ32=1,2   .
do if not range(vQ32,1,2) | sys(vQ32).
compute m158=concat("vQ32=",string(vQ32,f2)).
compute p158="vQ32為不合理值或遺漏值".
end if.



*vEND3=20260310000000,20260330000000   .
do if not range(vEND3,20260310000000,20260330000000) | sys(vEND3).
compute m159=concat("vEND3=",string(vEND3,f14)).
compute p159="vEND3為不合理值或遺漏值".
end if.
Exec.

**2.開放欄位檢核.
*vQ27city_oth 開放欄位檢核 是否為複選題=0.
do if vQ27city=29 & vQ27city_oth="".
Compute m201=concat("vQ27city=",string(vQ27city,n2),";vQ27city_oth=",char.substr(vQ27city_oth,1,150)).
compute p201="vQ27city_oth開放欄位應答而未答".
else if vQ27city~=29 & vQ27city_oth~="".
compute m201=concat("vQ27city_oth=",string(vQ27city,n2),";vQ27city_oth=",char.substr(vQ27city_oth,1,150)).
compute p201="vQ27city_oth開放欄位不該答而答".
else if vQ27city=29 & vQ27city_oth~="".
compute m201=concat("vQ27city_oth=",string(vQ27city,n2),";vQ27city_oth=",char.substr(vQ27city_oth,1,150)).
compute p201="vQ27city_oth開放欄位內容列出確認".
end if.

 *vCK17_1A 開放欄位檢核 是否為複選題=0.
do if vCK17_1A=2 & vCK17_1Ao2="".
Compute m202=concat("vCK17_1A=",string(vCK17_1A,n2),";vCK17_1Ao2=",char.substr(vCK17_1Ao2,1,150)).
compute p202="vCK17_1Ao2開放欄位應答而未答".
else if vCK17_1A~=2 & vCK17_1Ao2~="".
compute m202=concat("vCK17_1A=",string(vCK17_1A,n2),";vCK17_1Ao2=",char.substr(vCK17_1Ao2,1,150)).
compute p202="vCK17_1Ao2開放欄位不該答而答".
else if vCK17_1A=2 & vCK17_1Ao2~="".
compute m202=concat("vCK17_1A=",string(vCK17_1A,n2),";vCK17_1Ao2=",char.substr(vCK17_1Ao2,1,150)).
compute p202="vCK17_1Ao2開放欄位內容列出確認".
end if.
Exec.

 *vQ18 開放欄位檢核 是否為複選題=0.
do if vQ18=7 & vQ18o7="".
Compute m203=concat("vQ18=",string(vQ18,n2),";vQ18o7=",char.substr(vQ18o7,1,200)).
compute p203="vQ18o7開放欄位應答而未答".
else if vQ18~=7 & vQ18o7~="".
compute m203=concat("vQ18=",string(vQ18,n2),";vQ18o7=",char.substr(vQ18o7,1,200)).
compute p203="vQ18o7開放欄位不該答而答".
else if vQ18=7 & vQ18o7~="".
compute m203=concat("vQ18=",string(vQ18,n2),";vQ18o7=",char.substr(vQ18o7,1,200)).
compute p203="vQ18o7開放欄位內容列出確認".
end if.
Exec.


*vCK17_2A 開放欄位檢核 是否為複選題=0.
do if vCK17_2A=2 & vCK17_2Ao2="".
Compute m204=concat("vCK17_2A=",string(vCK17_2A,n2),";vCK17_2Ao2=",char.substr(vCK17_2Ao2,1,150)).
compute p204="vCK17_2Ao2開放欄位應答而未答".
else if vCK17_2A~=2 & vCK17_2Ao2~="".
compute m204=concat("vCK17_2A=",string(vCK17_2A,n2),";vCK17_2Ao2=",char.substr(vCK17_2Ao2,1,150)).
compute p204="vCK17_2Ao2開放欄位不該答而答".
else if vCK17_2A=2 & vCK17_2Ao2~="".
compute m204=concat("vCK17_2A=",string(vCK17_2A,n2),";vCK17_2Ao2=",char.substr(vCK17_2Ao2,1,150)).
compute p204="vCK17_2Ao2開放欄位內容列出確認".
end if.
Exec.

**3.複選題檢核.
* vQ24 組合.
STRING Q24 (A600).
COMPUTE Q24 = Rtrim(Ltrim(concat("vQ24m1=",string(vQ24m1,f2)," , ","vQ24m2=",string(vQ24m2,f2)," , ","vQ24m3=",string(vQ24m3,f2)," , ","vQ24m4=",string(vQ24m4,f2)," , ","vQ24m5=",string(vQ24m5,f2)," , ","vQ24m6=",string(vQ24m6,f2)))).

 *Q24.
vector a=vQ24m1 to vQ24m6.
COMPUTE #Q24zero = (SUM(vQ24m1 TO vQ24m6) = 0).
loop #i=1 to 5.
do if (any(a(#i),0,1) & any(a(#i+1),96))
| (any(a(#i),96) and not any(a(#i+1),96))|#Q24zero=1.
compute m301=Rtrim(Ltrim(Q24)).
compute p301="Q24至少選1項或選特殊碼應一致".
Break.
end if.
end loop.
exec.

**3.1複選互斥邏輯.

*Q24=1 複選題內互斥.
do if any(vQ24m1,1) & any(1,vQ24m2 to vQ24m6).
compute m302=Rtrim(Ltrim(Q24)).
compute p302= "Q24複選題選項應互斥".
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
vQ27city
vEND1
v1
vQ1
vQ2
vQ3
vQ4
vCKQ4
vEND2
vQ5
vQ6
vQ7_1
vQ7_2
vQ8
vQ9_1
vQ9_2
vQ10
vQ11_1
vQ11_2
vQ12
vQ13_1
vQ13_2
vQ12CK
vQ13_1CK
vQ13_2CK
vQ14
vQ15_1
vQ15_2
vQ16
vQ17_1
vQ17_1A
vCK17_1A
vQ18
vQ17_2
vQ17_2A
vCK17_2A
vQ19
vQ20_1
vQ20_2
vQ21
vQ22
vQ23
vQ24m1
vQ24m2
vQ24m3
vQ24m4
vQ24m5
vQ24m6
vQ25
vQ26_1
vQ26_2
vQ28
vQ29
vQ30
vQ31
vQ32
vEND3 /.

*END1跳題邏輯.
do if vQ27city=29 & any(1,vEND1_96).
compute m401=concat("vQ27city=",string(vQ27city,n2),",vEND1=",string(vEND1,n14)).
compute p401="地區題答其他，應答vEND1而未答".
end if.

do if range(vQ27city,1,28) & any(0,vEND1_96).
compute m402=concat("vQ27city=",string(vQ27city,n2),",vEND1=",string(vEND1,n14)).
compute p402="地區題住台灣，不應答vEND1而答".
end if.

*CKQ4跳題邏輯.
do if (vQ1+vQ2+vQ3)>vQ4 & any(1,vCKQ4_96) & any(0,vQ4_96).
compute m403=concat("vQ1=",string(vQ1,n10),",vQ2=",string(vQ2,n10),",vQ3=",string(vQ3,n10),",vQ4=",string(vQ4,n10),",vCKQ4=",string(vCKQ4,n2)).
compute p403="(vQ1+vQ2+vQ3)>vQ4，應答vCKQ4而未答".
end if.

do if (vQ1+vQ2+vQ3)<=vQ4 & any(0,vCKQ4_96) & any(0,vQ4_96).
compute m404=concat("vQ1=",string(vQ1,n10),",vQ2=",string(vQ2,n10),",vQ3=",string(vQ3,n10),",vQ4=",string(vQ4,n10),",vCKQ4=",string(vCKQ4,n2)).
compute p404="(vQ1+vQ2+vQ3)<=vQ4，不應答vCKQ4而答".
end if.

*END2跳題邏輯.
do if (vQ1+vQ2+vQ3)>vCKQ4*1.1 & any(1,vEND2_96).
compute m405=concat("vQ1=",string(vQ1,n10),",vQ2=",string(vQ2,n10),",vQ3=",string(vQ3,n10),",vQ4=",string(vQ4,n10),",vCKQ4=",string(vCKQ4,n2),",vEND2=",string(vEND2,n14)).
compute p405="(vQ1+vQ2+vQ3)>CKQ4*1.1，應答vEND2而未答".
end if.

do if (vQ1+vQ2+vQ3)<=vCKQ4*1.1 & any(0,vEND2_96).
compute m406=concat("vQ1=",string(vQ1,n10),",vQ2=",string(vQ2,n10),",vQ3=",string(vQ3,n10),",vQ4=",string(vQ4,n10),",vCKQ4=",string(vCKQ4,n2),",vEND2=",string(vEND2,n14)).
compute p406="(vQ1+vQ2+vQ3)<=CKQ4*1.1，不應答vEND2而未答".
end if.

*Q6跳題邏輯.
do if vQ6=1 & any(1,vQ7_1_96).
compute m407=concat("vQ6=",string(vQ6,n2),",vQ7_1=",string(vQ7_1,n10)).
compute p407="vQ6=1，應答vQ7_1而未答".
end if.

do if vQ6=2 & any(1,vQ7_2_96).
compute m408=concat("vQ6=",string(vQ6,n2),",vQ7_2=",string(vQ7_2,n10)).
compute p408="vQ6=2，應答vQ7_2而未答".
end if.

do if vQ6=1 & any(0,vQ7_2_96).
compute m409=concat("vQ6=",string(vQ6,n2),",vQ7_2=",string(vQ7_2,n10)).
compute p409="vQ6=1，不應答vQ7_2而答".
end if.

do if vQ6=2 & any(0,vQ7_1_96).
compute m410=concat("vQ6=",string(vQ6,n2),",vQ7_1=",string(vQ7_1,n10)).
compute p410="vQ6=2，不應答vQ7_1而答".
end if.

do if vQ6=3 & (any(0,vQ7_1_96) | any(0,vQ7_2_96)).
compute m411=concat("vQ6=",string(vQ6,n2),",vQ7_1=",string(vQ7_1,n10),",vQ7_2=",string(vQ7_2,n10)).
compute p411="vQ6=3，不應答vQ7_1 或 vQ7_2而答".
end if.

*Q8跳題邏輯.
do if vQ8=1 & any(1,vQ9_1_96).
compute m412=concat("vQ8=",string(vQ8,n2),",vQ9_1=",string(vQ9_1,n10)).
compute p412="vQ8=1，應答vQ9_1而未答".
end if.

do if vQ8=2 & any(1,vQ9_2_96).
compute m413=concat("vQ8=",string(vQ8,n2),",vQ9_2=",string(vQ9_2,n10)).
compute p413="vQ8=2，應答vQ9_2而未答".
end if.

do if vQ8=1 & any(0,vQ9_2_96).
compute m414=concat("vQ8=",string(vQ8,n2),",vQ9_2=",string(vQ9_2,n10)).
compute p414="vQ8=1，不應答vQ9_2而答".
end if.

do if vQ8=2 & any(0,vQ9_1_96).
compute m415=concat("vQ8=",string(vQ8,n2),",vQ9_1=",string(vQ9_1,n10)).
compute p415="vQ8=2，不應答vQ9_1而答".
end if.

do if vQ8=3 & (any(0,vQ9_1_96) | any(0,vQ9_2_96)).
compute m416=concat("vQ8=",string(vQ8,n2),",vQ9_1=",string(vQ9_1,n10),",vQ9_2=",string(vQ9_2,n10)).
compute p416="vQ8=3，不應答vQ9_1 或 vQ9_2而答".
end if.

*Q10跳題邏輯.
do if vQ10=1 & any(1,vQ11_1_96).
compute m417=concat("vQ10=",string(vQ10,n2),",vQ11_1=",string(vQ11_1,n10)).
compute p417="vQ10=1，應答vQ11_1而未答".
end if.

do if vQ10=2 & any(1,vQ11_2_96).
compute m418=concat("vQ10=",string(vQ10,n2),",vQ11_2=",string(vQ11_2,n10)).
compute p418="vQ10=2，應答vQ11_2而未答".
end if.

do if vQ10=1 & any(0,vQ11_2_96).
compute m419=concat("vQ10=",string(vQ10,n2),",vQ11_2=",string(vQ11_2,n10)).
compute p419="vQ10=1，不應答vQ11_2而答".
end if.

do if vQ10=2 & any(0,vQ11_1_96).
compute m420=concat("vQ10=",string(vQ10,n2),",vQ11_1=",string(vQ11_1,n10)).
compute p420="vQ10=2，不應答vQ11_1而答".
end if.

do if vQ10=3 & (any(0,vQ11_1_96) | any(0,vQ11_2_96)).
compute m421=concat("vQ10=",string(vQ10,n2),",vQ11_1=",string(vQ11_1,n10),",vQ11_2=",string(vQ11_2,n10)).
compute p421="vQ10=3，不應答vQ11_1 或 vQ11_2而答".
end if.

*Q12跳題邏輯.
do if vQ12=1 & any(1,vQ13_1_96).
compute m422=concat("vQ12=",string(vQ12,n2),",vQ13_1=",string(vQ13_1,n10)).
compute p422="vQ12=1，應答vQ13_1而未答".
end if.

do if vQ12=2 & any(1,vQ13_2_96).
compute m423=concat("vQ12=",string(vQ12,n2),",vQ13_2=",string(vQ13_2,n10)).
compute p423="vQ12=2，應答vQ13_2而未答".
end if.

do if vQ12=1 & any(0,vQ13_2_96).
compute m424=concat("vQ12=",string(vQ12,n2),",vQ13_2=",string(vQ13_2,n10)).
compute p424="vQ12=1，不應答vQ13_2而答".
end if.

do if vQ12=2 & any(0,vQ13_1_96).
compute m425=concat("vQ12=",string(vQ12,n2),",vQ13_1=",string(vQ13_1,n10)).
compute p425="vQ12=2，不應答vQ13_1而答".
end if.

do if vQ12=3 & (any(0,vQ13_1_96) | any(0,vQ13_2_96)).
compute m426=concat("vQ12=",string(vQ12,n2),",vQ13_1=",string(vQ13_1,n10),",vQ13_2=",string(vQ13_2,n10)).
compute p426="vQ12=3，不應答vQ13_1 或 vQ13_2而答".
end if.

do if (vQ1+vQ2+vQ3)<=vQ4 & any(1,vQ12_96).
compute m427=concat("vQ1=",string(vQ1,n10),",vQ2=",string(vQ2,n10),",vQ3=",string(vQ3,n10),",vQ4=",string(vQ4,n10),",vQ12=",string(vQ12,n2)).
compute p427="(vQ1+vQ2+vQ3)<=vQ4，應答vQ12而未答".
end if.

do if (vQ1+vQ2+vQ3)>vQ4 & any(0,vQ12_96).
compute m428=concat("vQ1=",string(vQ1,n10),",vQ2=",string(vQ2,n10),",vQ3=",string(vQ3,n10),",vQ4=",string(vQ4,n10),",vQ12=",string(vQ12,n2)).
compute p428="(vQ1+vQ2+vQ3)>vQ4，不應答vQ12而答".
end if.

*Q12CK跳題邏輯.
do if vQ12CK=1 & any(1,vQ13_1CK_96).
compute m429=concat("vQ12CK=",string(vQ12CK,n2),",vQ13_1CK=",string(vQ13_1CK,n10)).
compute p429="vQ12CK=1，應答vQ13_1CK而未答".
end if.

do if vQ12CK=2 & any(1,vQ13_2CK_96).
compute m430=concat("vQ12CK=",string(vQ12CK,n2),",vQ13_2CK=",string(vQ13_2CK,n10)).
compute p430="vQ12CK=2，應答vQ13_2CK而未答".
end if.

do if vQ12CK=1 & any(0,vQ13_2CK_96).
compute m431=concat("vQ12CK=",string(vQ12CK,n2),",vQ13_2CK=",string(vQ13_2CK,n10)).
compute p431="vQ12CK=1，不應答vQ13_2CK而答".
end if.

do if vQ12CK=2 & any(0,vQ13_1CK_96).
compute m432=concat("vQ12CK=",string(vQ12CK,n2),",vQ13_1CK=",string(vQ13_1CK,n10)).
compute p432="vQ12CK=2，不應答vQ13_1CK而答".
end if.

do if vQ12CK=3 & (any(0,vQ13_1CK_96) | any(0,vQ13_2CK_96)).
compute m433=concat("vQ12CK=",string(vQ12CK,n2),",vQ13_1CK=",string(vQ13_1CK,n10),",vQ13_2CK=",string(vQ13_2CK,n10)).
compute p433="vQ12CK=3，不應答vQ13_1CK 或 vQ13_2CK而答".
end if.

do if (vQ1+vQ2+vQ3)>vQ4 & any(1,vQ12CK_96).
compute m434=concat("vQ1=",string(vQ1,n10),",vQ2=",string(vQ2,n10),",vQ3=",string(vQ3,n10),",vQ4=",string(vQ4,n10),",vQ12CK=",string(vQ12CK,n2)).
compute p434="(vQ1+vQ2+vQ3)>vQ4，應答vQ12CK而未答".
end if.

do if (vQ1+vQ2+vQ3)<=vQ4 & any(0,vQ12CK_96).
compute m435=concat("vQ1=",string(vQ1,n10),",vQ2=",string(vQ2,n10),",vQ3=",string(vQ3,n10),",vQ4=",string(vQ4,n10),",vQ12CK=",string(vQ12CK,n2)).
compute p435="(vQ1+vQ2+vQ3)<=vQ4，不應答vQ12CK而答".
end if.

*Q14跳題邏輯.
do if vQ14=1 & any(1,vQ15_1_96).
compute m436=concat("vQ14=",string(vQ14,n2),",vQ15_1=",string(vQ15_1,n10)).
compute p436="vQ14=1，應答vQ15_1而未答".
end if.

do if vQ14=2 & any(1,vQ15_2_96).
compute m437=concat("vQ14=",string(vQ14,n2),",vQ15_2=",string(vQ15_2,n10)).
compute p437="vQ14=2，應答vQ15_2而未答".
end if.

do if vQ14=1 & any(0,vQ15_2_96).
compute m438=concat("vQ14=",string(vQ14,n2),",vQ15_2=",string(vQ15_2,n10)).
compute p438="vQ14=1，不應答vQ15_2而答".
end if.

do if vQ14=2 & any(0,vQ15_1_96).
compute m439=concat("vQ14=",string(vQ14,n2),",vQ15_1=",string(vQ15_1,n10)).
compute p439="vQ14=2，不應答vQ15_1而答".
end if.

do if vQ14=3 & (any(0,vQ15_1_96) | any(0,vQ15_2_96)).
compute m440=concat("vQ14=",string(vQ14,n2),",vQ15_1=",string(vQ15_1,n10),",vQ15_2=",string(vQ15_2,n10)).
compute p440="vQ14=3，不應答vQ15_1 或 vQ15_2而答".
end if.

*Q1Q2Q3Q4Q5限制邏輯.

do if vQ1=0 & vQ6=2.
compute m441=concat("vQ1=",string(vQ1,n10),",vQ6=",string(vQ6,n2)).
compute p441="vQ1=0，vQ6不能選2減少".
end if.

do if vQ2=0 & vQ8=2.
compute m442=concat("vQ2=",string(vQ2,n10),",vQ8=",string(vQ8,n2)).
compute p442="vQ2=0，vQ8不能選2減少".
end if.

do if vQ3=0 & vQ10=2.
compute m443=concat("vQ3=",string(vQ3,n10),",vQ10=",string(vQ10,n2)).
compute p443="vQ3=0，v10不能選2減少".
end if.

do if vQ4=0 & vQ12=2.
compute m444=concat("vQ4=",string(vQ4,n10),",vQ12=",string(vQ12,n2)).
compute p444="vQ4=0，v12不能選2減少".
end if.

do if vQ5=0 & vQ14=2.
compute m445=concat("vQ5=",string(vQ5,n10),",vQ14=",string(vQ14,n2)).
compute p445="vQ5=0，v14不能選2減少".
end if.

*Q16跳題邏輯.
do if vQ16=1 & any(1,vQ17_1_96).
compute m446=concat("vQ16=",string(vQ16,n2),",vQ17_1=",string(vQ17_1,n2)).
compute p446="vQ16=1，應答vQ17_1而未答".
end if.

do if vQ16=2 & any(1,vQ17_2_96).
compute m447=concat("vQ16=",string(vQ16,n2),",vQ17_2=",string(vQ17_2,n2)).
compute p447="vQ16=2，應答vQ17_2而未答".
end if.

do if vQ16=1 & any(0,vQ17_2_96).
compute m448=concat("vQ16=",string(vQ16,n2),",vQ17_2=",string(vQ17_2,n2)).
compute p448="vQ16=1，不應答vQ17_2而答".
end if.

do if vQ16=2 & any(0,vQ17_1_96).
compute m449=concat("vQ16=",string(vQ16,n2),",vQ17_1=",string(vQ17_1,n2)).
compute p449="vQ16=2，不應答vQ17_1而答".
end if.

do if vQ16=3 & (any(0,vQ17_1_96) | any(0,vQ17_2_96)).
compute m450=concat("vQ16=",string(vQ16,n2),",vQ17_1=",string(vQ17_1,n2),",vQ17_2=",string(vQ17_2,n2)).
compute p450="vQ16=3，不應答vQ17_1 或 vQ17_2而答".
end if.

*Q17_1跳題邏輯.
do if vQ17_1=5 & any(1,vQ17_1A_96).
compute m451=concat("vQ17_1=",string(vQ17_1,n2),",vQ17_1A=",string(vQ17_1A,f10.2)).
compute p451="vQ17_1=5，應答vQ17_1A而未答".
end if.

do if vQ17_1<5 & any(0,vQ17_1A_96).
compute m452=concat("vQ17_1=",string(vQ17_1,n2),",vQ17_1A=",string(vQ17_1A,f10.2)).
compute p452="vQ17_1<5，不應答vQ17_1A而答".
end if.

*Q17_1A跳題邏輯.
do if vQ17_1A>=50 & vQ17_1A<9999999996 & any(1,vCK17_1A_96).
compute m453=concat("vQ17_1A=",string(vQ17_1A,n4),",vCK17_1A=",string(vCK17_1A,n2)).
compute p453="vQ17_1A>=50，應答vCK17_1A而未答".
end if.

do if vQ17_1A<50 & any(0,vCK17_1A_96).
compute m454=concat("vQ17_1A=",string(vQ17_1A,n2),",vCK17_1A=",string(vCK17_1A,n2)).
compute p454="vQ17_1A<50，不應答vCK17_1A而答".
end if.

*Q18顯示邏輯.
do if vQ16=1 & any(1,vQ18_96).
compute m455=concat("vQ16=",string(vQ16,n2),",vQ18=",string(vQ18,n2)).
compute p455="vQ16=1，應答vQ18而未答".
end if.

do if vQ16>1 & any(0,vQ18_96).
compute m456=concat("vQ16=",string(vQ16,n2),",vQ17_2=",string(vQ18,n2)).
compute p456="vQ16>1，不應答vQ18而答".
end if.

*Q17_2跳題邏輯.
do if vQ17_2=1 & any(1,vQ17_2A_96).
compute m457=concat("vQ17_2=",string(vQ17_2,n2),",vQ17_2A=",string(vQ17_2A,f10.2)).
compute p457="vQ17_2=1，應答vQ17_2A而未答".
end if.

do if (vQ17_2=2 |vQ17_2=3) & any(0,vQ17_2A_96).
compute m458=concat("vQ17_2=",string(vQ17_2,n2),",vQ17_2A=",string(vQ17_2A,f10.2)).
compute p458="vQ17_2=2或3，不應答vQ17_2A而答".
end if.

*Q17_2A跳題邏輯.
do if vQ17_2A>=10 & vQ17_2A<51 & any(1,vCK17_2A_96).
compute m459=concat("vQ17_2A=",string(vQ17_2A,f10.2),",vCK17_2A=",string(vCK17_2A,n2)).
compute p459="vQ17_2A>=10，應答vCK17_2A而未答".
end if.

do if vQ17_2A<10 & any(0,vCK17_2A_96).
compute m460=concat("vQ17_2A=",string(vQ17_2A,f10.2),",vCK17_2A=",string(vCK17_2A,n2)).
compute p460="vQ17_2A<10，不應答vCK17_2A而答".
end if.

*Q19跳題邏輯.
do if vQ19=1 & any(1,vQ20_1_96).
compute m461=concat("vQ19=",string(vQ19,n2),",vQ20_1=",string(vQ20_1,n2)).
compute p461="vQ19=1，應答vQ20_1而未答".
end if.

do if vQ19=2 & any(1,vQ20_2_96).
compute m462=concat("vQ19=",string(vQ19,n2),",vQ20_2=",string(vQ20_2,n2)).
compute p462="vQ19=2，應答vQ20_2而未答".
end if.

do if vQ19=1 & any(0,vQ20_2_96).
compute m463=concat("vQ19=",string(vQ19,n2),",vQ20_2=",string(vQ20_2,n2)).
compute p463="vQ19=1，不應答vQ20_2而答".
end if.

do if vQ19=2 & any(0,vQ20_1_96).
compute m464=concat("vQ19=",string(vQ19,n2),",vQ20_1=",string(vQ20_1,n2)).
compute p464="vQ19=2，不應答vQ20_1而答".
end if.

do if vQ19=3 & (any(0,vQ20_1_96) | any(0,vQ20_2_96)).
compute m465=concat("vQ19=",string(vQ19,n2),",vQ20_1=",string(vQ20_1,n2),",vQ20_2=",string(vQ20_2,n2)).
compute p465="vQ19=3，不應答vQ20_1 或 vQ20_2而答".
end if.


*Q22跳題邏輯.
do if vQ22=1 & any(1,vQ2_96).
compute m470=concat("vQ22=",string(vQ22,n2),",vQ23=",string(vQ23,n6)).
compute p470="vQ22=1，應答vQ23而未答".
end if.

do if vQ22=2 & any(0,vQ23_96).
compute m471=concat("vQ22=",string(vQ22,n2),",vQ23=",string(vQ23,n6)).
compute p471="vQ22=2，不應答vQ23而答".
end if.

*Q23跳題邏輯.
do if vQ23<10000 & any(1,vQ24m1_96).
compute m472=concat("vQ23=",string(vQ23,n6),",vQ24=",Rtrim(Ltrim(Q24))).
compute p472="vQ23<10000，應答vQ24而未答".
end if.

do if vQ23=10000 & any(0,vQ24m1_96).
compute m473=concat("vQ23=",string(vQ23,n6),",vQ24=",Rtrim(Ltrim(Q24))).
compute p473="vQ23=10000，不應答vQ24而答".
end if.

*Q25跳題邏輯.
do if vQ25=1 & any(1,vQ26_1_96).
compute m474=concat("vQ25=",string(vQ25,n2),",vQ26_1=",string(vQ26_1,n2)).
compute p474="vQ25=1，應答vQ26_1而未答".
end if.

do if vQ25=2 & any(1,vQ26_2_96).
compute m475=concat("vQ25=",string(vQ25,n2),",vQ26_2=",string(vQ26_2,n2)).
compute p475="vQ25=2，應答vQ26_2而未答".
end if.

do if vQ25=1 & any(0,vQ26_2_96).
compute m476=concat("vQ25=",string(vQ25,n2),",vQ26_2=",string(vQ26_2,n2)).
compute p476="vQ25=1，不應答vQ26_2而答".
end if.

do if vQ25=2 & any(0,vQ26_1_96).
compute m477=concat("vQ25=",string(vQ25,n2),",vQ26_1=",string(vQ26_1,n2)).
compute p477="vQ25=2，不應答vQ26_1而答".
end if.

do if any(vQ25,3,7) & (any(0,vQ26_1_96) | any(0,vQ26_2_96)).
compute m478=concat("vQ25=",string(vQ25,n2),",vQ26_1=",string(vQ26_1,n2),",vQ26_2=",string(vQ26_2,n2)).
compute p478="vQ25=3 or 7，不應答vQ26_1 或 vQ26_2而答".
end if.

*檢核項目清單.
*1.Q4<Q1+Q2+Q3標記.
fre Q4check.

*教育程度上升2階列出本人填答.
 do if  ((range(vQ29,3,6)&any(edu2025A,2,3))|(range(vQ29,4,6) & any(edu2025A,4))|(any(vQ29,6)&any(edu2025A,5))) & CKgender=0 & CKbirth=0 & CKedu=1.
compute m501=concat('vQ29=',string(vQ29,n2),',edu2025A=',string(edu2025A,n2),',gender2025=',string(gender2025,n2),',birth2025=',string(birth2025,n2)).
compute p501="本人填答教育程度上升兩階".
end if.

*教育程度上升2階列出非本人填答.
do if  ((range(vQ29,3,6)&any(edu2025A,2,3))|(range(vQ29,4,6) & any(edu2025A,4))|(any(vQ29,6)&any(edu2025A,5))) & (CKgender=1 or CKbirth=1) & CKedu=1.
compute m502=concat('vQ29=',string(vQ29,n2),',edu2025A=',string(edu2025A,n2),',gender2025=',string(gender2025,n2),',birth2025=',string(birth2025,n2)).
compute p502="非本人填答教育程度上升兩階".
end if.

save  outfile="\\140.109.171.240\worker\worker_sec\網調協辦計畫\W202603 臺灣消費者預期和政策反應調查\02資料檔及不符合品\02資料檔\04檢核程式\0330\data_s_check.sav".
exec.
***************************************************************.
*資料轉置.
get file="\\140.109.171.240\worker\worker_sec\網調協辦計畫\W202603 臺灣消費者預期和政策反應調查\02資料檔及不符合品\02資料檔\04檢核程式\0330\data_s_check.sav".
exec.
***************************************************************.
sort cases by id .
VARSTOCASES  
 /MAKE 變項名稱原始答案 from m100 to m600
 /MAKE 不符合說明 from p100 to p600
 /KEEP =id  wno vQ28 vQ31 
 /null = drop                                                                         
 /count = count.   

string 檢核日期(a4).
compute 檢核日期="0330".

save  outfile="\\140.109.171.240\worker\worker_sec\網調協辦計畫\W202603 臺灣消費者預期和政策反應調查\02資料檔及不符合品\02資料檔\04檢核程式\0330\data_s檢核結果.sav".
exec.

*輸出問卷不符合品.
temp.
select if char.index(不符合說明,"開放欄位")=0  .
SAVE TRANSLATE OUTFILE="\\140.109.171.240\worker\worker_sec\網調協辦計畫\W202603 臺灣消費者預期和政策反應調查\02資料檔及不符合品\01不符合品\不符合品0330.xlsx"
  /TYPE=XLS
  /VERSION=12
  /MAP
  /FIELDNAMES VALUE=NAMES
  /CELLS=VALUES
  /EXCELOPTIONS SHEET='問卷不符合品'
  /MISSING=RECODE
  /rename=(id,vQ28,vQ31=樣本編號,年次,性別)
  /replace
  /keep=檢核日期  樣本編號 wno  性別 年次 變項名稱原始答案 不符合說明. 

*輸出開放欄位.
temp.
select if char.index(不符合說明,"開放欄位")>0.
SAVE TRANSLATE OUTFILE="\\140.109.171.240\worker\worker_sec\網調協辦計畫\W202603 臺灣消費者預期和政策反應調查\02資料檔及不符合品\01不符合品\不符合品0330.xlsx"
  /TYPE=XLS
  /VERSION=12
  /MAP
  /FIELDNAMES VALUE=NAMES
  /CELLS=VALUES
  /EXCELOPTIONS SHEET='開放欄位'
  /MISSING=RECODE
  /rename=(id,vQ28,vQ31=樣本編號,年次,性別)
  /APPEND
  /keep=檢核日期  樣本編號 wno  性別 年次 變項名稱原始答案 不符合說明. 



*篩出ss檔.
GET FILE="\\140.109.171.240\worker\worker_sec\網調協辦計畫\W202603 臺灣消費者預期和政策反應調查\02資料檔及不符合品\02資料檔\02修改後\調查結束處理\data_s.sav".
select if wlast_new=1.

save outfile="\\140.109.171.240\worker\worker_sec\網調協辦計畫\W202603 臺灣消費者預期和政策反應調查\02資料檔及不符合品\02資料檔\02修改後\調查結束處理\data_ss.sav"
/COMPRESSED.

*合併抽樣中選率、品質、加權.
GET FILE="\\140.109.171.240\worker\worker_sec\網調協辦計畫\W202603 臺灣消費者預期和政策反應調查\02資料檔及不符合品\02資料檔\02修改後\調查結束處理\data_a.sav".
SORT CASES by id wno agegp.
*手動合併.
  variable labels
  sel_rate "抽樣中選率(用以計算本計畫設計權數)".
exe.
save outfile="\\140.109.171.240\worker\worker_sec\網調協辦計畫\W202603 臺灣消費者預期和政策反應調查\02資料檔及不符合品\02資料檔\02修改後\調查結束處理\data_a合併all.sav"
/COMPRESSED.
*篩出s檔.
GET FILE="\\140.109.171.240\worker\worker_sec\網調協辦計畫\W202603 臺灣消費者預期和政策反應調查\02資料檔及不符合品\02資料檔\02修改後\調查結束處理\data_a合併all.sav".
SELECT IF not sys(vQ32).
EXECUTE.
save outfile="\\140.109.171.240\worker\worker_sec\網調協辦計畫\W202603 臺灣消費者預期和政策反應調查\02資料檔及不符合品\02資料檔\02修改後\調查結束處理\data_s合併all.sav"
/COMPRESSED.

GET FILE="\\140.109.171.240\worker\worker_sec\網調協辦計畫\W202603 臺灣消費者預期和政策反應調查\02資料檔及不符合品\02資料檔\02修改後\調查結束處理\data_s合併all.sav".
select if wlast_new=1.
**ss檔案處理.
RENAME VARIABLES vQ4=vQ4o.
RENAME VARIABLES vQ4f =vQ4.
RENAME VARIABLES vQ12=vQ12o.
RENAME VARIABLES vQ12f =vQ12.
RENAME VARIABLES vQ13_1=vQ13_1o.
RENAME VARIABLES vQ13_1f=vQ13_1.
RENAME VARIABLES vQ13_2=vQ13_2o.
RENAME VARIABLES vQ13_2f=vQ13_2.
RENAME VARIABLES wsel0=wsd.
RENAME VARIABLES Qtime_68 = Qtime.
RENAME VARIABLES Qitemcount_68 =Qitemcount.
STRING notes (A150).
do if Q4check=1.
comput notes= "此案Q4小於Q1+Q2+Q3總計(不合理)".
end if.

  VARIABLE LABELS
vQ4o "最後刪除"
vQ12o "最後刪除"
vQ13_1o "最後刪除"
vQ13_2o "最後刪除"
vCKQ4 "最後刪除"
vQ12CK "最後刪除"
vQ13_1CK "最後刪除"
vQ13_2CK "最後刪除"
  wsd "本計畫設計權數"
  notes "備註".

VALUE LABELS
vQ12 1"增加" 2"減少" 3"大致不變".
EXECUTE.

save outfile="\\140.109.171.240\worker\worker_sec\網調協辦計畫\W202603 臺灣消費者預期和政策反應調查\02資料檔及不符合品\02資料檔\02修改後\調查結束處理\data_ss.sav"
/drop name email cellphone ic ip1 ip2 ip3 ip4 ip5 ip6 ip7 ip8 ip9
termination r wlast wno
email2026
cellphone2026
gender2025
birth2025
edu2025A
marry2025
marry2025_oth
city2025
city2025_oth
town2025
area2025
sampling_group
subgroup
group_priority
年齡分組
地理區碼
casenum
Q4check
checkQ1_Q4
wave
wque_long
del_Qtime
Qtimeall
m_Qtimeall
m50_Qtimeall
Qitemrate68
中選率
areanow
wlast_new
/COMPRESSED.

*刪除不需要的變項.
DELETE VARIABLES vEND1 vEND2 vQ4o vCKQ4 vQ12o vQ12CK vQ13_1o vQ13_1CK vQ13_2o vQ13_2CK vCK17_1A
vCK17_1Ao2 vCK17_2A vCK17_2Ao2.
EXECUTE.


*資料留存內部a檔.
RENAME VARIABLES Qtime_68=Qtime.
RENAME VARIABLES Qitemcount_68=Qitemcount.
RENAME VARIABLES wsel0=w_sd.
EXECUTE.

save outfile="\\140.109.171.240\worker\worker_sec\歷次計畫提供申請資料\網調\115年度\W202603 臺灣消費者預期和政策反應調查\第一期\03 內部\data_a內部.sav"
/drop name email cellphone email2026 cellphone2026 marry2025_oth
city2025
city2025_oth
town2025
area2025
sampling_group
subgroup
group_priority
地理區碼
casenum areanow checkQ1_Q4
wque_long
del_Qtime
Qtimeall
m_Qtimeall
m50_Qtimeall
Qitemrate68 年齡分組.


**第一期追蹤案確認.
MATCH FILES
  /FILE="\\140.109.171.240\worker\worker_sec\網調協辦計畫\W202603 臺灣消費者預期和政策反應調查\01樣本\第二期\舊檔\data_ss_wave1.sav"
  /FILE="\\140.109.171.240\worker\worker_sec\網調協辦計畫\W202603 臺灣消費者預期和政策反應調查\01樣本\第一期\W202603 全套更新.sav"
  /BY id.

select if not sys(group).
EXECUTE.
***************************************************************.
*網路會員調查(必做)：人口變項比對，僅產生識別變項.
***************************************************************.

*性別不一致 gender2025. 
  do if any(vQ31,1,2) & any(gender2026,1,2) & gender2026~=vQ31.
  compute CKgender=1.
  else if any(vQ31,1,2).
  compute CKgender=0.
  end if.

  variable labels
  CKgender "與會員資料比對結果_性別".
  value labels
  CKgender 1 "不一致" 0 "一致".
*****************************.
*****************************.
*年次不一致 birth2025.
  do if birth2026~=vQ28 & vQ28<96.
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
do if range(edu2026,2,8) & range(vQ29,1,6) & ((any(vQ29,1)&any(edu2026,4,5,6,7,8))|(any(vQ29,2)&any(edu2026,5,6,7,8))|(any(vQ29,3)&any(edu2026,6,7,8))|
    (any(vQ29,4,5)&any(edu2026,8))|(range(vQ29,3,6)&any(edu2026,2,3))|(range(vQ29,4,6) & any(edu2026,4))|(any(vQ29,6)&any(edu2026,5))).
  compute CKedu=1.
  else.
  compute CKedu=0.
  end if.

  variable labels
  CKedu "與會員資料比對結果_教育程度".
  value labels
  CKedu 1 "不一致" 0 "一致".

do if CKgender=1 | CKbirth=1 .
compute success=1.
else.
compute success=0.
end if.

EXECUTE.
ALTER TYPE CKgender CKbirth CKedu success(f2.0).

*現居地區分類.
NUMERIC areanow (f2.0).
do if range(vQ27city,1,6,19,19).
compute areanow=1.
else if range(vQ27city,7,11).
compute areanow=2.
else if range(vQ27city,12,16,20,20).
compute areanow=3.
else if range(vQ27city,17,18,21,22).
compute areanow=4.
end if.
  variable labels
  areanow "現居地區"
  success "性別年次任一不符合".
  value labels
  areanow 1 "北部區域" 2 "中部區域" 3 "南部區域" 4 "東部區域及其他"/
  success 1 "性別年次任一不一致" 0 "皆一致".

*填答年齡分組.
NUMERIC agenow (f4.0) agegpnow(f2.0).
compute agenow = 114-vQ28.
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

save outfile="\\140.109.171.240\worker\worker_sec\網調協辦計畫\W202603 臺灣消費者預期和政策反應調查\01樣本\第二期\第一期追蹤確認.sav"
/COMPRESSED.

