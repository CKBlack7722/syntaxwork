* Encoding: UTF-8.

* Generated survey check syntax.

* Sections are generated separately, then combined here in execution order.

* Encoding: UTF-8.
**四、邏輯檢核.
* SYNTAXWORK_BEGIN_LOGIC.
* logic check mutex.
do if (any(vZA0,2)) & (any(vZA0_1,1,2)).
compute m1201=concat("vZA0=",string(vZA0,n2),",vZA0_1=",string(vZA0_1,n2)).
compute p1201="vZA0 in 2與互斥條件不應同時成立".
end if.

* logic check mutex.
do if (any(vZA0_1,2)) & (any(vSF0,1)).
compute m1202=concat("vZA0_1=",string(vZA0_1,n2),",vSF0=",string(vSF0,n2)).
compute p1202="vZA0_1 in 2與互斥條件不應同時成立".
end if.

* logic check show vA2.
do if (any(vA1,997,998)) & any(1,vA2_96).
compute m1203=concat("vA1=",string(vA1,n4),",vA2=",string(vA2,n2)).
compute p1203="vA1 in 997 | vA1 in 998，應答vA2而未答".
end if.

* logic check hide vA2.
do if (not any(vA1,997,998)) & any(0,vA2_96).
compute m1204=concat("vA1=",string(vA1,n4),",vA2=",string(vA2,n2)).
compute p1204="vA1~=997 & vA1~=998，不應答vA2而答".
end if.

* logic check hide vQ44.
do if (any(vA1,96) | any(vA2,1)) & any(0,vQ44_96).
compute m1205=concat("vA1=",string(vA1,n4),",vA2=",string(vA2,n2),",vQ44=",string(vQ44,n2)).
compute p1205="vA1 in 96 | vA2 in 1，不應答vQ44而答".
end if.

* logic check show vQ44.
do if (vA1~=96 & not any(vA2,1,96)) & any(1,vQ44_96).
compute m1206=concat("vA1=",string(vA1,n4),",vA2=",string(vA2,n2),",vQ44=",string(vQ44,n2)).
compute p1206="vA1~=96 & vA2~=1 & vA2~=96，應答vQ44而未答".
end if.

* logic check hide vA5city,vA5town.
do if (any(vA4,1,97,98)) & (any(0,vA5city_96) | any(0,vA5town_96)).
compute m1207=concat("vA4=",string(vA4,n2),",vA5city=",string(vA5city,n2),",vA5town=",string(vA5town,n4)).
compute p1207="vA4 in 1 | vA4 in 97 | vA4 in 98，不應答vA5city,vA5town而答".
end if.

* logic check show vA5city,vA5town.
do if (not any(vA4,1,97,98)) & (any(1,vA5city_96) | any(1,vA5town_96)).
compute m1208=concat("vA4=",string(vA4,n2),",vA5city=",string(vA5city,n2),",vA5town=",string(vA5town,n4)).
compute p1208="vA4~=1 & vA4~=97 & vA4~=98，應答vA5city,vA5town而未答".
end if.

* logic check hide vG1.
do if (any(vA9,1)) & any(0,vG1_96).
compute m1209=concat("vA9=",string(vA9,n2),",vG1=",string(vG1,n4)).
compute p1209="vA9 in 1，不應答vG1而答".
end if.

* logic check show vG1.
do if (vA9~=1) & any(1,vG1_96).
compute m1210=concat("vA9=",string(vA9,n2),",vG1=",string(vG1,n4)).
compute p1210="vA9~=1，應答vG1而未答".
end if.

* logic check hide vG2.
do if (any(vA9,1) | any(vG1,0)) & any(0,vG2_96).
compute m1211=concat("vA9=",string(vA9,n2),",vG1=",string(vG1,n4),",vG2=",string(vG2,n5)).
compute p1211="vA9 in 1 | vG1 in 0，不應答vG2而答".
end if.

* logic check show vG2.
do if (vA9~=1 & not any(vG1,0,9996)) & any(1,vG2_96).
compute m1212=concat("vA9=",string(vA9,n2),",vG1=",string(vG1,n4),",vG2=",string(vG2,n5)).
compute p1212="vA9~=1 & vG1~=0 & vG1~=9996，應答vG2而未答".
end if.

* logic check hide vG3m01,vG3m02,vG3m03,vG3m04,vG3m05,vG3m06,vG3m07,vG3m08,vG3m09,vG3m10,vG3m11,vG3m12,vG3m13,vG3m14,vG3m15,vG3m16,vG3m18,vG3m19,vG3m20,vG3m21.
* vG3m22,vG3m23,vG3m24,vG3m25,vG3m26,vG3m27,vG3m28,vG3m29,vG3m30,vG3m31,vG3m32,vG3m33,vG3m88.
do if (any(vA9 , 1) | any(vG1 , 0)) & (any(0 , vG3m01_96) | any(0 , vG3m02_96) | any(0 , vG3m03_96) | any(0 , vG3m04_96) | any(0 , vG3m05_96) | any(0
, vG3m06_96) | any(0 , vG3m07_96) | any(0 , vG3m08_96) | any(0 , vG3m09_96) | any(0 , vG3m10_96) | any(0 , vG3m11_96) | any(0 , vG3m12_96) | any(0 , vG3m13_96)
| any(0 , vG3m14_96) | any(0 , vG3m15_96) | any(0 , vG3m16_96) | any(0 , vG3m18_96) | any(0 , vG3m19_96) | any(0 , vG3m20_96) | any(0 , vG3m21_96) | any(0
, vG3m22_96) | any(0 , vG3m23_96) | any(0 , vG3m24_96) | any(0 , vG3m25_96) | any(0 , vG3m26_96) | any(0 , vG3m27_96) | any(0 , vG3m28_96) | any(0 , vG3m29_96)
| any(0 , vG3m30_96) | any(0 , vG3m31_96) | any(0 , vG3m32_96) | any(0 , vG3m33_96) | any(0 , vG3m88_96)).
compute m1213=concat(
  "vA9=", string(vA9,n2), ",vG1=", string(vG1,n4), ",vG3m01=", string(vG3m01,n2), ",vG3m02=", string(vG3m02,n2), ",vG3m03=", string(vG3m03,n2), ",vG3m04=",
  string(vG3m04,n2), ",vG3m05=", string(vG3m05,n2), ",vG3m06=", string(vG3m06,n2), ",vG3m07=", string(vG3m07,n2), ",vG3m08=", string(vG3m08,n2), ",vG3m09=",
  string(vG3m09,n2), ",vG3m10=", string(vG3m10,n2), ",vG3m11=", string(vG3m11,n2), ",vG3m12=", string(vG3m12,n2), ",vG3m13=", string(vG3m13,n2), ",vG3m14=",
  string(vG3m14,n2), ",vG3m15=", string(vG3m15,n2), ",vG3m16=", string(vG3m16,n2), ",vG3m18=", string(vG3m18,n2), ",vG3m19=", string(vG3m19,n2), ",vG3m20=",
  string(vG3m20,n2), ",vG3m21=", string(vG3m21,n2), ",vG3m22=", string(vG3m22,n2), ",vG3m23=", string(vG3m23,n2), ",vG3m24=", string(vG3m24,n2), ",vG3m25=",
  string(vG3m25,n2), ",vG3m26=", string(vG3m26,n2), ",vG3m27=", string(vG3m27,n2), ",vG3m28=", string(vG3m28,n2), ",vG3m29=", string(vG3m29,n2), ",vG3m30=",
  string(vG3m30,n2), ",vG3m31=", string(vG3m31,n2), ",vG3m32=", string(vG3m32,n2), ",vG3m33=", string(vG3m33,n2), ",vG3m88=", string(vG3m88,n2)
).
compute p1213=concat(
  "vA9 in 1 | vG1 in 0，不應答vG3m01,vG3m02,vG3m03,vG3m04,vG3m05,vG3m06,vG3m07,vG3m08,vG3m09,vG3m10,vG3m11,",
  "vG3m12,vG3m13,vG3m14,vG3m15,vG3m16,vG3m18,vG3m19,vG3m20,vG3m21,vG3m22,vG3m23,vG3m24,vG3m25,vG3m26,vG",
  "3m27,vG3m28,vG3m29,vG3m30,vG3m31,vG3m32,vG3m33,vG3m88而答"
).
end if.

* logic check show vG3m01,vG3m02,vG3m03,vG3m04,vG3m05,vG3m06,vG3m07,vG3m08,vG3m09,vG3m10,vG3m11,vG3m12,vG3m13,vG3m14,vG3m15,vG3m16,vG3m18,vG3m19,vG3m20,vG3m21.
* vG3m22,vG3m23,vG3m24,vG3m25,vG3m26,vG3m27,vG3m28,vG3m29,vG3m30,vG3m31,vG3m32,vG3m33,vG3m88.
do if (vA9~=1 & not any(vG1 , 0 , 9996)) & (any(1 , vG3m01_96) | any(1 , vG3m02_96) | any(1 , vG3m03_96) | any(1 , vG3m04_96) | any(1 , vG3m05_96) | any(1
, vG3m06_96) | any(1 , vG3m07_96) | any(1 , vG3m08_96) | any(1 , vG3m09_96) | any(1 , vG3m10_96) | any(1 , vG3m11_96) | any(1 , vG3m12_96) | any(1 , vG3m13_96)
| any(1 , vG3m14_96) | any(1 , vG3m15_96) | any(1 , vG3m16_96) | any(1 , vG3m18_96) | any(1 , vG3m19_96) | any(1 , vG3m20_96) | any(1 , vG3m21_96) | any(1
, vG3m22_96) | any(1 , vG3m23_96) | any(1 , vG3m24_96) | any(1 , vG3m25_96) | any(1 , vG3m26_96) | any(1 , vG3m27_96) | any(1 , vG3m28_96) | any(1 , vG3m29_96)
| any(1 , vG3m30_96) | any(1 , vG3m31_96) | any(1 , vG3m32_96) | any(1 , vG3m33_96) | any(1 , vG3m88_96)).
compute m1214=concat(
  "vA9=", string(vA9,n2), ",vG1=", string(vG1,n4), ",vG3m01=", string(vG3m01,n2), ",vG3m02=", string(vG3m02,n2), ",vG3m03=", string(vG3m03,n2), ",vG3m04=",
  string(vG3m04,n2), ",vG3m05=", string(vG3m05,n2), ",vG3m06=", string(vG3m06,n2), ",vG3m07=", string(vG3m07,n2), ",vG3m08=", string(vG3m08,n2), ",vG3m09=",
  string(vG3m09,n2), ",vG3m10=", string(vG3m10,n2), ",vG3m11=", string(vG3m11,n2), ",vG3m12=", string(vG3m12,n2), ",vG3m13=", string(vG3m13,n2), ",vG3m14=",
  string(vG3m14,n2), ",vG3m15=", string(vG3m15,n2), ",vG3m16=", string(vG3m16,n2), ",vG3m18=", string(vG3m18,n2), ",vG3m19=", string(vG3m19,n2), ",vG3m20=",
  string(vG3m20,n2), ",vG3m21=", string(vG3m21,n2), ",vG3m22=", string(vG3m22,n2), ",vG3m23=", string(vG3m23,n2), ",vG3m24=", string(vG3m24,n2), ",vG3m25=",
  string(vG3m25,n2), ",vG3m26=", string(vG3m26,n2), ",vG3m27=", string(vG3m27,n2), ",vG3m28=", string(vG3m28,n2), ",vG3m29=", string(vG3m29,n2), ",vG3m30=",
  string(vG3m30,n2), ",vG3m31=", string(vG3m31,n2), ",vG3m32=", string(vG3m32,n2), ",vG3m33=", string(vG3m33,n2), ",vG3m88=", string(vG3m88,n2)
).
compute p1214=concat(
  "vA9~=1 & vG1~=0 & vG1~=9996，應答vG3m01,vG3m02,vG3m03,vG3m04,vG3m05,vG3m06,vG3m07,vG3m08,vG3m09,vG3m10,",
  "vG3m11,vG3m12,vG3m13,vG3m14,vG3m15,vG3m16,vG3m18,vG3m19,vG3m20,vG3m21,vG3m22,vG3m23,vG3m24,vG3m25,vG",
  "3m26,vG3m27,vG3m28,vG3m29,vG3m30,vG3m31,vG3m32,vG3m33,vG3m88而未答"
).
end if.

* logic check hide vF0.
do if (any(vA9,1)) & any(0,vF0_96).
compute m1215=concat("vA9=",string(vA9,n2),",vF0=",string(vF0,n2)).
compute p1215="vA9 in 1，不應答vF0而答".
end if.

* logic check show vF0.
do if (vA9~=1) & any(1,vF0_96).
compute m1216=concat("vA9=",string(vA9,n2),",vF0=",string(vF0,n2)).
compute p1216="vA9~=1，應答vF0而未答".
end if.

* logic check hide vJ4_2.
do if (any(vA9,1)) & any(0,vJ4_2_96).
compute m1217=concat("vA9=",string(vA9,n2),",vJ4_2=",string(vJ4_2,n4)).
compute p1217="vA9 in 1，不應答vJ4_2而答".
end if.

* logic check show vJ4_2.
do if (vA9~=1) & any(1,vJ4_2_96).
compute m1218=concat("vA9=",string(vA9,n2),",vJ4_2=",string(vJ4_2,n4)).
compute p1218="vA9~=1，應答vJ4_2而未答".
end if.

* logic check hide vJ4_4.
do if (any(vA9,1)) & any(0,vJ4_4_96).
compute m1219=concat("vA9=",string(vA9,n2),",vJ4_4=",string(vJ4_4,n4)).
compute p1219="vA9 in 1，不應答vJ4_4而答".
end if.

* logic check show vJ4_4.
do if (vA9~=1) & any(1,vJ4_4_96).
compute m1220=concat("vA9=",string(vA9,n2),",vJ4_4=",string(vJ4_4,n4)).
compute p1220="vA9~=1，應答vJ4_4而未答".
end if.

* logic check hide vQ1.
do if (any(vG1,0) | any(vA9,1)) & any(0,vQ1_96).
compute m1221=concat("vG1=",string(vG1,n4),",vA9=",string(vA9,n2),",vQ1=",string(vQ1,n2)).
compute p1221="vG1 in 0 | vA9 in 1，不應答vQ1而答".
end if.

* logic check show vQ1.
do if (not any(vG1,0,9996) & vA9~=1) & any(1,vQ1_96).
compute m1222=concat("vG1=",string(vG1,n4),",vA9=",string(vA9,n2),",vQ1=",string(vQ1,n2)).
compute p1222="vG1~=0 & vA9~=1 & vG1~=9996，應答vQ1而未答".
end if.

* logic check hide vQ2.
do if (any(vF0,90) | any(vA9,1)) & any(0,vQ2_96).
compute m1223=concat("vF0=",string(vF0,n2),",vA9=",string(vA9,n2),",vQ2=",string(vQ2,n2)).
compute p1223="vF0 in 90 | vA9 in 1，不應答vQ2而答".
end if.

* logic check show vQ2.
do if (not any(vF0,90,96) & vA9~=1) & any(1,vQ2_96).
compute m1224=concat("vF0=",string(vF0,n2),",vA9=",string(vA9,n2),",vQ2=",string(vQ2,n2)).
compute p1224="vF0~=90 & vA9~=1 & vF0~=96，應答vQ2而未答".
end if.

* logic check show vCkZE1.
do if (any(vA9,1) | any(vE1,2,97,98)) & any(1,vCkZE1_96).
compute m1225=concat("vA9=",string(vA9,n2),",vE1=",string(vE1,n2),",vCkZE1=",string(vCkZE1,n14)).
compute p1225="vA9 in 1 | vE1 in 2 | vE1 in 97 | vE1 in 98，應答vCkZE1而未答".
end if.

* logic check hide vCkZE1.
do if (vA9~=1 & not any(vE1,2,97,98)) & any(0,vCkZE1_96).
compute m1226=concat("vA9=",string(vA9,n2),",vE1=",string(vE1,n2),",vCkZE1=",string(vCkZE1,n14)).
compute p1226="vA9~=1 & vE1~=2 & vE1~=97 & vE1~=98，不應答vCkZE1而答".
end if.

* logic check hide vZE2m01,vZE2m02,vZE2m03.
do if (any(vA9,1) | any(vE1,2,97,98)) & (any(0,vZE2m01_96) | any(0,vZE2m02_96) | any(0,vZE2m03_96)).
compute m1227=concat("vA9=",string(vA9,n2),",vE1=",string(vE1,n2),",vZE2m01=",string(vZE2m01,n2),",vZE2m02=",string(vZE2m02,n2),",vZE2m03=",string(vZE2m03,n2)).
compute p1227="vA9 in 1 | vE1 in 2 | vE1 in 97 | vE1 in 98，不應答vZE2m01,vZE2m02,vZE2m03而答".
end if.

* logic check show vZE2m01,vZE2m02,vZE2m03.
do if (vA9~=1 & not any(vE1,2,97,98)) & (any(1,vZE2m01_96) | any(1,vZE2m02_96) | any(1,vZE2m03_96)).
compute m1228=concat("vA9=",string(vA9,n2),",vE1=",string(vE1,n2),",vZE2m01=",string(vZE2m01,n2),",vZE2m02=",string(vZE2m02,n2),",vZE2m03=",string(vZE2m03,n2)).
compute p1228="vA9~=1 & vE1~=2 & vE1~=97 & vE1~=98，應答vZE2m01,vZE2m02,vZE2m03而未答".
end if.

* logic check mutex.
do if (any(vA9,1)) & (any(vO1_1,1)).
compute m1229=concat("vA9=",string(vA9,n2),",vO1_1=",string(vO1_1,n2)).
compute p1229="vA9 in 1與互斥條件不應同時成立".
end if.

* logic check mutex.
do if (any(vA9,1)) & (any(vO1_1,2)).
compute m1230=concat("vA9=",string(vA9,n2),",vO1_1=",string(vO1_1,n2)).
compute p1230="vA9 in 1與互斥條件不應同時成立".
end if.

* logic check mutex.
do if (any(vA9,1)) & (any(vO1_1,3)).
compute m1231=concat("vA9=",string(vA9,n2),",vO1_1=",string(vO1_1,n2)).
compute p1231="vA9 in 1與互斥條件不應同時成立".
end if.

* logic check mutex.
do if (any(vA9,1)) & (any(vO1_1,4)).
compute m1232=concat("vA9=",string(vA9,n2),",vO1_1=",string(vO1_1,n2)).
compute p1232="vA9 in 1與互斥條件不應同時成立".
end if.

* logic check show vE5.
do if ((any(vE2m01,1) | any(vE17,1) | any(vE18,1)) & (any(vO1_1,1,2,3,4,88) | any(vO1,1,2,3,4,5,12,13,14,88))) & any(1,vE5_96).
compute m1233=concat(
  "vE2m01=", string(vE2m01,n2), ",vE17=", string(vE17,n2), ",vE18=", string(vE18,n2), ",vO1_1=", string(vO1_1,n2), ",vO1=", string(vO1,n2), ",vE5=",
  string(vE5,n5)
).
compute p1233=concat(
  "(vE2m01 in 1 | vE17 in 1 | vE18 in 1) & (vO1_1 in 1 | vO1_1 in 2 | vO1_1 in 3 | vO1_1 in 4 | vO1_1 i",
  "n 88 | vO1 in 1 | vO1 in 2 | vO1 in 3 | vO1 in 4 | vO1 in 5 | vO1 in 12 | vO1 in 13 | vO1 in 14 | vO",
  "1 in 88)，應答vE5而未答"
).
end if.

* logic check hide vE5.
do if (((vE2m01~=1 & vE17~=1 & vE18~=1) | (not any(vO1_1,1,2,3,4,88) & not any(vO1,1,2,3,4,5,12,13,14,88))) & vE2m01~=96 & vE17~=96 & vE18~=96) & any(0,vE5_96).
compute m1234=concat(
  "vE2m01=", string(vE2m01,n2), ",vE17=", string(vE17,n2), ",vE18=", string(vE18,n2), ",vO1_1=", string(vO1_1,n2), ",vO1=", string(vO1,n2), ",vE5=",
  string(vE5,n5)
).
compute p1234=concat(
  "((vE2m01~=1 & vE17~=1 & vE18~=1) | (vO1_1~=1 & vO1_1~=2 & vO1_1~=3 & vO1_1~=4 & vO1_1~=88 & vO1~=1 &",
  " vO1~=2 & vO1~=3 & vO1~=4 & vO1~=5 & vO1~=12 & vO1~=13 & vO1~=14 & vO1~=88)) & vE2m01~=96 & vE17~=96",
  " & vE18~=96，不應答vE5而答"
).
end if.

* logic check show vE8.
do if ((any(vE2m02,1) | any(vE17,2) | any(vE18,2)) & (any(vO1_1,1,2,3,4,88) | any(vO1,1,2,3,4,5,12,13,14,88))) & any(1,vE8_96).
compute m1235=concat(
  "vE2m02=", string(vE2m02,n2), ",vE17=", string(vE17,n2), ",vE18=", string(vE18,n2), ",vO1_1=", string(vO1_1,n2), ",vO1=", string(vO1,n2), ",vE8=",
  string(vE8,n5)
).
compute p1235=concat(
  "(vE2m02 in 1 | vE17 in 2 | vE18 in 2) & (vO1_1 in 1 | vO1_1 in 2 | vO1_1 in 3 | vO1_1 in 4 | vO1_1 i",
  "n 88 | vO1 in 1 | vO1 in 2 | vO1 in 3 | vO1 in 4 | vO1 in 5 | vO1 in 12 | vO1 in 13 | vO1 in 14 | vO",
  "1 in 88)，應答vE8而未答"
).
end if.

* logic check hide vE8.
do if (((vE2m02~=1 & vE17~=2 & vE18~=2) | (not any(vO1_1,1,2,3,4,88) & not any(vO1,1,2,3,4,5,12,13,14,88))) & vE2m02~=96 & vE17~=96 & vE18~=96) & any(0,vE8_96).
compute m1236=concat(
  "vE2m02=", string(vE2m02,n2), ",vE17=", string(vE17,n2), ",vE18=", string(vE18,n2), ",vO1_1=", string(vO1_1,n2), ",vO1=", string(vO1,n2), ",vE8=",
  string(vE8,n5)
).
compute p1236=concat(
  "((vE2m02~=1 & vE17~=2 & vE18~=2) | (vO1_1~=1 & vO1_1~=2 & vO1_1~=3 & vO1_1~=4 & vO1_1~=88 & vO1~=1 &",
  " vO1~=2 & vO1~=3 & vO1~=4 & vO1~=5 & vO1~=12 & vO1~=13 & vO1~=14 & vO1~=88)) & vE2m02~=96 & vE17~=96",
  " & vE18~=96，不應答vE8而答"
).
end if.

* logic check show vE11.
do if ((any(vE2m03,1) | any(vE17,3) | any(vE18,3)) & (any(vO1_1,1,2,3,4,88) | any(vO1,1,2,3,4,5,12,13,14,88))) & any(1,vE11_96).
compute m1237=concat(
  "vE2m03=", string(vE2m03,n2), ",vE17=", string(vE17,n2), ",vE18=", string(vE18,n2), ",vO1_1=", string(vO1_1,n2), ",vO1=", string(vO1,n2), ",vE11=",
  string(vE11,n5)
).
compute p1237=concat(
  "(vE2m03 in 1 | vE17 in 3 | vE18 in 3) & (vO1_1 in 1 | vO1_1 in 2 | vO1_1 in 3 | vO1_1 in 4 | vO1_1 i",
  "n 88 | vO1 in 1 | vO1 in 2 | vO1 in 3 | vO1 in 4 | vO1 in 5 | vO1 in 12 | vO1 in 13 | vO1 in 14 | vO",
  "1 in 88)，應答vE11而未答"
).
end if.

* logic check hide vE11.
do if (((vE2m03~=1 & vE17~=3 & vE18~=3) | (not any(vO1_1 , 1 , 2 , 3 , 4 , 88) & not any(vO1 , 1 , 2 , 3 , 4 , 5 , 12 , 13 , 14 , 88))) & vE2m03~=96 & vE17~=96
& vE18~=96) & any(0 , vE11_96).
compute m1238=concat(
  "vE2m03=", string(vE2m03,n2), ",vE17=", string(vE17,n2), ",vE18=", string(vE18,n2), ",vO1_1=", string(vO1_1,n2), ",vO1=", string(vO1,n2), ",vE11=",
  string(vE11,n5)
).
compute p1238=concat(
  "((vE2m03~=1 & vE17~=3 & vE18~=3) | (vO1_1~=1 & vO1_1~=2 & vO1_1~=3 & vO1_1~=4 & vO1_1~=88 & vO1~=1 &",
  " vO1~=2 & vO1~=3 & vO1~=4 & vO1~=5 & vO1~=12 & vO1~=13 & vO1~=14 & vO1~=88)) & vE2m03~=96 & vE17~=96",
  " & vE18~=96，不應答vE11而答"
).
end if.

* logic check mutex.
do if (any(vO1_1,5)) & (any(vO1,14)).
compute m1239=concat("vO1_1=",string(vO1_1,n2),",vO1=",string(vO1,n2)).
compute p1239="vO1_1 in 5與互斥條件不應同時成立".
end if.

* logic check show vO2.
do if (any(vO1,1,2,3,4,5,88)) & any(1,vO2_96).
compute m1240=concat("vO1=",string(vO1,n2),",vO2=",string(vO2,n2)).
compute p1240="vO1 in 1 | vO1 in 2 | vO1 in 3 | vO1 in 4 | vO1 in 5 | vO1 in 88，應答vO2而未答".
end if.

* logic check hide vO2.
do if (not any(vO1,1,2,3,4,5,88)) & any(0,vO2_96).
compute m1241=concat("vO1=",string(vO1,n2),",vO2=",string(vO2,n2)).
compute p1241="vO1~=1 & vO1~=2 & vO1~=3 & vO1~=4 & vO1~=5 & vO1~=88，不應答vO2而答".
end if.

* logic check show vO3.
do if (any(vO1,1,2,3,4,5,88)) & any(1,vO3_96).
compute m1242=concat("vO1=",string(vO1,n2),",vO3=",string(vO3,n2)).
compute p1242="vO1 in 1 | vO1 in 2 | vO1 in 3 | vO1 in 4 | vO1 in 5 | vO1 in 88，應答vO3而未答".
end if.

* logic check hide vO3.
do if (not any(vO1,1,2,3,4,5,88)) & any(0,vO3_96).
compute m1243=concat("vO1=",string(vO1,n2),",vO3=",string(vO3,n2)).
compute p1243="vO1~=1 & vO1~=2 & vO1~=3 & vO1~=4 & vO1~=5 & vO1~=88，不應答vO3而答".
end if.

* logic check show vO4.
do if ((any(vO1,1,2,3,4,5,88)) & (any(vO3,1,3,4,5,6,88))) & any(1,vO4_96).
compute m1244=concat("vO1=",string(vO1,n2),",vO3=",string(vO3,n2),",vO4=",string(vO4,n5)).
compute p1244=concat(
  "(vO1 in 1 | vO1 in 2 | vO1 in 3 | vO1 in 4 | vO1 in 5 | vO1 in 88) & (vO3 in 1 | vO3 in 3 | vO3 in 4",
  " | vO3 in 5 | vO3 in 6 | vO3 in 88)，應答vO4而未答"
).
end if.

* logic check hide vO4.
do if (((not any(vO1,1,2,3,4,5,88)) | (not any(vO3,1,3,4,5,6,96,88)))) & any(0,vO4_96).
compute m1245=concat("vO1=",string(vO1,n2),",vO3=",string(vO3,n2),",vO4=",string(vO4,n5)).
compute p1245="((vO1~=1 & vO1~=2 & vO1~=3 & vO1~=4 & vO1~=5 & vO1~=88) | (vO3~=1 & vO3~=3 & vO3~=4 & vO3~=5 & vO3~=6 & vO3~=88)) & vO3~=96，不應答vO4而答".
end if.

* logic check show vN24.
do if (any(vO1,1,2,3,4,5,88)) & any(1,vN24_96).
compute m1246=concat("vO1=",string(vO1,n2),",vN24=",string(vN24,n2)).
compute p1246="vO1 in 1 | vO1 in 2 | vO1 in 3 | vO1 in 4 | vO1 in 5 | vO1 in 88，應答vN24而未答".
end if.

* logic check hide vN24.
do if (not any(vO1,1,2,3,4,5,88)) & any(0,vN24_96).
compute m1247=concat("vO1=",string(vO1,n2),",vN24=",string(vN24,n2)).
compute p1247="vO1~=1 & vO1~=2 & vO1~=3 & vO1~=4 & vO1~=5 & vO1~=88，不應答vN24而答".
end if.

* logic check show vD2.
do if (any(vD1,1,2)) & any(1,vD2_96).
compute m1248=concat("vD1=",string(vD1,n2),",vD2=",string(vD2,n4)).
compute p1248="vD1 in 1 | vD1 in 2，應答vD2而未答".
end if.

* logic check hide vD2.
do if (not any(vD1,1,2)) & any(0,vD2_96).
compute m1249=concat("vD1=",string(vD1,n2),",vD2=",string(vD2,n4)).
compute p1249="vD1~=1 & vD1~=2，不應答vD2而答".
end if.

* logic check show vD3.
do if (any(vD1,1,2)) & any(1,vD3_96).
compute m1250=concat("vD1=",string(vD1,n2),",vD3=",string(vD3,n5)).
compute p1250="vD1 in 1 | vD1 in 2，應答vD3而未答".
end if.

* logic check hide vD3.
do if (not any(vD1,1,2)) & any(0,vD3_96).
compute m1251=concat("vD1=",string(vD1,n2),",vD3=",string(vD3,n5)).
compute p1251="vD1~=1 & vD1~=2，不應答vD3而答".
end if.

* logic check show vD4sD4,vD4sD5,vD4sD6,vD4sD7,vD4sD8.
do if (any(vD1,1,2)) & (any(1,vD4sD4_96) | any(1,vD4sD5_96) | any(1,vD4sD6_96) | any(1,vD4sD7_96) | any(1,vD4sD8_96)).
compute m1252=concat(
  "vD1=", string(vD1,n2), ",vD4sD4=", string(vD4sD4,n2), ",vD4sD5=", string(vD4sD5,n2), ",vD4sD6=", string(vD4sD6,n2), ",vD4sD7=", string(vD4sD7,n2),
  ",vD4sD8=", string(vD4sD8,n2)
).
compute p1252="vD1 in 1 | vD1 in 2，應答vD4sD4,vD4sD5,vD4sD6,vD4sD7,vD4sD8而未答".
end if.

* logic check hide vD4sD4,vD4sD5,vD4sD6,vD4sD7,vD4sD8.
do if (not any(vD1,1,2)) & (any(0,vD4sD4_96) | any(0,vD4sD5_96) | any(0,vD4sD6_96) | any(0,vD4sD7_96) | any(0,vD4sD8_96)).
compute m1253=concat(
  "vD1=", string(vD1,n2), ",vD4sD4=", string(vD4sD4,n2), ",vD4sD5=", string(vD4sD5,n2), ",vD4sD6=", string(vD4sD6,n2), ",vD4sD7=", string(vD4sD7,n2),
  ",vD4sD8=", string(vD4sD8,n2)
).
compute p1253="vD1~=1 & vD1~=2，不應答vD4sD4,vD4sD5,vD4sD6,vD4sD7,vD4sD8而答".
end if.

* logic check hide vZ2_2.
do if (any(vD1,3)) & vZ2_2~="96".
compute m1254=concat("vD1=",string(vD1,n2),",vZ2_2=",rtrim(ltrim(vZ2_2))).
compute p1254="vD1 in 3，不應答vZ2_2而答".
end if.

* logic check show vZ2_2.
do if (vD1~=3) & vZ2_2="96".
compute m1255=concat("vD1=",string(vD1,n2),",vZ2_2=",rtrim(ltrim(vZ2_2))).
compute p1255="vD1~=3，應答vZ2_2而未答".
end if.

* logic check mutex.
do if (any(vD1,3)) & (any(vE17,1)).
compute m1256=concat("vD1=",string(vD1,n2),",vE17=",string(vE17,n2)).
compute p1256="vD1 in 3與互斥條件不應同時成立".
end if.

* logic check mutex.
do if (any(vD1,3)) & (any(vE18,1)).
compute m1257=concat("vD1=",string(vD1,n2),",vE18=",string(vE18,n2)).
compute p1257="vD1 in 3與互斥條件不應同時成立".
end if.

* logic check mutex.
do if (any(vD1,3)) & (any(vE2m01,1)).
compute m1258=concat("vD1=",string(vD1,n2),",vE2m01=",string(vE2m01,n2)).
compute p1258="vD1 in 3與互斥條件不應同時成立".
end if.

* logic check mutex.
do if (any(vD1,3)) & (any(vZE2m02,1)).
compute m1259=concat("vD1=",string(vD1,n2),",vZE2m02=",string(vZE2m02,n2)).
compute p1259="vD1 in 3與互斥條件不應同時成立".
end if.

* logic check limit vD3.
do if not any(mod(trunc(vD3/10),10),0,1,2,3,4,5).
compute m1260=concat("vD3=",string(vD3,n5)).
compute p1260="vD3第3碼應為0,1,2,3,4,5".
end if.

* logic check show vE17.
do if (any(vK1m01,1) | any(vK2m13,1)) & any(1,vE17_96).
compute m1261=concat("vK1m01=",string(vK1m01,n2),",vK2m13=",string(vK2m13,n2),",vE17=",string(vE17,n2)).
compute p1261="vK1m01 in 1 | vK2m13 in 1，應答vE17而未答".
end if.

* logic check hide vE17.
do if (vK1m01~=1 & vK2m13~=1) & any(0,vE17_96).
compute m1262=concat("vK1m01=",string(vK1m01,n2),",vK2m13=",string(vK2m13,n2),",vE17=",string(vE17,n2)).
compute p1262="vK1m01~=1 & vK2m13~=1，不應答vE17而答".
end if.

* logic check show vKLI1.
do if (any(vK1m01,1) | any(vK2m13,1)) & any(1,vKLI1_96).
compute m1263=concat("vK1m01=",string(vK1m01,n2),",vK2m13=",string(vK2m13,n2),",vKLI1=",string(vKLI1,n4)).
compute p1263="vK1m01 in 1 | vK2m13 in 1，應答vKLI1而未答".
end if.

* logic check hide vKLI1.
do if (vK1m01~=1 & vK2m13~=1) & any(0,vKLI1_96).
compute m1264=concat("vK1m01=",string(vK1m01,n2),",vK2m13=",string(vK2m13,n2),",vKLI1=",string(vKLI1,n4)).
compute p1264="vK1m01~=1 & vK2m13~=1，不應答vKLI1而答".
end if.

* logic check show vKLI2.
do if (any(vK1m01,1) | any(vK2m13,1)) & any(1,vKLI2_96).
compute m1265=concat("vK1m01=",string(vK1m01,n2),",vK2m13=",string(vK2m13,n2),",vKLI2=",string(vKLI2,n5)).
compute p1265="vK1m01 in 1 | vK2m13 in 1，應答vKLI2而未答".
end if.

* logic check hide vKLI2.
do if (vK1m01~=1 & vK2m13~=1) & any(0,vKLI2_96).
compute m1266=concat("vK1m01=",string(vK1m01,n2),",vK2m13=",string(vK2m13,n2),",vKLI2=",string(vKLI2,n5)).
compute p1266="vK1m01~=1 & vK2m13~=1，不應答vKLI2而答".
end if.

* logic check show vKFB1.
do if (any(vK1m02,1) | any(vK2m01,1)) & any(1,vKFB1_96).
compute m1267=concat("vK1m02=",string(vK1m02,n2),",vK2m01=",string(vK2m01,n2),",vKFB1=",string(vKFB1,n4)).
compute p1267="vK1m02 in 1 | vK2m01 in 1，應答vKFB1而未答".
end if.

* logic check hide vKFB1.
do if (vK1m02~=1 & vK2m01~=1) & any(0,vKFB1_96).
compute m1268=concat("vK1m02=",string(vK1m02,n2),",vK2m01=",string(vK2m01,n2),",vKFB1=",string(vKFB1,n4)).
compute p1268="vK1m02~=1 & vK2m01~=1，不應答vKFB1而答".
end if.

* logic check show vKFB2.
do if (any(vK1m02,1) | any(vK2m01,1)) & any(1,vKFB2_96).
compute m1269=concat("vK1m02=",string(vK1m02,n2),",vK2m01=",string(vK2m01,n2),",vKFB2=",string(vKFB2,n5)).
compute p1269="vK1m02 in 1 | vK2m01 in 1，應答vKFB2而未答".
end if.

* logic check hide vKFB2.
do if (vK1m02~=1 & vK2m01~=1) & any(0,vKFB2_96).
compute m1270=concat("vK1m02=",string(vK1m02,n2),",vK2m01=",string(vK2m01,n2),",vKFB2=",string(vKFB2,n5)).
compute p1270="vK1m02~=1 & vK2m01~=1，不應答vKFB2而答".
end if.

* logic check show vKFB3m01,vKFB3m02,vKFB3m03,vKFB3m04,vKFB3m05,vKFB3m06,vKFB3m07,vKFB3m08,vKFB3m09,vKFB3m10,vKFB3m11,vKFB3m12,vKFB3m13,vKFB3m14,vKFB3m15.
* vKFB3m16,vKFB3m17,vKFB3m88.
do if (any(vK1m02 , 1) | any(vK2m01 , 1)) & (any(1 , vKFB3m01_96) | any(1 , vKFB3m02_96) | any(1 , vKFB3m03_96) | any(1 , vKFB3m04_96) | any(1 , vKFB3m05_96)
| any(1 , vKFB3m06_96) | any(1 , vKFB3m07_96) | any(1 , vKFB3m08_96) | any(1 , vKFB3m09_96) | any(1 , vKFB3m10_96) | any(1 , vKFB3m11_96) | any(1 , vKFB3m12_96)
| any(1 , vKFB3m13_96) | any(1 , vKFB3m14_96) | any(1 , vKFB3m15_96) | any(1 , vKFB3m16_96) | any(1 , vKFB3m17_96) | any(1 , vKFB3m88_96)).
compute m1271=concat(
  "vK1m02=", string(vK1m02,n2), ",vK2m01=", string(vK2m01,n2), ",vKFB3m01=", string(vKFB3m01,n2), ",vKFB3m02=", string(vKFB3m02,n2), ",vKFB3m03=",
  string(vKFB3m03,n2), ",vKFB3m04=", string(vKFB3m04,n2), ",vKFB3m05=", string(vKFB3m05,n2), ",vKFB3m06=", string(vKFB3m06,n2), ",vKFB3m07=",
  string(vKFB3m07,n2), ",vKFB3m08=", string(vKFB3m08,n2), ",vKFB3m09=", string(vKFB3m09,n2), ",vKFB3m10=", string(vKFB3m10,n2), ",vKFB3m11=",
  string(vKFB3m11,n2), ",vKFB3m12=", string(vKFB3m12,n2), ",vKFB3m13=", string(vKFB3m13,n2), ",vKFB3m14=", string(vKFB3m14,n2), ",vKFB3m15=",
  string(vKFB3m15,n2), ",vKFB3m16=", string(vKFB3m16,n2), ",vKFB3m17=", string(vKFB3m17,n2), ",vKFB3m88=", string(vKFB3m88,n2)
).
compute p1271=concat(
  "vK1m02 in 1 | vK2m01 in 1，應答vKFB3m01,vKFB3m02,vKFB3m03,vKFB3m04,vKFB3m05,vKFB3m06,vKFB3m07,vKFB3m08,",
  "vKFB3m09,vKFB3m10,vKFB3m11,vKFB3m12,vKFB3m13,vKFB3m14,vKFB3m15,vKFB3m16,vKFB3m17,vKFB3m88而未答"
).
end if.

* logic check hide vKFB3m01,vKFB3m02,vKFB3m03,vKFB3m04,vKFB3m05,vKFB3m06,vKFB3m07,vKFB3m08,vKFB3m09,vKFB3m10,vKFB3m11,vKFB3m12,vKFB3m13,vKFB3m14,vKFB3m15.
* vKFB3m16,vKFB3m17,vKFB3m88.
do if (vK1m02~=1 & vK2m01~=1) & (any(0 , vKFB3m01_96) | any(0 , vKFB3m02_96) | any(0 , vKFB3m03_96) | any(0 , vKFB3m04_96) | any(0 , vKFB3m05_96) | any(0
, vKFB3m06_96) | any(0 , vKFB3m07_96) | any(0 , vKFB3m08_96) | any(0 , vKFB3m09_96) | any(0 , vKFB3m10_96) | any(0 , vKFB3m11_96) | any(0 , vKFB3m12_96) | any(0
, vKFB3m13_96) | any(0 , vKFB3m14_96) | any(0 , vKFB3m15_96) | any(0 , vKFB3m16_96) | any(0 , vKFB3m17_96) | any(0 , vKFB3m88_96)).
compute m1272=concat(
  "vK1m02=", string(vK1m02,n2), ",vK2m01=", string(vK2m01,n2), ",vKFB3m01=", string(vKFB3m01,n2), ",vKFB3m02=", string(vKFB3m02,n2), ",vKFB3m03=",
  string(vKFB3m03,n2), ",vKFB3m04=", string(vKFB3m04,n2), ",vKFB3m05=", string(vKFB3m05,n2), ",vKFB3m06=", string(vKFB3m06,n2), ",vKFB3m07=",
  string(vKFB3m07,n2), ",vKFB3m08=", string(vKFB3m08,n2), ",vKFB3m09=", string(vKFB3m09,n2), ",vKFB3m10=", string(vKFB3m10,n2), ",vKFB3m11=",
  string(vKFB3m11,n2), ",vKFB3m12=", string(vKFB3m12,n2), ",vKFB3m13=", string(vKFB3m13,n2), ",vKFB3m14=", string(vKFB3m14,n2), ",vKFB3m15=",
  string(vKFB3m15,n2), ",vKFB3m16=", string(vKFB3m16,n2), ",vKFB3m17=", string(vKFB3m17,n2), ",vKFB3m88=", string(vKFB3m88,n2)
).
compute p1272=concat(
  "vK1m02~=1 & vK2m01~=1，不應答vKFB3m01,vKFB3m02,vKFB3m03,vKFB3m04,vKFB3m05,vKFB3m06,vKFB3m07,vKFB3m08,vKF",
  "B3m09,vKFB3m10,vKFB3m11,vKFB3m12,vKFB3m13,vKFB3m14,vKFB3m15,vKFB3m16,vKFB3m17,vKFB3m88而答"
).
end if.

* logic check show vKFB4m01,vKFB4m02,vKFB4m03,vKFB4m04,vKFB4m05,vKFB4m06,vKFB4m07,vKFB4m08,vKFB4m09,vKFB4m10,vKFB4m11,vKFB4m12,vKFB4m13,vKFB4m14,vKFB4m15.
* vKFB4m16,vKFB4m17,vKFB4m18,vKFB4m88.
do if (any(vK1m02 , 1) | any(vK2m01 , 1)) & (any(1 , vKFB4m01_96) | any(1 , vKFB4m02_96) | any(1 , vKFB4m03_96) | any(1 , vKFB4m04_96) | any(1 , vKFB4m05_96)
| any(1 , vKFB4m06_96) | any(1 , vKFB4m07_96) | any(1 , vKFB4m08_96) | any(1 , vKFB4m09_96) | any(1 , vKFB4m10_96) | any(1 , vKFB4m11_96) | any(1 , vKFB4m12_96)
| any(1 , vKFB4m13_96) | any(1 , vKFB4m14_96) | any(1 , vKFB4m15_96) | any(1 , vKFB4m16_96) | any(1 , vKFB4m17_96) | any(1 , vKFB4m18_96) | any(1
, vKFB4m88_96)).
compute m1273=concat(
  "vK1m02=", string(vK1m02,n2), ",vK2m01=", string(vK2m01,n2), ",vKFB4m01=", string(vKFB4m01,n2), ",vKFB4m02=", string(vKFB4m02,n2), ",vKFB4m03=",
  string(vKFB4m03,n2), ",vKFB4m04=", string(vKFB4m04,n2), ",vKFB4m05=", string(vKFB4m05,n2), ",vKFB4m06=", string(vKFB4m06,n2), ",vKFB4m07=",
  string(vKFB4m07,n2), ",vKFB4m08=", string(vKFB4m08,n2), ",vKFB4m09=", string(vKFB4m09,n2), ",vKFB4m10=", string(vKFB4m10,n2), ",vKFB4m11=",
  string(vKFB4m11,n2), ",vKFB4m12=", string(vKFB4m12,n2), ",vKFB4m13=", string(vKFB4m13,n2), ",vKFB4m14=", string(vKFB4m14,n2), ",vKFB4m15=",
  string(vKFB4m15,n2), ",vKFB4m16=", string(vKFB4m16,n2), ",vKFB4m17=", string(vKFB4m17,n2), ",vKFB4m18=", string(vKFB4m18,n2), ",vKFB4m88=",
  string(vKFB4m88,n2)
).
compute p1273=concat(
  "vK1m02 in 1 | vK2m01 in 1，應答vKFB4m01,vKFB4m02,vKFB4m03,vKFB4m04,vKFB4m05,vKFB4m06,vKFB4m07,vKFB4m08,",
  "vKFB4m09,vKFB4m10,vKFB4m11,vKFB4m12,vKFB4m13,vKFB4m14,vKFB4m15,vKFB4m16,vKFB4m17,vKFB4m18,vKFB4m88而未",
  "答"
).
end if.

* logic check hide vKFB4m01,vKFB4m02,vKFB4m03,vKFB4m04,vKFB4m05,vKFB4m06,vKFB4m07,vKFB4m08,vKFB4m09,vKFB4m10,vKFB4m11,vKFB4m12,vKFB4m13,vKFB4m14,vKFB4m15.
* vKFB4m16,vKFB4m17,vKFB4m18,vKFB4m88.
do if (vK1m02~=1 & vK2m01~=1) & (any(0 , vKFB4m01_96) | any(0 , vKFB4m02_96) | any(0 , vKFB4m03_96) | any(0 , vKFB4m04_96) | any(0 , vKFB4m05_96) | any(0
, vKFB4m06_96) | any(0 , vKFB4m07_96) | any(0 , vKFB4m08_96) | any(0 , vKFB4m09_96) | any(0 , vKFB4m10_96) | any(0 , vKFB4m11_96) | any(0 , vKFB4m12_96) | any(0
, vKFB4m13_96) | any(0 , vKFB4m14_96) | any(0 , vKFB4m15_96) | any(0 , vKFB4m16_96) | any(0 , vKFB4m17_96) | any(0 , vKFB4m18_96) | any(0 , vKFB4m88_96)).
compute m1274=concat(
  "vK1m02=", string(vK1m02,n2), ",vK2m01=", string(vK2m01,n2), ",vKFB4m01=", string(vKFB4m01,n2), ",vKFB4m02=", string(vKFB4m02,n2), ",vKFB4m03=",
  string(vKFB4m03,n2), ",vKFB4m04=", string(vKFB4m04,n2), ",vKFB4m05=", string(vKFB4m05,n2), ",vKFB4m06=", string(vKFB4m06,n2), ",vKFB4m07=",
  string(vKFB4m07,n2), ",vKFB4m08=", string(vKFB4m08,n2), ",vKFB4m09=", string(vKFB4m09,n2), ",vKFB4m10=", string(vKFB4m10,n2), ",vKFB4m11=",
  string(vKFB4m11,n2), ",vKFB4m12=", string(vKFB4m12,n2), ",vKFB4m13=", string(vKFB4m13,n2), ",vKFB4m14=", string(vKFB4m14,n2), ",vKFB4m15=",
  string(vKFB4m15,n2), ",vKFB4m16=", string(vKFB4m16,n2), ",vKFB4m17=", string(vKFB4m17,n2), ",vKFB4m18=", string(vKFB4m18,n2), ",vKFB4m88=",
  string(vKFB4m88,n2)
).
compute p1274=concat(
  "vK1m02~=1 & vK2m01~=1，不應答vKFB4m01,vKFB4m02,vKFB4m03,vKFB4m04,vKFB4m05,vKFB4m06,vKFB4m07,vKFB4m08,vKF",
  "B4m09,vKFB4m10,vKFB4m11,vKFB4m12,vKFB4m13,vKFB4m14,vKFB4m15,vKFB4m16,vKFB4m17,vKFB4m18,vKFB4m88而答"
).
end if.

* logic check show vKIG1.
do if (any(vK1m03,1) | any(vK2m02,1)) & any(1,vKIG1_96).
compute m1275=concat("vK1m03=",string(vK1m03,n2),",vK2m02=",string(vK2m02,n2),",vKIG1=",string(vKIG1,n4)).
compute p1275="vK1m03 in 1 | vK2m02 in 1，應答vKIG1而未答".
end if.

* logic check hide vKIG1.
do if (vK1m03~=1 & vK2m02~=1) & any(0,vKIG1_96).
compute m1276=concat("vK1m03=",string(vK1m03,n2),",vK2m02=",string(vK2m02,n2),",vKIG1=",string(vKIG1,n4)).
compute p1276="vK1m03~=1 & vK2m02~=1，不應答vKIG1而答".
end if.

* logic check show vKIG2.
do if (any(vK1m03,1) | any(vK2m02,1)) & any(1,vKIG2_96).
compute m1277=concat("vK1m03=",string(vK1m03,n2),",vK2m02=",string(vK2m02,n2),",vKIG2=",string(vKIG2,n5)).
compute p1277="vK1m03 in 1 | vK2m02 in 1，應答vKIG2而未答".
end if.

* logic check hide vKIG2.
do if (vK1m03~=1 & vK2m02~=1) & any(0,vKIG2_96).
compute m1278=concat("vK1m03=",string(vK1m03,n2),",vK2m02=",string(vK2m02,n2),",vKIG2=",string(vKIG2,n5)).
compute p1278="vK1m03~=1 & vK2m02~=1，不應答vKIG2而答".
end if.

* logic check show vKIG3m01,vKIG3m02,vKIG3m03,vKIG3m04,vKIG3m05,vKIG3m06,vKIG3m07,vKIG3m08,vKIG3m09,vKIG3m10,vKIG3m11,vKIG3m12,vKIG3m13,vKIG3m14,vKIG3m15.
* vKIG3m16,vKIG3m17,vKIG3m88.
do if (any(vK1m03 , 1) | any(vK2m02 , 1)) & (any(1 , vKIG3m01_96) | any(1 , vKIG3m02_96) | any(1 , vKIG3m03_96) | any(1 , vKIG3m04_96) | any(1 , vKIG3m05_96)
| any(1 , vKIG3m06_96) | any(1 , vKIG3m07_96) | any(1 , vKIG3m08_96) | any(1 , vKIG3m09_96) | any(1 , vKIG3m10_96) | any(1 , vKIG3m11_96) | any(1 , vKIG3m12_96)
| any(1 , vKIG3m13_96) | any(1 , vKIG3m14_96) | any(1 , vKIG3m15_96) | any(1 , vKIG3m16_96) | any(1 , vKIG3m17_96) | any(1 , vKIG3m88_96)).
compute m1279=concat(
  "vK1m03=", string(vK1m03,n2), ",vK2m02=", string(vK2m02,n2), ",vKIG3m01=", string(vKIG3m01,n2), ",vKIG3m02=", string(vKIG3m02,n2), ",vKIG3m03=",
  string(vKIG3m03,n2), ",vKIG3m04=", string(vKIG3m04,n2), ",vKIG3m05=", string(vKIG3m05,n2), ",vKIG3m06=", string(vKIG3m06,n2), ",vKIG3m07=",
  string(vKIG3m07,n2), ",vKIG3m08=", string(vKIG3m08,n2), ",vKIG3m09=", string(vKIG3m09,n2), ",vKIG3m10=", string(vKIG3m10,n2), ",vKIG3m11=",
  string(vKIG3m11,n2), ",vKIG3m12=", string(vKIG3m12,n2), ",vKIG3m13=", string(vKIG3m13,n2), ",vKIG3m14=", string(vKIG3m14,n2), ",vKIG3m15=",
  string(vKIG3m15,n2), ",vKIG3m16=", string(vKIG3m16,n2), ",vKIG3m17=", string(vKIG3m17,n2), ",vKIG3m88=", string(vKIG3m88,n2)
).
compute p1279=concat(
  "vK1m03 in 1 | vK2m02 in 1，應答vKIG3m01,vKIG3m02,vKIG3m03,vKIG3m04,vKIG3m05,vKIG3m06,vKIG3m07,vKIG3m08,",
  "vKIG3m09,vKIG3m10,vKIG3m11,vKIG3m12,vKIG3m13,vKIG3m14,vKIG3m15,vKIG3m16,vKIG3m17,vKIG3m88而未答"
).
end if.

* logic check hide vKIG3m01,vKIG3m02,vKIG3m03,vKIG3m04,vKIG3m05,vKIG3m06,vKIG3m07,vKIG3m08,vKIG3m09,vKIG3m10,vKIG3m11,vKIG3m12,vKIG3m13,vKIG3m14,vKIG3m15.
* vKIG3m16,vKIG3m17,vKIG3m88.
do if (vK1m03~=1 & vK2m02~=1) & (any(0 , vKIG3m01_96) | any(0 , vKIG3m02_96) | any(0 , vKIG3m03_96) | any(0 , vKIG3m04_96) | any(0 , vKIG3m05_96) | any(0
, vKIG3m06_96) | any(0 , vKIG3m07_96) | any(0 , vKIG3m08_96) | any(0 , vKIG3m09_96) | any(0 , vKIG3m10_96) | any(0 , vKIG3m11_96) | any(0 , vKIG3m12_96) | any(0
, vKIG3m13_96) | any(0 , vKIG3m14_96) | any(0 , vKIG3m15_96) | any(0 , vKIG3m16_96) | any(0 , vKIG3m17_96) | any(0 , vKIG3m88_96)).
compute m1280=concat(
  "vK1m03=", string(vK1m03,n2), ",vK2m02=", string(vK2m02,n2), ",vKIG3m01=", string(vKIG3m01,n2), ",vKIG3m02=", string(vKIG3m02,n2), ",vKIG3m03=",
  string(vKIG3m03,n2), ",vKIG3m04=", string(vKIG3m04,n2), ",vKIG3m05=", string(vKIG3m05,n2), ",vKIG3m06=", string(vKIG3m06,n2), ",vKIG3m07=",
  string(vKIG3m07,n2), ",vKIG3m08=", string(vKIG3m08,n2), ",vKIG3m09=", string(vKIG3m09,n2), ",vKIG3m10=", string(vKIG3m10,n2), ",vKIG3m11=",
  string(vKIG3m11,n2), ",vKIG3m12=", string(vKIG3m12,n2), ",vKIG3m13=", string(vKIG3m13,n2), ",vKIG3m14=", string(vKIG3m14,n2), ",vKIG3m15=",
  string(vKIG3m15,n2), ",vKIG3m16=", string(vKIG3m16,n2), ",vKIG3m17=", string(vKIG3m17,n2), ",vKIG3m88=", string(vKIG3m88,n2)
).
compute p1280=concat(
  "vK1m03~=1 & vK2m02~=1，不應答vKIG3m01,vKIG3m02,vKIG3m03,vKIG3m04,vKIG3m05,vKIG3m06,vKIG3m07,vKIG3m08,vKI",
  "G3m09,vKIG3m10,vKIG3m11,vKIG3m12,vKIG3m13,vKIG3m14,vKIG3m15,vKIG3m16,vKIG3m17,vKIG3m88而答"
).
end if.

* logic check show vKIG4m01,vKIG4m02,vKIG4m03,vKIG4m04,vKIG4m05,vKIG4m06,vKIG4m07,vKIG4m08,vKIG4m09,vKIG4m10,vKIG4m11,vKIG4m12,vKIG4m13,vKIG4m14,vKIG4m88.
do if (any(vK1m03 , 1) | any(vK2m02 , 1)) & (any(1 , vKIG4m01_96) | any(1 , vKIG4m02_96) | any(1 , vKIG4m03_96) | any(1 , vKIG4m04_96) | any(1 , vKIG4m05_96)
| any(1 , vKIG4m06_96) | any(1 , vKIG4m07_96) | any(1 , vKIG4m08_96) | any(1 , vKIG4m09_96) | any(1 , vKIG4m10_96) | any(1 , vKIG4m11_96) | any(1 , vKIG4m12_96)
| any(1 , vKIG4m13_96) | any(1 , vKIG4m14_96) | any(1 , vKIG4m88_96)).
compute m1281=concat(
  "vK1m03=", string(vK1m03,n2), ",vK2m02=", string(vK2m02,n2), ",vKIG4m01=", string(vKIG4m01,n2), ",vKIG4m02=", string(vKIG4m02,n2), ",vKIG4m03=",
  string(vKIG4m03,n2), ",vKIG4m04=", string(vKIG4m04,n2), ",vKIG4m05=", string(vKIG4m05,n2), ",vKIG4m06=", string(vKIG4m06,n2), ",vKIG4m07=",
  string(vKIG4m07,n2), ",vKIG4m08=", string(vKIG4m08,n2), ",vKIG4m09=", string(vKIG4m09,n2), ",vKIG4m10=", string(vKIG4m10,n2), ",vKIG4m11=",
  string(vKIG4m11,n2), ",vKIG4m12=", string(vKIG4m12,n2), ",vKIG4m13=", string(vKIG4m13,n2), ",vKIG4m14=", string(vKIG4m14,n2), ",vKIG4m88=",
  string(vKIG4m88,n2)
).
compute p1281=concat(
  "vK1m03 in 1 | vK2m02 in 1，應答vKIG4m01,vKIG4m02,vKIG4m03,vKIG4m04,vKIG4m05,vKIG4m06,vKIG4m07,vKIG4m08,",
  "vKIG4m09,vKIG4m10,vKIG4m11,vKIG4m12,vKIG4m13,vKIG4m14,vKIG4m88而未答"
).
end if.

* logic check hide vKIG4m01,vKIG4m02,vKIG4m03,vKIG4m04,vKIG4m05,vKIG4m06,vKIG4m07,vKIG4m08,vKIG4m09,vKIG4m10,vKIG4m11,vKIG4m12,vKIG4m13,vKIG4m14,vKIG4m88.
do if (vK1m03~=1 & vK2m02~=1) & (any(0 , vKIG4m01_96) | any(0 , vKIG4m02_96) | any(0 , vKIG4m03_96) | any(0 , vKIG4m04_96) | any(0 , vKIG4m05_96) | any(0
, vKIG4m06_96) | any(0 , vKIG4m07_96) | any(0 , vKIG4m08_96) | any(0 , vKIG4m09_96) | any(0 , vKIG4m10_96) | any(0 , vKIG4m11_96) | any(0 , vKIG4m12_96) | any(0
, vKIG4m13_96) | any(0 , vKIG4m14_96) | any(0 , vKIG4m88_96)).
compute m1282=concat(
  "vK1m03=", string(vK1m03,n2), ",vK2m02=", string(vK2m02,n2), ",vKIG4m01=", string(vKIG4m01,n2), ",vKIG4m02=", string(vKIG4m02,n2), ",vKIG4m03=",
  string(vKIG4m03,n2), ",vKIG4m04=", string(vKIG4m04,n2), ",vKIG4m05=", string(vKIG4m05,n2), ",vKIG4m06=", string(vKIG4m06,n2), ",vKIG4m07=",
  string(vKIG4m07,n2), ",vKIG4m08=", string(vKIG4m08,n2), ",vKIG4m09=", string(vKIG4m09,n2), ",vKIG4m10=", string(vKIG4m10,n2), ",vKIG4m11=",
  string(vKIG4m11,n2), ",vKIG4m12=", string(vKIG4m12,n2), ",vKIG4m13=", string(vKIG4m13,n2), ",vKIG4m14=", string(vKIG4m14,n2), ",vKIG4m88=",
  string(vKIG4m88,n2)
).
compute p1282=concat(
  "vK1m03~=1 & vK2m02~=1，不應答vKIG4m01,vKIG4m02,vKIG4m03,vKIG4m04,vKIG4m05,vKIG4m06,vKIG4m07,vKIG4m08,vKI",
  "G4m09,vKIG4m10,vKIG4m11,vKIG4m12,vKIG4m13,vKIG4m14,vKIG4m88而答"
).
end if.

* logic check show vKTT1.
do if (any(vK1m11,1) | any(vK2m07,1)) & any(1,vKTT1_96).
compute m1283=concat("vK1m11=",string(vK1m11,n2),",vK2m07=",string(vK2m07,n2),",vKTT1=",string(vKTT1,n4)).
compute p1283="vK1m11 in 1 | vK2m07 in 1，應答vKTT1而未答".
end if.

* logic check hide vKTT1.
do if (vK1m11~=1 & vK2m07~=1) & any(0,vKTT1_96).
compute m1284=concat("vK1m11=",string(vK1m11,n2),",vK2m07=",string(vK2m07,n2),",vKTT1=",string(vKTT1,n4)).
compute p1284="vK1m11~=1 & vK2m07~=1，不應答vKTT1而答".
end if.

* logic check show vKTT2.
do if (any(vK1m11,1) | any(vK2m07,1)) & any(1,vKTT2_96).
compute m1285=concat("vK1m11=",string(vK1m11,n2),",vK2m07=",string(vK2m07,n2),",vKTT2=",string(vKTT2,n5)).
compute p1285="vK1m11 in 1 | vK2m07 in 1，應答vKTT2而未答".
end if.

* logic check hide vKTT2.
do if (vK1m11~=1 & vK2m07~=1) & any(0,vKTT2_96).
compute m1286=concat("vK1m11=",string(vK1m11,n2),",vK2m07=",string(vK2m07,n2),",vKTT2=",string(vKTT2,n5)).
compute p1286="vK1m11~=1 & vK2m07~=1，不應答vKTT2而答".
end if.

* logic check show vKTT3m01,vKTT3m02,vKTT3m03,vKTT3m04,vKTT3m05,vKTT3m06,vKTT3m07,vKTT3m08,vKTT3m09,vKTT3m10,vKTT3m11,vKTT3m12,vKTT3m13,vKTT3m14,vKTT3m15.
* vKTT3m16,vKTT3m88.
do if (any(vK1m11 , 1) | any(vK2m07 , 1)) & (any(1 , vKTT3m01_96) | any(1 , vKTT3m02_96) | any(1 , vKTT3m03_96) | any(1 , vKTT3m04_96) | any(1 , vKTT3m05_96)
| any(1 , vKTT3m06_96) | any(1 , vKTT3m07_96) | any(1 , vKTT3m08_96) | any(1 , vKTT3m09_96) | any(1 , vKTT3m10_96) | any(1 , vKTT3m11_96) | any(1 , vKTT3m12_96)
| any(1 , vKTT3m13_96) | any(1 , vKTT3m14_96) | any(1 , vKTT3m15_96) | any(1 , vKTT3m16_96) | any(1 , vKTT3m88_96)).
compute m1287=concat(
  "vK1m11=", string(vK1m11,n2), ",vK2m07=", string(vK2m07,n2), ",vKTT3m01=", string(vKTT3m01,n2), ",vKTT3m02=", string(vKTT3m02,n2), ",vKTT3m03=",
  string(vKTT3m03,n2), ",vKTT3m04=", string(vKTT3m04,n2), ",vKTT3m05=", string(vKTT3m05,n2), ",vKTT3m06=", string(vKTT3m06,n2), ",vKTT3m07=",
  string(vKTT3m07,n2), ",vKTT3m08=", string(vKTT3m08,n2), ",vKTT3m09=", string(vKTT3m09,n2), ",vKTT3m10=", string(vKTT3m10,n2), ",vKTT3m11=",
  string(vKTT3m11,n2), ",vKTT3m12=", string(vKTT3m12,n2), ",vKTT3m13=", string(vKTT3m13,n2), ",vKTT3m14=", string(vKTT3m14,n2), ",vKTT3m15=",
  string(vKTT3m15,n2), ",vKTT3m16=", string(vKTT3m16,n2), ",vKTT3m88=", string(vKTT3m88,n2)
).
compute p1287=concat(
  "vK1m11 in 1 | vK2m07 in 1，應答vKTT3m01,vKTT3m02,vKTT3m03,vKTT3m04,vKTT3m05,vKTT3m06,vKTT3m07,vKTT3m08,",
  "vKTT3m09,vKTT3m10,vKTT3m11,vKTT3m12,vKTT3m13,vKTT3m14,vKTT3m15,vKTT3m16,vKTT3m88而未答"
).
end if.

* logic check hide vKTT3m01,vKTT3m02,vKTT3m03,vKTT3m04,vKTT3m05,vKTT3m06,vKTT3m07,vKTT3m08,vKTT3m09,vKTT3m10,vKTT3m11,vKTT3m12,vKTT3m13,vKTT3m14,vKTT3m15.
* vKTT3m16,vKTT3m88.
do if (vK1m11~=1 & vK2m07~=1) & (any(0 , vKTT3m01_96) | any(0 , vKTT3m02_96) | any(0 , vKTT3m03_96) | any(0 , vKTT3m04_96) | any(0 , vKTT3m05_96) | any(0
, vKTT3m06_96) | any(0 , vKTT3m07_96) | any(0 , vKTT3m08_96) | any(0 , vKTT3m09_96) | any(0 , vKTT3m10_96) | any(0 , vKTT3m11_96) | any(0 , vKTT3m12_96) | any(0
, vKTT3m13_96) | any(0 , vKTT3m14_96) | any(0 , vKTT3m15_96) | any(0 , vKTT3m16_96) | any(0 , vKTT3m88_96)).
compute m1288=concat(
  "vK1m11=", string(vK1m11,n2), ",vK2m07=", string(vK2m07,n2), ",vKTT3m01=", string(vKTT3m01,n2), ",vKTT3m02=", string(vKTT3m02,n2), ",vKTT3m03=",
  string(vKTT3m03,n2), ",vKTT3m04=", string(vKTT3m04,n2), ",vKTT3m05=", string(vKTT3m05,n2), ",vKTT3m06=", string(vKTT3m06,n2), ",vKTT3m07=",
  string(vKTT3m07,n2), ",vKTT3m08=", string(vKTT3m08,n2), ",vKTT3m09=", string(vKTT3m09,n2), ",vKTT3m10=", string(vKTT3m10,n2), ",vKTT3m11=",
  string(vKTT3m11,n2), ",vKTT3m12=", string(vKTT3m12,n2), ",vKTT3m13=", string(vKTT3m13,n2), ",vKTT3m14=", string(vKTT3m14,n2), ",vKTT3m15=",
  string(vKTT3m15,n2), ",vKTT3m16=", string(vKTT3m16,n2), ",vKTT3m88=", string(vKTT3m88,n2)
).
compute p1288=concat(
  "vK1m11~=1 & vK2m07~=1，不應答vKTT3m01,vKTT3m02,vKTT3m03,vKTT3m04,vKTT3m05,vKTT3m06,vKTT3m07,vKTT3m08,vKT",
  "T3m09,vKTT3m10,vKTT3m11,vKTT3m12,vKTT3m13,vKTT3m14,vKTT3m15,vKTT3m16,vKTT3m88而答"
).
end if.

* logic check show vKTT4m01,vKTT4m02,vKTT4m03,vKTT4m04,vKTT4m05,vKTT4m06,vKTT4m07,vKTT4m08,vKTT4m09,vKTT4m10,vKTT4m11,vKTT4m12,vKTT4m13,vKTT4m14,vKTT4m88.
do if (any(vK1m11 , 1) | any(vK2m07 , 1)) & (any(1 , vKTT4m01_96) | any(1 , vKTT4m02_96) | any(1 , vKTT4m03_96) | any(1 , vKTT4m04_96) | any(1 , vKTT4m05_96)
| any(1 , vKTT4m06_96) | any(1 , vKTT4m07_96) | any(1 , vKTT4m08_96) | any(1 , vKTT4m09_96) | any(1 , vKTT4m10_96) | any(1 , vKTT4m11_96) | any(1 , vKTT4m12_96)
| any(1 , vKTT4m13_96) | any(1 , vKTT4m14_96) | any(1 , vKTT4m88_96)).
compute m1289=concat(
  "vK1m11=", string(vK1m11,n2), ",vK2m07=", string(vK2m07,n2), ",vKTT4m01=", string(vKTT4m01,n2), ",vKTT4m02=", string(vKTT4m02,n2), ",vKTT4m03=",
  string(vKTT4m03,n2), ",vKTT4m04=", string(vKTT4m04,n2), ",vKTT4m05=", string(vKTT4m05,n2), ",vKTT4m06=", string(vKTT4m06,n2), ",vKTT4m07=",
  string(vKTT4m07,n2), ",vKTT4m08=", string(vKTT4m08,n2), ",vKTT4m09=", string(vKTT4m09,n2), ",vKTT4m10=", string(vKTT4m10,n2), ",vKTT4m11=",
  string(vKTT4m11,n2), ",vKTT4m12=", string(vKTT4m12,n2), ",vKTT4m13=", string(vKTT4m13,n2), ",vKTT4m14=", string(vKTT4m14,n2), ",vKTT4m88=",
  string(vKTT4m88,n2)
).
compute p1289=concat(
  "vK1m11 in 1 | vK2m07 in 1，應答vKTT4m01,vKTT4m02,vKTT4m03,vKTT4m04,vKTT4m05,vKTT4m06,vKTT4m07,vKTT4m08,",
  "vKTT4m09,vKTT4m10,vKTT4m11,vKTT4m12,vKTT4m13,vKTT4m14,vKTT4m88而未答"
).
end if.

* logic check hide vKTT4m01,vKTT4m02,vKTT4m03,vKTT4m04,vKTT4m05,vKTT4m06,vKTT4m07,vKTT4m08,vKTT4m09,vKTT4m10,vKTT4m11,vKTT4m12,vKTT4m13,vKTT4m14,vKTT4m88.
do if (vK1m11~=1 & vK2m07~=1) & (any(0 , vKTT4m01_96) | any(0 , vKTT4m02_96) | any(0 , vKTT4m03_96) | any(0 , vKTT4m04_96) | any(0 , vKTT4m05_96) | any(0
, vKTT4m06_96) | any(0 , vKTT4m07_96) | any(0 , vKTT4m08_96) | any(0 , vKTT4m09_96) | any(0 , vKTT4m10_96) | any(0 , vKTT4m11_96) | any(0 , vKTT4m12_96) | any(0
, vKTT4m13_96) | any(0 , vKTT4m14_96) | any(0 , vKTT4m88_96)).
compute m1290=concat(
  "vK1m11=", string(vK1m11,n2), ",vK2m07=", string(vK2m07,n2), ",vKTT4m01=", string(vKTT4m01,n2), ",vKTT4m02=", string(vKTT4m02,n2), ",vKTT4m03=",
  string(vKTT4m03,n2), ",vKTT4m04=", string(vKTT4m04,n2), ",vKTT4m05=", string(vKTT4m05,n2), ",vKTT4m06=", string(vKTT4m06,n2), ",vKTT4m07=",
  string(vKTT4m07,n2), ",vKTT4m08=", string(vKTT4m08,n2), ",vKTT4m09=", string(vKTT4m09,n2), ",vKTT4m10=", string(vKTT4m10,n2), ",vKTT4m11=",
  string(vKTT4m11,n2), ",vKTT4m12=", string(vKTT4m12,n2), ",vKTT4m13=", string(vKTT4m13,n2), ",vKTT4m14=", string(vKTT4m14,n2), ",vKTT4m88=",
  string(vKTT4m88,n2)
).
compute p1290=concat(
  "vK1m11~=1 & vK2m07~=1，不應答vKTT4m01,vKTT4m02,vKTT4m03,vKTT4m04,vKTT4m05,vKTT4m06,vKTT4m07,vKTT4m08,vKT",
  "T4m09,vKTT4m10,vKTT4m11,vKTT4m12,vKTT4m13,vKTT4m14,vKTT4m88而答"
).
end if.

* logic check show vKTT5m01,vKTT5m02,vKTT5m03,vKTT5m04,vKTT5m05,vKTT5m06,vKTT5m07,vKTT5m08,vKTT5m09,vKTT5m10,vKTT5m11,vKTT5m12,vKTT5m88.
do if (any(vK1m11 , 1) | any(vK2m07 , 1)) & (any(1 , vKTT5m01_96) | any(1 , vKTT5m02_96) | any(1 , vKTT5m03_96) | any(1 , vKTT5m04_96) | any(1 , vKTT5m05_96)
| any(1 , vKTT5m06_96) | any(1 , vKTT5m07_96) | any(1 , vKTT5m08_96) | any(1 , vKTT5m09_96) | any(1 , vKTT5m10_96) | any(1 , vKTT5m11_96) | any(1 , vKTT5m12_96)
| any(1 , vKTT5m88_96)).
compute m1291=concat(
  "vK1m11=", string(vK1m11,n2), ",vK2m07=", string(vK2m07,n2), ",vKTT5m01=", string(vKTT5m01,n2), ",vKTT5m02=", string(vKTT5m02,n2), ",vKTT5m03=",
  string(vKTT5m03,n2), ",vKTT5m04=", string(vKTT5m04,n2), ",vKTT5m05=", string(vKTT5m05,n2), ",vKTT5m06=", string(vKTT5m06,n2), ",vKTT5m07=",
  string(vKTT5m07,n2), ",vKTT5m08=", string(vKTT5m08,n2), ",vKTT5m09=", string(vKTT5m09,n2), ",vKTT5m10=", string(vKTT5m10,n2), ",vKTT5m11=",
  string(vKTT5m11,n2), ",vKTT5m12=", string(vKTT5m12,n2), ",vKTT5m88=", string(vKTT5m88,n2)
).
compute p1291=concat(
  "vK1m11 in 1 | vK2m07 in 1，應答vKTT5m01,vKTT5m02,vKTT5m03,vKTT5m04,vKTT5m05,vKTT5m06,vKTT5m07,vKTT5m08,",
  "vKTT5m09,vKTT5m10,vKTT5m11,vKTT5m12,vKTT5m88而未答"
).
end if.

* logic check hide vKTT5m01,vKTT5m02,vKTT5m03,vKTT5m04,vKTT5m05,vKTT5m06,vKTT5m07,vKTT5m08,vKTT5m09,vKTT5m10,vKTT5m11,vKTT5m12,vKTT5m88.
do if (vK1m11~=1 & vK2m07~=1) & (any(0 , vKTT5m01_96) | any(0 , vKTT5m02_96) | any(0 , vKTT5m03_96) | any(0 , vKTT5m04_96) | any(0 , vKTT5m05_96) | any(0
, vKTT5m06_96) | any(0 , vKTT5m07_96) | any(0 , vKTT5m08_96) | any(0 , vKTT5m09_96) | any(0 , vKTT5m10_96) | any(0 , vKTT5m11_96) | any(0 , vKTT5m12_96) | any(0
, vKTT5m88_96)).
compute m1292=concat(
  "vK1m11=", string(vK1m11,n2), ",vK2m07=", string(vK2m07,n2), ",vKTT5m01=", string(vKTT5m01,n2), ",vKTT5m02=", string(vKTT5m02,n2), ",vKTT5m03=",
  string(vKTT5m03,n2), ",vKTT5m04=", string(vKTT5m04,n2), ",vKTT5m05=", string(vKTT5m05,n2), ",vKTT5m06=", string(vKTT5m06,n2), ",vKTT5m07=",
  string(vKTT5m07,n2), ",vKTT5m08=", string(vKTT5m08,n2), ",vKTT5m09=", string(vKTT5m09,n2), ",vKTT5m10=", string(vKTT5m10,n2), ",vKTT5m11=",
  string(vKTT5m11,n2), ",vKTT5m12=", string(vKTT5m12,n2), ",vKTT5m88=", string(vKTT5m88,n2)
).
compute p1292="vK1m11~=1 & vK2m07~=1，不應答vKTT5m01,vKTT5m02,vKTT5m03,vKTT5m04,vKTT5m05,vKTT5m06,vKTT5m07,vKTT5m08,vKTT5m09,vKTT5m10,vKTT5m11,vKTT5m12,vKTT5m88而答".
end if.

* logic check show vKTT5m01,vKTT5m02,vKTT5m03,vKTT5m04,vKTT5m05,vKTT5m06,vKTT5m07,vKTT5m08,vKTT5m09,vKTT5m10,vKTT5m11,vKTT5m12,vKTT5m88.
do if (any(vK1m13 , 1) | any(vK2m11 , 1)) & (any(1 , vKTT5m01_96) | any(1 , vKTT5m02_96) | any(1 , vKTT5m03_96) | any(1 , vKTT5m04_96) | any(1 , vKTT5m05_96)
| any(1 , vKTT5m06_96) | any(1 , vKTT5m07_96) | any(1 , vKTT5m08_96) | any(1 , vKTT5m09_96) | any(1 , vKTT5m10_96) | any(1 , vKTT5m11_96) | any(1 , vKTT5m12_96)
| any(1 , vKTT5m88_96)).
compute m1293=concat(
  "vK1m13=", string(vK1m13,n2), ",vK2m11=", string(vK2m11,n2), ",vKTT5m01=", string(vKTT5m01,n2), ",vKTT5m02=", string(vKTT5m02,n2), ",vKTT5m03=",
  string(vKTT5m03,n2), ",vKTT5m04=", string(vKTT5m04,n2), ",vKTT5m05=", string(vKTT5m05,n2), ",vKTT5m06=", string(vKTT5m06,n2), ",vKTT5m07=",
  string(vKTT5m07,n2), ",vKTT5m08=", string(vKTT5m08,n2), ",vKTT5m09=", string(vKTT5m09,n2), ",vKTT5m10=", string(vKTT5m10,n2), ",vKTT5m11=",
  string(vKTT5m11,n2), ",vKTT5m12=", string(vKTT5m12,n2), ",vKTT5m88=", string(vKTT5m88,n2)
).
compute p1293=concat(
  "vK1m13 in 1 | vK2m11 in 1，應答vKTT5m01,vKTT5m02,vKTT5m03,vKTT5m04,vKTT5m05,vKTT5m06,vKTT5m07,vKTT5m08,",
  "vKTT5m09,vKTT5m10,vKTT5m11,vKTT5m12,vKTT5m88而未答"
).
end if.

* logic check hide vKTT5m01,vKTT5m02,vKTT5m03,vKTT5m04,vKTT5m05,vKTT5m06,vKTT5m07,vKTT5m08,vKTT5m09,vKTT5m10,vKTT5m11,vKTT5m12,vKTT5m88.
do if (vK1m13~=1 & vK2m11~=1) & (any(0 , vKTT5m01_96) | any(0 , vKTT5m02_96) | any(0 , vKTT5m03_96) | any(0 , vKTT5m04_96) | any(0 , vKTT5m05_96) | any(0
, vKTT5m06_96) | any(0 , vKTT5m07_96) | any(0 , vKTT5m08_96) | any(0 , vKTT5m09_96) | any(0 , vKTT5m10_96) | any(0 , vKTT5m11_96) | any(0 , vKTT5m12_96) | any(0
, vKTT5m88_96)).
compute m1294=concat(
  "vK1m13=", string(vK1m13,n2), ",vK2m11=", string(vK2m11,n2), ",vKTT5m01=", string(vKTT5m01,n2), ",vKTT5m02=", string(vKTT5m02,n2), ",vKTT5m03=",
  string(vKTT5m03,n2), ",vKTT5m04=", string(vKTT5m04,n2), ",vKTT5m05=", string(vKTT5m05,n2), ",vKTT5m06=", string(vKTT5m06,n2), ",vKTT5m07=",
  string(vKTT5m07,n2), ",vKTT5m08=", string(vKTT5m08,n2), ",vKTT5m09=", string(vKTT5m09,n2), ",vKTT5m10=", string(vKTT5m10,n2), ",vKTT5m11=",
  string(vKTT5m11,n2), ",vKTT5m12=", string(vKTT5m12,n2), ",vKTT5m88=", string(vKTT5m88,n2)
).
compute p1294="vK1m13~=1 & vK2m11~=1，不應答vKTT5m01,vKTT5m02,vKTT5m03,vKTT5m04,vKTT5m05,vKTT5m06,vKTT5m07,vKTT5m08,vKTT5m09,vKTT5m10,vKTT5m11,vKTT5m12,vKTT5m88而答".
end if.

* logic check hide vQ8.
do if (any(vQ5,2,97,98) | any(vK1m90,1)) & any(0,vQ8_96).
compute m1295=concat("vQ5=",string(vQ5,n2),",vK1m90=",string(vK1m90,n2),",vQ8=",string(vQ8,n2)).
compute p1295="vQ5 in 2 | vQ5 in 97 | vQ5 in 98 | vK1m90 in 1，不應答vQ8而答".
end if.

* logic check show vQ8.
do if (not any(vQ5,2,97,98,96) & vK1m90~=1) & any(1,vQ8_96).
compute m1296=concat("vQ5=",string(vQ5,n2),",vK1m90=",string(vK1m90,n2),",vQ8=",string(vQ8,n2)).
compute p1296="vQ5~=2 & vQ5~=97 & vQ5~=98 & vK1m90~=1 & vQ5~=96，應答vQ8而未答".
end if.

* logic check hide vQ13.
do if (any(vQ10,2,97,98) | any(vK1m90,1) | any(vQ8,1)) & any(0,vQ13_96).
compute m1297=concat("vQ10=",string(vQ10,n2),",vK1m90=",string(vK1m90,n2),",vQ8=",string(vQ8,n2),",vQ13=",string(vQ13,n2)).
compute p1297="vQ10 in 2 | vQ10 in 97 | vQ10 in 98 | vK1m90 in 1 | vQ8 in 1，不應答vQ13而答".
end if.

* logic check show vQ13.
do if (not any(vQ10,2,97,98,96) & vK1m90~=1 & not any(vQ8,1,96)) & any(1,vQ13_96).
compute m1298=concat("vQ10=",string(vQ10,n2),",vK1m90=",string(vK1m90,n2),",vQ8=",string(vQ8,n2),",vQ13=",string(vQ13,n2)).
compute p1298="vQ10~=2 & vQ10~=97 & vQ10~=98 & vK1m90~=1 & vQ8~=1 & vQ10~=96 & vQ8~=96，應答vQ13而未答".
end if.

* logic check hide vQ18.
do if (any(vQ15,2,97,98) | any(vK1m90,1)) & any(0,vQ18_96).
compute m1299=concat("vQ15=",string(vQ15,n2),",vK1m90=",string(vK1m90,n2),",vQ18=",string(vQ18,n2)).
compute p1299="vQ15 in 2 | vQ15 in 97 | vQ15 in 98 | vK1m90 in 1，不應答vQ18而答".
end if.

* logic check show vQ18.
do if (not any(vQ15,2,97,98,96) & vK1m90~=1) & any(1,vQ18_96).
compute m1300=concat("vQ15=",string(vQ15,n2),",vK1m90=",string(vK1m90,n2),",vQ18=",string(vQ18,n2)).
compute p1300="vQ15~=2 & vQ15~=97 & vQ15~=98 & vK1m90~=1 & vQ15~=96，應答vQ18而未答".
end if.

* logic check mutex.
do if (any(vK1m90,1)) & (any(vG7m02,1)).
compute m1301=concat("vK1m90=",string(vK1m90,n2),",vG7m02=",string(vG7m02,n2)).
compute p1301="vK1m90 in 1與互斥條件不應同時成立".
end if.

* logic check hide vQ6.
do if (any(vQ5,2,97,98) | any(vK2m90,1)) & any(0,vQ6_96).
compute m1302=concat("vQ5=",string(vQ5,n2),",vK2m90=",string(vK2m90,n2),",vQ6=",string(vQ6,n2)).
compute p1302="vQ5 in 2 | vQ5 in 97 | vQ5 in 98 | vK2m90 in 1，不應答vQ6而答".
end if.

* logic check show vQ6.
do if (not any(vQ5,2,97,98,96) & vK2m90~=1) & any(1,vQ6_96).
compute m1303=concat("vQ5=",string(vQ5,n2),",vK2m90=",string(vK2m90,n2),",vQ6=",string(vQ6,n2)).
compute p1303="vQ5~=2 & vQ5~=97 & vQ5~=98 & vK2m90~=1 & vQ5~=96，應答vQ6而未答".
end if.

* logic check hide vQ11.
do if (any(vQ10,2,97,98) | any(vK2m90,1) | any(vQ6,1)) & any(0,vQ11_96).
compute m1304=concat("vQ10=",string(vQ10,n2),",vK2m90=",string(vK2m90,n2),",vQ6=",string(vQ6,n2),",vQ11=",string(vQ11,n2)).
compute p1304="vQ10 in 2 | vQ10 in 97 | vQ10 in 98 | vK2m90 in 1 | vQ6 in 1，不應答vQ11而答".
end if.

* logic check show vQ11.
do if (not any(vQ10,2,97,98,96) & vK2m90~=1 & not any(vQ6,1,96)) & any(1,vQ11_96).
compute m1305=concat("vQ10=",string(vQ10,n2),",vK2m90=",string(vK2m90,n2),",vQ6=",string(vQ6,n2),",vQ11=",string(vQ11,n2)).
compute p1305="vQ10~=2 & vQ10~=97 & vQ10~=98 & vK2m90~=1 & vQ6~=1 & vQ10~=96 & vQ6~=96，應答vQ11而未答".
end if.

* logic check hide vQ16.
do if (any(vQ15,2,97,98) | any(vK2m90,1)) & any(0,vQ16_96).
compute m1306=concat("vQ15=",string(vQ15,n2),",vK2m90=",string(vK2m90,n2),",vQ16=",string(vQ16,n2)).
compute p1306="vQ15 in 2 | vQ15 in 97 | vQ15 in 98 | vK2m90 in 1，不應答vQ16而答".
end if.

* logic check show vQ16.
do if (not any(vQ15,2,97,98,96) & vK2m90~=1) & any(1,vQ16_96).
compute m1307=concat("vQ15=",string(vQ15,n2),",vK2m90=",string(vK2m90,n2),",vQ16=",string(vQ16,n2)).
compute p1307="vQ15~=2 & vQ15~=97 & vQ15~=98 & vK2m90~=1 & vQ15~=96，應答vQ16而未答".
end if.

* logic check hide vQ27m01,vQ27m02,vQ27m03,vQ27m04,vQ27m05,vQ27m06,vQ27m07,vQ27m88.
do if (vK2m90=1 | any(vQ5 , 2 , 97 , 98)) & (any(0 , vQ27m01_96) | any(0 , vQ27m02_96) | any(0 , vQ27m03_96) | any(0 , vQ27m04_96) | any(0 , vQ27m05_96) | any(0
, vQ27m06_96) | any(0 , vQ27m07_96) | any(0 , vQ27m88_96)).
compute m1308=concat(
  "vK2m90=", string(vK2m90,n2), ",vQ5=", string(vQ5,n2), ",vQ27m01=", string(vQ27m01,n2), ",vQ27m02=", string(vQ27m02,n2), ",vQ27m03=", string(vQ27m03,n2),
  ",vQ27m04=", string(vQ27m04,n2), ",vQ27m05=", string(vQ27m05,n2), ",vQ27m06=", string(vQ27m06,n2), ",vQ27m07=", string(vQ27m07,n2), ",vQ27m88=",
  string(vQ27m88,n2)
).
compute p1308="vK2m90=1 | any(vQ5,2,97,98)，不應答vQ27m01,vQ27m02,vQ27m03,vQ27m04,vQ27m05,vQ27m06,vQ27m07,vQ27m88而答".
end if.

* logic check show vQ27m01,vQ27m02,vQ27m03,vQ27m04,vQ27m05,vQ27m06,vQ27m07,vQ27m88.
do if (vK2m90~=1 & not(any(vQ5 , 2 , 97 , 98)) & vQ5~=96) & (any(1 , vQ27m01_96) | any(1 , vQ27m02_96) | any(1 , vQ27m03_96) | any(1 , vQ27m04_96) | any(1
, vQ27m05_96) | any(1 , vQ27m06_96) | any(1 , vQ27m07_96) | any(1 , vQ27m88_96)).
compute m1309=concat(
  "vK2m90=", string(vK2m90,n2), ",vQ5=", string(vQ5,n2), ",vQ27m01=", string(vQ27m01,n2), ",vQ27m02=", string(vQ27m02,n2), ",vQ27m03=", string(vQ27m03,n2),
  ",vQ27m04=", string(vQ27m04,n2), ",vQ27m05=", string(vQ27m05,n2), ",vQ27m06=", string(vQ27m06,n2), ",vQ27m07=", string(vQ27m07,n2), ",vQ27m88=",
  string(vQ27m88,n2)
).
compute p1309="vK2m90~=1 & not(any(vQ5,2,97,98)) & vQ5~=96，應答vQ27m01,vQ27m02,vQ27m03,vQ27m04,vQ27m05,vQ27m06,vQ27m07,vQ27m88而未答".
end if.

* logic check mutex.
do if (any(vK2m90,1)) & (any(vG7m01,1)).
compute m1310=concat("vK2m90=",string(vK2m90,n2),",vG7m01=",string(vG7m01,n2)).
compute p1310="vK2m90 in 1與互斥條件不應同時成立".
end if.

* logic check show vE4.
do if (any(vE2m01,1) | any(vE17,1) | any(vE18,1)) & any(1,vE4_96).
compute m1311=concat("vE2m01=",string(vE2m01,n2),",vE17=",string(vE17,n2),",vE18=",string(vE18,n2),",vE4=",string(vE4,n4)).
compute p1311="vE2m01 in 1 | vE17 in 1 | vE18 in 1，應答vE4而未答".
end if.

* logic check hide vE4.
do if (not any(vE2m01,1,96) & not any(vE17,1,96) & not any(vE18,1,96)) & any(0,vE4_96).
compute m1312=concat("vE2m01=",string(vE2m01,n2),",vE17=",string(vE17,n2),",vE18=",string(vE18,n2),",vE4=",string(vE4,n4)).
compute p1312="vE2m01~=1 & vE17~=1 & vE18~=1 & vE2m01~=96 & vE17~=96 & vE18~=96，不應答vE4而答".
end if.

* logic check show vE6.
do if (any(vE2m01,1) | any(vE17,1) | any(vE18,1)) & any(1,vE6_96).
compute m1313=concat("vE2m01=",string(vE2m01,n2),",vE17=",string(vE17,n2),",vE18=",string(vE18,n2),",vE6=",string(vE6,n5)).
compute p1313="vE2m01 in 1 | vE17 in 1 | vE18 in 1，應答vE6而未答".
end if.

* logic check hide vE6.
do if (not any(vE2m01,1,96) & not any(vE17,1,96) & not any(vE18,1,96)) & any(0,vE6_96).
compute m1314=concat("vE2m01=",string(vE2m01,n2),",vE17=",string(vE17,n2),",vE18=",string(vE18,n2),",vE6=",string(vE6,n5)).
compute p1314="vE2m01~=1 & vE17~=1 & vE18~=1 & vE2m01~=96 & vE17~=96 & vE18~=96，不應答vE6而答".
end if.

* logic check show vE7.
do if (any(vE2m02,1) | any(vE17,2) | any(vE18,2)) & any(1,vE7_96).
compute m1315=concat("vE2m02=",string(vE2m02,n2),",vE17=",string(vE17,n2),",vE18=",string(vE18,n2),",vE7=",string(vE7,n4)).
compute p1315="vE2m02 in 1 | vE17 in 2 | vE18 in 2，應答vE7而未答".
end if.

* logic check hide vE7.
do if (not any(vE2m02,1,96) & not any(vE17,2,96) & not any(vE18,2,96)) & any(0,vE7_96).
compute m1316=concat("vE2m02=",string(vE2m02,n2),",vE17=",string(vE17,n2),",vE18=",string(vE18,n2),",vE7=",string(vE7,n4)).
compute p1316="vE2m02~=1 & vE17~=2 & vE18~=2 & vE2m02~=96 & vE17~=96 & vE18~=96，不應答vE7而答".
end if.

* logic check show vE9.
do if (any(vE2m02,1) | any(vE17,2) | any(vE18,2)) & any(1,vE9_96).
compute m1317=concat("vE2m02=",string(vE2m02,n2),",vE17=",string(vE17,n2),",vE18=",string(vE18,n2),",vE9=",string(vE9,n5)).
compute p1317="vE2m02 in 1 | vE17 in 2 | vE18 in 2，應答vE9而未答".
end if.

* logic check hide vE9.
do if (not any(vE2m02,1,96) & not any(vE17,2,96) & not any(vE18,2,96)) & any(0,vE9_96).
compute m1318=concat("vE2m02=",string(vE2m02,n2),",vE17=",string(vE17,n2),",vE18=",string(vE18,n2),",vE9=",string(vE9,n5)).
compute p1318="vE2m02~=1 & vE17~=2 & vE18~=2 & vE2m02~=96 & vE17~=96 & vE18~=96，不應答vE9而答".
end if.

* logic check show vE10.
do if (any(vE2m03,1) | any(vE17,3) | any(vE18,3)) & any(1,vE10_96).
compute m1319=concat("vE2m03=",string(vE2m03,n2),",vE17=",string(vE17,n2),",vE18=",string(vE18,n2),",vE10=",string(vE10,n4)).
compute p1319="vE2m03 in 1 | vE17 in 3 | vE18 in 3，應答vE10而未答".
end if.

* logic check hide vE10.
do if (not any(vE2m03,1,96) & not any(vE17,3,96) & not any(vE18,3,96)) & any(0,vE10_96).
compute m1320=concat("vE2m03=",string(vE2m03,n2),",vE17=",string(vE17,n2),",vE18=",string(vE18,n2),",vE10=",string(vE10,n4)).
compute p1320="vE2m03~=1 & vE17~=3 & vE18~=3 & vE2m03~=96 & vE17~=96 & vE18~=96，不應答vE10而答".
end if.

* logic check show vE12.
do if (any(vE2m03,1) | any(vE17,3) | any(vE18,3)) & any(1,vE12_96).
compute m1321=concat("vE2m03=",string(vE2m03,n2),",vE17=",string(vE17,n2),",vE18=",string(vE18,n2),",vE12=",string(vE12,n5)).
compute p1321="vE2m03 in 1 | vE17 in 3 | vE18 in 3，應答vE12而未答".
end if.

* logic check hide vE12.
do if (not any(vE2m03,1,96) & not any(vE17,3,96) & not any(vE18,3,96)) & any(0,vE12_96).
compute m1322=concat("vE2m03=",string(vE2m03,n2),",vE17=",string(vE17,n2),",vE18=",string(vE18,n2),",vE12=",string(vE12,n5)).
compute p1322="vE2m03~=1 & vE17~=3 & vE18~=3 & vE2m03~=96 & vE17~=96 & vE18~=96，不應答vE12而答".
end if.

* logic check limit vKLI2.
do if not any(mod(trunc(vKLI2/10),10),0,1,2,3,4,5).
compute m1323=concat("vKLI2=",string(vKLI2,n5)).
compute p1323="vKLI2第3碼應為0,1,2,3,4,5".
end if.

* logic check limit vKFB2.
do if not any(mod(trunc(vKFB2/10),10),0,1,2,3,4,5).
compute m1324=concat("vKFB2=",string(vKFB2,n5)).
compute p1324="vKFB2第3碼應為0,1,2,3,4,5".
end if.

* logic check limit vKIG2.
do if not any(mod(trunc(vKIG2/10),10),0,1,2,3,4,5).
compute m1325=concat("vKIG2=",string(vKIG2,n5)).
compute p1325="vKIG2第3碼應為0,1,2,3,4,5".
end if.

* logic check limit vKTT2.
do if not any(mod(trunc(vKTT2/10),10),0,1,2,3,4,5).
compute m1326=concat("vKTT2=",string(vKTT2,n5)).
compute p1326="vKTT2第3碼應為0,1,2,3,4,5".
end if.

* logic check show vE18.
do if (any(vK3m01,1)) & any(1,vE18_96).
compute m1327=concat("vK3m01=",string(vK3m01,n2),",vE18=",string(vE18,n2)).
compute p1327="vK3m01 in 1，應答vE18而未答".
end if.

* logic check hide vE18.
do if (vK3m01~=1) & any(0,vE18_96).
compute m1328=concat("vK3m01=",string(vK3m01,n2),",vE18=",string(vE18,n2)).
compute p1328="vK3m01~=1，不應答vE18而答".
end if.

* logic check show vKYT1.
do if (any(vK3m01,1)) & any(1,vKYT1_96).
compute m1329=concat("vK3m01=",string(vK3m01,n2),",vKYT1=",string(vKYT1,n4)).
compute p1329="vK3m01 in 1，應答vKYT1而未答".
end if.

* logic check hide vKYT1.
do if (vK3m01~=1) & any(0,vKYT1_96).
compute m1330=concat("vK3m01=",string(vK3m01,n2),",vKYT1=",string(vKYT1,n4)).
compute p1330="vK3m01~=1，不應答vKYT1而答".
end if.

* logic check show vKYT2.
do if (any(vK3m01,1)) & any(1,vKYT2_96).
compute m1331=concat("vK3m01=",string(vK3m01,n2),",vKYT2=",string(vKYT2,n5)).
compute p1331="vK3m01 in 1，應答vKYT2而未答".
end if.

* logic check hide vKYT2.
do if (vK3m01~=1) & any(0,vKYT2_96).
compute m1332=concat("vK3m01=",string(vK3m01,n2),",vKYT2=",string(vKYT2,n5)).
compute p1332="vK3m01~=1，不應答vKYT2而答".
end if.

* logic check hide vQ7.
do if (any(vQ5,2,97,98) | any(vK3m90,1)) & any(0,vQ7_96).
compute m1333=concat("vQ5=",string(vQ5,n2),",vK3m90=",string(vK3m90,n2),",vQ7=",string(vQ7,n2)).
compute p1333="vQ5 in 2 | vQ5 in 97 | vQ5 in 98 | vK3m90 in 1，不應答vQ7而答".
end if.

* logic check show vQ7.
do if (not any(vQ5,2,97,98,96) & vK3m90~=1) & any(1,vQ7_96).
compute m1334=concat("vQ5=",string(vQ5,n2),",vK3m90=",string(vK3m90,n2),",vQ7=",string(vQ7,n2)).
compute p1334="vQ5~=2 & vQ5~=97 & vQ5~=98 & vK3m90~=1 & vQ5~=96，應答vQ7而未答".
end if.

* logic check hide vQ12.
do if (any(vQ10,2,97,98) | any(vK3m90,1) | any(vQ7,1)) & any(0,vQ12_96).
compute m1335=concat("vQ10=",string(vQ10,n2),",vK3m90=",string(vK3m90,n2),",vQ7=",string(vQ7,n2),",vQ12=",string(vQ12,n2)).
compute p1335="vQ10 in 2 | vQ10 in 97 | vQ10 in 98 | vK3m90 in 1 | vQ7 in 1，不應答vQ12而答".
end if.

* logic check show vQ12.
do if (not any(vQ10,2,97,98,96) & vK3m90~=1 & not any(vQ7,1,96)) & any(1,vQ12_96).
compute m1336=concat("vQ10=",string(vQ10,n2),",vK3m90=",string(vK3m90,n2),",vQ7=",string(vQ7,n2),",vQ12=",string(vQ12,n2)).
compute p1336="vQ10~=2 & vQ10~=97 & vQ10~=98 & vK3m90~=1 & vQ7~=1 & vQ10~=96 & vQ7~=96，應答vQ12而未答".
end if.

* logic check hide vQ17.
do if (any(vQ15,2,97,98) | any(vK3m90,1)) & any(0,vQ17_96).
compute m1337=concat("vQ15=",string(vQ15,n2),",vK3m90=",string(vK3m90,n2),",vQ17=",string(vQ17,n2)).
compute p1337="vQ15 in 2 | vQ15 in 97 | vQ15 in 98 | vK3m90 in 1，不應答vQ17而答".
end if.

* logic check show vQ17.
do if (not any(vQ15,2,97,98,96) & vK3m90~=1) & any(1,vQ17_96).
compute m1338=concat("vQ15=",string(vQ15,n2),",vK3m90=",string(vK3m90,n2),",vQ17=",string(vQ17,n2)).
compute p1338="vQ15~=2 & vQ15~=97 & vQ15~=98 & vK3m90~=1 & vQ15~=96，應答vQ17而未答".
end if.

* logic check limit vKYT2.
do if not any(mod(trunc(vKYT2/10),10),0,1,2,3,4,5).
compute m1339=concat("vKYT2=",string(vKYT2,n5)).
compute p1339="vKYT2第3碼應為0,1,2,3,4,5".
end if.

* logic check show vE2m01,vE2m02,vE2m03,vE2m04,vE2m88.
do if (any(vE1,1)) & (any(1,vE2m01_96) | any(1,vE2m02_96) | any(1,vE2m03_96) | any(1,vE2m04_96) | any(1,vE2m88_96)).
compute m1340=concat(
  "vE1=", string(vE1,n2), ",vE2m01=", string(vE2m01,n2), ",vE2m02=", string(vE2m02,n2), ",vE2m03=", string(vE2m03,n2), ",vE2m04=", string(vE2m04,n2),
  ",vE2m88=", string(vE2m88,n2)
).
compute p1340="vE1 in 1，應答vE2m01,vE2m02,vE2m03,vE2m04,vE2m88而未答".
end if.

* logic check hide vE2m01,vE2m02,vE2m03,vE2m04,vE2m88.
do if (vE1~=1) & (any(0,vE2m01_96) | any(0,vE2m02_96) | any(0,vE2m03_96) | any(0,vE2m04_96) | any(0,vE2m88_96)).
compute m1341=concat(
  "vE1=", string(vE1,n2), ",vE2m01=", string(vE2m01,n2), ",vE2m02=", string(vE2m02,n2), ",vE2m03=", string(vE2m03,n2), ",vE2m04=", string(vE2m04,n2),
  ",vE2m88=", string(vE2m88,n2)
).
compute p1341="vE1~=1，不應答vE2m01,vE2m02,vE2m03,vE2m04,vE2m88而答".
end if.

* logic check show vE3.
do if (any(vE1,1)) & any(1,vE3_96).
compute m1342=concat("vE1=",string(vE1,n2),",vE3=",string(vE3,n5)).
compute p1342="vE1 in 1，應答vE3而未答".
end if.

* logic check hide vE3.
do if (vE1~=1) & any(0,vE3_96).
compute m1343=concat("vE1=",string(vE1,n2),",vE3=",string(vE3,n5)).
compute p1343="vE1~=1，不應答vE3而答".
end if.

* logic check show vE13m01,vE13m02,vE13m03,vE13m04,vE13m05,vE13m06,vE13m88.
do if (any(vE1 , 1)) & (any(1 , vE13m01_96) | any(1 , vE13m02_96) | any(1 , vE13m03_96) | any(1 , vE13m04_96) | any(1 , vE13m05_96) | any(1 , vE13m06_96)
| any(1 , vE13m88_96)).
compute m1344=concat(
  "vE1=", string(vE1,n2), ",vE13m01=", string(vE13m01,n2), ",vE13m02=", string(vE13m02,n2), ",vE13m03=", string(vE13m03,n2), ",vE13m04=", string(vE13m04,n2),
  ",vE13m05=", string(vE13m05,n2), ",vE13m06=", string(vE13m06,n2), ",vE13m88=", string(vE13m88,n2)
).
compute p1344="vE1 in 1，應答vE13m01,vE13m02,vE13m03,vE13m04,vE13m05,vE13m06,vE13m88而未答".
end if.

* logic check hide vE13m01,vE13m02,vE13m03,vE13m04,vE13m05,vE13m06,vE13m88.
do if (vE1~=1) & (any(0,vE13m01_96) | any(0,vE13m02_96) | any(0,vE13m03_96) | any(0,vE13m04_96) | any(0,vE13m05_96) | any(0,vE13m06_96) | any(0,vE13m88_96)).
compute m1345=concat(
  "vE1=", string(vE1,n2), ",vE13m01=", string(vE13m01,n2), ",vE13m02=", string(vE13m02,n2), ",vE13m03=", string(vE13m03,n2), ",vE13m04=", string(vE13m04,n2),
  ",vE13m05=", string(vE13m05,n2), ",vE13m06=", string(vE13m06,n2), ",vE13m88=", string(vE13m88,n2)
).
compute p1345="vE1~=1，不應答vE13m01,vE13m02,vE13m03,vE13m04,vE13m05,vE13m06,vE13m88而答".
end if.

* logic check show vE14.
do if (any(vE1,1)) & any(1,vE14_96).
compute m1346=concat("vE1=",string(vE1,n2),",vE14=",string(vE14,n7)).
compute p1346="vE1 in 1，應答vE14而未答".
end if.

* logic check hide vE14.
do if (vE1~=1) & any(0,vE14_96).
compute m1347=concat("vE1=",string(vE1,n2),",vE14=",string(vE14,n7)).
compute p1347="vE1~=1，不應答vE14而答".
end if.

* logic check show vG7m01,vG7m02,vG7m03,vG7m04,vG7m05,vG7m06,vG7m07,vG7m08,vG7m09,vG7m10,vG7m11,vG7m12,vG7m88,vG7m90.
do if (any(vE1 , 1)) & (any(1 , vG7m01_96) | any(1 , vG7m02_96) | any(1 , vG7m03_96) | any(1 , vG7m04_96) | any(1 , vG7m05_96) | any(1 , vG7m06_96) | any(1
, vG7m07_96) | any(1 , vG7m08_96) | any(1 , vG7m09_96) | any(1 , vG7m10_96) | any(1 , vG7m11_96) | any(1 , vG7m12_96) | any(1 , vG7m88_96) | any(1 , vG7m90_96)).
compute m1348=concat(
  "vE1=", string(vE1,n2), ",vG7m01=", string(vG7m01,n2), ",vG7m02=", string(vG7m02,n2), ",vG7m03=", string(vG7m03,n2), ",vG7m04=", string(vG7m04,n2),
  ",vG7m05=", string(vG7m05,n2), ",vG7m06=", string(vG7m06,n2), ",vG7m07=", string(vG7m07,n2), ",vG7m08=", string(vG7m08,n2), ",vG7m09=", string(vG7m09,n2),
  ",vG7m10=", string(vG7m10,n2), ",vG7m11=", string(vG7m11,n2), ",vG7m12=", string(vG7m12,n2), ",vG7m88=", string(vG7m88,n2), ",vG7m90=", string(vG7m90,n2)
).
compute p1348="vE1 in 1，應答vG7m01,vG7m02,vG7m03,vG7m04,vG7m05,vG7m06,vG7m07,vG7m08,vG7m09,vG7m10,vG7m11,vG7m12,vG7m88,vG7m90而未答".
end if.

* logic check hide vG7m01,vG7m02,vG7m03,vG7m04,vG7m05,vG7m06,vG7m07,vG7m08,vG7m09,vG7m10,vG7m11,vG7m12,vG7m88,vG7m90.
do if (vE1~=1) & (any(0 , vG7m01_96) | any(0 , vG7m02_96) | any(0 , vG7m03_96) | any(0 , vG7m04_96) | any(0 , vG7m05_96) | any(0 , vG7m06_96) | any(0
, vG7m07_96) | any(0 , vG7m08_96) | any(0 , vG7m09_96) | any(0 , vG7m10_96) | any(0 , vG7m11_96) | any(0 , vG7m12_96) | any(0 , vG7m88_96) | any(0 , vG7m90_96)).
compute m1349=concat(
  "vE1=", string(vE1,n2), ",vG7m01=", string(vG7m01,n2), ",vG7m02=", string(vG7m02,n2), ",vG7m03=", string(vG7m03,n2), ",vG7m04=", string(vG7m04,n2),
  ",vG7m05=", string(vG7m05,n2), ",vG7m06=", string(vG7m06,n2), ",vG7m07=", string(vG7m07,n2), ",vG7m08=", string(vG7m08,n2), ",vG7m09=", string(vG7m09,n2),
  ",vG7m10=", string(vG7m10,n2), ",vG7m11=", string(vG7m11,n2), ",vG7m12=", string(vG7m12,n2), ",vG7m88=", string(vG7m88,n2), ",vG7m90=", string(vG7m90,n2)
).
compute p1349="vE1~=1，不應答vG7m01,vG7m02,vG7m03,vG7m04,vG7m05,vG7m06,vG7m07,vG7m08,vG7m09,vG7m10,vG7m11,vG7m12,vG7m88,vG7m90而答".
end if.

* logic check show vG8m01,vG8m02,vG8m03,vG8m04,vG8m05,vG8m06,vG8m07,vG8m08,vG8m09,vG8m10,vG8m11,vG8m12,vG8m13,vG8m14,vG8m15,vG8m16,vG8m88,vG8m90.
do if (any(vE1 , 1)) & (any(1 , vG8m01_96) | any(1 , vG8m02_96) | any(1 , vG8m03_96) | any(1 , vG8m04_96) | any(1 , vG8m05_96) | any(1 , vG8m06_96) | any(1
, vG8m07_96) | any(1 , vG8m08_96) | any(1 , vG8m09_96) | any(1 , vG8m10_96) | any(1 , vG8m11_96) | any(1 , vG8m12_96) | any(1 , vG8m13_96) | any(1 , vG8m14_96)
| any(1 , vG8m15_96) | any(1 , vG8m16_96) | any(1 , vG8m88_96) | any(1 , vG8m90_96)).
compute m1350=concat(
  "vE1=", string(vE1,n2), ",vG8m01=", string(vG8m01,n2), ",vG8m02=", string(vG8m02,n2), ",vG8m03=", string(vG8m03,n2), ",vG8m04=", string(vG8m04,n2),
  ",vG8m05=", string(vG8m05,n2), ",vG8m06=", string(vG8m06,n2), ",vG8m07=", string(vG8m07,n2), ",vG8m08=", string(vG8m08,n2), ",vG8m09=", string(vG8m09,n2),
  ",vG8m10=", string(vG8m10,n2), ",vG8m11=", string(vG8m11,n2), ",vG8m12=", string(vG8m12,n2), ",vG8m13=", string(vG8m13,n2), ",vG8m14=", string(vG8m14,n2),
  ",vG8m15=", string(vG8m15,n2), ",vG8m16=", string(vG8m16,n2), ",vG8m88=", string(vG8m88,n2), ",vG8m90=", string(vG8m90,n2)
).
compute p1350="vE1 in 1，應答vG8m01,vG8m02,vG8m03,vG8m04,vG8m05,vG8m06,vG8m07,vG8m08,vG8m09,vG8m10,vG8m11,vG8m12,vG8m13,vG8m14,vG8m15,vG8m16,vG8m88,vG8m90而未答".
end if.

* logic check hide vG8m01,vG8m02,vG8m03,vG8m04,vG8m05,vG8m06,vG8m07,vG8m08,vG8m09,vG8m10,vG8m11,vG8m12,vG8m13,vG8m14,vG8m15,vG8m16,vG8m88,vG8m90.
do if (vE1~=1) & (any(0 , vG8m01_96) | any(0 , vG8m02_96) | any(0 , vG8m03_96) | any(0 , vG8m04_96) | any(0 , vG8m05_96) | any(0 , vG8m06_96) | any(0
, vG8m07_96) | any(0 , vG8m08_96) | any(0 , vG8m09_96) | any(0 , vG8m10_96) | any(0 , vG8m11_96) | any(0 , vG8m12_96) | any(0 , vG8m13_96) | any(0 , vG8m14_96)
| any(0 , vG8m15_96) | any(0 , vG8m16_96) | any(0 , vG8m88_96) | any(0 , vG8m90_96)).
compute m1351=concat(
  "vE1=", string(vE1,n2), ",vG8m01=", string(vG8m01,n2), ",vG8m02=", string(vG8m02,n2), ",vG8m03=", string(vG8m03,n2), ",vG8m04=", string(vG8m04,n2),
  ",vG8m05=", string(vG8m05,n2), ",vG8m06=", string(vG8m06,n2), ",vG8m07=", string(vG8m07,n2), ",vG8m08=", string(vG8m08,n2), ",vG8m09=", string(vG8m09,n2),
  ",vG8m10=", string(vG8m10,n2), ",vG8m11=", string(vG8m11,n2), ",vG8m12=", string(vG8m12,n2), ",vG8m13=", string(vG8m13,n2), ",vG8m14=", string(vG8m14,n2),
  ",vG8m15=", string(vG8m15,n2), ",vG8m16=", string(vG8m16,n2), ",vG8m88=", string(vG8m88,n2), ",vG8m90=", string(vG8m90,n2)
).
compute p1351="vE1~=1，不應答vG8m01,vG8m02,vG8m03,vG8m04,vG8m05,vG8m06,vG8m07,vG8m08,vG8m09,vG8m10,vG8m11,vG8m12,vG8m13,vG8m14,vG8m15,vG8m16,vG8m88,vG8m90而答".
end if.

* logic check show vG9m01,vG9m02,vG9m03,vG9m04,vG9m05,vG9m06,vG9m07,vG9m08,vG9m09,vG9m10,vG9m11,vG9m12,vG9m13,vG9m88,vG9m90.
do if (any(vE1 , 1)) & (any(1 , vG9m01_96) | any(1 , vG9m02_96) | any(1 , vG9m03_96) | any(1 , vG9m04_96) | any(1 , vG9m05_96) | any(1 , vG9m06_96) | any(1
, vG9m07_96) | any(1 , vG9m08_96) | any(1 , vG9m09_96) | any(1 , vG9m10_96) | any(1 , vG9m11_96) | any(1 , vG9m12_96) | any(1 , vG9m13_96) | any(1 , vG9m88_96)
| any(1 , vG9m90_96)).
compute m1352=concat(
  "vE1=", string(vE1,n2), ",vG9m01=", string(vG9m01,n2), ",vG9m02=", string(vG9m02,n2), ",vG9m03=", string(vG9m03,n2), ",vG9m04=", string(vG9m04,n2),
  ",vG9m05=", string(vG9m05,n2), ",vG9m06=", string(vG9m06,n2), ",vG9m07=", string(vG9m07,n2), ",vG9m08=", string(vG9m08,n2), ",vG9m09=", string(vG9m09,n2),
  ",vG9m10=", string(vG9m10,n2), ",vG9m11=", string(vG9m11,n2), ",vG9m12=", string(vG9m12,n2), ",vG9m13=", string(vG9m13,n2), ",vG9m88=", string(vG9m88,n2),
  ",vG9m90=", string(vG9m90,n2)
).
compute p1352="vE1 in 1，應答vG9m01,vG9m02,vG9m03,vG9m04,vG9m05,vG9m06,vG9m07,vG9m08,vG9m09,vG9m10,vG9m11,vG9m12,vG9m13,vG9m88,vG9m90而未答".
end if.

* logic check hide vG9m01,vG9m02,vG9m03,vG9m04,vG9m05,vG9m06,vG9m07,vG9m08,vG9m09,vG9m10,vG9m11,vG9m12,vG9m13,vG9m88,vG9m90.
do if (vE1~=1) & (any(0 , vG9m01_96) | any(0 , vG9m02_96) | any(0 , vG9m03_96) | any(0 , vG9m04_96) | any(0 , vG9m05_96) | any(0 , vG9m06_96) | any(0
, vG9m07_96) | any(0 , vG9m08_96) | any(0 , vG9m09_96) | any(0 , vG9m10_96) | any(0 , vG9m11_96) | any(0 , vG9m12_96) | any(0 , vG9m13_96) | any(0 , vG9m88_96)
| any(0 , vG9m90_96)).
compute m1353=concat(
  "vE1=", string(vE1,n2), ",vG9m01=", string(vG9m01,n2), ",vG9m02=", string(vG9m02,n2), ",vG9m03=", string(vG9m03,n2), ",vG9m04=", string(vG9m04,n2),
  ",vG9m05=", string(vG9m05,n2), ",vG9m06=", string(vG9m06,n2), ",vG9m07=", string(vG9m07,n2), ",vG9m08=", string(vG9m08,n2), ",vG9m09=", string(vG9m09,n2),
  ",vG9m10=", string(vG9m10,n2), ",vG9m11=", string(vG9m11,n2), ",vG9m12=", string(vG9m12,n2), ",vG9m13=", string(vG9m13,n2), ",vG9m88=", string(vG9m88,n2),
  ",vG9m90=", string(vG9m90,n2)
).
compute p1353="vE1~=1，不應答vG9m01,vG9m02,vG9m03,vG9m04,vG9m05,vG9m06,vG9m07,vG9m08,vG9m09,vG9m10,vG9m11,vG9m12,vG9m13,vG9m88,vG9m90而答".
end if.

* logic check show vG10m01,vG10m02,vG10m03,vG10m04,vG10m05,vG10m06,vG10m07,vG10m08,vG10m09,vG10m10,vG10m11,vG10m12,vG10m13,vG10m14,vG10m15,vG10m16,vG10m17.
* vG10m18,vG10m19,vG10m88,vG10m90.
do if (any(vE1 , 1)) & (any(1 , vG10m01_96) | any(1 , vG10m02_96) | any(1 , vG10m03_96) | any(1 , vG10m04_96) | any(1 , vG10m05_96) | any(1 , vG10m06_96)
| any(1 , vG10m07_96) | any(1 , vG10m08_96) | any(1 , vG10m09_96) | any(1 , vG10m10_96) | any(1 , vG10m11_96) | any(1 , vG10m12_96) | any(1 , vG10m13_96)
| any(1 , vG10m14_96) | any(1 , vG10m15_96) | any(1 , vG10m16_96) | any(1 , vG10m17_96) | any(1 , vG10m18_96) | any(1 , vG10m19_96) | any(1 , vG10m88_96)
| any(1 , vG10m90_96)).
compute m1354=concat(
  "vE1=", string(vE1,n2), ",vG10m01=", string(vG10m01,n2), ",vG10m02=", string(vG10m02,n2), ",vG10m03=", string(vG10m03,n2), ",vG10m04=", string(vG10m04,n2),
  ",vG10m05=", string(vG10m05,n2), ",vG10m06=", string(vG10m06,n2), ",vG10m07=", string(vG10m07,n2), ",vG10m08=", string(vG10m08,n2), ",vG10m09=",
  string(vG10m09,n2), ",vG10m10=", string(vG10m10,n2), ",vG10m11=", string(vG10m11,n2), ",vG10m12=", string(vG10m12,n2), ",vG10m13=", string(vG10m13,n2),
  ",vG10m14=", string(vG10m14,n2), ",vG10m15=", string(vG10m15,n2), ",vG10m16=", string(vG10m16,n2), ",vG10m17=", string(vG10m17,n2), ",vG10m18=",
  string(vG10m18,n2), ",vG10m19=", string(vG10m19,n2), ",vG10m88=", string(vG10m88,n2), ",vG10m90=", string(vG10m90,n2)
).
compute p1354=concat(
  "vE1 in 1，應答vG10m01,vG10m02,vG10m03,vG10m04,vG10m05,vG10m06,vG10m07,vG10m08,vG10m09,vG10m10,vG10m11,v",
  "G10m12,vG10m13,vG10m14,vG10m15,vG10m16,vG10m17,vG10m18,vG10m19,vG10m88,vG10m90而未答"
).
end if.

* logic check hide vG10m01,vG10m02,vG10m03,vG10m04,vG10m05,vG10m06,vG10m07,vG10m08,vG10m09,vG10m10,vG10m11,vG10m12,vG10m13,vG10m14,vG10m15,vG10m16,vG10m17.
* vG10m18,vG10m19,vG10m88,vG10m90.
do if (vE1~=1) & (any(0 , vG10m01_96) | any(0 , vG10m02_96) | any(0 , vG10m03_96) | any(0 , vG10m04_96) | any(0 , vG10m05_96) | any(0 , vG10m06_96) | any(0
, vG10m07_96) | any(0 , vG10m08_96) | any(0 , vG10m09_96) | any(0 , vG10m10_96) | any(0 , vG10m11_96) | any(0 , vG10m12_96) | any(0 , vG10m13_96) | any(0
, vG10m14_96) | any(0 , vG10m15_96) | any(0 , vG10m16_96) | any(0 , vG10m17_96) | any(0 , vG10m18_96) | any(0 , vG10m19_96) | any(0 , vG10m88_96) | any(0
, vG10m90_96)).
compute m1355=concat(
  "vE1=", string(vE1,n2), ",vG10m01=", string(vG10m01,n2), ",vG10m02=", string(vG10m02,n2), ",vG10m03=", string(vG10m03,n2), ",vG10m04=", string(vG10m04,n2),
  ",vG10m05=", string(vG10m05,n2), ",vG10m06=", string(vG10m06,n2), ",vG10m07=", string(vG10m07,n2), ",vG10m08=", string(vG10m08,n2), ",vG10m09=",
  string(vG10m09,n2), ",vG10m10=", string(vG10m10,n2), ",vG10m11=", string(vG10m11,n2), ",vG10m12=", string(vG10m12,n2), ",vG10m13=", string(vG10m13,n2),
  ",vG10m14=", string(vG10m14,n2), ",vG10m15=", string(vG10m15,n2), ",vG10m16=", string(vG10m16,n2), ",vG10m17=", string(vG10m17,n2), ",vG10m18=",
  string(vG10m18,n2), ",vG10m19=", string(vG10m19,n2), ",vG10m88=", string(vG10m88,n2), ",vG10m90=", string(vG10m90,n2)
).
compute p1355=concat(
  "vE1~=1，不應答vG10m01,vG10m02,vG10m03,vG10m04,vG10m05,vG10m06,vG10m07,vG10m08,vG10m09,vG10m10,vG10m11,vG",
  "10m12,vG10m13,vG10m14,vG10m15,vG10m16,vG10m17,vG10m18,vG10m19,vG10m88,vG10m90而答"
).
end if.

* logic check show vG11m01,vG11m02,vG11m03,vG11m04,vG11m05,vG11m88,vG11m90.
do if (any(vE1 , 1)) & (any(1 , vG11m01_96) | any(1 , vG11m02_96) | any(1 , vG11m03_96) | any(1 , vG11m04_96) | any(1 , vG11m05_96) | any(1 , vG11m88_96)
| any(1 , vG11m90_96)).
compute m1356=concat(
  "vE1=", string(vE1,n2), ",vG11m01=", string(vG11m01,n2), ",vG11m02=", string(vG11m02,n2), ",vG11m03=", string(vG11m03,n2), ",vG11m04=", string(vG11m04,n2),
  ",vG11m05=", string(vG11m05,n2), ",vG11m88=", string(vG11m88,n2), ",vG11m90=", string(vG11m90,n2)
).
compute p1356="vE1 in 1，應答vG11m01,vG11m02,vG11m03,vG11m04,vG11m05,vG11m88,vG11m90而未答".
end if.

* logic check hide vG11m01,vG11m02,vG11m03,vG11m04,vG11m05,vG11m88,vG11m90.
do if (vE1~=1) & (any(0,vG11m01_96) | any(0,vG11m02_96) | any(0,vG11m03_96) | any(0,vG11m04_96) | any(0,vG11m05_96) | any(0,vG11m88_96) | any(0,vG11m90_96)).
compute m1357=concat(
  "vE1=", string(vE1,n2), ",vG11m01=", string(vG11m01,n2), ",vG11m02=", string(vG11m02,n2), ",vG11m03=", string(vG11m03,n2), ",vG11m04=", string(vG11m04,n2),
  ",vG11m05=", string(vG11m05,n2), ",vG11m88=", string(vG11m88,n2), ",vG11m90=", string(vG11m90,n2)
).
compute p1357="vE1~=1，不應答vG11m01,vG11m02,vG11m03,vG11m04,vG11m05,vG11m88,vG11m90而答".
end if.

* logic check show vJ4_5.
do if (any(vE1,1)) & any(1,vJ4_5_96).
compute m1358=concat("vE1=",string(vE1,n2),",vJ4_5=",string(vJ4_5,n4)).
compute p1358="vE1 in 1，應答vJ4_5而未答".
end if.

* logic check hide vJ4_5.
do if (vE1~=1) & any(0,vJ4_5_96).
compute m1359=concat("vE1=",string(vE1,n2),",vJ4_5=",string(vJ4_5,n4)).
compute p1359="vE1~=1，不應答vJ4_5而答".
end if.

* logic check show vJB2m01,vJB2m02,vJB2m03,vJB2m04,vJB2m05,vJB2m06,vJB2m07,vJB2m88,vJB2m90.
do if (any(vE1 , 1)) & (any(1 , vJB2m01_96) | any(1 , vJB2m02_96) | any(1 , vJB2m03_96) | any(1 , vJB2m04_96) | any(1 , vJB2m05_96) | any(1 , vJB2m06_96)
| any(1 , vJB2m07_96) | any(1 , vJB2m88_96) | any(1 , vJB2m90_96)).
compute m1360=concat(
  "vE1=", string(vE1,n2), ",vJB2m01=", string(vJB2m01,n2), ",vJB2m02=", string(vJB2m02,n2), ",vJB2m03=", string(vJB2m03,n2), ",vJB2m04=", string(vJB2m04,n2),
  ",vJB2m05=", string(vJB2m05,n2), ",vJB2m06=", string(vJB2m06,n2), ",vJB2m07=", string(vJB2m07,n2), ",vJB2m88=", string(vJB2m88,n2), ",vJB2m90=",
  string(vJB2m90,n2)
).
compute p1360="vE1 in 1，應答vJB2m01,vJB2m02,vJB2m03,vJB2m04,vJB2m05,vJB2m06,vJB2m07,vJB2m88,vJB2m90而未答".
end if.

* logic check hide vJB2m01,vJB2m02,vJB2m03,vJB2m04,vJB2m05,vJB2m06,vJB2m07,vJB2m88,vJB2m90.
do if (vE1~=1) & (any(0 , vJB2m01_96) | any(0 , vJB2m02_96) | any(0 , vJB2m03_96) | any(0 , vJB2m04_96) | any(0 , vJB2m05_96) | any(0 , vJB2m06_96) | any(0
, vJB2m07_96) | any(0 , vJB2m88_96) | any(0 , vJB2m90_96)).
compute m1361=concat(
  "vE1=", string(vE1,n2), ",vJB2m01=", string(vJB2m01,n2), ",vJB2m02=", string(vJB2m02,n2), ",vJB2m03=", string(vJB2m03,n2), ",vJB2m04=", string(vJB2m04,n2),
  ",vJB2m05=", string(vJB2m05,n2), ",vJB2m06=", string(vJB2m06,n2), ",vJB2m07=", string(vJB2m07,n2), ",vJB2m88=", string(vJB2m88,n2), ",vJB2m90=",
  string(vJB2m90,n2)
).
compute p1361="vE1~=1，不應答vJB2m01,vJB2m02,vJB2m03,vJB2m04,vJB2m05,vJB2m06,vJB2m07,vJB2m88,vJB2m90而答".
end if.

* logic check show vH4.
do if (any(vE1,1)) & any(1,vH4_96).
compute m1362=concat("vE1=",string(vE1,n2),",vH4=",string(vH4,n4)).
compute p1362="vE1 in 1，應答vH4而未答".
end if.

* logic check hide vH4.
do if (vE1~=1) & any(0,vH4_96).
compute m1363=concat("vE1=",string(vE1,n2),",vH4=",string(vH4,n4)).
compute p1363="vE1~=1，不應答vH4而答".
end if.

* logic check show vQ5.
do if (any(vE1,1)) & any(1,vQ5_96).
compute m1364=concat("vE1=",string(vE1,n2),",vQ5=",string(vQ5,n2)).
compute p1364="vE1 in 1，應答vQ5而未答".
end if.

* logic check hide vQ5.
do if (vE1~=1) & any(0,vQ5_96).
compute m1365=concat("vE1=",string(vE1,n2),",vQ5=",string(vQ5,n2)).
compute p1365="vE1~=1，不應答vQ5而答".
end if.

* logic check show vQ10.
do if (any(vE1,1)) & any(1,vQ10_96).
compute m1366=concat("vE1=",string(vE1,n2),",vQ10=",string(vQ10,n2)).
compute p1366="vE1 in 1，應答vQ10而未答".
end if.

* logic check hide vQ10.
do if (vE1~=1) & any(0,vQ10_96).
compute m1367=concat("vE1=",string(vE1,n2),",vQ10=",string(vQ10,n2)).
compute p1367="vE1~=1，不應答vQ10而答".
end if.

* logic check show vQ15.
do if (any(vE1,1)) & any(1,vQ15_96).
compute m1368=concat("vE1=",string(vE1,n2),",vQ15=",string(vQ15,n2)).
compute p1368="vE1 in 1，應答vQ15而未答".
end if.

* logic check hide vQ15.
do if (vE1~=1) & any(0,vQ15_96).
compute m1369=concat("vE1=",string(vE1,n2),",vQ15=",string(vQ15,n2)).
compute p1369="vE1~=1，不應答vQ15而答".
end if.

* logic check show vQ27m01,vQ27m02,vQ27m03,vQ27m04,vQ27m05,vQ27m06,vQ27m07,vQ27m88.
do if (any(vE1 , 1)) & (any(1 , vQ27m01_96) | any(1 , vQ27m02_96) | any(1 , vQ27m03_96) | any(1 , vQ27m04_96) | any(1 , vQ27m05_96) | any(1 , vQ27m06_96)
| any(1 , vQ27m07_96) | any(1 , vQ27m88_96)).
compute m1370=concat(
  "vE1=", string(vE1,n2), ",vQ27m01=", string(vQ27m01,n2), ",vQ27m02=", string(vQ27m02,n2), ",vQ27m03=", string(vQ27m03,n2), ",vQ27m04=", string(vQ27m04,n2),
  ",vQ27m05=", string(vQ27m05,n2), ",vQ27m06=", string(vQ27m06,n2), ",vQ27m07=", string(vQ27m07,n2), ",vQ27m88=", string(vQ27m88,n2)
).
compute p1370="vE1 in 1，應答vQ27m01,vQ27m02,vQ27m03,vQ27m04,vQ27m05,vQ27m06,vQ27m07,vQ27m88而未答".
end if.

* logic check hide vQ27m01,vQ27m02,vQ27m03,vQ27m04,vQ27m05,vQ27m06,vQ27m07,vQ27m88.
do if (vE1~=1) & (any(0 , vQ27m01_96) | any(0 , vQ27m02_96) | any(0 , vQ27m03_96) | any(0 , vQ27m04_96) | any(0 , vQ27m05_96) | any(0 , vQ27m06_96) | any(0
, vQ27m07_96) | any(0 , vQ27m88_96)).
compute m1371=concat(
  "vE1=", string(vE1,n2), ",vQ27m01=", string(vQ27m01,n2), ",vQ27m02=", string(vQ27m02,n2), ",vQ27m03=", string(vQ27m03,n2), ",vQ27m04=", string(vQ27m04,n2),
  ",vQ27m05=", string(vQ27m05,n2), ",vQ27m06=", string(vQ27m06,n2), ",vQ27m07=", string(vQ27m07,n2), ",vQ27m88=", string(vQ27m88,n2)
).
compute p1371="vE1~=1，不應答vQ27m01,vQ27m02,vQ27m03,vQ27m04,vQ27m05,vQ27m06,vQ27m07,vQ27m88而答".
end if.

* logic check show vQ30m01,vQ30m02,vQ30m03,vQ30m04,vQ30m05,vQ30m06,vQ30m07,vQ30m08,vQ30m90.
do if (any(vE1 , 1)) & (any(1 , vQ30m01_96) | any(1 , vQ30m02_96) | any(1 , vQ30m03_96) | any(1 , vQ30m04_96) | any(1 , vQ30m05_96) | any(1 , vQ30m06_96)
| any(1 , vQ30m07_96) | any(1 , vQ30m08_96) | any(1 , vQ30m90_96)).
compute m1372=concat(
  "vE1=", string(vE1,n2), ",vQ30m01=", string(vQ30m01,n2), ",vQ30m02=", string(vQ30m02,n2), ",vQ30m03=", string(vQ30m03,n2), ",vQ30m04=", string(vQ30m04,n2),
  ",vQ30m05=", string(vQ30m05,n2), ",vQ30m06=", string(vQ30m06,n2), ",vQ30m07=", string(vQ30m07,n2), ",vQ30m08=", string(vQ30m08,n2), ",vQ30m90=",
  string(vQ30m90,n2)
).
compute p1372="vE1 in 1，應答vQ30m01,vQ30m02,vQ30m03,vQ30m04,vQ30m05,vQ30m06,vQ30m07,vQ30m08,vQ30m90而未答".
end if.

* logic check hide vQ30m01,vQ30m02,vQ30m03,vQ30m04,vQ30m05,vQ30m06,vQ30m07,vQ30m08,vQ30m90.
do if (vE1~=1) & (any(0 , vQ30m01_96) | any(0 , vQ30m02_96) | any(0 , vQ30m03_96) | any(0 , vQ30m04_96) | any(0 , vQ30m05_96) | any(0 , vQ30m06_96) | any(0
, vQ30m07_96) | any(0 , vQ30m08_96) | any(0 , vQ30m90_96)).
compute m1373=concat(
  "vE1=", string(vE1,n2), ",vQ30m01=", string(vQ30m01,n2), ",vQ30m02=", string(vQ30m02,n2), ",vQ30m03=", string(vQ30m03,n2), ",vQ30m04=", string(vQ30m04,n2),
  ",vQ30m05=", string(vQ30m05,n2), ",vQ30m06=", string(vQ30m06,n2), ",vQ30m07=", string(vQ30m07,n2), ",vQ30m08=", string(vQ30m08,n2), ",vQ30m90=",
  string(vQ30m90,n2)
).
compute p1373="vE1~=1，不應答vQ30m01,vQ30m02,vQ30m03,vQ30m04,vQ30m05,vQ30m06,vQ30m07,vQ30m08,vQ30m90而答".
end if.

* logic check mutex.
do if (any(vE1,2,97,98)) & (any(vF0,2)).
compute m1374=concat("vE1=",string(vE1,n2),",vF0=",string(vF0,n2)).
compute p1374="vE1 in 2 | vE1 in 97 | vE1 in 98與互斥條件不應同時成立".
end if.

* logic check mutex.
do if (any(vE1,2,97,98)) & (any(vF0,89)).
compute m1375=concat("vE1=",string(vE1,n2),",vF0=",string(vF0,n2)).
compute p1375="vE1 in 2 | vE1 in 97 | vE1 in 98與互斥條件不應同時成立".
end if.

* logic check mutex.
do if (any(vB1,0) & any(vB3,0) & any(vE1,2)) & (any(vQ20m01,1)).
compute m1376=concat("vB1=",string(vB1,n4),",vB3=",string(vB3,n4),",vE1=",string(vE1,n2),",vQ20m01=",string(vQ20m01,n2)).
compute p1376="vB1 in 0 & vB3 in 0 & vE1 in 2與互斥條件不應同時成立".
end if.

* logic check mutex.
do if (any(vE1,2)) & (any(vQ20m02,1)).
compute m1377=concat("vE1=",string(vE1,n2),",vQ20m02=",string(vQ20m02,n2)).
compute p1377="vE1 in 2與互斥條件不應同時成立".
end if.

* logic check mutex.
do if (any(vE1,2)) & (any(vQ20m03,1)).
compute m1378=concat("vE1=",string(vE1,n2),",vQ20m03=",string(vQ20m03,n2)).
compute p1378="vE1 in 2與互斥條件不應同時成立".
end if.

* logic check mutex.
do if (any(vE1,2)) & (any(vQ20m04,1)).
compute m1379=concat("vE1=",string(vE1,n2),",vQ20m04=",string(vQ20m04,n2)).
compute p1379="vE1 in 2與互斥條件不應同時成立".
end if.

* logic check mutex.
do if (any(vE1,2)) & (any(vQ20m05,1)).
compute m1380=concat("vE1=",string(vE1,n2),",vQ20m05=",string(vQ20m05,n2)).
compute p1380="vE1 in 2與互斥條件不應同時成立".
end if.

* logic check mutex.
do if (any(vE1,2)) & (any(vQ25m27,1)).
compute m1381=concat("vE1=",string(vE1,n2),",vQ25m27=",string(vQ25m27,n2)).
compute p1381="vE1 in 2與互斥條件不應同時成立".
end if.

* logic check mutex.
do if (any(vE1,2)) & (any(vQ25m28,1)).
compute m1382=concat("vE1=",string(vE1,n2),",vQ25m28=",string(vQ25m28,n2)).
compute p1382="vE1 in 2與互斥條件不應同時成立".
end if.

* logic check mutex.
do if (any(vE1,2)) & (any(vQ25m29,1)).
compute m1383=concat("vE1=",string(vE1,n2),",vQ25m29=",string(vQ25m29,n2)).
compute p1383="vE1 in 2與互斥條件不應同時成立".
end if.

* logic check mutex.
do if (any(vE1,2)) & (any(vQ25m30,1)).
compute m1384=concat("vE1=",string(vE1,n2),",vQ25m30=",string(vQ25m30,n2)).
compute p1384="vE1 in 2與互斥條件不應同時成立".
end if.

* logic check mutex.
do if (any(vE1,2)) & (any(vQ25m31,1)).
compute m1385=concat("vE1=",string(vE1,n2),",vQ25m31=",string(vQ25m31,n2)).
compute p1385="vE1 in 2與互斥條件不應同時成立".
end if.

* logic check show vE3_1.
do if (not(any(vE5 , 9797 , 9898)) & not(any(vE6 , 9797 , 9898)) & not(any(vE8 , 9797 , 9898)) & not(any(vE9 , 9797 , 9898)) & not(any(vE11 , 9797 , 9898))
& not(any(vE12 , 9797 , 9898)) & ((TRUNC(vE5/100)*60 + mod(vE5 , 100)) + (TRUNC(vE6/100)*60 + mod(vE6 , 100)) + (TRUNC(vE8/100)*60 + mod(vE8
, 100)) + (TRUNC(vE9/100)*60 + mod(vE9 , 100)) + (TRUNC(vE11/100)*60 + mod(vE11 , 100)) + (TRUNC(vE12/100)*60 + mod(vE12 , 100)))>2400) & vE3_1="96".
compute m1386=concat(
  "vE5=", string(vE5,n5), ",vE6=", string(vE6,n5), ",vE8=", string(vE8,n5), ",vE9=", string(vE9,n5), ",vE11=", string(vE11,n5), ",vE12=", string(vE12,n5),
  ",vE3_1=", rtrim(ltrim(vE3_1))
).
compute p1386=concat(
  "not(any(vE5,9797,9898)) & not(any(vE6,9797,9898)) & not(any(vE8,9797,9898)) & not(any(vE9,9797,9898)",
  ") & not(any(vE11,9797,9898)) & not(any(vE12,9797,9898)) & ((TRUNC(vE5/100)*60 + mod(vE5,100)) + (TRU",
  "NC(vE6/100)*60 + mod(vE6,100)) + (TRUNC(vE8/100)*60 + mod(vE8,100)) + (TRUNC(vE9/100)*60 + mod(vE9,1",
  "00)) + (TRUNC(vE11/100)*60 + mod(vE11,100)) + (TRUNC(vE12/100)*60 + mod(vE12,100)))>2400，應答vE3_1而未答"
).
end if.

* logic check hide vE3_1.
do if (not(not(any(vE5 , 9797 , 9898)) & not(any(vE6 , 9797 , 9898)) & not(any(vE8 , 9797 , 9898)) & not(any(vE9 , 9797 , 9898)) & not(any(vE11 , 9797 , 9898))
& not(any(vE12 , 9797 , 9898)) & ((TRUNC(vE5/100)*60 + mod(vE5 , 100)) + (TRUNC(vE6/100)*60 + mod(vE6 , 100)) + (TRUNC(vE8/100)*60 + mod(vE8
, 100)) + (TRUNC(vE9/100)*60 + mod(vE9 , 100)) + (TRUNC(vE11/100)*60 + mod(vE11 , 100)) + (TRUNC(vE12/100)*60 + mod(vE12 , 100)))>2400) & vE5~=99996
& vE6~=99996 & vE8~=99996 & vE9~=99996 & vE11~=99996 & vE12~=99996) & vE3_1~="96".
compute m1387=concat(
  "vE5=", string(vE5,n5), ",vE6=", string(vE6,n5), ",vE8=", string(vE8,n5), ",vE9=", string(vE9,n5), ",vE11=", string(vE11,n5), ",vE12=", string(vE12,n5),
  ",vE3_1=", rtrim(ltrim(vE3_1))
).
compute p1387=concat(
  "not(not(any(vE5,9797,9898)) & not(any(vE6,9797,9898)) & not(any(vE8,9797,9898)) & not(any(vE9,9797,9",
  "898)) & not(any(vE11,9797,9898)) & not(any(vE12,9797,9898)) & ((TRUNC(vE5/100)*60 + mod(vE5,100)) + ",
  "(TRUNC(vE6/100)*60 + mod(vE6,100)) + (TRUNC(vE8/100)*60 + mod(vE8,100)) + (TRUNC(vE9/100)*60 + mod(v",
  "E9,100)) + (TRUNC(vE11/100)*60 + mod(vE11,100)) + (TRUNC(vE12/100)*60 + mod(vE12,100)))>2400) & vE5~",
  "=99996 & vE6~=99996 & vE8~=99996 & vE9~=99996 & vE11~=99996 & vE12~=99996，不應答vE3_1而答"
).
end if.

* logic check limit vE3.
do if not any(mod(trunc(vE3/10),10),0,1,2,3,4,5).
compute m1388=concat("vE3=",string(vE3,n5)).
compute p1388="vE3第3碼應為0,1,2,3,4,5".
end if.

* logic check show vG4.
do if (any(vG7m01 , 1) | any(vG7m02 , 1) | any(vG7m03 , 1) | any(vG7m04 , 1) | any(vG7m05 , 1) | any(vG7m06 , 1) | any(vG7m07 , 1) | any(vG7m08 , 1)
| any(vG7m09 , 1) | any(vG7m10 , 1) | any(vG7m11 , 1) | any(vG7m12 , 1) | any(vG7m88 , 1) | any(vG8m01 , 1) | any(vG8m02 , 1) | any(vG8m03 , 1) | any(vG8m04
, 1) | any(vG8m05 , 1) | any(vG8m06 , 1) | any(vG8m07 , 1) | any(vG8m08 , 1) | any(vG8m09 , 1) | any(vG8m10 , 1) | any(vG8m11 , 1) | any(vG8m12 , 1)
| any(vG8m13 , 1) | any(vG8m14 , 1) | any(vG8m15 , 1) | any(vG8m16 , 1) | any(vG8m88 , 1) | any(vG9m01 , 1) | any(vG9m02 , 1) | any(vG9m03 , 1) | any(vG9m04
, 1) | any(vG9m05 , 1) | any(vG9m06 , 1) | any(vG9m07 , 1) | any(vG9m08 , 1) | any(vG9m09 , 1) | any(vG9m10 , 1) | any(vG9m11 , 1) | any(vG9m12 , 1)
| any(vG9m13 , 1) | any(vG9m88 , 1) | any(vG10m01 , 1) | any(vG10m02 , 1) | any(vG10m03 , 1) | any(vG10m04 , 1) | any(vG10m05 , 1) | any(vG10m06 , 1)
| any(vG10m07 , 1) | any(vG10m08 , 1) | any(vG10m09 , 1) | any(vG10m10 , 1) | any(vG10m11 , 1) | any(vG10m12 , 1) | any(vG10m13 , 1) | any(vG10m14 , 1)
| any(vG10m15 , 1) | any(vG10m16 , 1) | any(vG10m17 , 1) | any(vG10m18 , 1) | any(vG10m19 , 1) | any(vG10m88 , 1) | any(vG11m01 , 1) | any(vG11m02 , 1)
| any(vG11m03 , 1) | any(vG11m04 , 1) | any(vG11m05 , 1) | any(vG11m88 , 1)) & any(1 , vG4_96).
compute m1389=concat(
  "vG7m01=", string(vG7m01,n2), ",vG7m02=", string(vG7m02,n2), ",vG7m03=", string(vG7m03,n2), ",vG7m04=", string(vG7m04,n2), ",vG7m05=", string(vG7m05,n2),
  ",vG7m06=", string(vG7m06,n2), ",vG7m07=", string(vG7m07,n2), ",vG7m08=", string(vG7m08,n2), ",vG7m09=", string(vG7m09,n2), ",vG7m10=", string(vG7m10,n2),
  ",vG7m11=", string(vG7m11,n2), ",vG7m12=", string(vG7m12,n2), ",vG7m88=", string(vG7m88,n2), ",vG8m01=", string(vG8m01,n2), ",vG8m02=", string(vG8m02,n2),
  ",vG8m03=", string(vG8m03,n2), ",vG8m04=", string(vG8m04,n2), ",vG8m05=", string(vG8m05,n2), ",vG8m06=", string(vG8m06,n2), ",vG8m07=", string(vG8m07,n2),
  ",vG8m08=", string(vG8m08,n2), ",vG8m09=", string(vG8m09,n2), ",vG8m10=", string(vG8m10,n2), ",vG8m11=", string(vG8m11,n2), ",vG8m12=", string(vG8m12,n2),
  ",vG8m13=", string(vG8m13,n2), ",vG8m14=", string(vG8m14,n2), ",vG8m15=", string(vG8m15,n2), ",vG8m16=", string(vG8m16,n2), ",vG8m88=", string(vG8m88,n2),
  ",vG9m01=", string(vG9m01,n2), ",vG9m02=", string(vG9m02,n2), ",vG9m03=", string(vG9m03,n2), ",vG9m04=", string(vG9m04,n2), ",vG9m05=", string(vG9m05,n2),
  ",vG9m06=", string(vG9m06,n2), ",vG9m07=", string(vG9m07,n2), ",vG9m08=", string(vG9m08,n2), ",vG9m09=", string(vG9m09,n2), ",vG9m10=", string(vG9m10,n2),
  ",vG9m11=", string(vG9m11,n2), ",vG9m12=", string(vG9m12,n2), ",vG9m13=", string(vG9m13,n2), ",vG9m88=", string(vG9m88,n2), ",vG10m01=", string(vG10m01,n2),
  ",vG10m02=", string(vG10m02,n2), ",vG10m03=", string(vG10m03,n2), ",vG10m04=", string(vG10m04,n2), ",vG10m05=", string(vG10m05,n2), ",vG10m06=",
  string(vG10m06,n2), ",vG10m07=", string(vG10m07,n2), ",vG10m08=", string(vG10m08,n2), ",vG10m09=", string(vG10m09,n2), ",vG10m10=", string(vG10m10,n2),
  ",vG10m11=", string(vG10m11,n2), ",vG10m12=", string(vG10m12,n2), ",vG10m13=", string(vG10m13,n2), ",vG10m14=", string(vG10m14,n2), ",vG10m15=",
  string(vG10m15,n2), ",vG10m16=", string(vG10m16,n2), ",vG10m17=", string(vG10m17,n2), ",vG10m18=", string(vG10m18,n2), ",vG10m19=", string(vG10m19,n2),
  ",vG10m88=", string(vG10m88,n2), ",vG11m01=", string(vG11m01,n2), ",vG11m02=", string(vG11m02,n2), ",vG11m03=", string(vG11m03,n2), ",vG11m04=",
  string(vG11m04,n2), ",vG11m05=", string(vG11m05,n2), ",vG11m88=", string(vG11m88,n2), ",vG4=", string(vG4,n4)
).
compute p1389=concat(
  "vG7m01 in 1 | vG7m02 in 1 | vG7m03 in 1 | vG7m04 in 1 | vG7m05 in 1 | vG7m06 in 1 | vG7m07 in 1 | vG",
  "7m08 in 1 | vG7m09 in 1 | vG7m10 in 1 | vG7m11 in 1 | vG7m12 in 1 | vG7m88 in 1 | vG8m01 in 1 | vG8m",
  "02 in 1 | vG8m03 in 1 | vG8m04 in 1 | vG8m05 in 1 | vG8m06 in 1 | vG8m07 in 1 | vG8m08 in 1 | vG8m09",
  " in 1 | vG8m10 in 1 | vG8m11 in 1 | vG8m12 in 1 | vG8m13 in 1 | vG8m14 in 1 | vG8m15 in 1 | vG8m16 i",
  "n 1 | vG8m88 in 1 | vG9m01 in 1 | vG9m02 in 1 | vG9m03 in 1 | vG9m04 in 1 | vG9m05 in 1 | vG9m06 in ",
  "1 | vG9m07 in 1 | vG9m08 in 1 | vG9m09 in 1 | vG9m10 in 1 | vG9m11 in 1 | vG9m12 in 1 | vG9m13 in 1 ",
  "| vG9m88 in 1 | vG10m01 in 1 | vG10m02 in 1 | vG10m03 in 1 | vG10m04 in 1 | vG10m05 in 1 | vG10m06 i",
  "n 1 | vG10m07 in 1 | vG10m08 in 1 | vG10m09 in 1 | vG10m10 in 1 | vG10m11 in 1 | vG10m12 in 1 | vG10",
  "m13 in 1 | vG10m14 in 1 | vG10m15 in 1 | vG10m16 in 1 | vG10m17 in 1 | vG10m18 in 1 | vG10m19 in 1 |",
  " vG10m88 in 1 | vG11m01 in 1 | vG11m02 in 1 | vG11m03 in 1 | vG11m04 in 1 | vG11m05 in 1 | vG11m88 i",
  "n 1，應答vG4而未答"
).
end if.

* logic check hide vG4.
do if (not any(vG7m01 , 1 , 96) & not any(vG7m02 , 1 , 96) & not any(vG7m03 , 1 , 96) & not any(vG7m04 , 1 , 96) & not any(vG7m05 , 1 , 96) & not any(vG7m06 , 1
, 96) & not any(vG7m07 , 1 , 96) & not any(vG7m08 , 1 , 96) & not any(vG7m09 , 1 , 96) & not any(vG7m10 , 1 , 96) & not any(vG7m11 , 1 , 96) & not any(vG7m12
, 1 , 96) & not any(vG7m88 , 1 , 96) & not any(vG8m01 , 1 , 96) & not any(vG8m02 , 1 , 96) & not any(vG8m03 , 1 , 96) & not any(vG8m04 , 1 , 96)
& not any(vG8m05 , 1 , 96) & not any(vG8m06 , 1 , 96) & not any(vG8m07 , 1 , 96) & not any(vG8m08 , 1 , 96) & not any(vG8m09 , 1 , 96) & not any(vG8m10 , 1
, 96) & not any(vG8m11 , 1 , 96) & not any(vG8m12 , 1 , 96) & not any(vG8m13 , 1 , 96) & not any(vG8m14 , 1 , 96) & not any(vG8m15 , 1 , 96) & not any(vG8m16
, 1 , 96) & not any(vG8m88 , 1 , 96) & not any(vG9m01 , 1 , 96) & not any(vG9m02 , 1 , 96) & not any(vG9m03 , 1 , 96) & not any(vG9m04 , 1 , 96)
& not any(vG9m05 , 1 , 96) & not any(vG9m06 , 1 , 96) & not any(vG9m07 , 1 , 96) & not any(vG9m08 , 1 , 96) & not any(vG9m09 , 1 , 96) & not any(vG9m10 , 1
, 96) & not any(vG9m11 , 1 , 96) & not any(vG9m12 , 1 , 96) & not any(vG9m13 , 1 , 96) & not any(vG9m88 , 1 , 96) & not any(vG10m01 , 1 , 96) & not any(vG10m02
, 1 , 96) & not any(vG10m03 , 1 , 96) & not any(vG10m04 , 1 , 96) & not any(vG10m05 , 1 , 96) & not any(vG10m06 , 1 , 96) & not any(vG10m07 , 1 , 96)
& not any(vG10m08 , 1 , 96) & not any(vG10m09 , 1 , 96) & not any(vG10m10 , 1 , 96) & not any(vG10m11 , 1 , 96) & not any(vG10m12 , 1 , 96) & not any(vG10m13
, 1 , 96) & not any(vG10m14 , 1 , 96) & not any(vG10m15 , 1 , 96) & not any(vG10m16 , 1 , 96) & not any(vG10m17 , 1 , 96) & not any(vG10m18 , 1 , 96)
& not any(vG10m19 , 1 , 96) & not any(vG10m88 , 1 , 96) & not any(vG11m01 , 1 , 96) & not any(vG11m02 , 1 , 96) & not any(vG11m03 , 1 , 96) & not any(vG11m04
, 1 , 96) & not any(vG11m05 , 1 , 96) & not any(vG11m88 , 1 , 96)) & any(0 , vG4_96).
compute m1390=concat(
  "vG7m01=", string(vG7m01,n2), ",vG7m02=", string(vG7m02,n2), ",vG7m03=", string(vG7m03,n2), ",vG7m04=", string(vG7m04,n2), ",vG7m05=", string(vG7m05,n2),
  ",vG7m06=", string(vG7m06,n2), ",vG7m07=", string(vG7m07,n2), ",vG7m08=", string(vG7m08,n2), ",vG7m09=", string(vG7m09,n2), ",vG7m10=", string(vG7m10,n2),
  ",vG7m11=", string(vG7m11,n2), ",vG7m12=", string(vG7m12,n2), ",vG7m88=", string(vG7m88,n2), ",vG8m01=", string(vG8m01,n2), ",vG8m02=", string(vG8m02,n2),
  ",vG8m03=", string(vG8m03,n2), ",vG8m04=", string(vG8m04,n2), ",vG8m05=", string(vG8m05,n2), ",vG8m06=", string(vG8m06,n2), ",vG8m07=", string(vG8m07,n2),
  ",vG8m08=", string(vG8m08,n2), ",vG8m09=", string(vG8m09,n2), ",vG8m10=", string(vG8m10,n2), ",vG8m11=", string(vG8m11,n2), ",vG8m12=", string(vG8m12,n2),
  ",vG8m13=", string(vG8m13,n2), ",vG8m14=", string(vG8m14,n2), ",vG8m15=", string(vG8m15,n2), ",vG8m16=", string(vG8m16,n2), ",vG8m88=", string(vG8m88,n2),
  ",vG9m01=", string(vG9m01,n2), ",vG9m02=", string(vG9m02,n2), ",vG9m03=", string(vG9m03,n2), ",vG9m04=", string(vG9m04,n2), ",vG9m05=", string(vG9m05,n2),
  ",vG9m06=", string(vG9m06,n2), ",vG9m07=", string(vG9m07,n2), ",vG9m08=", string(vG9m08,n2), ",vG9m09=", string(vG9m09,n2), ",vG9m10=", string(vG9m10,n2),
  ",vG9m11=", string(vG9m11,n2), ",vG9m12=", string(vG9m12,n2), ",vG9m13=", string(vG9m13,n2), ",vG9m88=", string(vG9m88,n2), ",vG10m01=", string(vG10m01,n2),
  ",vG10m02=", string(vG10m02,n2), ",vG10m03=", string(vG10m03,n2), ",vG10m04=", string(vG10m04,n2), ",vG10m05=", string(vG10m05,n2), ",vG10m06=",
  string(vG10m06,n2), ",vG10m07=", string(vG10m07,n2), ",vG10m08=", string(vG10m08,n2), ",vG10m09=", string(vG10m09,n2), ",vG10m10=", string(vG10m10,n2),
  ",vG10m11=", string(vG10m11,n2), ",vG10m12=", string(vG10m12,n2), ",vG10m13=", string(vG10m13,n2), ",vG10m14=", string(vG10m14,n2), ",vG10m15=",
  string(vG10m15,n2), ",vG10m16=", string(vG10m16,n2), ",vG10m17=", string(vG10m17,n2), ",vG10m18=", string(vG10m18,n2), ",vG10m19=", string(vG10m19,n2),
  ",vG10m88=", string(vG10m88,n2), ",vG11m01=", string(vG11m01,n2), ",vG11m02=", string(vG11m02,n2), ",vG11m03=", string(vG11m03,n2), ",vG11m04=",
  string(vG11m04,n2), ",vG11m05=", string(vG11m05,n2), ",vG11m88=", string(vG11m88,n2), ",vG4=", string(vG4,n4)
).
compute p1390=concat(
  "vG7m01~=1 & vG7m02~=1 & vG7m03~=1 & vG7m04~=1 & vG7m05~=1 & vG7m06~=1 & vG7m07~=1 & vG7m08~=1 & vG7m",
  "09~=1 & vG7m10~=1 & vG7m11~=1 & vG7m12~=1 & vG7m88~=1 & vG8m01~=1 & vG8m02~=1 & vG8m03~=1 & vG8m04~=",
  "1 & vG8m05~=1 & vG8m06~=1 & vG8m07~=1 & vG8m08~=1 & vG8m09~=1 & vG8m10~=1 & vG8m11~=1 & vG8m12~=1 & ",
  "vG8m13~=1 & vG8m14~=1 & vG8m15~=1 & vG8m16~=1 & vG8m88~=1 & vG9m01~=1 & vG9m02~=1 & vG9m03~=1 & vG9m",
  "04~=1 & vG9m05~=1 & vG9m06~=1 & vG9m07~=1 & vG9m08~=1 & vG9m09~=1 & vG9m10~=1 & vG9m11~=1 & vG9m12~=",
  "1 & vG9m13~=1 & vG9m88~=1 & vG10m01~=1 & vG10m02~=1 & vG10m03~=1 & vG10m04~=1 & vG10m05~=1 & vG10m06",
  "~=1 & vG10m07~=1 & vG10m08~=1 & vG10m09~=1 & vG10m10~=1 & vG10m11~=1 & vG10m12~=1 & vG10m13~=1 & vG1",
  "0m14~=1 & vG10m15~=1 & vG10m16~=1 & vG10m17~=1 & vG10m18~=1 & vG10m19~=1 & vG10m88~=1 & vG11m01~=1 &",
  " vG11m02~=1 & vG11m03~=1 & vG11m04~=1 & vG11m05~=1 & vG11m88~=1 & vG7m01~=96 & vG7m02~=96 & vG7m03~=",
  "96 & vG7m04~=96 & vG7m05~=96 & vG7m06~=96 & vG7m07~=96 & vG7m08~=96 & vG7m09~=96 & vG7m10~=96 & vG7m",
  "11~=96 & vG7m12~=96 & vG7m88~=96 & vG8m01~=96 & vG8m02~=96 & vG8m03~=96 & vG8m04~=96 & vG8m05~=96 & ",
  "vG8m06~=96 & vG8m07~=96 & vG8m08~=96 & vG8m09~=96 & vG8m10~=96 & vG8m11~=96 & vG8m12~=96 & vG8m13~=9",
  "6 & vG8m14~=96 & vG8m15~=96 & vG8m16~=96 & vG8m88~=96 & vG9m01~=96 & vG9m02~=96 & vG9m03~=96 & vG9m0",
  "4~=96 & vG9m05~=96 & vG9m06~=96 & vG9m07~=96 & vG9m08~=96 & vG9m09~=96 & vG9m10~=96 & vG9m11~=96 & v",
  "G9m12~=96 & vG9m13~=96 & vG9m88~=96 & vG10m01~=96 & vG10m02~=96 & vG10m03~=96 & vG10m04~=96 & vG10m0",
  "5~=96 & vG10m06~=96 & vG10m07~=96 & vG10m08~=96 & vG10m09~=96 & vG10m10~=96 & vG10m11~=96 & vG10m12~",
  "=96 & vG10m13~=96 & vG10m14~=96 & vG10m15~=96 & vG10m16~=96 & vG10m17~=96 & vG10m18~=96 & vG10m19~=9",
  "6 & vG10m88~=96 & vG11m01~=96 & vG11m02~=96 & vG11m03~=96 & vG11m04~=96 & vG11m05~=96 & vG11m88~=96，",
  "不應答vG4而答"
).
end if.

* logic check show vG5.
do if (any(vG7m01 , 1) | any(vG7m02 , 1) | any(vG7m03 , 1) | any(vG7m04 , 1) | any(vG7m05 , 1) | any(vG7m06 , 1) | any(vG7m07 , 1) | any(vG7m08 , 1)
| any(vG7m09 , 1) | any(vG7m10 , 1) | any(vG7m11 , 1) | any(vG7m12 , 1) | any(vG7m88 , 1) | any(vG8m01 , 1) | any(vG8m02 , 1) | any(vG8m03 , 1) | any(vG8m04
, 1) | any(vG8m05 , 1) | any(vG8m06 , 1) | any(vG8m07 , 1) | any(vG8m08 , 1) | any(vG8m09 , 1) | any(vG8m10 , 1) | any(vG8m11 , 1) | any(vG8m12 , 1)
| any(vG8m13 , 1) | any(vG8m14 , 1) | any(vG8m15 , 1) | any(vG8m16 , 1) | any(vG8m88 , 1) | any(vG9m01 , 1) | any(vG9m02 , 1) | any(vG9m03 , 1) | any(vG9m04
, 1) | any(vG9m05 , 1) | any(vG9m06 , 1) | any(vG9m07 , 1) | any(vG9m08 , 1) | any(vG9m09 , 1) | any(vG9m10 , 1) | any(vG9m11 , 1) | any(vG9m12 , 1)
| any(vG9m13 , 1) | any(vG9m88 , 1) | any(vG10m01 , 1) | any(vG10m02 , 1) | any(vG10m03 , 1) | any(vG10m04 , 1) | any(vG10m05 , 1) | any(vG10m06 , 1)
| any(vG10m07 , 1) | any(vG10m08 , 1) | any(vG10m09 , 1) | any(vG10m10 , 1) | any(vG10m11 , 1) | any(vG10m12 , 1) | any(vG10m13 , 1) | any(vG10m14 , 1)
| any(vG10m15 , 1) | any(vG10m16 , 1) | any(vG10m17 , 1) | any(vG10m18 , 1) | any(vG10m19 , 1) | any(vG10m88 , 1) | any(vG11m01 , 1) | any(vG11m02 , 1)
| any(vG11m03 , 1) | any(vG11m04 , 1) | any(vG11m05 , 1) | any(vG11m88 , 1)) & any(1 , vG5_96).
compute m1391=concat(
  "vG7m01=", string(vG7m01,n2), ",vG7m02=", string(vG7m02,n2), ",vG7m03=", string(vG7m03,n2), ",vG7m04=", string(vG7m04,n2), ",vG7m05=", string(vG7m05,n2),
  ",vG7m06=", string(vG7m06,n2), ",vG7m07=", string(vG7m07,n2), ",vG7m08=", string(vG7m08,n2), ",vG7m09=", string(vG7m09,n2), ",vG7m10=", string(vG7m10,n2),
  ",vG7m11=", string(vG7m11,n2), ",vG7m12=", string(vG7m12,n2), ",vG7m88=", string(vG7m88,n2), ",vG8m01=", string(vG8m01,n2), ",vG8m02=", string(vG8m02,n2),
  ",vG8m03=", string(vG8m03,n2), ",vG8m04=", string(vG8m04,n2), ",vG8m05=", string(vG8m05,n2), ",vG8m06=", string(vG8m06,n2), ",vG8m07=", string(vG8m07,n2),
  ",vG8m08=", string(vG8m08,n2), ",vG8m09=", string(vG8m09,n2), ",vG8m10=", string(vG8m10,n2), ",vG8m11=", string(vG8m11,n2), ",vG8m12=", string(vG8m12,n2),
  ",vG8m13=", string(vG8m13,n2), ",vG8m14=", string(vG8m14,n2), ",vG8m15=", string(vG8m15,n2), ",vG8m16=", string(vG8m16,n2), ",vG8m88=", string(vG8m88,n2),
  ",vG9m01=", string(vG9m01,n2), ",vG9m02=", string(vG9m02,n2), ",vG9m03=", string(vG9m03,n2), ",vG9m04=", string(vG9m04,n2), ",vG9m05=", string(vG9m05,n2),
  ",vG9m06=", string(vG9m06,n2), ",vG9m07=", string(vG9m07,n2), ",vG9m08=", string(vG9m08,n2), ",vG9m09=", string(vG9m09,n2), ",vG9m10=", string(vG9m10,n2),
  ",vG9m11=", string(vG9m11,n2), ",vG9m12=", string(vG9m12,n2), ",vG9m13=", string(vG9m13,n2), ",vG9m88=", string(vG9m88,n2), ",vG10m01=", string(vG10m01,n2),
  ",vG10m02=", string(vG10m02,n2), ",vG10m03=", string(vG10m03,n2), ",vG10m04=", string(vG10m04,n2), ",vG10m05=", string(vG10m05,n2), ",vG10m06=",
  string(vG10m06,n2), ",vG10m07=", string(vG10m07,n2), ",vG10m08=", string(vG10m08,n2), ",vG10m09=", string(vG10m09,n2), ",vG10m10=", string(vG10m10,n2),
  ",vG10m11=", string(vG10m11,n2), ",vG10m12=", string(vG10m12,n2), ",vG10m13=", string(vG10m13,n2), ",vG10m14=", string(vG10m14,n2), ",vG10m15=",
  string(vG10m15,n2), ",vG10m16=", string(vG10m16,n2), ",vG10m17=", string(vG10m17,n2), ",vG10m18=", string(vG10m18,n2), ",vG10m19=", string(vG10m19,n2),
  ",vG10m88=", string(vG10m88,n2), ",vG11m01=", string(vG11m01,n2), ",vG11m02=", string(vG11m02,n2), ",vG11m03=", string(vG11m03,n2), ",vG11m04=",
  string(vG11m04,n2), ",vG11m05=", string(vG11m05,n2), ",vG11m88=", string(vG11m88,n2), ",vG5=", string(vG5,n5)
).
compute p1391=concat(
  "vG7m01 in 1 | vG7m02 in 1 | vG7m03 in 1 | vG7m04 in 1 | vG7m05 in 1 | vG7m06 in 1 | vG7m07 in 1 | vG",
  "7m08 in 1 | vG7m09 in 1 | vG7m10 in 1 | vG7m11 in 1 | vG7m12 in 1 | vG7m88 in 1 | vG8m01 in 1 | vG8m",
  "02 in 1 | vG8m03 in 1 | vG8m04 in 1 | vG8m05 in 1 | vG8m06 in 1 | vG8m07 in 1 | vG8m08 in 1 | vG8m09",
  " in 1 | vG8m10 in 1 | vG8m11 in 1 | vG8m12 in 1 | vG8m13 in 1 | vG8m14 in 1 | vG8m15 in 1 | vG8m16 i",
  "n 1 | vG8m88 in 1 | vG9m01 in 1 | vG9m02 in 1 | vG9m03 in 1 | vG9m04 in 1 | vG9m05 in 1 | vG9m06 in ",
  "1 | vG9m07 in 1 | vG9m08 in 1 | vG9m09 in 1 | vG9m10 in 1 | vG9m11 in 1 | vG9m12 in 1 | vG9m13 in 1 ",
  "| vG9m88 in 1 | vG10m01 in 1 | vG10m02 in 1 | vG10m03 in 1 | vG10m04 in 1 | vG10m05 in 1 | vG10m06 i",
  "n 1 | vG10m07 in 1 | vG10m08 in 1 | vG10m09 in 1 | vG10m10 in 1 | vG10m11 in 1 | vG10m12 in 1 | vG10",
  "m13 in 1 | vG10m14 in 1 | vG10m15 in 1 | vG10m16 in 1 | vG10m17 in 1 | vG10m18 in 1 | vG10m19 in 1 |",
  " vG10m88 in 1 | vG11m01 in 1 | vG11m02 in 1 | vG11m03 in 1 | vG11m04 in 1 | vG11m05 in 1 | vG11m88 i",
  "n 1，應答vG5而未答"
).
end if.

* logic check hide vG5.
do if (not any(vG7m01 , 1 , 96) & not any(vG7m02 , 1 , 96) & not any(vG7m03 , 1 , 96) & not any(vG7m04 , 1 , 96) & not any(vG7m05 , 1 , 96) & not any(vG7m06 , 1
, 96) & not any(vG7m07 , 1 , 96) & not any(vG7m08 , 1 , 96) & not any(vG7m09 , 1 , 96) & not any(vG7m10 , 1 , 96) & not any(vG7m11 , 1 , 96) & not any(vG7m12
, 1 , 96) & not any(vG7m88 , 1 , 96) & not any(vG8m01 , 1 , 96) & not any(vG8m02 , 1 , 96) & not any(vG8m03 , 1 , 96) & not any(vG8m04 , 1 , 96)
& not any(vG8m05 , 1 , 96) & not any(vG8m06 , 1 , 96) & not any(vG8m07 , 1 , 96) & not any(vG8m08 , 1 , 96) & not any(vG8m09 , 1 , 96) & not any(vG8m10 , 1
, 96) & not any(vG8m11 , 1 , 96) & not any(vG8m12 , 1 , 96) & not any(vG8m13 , 1 , 96) & not any(vG8m14 , 1 , 96) & not any(vG8m15 , 1 , 96) & not any(vG8m16
, 1 , 96) & not any(vG8m88 , 1 , 96) & not any(vG9m01 , 1 , 96) & not any(vG9m02 , 1 , 96) & not any(vG9m03 , 1 , 96) & not any(vG9m04 , 1 , 96)
& not any(vG9m05 , 1 , 96) & not any(vG9m06 , 1 , 96) & not any(vG9m07 , 1 , 96) & not any(vG9m08 , 1 , 96) & not any(vG9m09 , 1 , 96) & not any(vG9m10 , 1
, 96) & not any(vG9m11 , 1 , 96) & not any(vG9m12 , 1 , 96) & not any(vG9m13 , 1 , 96) & not any(vG9m88 , 1 , 96) & not any(vG10m01 , 1 , 96) & not any(vG10m02
, 1 , 96) & not any(vG10m03 , 1 , 96) & not any(vG10m04 , 1 , 96) & not any(vG10m05 , 1 , 96) & not any(vG10m06 , 1 , 96) & not any(vG10m07 , 1 , 96)
& not any(vG10m08 , 1 , 96) & not any(vG10m09 , 1 , 96) & not any(vG10m10 , 1 , 96) & not any(vG10m11 , 1 , 96) & not any(vG10m12 , 1 , 96) & not any(vG10m13
, 1 , 96) & not any(vG10m14 , 1 , 96) & not any(vG10m15 , 1 , 96) & not any(vG10m16 , 1 , 96) & not any(vG10m17 , 1 , 96) & not any(vG10m18 , 1 , 96)
& not any(vG10m19 , 1 , 96) & not any(vG10m88 , 1 , 96) & not any(vG11m01 , 1 , 96) & not any(vG11m02 , 1 , 96) & not any(vG11m03 , 1 , 96) & not any(vG11m04
, 1 , 96) & not any(vG11m05 , 1 , 96) & not any(vG11m88 , 1 , 96)) & any(0 , vG5_96).
compute m1392=concat(
  "vG7m01=", string(vG7m01,n2), ",vG7m02=", string(vG7m02,n2), ",vG7m03=", string(vG7m03,n2), ",vG7m04=", string(vG7m04,n2), ",vG7m05=", string(vG7m05,n2),
  ",vG7m06=", string(vG7m06,n2), ",vG7m07=", string(vG7m07,n2), ",vG7m08=", string(vG7m08,n2), ",vG7m09=", string(vG7m09,n2), ",vG7m10=", string(vG7m10,n2),
  ",vG7m11=", string(vG7m11,n2), ",vG7m12=", string(vG7m12,n2), ",vG7m88=", string(vG7m88,n2), ",vG8m01=", string(vG8m01,n2), ",vG8m02=", string(vG8m02,n2),
  ",vG8m03=", string(vG8m03,n2), ",vG8m04=", string(vG8m04,n2), ",vG8m05=", string(vG8m05,n2), ",vG8m06=", string(vG8m06,n2), ",vG8m07=", string(vG8m07,n2),
  ",vG8m08=", string(vG8m08,n2), ",vG8m09=", string(vG8m09,n2), ",vG8m10=", string(vG8m10,n2), ",vG8m11=", string(vG8m11,n2), ",vG8m12=", string(vG8m12,n2),
  ",vG8m13=", string(vG8m13,n2), ",vG8m14=", string(vG8m14,n2), ",vG8m15=", string(vG8m15,n2), ",vG8m16=", string(vG8m16,n2), ",vG8m88=", string(vG8m88,n2),
  ",vG9m01=", string(vG9m01,n2), ",vG9m02=", string(vG9m02,n2), ",vG9m03=", string(vG9m03,n2), ",vG9m04=", string(vG9m04,n2), ",vG9m05=", string(vG9m05,n2),
  ",vG9m06=", string(vG9m06,n2), ",vG9m07=", string(vG9m07,n2), ",vG9m08=", string(vG9m08,n2), ",vG9m09=", string(vG9m09,n2), ",vG9m10=", string(vG9m10,n2),
  ",vG9m11=", string(vG9m11,n2), ",vG9m12=", string(vG9m12,n2), ",vG9m13=", string(vG9m13,n2), ",vG9m88=", string(vG9m88,n2), ",vG10m01=", string(vG10m01,n2),
  ",vG10m02=", string(vG10m02,n2), ",vG10m03=", string(vG10m03,n2), ",vG10m04=", string(vG10m04,n2), ",vG10m05=", string(vG10m05,n2), ",vG10m06=",
  string(vG10m06,n2), ",vG10m07=", string(vG10m07,n2), ",vG10m08=", string(vG10m08,n2), ",vG10m09=", string(vG10m09,n2), ",vG10m10=", string(vG10m10,n2),
  ",vG10m11=", string(vG10m11,n2), ",vG10m12=", string(vG10m12,n2), ",vG10m13=", string(vG10m13,n2), ",vG10m14=", string(vG10m14,n2), ",vG10m15=",
  string(vG10m15,n2), ",vG10m16=", string(vG10m16,n2), ",vG10m17=", string(vG10m17,n2), ",vG10m18=", string(vG10m18,n2), ",vG10m19=", string(vG10m19,n2),
  ",vG10m88=", string(vG10m88,n2), ",vG11m01=", string(vG11m01,n2), ",vG11m02=", string(vG11m02,n2), ",vG11m03=", string(vG11m03,n2), ",vG11m04=",
  string(vG11m04,n2), ",vG11m05=", string(vG11m05,n2), ",vG11m88=", string(vG11m88,n2), ",vG5=", string(vG5,n5)
).
compute p1392=concat(
  "vG7m01~=1 & vG7m02~=1 & vG7m03~=1 & vG7m04~=1 & vG7m05~=1 & vG7m06~=1 & vG7m07~=1 & vG7m08~=1 & vG7m",
  "09~=1 & vG7m10~=1 & vG7m11~=1 & vG7m12~=1 & vG7m88~=1 & vG8m01~=1 & vG8m02~=1 & vG8m03~=1 & vG8m04~=",
  "1 & vG8m05~=1 & vG8m06~=1 & vG8m07~=1 & vG8m08~=1 & vG8m09~=1 & vG8m10~=1 & vG8m11~=1 & vG8m12~=1 & ",
  "vG8m13~=1 & vG8m14~=1 & vG8m15~=1 & vG8m16~=1 & vG8m88~=1 & vG9m01~=1 & vG9m02~=1 & vG9m03~=1 & vG9m",
  "04~=1 & vG9m05~=1 & vG9m06~=1 & vG9m07~=1 & vG9m08~=1 & vG9m09~=1 & vG9m10~=1 & vG9m11~=1 & vG9m12~=",
  "1 & vG9m13~=1 & vG9m88~=1 & vG10m01~=1 & vG10m02~=1 & vG10m03~=1 & vG10m04~=1 & vG10m05~=1 & vG10m06",
  "~=1 & vG10m07~=1 & vG10m08~=1 & vG10m09~=1 & vG10m10~=1 & vG10m11~=1 & vG10m12~=1 & vG10m13~=1 & vG1",
  "0m14~=1 & vG10m15~=1 & vG10m16~=1 & vG10m17~=1 & vG10m18~=1 & vG10m19~=1 & vG10m88~=1 & vG11m01~=1 &",
  " vG11m02~=1 & vG11m03~=1 & vG11m04~=1 & vG11m05~=1 & vG11m88~=1 & vG7m01~=96 & vG7m02~=96 & vG7m03~=",
  "96 & vG7m04~=96 & vG7m05~=96 & vG7m06~=96 & vG7m07~=96 & vG7m08~=96 & vG7m09~=96 & vG7m10~=96 & vG7m",
  "11~=96 & vG7m12~=96 & vG7m88~=96 & vG8m01~=96 & vG8m02~=96 & vG8m03~=96 & vG8m04~=96 & vG8m05~=96 & ",
  "vG8m06~=96 & vG8m07~=96 & vG8m08~=96 & vG8m09~=96 & vG8m10~=96 & vG8m11~=96 & vG8m12~=96 & vG8m13~=9",
  "6 & vG8m14~=96 & vG8m15~=96 & vG8m16~=96 & vG8m88~=96 & vG9m01~=96 & vG9m02~=96 & vG9m03~=96 & vG9m0",
  "4~=96 & vG9m05~=96 & vG9m06~=96 & vG9m07~=96 & vG9m08~=96 & vG9m09~=96 & vG9m10~=96 & vG9m11~=96 & v",
  "G9m12~=96 & vG9m13~=96 & vG9m88~=96 & vG10m01~=96 & vG10m02~=96 & vG10m03~=96 & vG10m04~=96 & vG10m0",
  "5~=96 & vG10m06~=96 & vG10m07~=96 & vG10m08~=96 & vG10m09~=96 & vG10m10~=96 & vG10m11~=96 & vG10m12~",
  "=96 & vG10m13~=96 & vG10m14~=96 & vG10m15~=96 & vG10m16~=96 & vG10m17~=96 & vG10m18~=96 & vG10m19~=9",
  "6 & vG10m88~=96 & vG11m01~=96 & vG11m02~=96 & vG11m03~=96 & vG11m04~=96 & vG11m05~=96 & vG11m88~=96，",
  "不應答vG5而答"
).
end if.

* logic check hide vQ9.
do if (any(vQ5,2,97,98) | (any(vG7m90,1) & any(vG8m90,1) & any(vG9m90,1) & any(vG10m90,1) & any(vG11m90,1))) & any(0,vQ9_96).
compute m1393=concat(
  "vQ5=", string(vQ5,n2), ",vG7m90=", string(vG7m90,n2), ",vG8m90=", string(vG8m90,n2), ",vG9m90=", string(vG9m90,n2), ",vG10m90=", string(vG10m90,n2),
  ",vG11m90=", string(vG11m90,n2), ",vQ9=", string(vQ9,n2)
).
compute p1393="vQ5 in 2 | vQ5 in 97 | vQ5 in 98 | (vG7m90 in 1 & vG8m90 in 1 & vG9m90 in 1 & vG10m90 in 1 & vG11m90 in 1)，不應答vQ9而答".
end if.

* logic check show vQ9.
do if ((not any(vQ5 , 2 , 97 , 98) & (vG7m90~=1 | vG8m90~=1 | vG9m90~=1 | vG10m90~=1 | not any(vG11m90 , 1 , 96))) & vQ5~=96 & vG7m90~=96 & vG8m90~=96
& vG9m90~=96 & vG10m90~=96) & any(1 , vQ9_96).
compute m1394=concat(
  "vQ5=", string(vQ5,n2), ",vG7m90=", string(vG7m90,n2), ",vG8m90=", string(vG8m90,n2), ",vG9m90=", string(vG9m90,n2), ",vG10m90=", string(vG10m90,n2),
  ",vG11m90=", string(vG11m90,n2), ",vQ9=", string(vQ9,n2)
).
compute p1394=concat(
  "(vQ5~=2 & vQ5~=97 & vQ5~=98 & (vG7m90~=1 | vG8m90~=1 | vG9m90~=1 | vG10m90~=1 | vG11m90~=1)) & vQ5~=",
  "96 & vG7m90~=96 & vG8m90~=96 & vG9m90~=96 & vG10m90~=96 & vG11m90~=96，應答vQ9而未答"
).
end if.

* logic check hide vQ14.
do if (any(vQ10,2,97,98) | (any(vG7m90,1) & any(vG8m90,1) & any(vG9m90,1) & any(vG10m90,1) & any(vG11m90,1)) | any(vQ9,1)) & any(0,vQ14_96).
compute m1395=concat(
  "vQ10=", string(vQ10,n2), ",vG7m90=", string(vG7m90,n2), ",vG8m90=", string(vG8m90,n2), ",vG9m90=", string(vG9m90,n2), ",vG10m90=", string(vG10m90,n2),
  ",vG11m90=", string(vG11m90,n2), ",vQ9=", string(vQ9,n2), ",vQ14=", string(vQ14,n2)
).
compute p1395="vQ10 in 2 | vQ10 in 97 | vQ10 in 98 | (vG7m90 in 1 & vG8m90 in 1 & vG9m90 in 1 & vG10m90 in 1 & vG11m90 in 1) | vQ9 in 1，不應答vQ14而答".
end if.

* logic check show vQ14.
do if ((not any(vQ10 , 2 , 97 , 98) & (vG7m90~=1 | vG8m90~=1 | vG9m90~=1 | vG10m90~=1 | not any(vG11m90 , 1 , 96)) & not any(vQ9 , 1 , 96)) & vQ10~=96
& vG7m90~=96 & vG8m90~=96 & vG9m90~=96 & vG10m90~=96) & any(1 , vQ14_96).
compute m1396=concat(
  "vQ10=", string(vQ10,n2), ",vG7m90=", string(vG7m90,n2), ",vG8m90=", string(vG8m90,n2), ",vG9m90=", string(vG9m90,n2), ",vG10m90=", string(vG10m90,n2),
  ",vG11m90=", string(vG11m90,n2), ",vQ9=", string(vQ9,n2), ",vQ14=", string(vQ14,n2)
).
compute p1396=concat(
  "(vQ10~=2 & vQ10~=97 & vQ10~=98 & (vG7m90~=1 | vG8m90~=1 | vG9m90~=1 | vG10m90~=1 | vG11m90~=1) & vQ9",
  "~=1) & vQ10~=96 & vG7m90~=96 & vG8m90~=96 & vG9m90~=96 & vG10m90~=96 & vG11m90~=96 & vQ9~=96，應答vQ14而",
  "未答"
).
end if.

* logic check hide vQ19.
do if (any(vQ15,2,97,98) | (any(vG7m90,1) & any(vG8m90,1) & any(vG9m90,1) & any(vG10m90,1) & any(vG11m90,1))) & any(0,vQ19_96).
compute m1397=concat(
  "vQ15=", string(vQ15,n2), ",vG7m90=", string(vG7m90,n2), ",vG8m90=", string(vG8m90,n2), ",vG9m90=", string(vG9m90,n2), ",vG10m90=", string(vG10m90,n2),
  ",vG11m90=", string(vG11m90,n2), ",vQ19=", string(vQ19,n2)
).
compute p1397="vQ15 in 2 | vQ15 in 97 | vQ15 in 98 | (vG7m90 in 1 & vG8m90 in 1 & vG9m90 in 1 & vG10m90 in 1 & vG11m90 in 1)，不應答vQ19而答".
end if.

* logic check show vQ19.
do if ((not any(vQ15 , 2 , 97 , 98) & (vG7m90~=1 | vG8m90~=1 | vG9m90~=1 | vG10m90~=1 | not any(vG11m90 , 1 , 96))) & vQ15~=96 & vG7m90~=96 & vG8m90~=96
& vG9m90~=96 & vG10m90~=96) & any(1 , vQ19_96).
compute m1398=concat(
  "vQ15=", string(vQ15,n2), ",vG7m90=", string(vG7m90,n2), ",vG8m90=", string(vG8m90,n2), ",vG9m90=", string(vG9m90,n2), ",vG10m90=", string(vG10m90,n2),
  ",vG11m90=", string(vG11m90,n2), ",vQ19=", string(vQ19,n2)
).
compute p1398=concat(
  "(vQ15~=2 & vQ15~=97 & vQ15~=98 & (vG7m90~=1 | vG8m90~=1 | vG9m90~=1 | vG10m90~=1 | vG11m90~=1)) & vQ",
  "15~=96 & vG7m90~=96 & vG8m90~=96 & vG9m90~=96 & vG10m90~=96 & vG11m90~=96，應答vQ19而未答"
).
end if.

* logic check limit vG5.
do if not any(mod(trunc(vG5/10),10),0,1,2,3,4,5).
compute m1399=concat("vG5=",string(vG5,n5)).
compute p1399="vG5第3碼應為0,1,2,3,4,5".
end if.

* logic check hide vB2.
do if (any(vB1,0)) & any(0,vB2_96).
compute m1400=concat("vB1=",string(vB1,n4),",vB2=",string(vB2,n5)).
compute p1400="vB1 in 0，不應答vB2而答".
end if.

* logic check show vB2.
do if (vB1~=0) & any(1,vB2_96).
compute m1401=concat("vB1=",string(vB1,n4),",vB2=",string(vB2,n5)).
compute p1401="vB1~=0，應答vB2而未答".
end if.

* logic check hide vB5.
do if (any(vB1,0) & any(vB3,0)) & any(0,vB5_96).
compute m1402=concat("vB1=",string(vB1,n4),",vB3=",string(vB3,n4),",vB5=",string(vB5,n4)).
compute p1402="vB1 in 0 & vB3 in 0，不應答vB5而答".
end if.

* logic check show vB5.
do if (vB1~=0 | vB3~=0) & any(1,vB5_96).
compute m1403=concat("vB1=",string(vB1,n4),",vB3=",string(vB3,n4),",vB5=",string(vB5,n4)).
compute p1403="vB1~=0 | vB3~=0，應答vB5而未答".
end if.

* logic check hide vB8m01,vB8m02,vB8m03,vB8m04,vB8m05,vB8m06,vB8m07,vB8m08,vB8m09,vB8m10,vB8m88.
do if (any(vB1 , 0) & any(vB3 , 0)) & (any(0 , vB8m01_96) | any(0 , vB8m02_96) | any(0 , vB8m03_96) | any(0 , vB8m04_96) | any(0 , vB8m05_96) | any(0
, vB8m06_96) | any(0 , vB8m07_96) | any(0 , vB8m08_96) | any(0 , vB8m09_96) | any(0 , vB8m10_96) | any(0 , vB8m88_96)).
compute m1404=concat(
  "vB1=", string(vB1,n4), ",vB3=", string(vB3,n4), ",vB8m01=", string(vB8m01,n2), ",vB8m02=", string(vB8m02,n2), ",vB8m03=", string(vB8m03,n2), ",vB8m04=",
  string(vB8m04,n2), ",vB8m05=", string(vB8m05,n2), ",vB8m06=", string(vB8m06,n2), ",vB8m07=", string(vB8m07,n2), ",vB8m08=", string(vB8m08,n2), ",vB8m09=",
  string(vB8m09,n2), ",vB8m10=", string(vB8m10,n2), ",vB8m88=", string(vB8m88,n2)
).
compute p1404="vB1 in 0 & vB3 in 0，不應答vB8m01,vB8m02,vB8m03,vB8m04,vB8m05,vB8m06,vB8m07,vB8m08,vB8m09,vB8m10,vB8m88而答".
end if.

* logic check show vB8m01,vB8m02,vB8m03,vB8m04,vB8m05,vB8m06,vB8m07,vB8m08,vB8m09,vB8m10,vB8m88.
do if (vB1~=0 | vB3~=0) & (any(1 , vB8m01_96) | any(1 , vB8m02_96) | any(1 , vB8m03_96) | any(1 , vB8m04_96) | any(1 , vB8m05_96) | any(1 , vB8m06_96) | any(1
, vB8m07_96) | any(1 , vB8m08_96) | any(1 , vB8m09_96) | any(1 , vB8m10_96) | any(1 , vB8m88_96)).
compute m1405=concat(
  "vB1=", string(vB1,n4), ",vB3=", string(vB3,n4), ",vB8m01=", string(vB8m01,n2), ",vB8m02=", string(vB8m02,n2), ",vB8m03=", string(vB8m03,n2), ",vB8m04=",
  string(vB8m04,n2), ",vB8m05=", string(vB8m05,n2), ",vB8m06=", string(vB8m06,n2), ",vB8m07=", string(vB8m07,n2), ",vB8m08=", string(vB8m08,n2), ",vB8m09=",
  string(vB8m09,n2), ",vB8m10=", string(vB8m10,n2), ",vB8m88=", string(vB8m88,n2)
).
compute p1405="vB1~=0 | vB3~=0，應答vB8m01,vB8m02,vB8m03,vB8m04,vB8m05,vB8m06,vB8m07,vB8m08,vB8m09,vB8m10,vB8m88而未答".
end if.

* logic check hide vQ4.
do if (any(vB1,0) & any(vB3,0)) & any(0,vQ4_96).
compute m1406=concat("vB1=",string(vB1,n4),",vB3=",string(vB3,n4),",vQ4=",string(vQ4,n2)).
compute p1406="vB1 in 0 & vB3 in 0，不應答vQ4而答".
end if.

* logic check show vQ4.
do if (vB1~=0 | vB3~=0) & any(1,vQ4_96).
compute m1407=concat("vB1=",string(vB1,n4),",vB3=",string(vB3,n4),",vQ4=",string(vQ4,n2)).
compute p1407="vB1~=0 | vB3~=0，應答vQ4而未答".
end if.

* logic check show vQ20m01,vQ20m02,vQ20m03,vQ20m04,vQ20m05,vQ20m06,vQ20m88,vQ20m90.
do if (any(vQ5 , 2) & any(vQ20m01 , 1) & any(vB1 , 0) & any(vB3 , 0)) & (any(1 , vQ20m01_96) | any(1 , vQ20m02_96) | any(1 , vQ20m03_96) | any(1 , vQ20m04_96)
| any(1 , vQ20m05_96) | any(1 , vQ20m06_96) | any(1 , vQ20m88_96) | any(1 , vQ20m90_96)).
compute m1408=concat(
  "vQ5=", string(vQ5,n2), ",vQ20m01=", string(vQ20m01,n2), ",vB1=", string(vB1,n4), ",vB3=", string(vB3,n4), ",vQ20m02=", string(vQ20m02,n2), ",vQ20m03=",
  string(vQ20m03,n2), ",vQ20m04=", string(vQ20m04,n2), ",vQ20m05=", string(vQ20m05,n2), ",vQ20m06=", string(vQ20m06,n2), ",vQ20m88=", string(vQ20m88,n2),
  ",vQ20m90=", string(vQ20m90,n2)
).
compute p1408="vQ5 in 2 & vQ20m01 in 1 & vB1 in 0 & vB3 in 0，應答vQ20m01,vQ20m02,vQ20m03,vQ20m04,vQ20m05,vQ20m06,vQ20m88,vQ20m90而未答".
end if.

* logic check hide vQ20m01,vQ20m02,vQ20m03,vQ20m04,vQ20m05,vQ20m06,vQ20m88,vQ20m90.
do if ((vQ5~=2 | vQ20m01~=1 | vB1~=0 | vB3~=0) & vQ5~=96 & vQ20m01~=96) & (any(0 , vQ20m01_96) | any(0 , vQ20m02_96) | any(0 , vQ20m03_96) | any(0 , vQ20m04_96)
| any(0 , vQ20m05_96) | any(0 , vQ20m06_96) | any(0 , vQ20m88_96) | any(0 , vQ20m90_96)).
compute m1409=concat(
  "vQ5=", string(vQ5,n2), ",vQ20m01=", string(vQ20m01,n2), ",vB1=", string(vB1,n4), ",vB3=", string(vB3,n4), ",vQ20m02=", string(vQ20m02,n2), ",vQ20m03=",
  string(vQ20m03,n2), ",vQ20m04=", string(vQ20m04,n2), ",vQ20m05=", string(vQ20m05,n2), ",vQ20m06=", string(vQ20m06,n2), ",vQ20m88=", string(vQ20m88,n2),
  ",vQ20m90=", string(vQ20m90,n2)
).
compute p1409="(vQ5~=2 | vQ20m01~=1 | vB1~=0 | vB3~=0) & vQ5~=96 & vQ20m01~=96，不應答vQ20m01,vQ20m02,vQ20m03,vQ20m04,vQ20m05,vQ20m06,vQ20m88,vQ20m90而答".
end if.

* logic check limit vB2.
do if not any(mod(trunc(vB2/10),10),0,1,2,3,4,5).
compute m1410=concat("vB2=",string(vB2,n5)).
compute p1410="vB2第3碼應為0,1,2,3,4,5".
end if.

* logic check hide vB4.
do if (any(vB3,0)) & any(0,vB4_96).
compute m1411=concat("vB3=",string(vB3,n4),",vB4=",string(vB4,n5)).
compute p1411="vB3 in 0，不應答vB4而答".
end if.

* logic check show vB4.
do if (vB3~=0) & any(1,vB4_96).
compute m1412=concat("vB3=",string(vB3,n4),",vB4=",string(vB4,n5)).
compute p1412="vB3~=0，應答vB4而未答".
end if.

* logic check limit vB4.
do if not any(mod(trunc(vB4/10),10),0,1,2,3,4,5).
compute m1413=concat("vB4=",string(vB4,n5)).
compute p1413="vB4第3碼應為0,1,2,3,4,5".
end if.

* logic check hide vB6.
do if (any(vB5,0)) & any(0,vB6_96).
compute m1414=concat("vB5=",string(vB5,n4),",vB6=",string(vB6,n5)).
compute p1414="vB5 in 0，不應答vB6而答".
end if.

* logic check show vB6.
do if (not any(vB5,0,9996)) & any(1,vB6_96).
compute m1415=concat("vB5=",string(vB5,n4),",vB6=",string(vB6,n5)).
compute p1415="vB5~=0 & vB5~=9996，應答vB6而未答".
end if.

* logic check hide vB7am01,vB7am02,vB7am03,vB7am04,vB7am05,vB7am06,vB7am07,vB7am08,vB7am09,vB7am10,vB7am11,vB7am12,vB7am13,vB7am14,vB7am15,vB7am16,vB7am17.
* vB7am18,vB7am19,vB7am20,vB7am21,vB7am22,vB7am23,vB7am24,vB7am25,vB7am26,vB7am27,vB7am28,vB7am29,vB7am30,vB7am31,vB7am32,vB7am33,vB7am34,vB7am35,vB7am36.
* vB7am37,vB7am38,vB7am39,vB7am40,vB7am41,vB7am42,vB7am43,vB7am44,vB7am45,vB7am46,vB7am47,vB7am48,vB7am49,vB7am50,vB7am51,vB7am52,vB7am53,vB7am54,vB7am88.
do if (any(vB5 , 0)) & (any(0 , vB7am01_96) | any(0 , vB7am02_96) | any(0 , vB7am03_96) | any(0 , vB7am04_96) | any(0 , vB7am05_96) | any(0 , vB7am06_96)
| any(0 , vB7am07_96) | any(0 , vB7am08_96) | any(0 , vB7am09_96) | any(0 , vB7am10_96) | any(0 , vB7am11_96) | any(0 , vB7am12_96) | any(0 , vB7am13_96)
| any(0 , vB7am14_96) | any(0 , vB7am15_96) | any(0 , vB7am16_96) | any(0 , vB7am17_96) | any(0 , vB7am18_96) | any(0 , vB7am19_96) | any(0 , vB7am20_96)
| any(0 , vB7am21_96) | any(0 , vB7am22_96) | any(0 , vB7am23_96) | any(0 , vB7am24_96) | any(0 , vB7am25_96) | any(0 , vB7am26_96) | any(0 , vB7am27_96)
| any(0 , vB7am28_96) | any(0 , vB7am29_96) | any(0 , vB7am30_96) | any(0 , vB7am31_96) | any(0 , vB7am32_96) | any(0 , vB7am33_96) | any(0 , vB7am34_96)
| any(0 , vB7am35_96) | any(0 , vB7am36_96) | any(0 , vB7am37_96) | any(0 , vB7am38_96) | any(0 , vB7am39_96) | any(0 , vB7am40_96) | any(0 , vB7am41_96)
| any(0 , vB7am42_96) | any(0 , vB7am43_96) | any(0 , vB7am44_96) | any(0 , vB7am45_96) | any(0 , vB7am46_96) | any(0 , vB7am47_96) | any(0 , vB7am48_96)
| any(0 , vB7am49_96) | any(0 , vB7am50_96) | any(0 , vB7am51_96) | any(0 , vB7am52_96) | any(0 , vB7am53_96) | any(0 , vB7am54_96) | any(0 , vB7am88_96)).
compute m1416=concat(
  "vB5=", string(vB5,n4), ",vB7am01=", string(vB7am01,n2), ",vB7am02=", string(vB7am02,n2), ",vB7am03=", string(vB7am03,n2), ",vB7am04=", string(vB7am04,n2),
  ",vB7am05=", string(vB7am05,n2), ",vB7am06=", string(vB7am06,n2), ",vB7am07=", string(vB7am07,n2), ",vB7am08=", string(vB7am08,n2), ",vB7am09=",
  string(vB7am09,n2), ",vB7am10=", string(vB7am10,n2), ",vB7am11=", string(vB7am11,n2), ",vB7am12=", string(vB7am12,n2), ",vB7am13=", string(vB7am13,n2),
  ",vB7am14=", string(vB7am14,n2), ",vB7am15=", string(vB7am15,n2), ",vB7am16=", string(vB7am16,n2), ",vB7am17=", string(vB7am17,n2), ",vB7am18=",
  string(vB7am18,n2), ",vB7am19=", string(vB7am19,n2), ",vB7am20=", string(vB7am20,n2), ",vB7am21=", string(vB7am21,n2), ",vB7am22=", string(vB7am22,n2),
  ",vB7am23=", string(vB7am23,n2), ",vB7am24=", string(vB7am24,n2), ",vB7am25=", string(vB7am25,n2), ",vB7am26=", string(vB7am26,n2), ",vB7am27=",
  string(vB7am27,n2), ",vB7am28=", string(vB7am28,n2), ",vB7am29=", string(vB7am29,n2), ",vB7am30=", string(vB7am30,n2), ",vB7am31=", string(vB7am31,n2),
  ",vB7am32=", string(vB7am32,n2), ",vB7am33=", string(vB7am33,n2), ",vB7am34=", string(vB7am34,n2), ",vB7am35=", string(vB7am35,n2), ",vB7am36=",
  string(vB7am36,n2), ",vB7am37=", string(vB7am37,n2), ",vB7am38=", string(vB7am38,n2), ",vB7am39=", string(vB7am39,n2), ",vB7am40=", string(vB7am40,n2),
  ",vB7am41=", string(vB7am41,n2), ",vB7am42=", string(vB7am42,n2), ",vB7am43=", string(vB7am43,n2), ",vB7am44=", string(vB7am44,n2), ",vB7am45=",
  string(vB7am45,n2), ",vB7am46=", string(vB7am46,n2), ",vB7am47=", string(vB7am47,n2), ",vB7am48=", string(vB7am48,n2), ",vB7am49=", string(vB7am49,n2),
  ",vB7am50=", string(vB7am50,n2), ",vB7am51=", string(vB7am51,n2), ",vB7am52=", string(vB7am52,n2), ",vB7am53=", string(vB7am53,n2), ",vB7am54=",
  string(vB7am54,n2), ",vB7am88=", string(vB7am88,n2)
).
compute p1416=concat(
  "vB5 in 0，不應答vB7am01,vB7am02,vB7am03,vB7am04,vB7am05,vB7am06,vB7am07,vB7am08,vB7am09,vB7am10,vB7am11,",
  "vB7am12,vB7am13,vB7am14,vB7am15,vB7am16,vB7am17,vB7am18,vB7am19,vB7am20,vB7am21,vB7am22,vB7am23,vB7a",
  "m24,vB7am25,vB7am26,vB7am27,vB7am28,vB7am29,vB7am30,vB7am31,vB7am32,vB7am33,vB7am34,vB7am35,vB7am36,",
  "vB7am37,vB7am38,vB7am39,vB7am40,vB7am41,vB7am42,vB7am43,vB7am44,vB7am45,vB7am46,vB7am47,vB7am48,vB7a",
  "m49,vB7am50,vB7am51,vB7am52,vB7am53,vB7am54,vB7am88而答"
).
end if.

* logic check show vB7am01,vB7am02,vB7am03,vB7am04,vB7am05,vB7am06,vB7am07,vB7am08,vB7am09,vB7am10,vB7am11,vB7am12,vB7am13,vB7am14,vB7am15,vB7am16,vB7am17.
* vB7am18,vB7am19,vB7am20,vB7am21,vB7am22,vB7am23,vB7am24,vB7am25,vB7am26,vB7am27,vB7am28,vB7am29,vB7am30,vB7am31,vB7am32,vB7am33,vB7am34,vB7am35,vB7am36.
* vB7am37,vB7am38,vB7am39,vB7am40,vB7am41,vB7am42,vB7am43,vB7am44,vB7am45,vB7am46,vB7am47,vB7am48,vB7am49,vB7am50,vB7am51,vB7am52,vB7am53,vB7am54,vB7am88.
do if (not any(vB5 , 0 , 9996)) & (any(1 , vB7am01_96) | any(1 , vB7am02_96) | any(1 , vB7am03_96) | any(1 , vB7am04_96) | any(1 , vB7am05_96) | any(1
, vB7am06_96) | any(1 , vB7am07_96) | any(1 , vB7am08_96) | any(1 , vB7am09_96) | any(1 , vB7am10_96) | any(1 , vB7am11_96) | any(1 , vB7am12_96) | any(1
, vB7am13_96) | any(1 , vB7am14_96) | any(1 , vB7am15_96) | any(1 , vB7am16_96) | any(1 , vB7am17_96) | any(1 , vB7am18_96) | any(1 , vB7am19_96) | any(1
, vB7am20_96) | any(1 , vB7am21_96) | any(1 , vB7am22_96) | any(1 , vB7am23_96) | any(1 , vB7am24_96) | any(1 , vB7am25_96) | any(1 , vB7am26_96) | any(1
, vB7am27_96) | any(1 , vB7am28_96) | any(1 , vB7am29_96) | any(1 , vB7am30_96) | any(1 , vB7am31_96) | any(1 , vB7am32_96) | any(1 , vB7am33_96) | any(1
, vB7am34_96) | any(1 , vB7am35_96) | any(1 , vB7am36_96) | any(1 , vB7am37_96) | any(1 , vB7am38_96) | any(1 , vB7am39_96) | any(1 , vB7am40_96) | any(1
, vB7am41_96) | any(1 , vB7am42_96) | any(1 , vB7am43_96) | any(1 , vB7am44_96) | any(1 , vB7am45_96) | any(1 , vB7am46_96) | any(1 , vB7am47_96) | any(1
, vB7am48_96) | any(1 , vB7am49_96) | any(1 , vB7am50_96) | any(1 , vB7am51_96) | any(1 , vB7am52_96) | any(1 , vB7am53_96) | any(1 , vB7am54_96) | any(1
, vB7am88_96)).
compute m1417=concat(
  "vB5=", string(vB5,n4), ",vB7am01=", string(vB7am01,n2), ",vB7am02=", string(vB7am02,n2), ",vB7am03=", string(vB7am03,n2), ",vB7am04=", string(vB7am04,n2),
  ",vB7am05=", string(vB7am05,n2), ",vB7am06=", string(vB7am06,n2), ",vB7am07=", string(vB7am07,n2), ",vB7am08=", string(vB7am08,n2), ",vB7am09=",
  string(vB7am09,n2), ",vB7am10=", string(vB7am10,n2), ",vB7am11=", string(vB7am11,n2), ",vB7am12=", string(vB7am12,n2), ",vB7am13=", string(vB7am13,n2),
  ",vB7am14=", string(vB7am14,n2), ",vB7am15=", string(vB7am15,n2), ",vB7am16=", string(vB7am16,n2), ",vB7am17=", string(vB7am17,n2), ",vB7am18=",
  string(vB7am18,n2), ",vB7am19=", string(vB7am19,n2), ",vB7am20=", string(vB7am20,n2), ",vB7am21=", string(vB7am21,n2), ",vB7am22=", string(vB7am22,n2),
  ",vB7am23=", string(vB7am23,n2), ",vB7am24=", string(vB7am24,n2), ",vB7am25=", string(vB7am25,n2), ",vB7am26=", string(vB7am26,n2), ",vB7am27=",
  string(vB7am27,n2), ",vB7am28=", string(vB7am28,n2), ",vB7am29=", string(vB7am29,n2), ",vB7am30=", string(vB7am30,n2), ",vB7am31=", string(vB7am31,n2),
  ",vB7am32=", string(vB7am32,n2), ",vB7am33=", string(vB7am33,n2), ",vB7am34=", string(vB7am34,n2), ",vB7am35=", string(vB7am35,n2), ",vB7am36=",
  string(vB7am36,n2), ",vB7am37=", string(vB7am37,n2), ",vB7am38=", string(vB7am38,n2), ",vB7am39=", string(vB7am39,n2), ",vB7am40=", string(vB7am40,n2),
  ",vB7am41=", string(vB7am41,n2), ",vB7am42=", string(vB7am42,n2), ",vB7am43=", string(vB7am43,n2), ",vB7am44=", string(vB7am44,n2), ",vB7am45=",
  string(vB7am45,n2), ",vB7am46=", string(vB7am46,n2), ",vB7am47=", string(vB7am47,n2), ",vB7am48=", string(vB7am48,n2), ",vB7am49=", string(vB7am49,n2),
  ",vB7am50=", string(vB7am50,n2), ",vB7am51=", string(vB7am51,n2), ",vB7am52=", string(vB7am52,n2), ",vB7am53=", string(vB7am53,n2), ",vB7am54=",
  string(vB7am54,n2), ",vB7am88=", string(vB7am88,n2)
).
compute p1417=concat(
  "vB5~=0 & vB5~=9996，應答vB7am01,vB7am02,vB7am03,vB7am04,vB7am05,vB7am06,vB7am07,vB7am08,vB7am09,vB7am10",
  ",vB7am11,vB7am12,vB7am13,vB7am14,vB7am15,vB7am16,vB7am17,vB7am18,vB7am19,vB7am20,vB7am21,vB7am22,vB7",
  "am23,vB7am24,vB7am25,vB7am26,vB7am27,vB7am28,vB7am29,vB7am30,vB7am31,vB7am32,vB7am33,vB7am34,vB7am35",
  ",vB7am36,vB7am37,vB7am38,vB7am39,vB7am40,vB7am41,vB7am42,vB7am43,vB7am44,vB7am45,vB7am46,vB7am47,vB7",
  "am48,vB7am49,vB7am50,vB7am51,vB7am52,vB7am53,vB7am54,vB7am88而未答"
).
end if.

* logic check hide vJB1m01,vJB1m02,vJB1m03,vJB1m04,vJB1m05,vJB1m06,vJB1m07,vJB1m08,vJB1m09,vJB1m10,vJB1m11,vJB1m88,vJB1m90.
do if (any(vB5 , 0)) & (any(0 , vJB1m01_96) | any(0 , vJB1m02_96) | any(0 , vJB1m03_96) | any(0 , vJB1m04_96) | any(0 , vJB1m05_96) | any(0 , vJB1m06_96)
| any(0 , vJB1m07_96) | any(0 , vJB1m08_96) | any(0 , vJB1m09_96) | any(0 , vJB1m10_96) | any(0 , vJB1m11_96) | any(0 , vJB1m88_96) | any(0 , vJB1m90_96)).
compute m1418=concat(
  "vB5=", string(vB5,n4), ",vJB1m01=", string(vJB1m01,n2), ",vJB1m02=", string(vJB1m02,n2), ",vJB1m03=", string(vJB1m03,n2), ",vJB1m04=", string(vJB1m04,n2),
  ",vJB1m05=", string(vJB1m05,n2), ",vJB1m06=", string(vJB1m06,n2), ",vJB1m07=", string(vJB1m07,n2), ",vJB1m08=", string(vJB1m08,n2), ",vJB1m09=",
  string(vJB1m09,n2), ",vJB1m10=", string(vJB1m10,n2), ",vJB1m11=", string(vJB1m11,n2), ",vJB1m88=", string(vJB1m88,n2), ",vJB1m90=", string(vJB1m90,n2)
).
compute p1418="vB5 in 0，不應答vJB1m01,vJB1m02,vJB1m03,vJB1m04,vJB1m05,vJB1m06,vJB1m07,vJB1m08,vJB1m09,vJB1m10,vJB1m11,vJB1m88,vJB1m90而答".
end if.

* logic check show vJB1m01,vJB1m02,vJB1m03,vJB1m04,vJB1m05,vJB1m06,vJB1m07,vJB1m08,vJB1m09,vJB1m10,vJB1m11,vJB1m88,vJB1m90.
do if (not any(vB5 , 0 , 9996)) & (any(1 , vJB1m01_96) | any(1 , vJB1m02_96) | any(1 , vJB1m03_96) | any(1 , vJB1m04_96) | any(1 , vJB1m05_96) | any(1
, vJB1m06_96) | any(1 , vJB1m07_96) | any(1 , vJB1m08_96) | any(1 , vJB1m09_96) | any(1 , vJB1m10_96) | any(1 , vJB1m11_96) | any(1 , vJB1m88_96) | any(1
, vJB1m90_96)).
compute m1419=concat(
  "vB5=", string(vB5,n4), ",vJB1m01=", string(vJB1m01,n2), ",vJB1m02=", string(vJB1m02,n2), ",vJB1m03=", string(vJB1m03,n2), ",vJB1m04=", string(vJB1m04,n2),
  ",vJB1m05=", string(vJB1m05,n2), ",vJB1m06=", string(vJB1m06,n2), ",vJB1m07=", string(vJB1m07,n2), ",vJB1m08=", string(vJB1m08,n2), ",vJB1m09=",
  string(vJB1m09,n2), ",vJB1m10=", string(vJB1m10,n2), ",vJB1m11=", string(vJB1m11,n2), ",vJB1m88=", string(vJB1m88,n2), ",vJB1m90=", string(vJB1m90,n2)
).
compute p1419="vB5~=0 & vB5~=9996，應答vJB1m01,vJB1m02,vJB1m03,vJB1m04,vJB1m05,vJB1m06,vJB1m07,vJB1m08,vJB1m09,vJB1m10,vJB1m11,vJB1m88,vJB1m90而未答".
end if.

* logic check mutex.
do if (any(vB5,0)) & (any(vB8m01,1)).
compute m1420=concat("vB5=",string(vB5,n4),",vB8m01=",string(vB8m01,n2)).
compute p1420="vB5 in 0與互斥條件不應同時成立".
end if.

* logic check limit vB6.
do if not any(mod(trunc(vB6/10),10),0,1,2,3,4,5).
compute m1421=concat("vB6=",string(vB6,n5)).
compute p1421="vB6第3碼應為0,1,2,3,4,5".
end if.

* logic check hide vB7.
do if
(((vB7am01=1) + (vB7am02=1) + (vB7am03=1) + (vB7am04=1) + (vB7am05=1) + (vB7am06=1) + (vB7am07=1) + (vB7am08=1) + (vB7am09=1) + (vB7am10=1) + (vB7am11=1) + (vB7am12=1) + (vB7am13=1) + (vB7am14=1) + (vB7am15=1) + (vB7am16=1) + (vB7am17=1) + (vB7am18=1) + (vB7am19=1) + (vB7am20=1) + (vB7am21=1) + (vB7am22=1) + (vB7am23=1) + (vB7am24=1) + (vB7am25=1) + (vB7am26=1) + (vB7am27=1) + (vB7am28=1) + (vB7am29=1) + (vB7am30=1) + (vB7am31=1) + (vB7am32=1) + (vB7am33=1) + (vB7am34=1) + (vB7am35=1) + (vB7am36=1) + (vB7am37=1) + (vB7am38=1) + (vB7am39=1) + (vB7am40=1) + (vB7am41=1) + (vB7am42=1) + (vB7am43=1) + (vB7am44=1) + (vB7am45=1) + (vB7am46=1) + (vB7am47=1) + (vB7am48=1) + (vB7am49=1) + (vB7am50=1) + (vB7am51=1) + (vB7am52=1) + (vB7am53=1) + (vB7am54=1) + (vB7am88=1))<=1)
& any(0 , vB7_96).
compute m1422=concat(
  "vB7am01=", string(vB7am01,n2), ",vB7am02=", string(vB7am02,n2), ",vB7am03=", string(vB7am03,n2), ",vB7am04=", string(vB7am04,n2), ",vB7am05=",
  string(vB7am05,n2), ",vB7am06=", string(vB7am06,n2), ",vB7am07=", string(vB7am07,n2), ",vB7am08=", string(vB7am08,n2), ",vB7am09=", string(vB7am09,n2),
  ",vB7am10=", string(vB7am10,n2), ",vB7am11=", string(vB7am11,n2), ",vB7am12=", string(vB7am12,n2), ",vB7am13=", string(vB7am13,n2), ",vB7am14=",
  string(vB7am14,n2), ",vB7am15=", string(vB7am15,n2), ",vB7am16=", string(vB7am16,n2), ",vB7am17=", string(vB7am17,n2), ",vB7am18=", string(vB7am18,n2),
  ",vB7am19=", string(vB7am19,n2), ",vB7am20=", string(vB7am20,n2), ",vB7am21=", string(vB7am21,n2), ",vB7am22=", string(vB7am22,n2), ",vB7am23=",
  string(vB7am23,n2), ",vB7am24=", string(vB7am24,n2), ",vB7am25=", string(vB7am25,n2), ",vB7am26=", string(vB7am26,n2), ",vB7am27=", string(vB7am27,n2),
  ",vB7am28=", string(vB7am28,n2), ",vB7am29=", string(vB7am29,n2), ",vB7am30=", string(vB7am30,n2), ",vB7am31=", string(vB7am31,n2), ",vB7am32=",
  string(vB7am32,n2), ",vB7am33=", string(vB7am33,n2), ",vB7am34=", string(vB7am34,n2), ",vB7am35=", string(vB7am35,n2), ",vB7am36=", string(vB7am36,n2),
  ",vB7am37=", string(vB7am37,n2), ",vB7am38=", string(vB7am38,n2), ",vB7am39=", string(vB7am39,n2), ",vB7am40=", string(vB7am40,n2), ",vB7am41=",
  string(vB7am41,n2), ",vB7am42=", string(vB7am42,n2), ",vB7am43=", string(vB7am43,n2), ",vB7am44=", string(vB7am44,n2), ",vB7am45=", string(vB7am45,n2),
  ",vB7am46=", string(vB7am46,n2), ",vB7am47=", string(vB7am47,n2), ",vB7am48=", string(vB7am48,n2), ",vB7am49=", string(vB7am49,n2), ",vB7am50=",
  string(vB7am50,n2), ",vB7am51=", string(vB7am51,n2), ",vB7am52=", string(vB7am52,n2), ",vB7am53=", string(vB7am53,n2), ",vB7am54=", string(vB7am54,n2),
  ",vB7am88=", string(vB7am88,n2), ",vB7=", string(vB7,n2)
).
compute p1422=concat(
  "((vB7am01=1) + (vB7am02=1) + (vB7am03=1) + (vB7am04=1) + (vB7am05=1) + (vB7am06=1) + (vB7am07=1) + (",
  "vB7am08=1) + (vB7am09=1) + (vB7am10=1) + (vB7am11=1) + (vB7am12=1) + (vB7am13=1) + (vB7am14=1) + (vB",
  "7am15=1) + (vB7am16=1) + (vB7am17=1) + (vB7am18=1) + (vB7am19=1) + (vB7am20=1) + (vB7am21=1) + (vB7a",
  "m22=1) + (vB7am23=1) + (vB7am24=1) + (vB7am25=1) + (vB7am26=1) + (vB7am27=1) + (vB7am28=1) + (vB7am2",
  "9=1) + (vB7am30=1) + (vB7am31=1) + (vB7am32=1) + (vB7am33=1) + (vB7am34=1) + (vB7am35=1) + (vB7am36=",
  "1) + (vB7am37=1) + (vB7am38=1) + (vB7am39=1) + (vB7am40=1) + (vB7am41=1) + (vB7am42=1) + (vB7am43=1)",
  " + (vB7am44=1) + (vB7am45=1) + (vB7am46=1) + (vB7am47=1) + (vB7am48=1) + (vB7am49=1) + (vB7am50=1) +",
  " (vB7am51=1) + (vB7am52=1) + (vB7am53=1) + (vB7am54=1) + (vB7am88=1))<=1，不應答vB7而答"
).
end if.

* logic check show vB7.
do if
(((vB7am01=1) + (vB7am02=1) + (vB7am03=1) + (vB7am04=1) + (vB7am05=1) + (vB7am06=1) + (vB7am07=1) + (vB7am08=1) + (vB7am09=1) + (vB7am10=1) + (vB7am11=1) + (vB7am12=1) + (vB7am13=1) + (vB7am14=1) + (vB7am15=1) + (vB7am16=1) + (vB7am17=1) + (vB7am18=1) + (vB7am19=1) + (vB7am20=1) + (vB7am21=1) + (vB7am22=1) + (vB7am23=1) + (vB7am24=1) + (vB7am25=1) + (vB7am26=1) + (vB7am27=1) + (vB7am28=1) + (vB7am29=1) + (vB7am30=1) + (vB7am31=1) + (vB7am32=1) + (vB7am33=1) + (vB7am34=1) + (vB7am35=1) + (vB7am36=1) + (vB7am37=1) + (vB7am38=1) + (vB7am39=1) + (vB7am40=1) + (vB7am41=1) + (vB7am42=1) + (vB7am43=1) + (vB7am44=1) + (vB7am45=1) + (vB7am46=1) + (vB7am47=1) + (vB7am48=1) + (vB7am49=1) + (vB7am50=1) + (vB7am51=1) + (vB7am52=1) + (vB7am53=1) + (vB7am54=1) + (vB7am88=1))>1
& vB7am01~=96 & vB7am02~=96 & vB7am03~=96 & vB7am04~=96 & vB7am05~=96 & vB7am06~=96 & vB7am07~=96 & vB7am08~=96 & vB7am09~=96 & vB7am10~=96 & vB7am11~=96
& vB7am12~=96 & vB7am13~=96 & vB7am14~=96 & vB7am15~=96 & vB7am16~=96 & vB7am17~=96 & vB7am18~=96 & vB7am19~=96 & vB7am20~=96 & vB7am21~=96 & vB7am22~=96
& vB7am23~=96 & vB7am24~=96 & vB7am25~=96 & vB7am26~=96 & vB7am27~=96 & vB7am28~=96 & vB7am29~=96 & vB7am30~=96 & vB7am31~=96 & vB7am32~=96 & vB7am33~=96
& vB7am34~=96 & vB7am35~=96 & vB7am36~=96 & vB7am37~=96 & vB7am38~=96 & vB7am39~=96 & vB7am40~=96 & vB7am41~=96 & vB7am42~=96 & vB7am43~=96 & vB7am44~=96
& vB7am45~=96 & vB7am46~=96 & vB7am47~=96 & vB7am48~=96 & vB7am49~=96 & vB7am50~=96 & vB7am51~=96 & vB7am52~=96 & vB7am53~=96 & vB7am54~=96 & vB7am88~=96)
& any(1 , vB7_96).
compute m1423=concat(
  "vB7am01=", string(vB7am01,n2), ",vB7am02=", string(vB7am02,n2), ",vB7am03=", string(vB7am03,n2), ",vB7am04=", string(vB7am04,n2), ",vB7am05=",
  string(vB7am05,n2), ",vB7am06=", string(vB7am06,n2), ",vB7am07=", string(vB7am07,n2), ",vB7am08=", string(vB7am08,n2), ",vB7am09=", string(vB7am09,n2),
  ",vB7am10=", string(vB7am10,n2), ",vB7am11=", string(vB7am11,n2), ",vB7am12=", string(vB7am12,n2), ",vB7am13=", string(vB7am13,n2), ",vB7am14=",
  string(vB7am14,n2), ",vB7am15=", string(vB7am15,n2), ",vB7am16=", string(vB7am16,n2), ",vB7am17=", string(vB7am17,n2), ",vB7am18=", string(vB7am18,n2),
  ",vB7am19=", string(vB7am19,n2), ",vB7am20=", string(vB7am20,n2), ",vB7am21=", string(vB7am21,n2), ",vB7am22=", string(vB7am22,n2), ",vB7am23=",
  string(vB7am23,n2), ",vB7am24=", string(vB7am24,n2), ",vB7am25=", string(vB7am25,n2), ",vB7am26=", string(vB7am26,n2), ",vB7am27=", string(vB7am27,n2),
  ",vB7am28=", string(vB7am28,n2), ",vB7am29=", string(vB7am29,n2), ",vB7am30=", string(vB7am30,n2), ",vB7am31=", string(vB7am31,n2), ",vB7am32=",
  string(vB7am32,n2), ",vB7am33=", string(vB7am33,n2), ",vB7am34=", string(vB7am34,n2), ",vB7am35=", string(vB7am35,n2), ",vB7am36=", string(vB7am36,n2),
  ",vB7am37=", string(vB7am37,n2), ",vB7am38=", string(vB7am38,n2), ",vB7am39=", string(vB7am39,n2), ",vB7am40=", string(vB7am40,n2), ",vB7am41=",
  string(vB7am41,n2), ",vB7am42=", string(vB7am42,n2), ",vB7am43=", string(vB7am43,n2), ",vB7am44=", string(vB7am44,n2), ",vB7am45=", string(vB7am45,n2),
  ",vB7am46=", string(vB7am46,n2), ",vB7am47=", string(vB7am47,n2), ",vB7am48=", string(vB7am48,n2), ",vB7am49=", string(vB7am49,n2), ",vB7am50=",
  string(vB7am50,n2), ",vB7am51=", string(vB7am51,n2), ",vB7am52=", string(vB7am52,n2), ",vB7am53=", string(vB7am53,n2), ",vB7am54=", string(vB7am54,n2),
  ",vB7am88=", string(vB7am88,n2), ",vB7=", string(vB7,n2)
).
compute p1423=concat(
  "((vB7am01=1) + (vB7am02=1) + (vB7am03=1) + (vB7am04=1) + (vB7am05=1) + (vB7am06=1) + (vB7am07=1) + (",
  "vB7am08=1) + (vB7am09=1) + (vB7am10=1) + (vB7am11=1) + (vB7am12=1) + (vB7am13=1) + (vB7am14=1) + (vB",
  "7am15=1) + (vB7am16=1) + (vB7am17=1) + (vB7am18=1) + (vB7am19=1) + (vB7am20=1) + (vB7am21=1) + (vB7a",
  "m22=1) + (vB7am23=1) + (vB7am24=1) + (vB7am25=1) + (vB7am26=1) + (vB7am27=1) + (vB7am28=1) + (vB7am2",
  "9=1) + (vB7am30=1) + (vB7am31=1) + (vB7am32=1) + (vB7am33=1) + (vB7am34=1) + (vB7am35=1) + (vB7am36=",
  "1) + (vB7am37=1) + (vB7am38=1) + (vB7am39=1) + (vB7am40=1) + (vB7am41=1) + (vB7am42=1) + (vB7am43=1)",
  " + (vB7am44=1) + (vB7am45=1) + (vB7am46=1) + (vB7am47=1) + (vB7am48=1) + (vB7am49=1) + (vB7am50=1) +",
  " (vB7am51=1) + (vB7am52=1) + (vB7am53=1) + (vB7am54=1) + (vB7am88=1))>1 & vB7am01~=96 & vB7am02~=96 ",
  "& vB7am03~=96 & vB7am04~=96 & vB7am05~=96 & vB7am06~=96 & vB7am07~=96 & vB7am08~=96 & vB7am09~=96 & ",
  "vB7am10~=96 & vB7am11~=96 & vB7am12~=96 & vB7am13~=96 & vB7am14~=96 & vB7am15~=96 & vB7am16~=96 & vB",
  "7am17~=96 & vB7am18~=96 & vB7am19~=96 & vB7am20~=96 & vB7am21~=96 & vB7am22~=96 & vB7am23~=96 & vB7a",
  "m24~=96 & vB7am25~=96 & vB7am26~=96 & vB7am27~=96 & vB7am28~=96 & vB7am29~=96 & vB7am30~=96 & vB7am3",
  "1~=96 & vB7am32~=96 & vB7am33~=96 & vB7am34~=96 & vB7am35~=96 & vB7am36~=96 & vB7am37~=96 & vB7am38~",
  "=96 & vB7am39~=96 & vB7am40~=96 & vB7am41~=96 & vB7am42~=96 & vB7am43~=96 & vB7am44~=96 & vB7am45~=9",
  "6 & vB7am46~=96 & vB7am47~=96 & vB7am48~=96 & vB7am49~=96 & vB7am50~=96 & vB7am51~=96 & vB7am52~=96 ",
  "& vB7am53~=96 & vB7am54~=96 & vB7am88~=96，應答vB7而未答"
).
end if.

* logic check show vI4.
do if ((vB8m03=1 | vB8m06=1) & vI1=0 & vI3=0) & any(1,vI4_96).
compute m1424=concat("vB8m03=",string(vB8m03,n2),",vB8m06=",string(vB8m06,n2),",vI1=",string(vI1,n4),",vI3=",string(vI3,n4),",vI4=",string(vI4,n5)).
compute p1424="(vB8m03=1 | vB8m06=1) & vI1=0 & vI3=0，應答vI4而未答".
end if.

* logic check hide vI4.
do if ((not((vB8m03=1 | vB8m06=1) & vI1=0 & vI3=0)) & vB8m03~=96 & vB8m06~=96) & any(0,vI4_96).
compute m1425=concat("vB8m03=",string(vB8m03,n2),",vB8m06=",string(vB8m06,n2),",vI1=",string(vI1,n4),",vI3=",string(vI3,n4),",vI4=",string(vI4,n5)).
compute p1425="(not((vB8m03=1 | vB8m06=1) & vI1=0 & vI3=0)) & vB8m03~=96 & vB8m06~=96，不應答vI4而答".
end if.

* logic check mutex.
do if (any(vB8m08,1)) & (any(vQ4,1)).
compute m1426=concat("vB8m08=",string(vB8m08,n2),",vQ4=",string(vQ4,n2)).
compute p1426="vB8m08 in 1與互斥條件不應同時成立".
end if.

* logic check hide vI2.
do if (any(vI1,0)) & any(0,vI2_96).
compute m1427=concat("vI1=",string(vI1,n4),",vI2=",string(vI2,n5)).
compute p1427="vI1 in 0，不應答vI2而答".
end if.

* logic check show vI2.
do if (vI1~=0) & any(1,vI2_96).
compute m1428=concat("vI1=",string(vI1,n4),",vI2=",string(vI2,n5)).
compute p1428="vI1~=0，應答vI2而未答".
end if.

* logic check limit vI2.
do if not any(mod(trunc(vI2/10),10),0,1,2,3,4,5).
compute m1429=concat("vI2=",string(vI2,n5)).
compute p1429="vI2第3碼應為0,1,2,3,4,5".
end if.

* logic check hide vI4.
do if (any(vI3,0)) & any(0,vI4_96).
compute m1430=concat("vI3=",string(vI3,n4),",vI4=",string(vI4,n5)).
compute p1430="vI3 in 0，不應答vI4而答".
end if.

* logic check show vI4.
do if (vI3~=0) & any(1,vI4_96).
compute m1431=concat("vI3=",string(vI3,n4),",vI4=",string(vI4,n5)).
compute p1431="vI3~=0，應答vI4而未答".
end if.

* logic check limit vI4.
do if not any(mod(trunc(vI4/10),10),0,1,2,3,4,5).
compute m1432=concat("vI4=",string(vI4,n5)).
compute p1432="vI4第3碼應為0,1,2,3,4,5".
end if.

* logic check limit vG2.
do if not any(mod(trunc(vG2/10),10),0,1,2,3,4,5).
compute m1433=concat("vG2=",string(vG2,n5)).
compute p1433="vG2第3碼應為0,1,2,3,4,5".
end if.

* logic check show vF1.
do if (any(vF0,1,89)) & any(1,vF1_96).
compute m1434=concat("vF0=",string(vF0,n2),",vF1=",string(vF1,n5)).
compute p1434="vF0 in 1 | vF0 in 89，應答vF1而未答".
end if.

* logic check hide vF1.
do if (not any(vF0,1,89,96)) & any(0,vF1_96).
compute m1435=concat("vF0=",string(vF0,n2),",vF1=",string(vF1,n5)).
compute p1435="vF0~=1 & vF0~=89 & vF0~=96，不應答vF1而答".
end if.

* logic check show vF2.
do if (any(vF0,1,89)) & any(1,vF2_96).
compute m1436=concat("vF0=",string(vF0,n2),",vF2=",string(vF2,n5)).
compute p1436="vF0 in 1 | vF0 in 89，應答vF2而未答".
end if.

* logic check hide vF2.
do if (not any(vF0,1,89,96)) & any(0,vF2_96).
compute m1437=concat("vF0=",string(vF0,n2),",vF2=",string(vF2,n5)).
compute p1437="vF0~=1 & vF0~=89 & vF0~=96，不應答vF2而答".
end if.

* logic check show vF3.
do if (any(vF0,2,89)) & any(1,vF3_96).
compute m1438=concat("vF0=",string(vF0,n2),",vF3=",string(vF3,n5)).
compute p1438="vF0 in 2 | vF0 in 89，應答vF3而未答".
end if.

* logic check hide vF3.
do if (not any(vF0,2,89,96)) & any(0,vF3_96).
compute m1439=concat("vF0=",string(vF0,n2),",vF3=",string(vF3,n5)).
compute p1439="vF0~=2 & vF0~=89 & vF0~=96，不應答vF3而答".
end if.

* logic check show vF4.
do if (any(vF0,2,89)) & any(1,vF4_96).
compute m1440=concat("vF0=",string(vF0,n2),",vF4=",string(vF4,n5)).
compute p1440="vF0 in 2 | vF0 in 89，應答vF4而未答".
end if.

* logic check hide vF4.
do if (not any(vF0,2,89,96)) & any(0,vF4_96).
compute m1441=concat("vF0=",string(vF0,n2),",vF4=",string(vF4,n5)).
compute p1441="vF0~=2 & vF0~=89 & vF0~=96，不應答vF4而答".
end if.

* logic check hide vF5m01,vF5m02,vF5m03,vF5m04,vF5m05,vF5m06,vF5m07,vF5m08,vF5m88.
do if (any(vF0 , 90 , 97 , 98)) & (any(0 , vF5m01_96) | any(0 , vF5m02_96) | any(0 , vF5m03_96) | any(0 , vF5m04_96) | any(0 , vF5m05_96) | any(0 , vF5m06_96)
| any(0 , vF5m07_96) | any(0 , vF5m08_96) | any(0 , vF5m88_96)).
compute m1442=concat(
  "vF0=", string(vF0,n2), ",vF5m01=", string(vF5m01,n2), ",vF5m02=", string(vF5m02,n2), ",vF5m03=", string(vF5m03,n2), ",vF5m04=", string(vF5m04,n2),
  ",vF5m05=", string(vF5m05,n2), ",vF5m06=", string(vF5m06,n2), ",vF5m07=", string(vF5m07,n2), ",vF5m08=", string(vF5m08,n2), ",vF5m88=", string(vF5m88,n2)
).
compute p1442="vF0 in 90 | vF0 in 97 | vF0 in 98，不應答vF5m01,vF5m02,vF5m03,vF5m04,vF5m05,vF5m06,vF5m07,vF5m08,vF5m88而答".
end if.

* logic check show vF5m01,vF5m02,vF5m03,vF5m04,vF5m05,vF5m06,vF5m07,vF5m08,vF5m88.
do if (not any(vF0 , 90 , 97 , 98 , 96)) & (any(1 , vF5m01_96) | any(1 , vF5m02_96) | any(1 , vF5m03_96) | any(1 , vF5m04_96) | any(1 , vF5m05_96) | any(1
, vF5m06_96) | any(1 , vF5m07_96) | any(1 , vF5m08_96) | any(1 , vF5m88_96)).
compute m1443=concat(
  "vF0=", string(vF0,n2), ",vF5m01=", string(vF5m01,n2), ",vF5m02=", string(vF5m02,n2), ",vF5m03=", string(vF5m03,n2), ",vF5m04=", string(vF5m04,n2),
  ",vF5m05=", string(vF5m05,n2), ",vF5m06=", string(vF5m06,n2), ",vF5m07=", string(vF5m07,n2), ",vF5m08=", string(vF5m08,n2), ",vF5m88=", string(vF5m88,n2)
).
compute p1443="vF0~=90 & vF0~=97 & vF0~=98 & vF0~=96，應答vF5m01,vF5m02,vF5m03,vF5m04,vF5m05,vF5m06,vF5m07,vF5m08,vF5m88而未答".
end if.

* logic check limit vF2.
do if not any(mod(trunc(vF2/10),10),0,1,2,3,4,5).
compute m1444=concat("vF2=",string(vF2,n5)).
compute p1444="vF2第3碼應為0,1,2,3,4,5".
end if.

* logic check limit vF4.
do if not any(mod(trunc(vF4/10),10),0,1,2,3,4,5).
compute m1445=concat("vF4=",string(vF4,n5)).
compute p1445="vF4第3碼應為0,1,2,3,4,5".
end if.

* logic check hide vC2.
do if (any(vC1,0)) & any(0,vC2_96).
compute m1446=concat("vC1=",string(vC1,n4),",vC2=",string(vC2,n5)).
compute p1446="vC1 in 0，不應答vC2而答".
end if.

* logic check show vC2.
do if (vC1~=0) & any(1,vC2_96).
compute m1447=concat("vC1=",string(vC1,n4),",vC2=",string(vC2,n5)).
compute p1447="vC1~=0，應答vC2而未答".
end if.

* logic check hide vC3m01,vC3m02,vC3m03,vC3m04,vC3m05,vC3m06,vC3m07,vC3m08,vC3m09,vC3m10,vC3m11,vC3m88.
do if (any(vC1 , 0)) & (any(0 , vC3m01_96) | any(0 , vC3m02_96) | any(0 , vC3m03_96) | any(0 , vC3m04_96) | any(0 , vC3m05_96) | any(0 , vC3m06_96) | any(0
, vC3m07_96) | any(0 , vC3m08_96) | any(0 , vC3m09_96) | any(0 , vC3m10_96) | any(0 , vC3m11_96) | any(0 , vC3m88_96)).
compute m1448=concat(
  "vC1=", string(vC1,n4), ",vC3m01=", string(vC3m01,n2), ",vC3m02=", string(vC3m02,n2), ",vC3m03=", string(vC3m03,n2), ",vC3m04=", string(vC3m04,n2),
  ",vC3m05=", string(vC3m05,n2), ",vC3m06=", string(vC3m06,n2), ",vC3m07=", string(vC3m07,n2), ",vC3m08=", string(vC3m08,n2), ",vC3m09=", string(vC3m09,n2),
  ",vC3m10=", string(vC3m10,n2), ",vC3m11=", string(vC3m11,n2), ",vC3m88=", string(vC3m88,n2)
).
compute p1448="vC1 in 0，不應答vC3m01,vC3m02,vC3m03,vC3m04,vC3m05,vC3m06,vC3m07,vC3m08,vC3m09,vC3m10,vC3m11,vC3m88而答".
end if.

* logic check show vC3m01,vC3m02,vC3m03,vC3m04,vC3m05,vC3m06,vC3m07,vC3m08,vC3m09,vC3m10,vC3m11,vC3m88.
do if (vC1~=0) & (any(1 , vC3m01_96) | any(1 , vC3m02_96) | any(1 , vC3m03_96) | any(1 , vC3m04_96) | any(1 , vC3m05_96) | any(1 , vC3m06_96) | any(1
, vC3m07_96) | any(1 , vC3m08_96) | any(1 , vC3m09_96) | any(1 , vC3m10_96) | any(1 , vC3m11_96) | any(1 , vC3m88_96)).
compute m1449=concat(
  "vC1=", string(vC1,n4), ",vC3m01=", string(vC3m01,n2), ",vC3m02=", string(vC3m02,n2), ",vC3m03=", string(vC3m03,n2), ",vC3m04=", string(vC3m04,n2),
  ",vC3m05=", string(vC3m05,n2), ",vC3m06=", string(vC3m06,n2), ",vC3m07=", string(vC3m07,n2), ",vC3m08=", string(vC3m08,n2), ",vC3m09=", string(vC3m09,n2),
  ",vC3m10=", string(vC3m10,n2), ",vC3m11=", string(vC3m11,n2), ",vC3m88=", string(vC3m88,n2)
).
compute p1449="vC1~=0，應答vC3m01,vC3m02,vC3m03,vC3m04,vC3m05,vC3m06,vC3m07,vC3m08,vC3m09,vC3m10,vC3m11,vC3m88而未答".
end if.

* logic check hide vQ3.
do if (any(vC1,0)) & any(0,vQ3_96).
compute m1450=concat("vC1=",string(vC1,n4),",vQ3=",string(vQ3,n2)).
compute p1450="vC1 in 0，不應答vQ3而答".
end if.

* logic check show vQ3.
do if (vC1~=0) & any(1,vQ3_96).
compute m1451=concat("vC1=",string(vC1,n4),",vQ3=",string(vQ3,n2)).
compute p1451="vC1~=0，應答vQ3而未答".
end if.

* logic check limit vC2.
do if not any(mod(trunc(vC2/10),10),0,1,2,3,4,5).
compute m1452=concat("vC2=",string(vC2,n5)).
compute p1452="vC2第3碼應為0,1,2,3,4,5".
end if.

* logic check mutex.
do if (any(vC3m08,1)) & (any(vQ3,1)).
compute m1453=concat("vC3m08=",string(vC3m08,n2),",vQ3=",string(vQ3,n2)).
compute p1453="vC3m08 in 1與互斥條件不應同時成立".
end if.

* logic check show vH2.
do if (any(vH1,997,998)) & any(1,vH2_96).
compute m1454=concat("vH1=",string(vH1,n4),",vH2=",string(vH2,n2)).
compute p1454="vH1 in 997 | vH1 in 998，應答vH2而未答".
end if.

* logic check hide vH2.
do if (not any(vH1,997,998)) & any(0,vH2_96).
compute m1455=concat("vH1=",string(vH1,n4),",vH2=",string(vH2,n2)).
compute p1455="vH1~=997 & vH1~=998，不應答vH2而答".
end if.

* logic check hide vH3.
do if (any(vH1,0) | any(vH2,1)) & any(0,vH3_96).
compute m1456=concat("vH1=",string(vH1,n4),",vH2=",string(vH2,n2),",vH3=",string(vH3,n2)).
compute p1456="vH1 in 0 | vH2 in 1，不應答vH3而答".
end if.

* logic check show vH3.
do if (vH1~=0 & not any(vH2,1,96)) & any(1,vH3_96).
compute m1457=concat("vH1=",string(vH1,n4),",vH2=",string(vH2,n2),",vH3=",string(vH3,n2)).
compute p1457="vH1~=0 & vH2~=1 & vH2~=96，應答vH3而未答".
end if.

* logic check show vH7.
do if (not any(vH1,0,997,998) & not any(vH4,0,997,998)) & any(1,vH7_96).
compute m1458=concat("vH1=",string(vH1,n4),",vH4=",string(vH4,n4),",vH7=",string(vH7,n4)).
compute p1458="vH1~=0 & vH1~=997 & vH1~=998 & vH4~=0 & vH4~=997 & vH4~=998，應答vH7而未答".
end if.

* logic check hide vH7.
do if ((any(vH1,0,997,998) | any(vH4,0,997,998)) & vH4~=9996) & any(0,vH7_96).
compute m1459=concat("vH1=",string(vH1,n4),",vH4=",string(vH4,n4),",vH7=",string(vH7,n4)).
compute p1459="(vH1 in 0 | vH1 in 997 | vH1 in 998 | vH4 in 0 | vH4 in 997 | vH4 in 998) & vH4~=9996，不應答vH7而答".
end if.

* logic check show vH7_1.
do if (not any(vH1,0,997,998) & not any(vH5,1,97,98)) & any(1,vH7_1_96).
compute m1460=concat("vH1=",string(vH1,n4),",vH5=",string(vH5,n2),",vH7_1=",string(vH7_1,n4)).
compute p1460="vH1~=0 & vH1~=997 & vH1~=998 & vH5~=1 & vH5~=97 & vH5~=98，應答vH7_1而未答".
end if.

* logic check hide vH7_1.
do if ((any(vH1,0,997,998) | any(vH5,1,97,98)) & vH5~=96) & any(0,vH7_1_96).
compute m1461=concat("vH1=",string(vH1,n4),",vH5=",string(vH5,n2),",vH7_1=",string(vH7_1,n4)).
compute p1461="(vH1 in 0 | vH1 in 997 | vH1 in 998 | vH5 in 1 | vH5 in 97 | vH5 in 98) & vH5~=96，不應答vH7_1而答".
end if.

* logic check show vH7_2.
do if (not any(vH2,1,97,98) & not any(vH4,0,997,998)) & any(1,vH7_2_96).
compute m1462=concat("vH2=",string(vH2,n2),",vH4=",string(vH4,n4),",vH7_2=",string(vH7_2,n4)).
compute p1462="vH2~=1 & vH2~=97 & vH2~=98 & vH4~=0 & vH4~=997 & vH4~=998，應答vH7_2而未答".
end if.

* logic check hide vH7_2.
do if ((any(vH2,1,97,98) | any(vH4,0,997,998)) & vH2~=96 & vH4~=9996) & any(0,vH7_2_96).
compute m1463=concat("vH2=",string(vH2,n2),",vH4=",string(vH4,n4),",vH7_2=",string(vH7_2,n4)).
compute p1463="(vH2 in 1 | vH2 in 97 | vH2 in 98 | vH4 in 0 | vH4 in 997 | vH4 in 998) & vH2~=96 & vH4~=9996，不應答vH7_2而答".
end if.

* logic check show vH7_3.
do if (not any(vH2,1,97,98) & not any(vH5,1,97,98)) & any(1,vH7_3_96).
compute m1464=concat("vH2=",string(vH2,n2),",vH5=",string(vH5,n2),",vH7_3=",string(vH7_3,n4)).
compute p1464="vH2~=1 & vH2~=97 & vH2~=98 & vH5~=1 & vH5~=97 & vH5~=98，應答vH7_3而未答".
end if.

* logic check hide vH7_3.
do if ((any(vH2,1,97,98) | any(vH5,1,97,98)) & vH2~=96 & vH5~=96) & any(0,vH7_3_96).
compute m1465=concat("vH2=",string(vH2,n2),",vH5=",string(vH5,n2),",vH7_3=",string(vH7_3,n4)).
compute p1465="(vH2 in 1 | vH2 in 97 | vH2 in 98 | vH5 in 1 | vH5 in 97 | vH5 in 98) & vH2~=96 & vH5~=96，不應答vH7_3而答".
end if.

* logic check show vH5.
do if (any(vH4,997,998)) & any(1,vH5_96).
compute m1466=concat("vH4=",string(vH4,n4),",vH5=",string(vH5,n2)).
compute p1466="vH4 in 997 | vH4 in 998，應答vH5而未答".
end if.

* logic check hide vH5.
do if (not any(vH4,997,998,9996)) & any(0,vH5_96).
compute m1467=concat("vH4=",string(vH4,n4),",vH5=",string(vH5,n2)).
compute p1467="vH4~=997 & vH4~=998 & vH4~=9996，不應答vH5而答".
end if.

* logic check hide vH6.
do if (any(vH4,0) | any(vH5,1)) & any(0,vH6_96).
compute m1468=concat("vH4=",string(vH4,n4),",vH5=",string(vH5,n2),",vH6=",string(vH6,n2)).
compute p1468="vH4 in 0 | vH5 in 1，不應答vH6而答".
end if.

* logic check show vH6.
do if (not any(vH4,0,9996) & not any(vH5,1,96)) & any(1,vH6_96).
compute m1469=concat("vH4=",string(vH4,n4),",vH5=",string(vH5,n2),",vH6=",string(vH6,n2)).
compute p1469="vH4~=0 & vH5~=1 & vH4~=9996 & vH5~=96，應答vH6而未答".
end if.

* logic check hide vM2m01,vM2m02,vM2m03,vM2m04,vM2m05,vM2m06,vM2m07,vM2m08,vM2m09,vM2m10,vM2m11,vM2m12,vM2m13,vM2m14,vM2m15,vM2m16,vM2m88.
do if (any(vM1g1 , 0) & any(vM1g2 , 0)) & (any(0 , vM2m01_96) | any(0 , vM2m02_96) | any(0 , vM2m03_96) | any(0 , vM2m04_96) | any(0 , vM2m05_96) | any(0
, vM2m06_96) | any(0 , vM2m07_96) | any(0 , vM2m08_96) | any(0 , vM2m09_96) | any(0 , vM2m10_96) | any(0 , vM2m11_96) | any(0 , vM2m12_96) | any(0 , vM2m13_96)
| any(0 , vM2m14_96) | any(0 , vM2m15_96) | any(0 , vM2m16_96) | any(0 , vM2m88_96)).
compute m1470=concat(
  "vM1g1=", string(vM1g1,n4), ",vM1g2=", string(vM1g2,n3), ",vM2m01=", string(vM2m01,n2), ",vM2m02=", string(vM2m02,n2), ",vM2m03=", string(vM2m03,n2),
  ",vM2m04=", string(vM2m04,n2), ",vM2m05=", string(vM2m05,n2), ",vM2m06=", string(vM2m06,n2), ",vM2m07=", string(vM2m07,n2), ",vM2m08=", string(vM2m08,n2),
  ",vM2m09=", string(vM2m09,n2), ",vM2m10=", string(vM2m10,n2), ",vM2m11=", string(vM2m11,n2), ",vM2m12=", string(vM2m12,n2), ",vM2m13=", string(vM2m13,n2),
  ",vM2m14=", string(vM2m14,n2), ",vM2m15=", string(vM2m15,n2), ",vM2m16=", string(vM2m16,n2), ",vM2m88=", string(vM2m88,n2)
).
compute p1470=concat(
  "vM1g1 in 0 & vM1g2 in 0，不應答vM2m01,vM2m02,vM2m03,vM2m04,vM2m05,vM2m06,vM2m07,vM2m08,vM2m09,vM2m10,vM2",
  "m11,vM2m12,vM2m13,vM2m14,vM2m15,vM2m16,vM2m88而答"
).
end if.

* logic check show vM2m01,vM2m02,vM2m03,vM2m04,vM2m05,vM2m06,vM2m07,vM2m08,vM2m09,vM2m10,vM2m11,vM2m12,vM2m13,vM2m14,vM2m15,vM2m16,vM2m88.
do if (vM1g1~=0 | vM1g2~=0) & (any(1 , vM2m01_96) | any(1 , vM2m02_96) | any(1 , vM2m03_96) | any(1 , vM2m04_96) | any(1 , vM2m05_96) | any(1 , vM2m06_96)
| any(1 , vM2m07_96) | any(1 , vM2m08_96) | any(1 , vM2m09_96) | any(1 , vM2m10_96) | any(1 , vM2m11_96) | any(1 , vM2m12_96) | any(1 , vM2m13_96) | any(1
, vM2m14_96) | any(1 , vM2m15_96) | any(1 , vM2m16_96) | any(1 , vM2m88_96)).
compute m1471=concat(
  "vM1g1=", string(vM1g1,n4), ",vM1g2=", string(vM1g2,n3), ",vM2m01=", string(vM2m01,n2), ",vM2m02=", string(vM2m02,n2), ",vM2m03=", string(vM2m03,n2),
  ",vM2m04=", string(vM2m04,n2), ",vM2m05=", string(vM2m05,n2), ",vM2m06=", string(vM2m06,n2), ",vM2m07=", string(vM2m07,n2), ",vM2m08=", string(vM2m08,n2),
  ",vM2m09=", string(vM2m09,n2), ",vM2m10=", string(vM2m10,n2), ",vM2m11=", string(vM2m11,n2), ",vM2m12=", string(vM2m12,n2), ",vM2m13=", string(vM2m13,n2),
  ",vM2m14=", string(vM2m14,n2), ",vM2m15=", string(vM2m15,n2), ",vM2m16=", string(vM2m16,n2), ",vM2m88=", string(vM2m88,n2)
).
compute p1471="vM1g1~=0 | vM1g2~=0，應答vM2m01,vM2m02,vM2m03,vM2m04,vM2m05,vM2m06,vM2m07,vM2m08,vM2m09,vM2m10,vM2m11,vM2m12,vM2m13,vM2m14,vM2m15,vM2m16,vM2m88而未答".
end if.

* logic check hide vM3m01,vM3m02,vM3m03,vM3m04,vM3m05,vM3m06,vM3m07,vM3m08,vM3m09,vM3m10,vM3m11,vM3m12,vM3m13,vM3m88.
do if (any(vM1g1 , 0) & any(vM1g2 , 0)) & (any(0 , vM3m01_96) | any(0 , vM3m02_96) | any(0 , vM3m03_96) | any(0 , vM3m04_96) | any(0 , vM3m05_96) | any(0
, vM3m06_96) | any(0 , vM3m07_96) | any(0 , vM3m08_96) | any(0 , vM3m09_96) | any(0 , vM3m10_96) | any(0 , vM3m11_96) | any(0 , vM3m12_96) | any(0 , vM3m13_96)
| any(0 , vM3m88_96)).
compute m1472=concat(
  "vM1g1=", string(vM1g1,n4), ",vM1g2=", string(vM1g2,n3), ",vM3m01=", string(vM3m01,n2), ",vM3m02=", string(vM3m02,n2), ",vM3m03=", string(vM3m03,n2),
  ",vM3m04=", string(vM3m04,n2), ",vM3m05=", string(vM3m05,n2), ",vM3m06=", string(vM3m06,n2), ",vM3m07=", string(vM3m07,n2), ",vM3m08=", string(vM3m08,n2),
  ",vM3m09=", string(vM3m09,n2), ",vM3m10=", string(vM3m10,n2), ",vM3m11=", string(vM3m11,n2), ",vM3m12=", string(vM3m12,n2), ",vM3m13=", string(vM3m13,n2),
  ",vM3m88=", string(vM3m88,n2)
).
compute p1472="vM1g1 in 0 & vM1g2 in 0，不應答vM3m01,vM3m02,vM3m03,vM3m04,vM3m05,vM3m06,vM3m07,vM3m08,vM3m09,vM3m10,vM3m11,vM3m12,vM3m13,vM3m88而答".
end if.

* logic check show vM3m01,vM3m02,vM3m03,vM3m04,vM3m05,vM3m06,vM3m07,vM3m08,vM3m09,vM3m10,vM3m11,vM3m12,vM3m13,vM3m88.
do if (vM1g1~=0 | vM1g2~=0) & (any(1 , vM3m01_96) | any(1 , vM3m02_96) | any(1 , vM3m03_96) | any(1 , vM3m04_96) | any(1 , vM3m05_96) | any(1 , vM3m06_96)
| any(1 , vM3m07_96) | any(1 , vM3m08_96) | any(1 , vM3m09_96) | any(1 , vM3m10_96) | any(1 , vM3m11_96) | any(1 , vM3m12_96) | any(1 , vM3m13_96) | any(1
, vM3m88_96)).
compute m1473=concat(
  "vM1g1=", string(vM1g1,n4), ",vM1g2=", string(vM1g2,n3), ",vM3m01=", string(vM3m01,n2), ",vM3m02=", string(vM3m02,n2), ",vM3m03=", string(vM3m03,n2),
  ",vM3m04=", string(vM3m04,n2), ",vM3m05=", string(vM3m05,n2), ",vM3m06=", string(vM3m06,n2), ",vM3m07=", string(vM3m07,n2), ",vM3m08=", string(vM3m08,n2),
  ",vM3m09=", string(vM3m09,n2), ",vM3m10=", string(vM3m10,n2), ",vM3m11=", string(vM3m11,n2), ",vM3m12=", string(vM3m12,n2), ",vM3m13=", string(vM3m13,n2),
  ",vM3m88=", string(vM3m88,n2)
).
compute p1473="vM1g1~=0 | vM1g2~=0，應答vM3m01,vM3m02,vM3m03,vM3m04,vM3m05,vM3m06,vM3m07,vM3m08,vM3m09,vM3m10,vM3m11,vM3m12,vM3m13,vM3m88而未答".
end if.

* logic check hide vM4sM4,vM4sM5,vM4sM6.
do if (any(vM1g1,0) & any(vM1g2,0)) & (any(0,vM4sM4_96) | any(0,vM4sM5_96) | any(0,vM4sM6_96)).
compute m1474=concat(
  "vM1g1=", string(vM1g1,n4), ",vM1g2=", string(vM1g2,n3), ",vM4sM4=", string(vM4sM4,n2), ",vM4sM5=", string(vM4sM5,n2), ",vM4sM6=", string(vM4sM6,n2)
).
compute p1474="vM1g1 in 0 & vM1g2 in 0，不應答vM4sM4,vM4sM5,vM4sM6而答".
end if.

* logic check show vM4sM4,vM4sM5,vM4sM6.
do if (vM1g1~=0 | vM1g2~=0) & (any(1,vM4sM4_96) | any(1,vM4sM5_96) | any(1,vM4sM6_96)).
compute m1475=concat(
  "vM1g1=", string(vM1g1,n4), ",vM1g2=", string(vM1g2,n3), ",vM4sM4=", string(vM4sM4,n2), ",vM4sM5=", string(vM4sM5,n2), ",vM4sM6=", string(vM4sM6,n2)
).
compute p1475="vM1g1~=0 | vM1g2~=0，應答vM4sM4,vM4sM5,vM4sM6而未答".
end if.

* logic check hide vQ27m01,vQ27m02,vQ27m03,vQ27m04,vQ27m05,vQ27m06,vQ27m07,vQ27m88.
do if (any(vQ1 , 1) & any(vQ2 , 1) & any(vQ3 , 1) & any(vQ4 , 1) & any(vQ5 , 2) & any(vQ10 , 2) & any(vQ15 , 2) & any(vQ20m90 , 1)) & (any(0 , vQ27m01_96)
| any(0 , vQ27m02_96) | any(0 , vQ27m03_96) | any(0 , vQ27m04_96) | any(0 , vQ27m05_96) | any(0 , vQ27m06_96) | any(0 , vQ27m07_96) | any(0 , vQ27m88_96)).
compute m1476=concat(
  "vQ1=", string(vQ1,n2), ",vQ2=", string(vQ2,n2), ",vQ3=", string(vQ3,n2), ",vQ4=", string(vQ4,n2), ",vQ5=", string(vQ5,n2), ",vQ10=", string(vQ10,n2),
  ",vQ15=", string(vQ15,n2), ",vQ20m90=", string(vQ20m90,n2), ",vQ27m01=", string(vQ27m01,n2), ",vQ27m02=", string(vQ27m02,n2), ",vQ27m03=", string(vQ27m03,n2),
  ",vQ27m04=", string(vQ27m04,n2), ",vQ27m05=", string(vQ27m05,n2), ",vQ27m06=", string(vQ27m06,n2), ",vQ27m07=", string(vQ27m07,n2), ",vQ27m88=",
  string(vQ27m88,n2)
).
compute p1476=concat(
  "vQ1 in 1 & vQ2 in 1 & vQ3 in 1 & vQ4 in 1 & vQ5 in 2 & vQ10 in 2 & vQ15 in 2 & vQ20m90 in 1，不應答vQ27m",
  "01,vQ27m02,vQ27m03,vQ27m04,vQ27m05,vQ27m06,vQ27m07,vQ27m88而答"
).
end if.

* logic check show vQ27m01,vQ27m02,vQ27m03,vQ27m04,vQ27m05,vQ27m06,vQ27m07,vQ27m88.
do if ((vQ1~=1 | vQ2~=1 | vQ3~=1 | vQ4~=1 | vQ5~=2 | vQ10~=2 | vQ15~=2 | not any(vQ20m90 , 1 , 96)) & vQ1~=96 & vQ2~=96 & vQ3~=96 & vQ4~=96 & vQ5~=96 & vQ10~=96
& vQ15~=96) & (any(1 , vQ27m01_96) | any(1 , vQ27m02_96) | any(1 , vQ27m03_96) | any(1 , vQ27m04_96) | any(1 , vQ27m05_96) | any(1 , vQ27m06_96) | any(1
, vQ27m07_96) | any(1 , vQ27m88_96)).
compute m1477=concat(
  "vQ1=", string(vQ1,n2), ",vQ2=", string(vQ2,n2), ",vQ3=", string(vQ3,n2), ",vQ4=", string(vQ4,n2), ",vQ5=", string(vQ5,n2), ",vQ10=", string(vQ10,n2),
  ",vQ15=", string(vQ15,n2), ",vQ20m90=", string(vQ20m90,n2), ",vQ27m01=", string(vQ27m01,n2), ",vQ27m02=", string(vQ27m02,n2), ",vQ27m03=", string(vQ27m03,n2),
  ",vQ27m04=", string(vQ27m04,n2), ",vQ27m05=", string(vQ27m05,n2), ",vQ27m06=", string(vQ27m06,n2), ",vQ27m07=", string(vQ27m07,n2), ",vQ27m88=",
  string(vQ27m88,n2)
).
compute p1477=concat(
  "(vQ1~=1 | vQ2~=1 | vQ3~=1 | vQ4~=1 | vQ5~=2 | vQ10~=2 | vQ15~=2 | vQ20m90~=1) & vQ1~=96 & vQ2~=96 & ",
  "vQ3~=96 & vQ4~=96 & vQ5~=96 & vQ10~=96 & vQ15~=96 & vQ20m90~=96，應答vQ27m01,vQ27m02,vQ27m03,vQ27m04,vQ",
  "27m05,vQ27m06,vQ27m07,vQ27m88而未答"
).
end if.

* logic check show vQ10.
do if (any(vQ5,2) & any(vQ10,1)) & any(1,vQ10_96).
compute m1478=concat("vQ5=",string(vQ5,n2),",vQ10=",string(vQ10,n2)).
compute p1478="vQ5 in 2 & vQ10 in 1，應答vQ10而未答".
end if.

* logic check hide vQ10.
do if ((vQ5~=2 | not any(vQ10,1,96)) & vQ5~=96) & any(0,vQ10_96).
compute m1479=concat("vQ5=",string(vQ5,n2),",vQ10=",string(vQ10,n2)).
compute p1479="(vQ5~=2 | vQ10~=1) & vQ5~=96 & vQ10~=96，不應答vQ10而答".
end if.

* logic check show vQ20m01,vQ20m02,vQ20m03,vQ20m04,vQ20m05,vQ20m06,vQ20m88,vQ20m90.
do if (any(vQ5 , 2) & (any(vQ20m02 , 1) | any(vQ20m03 , 1) | any(vQ20m04 , 1) | any(vQ20m05 , 1))) & (any(1 , vQ20m01_96) | any(1 , vQ20m02_96) | any(1
, vQ20m03_96) | any(1 , vQ20m04_96) | any(1 , vQ20m05_96) | any(1 , vQ20m06_96) | any(1 , vQ20m88_96) | any(1 , vQ20m90_96)).
compute m1480=concat(
  "vQ5=", string(vQ5,n2), ",vQ20m02=", string(vQ20m02,n2), ",vQ20m03=", string(vQ20m03,n2), ",vQ20m04=", string(vQ20m04,n2), ",vQ20m05=", string(vQ20m05,n2),
  ",vQ20m01=", string(vQ20m01,n2), ",vQ20m06=", string(vQ20m06,n2), ",vQ20m88=", string(vQ20m88,n2), ",vQ20m90=", string(vQ20m90,n2)
).
compute p1480="vQ5 in 2 & (vQ20m02 in 1 | vQ20m03 in 1 | vQ20m04 in 1 | vQ20m05 in 1)，應答vQ20m01,vQ20m02,vQ20m03,vQ20m04,vQ20m05,vQ20m06,vQ20m88,vQ20m90而未答".
end if.

* logic check hide vQ20m01,vQ20m02,vQ20m03,vQ20m04,vQ20m05,vQ20m06,vQ20m88,vQ20m90.
do if ((vQ5~=2 | (not any(vQ20m02 , 1 , 96) & not any(vQ20m03 , 1 , 96) & not any(vQ20m04 , 1 , 96) & not any(vQ20m05 , 1 , 96))) & vQ5~=96) & (any(0
, vQ20m01_96) | any(0 , vQ20m02_96) | any(0 , vQ20m03_96) | any(0 , vQ20m04_96) | any(0 , vQ20m05_96) | any(0 , vQ20m06_96) | any(0 , vQ20m88_96) | any(0
, vQ20m90_96)).
compute m1481=concat(
  "vQ5=", string(vQ5,n2), ",vQ20m02=", string(vQ20m02,n2), ",vQ20m03=", string(vQ20m03,n2), ",vQ20m04=", string(vQ20m04,n2), ",vQ20m05=", string(vQ20m05,n2),
  ",vQ20m01=", string(vQ20m01,n2), ",vQ20m06=", string(vQ20m06,n2), ",vQ20m88=", string(vQ20m88,n2), ",vQ20m90=", string(vQ20m90,n2)
).
compute p1481=concat(
  "(vQ5~=2 | (vQ20m02~=1 & vQ20m03~=1 & vQ20m04~=1 & vQ20m05~=1)) & vQ5~=96 & vQ20m02~=96 & vQ20m03~=96",
  " & vQ20m04~=96 & vQ20m05~=96，不應答vQ20m01,vQ20m02,vQ20m03,vQ20m04,vQ20m05,vQ20m06,vQ20m88,vQ20m90而答"
).
end if.

* logic check show vQ27m01,vQ27m02,vQ27m03,vQ27m04,vQ27m05,vQ27m06,vQ27m07,vQ27m88.
do if (any(vQ5 , 2) & (any(vP3_4 , 2 , 3 , 4))) & (any(1 , vQ27m01_96) | any(1 , vQ27m02_96) | any(1 , vQ27m03_96) | any(1 , vQ27m04_96) | any(1 , vQ27m05_96)
| any(1 , vQ27m06_96) | any(1 , vQ27m07_96) | any(1 , vQ27m88_96)).
compute m1482=concat(
  "vQ5=", string(vQ5,n2), ",vP3_4=", string(vP3_4,n2), ",vQ27m01=", string(vQ27m01,n2), ",vQ27m02=", string(vQ27m02,n2), ",vQ27m03=", string(vQ27m03,n2),
  ",vQ27m04=", string(vQ27m04,n2), ",vQ27m05=", string(vQ27m05,n2), ",vQ27m06=", string(vQ27m06,n2), ",vQ27m07=", string(vQ27m07,n2), ",vQ27m88=",
  string(vQ27m88,n2)
).
compute p1482="vQ5 in 2 & (vP3_4 in 2 | vP3_4 in 3 | vP3_4 in 4)，應答vQ27m01,vQ27m02,vQ27m03,vQ27m04,vQ27m05,vQ27m06,vQ27m07,vQ27m88而未答".
end if.

* logic check hide vQ27m01,vQ27m02,vQ27m03,vQ27m04,vQ27m05,vQ27m06,vQ27m07,vQ27m88.
do if ((vQ5~=2 | (not any(vP3_4 , 2 , 3 , 4))) & vQ5~=96) & (any(0 , vQ27m01_96) | any(0 , vQ27m02_96) | any(0 , vQ27m03_96) | any(0 , vQ27m04_96) | any(0
, vQ27m05_96) | any(0 , vQ27m06_96) | any(0 , vQ27m07_96) | any(0 , vQ27m88_96)).
compute m1483=concat(
  "vQ5=", string(vQ5,n2), ",vP3_4=", string(vP3_4,n2), ",vQ27m01=", string(vQ27m01,n2), ",vQ27m02=", string(vQ27m02,n2), ",vQ27m03=", string(vQ27m03,n2),
  ",vQ27m04=", string(vQ27m04,n2), ",vQ27m05=", string(vQ27m05,n2), ",vQ27m06=", string(vQ27m06,n2), ",vQ27m07=", string(vQ27m07,n2), ",vQ27m88=",
  string(vQ27m88,n2)
).
compute p1483="(vQ5~=2 | (vP3_4~=2 & vP3_4~=3 & vP3_4~=4)) & vQ5~=96，不應答vQ27m01,vQ27m02,vQ27m03,vQ27m04,vQ27m05,vQ27m06,vQ27m07,vQ27m88而答".
end if.

* logic check show vQ24g1,vQ24g2.
do if (any(vQ20m01,1)) & (any(1,vQ24g1_96) | any(1,vQ24g2_96)).
compute m1484=concat("vQ20m01=",string(vQ20m01,n2),",vQ24g1=",string(vQ24g1,n4),",vQ24g2=",string(vQ24g2,n3)).
compute p1484="vQ20m01 in 1，應答vQ24g1,vQ24g2而未答".
end if.

* logic check hide vQ24g1,vQ24g2.
do if (not any(vQ20m01,1,96)) & (any(0,vQ24g1_96) | any(0,vQ24g2_96)).
compute m1485=concat("vQ20m01=",string(vQ20m01,n2),",vQ24g1=",string(vQ24g1,n4),",vQ24g2=",string(vQ24g2,n3)).
compute p1485="vQ20m01~=1 & vQ20m01~=96，不應答vQ24g1,vQ24g2而答".
end if.

* logic check show vQ25m01,vQ25m02,vQ25m03,vQ25m04,vQ25m05,vQ25m06,vQ25m07,vQ25m08,vQ25m09,vQ25m10,vQ25m11,vQ25m12,vQ25m13,vQ25m14,vQ25m15,vQ25m16,vQ25m17.
* vQ25m18,vQ25m19,vQ25m20,vQ25m21,vQ25m22,vQ25m23,vQ25m24,vQ25m25,vQ25m26,vQ25m27,vQ25m28,vQ25m29,vQ25m30,vQ25m31,vQ25m88.
do if (any(vQ20m01 , 1)) & (any(1 , vQ25m01_96) | any(1 , vQ25m02_96) | any(1 , vQ25m03_96) | any(1 , vQ25m04_96) | any(1 , vQ25m05_96) | any(1 , vQ25m06_96)
| any(1 , vQ25m07_96) | any(1 , vQ25m08_96) | any(1 , vQ25m09_96) | any(1 , vQ25m10_96) | any(1 , vQ25m11_96) | any(1 , vQ25m12_96) | any(1 , vQ25m13_96)
| any(1 , vQ25m14_96) | any(1 , vQ25m15_96) | any(1 , vQ25m16_96) | any(1 , vQ25m17_96) | any(1 , vQ25m18_96) | any(1 , vQ25m19_96) | any(1 , vQ25m20_96)
| any(1 , vQ25m21_96) | any(1 , vQ25m22_96) | any(1 , vQ25m23_96) | any(1 , vQ25m24_96) | any(1 , vQ25m25_96) | any(1 , vQ25m26_96) | any(1 , vQ25m27_96)
| any(1 , vQ25m28_96) | any(1 , vQ25m29_96) | any(1 , vQ25m30_96) | any(1 , vQ25m31_96) | any(1 , vQ25m88_96)).
compute m1486=concat(
  "vQ20m01=", string(vQ20m01,n2), ",vQ25m01=", string(vQ25m01,n2), ",vQ25m02=", string(vQ25m02,n2), ",vQ25m03=", string(vQ25m03,n2), ",vQ25m04=",
  string(vQ25m04,n2), ",vQ25m05=", string(vQ25m05,n2), ",vQ25m06=", string(vQ25m06,n2), ",vQ25m07=", string(vQ25m07,n2), ",vQ25m08=", string(vQ25m08,n2),
  ",vQ25m09=", string(vQ25m09,n2), ",vQ25m10=", string(vQ25m10,n2), ",vQ25m11=", string(vQ25m11,n2), ",vQ25m12=", string(vQ25m12,n2), ",vQ25m13=",
  string(vQ25m13,n2), ",vQ25m14=", string(vQ25m14,n2), ",vQ25m15=", string(vQ25m15,n2), ",vQ25m16=", string(vQ25m16,n2), ",vQ25m17=", string(vQ25m17,n2),
  ",vQ25m18=", string(vQ25m18,n2), ",vQ25m19=", string(vQ25m19,n2), ",vQ25m20=", string(vQ25m20,n2), ",vQ25m21=", string(vQ25m21,n2), ",vQ25m22=",
  string(vQ25m22,n2), ",vQ25m23=", string(vQ25m23,n2), ",vQ25m24=", string(vQ25m24,n2), ",vQ25m25=", string(vQ25m25,n2), ",vQ25m26=", string(vQ25m26,n2),
  ",vQ25m27=", string(vQ25m27,n2), ",vQ25m28=", string(vQ25m28,n2), ",vQ25m29=", string(vQ25m29,n2), ",vQ25m30=", string(vQ25m30,n2), ",vQ25m31=",
  string(vQ25m31,n2), ",vQ25m88=", string(vQ25m88,n2)
).
compute p1486=concat(
  "vQ20m01 in 1，應答vQ25m01,vQ25m02,vQ25m03,vQ25m04,vQ25m05,vQ25m06,vQ25m07,vQ25m08,vQ25m09,vQ25m10,vQ25m",
  "11,vQ25m12,vQ25m13,vQ25m14,vQ25m15,vQ25m16,vQ25m17,vQ25m18,vQ25m19,vQ25m20,vQ25m21,vQ25m22,vQ25m23,v",
  "Q25m24,vQ25m25,vQ25m26,vQ25m27,vQ25m28,vQ25m29,vQ25m30,vQ25m31,vQ25m88而未答"
).
end if.

* logic check hide vQ25m01,vQ25m02,vQ25m03,vQ25m04,vQ25m05,vQ25m06,vQ25m07,vQ25m08,vQ25m09,vQ25m10,vQ25m11,vQ25m12,vQ25m13,vQ25m14,vQ25m15,vQ25m16,vQ25m17.
* vQ25m18,vQ25m19,vQ25m20,vQ25m21,vQ25m22,vQ25m23,vQ25m24,vQ25m25,vQ25m26,vQ25m27,vQ25m28,vQ25m29,vQ25m30,vQ25m31,vQ25m88.
do if (not any(vQ20m01 , 1 , 96)) & (any(0 , vQ25m01_96) | any(0 , vQ25m02_96) | any(0 , vQ25m03_96) | any(0 , vQ25m04_96) | any(0 , vQ25m05_96) | any(0
, vQ25m06_96) | any(0 , vQ25m07_96) | any(0 , vQ25m08_96) | any(0 , vQ25m09_96) | any(0 , vQ25m10_96) | any(0 , vQ25m11_96) | any(0 , vQ25m12_96) | any(0
, vQ25m13_96) | any(0 , vQ25m14_96) | any(0 , vQ25m15_96) | any(0 , vQ25m16_96) | any(0 , vQ25m17_96) | any(0 , vQ25m18_96) | any(0 , vQ25m19_96) | any(0
, vQ25m20_96) | any(0 , vQ25m21_96) | any(0 , vQ25m22_96) | any(0 , vQ25m23_96) | any(0 , vQ25m24_96) | any(0 , vQ25m25_96) | any(0 , vQ25m26_96) | any(0
, vQ25m27_96) | any(0 , vQ25m28_96) | any(0 , vQ25m29_96) | any(0 , vQ25m30_96) | any(0 , vQ25m31_96) | any(0 , vQ25m88_96)).
compute m1487=concat(
  "vQ20m01=", string(vQ20m01,n2), ",vQ25m01=", string(vQ25m01,n2), ",vQ25m02=", string(vQ25m02,n2), ",vQ25m03=", string(vQ25m03,n2), ",vQ25m04=",
  string(vQ25m04,n2), ",vQ25m05=", string(vQ25m05,n2), ",vQ25m06=", string(vQ25m06,n2), ",vQ25m07=", string(vQ25m07,n2), ",vQ25m08=", string(vQ25m08,n2),
  ",vQ25m09=", string(vQ25m09,n2), ",vQ25m10=", string(vQ25m10,n2), ",vQ25m11=", string(vQ25m11,n2), ",vQ25m12=", string(vQ25m12,n2), ",vQ25m13=",
  string(vQ25m13,n2), ",vQ25m14=", string(vQ25m14,n2), ",vQ25m15=", string(vQ25m15,n2), ",vQ25m16=", string(vQ25m16,n2), ",vQ25m17=", string(vQ25m17,n2),
  ",vQ25m18=", string(vQ25m18,n2), ",vQ25m19=", string(vQ25m19,n2), ",vQ25m20=", string(vQ25m20,n2), ",vQ25m21=", string(vQ25m21,n2), ",vQ25m22=",
  string(vQ25m22,n2), ",vQ25m23=", string(vQ25m23,n2), ",vQ25m24=", string(vQ25m24,n2), ",vQ25m25=", string(vQ25m25,n2), ",vQ25m26=", string(vQ25m26,n2),
  ",vQ25m27=", string(vQ25m27,n2), ",vQ25m28=", string(vQ25m28,n2), ",vQ25m29=", string(vQ25m29,n2), ",vQ25m30=", string(vQ25m30,n2), ",vQ25m31=",
  string(vQ25m31,n2), ",vQ25m88=", string(vQ25m88,n2)
).
compute p1487=concat(
  "vQ20m01~=1 & vQ20m01~=96，不應答vQ25m01,vQ25m02,vQ25m03,vQ25m04,vQ25m05,vQ25m06,vQ25m07,vQ25m08,vQ25m09,",
  "vQ25m10,vQ25m11,vQ25m12,vQ25m13,vQ25m14,vQ25m15,vQ25m16,vQ25m17,vQ25m18,vQ25m19,vQ25m20,vQ25m21,vQ25",
  "m22,vQ25m23,vQ25m24,vQ25m25,vQ25m26,vQ25m27,vQ25m28,vQ25m29,vQ25m30,vQ25m31,vQ25m88而答"
).
end if.

* logic check show vQ21g1,vQ21g2.
do if (any(vQ20m02,1) | any(vQ20m03,1)) & (any(1,vQ21g1_96) | any(1,vQ21g2_96)).
compute m1488=concat("vQ20m02=",string(vQ20m02,n2),",vQ20m03=",string(vQ20m03,n2),",vQ21g1=",string(vQ21g1,n4),",vQ21g2=",string(vQ21g2,n3)).
compute p1488="vQ20m02 in 1 | vQ20m03 in 1，應答vQ21g1,vQ21g2而未答".
end if.

* logic check hide vQ21g1,vQ21g2.
do if (not any(vQ20m02,1,96) & not any(vQ20m03,1,96)) & (any(0,vQ21g1_96) | any(0,vQ21g2_96)).
compute m1489=concat("vQ20m02=",string(vQ20m02,n2),",vQ20m03=",string(vQ20m03,n2),",vQ21g1=",string(vQ21g1,n4),",vQ21g2=",string(vQ21g2,n3)).
compute p1489="vQ20m02~=1 & vQ20m03~=1 & vQ20m02~=96 & vQ20m03~=96，不應答vQ21g1,vQ21g2而答".
end if.

* logic check show vQ22m01,vQ22m02,vQ22m03,vQ22m04,vQ22m05,vQ22m06,vQ22m07,vQ22m08,vQ22m09,vQ22m10,vQ22m11,vQ22m12,vQ22m13,vQ22m14,vQ22m15,vQ22m16,vQ22m17.
* vQ22m18,vQ22m19,vQ22m20,vQ22m21,vQ22m22,vQ22m23,vQ22m24,vQ22m25,vQ22m26,vQ22m27,vQ22m28,vQ22m29,vQ22m30,vQ22m31,vQ22m32,vQ22m33,vQ22m34,vQ22m35,vQ22m36.
* vQ22m37,vQ22m38,vQ22m39,vQ22m40,vQ22m88.
do if (any(vQ20m02 , 1)) & (any(1 , vQ22m01_96) | any(1 , vQ22m02_96) | any(1 , vQ22m03_96) | any(1 , vQ22m04_96) | any(1 , vQ22m05_96) | any(1 , vQ22m06_96)
| any(1 , vQ22m07_96) | any(1 , vQ22m08_96) | any(1 , vQ22m09_96) | any(1 , vQ22m10_96) | any(1 , vQ22m11_96) | any(1 , vQ22m12_96) | any(1 , vQ22m13_96)
| any(1 , vQ22m14_96) | any(1 , vQ22m15_96) | any(1 , vQ22m16_96) | any(1 , vQ22m17_96) | any(1 , vQ22m18_96) | any(1 , vQ22m19_96) | any(1 , vQ22m20_96)
| any(1 , vQ22m21_96) | any(1 , vQ22m22_96) | any(1 , vQ22m23_96) | any(1 , vQ22m24_96) | any(1 , vQ22m25_96) | any(1 , vQ22m26_96) | any(1 , vQ22m27_96)
| any(1 , vQ22m28_96) | any(1 , vQ22m29_96) | any(1 , vQ22m30_96) | any(1 , vQ22m31_96) | any(1 , vQ22m32_96) | any(1 , vQ22m33_96) | any(1 , vQ22m34_96)
| any(1 , vQ22m35_96) | any(1 , vQ22m36_96) | any(1 , vQ22m37_96) | any(1 , vQ22m38_96) | any(1 , vQ22m39_96) | any(1 , vQ22m40_96) | any(1 , vQ22m88_96)).
compute m1490=concat(
  "vQ20m02=", string(vQ20m02,n2), ",vQ22m01=", string(vQ22m01,n2), ",vQ22m02=", string(vQ22m02,n2), ",vQ22m03=", string(vQ22m03,n2), ",vQ22m04=",
  string(vQ22m04,n2), ",vQ22m05=", string(vQ22m05,n2), ",vQ22m06=", string(vQ22m06,n2), ",vQ22m07=", string(vQ22m07,n2), ",vQ22m08=", string(vQ22m08,n2),
  ",vQ22m09=", string(vQ22m09,n2), ",vQ22m10=", string(vQ22m10,n2), ",vQ22m11=", string(vQ22m11,n2), ",vQ22m12=", string(vQ22m12,n2), ",vQ22m13=",
  string(vQ22m13,n2), ",vQ22m14=", string(vQ22m14,n2), ",vQ22m15=", string(vQ22m15,n2), ",vQ22m16=", string(vQ22m16,n2), ",vQ22m17=", string(vQ22m17,n2),
  ",vQ22m18=", string(vQ22m18,n2), ",vQ22m19=", string(vQ22m19,n2), ",vQ22m20=", string(vQ22m20,n2), ",vQ22m21=", string(vQ22m21,n2), ",vQ22m22=",
  string(vQ22m22,n2), ",vQ22m23=", string(vQ22m23,n2), ",vQ22m24=", string(vQ22m24,n2), ",vQ22m25=", string(vQ22m25,n2), ",vQ22m26=", string(vQ22m26,n2),
  ",vQ22m27=", string(vQ22m27,n2), ",vQ22m28=", string(vQ22m28,n2), ",vQ22m29=", string(vQ22m29,n2), ",vQ22m30=", string(vQ22m30,n2), ",vQ22m31=",
  string(vQ22m31,n2), ",vQ22m32=", string(vQ22m32,n2), ",vQ22m33=", string(vQ22m33,n2), ",vQ22m34=", string(vQ22m34,n2), ",vQ22m35=", string(vQ22m35,n2),
  ",vQ22m36=", string(vQ22m36,n2), ",vQ22m37=", string(vQ22m37,n2), ",vQ22m38=", string(vQ22m38,n2), ",vQ22m39=", string(vQ22m39,n2), ",vQ22m40=",
  string(vQ22m40,n2), ",vQ22m88=", string(vQ22m88,n2)
).
compute p1490=concat(
  "vQ20m02 in 1，應答vQ22m01,vQ22m02,vQ22m03,vQ22m04,vQ22m05,vQ22m06,vQ22m07,vQ22m08,vQ22m09,vQ22m10,vQ22m",
  "11,vQ22m12,vQ22m13,vQ22m14,vQ22m15,vQ22m16,vQ22m17,vQ22m18,vQ22m19,vQ22m20,vQ22m21,vQ22m22,vQ22m23,v",
  "Q22m24,vQ22m25,vQ22m26,vQ22m27,vQ22m28,vQ22m29,vQ22m30,vQ22m31,vQ22m32,vQ22m33,vQ22m34,vQ22m35,vQ22m",
  "36,vQ22m37,vQ22m38,vQ22m39,vQ22m40,vQ22m88而未答"
).
end if.

* logic check hide vQ22m01,vQ22m02,vQ22m03,vQ22m04,vQ22m05,vQ22m06,vQ22m07,vQ22m08,vQ22m09,vQ22m10,vQ22m11,vQ22m12,vQ22m13,vQ22m14,vQ22m15,vQ22m16,vQ22m17.
* vQ22m18,vQ22m19,vQ22m20,vQ22m21,vQ22m22,vQ22m23,vQ22m24,vQ22m25,vQ22m26,vQ22m27,vQ22m28,vQ22m29,vQ22m30,vQ22m31,vQ22m32,vQ22m33,vQ22m34,vQ22m35,vQ22m36.
* vQ22m37,vQ22m38,vQ22m39,vQ22m40,vQ22m88.
do if (not any(vQ20m02 , 1 , 96)) & (any(0 , vQ22m01_96) | any(0 , vQ22m02_96) | any(0 , vQ22m03_96) | any(0 , vQ22m04_96) | any(0 , vQ22m05_96) | any(0
, vQ22m06_96) | any(0 , vQ22m07_96) | any(0 , vQ22m08_96) | any(0 , vQ22m09_96) | any(0 , vQ22m10_96) | any(0 , vQ22m11_96) | any(0 , vQ22m12_96) | any(0
, vQ22m13_96) | any(0 , vQ22m14_96) | any(0 , vQ22m15_96) | any(0 , vQ22m16_96) | any(0 , vQ22m17_96) | any(0 , vQ22m18_96) | any(0 , vQ22m19_96) | any(0
, vQ22m20_96) | any(0 , vQ22m21_96) | any(0 , vQ22m22_96) | any(0 , vQ22m23_96) | any(0 , vQ22m24_96) | any(0 , vQ22m25_96) | any(0 , vQ22m26_96) | any(0
, vQ22m27_96) | any(0 , vQ22m28_96) | any(0 , vQ22m29_96) | any(0 , vQ22m30_96) | any(0 , vQ22m31_96) | any(0 , vQ22m32_96) | any(0 , vQ22m33_96) | any(0
, vQ22m34_96) | any(0 , vQ22m35_96) | any(0 , vQ22m36_96) | any(0 , vQ22m37_96) | any(0 , vQ22m38_96) | any(0 , vQ22m39_96) | any(0 , vQ22m40_96) | any(0
, vQ22m88_96)).
compute m1491=concat(
  "vQ20m02=", string(vQ20m02,n2), ",vQ22m01=", string(vQ22m01,n2), ",vQ22m02=", string(vQ22m02,n2), ",vQ22m03=", string(vQ22m03,n2), ",vQ22m04=",
  string(vQ22m04,n2), ",vQ22m05=", string(vQ22m05,n2), ",vQ22m06=", string(vQ22m06,n2), ",vQ22m07=", string(vQ22m07,n2), ",vQ22m08=", string(vQ22m08,n2),
  ",vQ22m09=", string(vQ22m09,n2), ",vQ22m10=", string(vQ22m10,n2), ",vQ22m11=", string(vQ22m11,n2), ",vQ22m12=", string(vQ22m12,n2), ",vQ22m13=",
  string(vQ22m13,n2), ",vQ22m14=", string(vQ22m14,n2), ",vQ22m15=", string(vQ22m15,n2), ",vQ22m16=", string(vQ22m16,n2), ",vQ22m17=", string(vQ22m17,n2),
  ",vQ22m18=", string(vQ22m18,n2), ",vQ22m19=", string(vQ22m19,n2), ",vQ22m20=", string(vQ22m20,n2), ",vQ22m21=", string(vQ22m21,n2), ",vQ22m22=",
  string(vQ22m22,n2), ",vQ22m23=", string(vQ22m23,n2), ",vQ22m24=", string(vQ22m24,n2), ",vQ22m25=", string(vQ22m25,n2), ",vQ22m26=", string(vQ22m26,n2),
  ",vQ22m27=", string(vQ22m27,n2), ",vQ22m28=", string(vQ22m28,n2), ",vQ22m29=", string(vQ22m29,n2), ",vQ22m30=", string(vQ22m30,n2), ",vQ22m31=",
  string(vQ22m31,n2), ",vQ22m32=", string(vQ22m32,n2), ",vQ22m33=", string(vQ22m33,n2), ",vQ22m34=", string(vQ22m34,n2), ",vQ22m35=", string(vQ22m35,n2),
  ",vQ22m36=", string(vQ22m36,n2), ",vQ22m37=", string(vQ22m37,n2), ",vQ22m38=", string(vQ22m38,n2), ",vQ22m39=", string(vQ22m39,n2), ",vQ22m40=",
  string(vQ22m40,n2), ",vQ22m88=", string(vQ22m88,n2)
).
compute p1491=concat(
  "vQ20m02~=1 & vQ20m02~=96，不應答vQ22m01,vQ22m02,vQ22m03,vQ22m04,vQ22m05,vQ22m06,vQ22m07,vQ22m08,vQ22m09,",
  "vQ22m10,vQ22m11,vQ22m12,vQ22m13,vQ22m14,vQ22m15,vQ22m16,vQ22m17,vQ22m18,vQ22m19,vQ22m20,vQ22m21,vQ22",
  "m22,vQ22m23,vQ22m24,vQ22m25,vQ22m26,vQ22m27,vQ22m28,vQ22m29,vQ22m30,vQ22m31,vQ22m32,vQ22m33,vQ22m34,",
  "vQ22m35,vQ22m36,vQ22m37,vQ22m38,vQ22m39,vQ22m40,vQ22m88而答"
).
end if.

* logic check show vQ27m01,vQ27m02,vQ27m03,vQ27m04,vQ27m05,vQ27m06,vQ27m07,vQ27m88.
do if (any(vQ20m02 , 1) | any(vQ20m03 , 1)) & (any(1 , vQ27m01_96) | any(1 , vQ27m02_96) | any(1 , vQ27m03_96) | any(1 , vQ27m04_96) | any(1 , vQ27m05_96)
| any(1 , vQ27m06_96) | any(1 , vQ27m07_96) | any(1 , vQ27m88_96)).
compute m1492=concat(
  "vQ20m02=", string(vQ20m02,n2), ",vQ20m03=", string(vQ20m03,n2), ",vQ27m01=", string(vQ27m01,n2), ",vQ27m02=", string(vQ27m02,n2), ",vQ27m03=",
  string(vQ27m03,n2), ",vQ27m04=", string(vQ27m04,n2), ",vQ27m05=", string(vQ27m05,n2), ",vQ27m06=", string(vQ27m06,n2), ",vQ27m07=", string(vQ27m07,n2),
  ",vQ27m88=", string(vQ27m88,n2)
).
compute p1492="vQ20m02 in 1 | vQ20m03 in 1，應答vQ27m01,vQ27m02,vQ27m03,vQ27m04,vQ27m05,vQ27m06,vQ27m07,vQ27m88而未答".
end if.

* logic check hide vQ27m01,vQ27m02,vQ27m03,vQ27m04,vQ27m05,vQ27m06,vQ27m07,vQ27m88.
do if (not any(vQ20m02 , 1 , 96) & not any(vQ20m03 , 1 , 96)) & (any(0 , vQ27m01_96) | any(0 , vQ27m02_96) | any(0 , vQ27m03_96) | any(0 , vQ27m04_96) | any(0
, vQ27m05_96) | any(0 , vQ27m06_96) | any(0 , vQ27m07_96) | any(0 , vQ27m88_96)).
compute m1493=concat(
  "vQ20m02=", string(vQ20m02,n2), ",vQ20m03=", string(vQ20m03,n2), ",vQ27m01=", string(vQ27m01,n2), ",vQ27m02=", string(vQ27m02,n2), ",vQ27m03=",
  string(vQ27m03,n2), ",vQ27m04=", string(vQ27m04,n2), ",vQ27m05=", string(vQ27m05,n2), ",vQ27m06=", string(vQ27m06,n2), ",vQ27m07=", string(vQ27m07,n2),
  ",vQ27m88=", string(vQ27m88,n2)
).
compute p1493="vQ20m02~=1 & vQ20m03~=1 & vQ20m02~=96 & vQ20m03~=96，不應答vQ27m01,vQ27m02,vQ27m03,vQ27m04,vQ27m05,vQ27m06,vQ27m07,vQ27m88而答".
end if.

* logic check show vQ23m01,vQ23m02,vQ23m03,vQ23m04,vQ23m05,vQ23m06,vQ23m07,vQ23m08,vQ23m09,vQ23m10,vQ23m11,vQ23m12,vQ23m13,vQ23m14,vQ23m15,vQ23m16,vQ23m17.
* vQ23m18,vQ23m19,vQ23m20,vQ23m21,vQ23m22,vQ23m23,vQ23m24,vQ23m25,vQ23m26,vQ23m27,vQ23m88.
do if (any(vQ20m03 , 1)) & (any(1 , vQ23m01_96) | any(1 , vQ23m02_96) | any(1 , vQ23m03_96) | any(1 , vQ23m04_96) | any(1 , vQ23m05_96) | any(1 , vQ23m06_96)
| any(1 , vQ23m07_96) | any(1 , vQ23m08_96) | any(1 , vQ23m09_96) | any(1 , vQ23m10_96) | any(1 , vQ23m11_96) | any(1 , vQ23m12_96) | any(1 , vQ23m13_96)
| any(1 , vQ23m14_96) | any(1 , vQ23m15_96) | any(1 , vQ23m16_96) | any(1 , vQ23m17_96) | any(1 , vQ23m18_96) | any(1 , vQ23m19_96) | any(1 , vQ23m20_96)
| any(1 , vQ23m21_96) | any(1 , vQ23m22_96) | any(1 , vQ23m23_96) | any(1 , vQ23m24_96) | any(1 , vQ23m25_96) | any(1 , vQ23m26_96) | any(1 , vQ23m27_96)
| any(1 , vQ23m88_96)).
compute m1494=concat(
  "vQ20m03=", string(vQ20m03,n2), ",vQ23m01=", string(vQ23m01,n2), ",vQ23m02=", string(vQ23m02,n2), ",vQ23m03=", string(vQ23m03,n2), ",vQ23m04=",
  string(vQ23m04,n2), ",vQ23m05=", string(vQ23m05,n2), ",vQ23m06=", string(vQ23m06,n2), ",vQ23m07=", string(vQ23m07,n2), ",vQ23m08=", string(vQ23m08,n2),
  ",vQ23m09=", string(vQ23m09,n2), ",vQ23m10=", string(vQ23m10,n2), ",vQ23m11=", string(vQ23m11,n2), ",vQ23m12=", string(vQ23m12,n2), ",vQ23m13=",
  string(vQ23m13,n2), ",vQ23m14=", string(vQ23m14,n2), ",vQ23m15=", string(vQ23m15,n2), ",vQ23m16=", string(vQ23m16,n2), ",vQ23m17=", string(vQ23m17,n2),
  ",vQ23m18=", string(vQ23m18,n2), ",vQ23m19=", string(vQ23m19,n2), ",vQ23m20=", string(vQ23m20,n2), ",vQ23m21=", string(vQ23m21,n2), ",vQ23m22=",
  string(vQ23m22,n2), ",vQ23m23=", string(vQ23m23,n2), ",vQ23m24=", string(vQ23m24,n2), ",vQ23m25=", string(vQ23m25,n2), ",vQ23m26=", string(vQ23m26,n2),
  ",vQ23m27=", string(vQ23m27,n2), ",vQ23m88=", string(vQ23m88,n2)
).
compute p1494=concat(
  "vQ20m03 in 1，應答vQ23m01,vQ23m02,vQ23m03,vQ23m04,vQ23m05,vQ23m06,vQ23m07,vQ23m08,vQ23m09,vQ23m10,vQ23m",
  "11,vQ23m12,vQ23m13,vQ23m14,vQ23m15,vQ23m16,vQ23m17,vQ23m18,vQ23m19,vQ23m20,vQ23m21,vQ23m22,vQ23m23,v",
  "Q23m24,vQ23m25,vQ23m26,vQ23m27,vQ23m88而未答"
).
end if.

* logic check hide vQ23m01,vQ23m02,vQ23m03,vQ23m04,vQ23m05,vQ23m06,vQ23m07,vQ23m08,vQ23m09,vQ23m10,vQ23m11,vQ23m12,vQ23m13,vQ23m14,vQ23m15,vQ23m16,vQ23m17.
* vQ23m18,vQ23m19,vQ23m20,vQ23m21,vQ23m22,vQ23m23,vQ23m24,vQ23m25,vQ23m26,vQ23m27,vQ23m88.
do if (not any(vQ20m03 , 1 , 96)) & (any(0 , vQ23m01_96) | any(0 , vQ23m02_96) | any(0 , vQ23m03_96) | any(0 , vQ23m04_96) | any(0 , vQ23m05_96) | any(0
, vQ23m06_96) | any(0 , vQ23m07_96) | any(0 , vQ23m08_96) | any(0 , vQ23m09_96) | any(0 , vQ23m10_96) | any(0 , vQ23m11_96) | any(0 , vQ23m12_96) | any(0
, vQ23m13_96) | any(0 , vQ23m14_96) | any(0 , vQ23m15_96) | any(0 , vQ23m16_96) | any(0 , vQ23m17_96) | any(0 , vQ23m18_96) | any(0 , vQ23m19_96) | any(0
, vQ23m20_96) | any(0 , vQ23m21_96) | any(0 , vQ23m22_96) | any(0 , vQ23m23_96) | any(0 , vQ23m24_96) | any(0 , vQ23m25_96) | any(0 , vQ23m26_96) | any(0
, vQ23m27_96) | any(0 , vQ23m88_96)).
compute m1495=concat(
  "vQ20m03=", string(vQ20m03,n2), ",vQ23m01=", string(vQ23m01,n2), ",vQ23m02=", string(vQ23m02,n2), ",vQ23m03=", string(vQ23m03,n2), ",vQ23m04=",
  string(vQ23m04,n2), ",vQ23m05=", string(vQ23m05,n2), ",vQ23m06=", string(vQ23m06,n2), ",vQ23m07=", string(vQ23m07,n2), ",vQ23m08=", string(vQ23m08,n2),
  ",vQ23m09=", string(vQ23m09,n2), ",vQ23m10=", string(vQ23m10,n2), ",vQ23m11=", string(vQ23m11,n2), ",vQ23m12=", string(vQ23m12,n2), ",vQ23m13=",
  string(vQ23m13,n2), ",vQ23m14=", string(vQ23m14,n2), ",vQ23m15=", string(vQ23m15,n2), ",vQ23m16=", string(vQ23m16,n2), ",vQ23m17=", string(vQ23m17,n2),
  ",vQ23m18=", string(vQ23m18,n2), ",vQ23m19=", string(vQ23m19,n2), ",vQ23m20=", string(vQ23m20,n2), ",vQ23m21=", string(vQ23m21,n2), ",vQ23m22=",
  string(vQ23m22,n2), ",vQ23m23=", string(vQ23m23,n2), ",vQ23m24=", string(vQ23m24,n2), ",vQ23m25=", string(vQ23m25,n2), ",vQ23m26=", string(vQ23m26,n2),
  ",vQ23m27=", string(vQ23m27,n2), ",vQ23m88=", string(vQ23m88,n2)
).
compute p1495=concat(
  "vQ20m03~=1 & vQ20m03~=96，不應答vQ23m01,vQ23m02,vQ23m03,vQ23m04,vQ23m05,vQ23m06,vQ23m07,vQ23m08,vQ23m09,",
  "vQ23m10,vQ23m11,vQ23m12,vQ23m13,vQ23m14,vQ23m15,vQ23m16,vQ23m17,vQ23m18,vQ23m19,vQ23m20,vQ23m21,vQ23",
  "m22,vQ23m23,vQ23m24,vQ23m25,vQ23m26,vQ23m27,vQ23m88而答"
).
end if.

* logic check show vQ26Ag1,vQ26Ag2.
do if (any(vQ20m04,1)) & (any(1,vQ26Ag1_96) | any(1,vQ26Ag2_96)).
compute m1496=concat("vQ20m04=",string(vQ20m04,n2),",vQ26Ag1=",string(vQ26Ag1,n4),",vQ26Ag2=",string(vQ26Ag2,n3)).
compute p1496="vQ20m04 in 1，應答vQ26Ag1,vQ26Ag2而未答".
end if.

* logic check hide vQ26Ag1,vQ26Ag2.
do if (not any(vQ20m04,1,96)) & (any(0,vQ26Ag1_96) | any(0,vQ26Ag2_96)).
compute m1497=concat("vQ20m04=",string(vQ20m04,n2),",vQ26Ag1=",string(vQ26Ag1,n4),",vQ26Ag2=",string(vQ26Ag2,n3)).
compute p1497="vQ20m04~=1 & vQ20m04~=96，不應答vQ26Ag1,vQ26Ag2而答".
end if.

* logic check show vQ26m01,vQ26m02,vQ26m03,vQ26m04,vQ26m05,vQ26m06,vQ26m07,vQ26m08,vQ26m09,vQ26m10,vQ26m11,vQ26m12,vQ26m13,vQ26m14,vQ26m15,vQ26m16,vQ26m17.
* vQ26m18,vQ26m19,vQ26m20,vQ26m21,vQ26m22,vQ26m23,vQ26m24,vQ26m25,vQ26m26,vQ26m27,vQ26m28,vQ26m29,vQ26m88.
do if (any(vQ20m04 , 1)) & (any(1 , vQ26m01_96) | any(1 , vQ26m02_96) | any(1 , vQ26m03_96) | any(1 , vQ26m04_96) | any(1 , vQ26m05_96) | any(1 , vQ26m06_96)
| any(1 , vQ26m07_96) | any(1 , vQ26m08_96) | any(1 , vQ26m09_96) | any(1 , vQ26m10_96) | any(1 , vQ26m11_96) | any(1 , vQ26m12_96) | any(1 , vQ26m13_96)
| any(1 , vQ26m14_96) | any(1 , vQ26m15_96) | any(1 , vQ26m16_96) | any(1 , vQ26m17_96) | any(1 , vQ26m18_96) | any(1 , vQ26m19_96) | any(1 , vQ26m20_96)
| any(1 , vQ26m21_96) | any(1 , vQ26m22_96) | any(1 , vQ26m23_96) | any(1 , vQ26m24_96) | any(1 , vQ26m25_96) | any(1 , vQ26m26_96) | any(1 , vQ26m27_96)
| any(1 , vQ26m28_96) | any(1 , vQ26m29_96) | any(1 , vQ26m88_96)).
compute m1498=concat(
  "vQ20m04=", string(vQ20m04,n2), ",vQ26m01=", string(vQ26m01,n2), ",vQ26m02=", string(vQ26m02,n2), ",vQ26m03=", string(vQ26m03,n2), ",vQ26m04=",
  string(vQ26m04,n2), ",vQ26m05=", string(vQ26m05,n2), ",vQ26m06=", string(vQ26m06,n2), ",vQ26m07=", string(vQ26m07,n2), ",vQ26m08=", string(vQ26m08,n2),
  ",vQ26m09=", string(vQ26m09,n2), ",vQ26m10=", string(vQ26m10,n2), ",vQ26m11=", string(vQ26m11,n2), ",vQ26m12=", string(vQ26m12,n2), ",vQ26m13=",
  string(vQ26m13,n2), ",vQ26m14=", string(vQ26m14,n2), ",vQ26m15=", string(vQ26m15,n2), ",vQ26m16=", string(vQ26m16,n2), ",vQ26m17=", string(vQ26m17,n2),
  ",vQ26m18=", string(vQ26m18,n2), ",vQ26m19=", string(vQ26m19,n2), ",vQ26m20=", string(vQ26m20,n2), ",vQ26m21=", string(vQ26m21,n2), ",vQ26m22=",
  string(vQ26m22,n2), ",vQ26m23=", string(vQ26m23,n2), ",vQ26m24=", string(vQ26m24,n2), ",vQ26m25=", string(vQ26m25,n2), ",vQ26m26=", string(vQ26m26,n2),
  ",vQ26m27=", string(vQ26m27,n2), ",vQ26m28=", string(vQ26m28,n2), ",vQ26m29=", string(vQ26m29,n2), ",vQ26m88=", string(vQ26m88,n2)
).
compute p1498=concat(
  "vQ20m04 in 1，應答vQ26m01,vQ26m02,vQ26m03,vQ26m04,vQ26m05,vQ26m06,vQ26m07,vQ26m08,vQ26m09,vQ26m10,vQ26m",
  "11,vQ26m12,vQ26m13,vQ26m14,vQ26m15,vQ26m16,vQ26m17,vQ26m18,vQ26m19,vQ26m20,vQ26m21,vQ26m22,vQ26m23,v",
  "Q26m24,vQ26m25,vQ26m26,vQ26m27,vQ26m28,vQ26m29,vQ26m88而未答"
).
end if.

* logic check hide vQ26m01,vQ26m02,vQ26m03,vQ26m04,vQ26m05,vQ26m06,vQ26m07,vQ26m08,vQ26m09,vQ26m10,vQ26m11,vQ26m12,vQ26m13,vQ26m14,vQ26m15,vQ26m16,vQ26m17.
* vQ26m18,vQ26m19,vQ26m20,vQ26m21,vQ26m22,vQ26m23,vQ26m24,vQ26m25,vQ26m26,vQ26m27,vQ26m28,vQ26m29,vQ26m88.
do if (not any(vQ20m04 , 1 , 96)) & (any(0 , vQ26m01_96) | any(0 , vQ26m02_96) | any(0 , vQ26m03_96) | any(0 , vQ26m04_96) | any(0 , vQ26m05_96) | any(0
, vQ26m06_96) | any(0 , vQ26m07_96) | any(0 , vQ26m08_96) | any(0 , vQ26m09_96) | any(0 , vQ26m10_96) | any(0 , vQ26m11_96) | any(0 , vQ26m12_96) | any(0
, vQ26m13_96) | any(0 , vQ26m14_96) | any(0 , vQ26m15_96) | any(0 , vQ26m16_96) | any(0 , vQ26m17_96) | any(0 , vQ26m18_96) | any(0 , vQ26m19_96) | any(0
, vQ26m20_96) | any(0 , vQ26m21_96) | any(0 , vQ26m22_96) | any(0 , vQ26m23_96) | any(0 , vQ26m24_96) | any(0 , vQ26m25_96) | any(0 , vQ26m26_96) | any(0
, vQ26m27_96) | any(0 , vQ26m28_96) | any(0 , vQ26m29_96) | any(0 , vQ26m88_96)).
compute m1499=concat(
  "vQ20m04=", string(vQ20m04,n2), ",vQ26m01=", string(vQ26m01,n2), ",vQ26m02=", string(vQ26m02,n2), ",vQ26m03=", string(vQ26m03,n2), ",vQ26m04=",
  string(vQ26m04,n2), ",vQ26m05=", string(vQ26m05,n2), ",vQ26m06=", string(vQ26m06,n2), ",vQ26m07=", string(vQ26m07,n2), ",vQ26m08=", string(vQ26m08,n2),
  ",vQ26m09=", string(vQ26m09,n2), ",vQ26m10=", string(vQ26m10,n2), ",vQ26m11=", string(vQ26m11,n2), ",vQ26m12=", string(vQ26m12,n2), ",vQ26m13=",
  string(vQ26m13,n2), ",vQ26m14=", string(vQ26m14,n2), ",vQ26m15=", string(vQ26m15,n2), ",vQ26m16=", string(vQ26m16,n2), ",vQ26m17=", string(vQ26m17,n2),
  ",vQ26m18=", string(vQ26m18,n2), ",vQ26m19=", string(vQ26m19,n2), ",vQ26m20=", string(vQ26m20,n2), ",vQ26m21=", string(vQ26m21,n2), ",vQ26m22=",
  string(vQ26m22,n2), ",vQ26m23=", string(vQ26m23,n2), ",vQ26m24=", string(vQ26m24,n2), ",vQ26m25=", string(vQ26m25,n2), ",vQ26m26=", string(vQ26m26,n2),
  ",vQ26m27=", string(vQ26m27,n2), ",vQ26m28=", string(vQ26m28,n2), ",vQ26m29=", string(vQ26m29,n2), ",vQ26m88=", string(vQ26m88,n2)
).
compute p1499=concat(
  "vQ20m04~=1 & vQ20m04~=96，不應答vQ26m01,vQ26m02,vQ26m03,vQ26m04,vQ26m05,vQ26m06,vQ26m07,vQ26m08,vQ26m09,",
  "vQ26m10,vQ26m11,vQ26m12,vQ26m13,vQ26m14,vQ26m15,vQ26m16,vQ26m17,vQ26m18,vQ26m19,vQ26m20,vQ26m21,vQ26",
  "m22,vQ26m23,vQ26m24,vQ26m25,vQ26m26,vQ26m27,vQ26m28,vQ26m29,vQ26m88而答"
).
end if.

* logic check show vQ50.
do if (any(vQ49,2,97,98)) & any(1,vQ50_96).
compute m1500=concat("vQ49=",string(vQ49,n2),",vQ50=",string(vQ50,n2)).
compute p1500="vQ49 in 2 | vQ49 in 97 | vQ49 in 98，應答vQ50而未答".
end if.

* logic check hide vQ50.
do if (not any(vQ49,2,97,98)) & any(0,vQ50_96).
compute m1501=concat("vQ49=",string(vQ49,n2),",vQ50=",string(vQ50,n2)).
compute p1501="vQ49~=2 & vQ49~=97 & vQ49~=98，不應答vQ50而答".
end if.

* logic check show vQ51.
do if (any(vQ49,1) | any(vQ50,1)) & any(1,vQ51_96).
compute m1502=concat("vQ49=",string(vQ49,n2),",vQ50=",string(vQ50,n2),",vQ51=",string(vQ51,n2)).
compute p1502="vQ49 in 1 | vQ50 in 1，應答vQ51而未答".
end if.

* logic check hide vQ51.
do if (vQ49~=1 & not any(vQ50,1,96)) & any(0,vQ51_96).
compute m1503=concat("vQ49=",string(vQ49,n2),",vQ50=",string(vQ50,n2),",vQ51=",string(vQ51,n2)).
compute p1503="vQ49~=1 & vQ50~=1 & vQ50~=96，不應答vQ51而答".
end if.

* logic check show vQ52.
do if (any(vQ51 , 1 , 2 , 3 , 4 , 5 , 6 , 7 , 8 , 9 , 10 , 11 , 12 , 13 , 14 , 15 , 16 , 17 , 18 , 19 , 20 , 21 , 22 , 23 , 24 , 25 , 26 , 27 , 28 , 29 , 30
, 31 , 32 , 33 , 34 , 35 , 36 , 37 , 38 , 39 , 40 , 41 , 42 , 43 , 44 , 45 , 46 , 47 , 48 , 49 , 50 , 51 , 52 , 53 , 54 , 55 , 56 , 57 , 58 , 59 , 60 , 61 , 62
, 63 , 64 , 65 , 66 , 67 , 68 , 69 , 70 , 71 , 72 , 73 , 74 , 75 , 76 , 77 , 78 , 79 , 80 , 81 , 82 , 83 , 84 , 85 , 86 , 87 , 88)) & any(1 , vQ52_96).
compute m1504=concat("vQ51=",string(vQ51,n2),",vQ52=",string(vQ52,n2)).
compute p1504=concat(
  "vQ51 in 1 | vQ51 in 2 | vQ51 in 3 | vQ51 in 4 | vQ51 in 5 | vQ51 in 6 | vQ51 in 7 | vQ51 in 8 | vQ51",
  " in 9 | vQ51 in 10 | vQ51 in 11 | vQ51 in 12 | vQ51 in 13 | vQ51 in 14 | vQ51 in 15 | vQ51 in 16 | v",
  "Q51 in 17 | vQ51 in 18 | vQ51 in 19 | vQ51 in 20 | vQ51 in 21 | vQ51 in 22 | vQ51 in 23 | vQ51 in 24",
  " | vQ51 in 25 | vQ51 in 26 | vQ51 in 27 | vQ51 in 28 | vQ51 in 29 | vQ51 in 30 | vQ51 in 31 | vQ51 i",
  "n 32 | vQ51 in 33 | vQ51 in 34 | vQ51 in 35 | vQ51 in 36 | vQ51 in 37 | vQ51 in 38 | vQ51 in 39 | vQ",
  "51 in 40 | vQ51 in 41 | vQ51 in 42 | vQ51 in 43 | vQ51 in 44 | vQ51 in 45 | vQ51 in 46 | vQ51 in 47 ",
  "| vQ51 in 48 | vQ51 in 49 | vQ51 in 50 | vQ51 in 51 | vQ51 in 52 | vQ51 in 53 | vQ51 in 54 | vQ51 in",
  " 55 | vQ51 in 56 | vQ51 in 57 | vQ51 in 58 | vQ51 in 59 | vQ51 in 60 | vQ51 in 61 | vQ51 in 62 | vQ5",
  "1 in 63 | vQ51 in 64 | vQ51 in 65 | vQ51 in 66 | vQ51 in 67 | vQ51 in 68 | vQ51 in 69 | vQ51 in 70 |",
  " vQ51 in 71 | vQ51 in 72 | vQ51 in 73 | vQ51 in 74 | vQ51 in 75 | vQ51 in 76 | vQ51 in 77 | vQ51 in ",
  "78 | vQ51 in 79 | vQ51 in 80 | vQ51 in 81 | vQ51 in 82 | vQ51 in 83 | vQ51 in 84 | vQ51 in 85 | vQ51",
  " in 86 | vQ51 in 87 | vQ51 in 88，應答vQ52而未答"
).
end if.

* logic check hide vQ52.
do if (not any(vQ51 , 1 , 2 , 3 , 4 , 5 , 6 , 7 , 8 , 9 , 10 , 11 , 12 , 13 , 14 , 15 , 16 , 17 , 18 , 19 , 20 , 21 , 22 , 23 , 24 , 25 , 26 , 27 , 28 , 29 , 30
, 31 , 32 , 33 , 34 , 35 , 36 , 37 , 38 , 39 , 40 , 41 , 42 , 43 , 44 , 45 , 46 , 47 , 48 , 49 , 50 , 51 , 52 , 53 , 54 , 55 , 56 , 57 , 58 , 59 , 60 , 61 , 62
, 63 , 64 , 65 , 66 , 67 , 68 , 69 , 70 , 71 , 72 , 73 , 74 , 75 , 76 , 77 , 78 , 79 , 80 , 81 , 82 , 83 , 84 , 85 , 86 , 87 , 88 , 96)) & any(0 , vQ52_96).
compute m1505=concat("vQ51=",string(vQ51,n2),",vQ52=",string(vQ52,n2)).
compute p1505=concat(
  "vQ51~=1 & vQ51~=2 & vQ51~=3 & vQ51~=4 & vQ51~=5 & vQ51~=6 & vQ51~=7 & vQ51~=8 & vQ51~=9 & vQ51~=10 &",
  " vQ51~=11 & vQ51~=12 & vQ51~=13 & vQ51~=14 & vQ51~=15 & vQ51~=16 & vQ51~=17 & vQ51~=18 & vQ51~=19 & ",
  "vQ51~=20 & vQ51~=21 & vQ51~=22 & vQ51~=23 & vQ51~=24 & vQ51~=25 & vQ51~=26 & vQ51~=27 & vQ51~=28 & v",
  "Q51~=29 & vQ51~=30 & vQ51~=31 & vQ51~=32 & vQ51~=33 & vQ51~=34 & vQ51~=35 & vQ51~=36 & vQ51~=37 & vQ",
  "51~=38 & vQ51~=39 & vQ51~=40 & vQ51~=41 & vQ51~=42 & vQ51~=43 & vQ51~=44 & vQ51~=45 & vQ51~=46 & vQ5",
  "1~=47 & vQ51~=48 & vQ51~=49 & vQ51~=50 & vQ51~=51 & vQ51~=52 & vQ51~=53 & vQ51~=54 & vQ51~=55 & vQ51",
  "~=56 & vQ51~=57 & vQ51~=58 & vQ51~=59 & vQ51~=60 & vQ51~=61 & vQ51~=62 & vQ51~=63 & vQ51~=64 & vQ51~",
  "=65 & vQ51~=66 & vQ51~=67 & vQ51~=68 & vQ51~=69 & vQ51~=70 & vQ51~=71 & vQ51~=72 & vQ51~=73 & vQ51~=",
  "74 & vQ51~=75 & vQ51~=76 & vQ51~=77 & vQ51~=78 & vQ51~=79 & vQ51~=80 & vQ51~=81 & vQ51~=82 & vQ51~=8",
  "3 & vQ51~=84 & vQ51~=85 & vQ51~=86 & vQ51~=87 & vQ51~=88 & vQ51~=96，不應答vQ52而答"
).
end if.

* logic check show vZE2_2.
do if (any(vZE2m01,1)) & vZE2_2="96".
compute m1506=concat("vZE2m01=",string(vZE2m01,n2),",vZE2_2=",rtrim(ltrim(vZE2_2))).
compute p1506="vZE2m01 in 1，應答vZE2_2而未答".
end if.

* logic check hide vZE2_2.
do if (not any(vZE2m01,1,96)) & vZE2_2~="96".
compute m1507=concat("vZE2m01=",string(vZE2m01,n2),",vZE2_2=",rtrim(ltrim(vZE2_2))).
compute p1507="vZE2m01~=1 & vZE2m01~=96，不應答vZE2_2而答".
end if.

* logic check show vZE2_1.
do if (vZE2m01=1 | vZE2m02=1) & vZE2_1="96".
compute m1508=concat("vZE2m01=",string(vZE2m01,n2),",vZE2m02=",string(vZE2m02,n2),",vZE2_1=",rtrim(ltrim(vZE2_1))).
compute p1508="vZE2m01=1 | vZE2m02=1，應答vZE2_1而未答".
end if.

* logic check hide vZE2_1.
do if (not any(vZE2m01,1,96) & not any(vZE2m02,1,96)) & vZE2_1~="96".
compute m1509=concat("vZE2m01=",string(vZE2m01,n2),",vZE2m02=",string(vZE2m02,n2),",vZE2_1=",rtrim(ltrim(vZE2_1))).
compute p1509="vZE2m01~=1 & vZE2m02~=1 & vZE2m01~=96 & vZE2m02~=96，不應答vZE2_1而答".
end if.

* logic check show vZE2_3.
do if (any(vZE2m02,1)) & vZE2_3="96".
compute m1510=concat("vZE2m02=",string(vZE2m02,n2),",vZE2_3=",rtrim(ltrim(vZE2_3))).
compute p1510="vZE2m02 in 1，應答vZE2_3而未答".
end if.

* logic check hide vZE2_3.
do if (not any(vZE2m02,1,96)) & vZE2_3~="96".
compute m1511=concat("vZE2m02=",string(vZE2m02,n2),",vZE2_3=",rtrim(ltrim(vZE2_3))).
compute p1511="vZE2m02~=1 & vZE2m02~=96，不應答vZE2_3而答".
end if.

* SYNTAXWORK_END_LOGIC.

* Encoding: UTF-8.
**五、檢核項目清單.
* SYNTAXWORK_BEGIN_EXTERNAL_CHECKS.
* aggregate variables.
compute sumE5_E12_min=0.
if (not(any(vE5,9797,9898,99996))) sumE5_E12_min=sumE5_E12_min + (trunc(vE5/100)*60 + mod(vE5,100)).
if (not(any(vE6,9797,9898,99996))) sumE5_E12_min=sumE5_E12_min + (trunc(vE6/100)*60 + mod(vE6,100)).
if (not(any(vE8,9797,9898,99996))) sumE5_E12_min=sumE5_E12_min + (trunc(vE8/100)*60 + mod(vE8,100)).
if (not(any(vE9,9797,9898,99996))) sumE5_E12_min=sumE5_E12_min + (trunc(vE9/100)*60 + mod(vE9,100)).
if (not(any(vE11,9797,9898,99996))) sumE5_E12_min=sumE5_E12_min + (trunc(vE11/100)*60 + mod(vE11,100)).
if (not(any(vE12,9797,9898,99996))) sumE5_E12_min=sumE5_E12_min + (trunc(vE12/100)*60 + mod(vE12,100)).

compute sumE5_E8_E11_min=0.
if (not(any(vE5,9797,9898,99996))) sumE5_E8_E11_min=sumE5_E8_E11_min + (trunc(vE5/100)*60 + mod(vE5,100)).
if (not(any(vE8,9797,9898,99996))) sumE5_E8_E11_min=sumE5_E8_E11_min + (trunc(vE8/100)*60 + mod(vE8,100)).
if (not(any(vE11,9797,9898,99996))) sumE5_E8_E11_min=sumE5_E8_E11_min + (trunc(vE11/100)*60 + mod(vE11,100)).

compute sumE6_E9_E12_min=0.
if (not(any(vE6,9797,9898,99996))) sumE6_E9_E12_min=sumE6_E9_E12_min + (trunc(vE6/100)*60 + mod(vE6,100)).
if (not(any(vE9,9797,9898,99996))) sumE6_E9_E12_min=sumE6_E9_E12_min + (trunc(vE9/100)*60 + mod(vE9,100)).
if (not(any(vE12,9797,9898,99996))) sumE6_E9_E12_min=sumE6_E9_E12_min + (trunc(vE12/100)*60 + mod(vE12,100)).

compute sumE5_E6_min=0.
if (not(any(vE5,9797,9898,99996))) sumE5_E6_min=sumE5_E6_min + (trunc(vE5/100)*60 + mod(vE5,100)).
if (not(any(vE6,9797,9898,99996))) sumE5_E6_min=sumE5_E6_min + (trunc(vE6/100)*60 + mod(vE6,100)).

compute sumE8_E9_min=0.
if (not(any(vE8,9797,9898,99996))) sumE8_E9_min=sumE8_E9_min + (trunc(vE8/100)*60 + mod(vE8,100)).
if (not(any(vE9,9797,9898,99996))) sumE8_E9_min=sumE8_E9_min + (trunc(vE9/100)*60 + mod(vE9,100)).

compute sumE11_E12_min=0.
if (not(any(vE11,9797,9898,99996))) sumE11_E12_min=sumE11_E12_min + (trunc(vE11/100)*60 + mod(vE11,100)).
if (not(any(vE12,9797,9898,99996))) sumE11_E12_min=sumE11_E12_min + (trunc(vE12/100)*60 + mod(vE12,100)).
* external check 【A01】: sel_gen,O1.
do if (sel_gen=2 & any(vO1,12,13)).
compute m1601=concat("sel_gen=",string(sel_gen,n2),",vO1=",string(vO1,n2)).
compute p1601="【A01】 受訪者為女性,但vO1工作狀況選(12)服義務役或(13)服(研發)替代役。".
end if.
exec.

* external check 【B01】: A1,A2,A3,A9.
do if (vA1>=57 & any(vA3,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,97,98) & any(vA9,1,2)).
compute m1602=concat(
  "vA1=",
  string(vA1,n4),
  ",vA2=",
  string(vA2,n2),
  ",vA3=",
  string(vA3,n2),
  ",vA9=",
  string(vA9,n2)
).
compute p1602="【B01】 57年施行九年國民義務教育,出生年在57年次以後(57歲及以下),且為台灣出生者(vA3選1-22、97、98),於vA9教育程度,不應為(01)不識字、(02)自修/小學 | (年齡計算以114年減出生年)。".
end if.
exec.

* external check 【B02】: A1,A2,A9.
do if (vA1>92 & any(vA9,7,8)).
compute m1603=concat(
  "vA1=",
  string(vA1,n4),
  ",vA2=",
  string(vA2,n2),
  ",vA9=",
  string(vA9,n2)
).
compute p1603="【B02】 出生年超過民國92年次(未滿22歲者),vA9教育程度不應為(07)碩士、(08)博士 | (年齡計算以114年減出生年)。".
end if.
exec.

* external check 【B03】: B2.
do if (not(any(vB2,9797,9898)) & vB2>1200).
compute m1604=concat("vB2=",string(vB2,n5)).
compute p1604="【B03】 vB2看電視的平常日(週一到週五),一整天看超過12小時,列出確認。".
end if.
exec.

* external check 【B04】: B4.
do if (not(any(vB4,9797,9898)) & vB4>1200).
compute m1605=concat("vB4=",string(vB4,n5)).
compute p1605="【B04】 vB4有看電視的週六或週日,一整天看超過12小時,列出確認。".
end if.
exec.

* external check 【B05】: B6.
do if (not(any(vB6,9797,9898)) & vB6>1200).
compute m1606=concat("vB6=",string(vB6,n5)).
compute p1606="【B05】 vB6看電視新聞的那一天,一整天看超過12小時,列出確認。".
end if.
exec.

* external check 【B06】: C2.
do if (not(any(vC2,9797,9898)) & vC2>1200).
compute m1607=concat("vC2=",string(vC2,n5)).
compute p1607="【B06】 vC2有聽廣播的那一天,一整天聽超過12小時,列出確認。".
end if.
exec.

* external check 【B07】: D3.
do if (not(any(vD3,9797,9898)) & vD3>1600).
compute m1608=concat("vD3=",string(vD3,n5)).
compute p1608="【B07】 vD3有用手機的那一天,一整天用超過16小時,列出確認。".
end if.
exec.

* external check 【B08】: E5,E8,E11.
do if (not(any(vE5,9797,9898)) & not(any(vE8,9797,9898)) & not(any(vE11,9797,9898)) & ((trunc(vE5/100)*60 + mod(vE5,100)) + (trunc(vE8/100)*60 + mod(vE8,100))
+ (trunc(vE11/100)*60 + mod(vE11,100)))>960).
compute m1609=concat(
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
compute p1609="【B08】 各項裝置(手機、平板及電腦)因工作與課業而上網的時間相加超過16小時,列出確認。".
end if.
exec.

* external check 【B09】: E5,E8,E11.
do if (not(any(vE6,9797,9898)) & not(any(vE9,9797,9898)) & not(any(vE12,9797,9898)) & ((trunc(vE6/100)*60 + mod(vE6,100)) + (trunc(vE9/100)*60 + mod(vE9,100))
+ (trunc(vE12/100)*60 + mod(vE12,100)))>960).
compute m1610=concat(
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
compute p1610="【B09】 各項裝置(手機、平板及電腦)非因工作與課業而上網的時間相加超過16小時,列出確認。".
end if.
exec.

* external check 【B10】: E5,E6.
do if (not(any(vE5,9797,9898)) & not(any(vE6,9797,9898)) & ((trunc(vE5/100)*60 + mod(vE5,100)) + (trunc(vE6/100)*60 + mod(vE6,100)))>960).
compute m1611=concat(
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
compute p1611="【B10】 vE5、vE6使用手機上網的時間相加超過16小時。".
end if.
exec.

* external check 【B11】: E8,E9.
do if (not(any(vE8,9797,9898)) & not(any(vE9,9797,9898)) & ((trunc(vE8/100)*60 + mod(vE8,100)) + (trunc(vE9/100)*60 + mod(vE9,100)))>960).
compute m1612=concat(
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
compute p1612="【B11】 vE8、vE9使用平板上網的時間相加超過16小時。".
end if.
exec.

* external check 【B12】: E11,E12.
do if (not(any(vE11,9797,9898)) & not(any(vE12,9797,9898)) & ((trunc(vE11/100)*60 + mod(vE11,100)) + (trunc(vE12/100)*60 + mod(vE12,100)))>960).
compute m1613=concat(
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
compute p1613="【B12】 vE11、vE12使用電腦上網的時間相加超過16小時。".
end if.
exec.

* external check 【B13】: E5,E6,D3.
do if ((vE5+vE6)>(vD3+200)).
compute m1614=concat(
  "vE5=",
  string(vE5,n5),
  ",vE6=",
  string(vE6,n5),
  ",vD3=",
  string(vD3,n5)
).
compute p1614="【B13】 vE5、vE6使用手機上網的時間相加大於vD3的時間2小時,列出確認。".
end if.
exec.

* external check 【B14】: E14.
* TODO: blank condition in Excel; fill the condition before enabling this rule.
* do if .
* compute m1615=concat("vE14=",string(vE14,n7)).
* compute p1615="【B14】 vE14平均每月在網路上消費(買東西)超過O5收入題,列出確認。".
* end if.
* exec.

* external check 【B15】: F2.
do if (not(any(vF2,9797,9898)) & vF2>500).
compute m1616=concat("vF2=",string(vF2,n5)).
compute p1616="【B15】 vF2有讀雜誌(紙本),一整天看超過5小時,列出確認。".
end if.
exec.

* external check 【B16】: F4.
do if (not(any(vF4,9797,9898)) & vF4>500).
compute m1617=concat("vF4=",string(vF4,n5)).
compute p1617="【B16】 vF4有讀雜誌(網路),一整天看超過5小時,列出確認。".
end if.
exec.

* external check 【B17】: G2.
do if (not(any(vG2,9797,9898)) & vG2>500).
compute m1618=concat("vG2=",string(vG2,n5)).
compute p1618="【B17】 vG2有讀報紙(紙本),一整天看超過5小時,列出確認。".
end if.
exec.

* external check 【B18】: G5.
do if (not(any(vG5,9797,9898)) & vG5>500).
compute m1619=concat("vG5=",string(vG5,n5)).
compute p1619="【B18】 vG5有上網看新聞的那一天,一整天看超過5小時,列出確認。".
end if.
exec.

* external check 【B19】: H1,H4,H7.
do if (range(vH1,0,990) & range(vH4,0,990) & vH7=997).
compute m1620=concat(
  "vH1=",
  string(vH1,n4),
  ",vH4=",
  string(vH4,n4),
  ",vH7=",
  string(vH7,n4)
).
compute p1620="【B19】 vH1「面對面」接觸人數回答0~990且vH4「網路上」接觸人數回答0~990,在vH7「面對面」且「網路上」接觸的人數卻回答(997)不知道。".
end if.
exec.

* external check 【B20】: H7,H7_1,H7_2,H7_3.
do if ((not(any(vH7,991,997,998)) & vH7>30) | (not(any(vH7_1,991,997,998)) & vH7_1>30) | (not(any(vH7_2,991,997,998)) & vH7_2>30) | (not(any(vH7_3,991,997,998))
& vH7_3>30)).
compute m1621=concat(
  "vH7=",
  string(vH7,n4),
  ",vH7_1=",
  string(vH7_1,n4),
  ",vH7_2=",
  string(vH7_2,n4),
  ",vH7_3=",
  string(vH7_3,n4)
).
compute p1621="【B20】 vH7-vH7_3平常一天「面對面」且「網路上」接觸的人數超過30人,列出確認。".
end if.
exec.

* external check 【B21】: Q24.
do if (not(any(vQ24g1,997,998)) & vQ24g1>35).
compute m1622=concat("vQ24g1=",string(vQ24g1,n4)).
compute p1622="【B21】 vQ24看談話性政論節目,每星期看超過35小時,列出確認。".
end if.
exec.

* external check 【B22】: Q21.
do if (not(any(vQ21g1,997,998)) & vQ21g1>35).
compute m1623=concat("vQ21g1=",string(vQ21g1,n4)).
compute p1623="【B22】 vQ21看政治人物或政治網紅影片,每星期看超過35小時,列出確認。".
end if.
exec.

* external check 【B23】: Q26A.
do if (not(any(vQ26Ag1,997,998)) & vQ26Ag1>35).
compute m1624=concat("vQ26Ag1=",string(vQ26Ag1,n4)).
compute p1624="【B23】 vQ26A聽政治或公共事務播客,每星期聽超過35小時,列出確認。".
end if.
exec.

* external check 【B24】: Q28.
do if ((not(any(vQ28,991,997,998)) & vQ28>50)).
compute m1625=concat("vQ28=",string(vQ28,n4)).
compute p1625="【B24】 vQ28經常一起討論政治或公共事務的人數超過50人,列出確認。".
end if.
exec.

* external check 【B25】: H8.
do if ((not(any(vH8,991,997,998)) & vH8>50)).
compute m1626=concat("vH8=",string(vH8,n4)).
compute p1626="【B25】 vH8經常會一起討論「個人」問題或心事的人超過50人,列出確認。".
end if.
exec.

* external check 【B26】: I2.
do if (not(any(vI2,9797,9898)) & vI2>1200).
compute m1627=concat("vI2=",string(vI2,n5)).
compute p1627="【B26】 vI2看戲劇節目的平常日(週一到週五),一整天看超過12小時,列出確認。".
end if.
exec.

* external check 【B27】: I4.
do if (not(any(vI4,9797,9898)) & vI4>1200).
compute m1628=concat("vI4=",string(vI4,n5)).
compute p1628="【B27】 vI4看戲劇節目的週六或週日,一整天看超過12小時,列出確認。".
end if.
exec.

* external check 【B28】: KFB2.
do if (not(any(vKFB2,9797,9898)) & vKFB2>1600).
compute m1629=concat("vKFB2=",string(vKFB2,n5)).
compute p1629="【B28】 vKFB2有使用臉書,一整天用超過16小時,列出確認。".
end if.
exec.

* external check 【B29】: KIG2.
do if (not(any(vKIG2,9797,9898)) & vKIG2>1600).
compute m1630=concat("vKIG2=",string(vKIG2,n5)).
compute p1630="【B29】 vKIG2有使用IG,一整天用超過16小時,列出確認。".
end if.
exec.

* external check 【B30】: KLI2.
do if (not(any(vKLI2,9797,9898)) & vKLI2>1600).
compute m1631=concat("vKLI2=",string(vKLI2,n5)).
compute p1631="【B30】 vKLI2有使用LINE,一整天用超過16小時,列出確認。".
end if.
exec.

* external check 【B31】: KTT2.
do if (not(any(vKTT2,9797,9898)) & vKTT2>1600).
compute m1632=concat("vKTT2=",string(vKTT2,n5)).
compute p1632="【B31】 vKTT2有使用抖音(TikTok),一整天用超過16小時,列出確認。".
end if.
exec.

* external check 【B32】: KYT2.
do if (not(any(vKYT2,9797,9898)) & vKYT2>1600).
compute m1633=concat("vKYT2=",string(vKYT2,n5)).
compute p1633="【B32】 vKYT2有使用YouTube,一整天用超過16小時,列出確認。".
end if.
exec.

* external check 【B33】: P5_2.
do if (not(any(vP5_2,9797,9898)) & vP5_2>1600).
compute m1634=concat("vP5_2=",string(vP5_2,n5)).
compute p1634="【B33】 vP5_2有使用Threads,一整天用超過16小時,列出確認。".
end if.
exec.

* external check 【B34】: M1.
do if (not(any(vM1g01,9797,9898)) & not(any(vM1g02,9797,9898)) & ((trunc(vM1g01/100)*60 + mod(vM1g01,100)) + (trunc(vM1g02/100)*60 + mod(vM1g02,100)))>3840).
compute m1635=concat("vM1g01=",string(vM1g01,n2),",vM1g02=",string(vM1g02,n2)).
compute p1635="【B34】 vM1玩電玩遊戲一週超過64小時列出確認。".
end if.
exec.

* external check 【B35】: vA1,O1.
do if (vA1>74 & vO1=9).
compute m1636=concat("vA1=",string(vA1,n4),",vO1=",string(vO1,n2)).
compute p1636="【B35】 出生年超過民國74年次(未滿40歲者),vO1目前工作不應為(09)已經退休 | (年齡計算以114減出生年)。".
end if.
exec.

* external check 【B36】: Z2_1.
* TODO: blank condition in Excel; fill the condition before enabling this rule.
* do if .
* compute m1637=concat("vZ2_1g1=",rtrim(ltrim(vZ2_1g1)),",vZ2_1g2=",rtrim(ltrim(vZ2_1g2))).
* compute p1637=concat(
*   "【B36】 1.市話號碼長度為9碼(北北基、台中、南投以外縣市電話),前兩碼應為03、05、06、07、08或前三碼為047、048。 | 2.市話號碼長度為10碼(北北基、台中、南投電話),前兩碼應",
*   "為02或前三碼為042、043、049。 | 3.市話號碼不可重複。 | 4.分機號碼長度超過4碼,列出確認。 | 5.市話號碼不應該為系統範例電話0227887792或0212345678。"
* ).
* end if.
* exec.

* external check 【B37】: Z2_2,ZE2_1.
* TODO: blank condition in Excel; fill the condition before enabling this rule.
* do if .
* compute m1638=concat("vZ2_2=",rtrim(ltrim(vZ2_2)),",vZE2_1=",rtrim(ltrim(vZE2_1))).
* compute p1638="【B37】 1.手機號碼長度應為10碼且前兩碼應為09。 | 2.手機號碼不可重複。 | 3.手機號碼不應該為0912345678。".
* end if.
* exec.

* external check 【B38】: ZE2_3.
* TODO: blank condition in Excel; fill the condition before enabling this rule.
* do if .
* compute m1639=concat("vZE2_3=",rtrim(ltrim(vZE2_3))).
* compute p1639="【B38】 1.Email的@為全形。 | 2.Email帳號長度<=2。 | 3.Email網域長度<=4或不在網域清單內。 | 4.Email不可有特殊符號。 | 5.Email不可重複。".
* end if.
* exec.

* external check 【B39】: K1,KTT4.
do if (vK1m11=1 & vKTT4m13~=1 & vKTT4m14~=1).
compute m1640=concat(
  "vK1m11=",
  string(vK1m11,n2),
  ",vKTT4m13=",
  string(vKTT4m13,n2),
  ",vKTT4m14=",
  string(vKTT4m14,n2)
).
compute p1640="【B39】 K1有選(11)抖音,KTT4非選(97)不知道(98)拒答者,沒有選(13)分享或轉貼、轉寄影片,也沒有選(14)傳送訊息或視訊".
end if.
exec.

* external check 【B40】: Q5,Q6,Q7,Q8,Q9.
do if (vQ5=1 & vQ6=1 & vQ7=1 & vQ8=1 & vQ9=1).
compute m1641=concat(
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
compute p1641="【B40】 Q5答有透過網路接觸到政治消息,但Q6-Q9皆回答(01)從來沒有".
end if.
exec.

* external check 【B41】: Q10,Q11,Q12,Q13,Q14.
do if (vQ10=1 & vQ11=1 & vQ12=1 & vQ13=1 & vQ14=1).
compute m1642=concat(
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
compute p1642="【B41】 Q10答有透過網路轉貼或分享政治消息,但Q11-Q14皆回答(01)從來沒有".
end if.
exec.

* external check 【B42】: Q47,Q51.
do if (vQ47=0 & vQ51=1).
compute m1643=concat("vQ47=",string(vQ47,n4),",vQ51=",string(vQ51,n2)).
compute p1643="【B42】 Q47答0分者,在Q51答(01)國民黨,請列出檢核。".
end if.
exec.

* external check 【B43】: Q48,Q51.
do if (vQ48=0 & vQ51=2).
compute m1644=concat("vQ48=",string(vQ48,n4),",vQ51=",string(vQ51,n2)).
compute p1644="【B43】 Q48答0分者,在Q51答(02)民進黨,請列出檢核。".
end if.
exec.

* external check 【B44】: Q62,Q51.
do if (vQ62=0 & vQ51=8).
compute m1645=concat("vQ62=",string(vQ62,n4),",vQ51=",string(vQ51,n2)).
compute p1645="【B44】 Q62答0分者,在Q51答(08)台灣民眾黨,請列出檢核。".
end if.
exec.

* external check 【B45】: Q53,P3_1.
do if (vQ53=1 & vP3_1=0).
compute m1646=concat("vQ53=",string(vQ53,n2),",vP3_1=",string(vP3_1,n3)).
compute p1646="【B45】 Q53答(01)儘快統一者,P3_1答0分者,請列出檢核。".
end if.
exec.

* external check 【B46】: Q53,P3_1.
do if (vQ53=2 & vP3_1=10).
compute m1647=concat("vQ53=",string(vQ53,n2),",vP3_1=",string(vP3_1,n3)).
compute p1647="【B46】 Q53答(02)儘快宣佈獨立,P3_1答10分者,請列出檢核。".
end if.
exec.

* SYNTAXWORK_END_EXTERNAL_CHECKS.
