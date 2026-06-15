* Encoding: UTF-8.

**OPEN FIELD CHECKS.

* SYNTAXWORK_BEGIN_OPEN.

*vG0city_oth 開放欄位檢核 是否為複選題=0.
do if vQ27city_oth=29 & vG0city_oth="".
Compute m201=concat("vQ27city_oth=",string(vQ27city_oth,n2),";vG0city_oth=",char.substr(vG0city_oth,1,150)).
compute p201="vG0city_oth開放欄位應答而未答".
else if vQ27city_oth~=29 & vG0city_oth~="".
Compute m201=concat("vQ27city_oth=",string(vQ27city_oth,n2),";vG0city_oth=",char.substr(vG0city_oth,1,150)).
compute p201="vG0city_oth開放欄位不該答而答".
else if vQ27city_oth=29 & vG0city_oth~="" & range(keyin,keyindate1, Keyindate2).
Compute m201=concat("vQ27city_oth=",string(vQ27city_oth,n2),";vG0city_oth=",char.substr(vG0city_oth,1,150)).
compute p201="vG0city_oth開放欄位內容列出確認".
end if.
Exec.

*vC1U5Ro2 開放欄位檢核 是否為複選題=0.
do if vC1U5R=2 & vC1U5Ro2="".
Compute m202=concat("vC1U5R=",string(vC1U5R,n2),";vC1U5Ro2=",char.substr(vC1U5Ro2,1,150)).
compute p202="vC1U5Ro2開放欄位應答而未答".
else if vC1U5R~=2 & vC1U5Ro2~="".
Compute m202=concat("vC1U5R=",string(vC1U5R,n2),";vC1U5Ro2=",char.substr(vC1U5Ro2,1,150)).
compute p202="vC1U5Ro2開放欄位不該答而答".
else if vC1U5R=2 & vC1U5Ro2~="" & range(keyin,keyindate1, Keyindate2).
Compute m202=concat("vC1U5R=",string(vC1U5R,n2),";vC1U5Ro2=",char.substr(vC1U5Ro2,1,150)).
compute p202="vC1U5Ro2開放欄位內容列出確認".
end if.
Exec.

*vC1D1Ro2 開放欄位檢核 是否為複選題=0.
do if vC1D1R=2 & vC1D1Ro2="".
Compute m203=concat("vC1D1R=",string(vC1D1R,n2),";vC1D1Ro2=",char.substr(vC1D1Ro2,1,150)).
compute p203="vC1D1Ro2開放欄位應答而未答".
else if vC1D1R~=2 & vC1D1Ro2~="".
Compute m203=concat("vC1D1R=",string(vC1D1R,n2),";vC1D1Ro2=",char.substr(vC1D1Ro2,1,150)).
compute p203="vC1D1Ro2開放欄位不該答而答".
else if vC1D1R=2 & vC1D1Ro2~="" & range(keyin,keyindate1, Keyindate2).
Compute m203=concat("vC1D1R=",string(vC1D1R,n2),";vC1D1Ro2=",char.substr(vC1D1Ro2,1,150)).
compute p203="vC1D1Ro2開放欄位內容列出確認".
end if.
Exec.

*vC3o7 開放欄位檢核 是否為複選題=0.
do if vC3=7 & vC3o7="".
Compute m204=concat("vC3=",string(vC3,n2),";vC3o7=",char.substr(vC3o7,1,150)).
compute p204="vC3o7開放欄位應答而未答".
else if vC3~=7 & vC3o7~="".
Compute m204=concat("vC3=",string(vC3,n2),";vC3o7=",char.substr(vC3o7,1,150)).
compute p204="vC3o7開放欄位不該答而答".
else if vC3=7 & vC3o7~="" & range(keyin,keyindate1, Keyindate2).
Compute m204=concat("vC3=",string(vC3,n2),";vC3o7=",char.substr(vC3o7,1,150)).
compute p204="vC3o7開放欄位內容列出確認".
end if.
Exec.

*vC2U7Ro2 開放欄位檢核 是否為複選題=0.
do if vC2U7R=2 & vC2U7Ro2="".
Compute m205=concat("vC2U7R=",string(vC2U7R,n2),";vC2U7Ro2=",char.substr(vC2U7Ro2,1,150)).
compute p205="vC2U7Ro2開放欄位應答而未答".
else if vC2U7R~=2 & vC2U7Ro2~="".
Compute m205=concat("vC2U7R=",string(vC2U7R,n2),";vC2U7Ro2=",char.substr(vC2U7Ro2,1,150)).
compute p205="vC2U7Ro2開放欄位不該答而答".
else if vC2U7R=2 & vC2U7Ro2~="" & range(keyin,keyindate1, Keyindate2).
Compute m205=concat("vC2U7R=",string(vC2U7R,n2),";vC2U7Ro2=",char.substr(vC2U7Ro2,1,150)).
compute p205="vC2U7Ro2開放欄位內容列出確認".
end if.
Exec.

*vC2D1Ro2 開放欄位檢核 是否為複選題=0.
do if vC2D1R=2 & vC2D1Ro2="".
Compute m206=concat("vC2D1R=",string(vC2D1R,n2),";vC2D1Ro2=",char.substr(vC2D1Ro2,1,150)).
compute p206="vC2D1Ro2開放欄位應答而未答".
else if vC2D1R~=2 & vC2D1Ro2~="".
Compute m206=concat("vC2D1R=",string(vC2D1R,n2),";vC2D1Ro2=",char.substr(vC2D1Ro2,1,150)).
compute p206="vC2D1Ro2開放欄位不該答而答".
else if vC2D1R=2 & vC2D1Ro2~="" & range(keyin,keyindate1, Keyindate2).
Compute m206=concat("vC2D1R=",string(vC2D1R,n2),";vC2D1Ro2=",char.substr(vC2D1Ro2,1,150)).
compute p206="vC2D1Ro2開放欄位內容列出確認".
end if.
Exec.

* SYNTAXWORK_END_OPEN.
