* Encoding: UTF-8.

**OPEN FIELD CHECKS.

* SYNTAXWORK_BEGIN_OPEN.

*v2o14 開放欄位檢核 是否為複選題=0.
do if v2=14 & v2o14="".
Compute m251=concat("v2=",string(v2,n2),";v2o14=",char.substr(v2o14,1,150)).
compute p251="v2o14開放欄位應答而未答".
else if v2~=14 & v2o14~="".
Compute m251=concat("v2=",string(v2,n2),";v2o14=",char.substr(v2o14,1,150)).
compute p251="v2o14開放欄位不該答而答".
else if v2=14 & v2o14~="" & range(keyin,keyindate1, Keyindate2).
Compute m251=concat("v2=",string(v2,n2),";v2o14=",char.substr(v2o14,1,150)).
compute p251="v2o14開放欄位內容列出確認".
end if.
Exec.

*v13o05 開放欄位檢核 是否為複選題=0.
do if v13=5 & v13o05="".
Compute m252=concat("v13=",string(v13,n2),";v13o05=",char.substr(v13o05,1,150)).
compute p252="v13o05開放欄位應答而未答".
else if v13~=5 & v13o05~="".
Compute m252=concat("v13=",string(v13,n2),";v13o05=",char.substr(v13o05,1,150)).
compute p252="v13o05開放欄位不該答而答".
else if v13=5 & v13o05~="" & range(keyin,keyindate1, Keyindate2).
Compute m252=concat("v13=",string(v13,n2),";v13o05=",char.substr(v13o05,1,150)).
compute p252="v13o05開放欄位內容列出確認".
end if.
Exec.

*v19o06 開放欄位檢核 是否為複選題=0.
do if v19=6 & v19o06="".
Compute m253=concat("v19=",string(v19,n2),";v19o06=",char.substr(v19o06,1,150)).
compute p253="v19o06開放欄位應答而未答".
else if v19~=6 & v19o06~="".
Compute m253=concat("v19=",string(v19,n2),";v19o06=",char.substr(v19o06,1,150)).
compute p253="v19o06開放欄位不該答而答".
else if v19=6 & v19o06~="" & range(keyin,keyindate1, Keyindate2).
Compute m253=concat("v19=",string(v19,n2),";v19o06=",char.substr(v19o06,1,150)).
compute p253="v19o06開放欄位內容列出確認".
end if.
Exec.

*v27o07 開放欄位檢核 是否為複選題=0.
do if v27=7 & v27o07="".
Compute m254=concat("v27=",string(v27,n2),";v27o07=",char.substr(v27o07,1,150)).
compute p254="v27o07開放欄位應答而未答".
else if v27~=7 & v27o07~="".
Compute m254=concat("v27=",string(v27,n2),";v27o07=",char.substr(v27o07,1,150)).
compute p254="v27o07開放欄位不該答而答".
else if v27=7 & v27o07~="" & range(keyin,keyindate1, Keyindate2).
Compute m254=concat("v27=",string(v27,n2),";v27o07=",char.substr(v27o07,1,150)).
compute p254="v27o07開放欄位內容列出確認".
end if.
Exec.

*v27o08 開放欄位檢核 是否為複選題=0.
do if v27=8 & v27o08="".
Compute m255=concat("v27=",string(v27,n2),";v27o08=",char.substr(v27o08,1,150)).
compute p255="v27o08開放欄位應答而未答".
else if v27~=8 & v27o08~="".
Compute m255=concat("v27=",string(v27,n2),";v27o08=",char.substr(v27o08,1,150)).
compute p255="v27o08開放欄位不該答而答".
else if v27=8 & v27o08~="" & range(keyin,keyindate1, Keyindate2).
Compute m255=concat("v27=",string(v27,n2),";v27o08=",char.substr(v27o08,1,150)).
compute p255="v27o08開放欄位內容列出確認".
end if.
Exec.

*v28o07 開放欄位檢核 是否為複選題=0.
do if v28=7 & v28o07="".
Compute m256=concat("v28=",string(v28,n2),";v28o07=",char.substr(v28o07,1,150)).
compute p256="v28o07開放欄位應答而未答".
else if v28~=7 & v28o07~="".
Compute m256=concat("v28=",string(v28,n2),";v28o07=",char.substr(v28o07,1,150)).
compute p256="v28o07開放欄位不該答而答".
else if v28=7 & v28o07~="" & range(keyin,keyindate1, Keyindate2).
Compute m256=concat("v28=",string(v28,n2),";v28o07=",char.substr(v28o07,1,150)).
compute p256="v28o07開放欄位內容列出確認".
end if.
Exec.

*v28o08 開放欄位檢核 是否為複選題=0.
do if v28=8 & v28o08="".
Compute m257=concat("v28=",string(v28,n2),";v28o08=",char.substr(v28o08,1,150)).
compute p257="v28o08開放欄位應答而未答".
else if v28~=8 & v28o08~="".
Compute m257=concat("v28=",string(v28,n2),";v28o08=",char.substr(v28o08,1,150)).
compute p257="v28o08開放欄位不該答而答".
else if v28=8 & v28o08~="" & range(keyin,keyindate1, Keyindate2).
Compute m257=concat("v28=",string(v28,n2),";v28o08=",char.substr(v28o08,1,150)).
compute p257="v28o08開放欄位內容列出確認".
end if.
Exec.

*v29o07 開放欄位檢核 是否為複選題=0.
do if v29=7 & v29o07="".
Compute m258=concat("v29=",string(v29,n2),";v29o07=",char.substr(v29o07,1,150)).
compute p258="v29o07開放欄位應答而未答".
else if v29~=7 & v29o07~="".
Compute m258=concat("v29=",string(v29,n2),";v29o07=",char.substr(v29o07,1,150)).
compute p258="v29o07開放欄位不該答而答".
else if v29=7 & v29o07~="" & range(keyin,keyindate1, Keyindate2).
Compute m258=concat("v29=",string(v29,n2),";v29o07=",char.substr(v29o07,1,150)).
compute p258="v29o07開放欄位內容列出確認".
end if.
Exec.

*v29o08 開放欄位檢核 是否為複選題=0.
do if v29=8 & v29o08="".
Compute m259=concat("v29=",string(v29,n2),";v29o08=",char.substr(v29o08,1,150)).
compute p259="v29o08開放欄位應答而未答".
else if v29~=8 & v29o08~="".
Compute m259=concat("v29=",string(v29,n2),";v29o08=",char.substr(v29o08,1,150)).
compute p259="v29o08開放欄位不該答而答".
else if v29=8 & v29o08~="" & range(keyin,keyindate1, Keyindate2).
Compute m259=concat("v29=",string(v29,n2),";v29o08=",char.substr(v29o08,1,150)).
compute p259="v29o08開放欄位內容列出確認".
end if.
Exec.

*v45o06 開放欄位檢核 是否為複選題=1.
do if v45o06=1 & v45o06="".
Compute m260=concat("v45o06=",string(v45o06,n150),";v45o06=",char.substr(v45o06,1,150)).
compute p260="v45o06開放欄位應答而未答".
else if v45o06~=1 & v45o06~="".
Compute m260=concat("v45o06=",string(v45o06,n150),";v45o06=",char.substr(v45o06,1,150)).
compute p260="v45o06開放欄位不該答而答".
else if v45o06=1 & v45o06~="" & range(keyin,keyindate1, Keyindate2).
Compute m260=concat("v45o06=",string(v45o06,n150),";v45o06=",char.substr(v45o06,1,150)).
compute p260="v45o06開放欄位內容列出確認".
end if.
Exec.

*v50o05 開放欄位檢核 是否為複選題=0.
do if v50=5 & v50o05="".
Compute m261=concat("v50=",string(v50,n2),";v50o05=",char.substr(v50o05,1,150)).
compute p261="v50o05開放欄位應答而未答".
else if v50~=5 & v50o05~="".
Compute m261=concat("v50=",string(v50,n2),";v50o05=",char.substr(v50o05,1,150)).
compute p261="v50o05開放欄位不該答而答".
else if v50=5 & v50o05~="" & range(keyin,keyindate1, Keyindate2).
Compute m261=concat("v50=",string(v50,n2),";v50o05=",char.substr(v50o05,1,150)).
compute p261="v50o05開放欄位內容列出確認".
end if.
Exec.

*v51o07 開放欄位檢核 是否為複選題=0.
do if v51=7 & v51o07="".
Compute m262=concat("v51=",string(v51,n2),";v51o07=",char.substr(v51o07,1,150)).
compute p262="v51o07開放欄位應答而未答".
else if v51~=7 & v51o07~="".
Compute m262=concat("v51=",string(v51,n2),";v51o07=",char.substr(v51o07,1,150)).
compute p262="v51o07開放欄位不該答而答".
else if v51=7 & v51o07~="" & range(keyin,keyindate1, Keyindate2).
Compute m262=concat("v51=",string(v51,n2),";v51o07=",char.substr(v51o07,1,150)).
compute p262="v51o07開放欄位內容列出確認".
end if.
Exec.

*v52o11 開放欄位檢核 是否為複選題=0.
do if v52=11 & v52o11="".
Compute m263=concat("v52=",string(v52,n2),";v52o11=",char.substr(v52o11,1,150)).
compute p263="v52o11開放欄位應答而未答".
else if v52~=11 & v52o11~="".
Compute m263=concat("v52=",string(v52,n2),";v52o11=",char.substr(v52o11,1,150)).
compute p263="v52o11開放欄位不該答而答".
else if v52=11 & v52o11~="" & range(keyin,keyindate1, Keyindate2).
Compute m263=concat("v52=",string(v52,n2),";v52o11=",char.substr(v52o11,1,150)).
compute p263="v52o11開放欄位內容列出確認".
end if.
Exec.

*v57o04 開放欄位檢核 是否為複選題=0.
do if v57=4 & v57o04="".
Compute m264=concat("v57=",string(v57,n2),";v57o04=",char.substr(v57o04,1,150)).
compute p264="v57o04開放欄位應答而未答".
else if v57~=4 & v57o04~="".
Compute m264=concat("v57=",string(v57,n2),";v57o04=",char.substr(v57o04,1,150)).
compute p264="v57o04開放欄位不該答而答".
else if v57=4 & v57o04~="" & range(keyin,keyindate1, Keyindate2).
Compute m264=concat("v57=",string(v57,n2),";v57o04=",char.substr(v57o04,1,150)).
compute p264="v57o04開放欄位內容列出確認".
end if.
Exec.

*v58o05 開放欄位檢核 是否為複選題=0.
do if v58=5 & v58o05="".
Compute m265=concat("v58=",string(v58,n2),";v58o05=",char.substr(v58o05,1,150)).
compute p265="v58o05開放欄位應答而未答".
else if v58~=5 & v58o05~="".
Compute m265=concat("v58=",string(v58,n2),";v58o05=",char.substr(v58o05,1,150)).
compute p265="v58o05開放欄位不該答而答".
else if v58=5 & v58o05~="" & range(keyin,keyindate1, Keyindate2).
Compute m265=concat("v58=",string(v58,n2),";v58o05=",char.substr(v58o05,1,150)).
compute p265="v58o05開放欄位內容列出確認".
end if.
Exec.

*v59o08 開放欄位檢核 是否為複選題=0.
do if v59=8 & v59o08="".
Compute m266=concat("v59=",string(v59,n2),";v59o08=",char.substr(v59o08,1,150)).
compute p266="v59o08開放欄位應答而未答".
else if v59~=8 & v59o08~="".
Compute m266=concat("v59=",string(v59,n2),";v59o08=",char.substr(v59o08,1,150)).
compute p266="v59o08開放欄位不該答而答".
else if v59=8 & v59o08~="" & range(keyin,keyindate1, Keyindate2).
Compute m266=concat("v59=",string(v59,n2),";v59o08=",char.substr(v59o08,1,150)).
compute p266="v59o08開放欄位內容列出確認".
end if.
Exec.

*v69o15 開放欄位檢核 是否為複選題=0.
do if v69=15 & v69o15="".
Compute m267=concat("v69=",string(v69,n2),";v69o15=",char.substr(v69o15,1,150)).
compute p267="v69o15開放欄位應答而未答".
else if v69~=15 & v69o15~="".
Compute m267=concat("v69=",string(v69,n2),";v69o15=",char.substr(v69o15,1,150)).
compute p267="v69o15開放欄位不該答而答".
else if v69=15 & v69o15~="" & range(keyin,keyindate1, Keyindate2).
Compute m267=concat("v69=",string(v69,n2),";v69o15=",char.substr(v69o15,1,150)).
compute p267="v69o15開放欄位內容列出確認".
end if.
Exec.

*v70o10 開放欄位檢核 是否為複選題=0.
do if v70=10 & v70o10="".
Compute m268=concat("v70=",string(v70,n2),";v70o10=",char.substr(v70o10,1,150)).
compute p268="v70o10開放欄位應答而未答".
else if v70~=10 & v70o10~="".
Compute m268=concat("v70=",string(v70,n2),";v70o10=",char.substr(v70o10,1,150)).
compute p268="v70o10開放欄位不該答而答".
else if v70=10 & v70o10~="" & range(keyin,keyindate1, Keyindate2).
Compute m268=concat("v70=",string(v70,n2),";v70o10=",char.substr(v70o10,1,150)).
compute p268="v70o10開放欄位內容列出確認".
end if.
Exec.

*v71_1o10 開放欄位檢核 是否為複選題=0.
do if v71_1=10 & v71_1o10="".
Compute m269=concat("v71_1=",string(v71_1,n2),";v71_1o10=",char.substr(v71_1o10,1,150)).
compute p269="v71_1o10開放欄位應答而未答".
else if v71_1~=10 & v71_1o10~="".
Compute m269=concat("v71_1=",string(v71_1,n2),";v71_1o10=",char.substr(v71_1o10,1,150)).
compute p269="v71_1o10開放欄位不該答而答".
else if v71_1=10 & v71_1o10~="" & range(keyin,keyindate1, Keyindate2).
Compute m269=concat("v71_1=",string(v71_1,n2),";v71_1o10=",char.substr(v71_1o10,1,150)).
compute p269="v71_1o10開放欄位內容列出確認".
end if.
Exec.

*v71_2s1 開放欄位檢核 是否為複選題=0.
do if range(v71_2s1,1,10) & v71_2s1="".
Compute m270=concat("v71_2s1=",string(v71_2s1,n150),";v71_2s1=",char.substr(v71_2s1,1,150)).
compute p270="v71_2s1開放欄位應答而未答".
else if not range(v71_2s1,1,10) & v71_2s1~="".
Compute m270=concat("v71_2s1=",string(v71_2s1,n150),";v71_2s1=",char.substr(v71_2s1,1,150)).
compute p270="v71_2s1開放欄位不該答而答".
else if range(v71_2s1,1,10) & v71_2s1~="" & range(keyin,keyindate1, Keyindate2).
Compute m270=concat("v71_2s1=",string(v71_2s1,n150),";v71_2s1=",char.substr(v71_2s1,1,150)).
compute p270="v71_2s1開放欄位內容列出確認".
end if.
Exec.

*v71_2s2 開放欄位檢核 是否為複選題=0.
do if range(v71_2s2,1,10) & v71_2s2="".
Compute m271=concat("v71_2s2=",string(v71_2s2,n150),";v71_2s2=",char.substr(v71_2s2,1,150)).
compute p271="v71_2s2開放欄位應答而未答".
else if not range(v71_2s2,1,10) & v71_2s2~="".
Compute m271=concat("v71_2s2=",string(v71_2s2,n150),";v71_2s2=",char.substr(v71_2s2,1,150)).
compute p271="v71_2s2開放欄位不該答而答".
else if range(v71_2s2,1,10) & v71_2s2~="" & range(keyin,keyindate1, Keyindate2).
Compute m271=concat("v71_2s2=",string(v71_2s2,n150),";v71_2s2=",char.substr(v71_2s2,1,150)).
compute p271="v71_2s2開放欄位內容列出確認".
end if.
Exec.

*v71_2s3 開放欄位檢核 是否為複選題=0.
do if range(v71_2s3,1,10) & v71_2s3="".
Compute m272=concat("v71_2s3=",string(v71_2s3,n150),";v71_2s3=",char.substr(v71_2s3,1,150)).
compute p272="v71_2s3開放欄位應答而未答".
else if not range(v71_2s3,1,10) & v71_2s3~="".
Compute m272=concat("v71_2s3=",string(v71_2s3,n150),";v71_2s3=",char.substr(v71_2s3,1,150)).
compute p272="v71_2s3開放欄位不該答而答".
else if range(v71_2s3,1,10) & v71_2s3~="" & range(keyin,keyindate1, Keyindate2).
Compute m272=concat("v71_2s3=",string(v71_2s3,n150),";v71_2s3=",char.substr(v71_2s3,1,150)).
compute p272="v71_2s3開放欄位內容列出確認".
end if.
Exec.

*v71_2s4 開放欄位檢核 是否為複選題=0.
do if range(v71_2s4,1,10) & v71_2s4="".
Compute m273=concat("v71_2s4=",string(v71_2s4,n150),";v71_2s4=",char.substr(v71_2s4,1,150)).
compute p273="v71_2s4開放欄位應答而未答".
else if not range(v71_2s4,1,10) & v71_2s4~="".
Compute m273=concat("v71_2s4=",string(v71_2s4,n150),";v71_2s4=",char.substr(v71_2s4,1,150)).
compute p273="v71_2s4開放欄位不該答而答".
else if range(v71_2s4,1,10) & v71_2s4~="" & range(keyin,keyindate1, Keyindate2).
Compute m273=concat("v71_2s4=",string(v71_2s4,n150),";v71_2s4=",char.substr(v71_2s4,1,150)).
compute p273="v71_2s4開放欄位內容列出確認".
end if.
Exec.

*v74o09 開放欄位檢核 是否為複選題=0.
do if v74=9 & v74o09="".
Compute m274=concat("v74=",string(v74,n2),";v74o09=",char.substr(v74o09,1,150)).
compute p274="v74o09開放欄位應答而未答".
else if v74~=9 & v74o09~="".
Compute m274=concat("v74=",string(v74,n2),";v74o09=",char.substr(v74o09,1,150)).
compute p274="v74o09開放欄位不該答而答".
else if v74=9 & v74o09~="" & range(keyin,keyindate1, Keyindate2).
Compute m274=concat("v74=",string(v74,n2),";v74o09=",char.substr(v74o09,1,150)).
compute p274="v74o09開放欄位內容列出確認".
end if.
Exec.

*v75o05 開放欄位檢核 是否為複選題=0.
do if v75=5 & v75o05="".
Compute m275=concat("v75=",string(v75,n2),";v75o05=",char.substr(v75o05,1,150)).
compute p275="v75o05開放欄位應答而未答".
else if v75~=5 & v75o05~="".
Compute m275=concat("v75=",string(v75,n2),";v75o05=",char.substr(v75o05,1,150)).
compute p275="v75o05開放欄位不該答而答".
else if v75=5 & v75o05~="" & range(keyin,keyindate1, Keyindate2).
Compute m275=concat("v75=",string(v75,n2),";v75o05=",char.substr(v75o05,1,150)).
compute p275="v75o05開放欄位內容列出確認".
end if.
Exec.

*vZ1city_oth 開放欄位檢核 是否為複選題=0.
do if vZ1city=29 & vZ1city_oth="".
Compute m276=concat("vZ1city=",string(vZ1city,n2),";vZ1city_oth=",char.substr(vZ1city_oth,1,150)).
compute p276="vZ1city_oth開放欄位應答而未答".
else if vZ1city~=29 & vZ1city_oth~="".
Compute m276=concat("vZ1city=",string(vZ1city,n2),";vZ1city_oth=",char.substr(vZ1city_oth,1,150)).
compute p276="vZ1city_oth開放欄位不該答而答".
else if vZ1city=29 & vZ1city_oth~="" & range(keyin,keyindate1, Keyindate2).
Compute m276=concat("vZ1city=",string(vZ1city,n2),";vZ1city_oth=",char.substr(vZ1city_oth,1,150)).
compute p276="vZ1city_oth開放欄位內容列出確認".
end if.
Exec.

*vZ2city_oth 開放欄位檢核 是否為複選題=0.
do if vZ2city=29 & vZ2city_oth="".
Compute m277=concat("vZ2city=",string(vZ2city,n2),";vZ2city_oth=",char.substr(vZ2city_oth,1,150)).
compute p277="vZ2city_oth開放欄位應答而未答".
else if vZ2city~=29 & vZ2city_oth~="".
Compute m277=concat("vZ2city=",string(vZ2city,n2),";vZ2city_oth=",char.substr(vZ2city_oth,1,150)).
compute p277="vZ2city_oth開放欄位不該答而答".
else if vZ2city=29 & vZ2city_oth~="" & range(keyin,keyindate1, Keyindate2).
Compute m277=concat("vZ2city=",string(vZ2city,n2),";vZ2city_oth=",char.substr(vZ2city_oth,1,150)).
compute p277="vZ2city_oth開放欄位內容列出確認".
end if.
Exec.

*vZ3city_oth 開放欄位檢核 是否為複選題=0.
do if vZ3city=29 & vZ3city_oth="".
Compute m278=concat("vZ3city=",string(vZ3city,n2),";vZ3city_oth=",char.substr(vZ3city_oth,1,150)).
compute p278="vZ3city_oth開放欄位應答而未答".
else if vZ3city~=29 & vZ3city_oth~="".
Compute m278=concat("vZ3city=",string(vZ3city,n2),";vZ3city_oth=",char.substr(vZ3city_oth,1,150)).
compute p278="vZ3city_oth開放欄位不該答而答".
else if vZ3city=29 & vZ3city_oth~="" & range(keyin,keyindate1, Keyindate2).
Compute m278=concat("vZ3city=",string(vZ3city,n2),";vZ3city_oth=",char.substr(vZ3city_oth,1,150)).
compute p278="vZ3city_oth開放欄位內容列出確認".
end if.
Exec.

* SYNTAXWORK_END_OPEN.
