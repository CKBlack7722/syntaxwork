* Encoding: UTF-8.

**OPEN FIELD CHECKS.

* SYNTAXWORK_BEGIN_OPEN.

*vZAo03 開放欄位檢核 是否為複選題=0.
do if vZA=3 & vZAo03="".
Compute m1000=concat("vZA=",string(vZA,n2),";vZAo03=",char.substr(vZAo03,1,150)).
compute p1000="vZAo03開放欄位應答而未答".
else if vZA~=3 & vZAo03~="".
Compute m1000=concat("vZA=",string(vZA,n2),";vZAo03=",char.substr(vZAo03,1,150)).
compute p1000="vZAo03開放欄位不該答而答".
else if vZA=3 & vZAo03~="" & range(keyin,keyindate1, Keyindate2).
Compute m1000=concat("vZA=",string(vZA,n2),";vZAo03=",char.substr(vZAo03,1,150)).
compute p1000="vZAo03開放欄位內容列出確認".
end if.
Exec.

*vA3o88 開放欄位檢核 是否為複選題=0.
do if vA3=88 & vA3o88="".
Compute m1001=concat("vA3=",string(vA3,n2),";vA3o88=",char.substr(vA3o88,1,150)).
compute p1001="vA3o88開放欄位應答而未答".
else if vA3~=88 & vA3o88~="".
Compute m1001=concat("vA3=",string(vA3,n2),";vA3o88=",char.substr(vA3o88,1,150)).
compute p1001="vA3o88開放欄位不該答而答".
else if vA3=88 & vA3o88~="" & range(keyin,keyindate1, Keyindate2).
Compute m1001=concat("vA3=",string(vA3,n2),";vA3o88=",char.substr(vA3o88,1,150)).
compute p1001="vA3o88開放欄位內容列出確認".
end if.
Exec.

*vA5city_oth 開放欄位檢核 是否為複選題=0.
do if vA5city=29 & vA5city_oth="".
Compute m1002=concat("vA5city=",string(vA5city,n2),";vA5city_oth=",char.substr(vA5city_oth,1,150)).
compute p1002="vA5city_oth開放欄位應答而未答".
else if vA5city~=29 & vA5city_oth~="".
Compute m1002=concat("vA5city=",string(vA5city,n2),";vA5city_oth=",char.substr(vA5city_oth,1,150)).
compute p1002="vA5city_oth開放欄位不該答而答".
else if vA5city=29 & vA5city_oth~="" & range(keyin,keyindate1, Keyindate2).
Compute m1002=concat("vA5city=",string(vA5city,n2),";vA5city_oth=",char.substr(vA5city_oth,1,150)).
compute p1002="vA5city_oth開放欄位內容列出確認".
end if.
Exec.

*vA6o88 開放欄位檢核 是否為複選題=0.
do if vA6=88 & vA6o88="".
Compute m1003=concat("vA6=",string(vA6,n2),";vA6o88=",char.substr(vA6o88,1,150)).
compute p1003="vA6o88開放欄位應答而未答".
else if vA6~=88 & vA6o88~="".
Compute m1003=concat("vA6=",string(vA6,n2),";vA6o88=",char.substr(vA6o88,1,150)).
compute p1003="vA6o88開放欄位不該答而答".
else if vA6=88 & vA6o88~="" & range(keyin,keyindate1, Keyindate2).
Compute m1003=concat("vA6=",string(vA6,n2),";vA6o88=",char.substr(vA6o88,1,150)).
compute p1003="vA6o88開放欄位內容列出確認".
end if.
Exec.

*vA7o88 開放欄位檢核 是否為複選題=0.
do if vA7=88 & vA7o88="".
Compute m1004=concat("vA7=",string(vA7,n2),";vA7o88=",char.substr(vA7o88,1,150)).
compute p1004="vA7o88開放欄位應答而未答".
else if vA7~=88 & vA7o88~="".
Compute m1004=concat("vA7=",string(vA7,n2),";vA7o88=",char.substr(vA7o88,1,150)).
compute p1004="vA7o88開放欄位不該答而答".
else if vA7=88 & vA7o88~="" & range(keyin,keyindate1, Keyindate2).
Compute m1004=concat("vA7=",string(vA7,n2),";vA7o88=",char.substr(vA7o88,1,150)).
compute p1004="vA7o88開放欄位內容列出確認".
end if.
Exec.

*vA8o88 開放欄位檢核 是否為複選題=0.
do if vA8=88 & vA8o88="".
Compute m1005=concat("vA8=",string(vA8,n2),";vA8o88=",char.substr(vA8o88,1,150)).
compute p1005="vA8o88開放欄位應答而未答".
else if vA8~=88 & vA8o88~="".
Compute m1005=concat("vA8=",string(vA8,n2),";vA8o88=",char.substr(vA8o88,1,150)).
compute p1005="vA8o88開放欄位不該答而答".
else if vA8=88 & vA8o88~="" & range(keyin,keyindate1, Keyindate2).
Compute m1005=concat("vA8=",string(vA8,n2),";vA8o88=",char.substr(vA8o88,1,150)).
compute p1005="vA8o88開放欄位內容列出確認".
end if.
Exec.

*vA9o88 開放欄位檢核 是否為複選題=0.
do if vA9=88 & vA9o88="".
Compute m1006=concat("vA9=",string(vA9,n2),";vA9o88=",char.substr(vA9o88,1,150)).
compute p1006="vA9o88開放欄位應答而未答".
else if vA9~=88 & vA9o88~="".
Compute m1006=concat("vA9=",string(vA9,n2),";vA9o88=",char.substr(vA9o88,1,150)).
compute p1006="vA9o88開放欄位不該答而答".
else if vA9=88 & vA9o88~="" & range(keyin,keyindate1, Keyindate2).
Compute m1006=concat("vA9=",string(vA9,n2),";vA9o88=",char.substr(vA9o88,1,150)).
compute p1006="vA9o88開放欄位內容列出確認".
end if.
Exec.

*vO1_1o88 開放欄位檢核 是否為複選題=0.
do if vO1_1=88 & vO1_1o88="".
Compute m1007=concat("vO1_1=",string(vO1_1,n2),";vO1_1o88=",char.substr(vO1_1o88,1,150)).
compute p1007="vO1_1o88開放欄位應答而未答".
else if vO1_1~=88 & vO1_1o88~="".
Compute m1007=concat("vO1_1=",string(vO1_1,n2),";vO1_1o88=",char.substr(vO1_1o88,1,150)).
compute p1007="vO1_1o88開放欄位不該答而答".
else if vO1_1=88 & vO1_1o88~="" & range(keyin,keyindate1, Keyindate2).
Compute m1007=concat("vO1_1=",string(vO1_1,n2),";vO1_1o88=",char.substr(vO1_1o88,1,150)).
compute p1007="vO1_1o88開放欄位內容列出確認".
end if.
Exec.

*vO1o88 開放欄位檢核 是否為複選題=0.
do if vO1=88 & vO1o88="".
Compute m1008=concat("vO1=",string(vO1,n2),";vO1o88=",char.substr(vO1o88,1,150)).
compute p1008="vO1o88開放欄位應答而未答".
else if vO1~=88 & vO1o88~="".
Compute m1008=concat("vO1=",string(vO1,n2),";vO1o88=",char.substr(vO1o88,1,150)).
compute p1008="vO1o88開放欄位不該答而答".
else if vO1=88 & vO1o88~="" & range(keyin,keyindate1, Keyindate2).
Compute m1008=concat("vO1=",string(vO1,n2),";vO1o88=",char.substr(vO1o88,1,150)).
compute p1008="vO1o88開放欄位內容列出確認".
end if.
Exec.

*vO2o88 開放欄位檢核 是否為複選題=0.
do if vO2=88 & vO2o88="".
Compute m1009=concat("vO2=",string(vO2,n2),";vO2o88=",char.substr(vO2o88,1,150)).
compute p1009="vO2o88開放欄位應答而未答".
else if vO2~=88 & vO2o88~="".
Compute m1009=concat("vO2=",string(vO2,n2),";vO2o88=",char.substr(vO2o88,1,150)).
compute p1009="vO2o88開放欄位不該答而答".
else if vO2=88 & vO2o88~="" & range(keyin,keyindate1, Keyindate2).
Compute m1009=concat("vO2=",string(vO2,n2),";vO2o88=",char.substr(vO2o88,1,150)).
compute p1009="vO2o88開放欄位內容列出確認".
end if.
Exec.

*vO3o88 開放欄位檢核 是否為複選題=0.
do if vO3=88 & vO3o88="".
Compute m1010=concat("vO3=",string(vO3,n2),";vO3o88=",char.substr(vO3o88,1,150)).
compute p1010="vO3o88開放欄位應答而未答".
else if vO3~=88 & vO3o88~="".
Compute m1010=concat("vO3=",string(vO3,n2),";vO3o88=",char.substr(vO3o88,1,150)).
compute p1010="vO3o88開放欄位不該答而答".
else if vO3=88 & vO3o88~="" & range(keyin,keyindate1, Keyindate2).
Compute m1010=concat("vO3=",string(vO3,n2),";vO3o88=",char.substr(vO3o88,1,150)).
compute p1010="vO3o88開放欄位內容列出確認".
end if.
Exec.

*vK1o88 開放欄位檢核 是否為複選題=1.
do if vK1m88=1 & vK1o88="".
Compute m1011=concat("vK1m88=",string(vK1m88,n2),";vK1o88=",char.substr(vK1o88,1,150)).
compute p1011="vK1o88開放欄位應答而未答".
else if vK1m88~=1 & vK1o88~="".
Compute m1011=concat("vK1m88=",string(vK1m88,n2),";vK1o88=",char.substr(vK1o88,1,150)).
compute p1011="vK1o88開放欄位不該答而答".
else if vK1m88=1 & vK1o88~="" & range(keyin,keyindate1, Keyindate2).
Compute m1011=concat("vK1m88=",string(vK1m88,n2),";vK1o88=",char.substr(vK1o88,1,150)).
compute p1011="vK1o88開放欄位內容列出確認".
end if.
Exec.

*vK2o88 開放欄位檢核 是否為複選題=1.
do if vK2m88=1 & vK2o88="".
Compute m1012=concat("vK2m88=",string(vK2m88,n2),";vK2o88=",char.substr(vK2o88,1,150)).
compute p1012="vK2o88開放欄位應答而未答".
else if vK2m88~=1 & vK2o88~="".
Compute m1012=concat("vK2m88=",string(vK2m88,n2),";vK2o88=",char.substr(vK2o88,1,150)).
compute p1012="vK2o88開放欄位不該答而答".
else if vK2m88=1 & vK2o88~="" & range(keyin,keyindate1, Keyindate2).
Compute m1012=concat("vK2m88=",string(vK2m88,n2),";vK2o88=",char.substr(vK2o88,1,150)).
compute p1012="vK2o88開放欄位內容列出確認".
end if.
Exec.

*vE17o88 開放欄位檢核 是否為複選題=0.
do if vE17=88 & vE17o88="".
Compute m1013=concat("vE17=",string(vE17,n2),";vE17o88=",char.substr(vE17o88,1,150)).
compute p1013="vE17o88開放欄位應答而未答".
else if vE17~=88 & vE17o88~="".
Compute m1013=concat("vE17=",string(vE17,n2),";vE17o88=",char.substr(vE17o88,1,150)).
compute p1013="vE17o88開放欄位不該答而答".
else if vE17=88 & vE17o88~="" & range(keyin,keyindate1, Keyindate2).
Compute m1013=concat("vE17=",string(vE17,n2),";vE17o88=",char.substr(vE17o88,1,150)).
compute p1013="vE17o88開放欄位內容列出確認".
end if.
Exec.

*vKFB3o88 開放欄位檢核 是否為複選題=1.
do if vKFB3m88=1 & vKFB3o88="".
Compute m1014=concat("vKFB3m88=",string(vKFB3m88,n2),";vKFB3o88=",char.substr(vKFB3o88,1,150)).
compute p1014="vKFB3o88開放欄位應答而未答".
else if vKFB3m88~=1 & vKFB3o88~="".
Compute m1014=concat("vKFB3m88=",string(vKFB3m88,n2),";vKFB3o88=",char.substr(vKFB3o88,1,150)).
compute p1014="vKFB3o88開放欄位不該答而答".
else if vKFB3m88=1 & vKFB3o88~="" & range(keyin,keyindate1, Keyindate2).
Compute m1014=concat("vKFB3m88=",string(vKFB3m88,n2),";vKFB3o88=",char.substr(vKFB3o88,1,150)).
compute p1014="vKFB3o88開放欄位內容列出確認".
end if.
Exec.

*vKFB4o88 開放欄位檢核 是否為複選題=1.
do if vKFB4m88=1 & vKFB4o88="".
Compute m1015=concat("vKFB4m88=",string(vKFB4m88,n2),";vKFB4o88=",char.substr(vKFB4o88,1,150)).
compute p1015="vKFB4o88開放欄位應答而未答".
else if vKFB4m88~=1 & vKFB4o88~="".
Compute m1015=concat("vKFB4m88=",string(vKFB4m88,n2),";vKFB4o88=",char.substr(vKFB4o88,1,150)).
compute p1015="vKFB4o88開放欄位不該答而答".
else if vKFB4m88=1 & vKFB4o88~="" & range(keyin,keyindate1, Keyindate2).
Compute m1015=concat("vKFB4m88=",string(vKFB4m88,n2),";vKFB4o88=",char.substr(vKFB4o88,1,150)).
compute p1015="vKFB4o88開放欄位內容列出確認".
end if.
Exec.

*vKIG3o88 開放欄位檢核 是否為複選題=1.
do if vKIG3m88=1 & vKIG3o88="".
Compute m1016=concat("vKIG3m88=",string(vKIG3m88,n2),";vKIG3o88=",char.substr(vKIG3o88,1,150)).
compute p1016="vKIG3o88開放欄位應答而未答".
else if vKIG3m88~=1 & vKIG3o88~="".
Compute m1016=concat("vKIG3m88=",string(vKIG3m88,n2),";vKIG3o88=",char.substr(vKIG3o88,1,150)).
compute p1016="vKIG3o88開放欄位不該答而答".
else if vKIG3m88=1 & vKIG3o88~="" & range(keyin,keyindate1, Keyindate2).
Compute m1016=concat("vKIG3m88=",string(vKIG3m88,n2),";vKIG3o88=",char.substr(vKIG3o88,1,150)).
compute p1016="vKIG3o88開放欄位內容列出確認".
end if.
Exec.

*vKIG4o88 開放欄位檢核 是否為複選題=1.
do if vKIG4m88=1 & vKIG4o88="".
Compute m1017=concat("vKIG4m88=",string(vKIG4m88,n2),";vKIG4o88=",char.substr(vKIG4o88,1,150)).
compute p1017="vKIG4o88開放欄位應答而未答".
else if vKIG4m88~=1 & vKIG4o88~="".
Compute m1017=concat("vKIG4m88=",string(vKIG4m88,n2),";vKIG4o88=",char.substr(vKIG4o88,1,150)).
compute p1017="vKIG4o88開放欄位不該答而答".
else if vKIG4m88=1 & vKIG4o88~="" & range(keyin,keyindate1, Keyindate2).
Compute m1017=concat("vKIG4m88=",string(vKIG4m88,n2),";vKIG4o88=",char.substr(vKIG4o88,1,150)).
compute p1017="vKIG4o88開放欄位內容列出確認".
end if.
Exec.

*vKTT3o88 開放欄位檢核 是否為複選題=1.
do if vKTT3m88=1 & vKTT3o88="".
Compute m1018=concat("vKTT3m88=",string(vKTT3m88,n2),";vKTT3o88=",char.substr(vKTT3o88,1,150)).
compute p1018="vKTT3o88開放欄位應答而未答".
else if vKTT3m88~=1 & vKTT3o88~="".
Compute m1018=concat("vKTT3m88=",string(vKTT3m88,n2),";vKTT3o88=",char.substr(vKTT3o88,1,150)).
compute p1018="vKTT3o88開放欄位不該答而答".
else if vKTT3m88=1 & vKTT3o88~="" & range(keyin,keyindate1, Keyindate2).
Compute m1018=concat("vKTT3m88=",string(vKTT3m88,n2),";vKTT3o88=",char.substr(vKTT3o88,1,150)).
compute p1018="vKTT3o88開放欄位內容列出確認".
end if.
Exec.

*vKTT4o88 開放欄位檢核 是否為複選題=1.
do if vKTT4m88=1 & vKTT4o88="".
Compute m1019=concat("vKTT4m88=",string(vKTT4m88,n2),";vKTT4o88=",char.substr(vKTT4o88,1,150)).
compute p1019="vKTT4o88開放欄位應答而未答".
else if vKTT4m88~=1 & vKTT4o88~="".
Compute m1019=concat("vKTT4m88=",string(vKTT4m88,n2),";vKTT4o88=",char.substr(vKTT4o88,1,150)).
compute p1019="vKTT4o88開放欄位不該答而答".
else if vKTT4m88=1 & vKTT4o88~="" & range(keyin,keyindate1, Keyindate2).
Compute m1019=concat("vKTT4m88=",string(vKTT4m88,n2),";vKTT4o88=",char.substr(vKTT4o88,1,150)).
compute p1019="vKTT4o88開放欄位內容列出確認".
end if.
Exec.

*vKTT5o88 開放欄位檢核 是否為複選題=1.
do if vKTT5m88=1 & vKTT5o88="".
Compute m1020=concat("vKTT5m88=",string(vKTT5m88,n2),";vKTT5o88=",char.substr(vKTT5o88,1,150)).
compute p1020="vKTT5o88開放欄位應答而未答".
else if vKTT5m88~=1 & vKTT5o88~="".
Compute m1020=concat("vKTT5m88=",string(vKTT5m88,n2),";vKTT5o88=",char.substr(vKTT5o88,1,150)).
compute p1020="vKTT5o88開放欄位不該答而答".
else if vKTT5m88=1 & vKTT5o88~="" & range(keyin,keyindate1, Keyindate2).
Compute m1020=concat("vKTT5m88=",string(vKTT5m88,n2),";vKTT5o88=",char.substr(vKTT5o88,1,150)).
compute p1020="vKTT5o88開放欄位內容列出確認".
end if.
Exec.

*vK3o88 開放欄位檢核 是否為複選題=1.
do if vK3m88=1 & vK3o88="".
Compute m1021=concat("vK3m88=",string(vK3m88,n2),";vK3o88=",char.substr(vK3o88,1,150)).
compute p1021="vK3o88開放欄位應答而未答".
else if vK3m88~=1 & vK3o88~="".
Compute m1021=concat("vK3m88=",string(vK3m88,n2),";vK3o88=",char.substr(vK3o88,1,150)).
compute p1021="vK3o88開放欄位不該答而答".
else if vK3m88=1 & vK3o88~="" & range(keyin,keyindate1, Keyindate2).
Compute m1021=concat("vK3m88=",string(vK3m88,n2),";vK3o88=",char.substr(vK3o88,1,150)).
compute p1021="vK3o88開放欄位內容列出確認".
end if.
Exec.

*vE18o88 開放欄位檢核 是否為複選題=0.
do if vE18=88 & vE18o88="".
Compute m1022=concat("vE18=",string(vE18,n2),";vE18o88=",char.substr(vE18o88,1,150)).
compute p1022="vE18o88開放欄位應答而未答".
else if vE18~=88 & vE18o88~="".
Compute m1022=concat("vE18=",string(vE18,n2),";vE18o88=",char.substr(vE18o88,1,150)).
compute p1022="vE18o88開放欄位不該答而答".
else if vE18=88 & vE18o88~="" & range(keyin,keyindate1, Keyindate2).
Compute m1022=concat("vE18=",string(vE18,n2),";vE18o88=",char.substr(vE18o88,1,150)).
compute p1022="vE18o88開放欄位內容列出確認".
end if.
Exec.

*vE2o88 開放欄位檢核 是否為複選題=1.
do if vE2m88=1 & vE2o88="".
Compute m1023=concat("vE2m88=",string(vE2m88,n2),";vE2o88=",char.substr(vE2o88,1,150)).
compute p1023="vE2o88開放欄位應答而未答".
else if vE2m88~=1 & vE2o88~="".
Compute m1023=concat("vE2m88=",string(vE2m88,n2),";vE2o88=",char.substr(vE2o88,1,150)).
compute p1023="vE2o88開放欄位不該答而答".
else if vE2m88=1 & vE2o88~="" & range(keyin,keyindate1, Keyindate2).
Compute m1023=concat("vE2m88=",string(vE2m88,n2),";vE2o88=",char.substr(vE2o88,1,150)).
compute p1023="vE2o88開放欄位內容列出確認".
end if.
Exec.

*vE3_1 開放欄位內容確認。
do if vE3_1~="" & range(keyin,keyindate1, Keyindate2).
Compute m1024=concat("vE3_1=",char.substr(vE3_1,1,150)).
compute p1024="vE3_1開放欄位內容確認".
end if.
Exec.

*vE13o88 開放欄位檢核 是否為複選題=1.
do if vE13m88=1 & vE13o88="".
Compute m1025=concat("vE13m88=",string(vE13m88,n2),";vE13o88=",char.substr(vE13o88,1,150)).
compute p1025="vE13o88開放欄位應答而未答".
else if vE13m88~=1 & vE13o88~="".
Compute m1025=concat("vE13m88=",string(vE13m88,n2),";vE13o88=",char.substr(vE13o88,1,150)).
compute p1025="vE13o88開放欄位不該答而答".
else if vE13m88=1 & vE13o88~="" & range(keyin,keyindate1, Keyindate2).
Compute m1025=concat("vE13m88=",string(vE13m88,n2),";vE13o88=",char.substr(vE13o88,1,150)).
compute p1025="vE13o88開放欄位內容列出確認".
end if.
Exec.

*vG7o88 開放欄位檢核 是否為複選題=1.
do if vG7m88=1 & vG7o88="".
Compute m1026=concat("vG7m88=",string(vG7m88,n2),";vG7o88=",char.substr(vG7o88,1,150)).
compute p1026="vG7o88開放欄位應答而未答".
else if vG7m88~=1 & vG7o88~="".
Compute m1026=concat("vG7m88=",string(vG7m88,n2),";vG7o88=",char.substr(vG7o88,1,150)).
compute p1026="vG7o88開放欄位不該答而答".
else if vG7m88=1 & vG7o88~="" & range(keyin,keyindate1, Keyindate2).
Compute m1026=concat("vG7m88=",string(vG7m88,n2),";vG7o88=",char.substr(vG7o88,1,150)).
compute p1026="vG7o88開放欄位內容列出確認".
end if.
Exec.

*vG8o88 開放欄位檢核 是否為複選題=1.
do if vG8m88=1 & vG8o88="".
Compute m1027=concat("vG8m88=",string(vG8m88,n2),";vG8o88=",char.substr(vG8o88,1,150)).
compute p1027="vG8o88開放欄位應答而未答".
else if vG8m88~=1 & vG8o88~="".
Compute m1027=concat("vG8m88=",string(vG8m88,n2),";vG8o88=",char.substr(vG8o88,1,150)).
compute p1027="vG8o88開放欄位不該答而答".
else if vG8m88=1 & vG8o88~="" & range(keyin,keyindate1, Keyindate2).
Compute m1027=concat("vG8m88=",string(vG8m88,n2),";vG8o88=",char.substr(vG8o88,1,150)).
compute p1027="vG8o88開放欄位內容列出確認".
end if.
Exec.

*vG9o88 開放欄位檢核 是否為複選題=1.
do if vG9m88=1 & vG9o88="".
Compute m1028=concat("vG9m88=",string(vG9m88,n2),";vG9o88=",char.substr(vG9o88,1,150)).
compute p1028="vG9o88開放欄位應答而未答".
else if vG9m88~=1 & vG9o88~="".
Compute m1028=concat("vG9m88=",string(vG9m88,n2),";vG9o88=",char.substr(vG9o88,1,150)).
compute p1028="vG9o88開放欄位不該答而答".
else if vG9m88=1 & vG9o88~="" & range(keyin,keyindate1, Keyindate2).
Compute m1028=concat("vG9m88=",string(vG9m88,n2),";vG9o88=",char.substr(vG9o88,1,150)).
compute p1028="vG9o88開放欄位內容列出確認".
end if.
Exec.

*vG10o88 開放欄位檢核 是否為複選題=1.
do if vG10m88=1 & vG10o88="".
Compute m1029=concat("vG10m88=",string(vG10m88,n2),";vG10o88=",char.substr(vG10o88,1,150)).
compute p1029="vG10o88開放欄位應答而未答".
else if vG10m88~=1 & vG10o88~="".
Compute m1029=concat("vG10m88=",string(vG10m88,n2),";vG10o88=",char.substr(vG10o88,1,150)).
compute p1029="vG10o88開放欄位不該答而答".
else if vG10m88=1 & vG10o88~="" & range(keyin,keyindate1, Keyindate2).
Compute m1029=concat("vG10m88=",string(vG10m88,n2),";vG10o88=",char.substr(vG10o88,1,150)).
compute p1029="vG10o88開放欄位內容列出確認".
end if.
Exec.

*vG11o88 開放欄位檢核 是否為複選題=1.
do if vG11m88=1 & vG11o88="".
Compute m1030=concat("vG11m88=",string(vG11m88,n2),";vG11o88=",char.substr(vG11o88,1,150)).
compute p1030="vG11o88開放欄位應答而未答".
else if vG11m88~=1 & vG11o88~="".
Compute m1030=concat("vG11m88=",string(vG11m88,n2),";vG11o88=",char.substr(vG11o88,1,150)).
compute p1030="vG11o88開放欄位不該答而答".
else if vG11m88=1 & vG11o88~="" & range(keyin,keyindate1, Keyindate2).
Compute m1030=concat("vG11m88=",string(vG11m88,n2),";vG11o88=",char.substr(vG11o88,1,150)).
compute p1030="vG11o88開放欄位內容列出確認".
end if.
Exec.

*vB7ao88 開放欄位檢核 是否為複選題=1.
do if vB7am88=1 & vB7ao88="".
Compute m1031=concat("vB7am88=",string(vB7am88,n2),";vB7ao88=",char.substr(vB7ao88,1,150)).
compute p1031="vB7ao88開放欄位應答而未答".
else if vB7am88~=1 & vB7ao88~="".
Compute m1031=concat("vB7am88=",string(vB7am88,n2),";vB7ao88=",char.substr(vB7ao88,1,150)).
compute p1031="vB7ao88開放欄位不該答而答".
else if vB7am88=1 & vB7ao88~="" & range(keyin,keyindate1, Keyindate2).
Compute m1031=concat("vB7am88=",string(vB7am88,n2),";vB7ao88=",char.substr(vB7ao88,1,150)).
compute p1031="vB7ao88開放欄位內容列出確認".
end if.
Exec.

*vB7o88 開放欄位檢核 是否為複選題=0.
do if vB7=88 & vB7o88="".
Compute m1032=concat("vB7=",string(vB7,n2),";vB7o88=",char.substr(vB7o88,1,150)).
compute p1032="vB7o88開放欄位應答而未答".
else if vB7~=88 & vB7o88~="".
Compute m1032=concat("vB7=",string(vB7,n2),";vB7o88=",char.substr(vB7o88,1,150)).
compute p1032="vB7o88開放欄位不該答而答".
else if vB7=88 & vB7o88~="" & range(keyin,keyindate1, Keyindate2).
Compute m1032=concat("vB7=",string(vB7,n2),";vB7o88=",char.substr(vB7o88,1,150)).
compute p1032="vB7o88開放欄位內容列出確認".
end if.
Exec.

*vB8o88 開放欄位檢核 是否為複選題=1.
do if vB8m88=1 & vB8o88="".
Compute m1033=concat("vB8m88=",string(vB8m88,n2),";vB8o88=",char.substr(vB8o88,1,150)).
compute p1033="vB8o88開放欄位應答而未答".
else if vB8m88~=1 & vB8o88~="".
Compute m1033=concat("vB8m88=",string(vB8m88,n2),";vB8o88=",char.substr(vB8o88,1,150)).
compute p1033="vB8o88開放欄位不該答而答".
else if vB8m88=1 & vB8o88~="" & range(keyin,keyindate1, Keyindate2).
Compute m1033=concat("vB8m88=",string(vB8m88,n2),";vB8o88=",char.substr(vB8o88,1,150)).
compute p1033="vB8o88開放欄位內容列出確認".
end if.
Exec.

*vG3o88 開放欄位檢核 是否為複選題=1.
do if vG3m88=1 & vG3o88="".
Compute m1034=concat("vG3m88=",string(vG3m88,n2),";vG3o88=",char.substr(vG3o88,1,150)).
compute p1034="vG3o88開放欄位應答而未答".
else if vG3m88~=1 & vG3o88~="".
Compute m1034=concat("vG3m88=",string(vG3m88,n2),";vG3o88=",char.substr(vG3o88,1,150)).
compute p1034="vG3o88開放欄位不該答而答".
else if vG3m88=1 & vG3o88~="" & range(keyin,keyindate1, Keyindate2).
Compute m1034=concat("vG3m88=",string(vG3m88,n2),";vG3o88=",char.substr(vG3o88,1,150)).
compute p1034="vG3o88開放欄位內容列出確認".
end if.
Exec.

*vF5o88 開放欄位檢核 是否為複選題=1.
do if vF5m88=1 & vF5o88="".
Compute m1035=concat("vF5m88=",string(vF5m88,n2),";vF5o88=",char.substr(vF5o88,1,150)).
compute p1035="vF5o88開放欄位應答而未答".
else if vF5m88~=1 & vF5o88~="".
Compute m1035=concat("vF5m88=",string(vF5m88,n2),";vF5o88=",char.substr(vF5o88,1,150)).
compute p1035="vF5o88開放欄位不該答而答".
else if vF5m88=1 & vF5o88~="" & range(keyin,keyindate1, Keyindate2).
Compute m1035=concat("vF5m88=",string(vF5m88,n2),";vF5o88=",char.substr(vF5o88,1,150)).
compute p1035="vF5o88開放欄位內容列出確認".
end if.
Exec.

*vC3o88 開放欄位檢核 是否為複選題=1.
do if vC3m88=1 & vC3o88="".
Compute m1036=concat("vC3m88=",string(vC3m88,n2),";vC3o88=",char.substr(vC3o88,1,150)).
compute p1036="vC3o88開放欄位應答而未答".
else if vC3m88~=1 & vC3o88~="".
Compute m1036=concat("vC3m88=",string(vC3m88,n2),";vC3o88=",char.substr(vC3o88,1,150)).
compute p1036="vC3o88開放欄位不該答而答".
else if vC3m88=1 & vC3o88~="" & range(keyin,keyindate1, Keyindate2).
Compute m1036=concat("vC3m88=",string(vC3m88,n2),";vC3o88=",char.substr(vC3o88,1,150)).
compute p1036="vC3o88開放欄位內容列出確認".
end if.
Exec.

*vJB1o88 開放欄位檢核 是否為複選題=1.
do if vJB1m88=1 & vJB1o88="".
Compute m1037=concat("vJB1m88=",string(vJB1m88,n2),";vJB1o88=",char.substr(vJB1o88,1,150)).
compute p1037="vJB1o88開放欄位應答而未答".
else if vJB1m88~=1 & vJB1o88~="".
Compute m1037=concat("vJB1m88=",string(vJB1m88,n2),";vJB1o88=",char.substr(vJB1o88,1,150)).
compute p1037="vJB1o88開放欄位不該答而答".
else if vJB1m88=1 & vJB1o88~="" & range(keyin,keyindate1, Keyindate2).
Compute m1037=concat("vJB1m88=",string(vJB1m88,n2),";vJB1o88=",char.substr(vJB1o88,1,150)).
compute p1037="vJB1o88開放欄位內容列出確認".
end if.
Exec.

*vJB2o88 開放欄位檢核 是否為複選題=1.
do if vJB2m88=1 & vJB2o88="".
Compute m1038=concat("vJB2m88=",string(vJB2m88,n2),";vJB2o88=",char.substr(vJB2o88,1,150)).
compute p1038="vJB2o88開放欄位應答而未答".
else if vJB2m88~=1 & vJB2o88~="".
Compute m1038=concat("vJB2m88=",string(vJB2m88,n2),";vJB2o88=",char.substr(vJB2o88,1,150)).
compute p1038="vJB2o88開放欄位不該答而答".
else if vJB2m88=1 & vJB2o88~="" & range(keyin,keyindate1, Keyindate2).
Compute m1038=concat("vJB2m88=",string(vJB2m88,n2),";vJB2o88=",char.substr(vJB2o88,1,150)).
compute p1038="vJB2o88開放欄位內容列出確認".
end if.
Exec.

*vM2o88 開放欄位檢核 是否為複選題=1.
do if vM2m88=1 & vM2o88="".
Compute m1039=concat("vM2m88=",string(vM2m88,n2),";vM2o88=",char.substr(vM2o88,1,150)).
compute p1039="vM2o88開放欄位應答而未答".
else if vM2m88~=1 & vM2o88~="".
Compute m1039=concat("vM2m88=",string(vM2m88,n2),";vM2o88=",char.substr(vM2o88,1,150)).
compute p1039="vM2o88開放欄位不該答而答".
else if vM2m88=1 & vM2o88~="" & range(keyin,keyindate1, Keyindate2).
Compute m1039=concat("vM2m88=",string(vM2m88,n2),";vM2o88=",char.substr(vM2o88,1,150)).
compute p1039="vM2o88開放欄位內容列出確認".
end if.
Exec.

*vM3o88 開放欄位檢核 是否為複選題=1.
do if vM3m88=1 & vM3o88="".
Compute m1040=concat("vM3m88=",string(vM3m88,n2),";vM3o88=",char.substr(vM3o88,1,150)).
compute p1040="vM3o88開放欄位應答而未答".
else if vM3m88~=1 & vM3o88~="".
Compute m1040=concat("vM3m88=",string(vM3m88,n2),";vM3o88=",char.substr(vM3o88,1,150)).
compute p1040="vM3o88開放欄位不該答而答".
else if vM3m88=1 & vM3o88~="" & range(keyin,keyindate1, Keyindate2).
Compute m1040=concat("vM3m88=",string(vM3m88,n2),";vM3o88=",char.substr(vM3o88,1,150)).
compute p1040="vM3o88開放欄位內容列出確認".
end if.
Exec.

*vQ20o88 開放欄位檢核 是否為複選題=1.
do if vQ20m88=1 & vQ20o88="".
Compute m1041=concat("vQ20m88=",string(vQ20m88,n2),";vQ20o88=",char.substr(vQ20o88,1,150)).
compute p1041="vQ20o88開放欄位應答而未答".
else if vQ20m88~=1 & vQ20o88~="".
Compute m1041=concat("vQ20m88=",string(vQ20m88,n2),";vQ20o88=",char.substr(vQ20o88,1,150)).
compute p1041="vQ20o88開放欄位不該答而答".
else if vQ20m88=1 & vQ20o88~="" & range(keyin,keyindate1, Keyindate2).
Compute m1041=concat("vQ20m88=",string(vQ20m88,n2),";vQ20o88=",char.substr(vQ20o88,1,150)).
compute p1041="vQ20o88開放欄位內容列出確認".
end if.
Exec.

*vQ25o88 開放欄位檢核 是否為複選題=1.
do if vQ25m88=1 & vQ25o88="".
Compute m1042=concat("vQ25m88=",string(vQ25m88,n2),";vQ25o88=",char.substr(vQ25o88,1,150)).
compute p1042="vQ25o88開放欄位應答而未答".
else if vQ25m88~=1 & vQ25o88~="".
Compute m1042=concat("vQ25m88=",string(vQ25m88,n2),";vQ25o88=",char.substr(vQ25o88,1,150)).
compute p1042="vQ25o88開放欄位不該答而答".
else if vQ25m88=1 & vQ25o88~="" & range(keyin,keyindate1, Keyindate2).
Compute m1042=concat("vQ25m88=",string(vQ25m88,n2),";vQ25o88=",char.substr(vQ25o88,1,150)).
compute p1042="vQ25o88開放欄位內容列出確認".
end if.
Exec.

*vQ22o88 開放欄位檢核 是否為複選題=1.
do if vQ22m88=1 & vQ22o88="".
Compute m1043=concat("vQ22m88=",string(vQ22m88,n2),";vQ22o88=",char.substr(vQ22o88,1,150)).
compute p1043="vQ22o88開放欄位應答而未答".
else if vQ22m88~=1 & vQ22o88~="".
Compute m1043=concat("vQ22m88=",string(vQ22m88,n2),";vQ22o88=",char.substr(vQ22o88,1,150)).
compute p1043="vQ22o88開放欄位不該答而答".
else if vQ22m88=1 & vQ22o88~="" & range(keyin,keyindate1, Keyindate2).
Compute m1043=concat("vQ22m88=",string(vQ22m88,n2),";vQ22o88=",char.substr(vQ22o88,1,150)).
compute p1043="vQ22o88開放欄位內容列出確認".
end if.
Exec.

*vQ23o88 開放欄位檢核 是否為複選題=1.
do if vQ23m88=1 & vQ23o88="".
Compute m1044=concat("vQ23m88=",string(vQ23m88,n2),";vQ23o88=",char.substr(vQ23o88,1,150)).
compute p1044="vQ23o88開放欄位應答而未答".
else if vQ23m88~=1 & vQ23o88~="".
Compute m1044=concat("vQ23m88=",string(vQ23m88,n2),";vQ23o88=",char.substr(vQ23o88,1,150)).
compute p1044="vQ23o88開放欄位不該答而答".
else if vQ23m88=1 & vQ23o88~="" & range(keyin,keyindate1, Keyindate2).
Compute m1044=concat("vQ23m88=",string(vQ23m88,n2),";vQ23o88=",char.substr(vQ23o88,1,150)).
compute p1044="vQ23o88開放欄位內容列出確認".
end if.
Exec.

*vQ26o88 開放欄位檢核 是否為複選題=1.
do if vQ26m88=1 & vQ26o88="".
Compute m1045=concat("vQ26m88=",string(vQ26m88,n2),";vQ26o88=",char.substr(vQ26o88,1,150)).
compute p1045="vQ26o88開放欄位應答而未答".
else if vQ26m88~=1 & vQ26o88~="".
Compute m1045=concat("vQ26m88=",string(vQ26m88,n2),";vQ26o88=",char.substr(vQ26o88,1,150)).
compute p1045="vQ26o88開放欄位不該答而答".
else if vQ26m88=1 & vQ26o88~="" & range(keyin,keyindate1, Keyindate2).
Compute m1045=concat("vQ26m88=",string(vQ26m88,n2),";vQ26o88=",char.substr(vQ26o88,1,150)).
compute p1045="vQ26o88開放欄位內容列出確認".
end if.
Exec.

*vQ27o88 開放欄位檢核 是否為複選題=1.
do if vQ27m88=1 & vQ27o88="".
Compute m1046=concat("vQ27m88=",string(vQ27m88,n2),";vQ27o88=",char.substr(vQ27o88,1,150)).
compute p1046="vQ27o88開放欄位應答而未答".
else if vQ27m88~=1 & vQ27o88~="".
Compute m1046=concat("vQ27m88=",string(vQ27m88,n2),";vQ27o88=",char.substr(vQ27o88,1,150)).
compute p1046="vQ27o88開放欄位不該答而答".
else if vQ27m88=1 & vQ27o88~="" & range(keyin,keyindate1, Keyindate2).
Compute m1046=concat("vQ27m88=",string(vQ27m88,n2),";vQ27o88=",char.substr(vQ27o88,1,150)).
compute p1046="vQ27o88開放欄位內容列出確認".
end if.
Exec.

*vQ44o88 開放欄位檢核 是否為複選題=0.
do if vQ44=88 & vQ44o88="".
Compute m1047=concat("vQ44=",string(vQ44,n2),";vQ44o88=",char.substr(vQ44o88,1,150)).
compute p1047="vQ44o88開放欄位應答而未答".
else if vQ44~=88 & vQ44o88~="".
Compute m1047=concat("vQ44=",string(vQ44,n2),";vQ44o88=",char.substr(vQ44o88,1,150)).
compute p1047="vQ44o88開放欄位不該答而答".
else if vQ44=88 & vQ44o88~="" & range(keyin,keyindate1, Keyindate2).
Compute m1047=concat("vQ44=",string(vQ44,n2),";vQ44o88=",char.substr(vQ44o88,1,150)).
compute p1047="vQ44o88開放欄位內容列出確認".
end if.
Exec.

*vQ45o88 開放欄位檢核 是否為複選題=0.
do if vQ45=88 & vQ45o88="".
Compute m1048=concat("vQ45=",string(vQ45,n2),";vQ45o88=",char.substr(vQ45o88,1,150)).
compute p1048="vQ45o88開放欄位應答而未答".
else if vQ45~=88 & vQ45o88~="".
Compute m1048=concat("vQ45=",string(vQ45,n2),";vQ45o88=",char.substr(vQ45o88,1,150)).
compute p1048="vQ45o88開放欄位不該答而答".
else if vQ45=88 & vQ45o88~="" & range(keyin,keyindate1, Keyindate2).
Compute m1048=concat("vQ45=",string(vQ45,n2),";vQ45o88=",char.substr(vQ45o88,1,150)).
compute p1048="vQ45o88開放欄位內容列出確認".
end if.
Exec.

*vQ51o88 開放欄位檢核 是否為複選題=0.
do if vQ51=88 & vQ51o88="".
Compute m1049=concat("vQ51=",string(vQ51,n2),";vQ51o88=",char.substr(vQ51o88,1,150)).
compute p1049="vQ51o88開放欄位應答而未答".
else if vQ51~=88 & vQ51o88~="".
Compute m1049=concat("vQ51=",string(vQ51,n2),";vQ51o88=",char.substr(vQ51o88,1,150)).
compute p1049="vQ51o88開放欄位不該答而答".
else if vQ51=88 & vQ51o88~="" & range(keyin,keyindate1, Keyindate2).
Compute m1049=concat("vQ51=",string(vQ51,n2),";vQ51o88=",char.substr(vQ51o88,1,150)).
compute p1049="vQ51o88開放欄位內容列出確認".
end if.
Exec.

*vQ53o88 開放欄位檢核 是否為複選題=0.
do if vQ53=88 & vQ53o88="".
Compute m1050=concat("vQ53=",string(vQ53,n2),";vQ53o88=",char.substr(vQ53o88,1,150)).
compute p1050="vQ53o88開放欄位應答而未答".
else if vQ53~=88 & vQ53o88~="".
Compute m1050=concat("vQ53=",string(vQ53,n2),";vQ53o88=",char.substr(vQ53o88,1,150)).
compute p1050="vQ53o88開放欄位不該答而答".
else if vQ53=88 & vQ53o88~="" & range(keyin,keyindate1, Keyindate2).
Compute m1050=concat("vQ53=",string(vQ53,n2),";vQ53o88=",char.substr(vQ53o88,1,150)).
compute p1050="vQ53o88開放欄位內容列出確認".
end if.
Exec.

*vQ54o88 開放欄位檢核 是否為複選題=0.
do if vQ54=88 & vQ54o88="".
Compute m1051=concat("vQ54=",string(vQ54,n2),";vQ54o88=",char.substr(vQ54o88,1,150)).
compute p1051="vQ54o88開放欄位應答而未答".
else if vQ54~=88 & vQ54o88~="".
Compute m1051=concat("vQ54=",string(vQ54,n2),";vQ54o88=",char.substr(vQ54o88,1,150)).
compute p1051="vQ54o88開放欄位不該答而答".
else if vQ54=88 & vQ54o88~="" & range(keyin,keyindate1, Keyindate2).
Compute m1051=concat("vQ54=",string(vQ54,n2),";vQ54o88=",char.substr(vQ54o88,1,150)).
compute p1051="vQ54o88開放欄位內容列出確認".
end if.
Exec.

*vZ2_1g1 開放欄位內容確認。
do if vZ2_1g1~="" & range(keyin,keyindate1, Keyindate2).
Compute m1052=concat("vZ2_1g1=",char.substr(vZ2_1g1,1,11)).
compute p1052="vZ2_1g1開放欄位內容確認".
end if.
Exec.

*vZ2_1g2 開放欄位內容確認。
do if vZ2_1g2~="" & range(keyin,keyindate1, Keyindate2).
Compute m1053=concat("vZ2_1g2=",char.substr(vZ2_1g2,1,9)).
compute p1053="vZ2_1g2開放欄位內容確認".
end if.
Exec.

*vZ2_2 開放欄位內容確認。
do if vZ2_2~="" & range(keyin,keyindate1, Keyindate2).
Compute m1054=concat("vZ2_2=",char.substr(vZ2_2,1,11)).
compute p1054="vZ2_2開放欄位內容確認".
end if.
Exec.

*vZE1o03 開放欄位檢核 是否為複選題=0.
do if vZE1=3 & vZE1o03="".
Compute m1055=concat("vZE1=",string(vZE1,n2),";vZE1o03=",char.substr(vZE1o03,1,150)).
compute p1055="vZE1o03開放欄位應答而未答".
else if vZE1~=3 & vZE1o03~="".
Compute m1055=concat("vZE1=",string(vZE1,n2),";vZE1o03=",char.substr(vZE1o03,1,150)).
compute p1055="vZE1o03開放欄位不該答而答".
else if vZE1=3 & vZE1o03~="" & range(keyin,keyindate1, Keyindate2).
Compute m1055=concat("vZE1=",string(vZE1,n2),";vZE1o03=",char.substr(vZE1o03,1,150)).
compute p1055="vZE1o03開放欄位內容列出確認".
end if.
Exec.

*vZE1o04 開放欄位檢核 是否為複選題=0.
do if vZE1=4 & vZE1o04="".
Compute m1056=concat("vZE1=",string(vZE1,n2),";vZE1o04=",char.substr(vZE1o04,1,150)).
compute p1056="vZE1o04開放欄位應答而未答".
else if vZE1~=4 & vZE1o04~="".
Compute m1056=concat("vZE1=",string(vZE1,n2),";vZE1o04=",char.substr(vZE1o04,1,150)).
compute p1056="vZE1o04開放欄位不該答而答".
else if vZE1=4 & vZE1o04~="" & range(keyin,keyindate1, Keyindate2).
Compute m1056=concat("vZE1=",string(vZE1,n2),";vZE1o04=",char.substr(vZE1o04,1,150)).
compute p1056="vZE1o04開放欄位內容列出確認".
end if.
Exec.

*vZE2_1 開放欄位內容確認。
do if vZE2_1~="" & range(keyin,keyindate1, Keyindate2).
Compute m1057=concat("vZE2_1=",char.substr(vZE2_1,1,30)).
compute p1057="vZE2_1開放欄位內容確認".
end if.
Exec.

*vZE2_2 開放欄位內容確認。
do if vZE2_2~="" & range(keyin,keyindate1, Keyindate2).
Compute m1058=concat("vZE2_2=",char.substr(vZE2_2,1,30)).
compute p1058="vZE2_2開放欄位內容確認".
end if.
Exec.

*vZE2_3 開放欄位內容確認。
do if vZE2_3~="" & range(keyin,keyindate1, Keyindate2).
Compute m1059=concat("vZE2_3=",char.substr(vZE2_3,1,150)).
compute p1059="vZE2_3開放欄位內容確認".
end if.
Exec.

* SYNTAXWORK_END_OPEN.
