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
