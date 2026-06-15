* Encoding: UTF-8.
**EXTERNAL CHECK ITEMS.
* SYNTAXWORK_BEGIN_EXTERNAL_CHECKS.
* external check row 2: sel_gen,O1.
do if sel_gen=2 & any(vO1,12,13).
compute m1701=concat("sel_gen=",string(sel_gen,n2),",vO1=",string(vO1,n2)).
compute p1701="受訪者為女性,但vO1工作狀況選(12)服義務役或(13)服(研發)替代役。".
end if.
exec.

* external check row 3: A1,A2,A3,A9.
do if vA1>=57 & any(vA3,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,97,98) & any(vA9,1,2).
compute m1702=concat(
  "vA1=",
  string(vA1,n4),
  ",vA2=",
  string(vA2,n2),
  ",vA3=",
  string(vA3,n2),
  ",vA9=",
  string(vA9,n2)
).
compute p1702="57年施行九年國民義務教育,出生年在57年次以後(57歲及以下),且為台灣出生者(vA3選1-22、97、98),於vA9教育程度,不應為(01)不識字、(02)自修/小學 | (年齡計算以114年減出生年)。".
end if.
exec.

* external check row 4: A1,A2,A9.
do if vA1>92 & any(vA9,7,8).
compute m1703=concat(
  "vA1=",
  string(vA1,n4),
  ",vA2=",
  string(vA2,n2),
  ",vA9=",
  string(vA9,n2)
).
compute p1703="出生年超過民國92年次(未滿22歲者),vA9教育程度不應為(07)碩士、(08)博士 | (年齡計算以114年減出生年)。".
end if.
exec.

* external check row 5: B2.
do if not(any(vB2,9797,9898)) & vB2>1200.
compute m1704=concat("vB2=",string(vB2,n5)).
compute p1704="vB2看電視的平常日(週一到週五),一整天看超過12小時,列出確認。".
end if.
exec.

* external check row 6: B4.
do if not(any(vB4,9797,9898)) & vB4>1200.
compute m1705=concat("vB4=",string(vB4,n5)).
compute p1705="vB4有看電視的週六或週日,一整天看超過12小時,列出確認。".
end if.
exec.

* external check row 7: B6.
do if not(any(vB6,9797,9898)) & vB6>1200.
compute m1706=concat("vB6=",string(vB6,n5)).
compute p1706="vB6看電視新聞的那一天,一整天看超過12小時,列出確認。".
end if.
exec.

* external check row 8: C2.
do if not(any(vC2,9797,9898)) & vC2>1200.
compute m1707=concat("vC2=",string(vC2,n5)).
compute p1707="vC2有聽廣播的那一天,一整天聽超過12小時,列出確認。".
end if.
exec.

* external check row 9: D3.
do if not(any(vD3,9797,9898)) & vD3>1600.
compute m1708=concat("vD3=",string(vD3,n5)).
compute p1708="vD3有用手機的那一天,一整天用超過16小時,列出確認。".
end if.
exec.

* external check row 10: E5,E8,E11.
compute sumE5_E12_min=(trunc(vE5/100)*60 + mod(vE5,100)) + (trunc(vE6/100)*60 + mod(vE6,100)) + (trunc(vE8/100)*60 + mod(vE8,100)) + (trunc(vE9/100)*60 + mod(vE9,100)) + (trunc(vE11/100)*60 + mod(vE11,100)) + (trunc(vE12/100)*60 + mod(vE12,100)).
compute sumE5_E8_E11_min=(trunc(vE5/100)*60 + mod(vE5,100)) + (trunc(vE8/100)*60 + mod(vE8,100)) + (trunc(vE11/100)*60 + mod(vE11,100)).
do if not(any(vE5,9797,9898)) & not(any(vE8,9797,9898)) & not(any(vE11,9797,9898)) & ((trunc(vE5/100)*60 + mod(vE5,100)) + (trunc(vE8/100)*60 + mod(vE8,100)) + (trunc(vE11/100)*60 + mod(vE11,100)))>960.
compute m1709=concat(
  "vE5=",
  string(vE5,n5),
  ",vE8=",
  string(vE8,n5),
  ",vE11=",
  string(vE11,n5),
  ",sumE5_E12_min=",
  string(sumE5_E12_min,n8),
  ",sumE5_E8_E11_min=",
  string(sumE5_E8_E11_min,n8),
  ",vE6=",
  string(vE6,n5),
  ",vE9=",
  string(vE9,n5),
  ",vE12=",
  string(vE12,n5)
).
compute p1709="各項裝置(手機、平板及電腦)因工作與課業而上網的時間相加超過16小時,列出確認。".
end if.
exec.

* external check row 11: E5,E8,E11.
compute sumE5_E12_min=(trunc(vE5/100)*60 + mod(vE5,100)) + (trunc(vE6/100)*60 + mod(vE6,100)) + (trunc(vE8/100)*60 + mod(vE8,100)) + (trunc(vE9/100)*60 + mod(vE9,100)) + (trunc(vE11/100)*60 + mod(vE11,100)) + (trunc(vE12/100)*60 + mod(vE12,100)).
compute sumE6_E9_E12_min=(trunc(vE6/100)*60 + mod(vE6,100)) + (trunc(vE9/100)*60 + mod(vE9,100)) + (trunc(vE12/100)*60 + mod(vE12,100)).
do if not(any(vE6,9797,9898)) & not(any(vE9,9797,9898)) & not(any(vE12,9797,9898)) & ((trunc(vE6/100)*60 + mod(vE6,100)) + (trunc(vE9/100)*60 + mod(vE9,100)) + (trunc(vE12/100)*60 + mod(vE12,100)))>960.
compute m1710=concat(
  "vE6=",
  string(vE6,n5),
  ",vE9=",
  string(vE9,n5),
  ",vE12=",
  string(vE12,n5),
  ",sumE5_E12_min=",
  string(sumE5_E12_min,n8),
  ",sumE6_E9_E12_min=",
  string(sumE6_E9_E12_min,n8),
  ",vE5=",
  string(vE5,n5),
  ",vE8=",
  string(vE8,n5),
  ",vE11=",
  string(vE11,n5)
).
compute p1710="各項裝置(手機、平板及電腦)非因工作與課業而上網的時間相加超過16小時,列出確認。".
end if.
exec.

* external check row 12: E5,E6.
compute sumE5_E12_min=(trunc(vE5/100)*60 + mod(vE5,100)) + (trunc(vE6/100)*60 + mod(vE6,100)) + (trunc(vE8/100)*60 + mod(vE8,100)) + (trunc(vE9/100)*60 + mod(vE9,100)) + (trunc(vE11/100)*60 + mod(vE11,100)) + (trunc(vE12/100)*60 + mod(vE12,100)).
compute sumE5_E6_min=(trunc(vE5/100)*60 + mod(vE5,100)) + (trunc(vE6/100)*60 + mod(vE6,100)).
do if not(any(vE5,9797,9898)) & not(any(vE6,9797,9898)) & ((trunc(vE5/100)*60 + mod(vE5,100)) + (trunc(vE6/100)*60 + mod(vE6,100)))>960.
compute m1711=concat(
  "vE5=",
  string(vE5,n5),
  ",vE6=",
  string(vE6,n5),
  ",sumE5_E12_min=",
  string(sumE5_E12_min,n8),
  ",sumE5_E6_min=",
  string(sumE5_E6_min,n8),
  ",vE8=",
  string(vE8,n5),
  ",vE9=",
  string(vE9,n5),
  ",vE11=",
  string(vE11,n5),
  ",vE12=",
  string(vE12,n5)
).
compute p1711="vE5、vE6使用手機上網的時間相加超過16小時。".
end if.
exec.

* external check row 13: E8,E9.
compute sumE5_E12_min=(trunc(vE5/100)*60 + mod(vE5,100)) + (trunc(vE6/100)*60 + mod(vE6,100)) + (trunc(vE8/100)*60 + mod(vE8,100)) + (trunc(vE9/100)*60 + mod(vE9,100)) + (trunc(vE11/100)*60 + mod(vE11,100)) + (trunc(vE12/100)*60 + mod(vE12,100)).
compute sumE8_E9_min=(trunc(vE8/100)*60 + mod(vE8,100)) + (trunc(vE9/100)*60 + mod(vE9,100)).
do if not(any(vE8,9797,9898)) & not(any(vE9,9797,9898)) & ((trunc(vE8/100)*60 + mod(vE8,100)) + (trunc(vE9/100)*60 + mod(vE9,100)))>960.
compute m1712=concat(
  "vE8=",
  string(vE8,n5),
  ",vE9=",
  string(vE9,n5),
  ",sumE5_E12_min=",
  string(sumE5_E12_min,n8),
  ",sumE8_E9_min=",
  string(sumE8_E9_min,n8),
  ",vE5=",
  string(vE5,n5),
  ",vE6=",
  string(vE6,n5),
  ",vE11=",
  string(vE11,n5),
  ",vE12=",
  string(vE12,n5)
).
compute p1712="vE8、vE9使用平板上網的時間相加超過16小時。".
end if.
exec.

* external check row 14: E11,E12.
compute sumE5_E12_min=(trunc(vE5/100)*60 + mod(vE5,100)) + (trunc(vE6/100)*60 + mod(vE6,100)) + (trunc(vE8/100)*60 + mod(vE8,100)) + (trunc(vE9/100)*60 + mod(vE9,100)) + (trunc(vE11/100)*60 + mod(vE11,100)) + (trunc(vE12/100)*60 + mod(vE12,100)).
compute sumE11_E12_min=(trunc(vE11/100)*60 + mod(vE11,100)) + (trunc(vE12/100)*60 + mod(vE12,100)).
do if not(any(vE11,9797,9898)) & not(any(vE12,9797,9898)) & ((trunc(vE11/100)*60 + mod(vE11,100)) + (trunc(vE12/100)*60 + mod(vE12,100)))>960.
compute m1713=concat(
  "vE11=",
  string(vE11,n5),
  ",vE12=",
  string(vE12,n5),
  ",sumE5_E12_min=",
  string(sumE5_E12_min,n8),
  ",sumE11_E12_min=",
  string(sumE11_E12_min,n8),
  ",vE5=",
  string(vE5,n5),
  ",vE6=",
  string(vE6,n5),
  ",vE8=",
  string(vE8,n5),
  ",vE9=",
  string(vE9,n5)
).
compute p1713="vE11、vE12使用電腦上網的時間相加超過16小時。".
end if.
exec.

* external check row 15: E5,E6,D3.
do if (vE5+vE6)>(vD3+200).
compute m1714=concat(
  "vE5=",
  string(vE5,n5),
  ",vE6=",
  string(vE6,n5),
  ",vD3=",
  string(vD3,n5)
).
compute p1714="vE5、vE6使用手機上網的時間相加大於vD3的時間2小時,列出確認。".
end if.
exec.

* external check row 17: F2.
do if not(any(vF2,9797,9898)) & vF2>500.
compute m1716=concat("vF2=",string(vF2,n5)).
compute p1716="vF2有讀雜誌(紙本),一整天看超過5小時,列出確認。".
end if.
exec.

* external check row 18: F4.
do if not(any(vF4,9797,9898)) & vF4>500.
compute m1717=concat("vF4=",string(vF4,n5)).
compute p1717="vF4有讀雜誌(網路),一整天看超過5小時,列出確認。".
end if.
exec.

* external check row 19: G2.
do if not(any(vG2,9797,9898)) & vG2>500.
compute m1718=concat("vG2=",string(vG2,n5)).
compute p1718="vG2有讀報紙(紙本),一整天看超過5小時,列出確認。".
end if.
exec.

* external check row 20: G5.
do if not(any(vG5,9797,9898)) & vG5>500.
compute m1719=concat("vG5=",string(vG5,n5)).
compute p1719="vG5有上網看新聞的那一天,一整天看超過5小時,列出確認。".
end if.
exec.

* external check row 21: H1,H4,H7.
do if range(vH1,0,990) & range(vH4,0,990) & vH7=997.
compute m1720=concat(
  "vH1=",
  string(vH1,n4),
  ",vH4=",
  string(vH4,n4),
  ",vH7=",
  string(vH7,n4)
).
compute p1720="vH1「面對面」接觸人數回答0~990且vH4「網路上」接觸人數回答0~990,在vH7「面對面」且「網路上」接觸的人數卻回答(997)不知道。".
end if.
exec.

* external check row 22: H7,H7_1,H7_2,H7_3.
do if (not(any(vH7,991,997,998)) & vH7>30) | (not(any(vH7_1,991,997,998)) & vH7_1>30) | (not(any(vH7_2,991,997,998)) & vH7_2>30) | (not(any(vH7_3,991,997,998)) & vH7_3>30).
compute m1721=concat(
  "vH7=",
  string(vH7,n4),
  ",vH7_1=",
  string(vH7_1,n4),
  ",vH7_2=",
  string(vH7_2,n4),
  ",vH7_3=",
  string(vH7_3,n4)
).
compute p1721="vH7-vH7_3平常一天「面對面」且「網路上」接觸的人數超過30人,列出確認。".
end if.
exec.

* external check row 23: Q24.
do if not(any(vQ24g1,997,998)) & vQ24g1>35.
compute m1722=concat("vQ24g1=",string(vQ24g1,n4)).
compute p1722="vQ24看談話性政論節目,每星期看超過35小時,列出確認。".
end if.
exec.

* external check row 24: Q21.
do if not(any(vQ21g1,997,998)) & vQ21g1>35.
compute m1723=concat("vQ21g1=",string(vQ21g1,n4)).
compute p1723="vQ21看政治人物或政治網紅影片,每星期看超過35小時,列出確認。".
end if.
exec.

* external check row 25: Q26A.
do if not(any(vQ26Ag1,997,998)) & vQ26Ag1>35.
compute m1724=concat("vQ26Ag1=",string(vQ26Ag1,n4)).
compute p1724="vQ26A聽政治或公共事務播客,每星期聽超過35小時,列出確認。".
end if.
exec.

* external check row 26: Q28.
do if (not(any(vQ28,991,997,998)) & vQ28>50).
compute m1725=concat("vQ28=",string(vQ28,n4)).
compute p1725="vQ28經常一起討論政治或公共事務的人數超過50人,列出確認。".
end if.
exec.

* external check row 27: H8.
do if (not(any(vH8,991,997,998)) & vH8>50).
compute m1726=concat("vH8=",string(vH8,n4)).
compute p1726="vH8經常會一起討論「個人」問題或心事的人超過50人,列出確認。".
end if.
exec.

* external check row 28: I2.
do if not(any(vI2,9797,9898)) & vI2>1200.
compute m1727=concat("vI2=",string(vI2,n5)).
compute p1727="vI2看戲劇節目的平常日(週一到週五),一整天看超過12小時,列出確認。".
end if.
exec.

* external check row 29: I4.
do if not(any(vI4,9797,9898)) & vI4>1200.
compute m1728=concat("vI4=",string(vI4,n5)).
compute p1728="vI4看戲劇節目的週六或週日,一整天看超過12小時,列出確認。".
end if.
exec.

* external check row 30: KFB2.
do if not(any(vKFB2,9797,9898)) & vKFB2>1600.
compute m1729=concat("vKFB2=",string(vKFB2,n5)).
compute p1729="vKFB2有使用臉書,一整天用超過16小時,列出確認。".
end if.
exec.

* external check row 31: KIG2.
do if not(any(vKIG2,9797,9898)) & vKIG2>1600.
compute m1730=concat("vKIG2=",string(vKIG2,n5)).
compute p1730="vKIG2有使用IG,一整天用超過16小時,列出確認。".
end if.
exec.

* external check row 32: KLI2.
do if not(any(vKLI2,9797,9898)) & vKLI2>1600.
compute m1731=concat("vKLI2=",string(vKLI2,n5)).
compute p1731="vKLI2有使用LINE,一整天用超過16小時,列出確認。".
end if.
exec.

* external check row 33: KTT2.
do if not(any(vKTT2,9797,9898)) & vKTT2>1600.
compute m1732=concat("vKTT2=",string(vKTT2,n5)).
compute p1732="vKTT2有使用抖音(TikTok),一整天用超過16小時,列出確認。".
end if.
exec.

* external check row 34: KYT2.
do if not(any(vKYT2,9797,9898)) & vKYT2>1600.
compute m1733=concat("vKYT2=",string(vKYT2,n5)).
compute p1733="vKYT2有使用YouTube,一整天用超過16小時,列出確認。".
end if.
exec.

* external check row 35: P5_2.
do if not(any(vP5_2,9797,9898)) & vP5_2>1600.
compute m1734=concat("vP5_2=",string(vP5_2,n5)).
compute p1734="vP5_2有使用Threads,一整天用超過16小時,列出確認。".
end if.
exec.

* external check row 36: M1.
do if not(any(vM1g01,9797,9898)) & not(any(vM1g02,9797,9898)) & ((trunc(vM1g01/100)*60 + mod(vM1g01,100)) + (trunc(vM1g02/100)*60 + mod(vM1g02,100)))>3840.
compute m1735=concat("vM1g01=",string(vM1g01,n2),",vM1g02=",string(vM1g02,n2)).
compute p1735="vM1玩電玩遊戲一週超過64小時列出確認。".
end if.
exec.

* external check row 37: vA1,O1.
do if vA1>74 & vO1=9.
compute m1736=concat("vA1=",string(vA1,n4),",vO1=",string(vO1,n2)).
compute p1736="出生年超過民國74年次(未滿40歲者),vO1目前工作不應為(09)已經退休 | (年齡計算以114減出生年)。".
end if.
exec.

* external check row 41: K1,KTT4.
do if vK1m11=1 & vKTT4m13~=1 & vKTT4m14~=1.
compute m1740=concat(
  "vK1m11=",
  string(vK1m11,n2),
  ",vKTT4m13=",
  string(vKTT4m13,n2),
  ",vKTT4m14=",
  string(vKTT4m14,n2)
).
compute p1740="K1有選(11)抖音,KTT4非選(97)不知道(98)拒答者,沒有選(13)分享或轉貼、轉寄影片,也沒有選(14)傳送訊息或視訊".
end if.
exec.

* external check row 42: Q5,Q6,Q7,Q8,Q9.
do if vQ5=1 & vQ6=1 & vQ7=1 & vQ8=1 & vQ9=1.
compute m1741=concat(
  "vQ5=",
  string(vQ5,n2),
  ",vQ6=",
  string(vQ6,n2),
  ",vQ7=",
  string(vQ7,n2),
  ",vQ8=",
  string(vQ8,n2),
  ",vQ9=",
  string(vQ9,n2)
).
compute p1741="Q5答有透過網路接觸到政治消息,但Q6-Q9皆回答(01)從來沒有".
end if.
exec.

* external check row 43: Q10,Q11,Q12,Q13,Q14.
do if vQ10=1 & vQ11=1 & vQ12=1 & vQ13=1 & vQ14=1.
compute m1742=concat(
  "vQ10=",
  string(vQ10,n2),
  ",vQ11=",
  string(vQ11,n2),
  ",vQ12=",
  string(vQ12,n2),
  ",vQ13=",
  string(vQ13,n2),
  ",vQ14=",
  string(vQ14,n2)
).
compute p1742="Q10答有透過網路轉貼或分享政治消息,但Q11-Q14皆回答(01)從來沒有".
end if.
exec.

* external check row 44: Q47,Q51.
do if vQ47=0 & vQ51=1.
compute m1743=concat("vQ47=",string(vQ47,n4),",vQ51=",string(vQ51,n2)).
compute p1743="Q47答0分者,在Q51答(01)國民黨,請列出檢核。".
end if.
exec.

* external check row 45: Q48,Q51.
do if vQ48=0 & vQ51=2.
compute m1744=concat("vQ48=",string(vQ48,n4),",vQ51=",string(vQ51,n2)).
compute p1744="Q48答0分者,在Q51答(02)民進黨,請列出檢核。".
end if.
exec.

* external check row 46: Q62,Q51.
do if vQ62=0 & vQ51=8.
compute m1745=concat("vQ62=",string(vQ62,n4),",vQ51=",string(vQ51,n2)).
compute p1745="Q62答0分者,在Q51答(08)台灣民眾黨,請列出檢核。".
end if.
exec.

* external check row 47: Q53,P3_1.
do if vQ53=1 & vP3_1=0.
compute m1746=concat("vQ53=",string(vQ53,n2),",vP3_1=",string(vP3_1,n3)).
compute p1746="Q53答(01)儘快統一者,P3_1答0分者,請列出檢核。".
end if.
exec.

* external check row 48: Q53,P3_1.
do if vQ53=2 & vP3_1=10.
compute m1747=concat("vQ53=",string(vQ53,n2),",vP3_1=",string(vP3_1,n3)).
compute p1747="Q53答(02)儘快宣佈獨立,P3_1答10分者,請列出檢核。".
end if.
exec.

* SYNTAXWORK_END_EXTERNAL_CHECKS.
