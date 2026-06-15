* Encoding: UTF-8.

* Generated survey check syntax.

* Sections are generated separately, then combined here in execution order.

* Encoding: UTF-8.

**NUMERIC CHECKS.

* SYNTAXWORK_BEGIN_NUMERIC.

*vQ27city=1,29 .
do if not range(vQ27city,1,29) | sys(vQ27city).
compute m101=concat("vQ27city=",string(vQ27city,f2)).
compute p101="vQ27city為不合理值或遺漏值".
end if.
Exec.

*vEND1=99969696969696 .
do if not range(vEND1,99969696969696,99969696969696) | sys(vEND1).
compute m102=concat("vEND1=",string(vEND1,f14)).
compute p102="vEND1為不合理值或遺漏值".
end if.
Exec.

*v1=1 .
do if not range(v1,1,1) | sys(v1).
compute m103=concat("v1=",string(v1,f2)).
compute p103="v1為不合理值或遺漏值".
end if.
Exec.

*vQ1=0,999999999 .
do if not range(vQ1,0,999999999) | sys(vQ1).
compute m104=concat("vQ1=",string(vQ1,f10)).
compute p104="vQ1為不合理值或遺漏值".
end if.
Exec.

*vQ2=0,999999999 .
do if not range(vQ2,0,999999999) | sys(vQ2).
compute m105=concat("vQ2=",string(vQ2,f10)).
compute p105="vQ2為不合理值或遺漏值".
end if.
Exec.

*vQ3=0,999999999 .
do if not range(vQ3,0,999999999) | sys(vQ3).
compute m106=concat("vQ3=",string(vQ3,f10)).
compute p106="vQ3為不合理值或遺漏值".
end if.
Exec.

*vQ4=0,999999999 .
do if not range(vQ4,0,999999999) | sys(vQ4).
compute m107=concat("vQ4=",string(vQ4,f10)).
compute p107="vQ4為不合理值或遺漏值".
end if.
Exec.

*vCKQ4=1,999999999 .
do if not range(vCKQ4,1,999999999) | sys(vCKQ4).
compute m108=concat("vCKQ4=",string(vCKQ4,f10)).
compute p108="vCKQ4為不合理值或遺漏值".
end if.
Exec.

*vEND2=99969696969696 .
do if not range(vEND2,99969696969696,99969696969696) | sys(vEND2).
compute m109=concat("vEND2=",string(vEND2,f14)).
compute p109="vEND2為不合理值或遺漏值".
end if.
Exec.

*vQ5=0,999999999 .
do if not range(vQ5,0,999999999) | sys(vQ5).
compute m110=concat("vQ5=",string(vQ5,f10)).
compute p110="vQ5為不合理值或遺漏值".
end if.
Exec.

*vQ6=1,3 .
do if not range(vQ6,1,3) | sys(vQ6).
compute m111=concat("vQ6=",string(vQ6,f2)).
compute p111="vQ6為不合理值或遺漏值".
end if.
Exec.

*vQ7_1=1,999999999 9999999996 .
do if not range(vQ7_1,1,999999999,9999999996,9999999996) | sys(vQ7_1).
compute m112=concat("vQ7_1=",string(vQ7_1,f10)).
compute p112="vQ7_1為不合理值或遺漏值".
end if.
Exec.

*vQ7_2=1,999999999 9999999996 .
do if not range(vQ7_2,1,999999999,9999999996,9999999996) | sys(vQ7_2).
compute m113=concat("vQ7_2=",string(vQ7_2,f10)).
compute p113="vQ7_2為不合理值或遺漏值".
end if.
Exec.

*vQ8=1,3 .
do if not range(vQ8,1,3) | sys(vQ8).
compute m114=concat("vQ8=",string(vQ8,f2)).
compute p114="vQ8為不合理值或遺漏值".
end if.
Exec.

*vQ9_1=1,999999999 9999999996 .
do if not range(vQ9_1,1,999999999,9999999996,9999999996) | sys(vQ9_1).
compute m115=concat("vQ9_1=",string(vQ9_1,f10)).
compute p115="vQ9_1為不合理值或遺漏值".
end if.
Exec.

*vQ9_2=1,999999999 9999999996 .
do if not range(vQ9_2,1,999999999,9999999996,9999999996) | sys(vQ9_2).
compute m116=concat("vQ9_2=",string(vQ9_2,f10)).
compute p116="vQ9_2為不合理值或遺漏值".
end if.
Exec.

*vQ10=1,3 .
do if not range(vQ10,1,3) | sys(vQ10).
compute m117=concat("vQ10=",string(vQ10,f2)).
compute p117="vQ10為不合理值或遺漏值".
end if.
Exec.

*vQ11_1=1,999999999 9999999996 .
do if not range(vQ11_1,1,999999999,9999999996,9999999996) | sys(vQ11_1).
compute m118=concat("vQ11_1=",string(vQ11_1,f10)).
compute p118="vQ11_1為不合理值或遺漏值".
end if.
Exec.

*vQ11_2=1,999999999 9999999996 .
do if not range(vQ11_2,1,999999999,9999999996,9999999996) | sys(vQ11_2).
compute m119=concat("vQ11_2=",string(vQ11_2,f10)).
compute p119="vQ11_2為不合理值或遺漏值".
end if.
Exec.

*vQ12=1,3 .
do if not range(vQ12,1,3) | sys(vQ12).
compute m120=concat("vQ12=",string(vQ12,f2)).
compute p120="vQ12為不合理值或遺漏值".
end if.
Exec.

*vQ13_1=1,999999999 9999999996 .
do if not range(vQ13_1,1,999999999,9999999996,9999999996) | sys(vQ13_1).
compute m121=concat("vQ13_1=",string(vQ13_1,f10)).
compute p121="vQ13_1為不合理值或遺漏值".
end if.
Exec.

*vQ13_2=1,999999999 9999999996 .
do if not range(vQ13_2,1,999999999,9999999996,9999999996) | sys(vQ13_2).
compute m122=concat("vQ13_2=",string(vQ13_2,f10)).
compute p122="vQ13_2為不合理值或遺漏值".
end if.
Exec.

*vQ12CK=1,3 .
do if not range(vQ12CK,1,3) | sys(vQ12CK).
compute m123=concat("vQ12CK=",string(vQ12CK,f2)).
compute p123="vQ12CK為不合理值或遺漏值".
end if.
Exec.

*vQ13_1CK=1,999999999 9999999996 .
do if not range(vQ13_1CK,1,999999999,9999999996,9999999996) | sys(vQ13_1CK).
compute m124=concat("vQ13_1CK=",string(vQ13_1CK,f10)).
compute p124="vQ13_1CK為不合理值或遺漏值".
end if.
Exec.

*vQ13_2CK=1,999999999 9999999996 .
do if not range(vQ13_2CK,1,999999999,9999999996,9999999996) | sys(vQ13_2CK).
compute m125=concat("vQ13_2CK=",string(vQ13_2CK,f10)).
compute p125="vQ13_2CK為不合理值或遺漏值".
end if.
Exec.

*vQ14=1,3 .
do if not range(vQ14,1,3) | sys(vQ14).
compute m126=concat("vQ14=",string(vQ14,f2)).
compute p126="vQ14為不合理值或遺漏值".
end if.
Exec.

*vQ15_1=1,999999999 9999999996 .
do if not range(vQ15_1,1,999999999,9999999996,9999999996) | sys(vQ15_1).
compute m127=concat("vQ15_1=",string(vQ15_1,f10)).
compute p127="vQ15_1為不合理值或遺漏值".
end if.
Exec.

*vQ15_2=1,999999999 9999999996 .
do if not range(vQ15_2,1,999999999,9999999996,9999999996) | sys(vQ15_2).
compute m128=concat("vQ15_2=",string(vQ15_2,f10)).
compute p128="vQ15_2為不合理值或遺漏值".
end if.
Exec.

*vQ16=1,3 .
do if not range(vQ16,1,3) | sys(vQ16).
compute m129=concat("vQ16=",string(vQ16,f2)).
compute p129="vQ16為不合理值或遺漏值".
end if.
Exec.

*vQ17_1=1,4 96 .
do if not range(vQ17_1,1,4,96,96) | sys(vQ17_1).
compute m130=concat("vQ17_1=",string(vQ17_1,f2)).
compute p130="vQ17_1為不合理值或遺漏值".
end if.
Exec.

*vQ17_1A=3,999 9999996 .
do if not range(vQ17_1A,3,999,9999996,9999996) | sys(vQ17_1A).
compute m131=concat("vQ17_1A=",string(vQ17_1A,f7)).
compute p131="vQ17_1A為不合理值或遺漏值".
end if.
Exec.

*vCK17_1A=1,2 96 .
do if not range(vCK17_1A,1,2,96,96) | sys(vCK17_1A).
compute m132=concat("vCK17_1A=",string(vCK17_1A,f2)).
compute p132="vCK17_1A為不合理值或遺漏值".
end if.
Exec.

*vQ18=1,7 96 .
do if not range(vQ18,1,7,96,96) | sys(vQ18).
compute m133=concat("vQ18=",string(vQ18,f2)).
compute p133="vQ18為不合理值或遺漏值".
end if.
Exec.

*vQ17_2=1,3 96 .
do if not range(vQ17_2,1,3,96,96) | sys(vQ17_2).
compute m134=concat("vQ17_2=",string(vQ17_2,f2)).
compute p134="vQ17_2為不合理值或遺漏值".
end if.
Exec.

*vQ17_2A=2,100 96 .
do if not range(vQ17_2A,2,100,96,96) | sys(vQ17_2A).
compute m135=concat("vQ17_2A=",string(vQ17_2A,f7)).
compute p135="vQ17_2A為不合理值或遺漏值".
end if.
Exec.

*vCK17_2A=1,2 96 .
do if not range(vCK17_2A,1,2,96,96) | sys(vCK17_2A).
compute m136=concat("vCK17_2A=",string(vCK17_2A,f2)).
compute p136="vCK17_2A為不合理值或遺漏值".
end if.
Exec.

*vQ19=1,3 .
do if not range(vQ19,1,3) | sys(vQ19).
compute m137=concat("vQ19=",string(vQ19,f2)).
compute p137="vQ19為不合理值或遺漏值".
end if.
Exec.

*vQ20_1=1,5 96 .
do if not range(vQ20_1,1,5,96,96) | sys(vQ20_1).
compute m138=concat("vQ20_1=",string(vQ20_1,f2)).
compute p138="vQ20_1為不合理值或遺漏值".
end if.
Exec.

*vQ20_1A=0.3,10 96 .
do if not range(vQ20_1A,0.3,10,96,96) | sys(vQ20_1A).
compute m139=concat("vQ20_1A=",string(vQ20_1A,f2)).
compute p139="vQ20_1A為不合理值或遺漏值".
end if.
Exec.

*vQ20_2=1,5 96 .
do if not range(vQ20_2,1,5,96,96) | sys(vQ20_2).
compute m140=concat("vQ20_2=",string(vQ20_2,f2)).
compute p140="vQ20_2為不合理值或遺漏值".
end if.
Exec.

*vQ20_2A=0.3,2.091 96 .
do if not range(vQ20_2A,0.3,2.091,96,96) | sys(vQ20_2A).
compute m141=concat("vQ20_2A=",string(vQ20_2A,f2)).
compute p141="vQ20_2A為不合理值或遺漏值".
end if.
Exec.

*vQ21=1,3 .
do if not range(vQ21,1,3) | sys(vQ21).
compute m142=concat("vQ21=",string(vQ21,f2)).
compute p142="vQ21為不合理值或遺漏值".
end if.
Exec.

*vQ22=1,2 .
do if not range(vQ22,1,2) | sys(vQ22).
compute m143=concat("vQ22=",string(vQ22,f2)).
compute p143="vQ22為不合理值或遺漏值".
end if.
Exec.

*vQ23=1,10000 999996 .
do if not range(vQ23,1,10000,999996,999996) | sys(vQ23).
compute m144=concat("vQ23=",string(vQ23,f6)).
compute p144="vQ23為不合理值或遺漏值".
end if.
Exec.

*vQ24m1=0,1 96 .
do if not range(vQ24m1,0,1,96,96) | sys(vQ24m1).
compute m145=concat("vQ24m1=",string(vQ24m1,f2)).
compute p145="vQ24m1為不合理值或遺漏值".
end if.
Exec.

*vQ24m2=0,1 96 .
do if not range(vQ24m2,0,1,96,96) | sys(vQ24m2).
compute m146=concat("vQ24m2=",string(vQ24m2,f2)).
compute p146="vQ24m2為不合理值或遺漏值".
end if.
Exec.

*vQ24m3=0,1 96 .
do if not range(vQ24m3,0,1,96,96) | sys(vQ24m3).
compute m147=concat("vQ24m3=",string(vQ24m3,f2)).
compute p147="vQ24m3為不合理值或遺漏值".
end if.
Exec.

*vQ24m4=0,1 96 .
do if not range(vQ24m4,0,1,96,96) | sys(vQ24m4).
compute m148=concat("vQ24m4=",string(vQ24m4,f2)).
compute p148="vQ24m4為不合理值或遺漏值".
end if.
Exec.

*vQ24m5=0,1 96 .
do if not range(vQ24m5,0,1,96,96) | sys(vQ24m5).
compute m149=concat("vQ24m5=",string(vQ24m5,f2)).
compute p149="vQ24m5為不合理值或遺漏值".
end if.
Exec.

*vQ24m6=0,1 96 .
do if not range(vQ24m6,0,1,96,96) | sys(vQ24m6).
compute m150=concat("vQ24m6=",string(vQ24m6,f2)).
compute p150="vQ24m6為不合理值或遺漏值".
end if.
Exec.

*vQ25=1,3 7 .
do if not range(vQ25,1,3,7,7) | sys(vQ25).
compute m151=concat("vQ25=",string(vQ25,f2)).
compute p151="vQ25為不合理值或遺漏值".
end if.
Exec.

*vQ26_1=1,5 96 .
do if not range(vQ26_1,1,5,96,96) | sys(vQ26_1).
compute m152=concat("vQ26_1=",string(vQ26_1,f2)).
compute p152="vQ26_1為不合理值或遺漏值".
end if.
Exec.

*vQ26_2=1,5 96 .
do if not range(vQ26_2,1,5,96,96) | sys(vQ26_2).
compute m153=concat("vQ26_2=",string(vQ26_2,f2)).
compute p153="vQ26_2為不合理值或遺漏值".
end if.
Exec.

*vQ28=21,95 .
do if not range(vQ28,21,95) | sys(vQ28).
compute m154=concat("vQ28=",string(vQ28,f3)).
compute p154="vQ28為不合理值或遺漏值".
end if.
Exec.

*vQ29=1,6 .
do if not range(vQ29,1,6) | sys(vQ29).
compute m155=concat("vQ29=",string(vQ29,f2)).
compute p155="vQ29為不合理值或遺漏值".
end if.
Exec.

*vQ30=1,5 .
do if not range(vQ30,1,5) | sys(vQ30).
compute m156=concat("vQ30=",string(vQ30,f2)).
compute p156="vQ30為不合理值或遺漏值".
end if.
Exec.

*vQ31=1,2 .
do if not range(vQ31,1,2) | sys(vQ31).
compute m157=concat("vQ31=",string(vQ31,f2)).
compute p157="vQ31為不合理值或遺漏值".
end if.
Exec.

*vQ32=1,2 .
do if not range(vQ32,1,2) | sys(vQ32).
compute m158=concat("vQ32=",string(vQ32,f2)).
compute p158="vQ32為不合理值或遺漏值".
end if.
Exec.

*vEND3=20260310000000,20260330000000 .
do if not range(vEND3,20260310000000,20260330000000) | sys(vEND3).
compute m159=concat("vEND3=",string(vEND3,f14)).
compute p159="vEND3為不合理值或遺漏值".
end if.
Exec.

* SYNTAXWORK_END_NUMERIC.

* Encoding: UTF-8.

**OPEN FIELD CHECKS.

* SYNTAXWORK_BEGIN_OPEN.

*vQ27city_oth 開放欄位檢核 是否為複選題=0.
do if vQ27city_oth=29 & vQ27city_oth="".
Compute m201=concat("vQ27city_oth=",string(vQ27city_oth,n150),";vQ27city_oth=",char.substr(vQ27city_oth,1,150)).
compute p201="vQ27city_oth開放欄位應答而未答".
else if vQ27city_oth~=29 & vQ27city_oth~="".
Compute m201=concat("vQ27city_oth=",string(vQ27city_oth,n150),";vQ27city_oth=",char.substr(vQ27city_oth,1,150)).
compute p201="vQ27city_oth開放欄位不該答而答".
else if vQ27city_oth=29 & vQ27city_oth~="" & range(keyin,keyindate1, Keyindate2).
Compute m201=concat("vQ27city_oth=",string(vQ27city_oth,n150),";vQ27city_oth=",char.substr(vQ27city_oth,1,150)).
compute p201="vQ27city_oth開放欄位內容列出確認".
end if.
Exec.

*vCK17_1Ao2 開放欄位檢核 是否為複選題=0.
do if vCK17_1A=2 & vCK17_1Ao2="".
Compute m202=concat("vCK17_1A=",string(vCK17_1A,n2),";vCK17_1Ao2=",char.substr(vCK17_1Ao2,1,150)).
compute p202="vCK17_1Ao2開放欄位應答而未答".
else if vCK17_1A~=2 & vCK17_1Ao2~="".
Compute m202=concat("vCK17_1A=",string(vCK17_1A,n2),";vCK17_1Ao2=",char.substr(vCK17_1Ao2,1,150)).
compute p202="vCK17_1Ao2開放欄位不該答而答".
else if vCK17_1A=2 & vCK17_1Ao2~="" & range(keyin,keyindate1, Keyindate2).
Compute m202=concat("vCK17_1A=",string(vCK17_1A,n2),";vCK17_1Ao2=",char.substr(vCK17_1Ao2,1,150)).
compute p202="vCK17_1Ao2開放欄位內容列出確認".
end if.
Exec.

*vQ18o7 開放欄位檢核 是否為複選題=0.
do if vQ18=7 & vQ18o7="".
Compute m203=concat("vQ18=",string(vQ18,n2),";vQ18o7=",char.substr(vQ18o7,1,150)).
compute p203="vQ18o7開放欄位應答而未答".
else if vQ18~=7 & vQ18o7~="".
Compute m203=concat("vQ18=",string(vQ18,n2),";vQ18o7=",char.substr(vQ18o7,1,150)).
compute p203="vQ18o7開放欄位不該答而答".
else if vQ18=7 & vQ18o7~="" & range(keyin,keyindate1, Keyindate2).
Compute m203=concat("vQ18=",string(vQ18,n2),";vQ18o7=",char.substr(vQ18o7,1,150)).
compute p203="vQ18o7開放欄位內容列出確認".
end if.
Exec.

*vCK17_2Ao2 開放欄位檢核 是否為複選題=0.
do if vCK17_2A=2 & vCK17_2Ao2="".
Compute m204=concat("vCK17_2A=",string(vCK17_2A,n2),";vCK17_2Ao2=",char.substr(vCK17_2Ao2,1,150)).
compute p204="vCK17_2Ao2開放欄位應答而未答".
else if vCK17_2A~=2 & vCK17_2Ao2~="".
Compute m204=concat("vCK17_2A=",string(vCK17_2A,n2),";vCK17_2Ao2=",char.substr(vCK17_2Ao2,1,150)).
compute p204="vCK17_2Ao2開放欄位不該答而答".
else if vCK17_2A=2 & vCK17_2Ao2~="" & range(keyin,keyindate1, Keyindate2).
Compute m204=concat("vCK17_2A=",string(vCK17_2A,n2),";vCK17_2Ao2=",char.substr(vCK17_2Ao2,1,150)).
compute p204="vCK17_2Ao2開放欄位內容列出確認".
end if.
Exec.

* SYNTAXWORK_END_OPEN.

**3.複選題檢核.
* Q24 組合.
STRING Q24 (A600).
COMPUTE Q24 = Rtrim(Ltrim(concat("vQ24m1=",string(vQ24m1,f2)," , ","vQ24m2=",string(vQ24m2,f2)," , ","vQ24m3=",string(vQ24m3,f2)," , ","vQ24m4=",string(vQ24m4,f2)," , ","vQ24m5=",string(vQ24m5,f2)," , ","vQ24m6=",string(vQ24m6,f2)))).

*Q24.
vector a=vQ24m1 to vQ24m6.
COMPUTE #Q24zero = (SUM(vQ24m1 TO vQ24m6) = 0).
loop #i=1 to 5.
do if (any(a(#i),0,1) & any(a(#i+1),96))
| (any(a(#i),96) and not any(a(#i+1),96))
| #Q24zero=1.
compute m301=Rtrim(Ltrim(Q24)).
compute p301="Q24至少選1項或選特殊碼應一致".
end if.
end loop.
exec.

**3.1複選互斥邏輯.
*Q24=1 複選題內互斥.
do if any(vQ24m1,1) & any(1,vQ24m2 to vQ24m6).
compute m302=Rtrim(Ltrim(Q24)).
compute p302="Q24(1)複選題選項應互斥".
end if.
Exec.
