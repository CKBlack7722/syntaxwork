* Encoding: UTF-8.
**LOGIC GROUP CHECKS.
* SYNTAXWORK_BEGIN_LOGIC.
* logic check show vA2.
do if (any(vA1,997,998)) & any(1,vA2_96).
compute m1501=concat("vA1=",string(vA1,n4),",vA2=",string(vA2,n2)).
compute p1501="vA1 in 997,998，應答vA2而未答".
end if.

* logic check hide vA5city,vA5town.
do if (any(vA4,1,97,98)) & (any(0,vA5city_96) | any(0,vA5town_96)).
compute m1502=concat(
  "vA4=",
  string(vA4,n2),
  ",vA5city=",
  string(vA5city,n2),
  ",vA5town=",
  string(vA5town,n4)
).
compute p1502="vA4 in 1,97,98，不應答vA5city,vA5town而答".
end if.

* logic check show vO2.
do if (any(vO1,1,2,3,4,5,88)) & any(1,vO2_96).
compute m1503=concat("vO1=",string(vO1,n2),",vO2=",string(vO2,n2)).
compute p1503="vO1 in 1,2,3,4,5,88，應答vO2而未答".
end if.

* logic check show vO3.
do if (any(vO1,1,2,3,4,5,88)) & any(1,vO3_96).
compute m1504=concat("vO1=",string(vO1,n2),",vO3=",string(vO3,n2)).
compute p1504="vO1 in 1,2,3,4,5,88，應答vO3而未答".
end if.

* logic check show vO4.
do if (any(vO1,1,2,3,4,5,88)& any(vO3,3,4,5,6,1,88)) & any(1,vO4_96).
compute m1505=concat(
  "vO1=",
  string(vO1,n2),
  ",vO3=",
  string(vO3,n2),
  ",vO4=",
  string(vO4,n5)
).
compute p1505="vO1 in 1,2,3,4,5,88 & vO3 in 3,4,5,6,1,88，應答vO4而未答".
end if.

* logic check show vD2.
do if (any(vD1,1,2)) & any(1,vD2_96).
compute m1506=concat("vD1=",string(vD1,n2),",vD2=",string(vD2,n4)).
compute p1506="vD1 in 1,2，應答vD2而未答".
end if.

* logic check show vD3.
do if (any(vD1,1,2)) & any(1,vD3_96).
compute m1507=concat("vD1=",string(vD1,n2),",vD3=",string(vD3,n5)).
compute p1507="vD1 in 1,2，應答vD3而未答".
end if.

* logic check show vD4sD4,vD4sD5,vD4sD6,vD4sD7,vD4sD8.
do if (any(vD1,1,2)) & (any(1,vD4sD4_96) | any(1,vD4sD5_96) | any(1,vD4sD6_96) | any(1,vD4sD7_96) | any(1,vD4sD8_96)).
compute m1508=concat(
  "vD1=",
  string(vD1,n2),
  ",vD4sD4=",
  string(vD4sD4,n2),
  ",vD4sD5=",
  string(vD4sD5,n2),
  ",vD4sD6=",
  string(vD4sD6,n2),
  ",vD4sD7=",
  string(vD4sD7,n2),
  ",vD4sD8=",
  string(vD4sD8,n2)
).
compute p1508="vD1 in 1,2，應答vD4sD4,vD4sD5,vD4sD6,vD4sD7,vD4sD8而未答".
end if.

* logic check show vE17.
do if ((any(vK1m01,1)| any(vK2m13,1))) & any(1,vE17_96).
compute m1509=concat(
  "vK1m01=",
  string(vK1m01,n2),
  ",vK2m13=",
  string(vK2m13,n2),
  ",vE17=",
  string(vE17,n2)
).
compute p1509="(vK1m01 in 1 | vK2m13 in 1)，應答vE17而未答".
end if.

* logic check show vKLI1.
do if ((any(vK1m01,1)| any(vK2m13,1))) & any(1,vKLI1_96).
compute m1510=concat(
  "vK1m01=",
  string(vK1m01,n2),
  ",vK2m13=",
  string(vK2m13,n2),
  ",vKLI1=",
  string(vKLI1,n4)
).
compute p1510="(vK1m01 in 1 | vK2m13 in 1)，應答vKLI1而未答".
end if.

* logic check show vKLI2.
do if ((any(vK1m01,1)| any(vK2m13,1))) & any(1,vKLI2_96).
compute m1511=concat(
  "vK1m01=",
  string(vK1m01,n2),
  ",vK2m13=",
  string(vK2m13,n2),
  ",vKLI2=",
  string(vKLI2,n5)
).
compute p1511="(vK1m01 in 1 | vK2m13 in 1)，應答vKLI2而未答".
end if.

* logic check show vKFB1.
do if ((any(vK1m02,1)| any(vK2m01,1))) & any(1,vKFB1_96).
compute m1512=concat(
  "vK1m02=",
  string(vK1m02,n2),
  ",vK2m01=",
  string(vK2m01,n2),
  ",vKFB1=",
  string(vKFB1,n4)
).
compute p1512="(vK1m02 in 1 | vK2m01 in 1)，應答vKFB1而未答".
end if.

* logic check show vKFB2.
do if ((any(vK1m02,1)| any(vK2m01,1))) & any(1,vKFB2_96).
compute m1513=concat(
  "vK1m02=",
  string(vK1m02,n2),
  ",vK2m01=",
  string(vK2m01,n2),
  ",vKFB2=",
  string(vKFB2,n5)
).
compute p1513="(vK1m02 in 1 | vK2m01 in 1)，應答vKFB2而未答".
end if.

* logic check show vKFB3m01,vKFB3m02,vKFB3m03,vKFB3m04,vKFB3m05,vKFB3m06,vKFB3m07,vKFB3m08,vKFB3m09,vKFB3m10,vKFB3m11,vKFB3m12,vKFB3m13,vKFB3m14,vKFB3m15,vKFB3m16,vKFB3m17,vKFB3m88.
do if ((any(vK1m02,1)| any(vK2m01,1))) & (any(1,vKFB3m01_96) | any(1,vKFB3m02_96) | any(1,vKFB3m03_96) | any(1,vKFB3m04_96) | any(1,vKFB3m05_96) | any(1,vKFB3m06_96) | any(1,vKFB3m07_96) | any(1,vKFB3m08_96) | any(1,vKFB3m09_96) | any(1,vKFB3m10_96) | any(1,vKFB3m11_96) | any(1,vKFB3m12_96) | any(1,vKFB3m13_96) | any(1,vKFB3m14_96) | any(1,vKFB3m15_96) | any(1,vKFB3m16_96) | any(1,vKFB3m17_96) | any(1,vKFB3m88_96)).
compute m1514=concat(
  "vK1m02=",
  string(vK1m02,n2),
  ",vK2m01=",
  string(vK2m01,n2),
  ",vKFB3m01=",
  string(vKFB3m01,n2),
  ",vKFB3m02=",
  string(vKFB3m02,n2),
  ",vKFB3m03=",
  string(vKFB3m03,n2),
  ",vKFB3m04=",
  string(vKFB3m04,n2),
  ",vKFB3m05=",
  string(vKFB3m05,n2),
  ",vKFB3m06=",
  string(vKFB3m06,n2),
  ",vKFB3m07=",
  string(vKFB3m07,n2),
  ",vKFB3m08=",
  string(vKFB3m08,n2),
  ",vKFB3m09=",
  string(vKFB3m09,n2),
  ",vKFB3m10=",
  string(vKFB3m10,n2),
  ",vKFB3m11=",
  string(vKFB3m11,n2),
  ",vKFB3m12=",
  string(vKFB3m12,n2),
  ",vKFB3m13=",
  string(vKFB3m13,n2),
  ",vKFB3m14=",
  string(vKFB3m14,n2),
  ",vKFB3m15=",
  string(vKFB3m15,n2),
  ",vKFB3m16=",
  string(vKFB3m16,n2),
  ",vKFB3m17=",
  string(vKFB3m17,n2),
  ",vKFB3m88=",
  string(vKFB3m88,n2)
).
compute p1514="(vK1m02 in 1 | vK2m01 in 1)，應答vKFB3m01,vKFB3m02,vKFB3m03,vKFB3m04,vKFB3m05,vKFB3m06,vKFB3m07,vKFB3m08,vKFB3m09,vKFB3m10,vKFB3m11,vKFB3m12,vKFB3m13,vKFB3m14,vKFB3m15,vKFB3m16,vKFB3m17,vKFB3m88而未答".
end if.

* logic check show vKFB4m01,vKFB4m02,vKFB4m03,vKFB4m04,vKFB4m05,vKFB4m06,vKFB4m07,vKFB4m08,vKFB4m09,vKFB4m10,vKFB4m11,vKFB4m12,vKFB4m13,vKFB4m14,vKFB4m15,vKFB4m16,vKFB4m17,vKFB4m18,vKFB4m88.
do if ((any(vK1m02,1)| any(vK2m01,1))) & (any(1,vKFB4m01_96) | any(1,vKFB4m02_96) | any(1,vKFB4m03_96) | any(1,vKFB4m04_96) | any(1,vKFB4m05_96) | any(1,vKFB4m06_96) | any(1,vKFB4m07_96) | any(1,vKFB4m08_96) | any(1,vKFB4m09_96) | any(1,vKFB4m10_96) | any(1,vKFB4m11_96) | any(1,vKFB4m12_96) | any(1,vKFB4m13_96) | any(1,vKFB4m14_96) | any(1,vKFB4m15_96) | any(1,vKFB4m16_96) | any(1,vKFB4m17_96) | any(1,vKFB4m18_96) | any(1,vKFB4m88_96)).
compute m1515=concat(
  "vK1m02=",
  string(vK1m02,n2),
  ",vK2m01=",
  string(vK2m01,n2),
  ",vKFB4m01=",
  string(vKFB4m01,n2),
  ",vKFB4m02=",
  string(vKFB4m02,n2),
  ",vKFB4m03=",
  string(vKFB4m03,n2),
  ",vKFB4m04=",
  string(vKFB4m04,n2),
  ",vKFB4m05=",
  string(vKFB4m05,n2),
  ",vKFB4m06=",
  string(vKFB4m06,n2),
  ",vKFB4m07=",
  string(vKFB4m07,n2),
  ",vKFB4m08=",
  string(vKFB4m08,n2),
  ",vKFB4m09=",
  string(vKFB4m09,n2),
  ",vKFB4m10=",
  string(vKFB4m10,n2),
  ",vKFB4m11=",
  string(vKFB4m11,n2),
  ",vKFB4m12=",
  string(vKFB4m12,n2),
  ",vKFB4m13=",
  string(vKFB4m13,n2),
  ",vKFB4m14=",
  string(vKFB4m14,n2),
  ",vKFB4m15=",
  string(vKFB4m15,n2),
  ",vKFB4m16=",
  string(vKFB4m16,n2),
  ",vKFB4m17=",
  string(vKFB4m17,n2),
  ",vKFB4m18=",
  string(vKFB4m18,n2),
  ",vKFB4m88=",
  string(vKFB4m88,n2)
).
compute p1515="(vK1m02 in 1 | vK2m01 in 1)，應答vKFB4m01,vKFB4m02,vKFB4m03,vKFB4m04,vKFB4m05,vKFB4m06,vKFB4m07,vKFB4m08,vKFB4m09,vKFB4m10,vKFB4m11,vKFB4m12,vKFB4m13,vKFB4m14,vKFB4m15,vKFB4m16,vKFB4m17,vKFB4m18,vKFB4m88而未答".
end if.

* logic check show vKIG1.
do if ((any(vK1m03,1)| any(vK2m02,1))) & any(1,vKIG1_96).
compute m1516=concat(
  "vK1m03=",
  string(vK1m03,n2),
  ",vK2m02=",
  string(vK2m02,n2),
  ",vKIG1=",
  string(vKIG1,n4)
).
compute p1516="(vK1m03 in 1 | vK2m02 in 1)，應答vKIG1而未答".
end if.

* logic check show vKIG2.
do if ((any(vK1m03,1)| any(vK2m02,1))) & any(1,vKIG2_96).
compute m1517=concat(
  "vK1m03=",
  string(vK1m03,n2),
  ",vK2m02=",
  string(vK2m02,n2),
  ",vKIG2=",
  string(vKIG2,n5)
).
compute p1517="(vK1m03 in 1 | vK2m02 in 1)，應答vKIG2而未答".
end if.

* logic check show vKIG3m01,vKIG3m02,vKIG3m03,vKIG3m04,vKIG3m05,vKIG3m06,vKIG3m07,vKIG3m08,vKIG3m09,vKIG3m10,vKIG3m11,vKIG3m12,vKIG3m13,vKIG3m14,vKIG3m15,vKIG3m16,vKIG3m17,vKIG3m88.
do if ((any(vK1m03,1)| any(vK2m02,1))) & (any(1,vKIG3m01_96) | any(1,vKIG3m02_96) | any(1,vKIG3m03_96) | any(1,vKIG3m04_96) | any(1,vKIG3m05_96) | any(1,vKIG3m06_96) | any(1,vKIG3m07_96) | any(1,vKIG3m08_96) | any(1,vKIG3m09_96) | any(1,vKIG3m10_96) | any(1,vKIG3m11_96) | any(1,vKIG3m12_96) | any(1,vKIG3m13_96) | any(1,vKIG3m14_96) | any(1,vKIG3m15_96) | any(1,vKIG3m16_96) | any(1,vKIG3m17_96) | any(1,vKIG3m88_96)).
compute m1518=concat(
  "vK1m03=",
  string(vK1m03,n2),
  ",vK2m02=",
  string(vK2m02,n2),
  ",vKIG3m01=",
  string(vKIG3m01,n2),
  ",vKIG3m02=",
  string(vKIG3m02,n2),
  ",vKIG3m03=",
  string(vKIG3m03,n2),
  ",vKIG3m04=",
  string(vKIG3m04,n2),
  ",vKIG3m05=",
  string(vKIG3m05,n2),
  ",vKIG3m06=",
  string(vKIG3m06,n2),
  ",vKIG3m07=",
  string(vKIG3m07,n2),
  ",vKIG3m08=",
  string(vKIG3m08,n2),
  ",vKIG3m09=",
  string(vKIG3m09,n2),
  ",vKIG3m10=",
  string(vKIG3m10,n2),
  ",vKIG3m11=",
  string(vKIG3m11,n2),
  ",vKIG3m12=",
  string(vKIG3m12,n2),
  ",vKIG3m13=",
  string(vKIG3m13,n2),
  ",vKIG3m14=",
  string(vKIG3m14,n2),
  ",vKIG3m15=",
  string(vKIG3m15,n2),
  ",vKIG3m16=",
  string(vKIG3m16,n2),
  ",vKIG3m17=",
  string(vKIG3m17,n2),
  ",vKIG3m88=",
  string(vKIG3m88,n2)
).
compute p1518="(vK1m03 in 1 | vK2m02 in 1)，應答vKIG3m01,vKIG3m02,vKIG3m03,vKIG3m04,vKIG3m05,vKIG3m06,vKIG3m07,vKIG3m08,vKIG3m09,vKIG3m10,vKIG3m11,vKIG3m12,vKIG3m13,vKIG3m14,vKIG3m15,vKIG3m16,vKIG3m17,vKIG3m88而未答".
end if.

* logic check show vKIG4m01,vKIG4m02,vKIG4m03,vKIG4m04,vKIG4m05,vKIG4m06,vKIG4m07,vKIG4m08,vKIG4m09,vKIG4m10,vKIG4m11,vKIG4m12,vKIG4m13,vKIG4m14,vKIG4m88.
do if ((any(vK1m03,1)| any(vK2m02,1))) & (any(1,vKIG4m01_96) | any(1,vKIG4m02_96) | any(1,vKIG4m03_96) | any(1,vKIG4m04_96) | any(1,vKIG4m05_96) | any(1,vKIG4m06_96) | any(1,vKIG4m07_96) | any(1,vKIG4m08_96) | any(1,vKIG4m09_96) | any(1,vKIG4m10_96) | any(1,vKIG4m11_96) | any(1,vKIG4m12_96) | any(1,vKIG4m13_96) | any(1,vKIG4m14_96) | any(1,vKIG4m88_96)).
compute m1519=concat(
  "vK1m03=",
  string(vK1m03,n2),
  ",vK2m02=",
  string(vK2m02,n2),
  ",vKIG4m01=",
  string(vKIG4m01,n2),
  ",vKIG4m02=",
  string(vKIG4m02,n2),
  ",vKIG4m03=",
  string(vKIG4m03,n2),
  ",vKIG4m04=",
  string(vKIG4m04,n2),
  ",vKIG4m05=",
  string(vKIG4m05,n2),
  ",vKIG4m06=",
  string(vKIG4m06,n2),
  ",vKIG4m07=",
  string(vKIG4m07,n2),
  ",vKIG4m08=",
  string(vKIG4m08,n2),
  ",vKIG4m09=",
  string(vKIG4m09,n2),
  ",vKIG4m10=",
  string(vKIG4m10,n2),
  ",vKIG4m11=",
  string(vKIG4m11,n2),
  ",vKIG4m12=",
  string(vKIG4m12,n2),
  ",vKIG4m13=",
  string(vKIG4m13,n2),
  ",vKIG4m14=",
  string(vKIG4m14,n2),
  ",vKIG4m88=",
  string(vKIG4m88,n2)
).
compute p1519="(vK1m03 in 1 | vK2m02 in 1)，應答vKIG4m01,vKIG4m02,vKIG4m03,vKIG4m04,vKIG4m05,vKIG4m06,vKIG4m07,vKIG4m08,vKIG4m09,vKIG4m10,vKIG4m11,vKIG4m12,vKIG4m13,vKIG4m14,vKIG4m88而未答".
end if.

* logic check show vKTT1.
do if ((any(vK1m11,1)| any(vK2m07,1))) & any(1,vKTT1_96).
compute m1520=concat(
  "vK1m11=",
  string(vK1m11,n2),
  ",vK2m07=",
  string(vK2m07,n2),
  ",vKTT1=",
  string(vKTT1,n4)
).
compute p1520="(vK1m11 in 1 | vK2m07 in 1)，應答vKTT1而未答".
end if.

* logic check show vKTT2.
do if ((any(vK1m11,1)| any(vK2m07,1))) & any(1,vKTT2_96).
compute m1521=concat(
  "vK1m11=",
  string(vK1m11,n2),
  ",vK2m07=",
  string(vK2m07,n2),
  ",vKTT2=",
  string(vKTT2,n5)
).
compute p1521="(vK1m11 in 1 | vK2m07 in 1)，應答vKTT2而未答".
end if.

* logic check show vKTT3m01,vKTT3m02,vKTT3m03,vKTT3m04,vKTT3m05,vKTT3m06,vKTT3m07,vKTT3m08,vKTT3m09,vKTT3m10,vKTT3m11,vKTT3m12,vKTT3m13,vKTT3m14,vKTT3m15,vKTT3m16,vKTT3m88.
do if ((any(vK1m11,1)| any(vK2m07,1))) & (any(1,vKTT3m01_96) | any(1,vKTT3m02_96) | any(1,vKTT3m03_96) | any(1,vKTT3m04_96) | any(1,vKTT3m05_96) | any(1,vKTT3m06_96) | any(1,vKTT3m07_96) | any(1,vKTT3m08_96) | any(1,vKTT3m09_96) | any(1,vKTT3m10_96) | any(1,vKTT3m11_96) | any(1,vKTT3m12_96) | any(1,vKTT3m13_96) | any(1,vKTT3m14_96) | any(1,vKTT3m15_96) | any(1,vKTT3m16_96) | any(1,vKTT3m88_96)).
compute m1522=concat(
  "vK1m11=",
  string(vK1m11,n2),
  ",vK2m07=",
  string(vK2m07,n2),
  ",vKTT3m01=",
  string(vKTT3m01,n2),
  ",vKTT3m02=",
  string(vKTT3m02,n2),
  ",vKTT3m03=",
  string(vKTT3m03,n2),
  ",vKTT3m04=",
  string(vKTT3m04,n2),
  ",vKTT3m05=",
  string(vKTT3m05,n2),
  ",vKTT3m06=",
  string(vKTT3m06,n2),
  ",vKTT3m07=",
  string(vKTT3m07,n2),
  ",vKTT3m08=",
  string(vKTT3m08,n2),
  ",vKTT3m09=",
  string(vKTT3m09,n2),
  ",vKTT3m10=",
  string(vKTT3m10,n2),
  ",vKTT3m11=",
  string(vKTT3m11,n2),
  ",vKTT3m12=",
  string(vKTT3m12,n2),
  ",vKTT3m13=",
  string(vKTT3m13,n2),
  ",vKTT3m14=",
  string(vKTT3m14,n2),
  ",vKTT3m15=",
  string(vKTT3m15,n2),
  ",vKTT3m16=",
  string(vKTT3m16,n2),
  ",vKTT3m88=",
  string(vKTT3m88,n2)
).
compute p1522="(vK1m11 in 1 | vK2m07 in 1)，應答vKTT3m01,vKTT3m02,vKTT3m03,vKTT3m04,vKTT3m05,vKTT3m06,vKTT3m07,vKTT3m08,vKTT3m09,vKTT3m10,vKTT3m11,vKTT3m12,vKTT3m13,vKTT3m14,vKTT3m15,vKTT3m16,vKTT3m88而未答".
end if.

* logic check show vKTT4m01,vKTT4m02,vKTT4m03,vKTT4m04,vKTT4m05,vKTT4m06,vKTT4m07,vKTT4m08,vKTT4m09,vKTT4m10,vKTT4m11,vKTT4m12,vKTT4m13,vKTT4m14,vKTT4m88.
do if ((any(vK1m11,1)| any(vK2m07,1))) & (any(1,vKTT4m01_96) | any(1,vKTT4m02_96) | any(1,vKTT4m03_96) | any(1,vKTT4m04_96) | any(1,vKTT4m05_96) | any(1,vKTT4m06_96) | any(1,vKTT4m07_96) | any(1,vKTT4m08_96) | any(1,vKTT4m09_96) | any(1,vKTT4m10_96) | any(1,vKTT4m11_96) | any(1,vKTT4m12_96) | any(1,vKTT4m13_96) | any(1,vKTT4m14_96) | any(1,vKTT4m88_96)).
compute m1523=concat(
  "vK1m11=",
  string(vK1m11,n2),
  ",vK2m07=",
  string(vK2m07,n2),
  ",vKTT4m01=",
  string(vKTT4m01,n2),
  ",vKTT4m02=",
  string(vKTT4m02,n2),
  ",vKTT4m03=",
  string(vKTT4m03,n2),
  ",vKTT4m04=",
  string(vKTT4m04,n2),
  ",vKTT4m05=",
  string(vKTT4m05,n2),
  ",vKTT4m06=",
  string(vKTT4m06,n2),
  ",vKTT4m07=",
  string(vKTT4m07,n2),
  ",vKTT4m08=",
  string(vKTT4m08,n2),
  ",vKTT4m09=",
  string(vKTT4m09,n2),
  ",vKTT4m10=",
  string(vKTT4m10,n2),
  ",vKTT4m11=",
  string(vKTT4m11,n2),
  ",vKTT4m12=",
  string(vKTT4m12,n2),
  ",vKTT4m13=",
  string(vKTT4m13,n2),
  ",vKTT4m14=",
  string(vKTT4m14,n2),
  ",vKTT4m88=",
  string(vKTT4m88,n2)
).
compute p1523="(vK1m11 in 1 | vK2m07 in 1)，應答vKTT4m01,vKTT4m02,vKTT4m03,vKTT4m04,vKTT4m05,vKTT4m06,vKTT4m07,vKTT4m08,vKTT4m09,vKTT4m10,vKTT4m11,vKTT4m12,vKTT4m13,vKTT4m14,vKTT4m88而未答".
end if.

* logic check show vKTT5m01,vKTT5m02,vKTT5m03,vKTT5m04,vKTT5m05,vKTT5m06,vKTT5m07,vKTT5m08,vKTT5m09,vKTT5m10,vKTT5m11,vKTT5m12,vKTT5m88.
do if ((any(vK1m11,1)| any(vK2m07,1))) & (any(1,vKTT5m01_96) | any(1,vKTT5m02_96) | any(1,vKTT5m03_96) | any(1,vKTT5m04_96) | any(1,vKTT5m05_96) | any(1,vKTT5m06_96) | any(1,vKTT5m07_96) | any(1,vKTT5m08_96) | any(1,vKTT5m09_96) | any(1,vKTT5m10_96) | any(1,vKTT5m11_96) | any(1,vKTT5m12_96) | any(1,vKTT5m88_96)).
compute m1524=concat(
  "vK1m11=",
  string(vK1m11,n2),
  ",vK2m07=",
  string(vK2m07,n2),
  ",vKTT5m01=",
  string(vKTT5m01,n2),
  ",vKTT5m02=",
  string(vKTT5m02,n2),
  ",vKTT5m03=",
  string(vKTT5m03,n2),
  ",vKTT5m04=",
  string(vKTT5m04,n2),
  ",vKTT5m05=",
  string(vKTT5m05,n2),
  ",vKTT5m06=",
  string(vKTT5m06,n2),
  ",vKTT5m07=",
  string(vKTT5m07,n2),
  ",vKTT5m08=",
  string(vKTT5m08,n2),
  ",vKTT5m09=",
  string(vKTT5m09,n2),
  ",vKTT5m10=",
  string(vKTT5m10,n2),
  ",vKTT5m11=",
  string(vKTT5m11,n2),
  ",vKTT5m12=",
  string(vKTT5m12,n2),
  ",vKTT5m88=",
  string(vKTT5m88,n2)
).
compute p1524="(vK1m11 in 1 | vK2m07 in 1)，應答vKTT5m01,vKTT5m02,vKTT5m03,vKTT5m04,vKTT5m05,vKTT5m06,vKTT5m07,vKTT5m08,vKTT5m09,vKTT5m10,vKTT5m11,vKTT5m12,vKTT5m88而未答".
end if.

* logic check show vP5_1.
do if ((any(vK1m13,1)| any(vK2m11,1))) & any(1,vP5_1_96).
compute m1525=concat(
  "vK1m13=",
  string(vK1m13,n2),
  ",vK2m11=",
  string(vK2m11,n2),
  ",vP5_1=",
  string(vP5_1,n4)
).
compute p1525="(vK1m13 in 1 | vK2m11 in 1)，應答vP5_1而未答".
end if.

* logic check show vP5_2.
do if ((any(vK1m13,1)| any(vK2m11,1))) & any(1,vP5_2_96).
compute m1526=concat(
  "vK1m13=",
  string(vK1m13,n2),
  ",vK2m11=",
  string(vK2m11,n2),
  ",vP5_2=",
  string(vP5_2,n5)
).
compute p1526="(vK1m13 in 1 | vK2m11 in 1)，應答vP5_2而未答".
end if.

* logic check show vE18.
do if (any(vK3m01,1)) & any(1,vE18_96).
compute m1527=concat("vK3m01=",string(vK3m01,n2),",vE18=",string(vE18,n2)).
compute p1527="vK3m01 in 1，應答vE18而未答".
end if.

* logic check show vKYT1.
do if (any(vK3m01,1)) & any(1,vKYT1_96).
compute m1528=concat("vK3m01=",string(vK3m01,n2),",vKYT1=",string(vKYT1,n4)).
compute p1528="vK3m01 in 1，應答vKYT1而未答".
end if.

* logic check show vKYT2.
do if (any(vK3m01,1)) & any(1,vKYT2_96).
compute m1529=concat("vK3m01=",string(vK3m01,n2),",vKYT2=",string(vKYT2,n5)).
compute p1529="vK3m01 in 1，應答vKYT2而未答".
end if.

* logic check show vE2m01,vE2m02,vE2m03,vE2m04,vE2m88.
do if (any(vE1,1)) & (any(1,vE2m01_96) | any(1,vE2m02_96) | any(1,vE2m03_96) | any(1,vE2m04_96) | any(1,vE2m88_96)).
compute m1530=concat(
  "vE1=",
  string(vE1,n2),
  ",vE2m01=",
  string(vE2m01,n2),
  ",vE2m02=",
  string(vE2m02,n2),
  ",vE2m03=",
  string(vE2m03,n2),
  ",vE2m04=",
  string(vE2m04,n2),
  ",vE2m88=",
  string(vE2m88,n2)
).
compute p1530="vE1 in 1，應答vE2m01,vE2m02,vE2m03,vE2m04,vE2m88而未答".
end if.

* logic check show vE4.
do if ((any(vE2m01,1)| any(vE17,1)| any(vE18,1))) & any(1,vE4_96).
compute m1531=concat(
  "vE2m01=",
  string(vE2m01,n2),
  ",vE17=",
  string(vE17,n2),
  ",vE18=",
  string(vE18,n2),
  ",vE4=",
  string(vE4,n4)
).
compute p1531="(vE2m01 in 1 | vE17 in 1 | vE18 in 1)，應答vE4而未答".
end if.

* logic check show vE5.
do if ((any(vE2m01,1)| any(vE17,1)| any(vE18,1))) & any(1,vE5_96).
compute m1532=concat(
  "vE2m01=",
  string(vE2m01,n2),
  ",vE17=",
  string(vE17,n2),
  ",vE18=",
  string(vE18,n2),
  ",vE5=",
  string(vE5,n5)
).
compute p1532="(vE2m01 in 1 | vE17 in 1 | vE18 in 1)，應答vE5而未答".
end if.

* logic check show vE5.
do if ((any(vO1_1,1,2,3,4,88)| any(vO1,1,2,3,4,5,12,13,14,88))) & any(1,vE5_96).
compute m1533=concat(
  "vO1_1=",
  string(vO1_1,n2),
  ",vO1=",
  string(vO1,n2),
  ",vE5=",
  string(vE5,n5)
).
compute p1533="(vO1_1 in 1,2,3,4,88 | vO1 in 1,2,3,4,5,12,13,14,88)，應答vE5而未答".
end if.

* logic check show vE6.
do if ((any(vE2m01,1)| any(vE17,1)| any(vE18,1))) & any(1,vE6_96).
compute m1534=concat(
  "vE2m01=",
  string(vE2m01,n2),
  ",vE17=",
  string(vE17,n2),
  ",vE18=",
  string(vE18,n2),
  ",vE6=",
  string(vE6,n5)
).
compute p1534="(vE2m01 in 1 | vE17 in 1 | vE18 in 1)，應答vE6而未答".
end if.

* logic check show vE7.
do if ((any(vE2m02,1)| any(vE17,2)| any(vE18,2))) & any(1,vE7_96).
compute m1535=concat(
  "vE2m02=",
  string(vE2m02,n2),
  ",vE17=",
  string(vE17,n2),
  ",vE18=",
  string(vE18,n2),
  ",vE7=",
  string(vE7,n4)
).
compute p1535="(vE2m02 in 1 | vE17 in 2 | vE18 in 2)，應答vE7而未答".
end if.

* logic check show vE8.
do if ((any(vE2m02,1)| any(vE17,2)| any(vE18,2))) & any(1,vE8_96).
compute m1536=concat(
  "vE2m02=",
  string(vE2m02,n2),
  ",vE17=",
  string(vE17,n2),
  ",vE18=",
  string(vE18,n2),
  ",vE8=",
  string(vE8,n5)
).
compute p1536="(vE2m02 in 1 | vE17 in 2 | vE18 in 2)，應答vE8而未答".
end if.

* logic check show vE8.
do if ((any(vO1_1,1,2,3,4,88)| any(vO1,1,2,3,4,5,12,13,14,88))) & any(1,vE8_96).
compute m1537=concat(
  "vO1_1=",
  string(vO1_1,n2),
  ",vO1=",
  string(vO1,n2),
  ",vE8=",
  string(vE8,n5)
).
compute p1537="(vO1_1 in 1,2,3,4,88 | vO1 in 1,2,3,4,5,12,13,14,88)，應答vE8而未答".
end if.

* logic check show vE9.
do if ((any(vE2m02,1)| any(vE17,2)| any(vE18,2))) & any(1,vE9_96).
compute m1538=concat(
  "vE2m02=",
  string(vE2m02,n2),
  ",vE17=",
  string(vE17,n2),
  ",vE18=",
  string(vE18,n2),
  ",vE9=",
  string(vE9,n5)
).
compute p1538="(vE2m02 in 1 | vE17 in 2 | vE18 in 2)，應答vE9而未答".
end if.

* logic check show vE10.
do if ((any(vE2m03,1)| any(vE17,3)| any(vE18,3))) & any(1,vE10_96).
compute m1539=concat(
  "vE2m03=",
  string(vE2m03,n2),
  ",vE17=",
  string(vE17,n2),
  ",vE18=",
  string(vE18,n2),
  ",vE10=",
  string(vE10,n4)
).
compute p1539="(vE2m03 in 1 | vE17 in 3 | vE18 in 3)，應答vE10而未答".
end if.

* logic check show vE11.
do if ((any(vE2m03,1)| any(vE17,3)| any(vE18,3))) & any(1,vE11_96).
compute m1540=concat(
  "vE2m03=",
  string(vE2m03,n2),
  ",vE17=",
  string(vE17,n2),
  ",vE18=",
  string(vE18,n2),
  ",vE11=",
  string(vE11,n5)
).
compute p1540="(vE2m03 in 1 | vE17 in 3 | vE18 in 3)，應答vE11而未答".
end if.

* logic check show vE11.
do if ((any(vO1_1,1,2,3,4,88)| any(vO1,1,2,3,4,5,12,13,14,88))) & any(1,vE11_96).
compute m1541=concat(
  "vO1_1=",
  string(vO1_1,n2),
  ",vO1=",
  string(vO1,n2),
  ",vE11=",
  string(vE11,n5)
).
compute p1541="(vO1_1 in 1,2,3,4,88 | vO1 in 1,2,3,4,5,12,13,14,88)，應答vE11而未答".
end if.

* logic check show vE12.
do if ((any(vE2m03,1)| any(vE17,3)| any(vE18,3))) & any(1,vE12_96).
compute m1542=concat(
  "vE2m03=",
  string(vE2m03,n2),
  ",vE17=",
  string(vE17,n2),
  ",vE18=",
  string(vE18,n2),
  ",vE12=",
  string(vE12,n5)
).
compute p1542="(vE2m03 in 1 | vE17 in 3 | vE18 in 3)，應答vE12而未答".
end if.

* logic check show vE3.
do if (any(vE1,1)) & any(1,vE3_96).
compute m1543=concat("vE1=",string(vE1,n2),",vE3=",string(vE3,n5)).
compute p1543="vE1 in 1，應答vE3而未答".
end if.

* logic check show vE13m01,vE13m02,vE13m03,vE13m04,vE13m05,vE13m06,vE13m88.
do if (any(vE1,1)) & (any(1,vE13m01_96) | any(1,vE13m02_96) | any(1,vE13m03_96) | any(1,vE13m04_96) | any(1,vE13m05_96) | any(1,vE13m06_96) | any(1,vE13m88_96)).
compute m1544=concat(
  "vE1=",
  string(vE1,n2),
  ",vE13m01=",
  string(vE13m01,n2),
  ",vE13m02=",
  string(vE13m02,n2),
  ",vE13m03=",
  string(vE13m03,n2),
  ",vE13m04=",
  string(vE13m04,n2),
  ",vE13m05=",
  string(vE13m05,n2),
  ",vE13m06=",
  string(vE13m06,n2),
  ",vE13m88=",
  string(vE13m88,n2)
).
compute p1544="vE1 in 1，應答vE13m01,vE13m02,vE13m03,vE13m04,vE13m05,vE13m06,vE13m88而未答".
end if.

* logic check show vE14.
do if (any(vE1,1)) & any(1,vE14_96).
compute m1545=concat("vE1=",string(vE1,n2),",vE14=",string(vE14,n7)).
compute p1545="vE1 in 1，應答vE14而未答".
end if.

* logic check show vG7m01,vG7m02,vG7m03,vG7m04,vG7m05,vG7m06,vG7m07,vG7m08,vG7m09,vG7m10,vG7m11,vG7m12,vG7m88,vG7m90.
do if (any(vE1,1)) & (any(1,vG7m01_96) | any(1,vG7m02_96) | any(1,vG7m03_96) | any(1,vG7m04_96) | any(1,vG7m05_96) | any(1,vG7m06_96) | any(1,vG7m07_96) | any(1,vG7m08_96) | any(1,vG7m09_96) | any(1,vG7m10_96) | any(1,vG7m11_96) | any(1,vG7m12_96) | any(1,vG7m88_96) | any(1,vG7m90_96)).
compute m1546=concat(
  "vE1=",
  string(vE1,n2),
  ",vG7m01=",
  string(vG7m01,n2),
  ",vG7m02=",
  string(vG7m02,n2),
  ",vG7m03=",
  string(vG7m03,n2),
  ",vG7m04=",
  string(vG7m04,n2),
  ",vG7m05=",
  string(vG7m05,n2),
  ",vG7m06=",
  string(vG7m06,n2),
  ",vG7m07=",
  string(vG7m07,n2),
  ",vG7m08=",
  string(vG7m08,n2),
  ",vG7m09=",
  string(vG7m09,n2),
  ",vG7m10=",
  string(vG7m10,n2),
  ",vG7m11=",
  string(vG7m11,n2),
  ",vG7m12=",
  string(vG7m12,n2),
  ",vG7m88=",
  string(vG7m88,n2),
  ",vG7m90=",
  string(vG7m90,n2)
).
compute p1546="vE1 in 1，應答vG7m01,vG7m02,vG7m03,vG7m04,vG7m05,vG7m06,vG7m07,vG7m08,vG7m09,vG7m10,vG7m11,vG7m12,vG7m88,vG7m90而未答".
end if.

* logic check show vG8m01,vG8m02,vG8m03,vG8m04,vG8m05,vG8m06,vG8m07,vG8m08,vG8m09,vG8m10,vG8m11,vG8m12,vG8m13,vG8m14,vG8m15,vG8m16,vG8m88,vG8m90.
do if (any(vE1,1)) & (any(1,vG8m01_96) | any(1,vG8m02_96) | any(1,vG8m03_96) | any(1,vG8m04_96) | any(1,vG8m05_96) | any(1,vG8m06_96) | any(1,vG8m07_96) | any(1,vG8m08_96) | any(1,vG8m09_96) | any(1,vG8m10_96) | any(1,vG8m11_96) | any(1,vG8m12_96) | any(1,vG8m13_96) | any(1,vG8m14_96) | any(1,vG8m15_96) | any(1,vG8m16_96) | any(1,vG8m88_96) | any(1,vG8m90_96)).
compute m1547=concat(
  "vE1=",
  string(vE1,n2),
  ",vG8m01=",
  string(vG8m01,n2),
  ",vG8m02=",
  string(vG8m02,n2),
  ",vG8m03=",
  string(vG8m03,n2),
  ",vG8m04=",
  string(vG8m04,n2),
  ",vG8m05=",
  string(vG8m05,n2),
  ",vG8m06=",
  string(vG8m06,n2),
  ",vG8m07=",
  string(vG8m07,n2),
  ",vG8m08=",
  string(vG8m08,n2),
  ",vG8m09=",
  string(vG8m09,n2),
  ",vG8m10=",
  string(vG8m10,n2),
  ",vG8m11=",
  string(vG8m11,n2),
  ",vG8m12=",
  string(vG8m12,n2),
  ",vG8m13=",
  string(vG8m13,n2),
  ",vG8m14=",
  string(vG8m14,n2),
  ",vG8m15=",
  string(vG8m15,n2),
  ",vG8m16=",
  string(vG8m16,n2),
  ",vG8m88=",
  string(vG8m88,n2),
  ",vG8m90=",
  string(vG8m90,n2)
).
compute p1547="vE1 in 1，應答vG8m01,vG8m02,vG8m03,vG8m04,vG8m05,vG8m06,vG8m07,vG8m08,vG8m09,vG8m10,vG8m11,vG8m12,vG8m13,vG8m14,vG8m15,vG8m16,vG8m88,vG8m90而未答".
end if.

* logic check show vG9m01,vG9m02,vG9m03,vG9m04,vG9m05,vG9m06,vG9m07,vG9m08,vG9m09,vG9m10,vG9m11,vG9m12,vG9m13,vG9m88,vG9m90.
do if (any(vE1,1)) & (any(1,vG9m01_96) | any(1,vG9m02_96) | any(1,vG9m03_96) | any(1,vG9m04_96) | any(1,vG9m05_96) | any(1,vG9m06_96) | any(1,vG9m07_96) | any(1,vG9m08_96) | any(1,vG9m09_96) | any(1,vG9m10_96) | any(1,vG9m11_96) | any(1,vG9m12_96) | any(1,vG9m13_96) | any(1,vG9m88_96) | any(1,vG9m90_96)).
compute m1548=concat(
  "vE1=",
  string(vE1,n2),
  ",vG9m01=",
  string(vG9m01,n2),
  ",vG9m02=",
  string(vG9m02,n2),
  ",vG9m03=",
  string(vG9m03,n2),
  ",vG9m04=",
  string(vG9m04,n2),
  ",vG9m05=",
  string(vG9m05,n2),
  ",vG9m06=",
  string(vG9m06,n2),
  ",vG9m07=",
  string(vG9m07,n2),
  ",vG9m08=",
  string(vG9m08,n2),
  ",vG9m09=",
  string(vG9m09,n2),
  ",vG9m10=",
  string(vG9m10,n2),
  ",vG9m11=",
  string(vG9m11,n2),
  ",vG9m12=",
  string(vG9m12,n2),
  ",vG9m13=",
  string(vG9m13,n2),
  ",vG9m88=",
  string(vG9m88,n2),
  ",vG9m90=",
  string(vG9m90,n2)
).
compute p1548="vE1 in 1，應答vG9m01,vG9m02,vG9m03,vG9m04,vG9m05,vG9m06,vG9m07,vG9m08,vG9m09,vG9m10,vG9m11,vG9m12,vG9m13,vG9m88,vG9m90而未答".
end if.

* logic check show vG10m01,vG10m02,vG10m03,vG10m04,vG10m05,vG10m06,vG10m07,vG10m08,vG10m09,vG10m10,vG10m11,vG10m12,vG10m13,vG10m14,vG10m15,vG10m16,vG10m17,vG10m18,vG10m19,vG10m88,vG10m90.
do if (any(vE1,1)) & (any(1,vG10m01_96) | any(1,vG10m02_96) | any(1,vG10m03_96) | any(1,vG10m04_96) | any(1,vG10m05_96) | any(1,vG10m06_96) | any(1,vG10m07_96) | any(1,vG10m08_96) | any(1,vG10m09_96) | any(1,vG10m10_96) | any(1,vG10m11_96) | any(1,vG10m12_96) | any(1,vG10m13_96) | any(1,vG10m14_96) | any(1,vG10m15_96) | any(1,vG10m16_96) | any(1,vG10m17_96) | any(1,vG10m18_96) | any(1,vG10m19_96) | any(1,vG10m88_96) | any(1,vG10m90_96)).
compute m1549=concat(
  "vE1=",
  string(vE1,n2),
  ",vG10m01=",
  string(vG10m01,n2),
  ",vG10m02=",
  string(vG10m02,n2),
  ",vG10m03=",
  string(vG10m03,n2),
  ",vG10m04=",
  string(vG10m04,n2),
  ",vG10m05=",
  string(vG10m05,n2),
  ",vG10m06=",
  string(vG10m06,n2),
  ",vG10m07=",
  string(vG10m07,n2),
  ",vG10m08=",
  string(vG10m08,n2),
  ",vG10m09=",
  string(vG10m09,n2),
  ",vG10m10=",
  string(vG10m10,n2),
  ",vG10m11=",
  string(vG10m11,n2),
  ",vG10m12=",
  string(vG10m12,n2),
  ",vG10m13=",
  string(vG10m13,n2),
  ",vG10m14=",
  string(vG10m14,n2),
  ",vG10m15=",
  string(vG10m15,n2),
  ",vG10m16=",
  string(vG10m16,n2),
  ",vG10m17=",
  string(vG10m17,n2),
  ",vG10m18=",
  string(vG10m18,n2),
  ",vG10m19=",
  string(vG10m19,n2),
  ",vG10m88=",
  string(vG10m88,n2),
  ",vG10m90=",
  string(vG10m90,n2)
).
compute p1549="vE1 in 1，應答vG10m01,vG10m02,vG10m03,vG10m04,vG10m05,vG10m06,vG10m07,vG10m08,vG10m09,vG10m10,vG10m11,vG10m12,vG10m13,vG10m14,vG10m15,vG10m16,vG10m17,vG10m18,vG10m19,vG10m88,vG10m90而未答".
end if.

* logic check show vG11m01,vG11m02,vG11m03,vG11m04,vG11m05,vG11m88,vG11m90.
do if (any(vE1,1)) & (any(1,vG11m01_96) | any(1,vG11m02_96) | any(1,vG11m03_96) | any(1,vG11m04_96) | any(1,vG11m05_96) | any(1,vG11m88_96) | any(1,vG11m90_96)).
compute m1550=concat(
  "vE1=",
  string(vE1,n2),
  ",vG11m01=",
  string(vG11m01,n2),
  ",vG11m02=",
  string(vG11m02,n2),
  ",vG11m03=",
  string(vG11m03,n2),
  ",vG11m04=",
  string(vG11m04,n2),
  ",vG11m05=",
  string(vG11m05,n2),
  ",vG11m88=",
  string(vG11m88,n2),
  ",vG11m90=",
  string(vG11m90,n2)
).
compute p1550="vE1 in 1，應答vG11m01,vG11m02,vG11m03,vG11m04,vG11m05,vG11m88,vG11m90而未答".
end if.

* logic check hide vB2.
do if (any(vB1,0)) & any(0,vB2_96).
compute m1551=concat("vB1=",string(vB1,n4),",vB2=",string(vB2,n5)).
compute p1551="vB1 in 0，不應答vB2而答".
end if.

* logic check hide vB4.
do if (any(vB3,0)) & any(0,vB4_96).
compute m1552=concat("vB3=",string(vB3,n4),",vB4=",string(vB4,n5)).
compute p1552="vB3 in 0，不應答vB4而答".
end if.

* logic check show vB6.
do if (any(vB5,0)) & any(1,vB6_96).
compute m1553=concat("vB5=",string(vB5,n4),",vB6=",string(vB6,n5)).
compute p1553="vB5 in 0，應答vB6而未答".
end if.

* logic check show vB7.
do if (any(vB5,0)) & any(1,vB7_96).
compute m1554=concat("vB5=",string(vB5,n4),",vB7=",string(vB7,n2)).
compute p1554="vB5 in 0，應答vB7而未答".
end if.

* logic check hide vI2.
do if (any(vI1,0)) & any(0,vI2_96).
compute m1555=concat("vI1=",string(vI1,n4),",vI2=",string(vI2,n5)).
compute p1555="vI1 in 0，不應答vI2而答".
end if.

* logic check hide vI4.
do if (any(vI3,0)) & any(0,vI4_96).
compute m1556=concat("vI3=",string(vI3,n4),",vI4=",string(vI4,n5)).
compute p1556="vI3 in 0，不應答vI4而答".
end if.

* logic check hide vG1.
do if (any(vA9,1)) & any(0,vG1_96).
compute m1557=concat("vA9=",string(vA9,n2),",vG1=",string(vG1,n4)).
compute p1557="vA9 in 1，不應答vG1而答".
end if.

* logic check hide vG2.
do if ((any(vA9,1)| any(vG1,0))) & any(0,vG2_96).
compute m1558=concat(
  "vA9=",
  string(vA9,n2),
  ",vG1=",
  string(vG1,n4),
  ",vG2=",
  string(vG2,n5)
).
compute p1558="(vA9 in 1 | vG1 in 0)，不應答vG2而答".
end if.

* logic check hide vG3m01,vG3m02,vG3m03,vG3m04,vG3m05,vG3m06,vG3m07,vG3m08,vG3m09,vG3m10,vG3m11,vG3m12,vG3m13,vG3m14,vG3m15,vG3m16,vG3m18,vG3m19,vG3m20,vG3m21,vG3m22,vG3m23,vG3m24,vG3m25,vG3m26,vG3m27,vG3m28,vG3m29,vG3m30,vG3m31,vG3m32,vG3m33,vG3m88.
do if ((any(vA9,1)| any(vG1,0))) & (any(0,vG3m01_96) | any(0,vG3m02_96) | any(0,vG3m03_96) | any(0,vG3m04_96) | any(0,vG3m05_96) | any(0,vG3m06_96) | any(0,vG3m07_96) | any(0,vG3m08_96) | any(0,vG3m09_96) | any(0,vG3m10_96) | any(0,vG3m11_96) | any(0,vG3m12_96) | any(0,vG3m13_96) | any(0,vG3m14_96) | any(0,vG3m15_96) | any(0,vG3m16_96) | any(0,vG3m18_96) | any(0,vG3m19_96) | any(0,vG3m20_96) | any(0,vG3m21_96) | any(0,vG3m22_96) | any(0,vG3m23_96) | any(0,vG3m24_96) | any(0,vG3m25_96) | any(0,vG3m26_96) | any(0,vG3m27_96) | any(0,vG3m28_96) | any(0,vG3m29_96) | any(0,vG3m30_96) | any(0,vG3m31_96) | any(0,vG3m32_96) | any(0,vG3m33_96) | any(0,vG3m88_96)).
compute m1559=concat(
  "vA9=",
  string(vA9,n2),
  ",vG1=",
  string(vG1,n4),
  ",vG3m01=",
  string(vG3m01,n2),
  ",vG3m02=",
  string(vG3m02,n2),
  ",vG3m03=",
  string(vG3m03,n2),
  ",vG3m04=",
  string(vG3m04,n2),
  ",vG3m05=",
  string(vG3m05,n2),
  ",vG3m06=",
  string(vG3m06,n2),
  ",vG3m07=",
  string(vG3m07,n2),
  ",vG3m08=",
  string(vG3m08,n2),
  ",vG3m09=",
  string(vG3m09,n2),
  ",vG3m10=",
  string(vG3m10,n2),
  ",vG3m11=",
  string(vG3m11,n2),
  ",vG3m12=",
  string(vG3m12,n2),
  ",vG3m13=",
  string(vG3m13,n2),
  ",vG3m14=",
  string(vG3m14,n2),
  ",vG3m15=",
  string(vG3m15,n2),
  ",vG3m16=",
  string(vG3m16,n2),
  ",vG3m18=",
  string(vG3m18,n2),
  ",vG3m19=",
  string(vG3m19,n2),
  ",vG3m20=",
  string(vG3m20,n2),
  ",vG3m21=",
  string(vG3m21,n2),
  ",vG3m22=",
  string(vG3m22,n2),
  ",vG3m23=",
  string(vG3m23,n2),
  ",vG3m24=",
  string(vG3m24,n2),
  ",vG3m25=",
  string(vG3m25,n2),
  ",vG3m26=",
  string(vG3m26,n2),
  ",vG3m27=",
  string(vG3m27,n2),
  ",vG3m28=",
  string(vG3m28,n2),
  ",vG3m29=",
  string(vG3m29,n2),
  ",vG3m30=",
  string(vG3m30,n2),
  ",vG3m31=",
  string(vG3m31,n2),
  ",vG3m32=",
  string(vG3m32,n2),
  ",vG3m33=",
  string(vG3m33,n2),
  ",vG3m88=",
  string(vG3m88,n2)
).
compute p1559="(vA9 in 1 | vG1 in 0)，不應答vG3m01,vG3m02,vG3m03,vG3m04,vG3m05,vG3m06,vG3m07,vG3m08,vG3m09,vG3m10,vG3m11,vG3m12,vG3m13,vG3m14,vG3m15,vG3m16,vG3m18,vG3m19,vG3m20,vG3m21,vG3m22,vG3m23,vG3m24,vG3m25,vG3m26,vG3m27,vG3m28,vG3m29,vG3m30,vG3m31,vG3m32,vG3m33,vG3m88而答".
end if.

* logic check hide vF0.
do if (any(vA9,1)) & any(0,vF0_96).
compute m1560=concat("vA9=",string(vA9,n2),",vF0=",string(vF0,n2)).
compute p1560="vA9 in 1，不應答vF0而答".
end if.

* logic check show vF1.
do if (any(vF0,1,89)) & any(1,vF1_96).
compute m1561=concat("vF0=",string(vF0,n2),",vF1=",string(vF1,n5)).
compute p1561="vF0 in 1,89，應答vF1而未答".
end if.

* logic check show vF2.
do if (any(vF0,1,89)) & any(1,vF2_96).
compute m1562=concat("vF0=",string(vF0,n2),",vF2=",string(vF2,n5)).
compute p1562="vF0 in 1,89，應答vF2而未答".
end if.

* logic check show vF3.
do if (any(vF0,2,89)) & any(1,vF3_96).
compute m1563=concat("vF0=",string(vF0,n2),",vF3=",string(vF3,n5)).
compute p1563="vF0 in 2,89，應答vF3而未答".
end if.

* logic check show vF4.
do if (any(vF0,2,89)) & any(1,vF4_96).
compute m1564=concat("vF0=",string(vF0,n2),",vF4=",string(vF4,n5)).
compute p1564="vF0 in 2,89，應答vF4而未答".
end if.

* logic check hide vF5m01,vF5m02,vF5m03,vF5m04,vF5m05,vF5m06,vF5m07,vF5m08,vF5m88.
do if (any(vF0,90,97,98)) & (any(0,vF5m01_96) | any(0,vF5m02_96) | any(0,vF5m03_96) | any(0,vF5m04_96) | any(0,vF5m05_96) | any(0,vF5m06_96) | any(0,vF5m07_96) | any(0,vF5m08_96) | any(0,vF5m88_96)).
compute m1565=concat(
  "vF0=",
  string(vF0,n2),
  ",vF5m01=",
  string(vF5m01,n2),
  ",vF5m02=",
  string(vF5m02,n2),
  ",vF5m03=",
  string(vF5m03,n2),
  ",vF5m04=",
  string(vF5m04,n2),
  ",vF5m05=",
  string(vF5m05,n2),
  ",vF5m06=",
  string(vF5m06,n2),
  ",vF5m07=",
  string(vF5m07,n2),
  ",vF5m08=",
  string(vF5m08,n2),
  ",vF5m88=",
  string(vF5m88,n2)
).
compute p1565="vF0 in 90,97,98，不應答vF5m01,vF5m02,vF5m03,vF5m04,vF5m05,vF5m06,vF5m07,vF5m08,vF5m88而答".
end if.

* logic check hide vC2.
do if (any(vC1,0)) & any(0,vC2_96).
compute m1566=concat("vC1=",string(vC1,n4),",vC2=",string(vC2,n5)).
compute p1566="vC1 in 0，不應答vC2而答".
end if.

* logic check hide vC3m01,vC3m02,vC3m03,vC3m04,vC3m05,vC3m06,vC3m07,vC3m08,vC3m09,vC3m10,vC3m11,vC3m88.
do if (any(vC1,0)) & (any(0,vC3m01_96) | any(0,vC3m02_96) | any(0,vC3m03_96) | any(0,vC3m04_96) | any(0,vC3m05_96) | any(0,vC3m06_96) | any(0,vC3m07_96) | any(0,vC3m08_96) | any(0,vC3m09_96) | any(0,vC3m10_96) | any(0,vC3m11_96) | any(0,vC3m88_96)).
compute m1567=concat(
  "vC1=",
  string(vC1,n4),
  ",vC3m01=",
  string(vC3m01,n2),
  ",vC3m02=",
  string(vC3m02,n2),
  ",vC3m03=",
  string(vC3m03,n2),
  ",vC3m04=",
  string(vC3m04,n2),
  ",vC3m05=",
  string(vC3m05,n2),
  ",vC3m06=",
  string(vC3m06,n2),
  ",vC3m07=",
  string(vC3m07,n2),
  ",vC3m08=",
  string(vC3m08,n2),
  ",vC3m09=",
  string(vC3m09,n2),
  ",vC3m10=",
  string(vC3m10,n2),
  ",vC3m11=",
  string(vC3m11,n2),
  ",vC3m88=",
  string(vC3m88,n2)
).
compute p1567="vC1 in 0，不應答vC3m01,vC3m02,vC3m03,vC3m04,vC3m05,vC3m06,vC3m07,vC3m08,vC3m09,vC3m10,vC3m11,vC3m88而答".
end if.

* logic check hide vJ4_2.
do if (any(vA9,1)) & any(0,vJ4_2_96).
compute m1568=concat("vA9=",string(vA9,n2),",vJ4_2=",string(vJ4_2,n4)).
compute p1568="vA9 in 1，不應答vJ4_2而答".
end if.

* logic check hide vJ4_4.
do if (any(vA9,1)) & any(0,vJ4_4_96).
compute m1569=concat("vA9=",string(vA9,n2),",vJ4_4=",string(vJ4_4,n4)).
compute p1569="vA9 in 1，不應答vJ4_4而答".
end if.

* logic check show vJ4_5.
do if (any(vE1,1)) & any(1,vJ4_5_96).
compute m1570=concat("vE1=",string(vE1,n2),",vJ4_5=",string(vJ4_5,n4)).
compute p1570="vE1 in 1，應答vJ4_5而未答".
end if.

* logic check show vJB1m01,vJB1m02,vJB1m03,vJB1m04,vJB1m05,vJB1m06,vJB1m07,vJB1m08,vJB1m09,vJB1m10,vJB1m11,vJB1m88,vJB1m90.
do if (any(vB5,0)) & (any(1,vJB1m01_96) | any(1,vJB1m02_96) | any(1,vJB1m03_96) | any(1,vJB1m04_96) | any(1,vJB1m05_96) | any(1,vJB1m06_96) | any(1,vJB1m07_96) | any(1,vJB1m08_96) | any(1,vJB1m09_96) | any(1,vJB1m10_96) | any(1,vJB1m11_96) | any(1,vJB1m88_96) | any(1,vJB1m90_96)).
compute m1571=concat(
  "vB5=",
  string(vB5,n4),
  ",vJB1m01=",
  string(vJB1m01,n2),
  ",vJB1m02=",
  string(vJB1m02,n2),
  ",vJB1m03=",
  string(vJB1m03,n2),
  ",vJB1m04=",
  string(vJB1m04,n2),
  ",vJB1m05=",
  string(vJB1m05,n2),
  ",vJB1m06=",
  string(vJB1m06,n2),
  ",vJB1m07=",
  string(vJB1m07,n2),
  ",vJB1m08=",
  string(vJB1m08,n2),
  ",vJB1m09=",
  string(vJB1m09,n2),
  ",vJB1m10=",
  string(vJB1m10,n2),
  ",vJB1m11=",
  string(vJB1m11,n2),
  ",vJB1m88=",
  string(vJB1m88,n2),
  ",vJB1m90=",
  string(vJB1m90,n2)
).
compute p1571="vB5 in 0，應答vJB1m01,vJB1m02,vJB1m03,vJB1m04,vJB1m05,vJB1m06,vJB1m07,vJB1m08,vJB1m09,vJB1m10,vJB1m11,vJB1m88,vJB1m90而未答".
end if.

* logic check show vJB2m01,vJB2m02,vJB2m03,vJB2m04,vJB2m05,vJB2m06,vJB2m07,vJB2m88,vJB2m90.
do if (any(vE1,1)) & (any(1,vJB2m01_96) | any(1,vJB2m02_96) | any(1,vJB2m03_96) | any(1,vJB2m04_96) | any(1,vJB2m05_96) | any(1,vJB2m06_96) | any(1,vJB2m07_96) | any(1,vJB2m88_96) | any(1,vJB2m90_96)).
compute m1572=concat(
  "vE1=",
  string(vE1,n2),
  ",vJB2m01=",
  string(vJB2m01,n2),
  ",vJB2m02=",
  string(vJB2m02,n2),
  ",vJB2m03=",
  string(vJB2m03,n2),
  ",vJB2m04=",
  string(vJB2m04,n2),
  ",vJB2m05=",
  string(vJB2m05,n2),
  ",vJB2m06=",
  string(vJB2m06,n2),
  ",vJB2m07=",
  string(vJB2m07,n2),
  ",vJB2m88=",
  string(vJB2m88,n2),
  ",vJB2m90=",
  string(vJB2m90,n2)
).
compute p1572="vE1 in 1，應答vJB2m01,vJB2m02,vJB2m03,vJB2m04,vJB2m05,vJB2m06,vJB2m07,vJB2m88,vJB2m90而未答".
end if.

* logic check show vH2.
do if (any(vH1,997,998)) & any(1,vH2_96).
compute m1573=concat("vH1=",string(vH1,n4),",vH2=",string(vH2,n2)).
compute p1573="vH1 in 997,998，應答vH2而未答".
end if.

* logic check hide vH3.
do if ((any(vH1,0)| any(vH2,1))) & any(0,vH3_96).
compute m1574=concat(
  "vH1=",
  string(vH1,n4),
  ",vH2=",
  string(vH2,n2),
  ",vH3=",
  string(vH3,n2)
).
compute p1574="(vH1 in 0 | vH2 in 1)，不應答vH3而答".
end if.

* logic check show vH4.
do if (any(vE1,1)) & any(1,vH4_96).
compute m1575=concat("vE1=",string(vE1,n2),",vH4=",string(vH4,n4)).
compute p1575="vE1 in 1，應答vH4而未答".
end if.

* logic check show vH5.
do if (any(vH4,997,998)) & any(1,vH5_96).
compute m1576=concat("vH4=",string(vH4,n4),",vH5=",string(vH5,n2)).
compute p1576="vH4 in 997,998，應答vH5而未答".
end if.

* logic check hide vH6.
do if ((any(vH4,0)| any(vH5,1))) & any(0,vH6_96).
compute m1577=concat(
  "vH4=",
  string(vH4,n4),
  ",vH5=",
  string(vH5,n2),
  ",vH6=",
  string(vH6,n2)
).
compute p1577="(vH4 in 0 | vH5 in 1)，不應答vH6而答".
end if.

* logic check show vN24.
do if (any(vO1,1,2,3,4,5,88)) & any(1,vN24_96).
compute m1578=concat("vO1=",string(vO1,n2),",vN24=",string(vN24,n2)).
compute p1578="vO1 in 1,2,3,4,5,88，應答vN24而未答".
end if.

* logic check hide vQ1.
do if (any(vA9,1)) & any(0,vQ1_96).
compute m1579=concat("vA9=",string(vA9,n2),",vQ1=",string(vQ1,n2)).
compute p1579="vA9 in 1，不應答vQ1而答".
end if.

* logic check hide vQ2.
do if (any(vA9,1)) & any(0,vQ2_96).
compute m1580=concat("vA9=",string(vA9,n2),",vQ2=",string(vQ2,n2)).
compute p1580="vA9 in 1，不應答vQ2而答".
end if.

* logic check show vQ5.
do if (any(vE1,1)) & any(1,vQ5_96).
compute m1581=concat("vE1=",string(vE1,n2),",vQ5=",string(vQ5,n2)).
compute p1581="vE1 in 1，應答vQ5而未答".
end if.

* logic check show vQ6.
do if ((any(vQ5,2,97,98)| any(vK2m90,1))) & any(1,vQ6_96).
compute m1582=concat(
  "vQ5=",
  string(vQ5,n2),
  ",vK2m90=",
  string(vK2m90,n2),
  ",vQ6=",
  string(vQ6,n2)
).
compute p1582="(vQ5 in 2,97,98 | vK2m90 in 1)，應答vQ6而未答".
end if.

* logic check show vQ7.
do if ((any(vQ5,2,97,98)| any(vK3m90,1))) & any(1,vQ7_96).
compute m1583=concat(
  "vQ5=",
  string(vQ5,n2),
  ",vK3m90=",
  string(vK3m90,n2),
  ",vQ7=",
  string(vQ7,n2)
).
compute p1583="(vQ5 in 2,97,98 | vK3m90 in 1)，應答vQ7而未答".
end if.

* logic check show vQ8.
do if ((any(vQ5,2,97,98)| any(vK1m90,1))) & any(1,vQ8_96).
compute m1584=concat(
  "vQ5=",
  string(vQ5,n2),
  ",vK1m90=",
  string(vK1m90,n2),
  ",vQ8=",
  string(vQ8,n2)
).
compute p1584="(vQ5 in 2,97,98 | vK1m90 in 1)，應答vQ8而未答".
end if.

* logic check show vQ10.
do if (any(vE1,1)) & any(1,vQ10_96).
compute m1585=concat("vE1=",string(vE1,n2),",vQ10=",string(vQ10,n2)).
compute p1585="vE1 in 1，應答vQ10而未答".
end if.

* logic check show vCKQ10.
do if (any(vQ5,2)& any(vQ10,1)) & any(1,vCKQ10_96).
compute m1586=concat(
  "vQ5=",
  string(vQ5,n2),
  ",vQ10=",
  string(vQ10,n2),
  ",vCKQ10=",
  string(vCKQ10,n2)
).
compute p1586="vQ5 in 2 & vQ10 in 1，應答vCKQ10而未答".
end if.

* logic check show vQ11.
do if ((any(vQ10,2,97,98)| any(vK2m90,1)| any(vQ6,1))) & any(1,vQ11_96).
compute m1587=concat(
  "vQ10=",
  string(vQ10,n2),
  ",vK2m90=",
  string(vK2m90,n2),
  ",vQ6=",
  string(vQ6,n2),
  ",vQ11=",
  string(vQ11,n2)
).
compute p1587="(vQ10 in 2,97,98 | vK2m90 in 1 | vQ6 in 1)，應答vQ11而未答".
end if.

* logic check show vQ12.
do if ((any(vQ10,2,97,98)| any(vK3m90,1)| any(vQ7,1))) & any(1,vQ12_96).
compute m1588=concat(
  "vQ10=",
  string(vQ10,n2),
  ",vK3m90=",
  string(vK3m90,n2),
  ",vQ7=",
  string(vQ7,n2),
  ",vQ12=",
  string(vQ12,n2)
).
compute p1588="(vQ10 in 2,97,98 | vK3m90 in 1 | vQ7 in 1)，應答vQ12而未答".
end if.

* logic check show vQ13.
do if ((any(vQ10,2,97,98)| any(vK1m90,1)| any(vQ8,1))) & any(1,vQ13_96).
compute m1589=concat(
  "vQ10=",
  string(vQ10,n2),
  ",vK1m90=",
  string(vK1m90,n2),
  ",vQ8=",
  string(vQ8,n2),
  ",vQ13=",
  string(vQ13,n2)
).
compute p1589="(vQ10 in 2,97,98 | vK1m90 in 1 | vQ8 in 1)，應答vQ13而未答".
end if.

* logic check show vQ15.
do if (any(vE1,1)) & any(1,vQ15_96).
compute m1590=concat("vE1=",string(vE1,n2),",vQ15=",string(vQ15,n2)).
compute p1590="vE1 in 1，應答vQ15而未答".
end if.

* logic check show vQ16.
do if ((any(vQ15,2,97,98)| any(vK2m90,1))) & any(1,vQ16_96).
compute m1591=concat(
  "vQ15=",
  string(vQ15,n2),
  ",vK2m90=",
  string(vK2m90,n2),
  ",vQ16=",
  string(vQ16,n2)
).
compute p1591="(vQ15 in 2,97,98 | vK2m90 in 1)，應答vQ16而未答".
end if.

* logic check show vQ17.
do if ((any(vQ15,2,97,98)| any(vK3m90,1))) & any(1,vQ17_96).
compute m1592=concat(
  "vQ15=",
  string(vQ15,n2),
  ",vK3m90=",
  string(vK3m90,n2),
  ",vQ17=",
  string(vQ17,n2)
).
compute p1592="(vQ15 in 2,97,98 | vK3m90 in 1)，應答vQ17而未答".
end if.

* logic check show vQ18.
do if ((any(vQ15,2,97,98)| any(vK1m90,1))) & any(1,vQ18_96).
compute m1593=concat(
  "vQ15=",
  string(vQ15,n2),
  ",vK1m90=",
  string(vK1m90,n2),
  ",vQ18=",
  string(vQ18,n2)
).
compute p1593="(vQ15 in 2,97,98 | vK1m90 in 1)，應答vQ18而未答".
end if.

* logic check show vCKQ20A.
do if (any(vQ5,2)& any(vQ20m02,1)| any(vQ20m03,1)| any(vQ20m04,1)| any(vQ20m05,1)) & any(1,vCKQ20A_96).
compute m1594=concat(
  "vQ5=",
  string(vQ5,n2),
  ",vQ20m02=",
  string(vQ20m02,n2),
  ",vQ20m03=",
  string(vQ20m03,n2),
  ",vQ20m04=",
  string(vQ20m04,n2),
  ",vQ20m05=",
  string(vQ20m05,n2),
  ",vCKQ20A=",
  string(vCKQ20A,n2)
).
compute p1594="vQ5 in 2 & vQ20m02 in 1 | vQ20m03 in 1 | vQ20m04 in 1 | vQ20m05 in 1，應答vCKQ20A而未答".
end if.

* logic check show vCKQ20B.
do if (any(vQ5,2)& any(vQ20m01,1)& any(vB1,0)& any(vB3,0)) & any(1,vCKQ20B_96).
compute m1595=concat(
  "vQ5=",
  string(vQ5,n2),
  ",vQ20m01=",
  string(vQ20m01,n2),
  ",vB1=",
  string(vB1,n4),
  ",vB3=",
  string(vB3,n4),
  ",vCKQ20B=",
  string(vCKQ20B,n2)
).
compute p1595="vQ5 in 2 & vQ20m01 in 1 & vB1 in 0 & vB3 in 0，應答vCKQ20B而未答".
end if.

* logic check show vQ25m01,vQ25m02,vQ25m03,vQ25m04,vQ25m05,vQ25m06,vQ25m07,vQ25m08,vQ25m09,vQ25m10,vQ25m11,vQ25m12,vQ25m13,vQ25m14,vQ25m15,vQ25m16,vQ25m17,vQ25m18,vQ25m19,vQ25m20,vQ25m21,vQ25m22,vQ25m23,vQ25m24,vQ25m25,vQ25m26,vQ25m27,vQ25m28,vQ25m29,vQ25m30,vQ25m31,vQ25m88.
do if (any(vQ20m01,1)) & (any(1,vQ25m01_96) | any(1,vQ25m02_96) | any(1,vQ25m03_96) | any(1,vQ25m04_96) | any(1,vQ25m05_96) | any(1,vQ25m06_96) | any(1,vQ25m07_96) | any(1,vQ25m08_96) | any(1,vQ25m09_96) | any(1,vQ25m10_96) | any(1,vQ25m11_96) | any(1,vQ25m12_96) | any(1,vQ25m13_96) | any(1,vQ25m14_96) | any(1,vQ25m15_96) | any(1,vQ25m16_96) | any(1,vQ25m17_96) | any(1,vQ25m18_96) | any(1,vQ25m19_96) | any(1,vQ25m20_96) | any(1,vQ25m21_96) | any(1,vQ25m22_96) | any(1,vQ25m23_96) | any(1,vQ25m24_96) | any(1,vQ25m25_96) | any(1,vQ25m26_96) | any(1,vQ25m27_96) | any(1,vQ25m28_96) | any(1,vQ25m29_96) | any(1,vQ25m30_96) | any(1,vQ25m31_96) | any(1,vQ25m88_96)).
compute m1596=concat(
  "vQ20m01=",
  string(vQ20m01,n2),
  ",vQ25m01=",
  string(vQ25m01,n2),
  ",vQ25m02=",
  string(vQ25m02,n2),
  ",vQ25m03=",
  string(vQ25m03,n2),
  ",vQ25m04=",
  string(vQ25m04,n2),
  ",vQ25m05=",
  string(vQ25m05,n2),
  ",vQ25m06=",
  string(vQ25m06,n2),
  ",vQ25m07=",
  string(vQ25m07,n2),
  ",vQ25m08=",
  string(vQ25m08,n2),
  ",vQ25m09=",
  string(vQ25m09,n2),
  ",vQ25m10=",
  string(vQ25m10,n2),
  ",vQ25m11=",
  string(vQ25m11,n2),
  ",vQ25m12=",
  string(vQ25m12,n2),
  ",vQ25m13=",
  string(vQ25m13,n2),
  ",vQ25m14=",
  string(vQ25m14,n2),
  ",vQ25m15=",
  string(vQ25m15,n2),
  ",vQ25m16=",
  string(vQ25m16,n2),
  ",vQ25m17=",
  string(vQ25m17,n2),
  ",vQ25m18=",
  string(vQ25m18,n2),
  ",vQ25m19=",
  string(vQ25m19,n2),
  ",vQ25m20=",
  string(vQ25m20,n2),
  ",vQ25m21=",
  string(vQ25m21,n2),
  ",vQ25m22=",
  string(vQ25m22,n2),
  ",vQ25m23=",
  string(vQ25m23,n2),
  ",vQ25m24=",
  string(vQ25m24,n2),
  ",vQ25m25=",
  string(vQ25m25,n2),
  ",vQ25m26=",
  string(vQ25m26,n2),
  ",vQ25m27=",
  string(vQ25m27,n2),
  ",vQ25m28=",
  string(vQ25m28,n2),
  ",vQ25m29=",
  string(vQ25m29,n2),
  ",vQ25m30=",
  string(vQ25m30,n2),
  ",vQ25m31=",
  string(vQ25m31,n2),
  ",vQ25m88=",
  string(vQ25m88,n2)
).
compute p1596="vQ20m01 in 1，應答vQ25m01,vQ25m02,vQ25m03,vQ25m04,vQ25m05,vQ25m06,vQ25m07,vQ25m08,vQ25m09,vQ25m10,vQ25m11,vQ25m12,vQ25m13,vQ25m14,vQ25m15,vQ25m16,vQ25m17,vQ25m18,vQ25m19,vQ25m20,vQ25m21,vQ25m22,vQ25m23,vQ25m24,vQ25m25,vQ25m26,vQ25m27,vQ25m28,vQ25m29,vQ25m30,vQ25m31,vQ25m88而未答".
end if.

* logic check show vQ22m01,vQ22m02,vQ22m03,vQ22m04,vQ22m05,vQ22m06,vQ22m07,vQ22m08,vQ22m09,vQ22m10,vQ22m11,vQ22m12,vQ22m13,vQ22m14,vQ22m15,vQ22m16,vQ22m17,vQ22m18,vQ22m19,vQ22m20,vQ22m21,vQ22m22,vQ22m23,vQ22m24,vQ22m25,vQ22m26,vQ22m27,vQ22m28,vQ22m29,vQ22m30,vQ22m31,vQ22m32,vQ22m33,vQ22m34,vQ22m35,vQ22m36,vQ22m37,vQ22m38,vQ22m39,vQ22m40,vQ22m88.
do if (any(vQ20m02,1)) & (any(1,vQ22m01_96) | any(1,vQ22m02_96) | any(1,vQ22m03_96) | any(1,vQ22m04_96) | any(1,vQ22m05_96) | any(1,vQ22m06_96) | any(1,vQ22m07_96) | any(1,vQ22m08_96) | any(1,vQ22m09_96) | any(1,vQ22m10_96) | any(1,vQ22m11_96) | any(1,vQ22m12_96) | any(1,vQ22m13_96) | any(1,vQ22m14_96) | any(1,vQ22m15_96) | any(1,vQ22m16_96) | any(1,vQ22m17_96) | any(1,vQ22m18_96) | any(1,vQ22m19_96) | any(1,vQ22m20_96) | any(1,vQ22m21_96) | any(1,vQ22m22_96) | any(1,vQ22m23_96) | any(1,vQ22m24_96) | any(1,vQ22m25_96) | any(1,vQ22m26_96) | any(1,vQ22m27_96) | any(1,vQ22m28_96) | any(1,vQ22m29_96) | any(1,vQ22m30_96) | any(1,vQ22m31_96) | any(1,vQ22m32_96) | any(1,vQ22m33_96) | any(1,vQ22m34_96) | any(1,vQ22m35_96) | any(1,vQ22m36_96) | any(1,vQ22m37_96) | any(1,vQ22m38_96) | any(1,vQ22m39_96) | any(1,vQ22m40_96) | any(1,vQ22m88_96)).
compute m1597=concat(
  "vQ20m02=",
  string(vQ20m02,n2),
  ",vQ22m01=",
  string(vQ22m01,n2),
  ",vQ22m02=",
  string(vQ22m02,n2),
  ",vQ22m03=",
  string(vQ22m03,n2),
  ",vQ22m04=",
  string(vQ22m04,n2),
  ",vQ22m05=",
  string(vQ22m05,n2),
  ",vQ22m06=",
  string(vQ22m06,n2),
  ",vQ22m07=",
  string(vQ22m07,n2),
  ",vQ22m08=",
  string(vQ22m08,n2),
  ",vQ22m09=",
  string(vQ22m09,n2),
  ",vQ22m10=",
  string(vQ22m10,n2),
  ",vQ22m11=",
  string(vQ22m11,n2),
  ",vQ22m12=",
  string(vQ22m12,n2),
  ",vQ22m13=",
  string(vQ22m13,n2),
  ",vQ22m14=",
  string(vQ22m14,n2),
  ",vQ22m15=",
  string(vQ22m15,n2),
  ",vQ22m16=",
  string(vQ22m16,n2),
  ",vQ22m17=",
  string(vQ22m17,n2),
  ",vQ22m18=",
  string(vQ22m18,n2),
  ",vQ22m19=",
  string(vQ22m19,n2),
  ",vQ22m20=",
  string(vQ22m20,n2),
  ",vQ22m21=",
  string(vQ22m21,n2),
  ",vQ22m22=",
  string(vQ22m22,n2),
  ",vQ22m23=",
  string(vQ22m23,n2),
  ",vQ22m24=",
  string(vQ22m24,n2),
  ",vQ22m25=",
  string(vQ22m25,n2),
  ",vQ22m26=",
  string(vQ22m26,n2),
  ",vQ22m27=",
  string(vQ22m27,n2),
  ",vQ22m28=",
  string(vQ22m28,n2),
  ",vQ22m29=",
  string(vQ22m29,n2),
  ",vQ22m30=",
  string(vQ22m30,n2),
  ",vQ22m31=",
  string(vQ22m31,n2),
  ",vQ22m32=",
  string(vQ22m32,n2),
  ",vQ22m33=",
  string(vQ22m33,n2),
  ",vQ22m34=",
  string(vQ22m34,n2),
  ",vQ22m35=",
  string(vQ22m35,n2),
  ",vQ22m36=",
  string(vQ22m36,n2),
  ",vQ22m37=",
  string(vQ22m37,n2),
  ",vQ22m38=",
  string(vQ22m38,n2),
  ",vQ22m39=",
  string(vQ22m39,n2),
  ",vQ22m40=",
  string(vQ22m40,n2),
  ",vQ22m88=",
  string(vQ22m88,n2)
).
compute p1597="vQ20m02 in 1，應答vQ22m01,vQ22m02,vQ22m03,vQ22m04,vQ22m05,vQ22m06,vQ22m07,vQ22m08,vQ22m09,vQ22m10,vQ22m11,vQ22m12,vQ22m13,vQ22m14,vQ22m15,vQ22m16,vQ22m17,vQ22m18,vQ22m19,vQ22m20,vQ22m21,vQ22m22,vQ22m23,vQ22m24,vQ22m25,vQ22m26,vQ22m27,vQ22m28,vQ22m29,vQ22m30,vQ22m31,vQ22m32,vQ22m33,vQ22m34,vQ22m35,vQ22m36,vQ22m37,vQ22m38,vQ22m39,vQ22m40,vQ22m88而未答".
end if.

* logic check show vQ23m01,vQ23m02,vQ23m03,vQ23m04,vQ23m05,vQ23m06,vQ23m07,vQ23m08,vQ23m09,vQ23m10,vQ23m11,vQ23m12,vQ23m13,vQ23m14,vQ23m15,vQ23m16,vQ23m17,vQ23m18,vQ23m19,vQ23m20,vQ23m21,vQ23m22,vQ23m23,vQ23m24,vQ23m25,vQ23m26,vQ23m27,vQ23m88.
do if (any(vQ20m03,1)) & (any(1,vQ23m01_96) | any(1,vQ23m02_96) | any(1,vQ23m03_96) | any(1,vQ23m04_96) | any(1,vQ23m05_96) | any(1,vQ23m06_96) | any(1,vQ23m07_96) | any(1,vQ23m08_96) | any(1,vQ23m09_96) | any(1,vQ23m10_96) | any(1,vQ23m11_96) | any(1,vQ23m12_96) | any(1,vQ23m13_96) | any(1,vQ23m14_96) | any(1,vQ23m15_96) | any(1,vQ23m16_96) | any(1,vQ23m17_96) | any(1,vQ23m18_96) | any(1,vQ23m19_96) | any(1,vQ23m20_96) | any(1,vQ23m21_96) | any(1,vQ23m22_96) | any(1,vQ23m23_96) | any(1,vQ23m24_96) | any(1,vQ23m25_96) | any(1,vQ23m26_96) | any(1,vQ23m27_96) | any(1,vQ23m88_96)).
compute m1598=concat(
  "vQ20m03=",
  string(vQ20m03,n2),
  ",vQ23m01=",
  string(vQ23m01,n2),
  ",vQ23m02=",
  string(vQ23m02,n2),
  ",vQ23m03=",
  string(vQ23m03,n2),
  ",vQ23m04=",
  string(vQ23m04,n2),
  ",vQ23m05=",
  string(vQ23m05,n2),
  ",vQ23m06=",
  string(vQ23m06,n2),
  ",vQ23m07=",
  string(vQ23m07,n2),
  ",vQ23m08=",
  string(vQ23m08,n2),
  ",vQ23m09=",
  string(vQ23m09,n2),
  ",vQ23m10=",
  string(vQ23m10,n2),
  ",vQ23m11=",
  string(vQ23m11,n2),
  ",vQ23m12=",
  string(vQ23m12,n2),
  ",vQ23m13=",
  string(vQ23m13,n2),
  ",vQ23m14=",
  string(vQ23m14,n2),
  ",vQ23m15=",
  string(vQ23m15,n2),
  ",vQ23m16=",
  string(vQ23m16,n2),
  ",vQ23m17=",
  string(vQ23m17,n2),
  ",vQ23m18=",
  string(vQ23m18,n2),
  ",vQ23m19=",
  string(vQ23m19,n2),
  ",vQ23m20=",
  string(vQ23m20,n2),
  ",vQ23m21=",
  string(vQ23m21,n2),
  ",vQ23m22=",
  string(vQ23m22,n2),
  ",vQ23m23=",
  string(vQ23m23,n2),
  ",vQ23m24=",
  string(vQ23m24,n2),
  ",vQ23m25=",
  string(vQ23m25,n2),
  ",vQ23m26=",
  string(vQ23m26,n2),
  ",vQ23m27=",
  string(vQ23m27,n2),
  ",vQ23m88=",
  string(vQ23m88,n2)
).
compute p1598="vQ20m03 in 1，應答vQ23m01,vQ23m02,vQ23m03,vQ23m04,vQ23m05,vQ23m06,vQ23m07,vQ23m08,vQ23m09,vQ23m10,vQ23m11,vQ23m12,vQ23m13,vQ23m14,vQ23m15,vQ23m16,vQ23m17,vQ23m18,vQ23m19,vQ23m20,vQ23m21,vQ23m22,vQ23m23,vQ23m24,vQ23m25,vQ23m26,vQ23m27,vQ23m88而未答".
end if.

* logic check show vQ26m01,vQ26m02,vQ26m03,vQ26m04,vQ26m05,vQ26m06,vQ26m07,vQ26m08,vQ26m09,vQ26m10,vQ26m11,vQ26m12,vQ26m13,vQ26m14,vQ26m15,vQ26m16,vQ26m17,vQ26m18,vQ26m19,vQ26m20,vQ26m21,vQ26m22,vQ26m23,vQ26m24,vQ26m25,vQ26m26,vQ26m27,vQ26m28,vQ26m29,vQ26m88.
do if (any(vQ20m04,1)) & (any(1,vQ26m01_96) | any(1,vQ26m02_96) | any(1,vQ26m03_96) | any(1,vQ26m04_96) | any(1,vQ26m05_96) | any(1,vQ26m06_96) | any(1,vQ26m07_96) | any(1,vQ26m08_96) | any(1,vQ26m09_96) | any(1,vQ26m10_96) | any(1,vQ26m11_96) | any(1,vQ26m12_96) | any(1,vQ26m13_96) | any(1,vQ26m14_96) | any(1,vQ26m15_96) | any(1,vQ26m16_96) | any(1,vQ26m17_96) | any(1,vQ26m18_96) | any(1,vQ26m19_96) | any(1,vQ26m20_96) | any(1,vQ26m21_96) | any(1,vQ26m22_96) | any(1,vQ26m23_96) | any(1,vQ26m24_96) | any(1,vQ26m25_96) | any(1,vQ26m26_96) | any(1,vQ26m27_96) | any(1,vQ26m28_96) | any(1,vQ26m29_96) | any(1,vQ26m88_96)).
compute m1599=concat(
  "vQ20m04=",
  string(vQ20m04,n2),
  ",vQ26m01=",
  string(vQ26m01,n2),
  ",vQ26m02=",
  string(vQ26m02,n2),
  ",vQ26m03=",
  string(vQ26m03,n2),
  ",vQ26m04=",
  string(vQ26m04,n2),
  ",vQ26m05=",
  string(vQ26m05,n2),
  ",vQ26m06=",
  string(vQ26m06,n2),
  ",vQ26m07=",
  string(vQ26m07,n2),
  ",vQ26m08=",
  string(vQ26m08,n2),
  ",vQ26m09=",
  string(vQ26m09,n2),
  ",vQ26m10=",
  string(vQ26m10,n2),
  ",vQ26m11=",
  string(vQ26m11,n2),
  ",vQ26m12=",
  string(vQ26m12,n2),
  ",vQ26m13=",
  string(vQ26m13,n2),
  ",vQ26m14=",
  string(vQ26m14,n2),
  ",vQ26m15=",
  string(vQ26m15,n2),
  ",vQ26m16=",
  string(vQ26m16,n2),
  ",vQ26m17=",
  string(vQ26m17,n2),
  ",vQ26m18=",
  string(vQ26m18,n2),
  ",vQ26m19=",
  string(vQ26m19,n2),
  ",vQ26m20=",
  string(vQ26m20,n2),
  ",vQ26m21=",
  string(vQ26m21,n2),
  ",vQ26m22=",
  string(vQ26m22,n2),
  ",vQ26m23=",
  string(vQ26m23,n2),
  ",vQ26m24=",
  string(vQ26m24,n2),
  ",vQ26m25=",
  string(vQ26m25,n2),
  ",vQ26m26=",
  string(vQ26m26,n2),
  ",vQ26m27=",
  string(vQ26m27,n2),
  ",vQ26m28=",
  string(vQ26m28,n2),
  ",vQ26m29=",
  string(vQ26m29,n2),
  ",vQ26m88=",
  string(vQ26m88,n2)
).
compute p1599="vQ20m04 in 1，應答vQ26m01,vQ26m02,vQ26m03,vQ26m04,vQ26m05,vQ26m06,vQ26m07,vQ26m08,vQ26m09,vQ26m10,vQ26m11,vQ26m12,vQ26m13,vQ26m14,vQ26m15,vQ26m16,vQ26m17,vQ26m18,vQ26m19,vQ26m20,vQ26m21,vQ26m22,vQ26m23,vQ26m24,vQ26m25,vQ26m26,vQ26m27,vQ26m28,vQ26m29,vQ26m88而未答".
end if.

* logic check show vP3_4.
do if (any(vE1,1)) & any(1,vP3_4_96).
compute m1600=concat("vE1=",string(vE1,n2),",vP3_4=",string(vP3_4,n2)).
compute p1600="vE1 in 1，應答vP3_4而未答".
end if.

* logic check show vCKP3_4.
do if (any(vQ5,2)& any(vP3_4,2,3,4)) & any(1,vCKP3_4_96).
compute m1601=concat(
  "vQ5=",
  string(vQ5,n2),
  ",vP3_4=",
  string(vP3_4,n2),
  ",vCKP3_4=",
  string(vCKP3_4,n2)
).
compute p1601="vQ5 in 2 & vP3_4 in 2,3,4，應答vCKP3_4而未答".
end if.

* logic check show vP3_5.
do if ((any(vK2m90,1)| any(vQ5,2))) & any(1,vP3_5_96).
compute m1602=concat(
  "vK2m90=",
  string(vK2m90,n2),
  ",vQ5=",
  string(vQ5,n2),
  ",vP3_5=",
  string(vP3_5,n2)
).
compute p1602="(vK2m90 in 1 | vQ5 in 2)，應答vP3_5而未答".
end if.

* logic check show vQ30m01,vQ30m02,vQ30m03,vQ30m04,vQ30m05,vQ30m06,vQ30m07,vQ30m08,vQ30m90.
do if (any(vE1,1)) & (any(1,vQ30m01_96) | any(1,vQ30m02_96) | any(1,vQ30m03_96) | any(1,vQ30m04_96) | any(1,vQ30m05_96) | any(1,vQ30m06_96) | any(1,vQ30m07_96) | any(1,vQ30m08_96) | any(1,vQ30m90_96)).
compute m1603=concat(
  "vE1=",
  string(vE1,n2),
  ",vQ30m01=",
  string(vQ30m01,n2),
  ",vQ30m02=",
  string(vQ30m02,n2),
  ",vQ30m03=",
  string(vQ30m03,n2),
  ",vQ30m04=",
  string(vQ30m04,n2),
  ",vQ30m05=",
  string(vQ30m05,n2),
  ",vQ30m06=",
  string(vQ30m06,n2),
  ",vQ30m07=",
  string(vQ30m07,n2),
  ",vQ30m08=",
  string(vQ30m08,n2),
  ",vQ30m90=",
  string(vQ30m90,n2)
).
compute p1603="vE1 in 1，應答vQ30m01,vQ30m02,vQ30m03,vQ30m04,vQ30m05,vQ30m06,vQ30m07,vQ30m08,vQ30m90而未答".
end if.

* logic check show vQ50.
do if (any(vQ49,2,97,98)) & any(1,vQ50_96).
compute m1604=concat("vQ49=",string(vQ49,n2),",vQ50=",string(vQ50,n2)).
compute p1604="vQ49 in 2,97,98，應答vQ50而未答".
end if.

* logic check show vQ51.
do if ((any(vQ49,1)| any(vQ50,1))) & any(1,vQ51_96).
compute m1605=concat(
  "vQ49=",
  string(vQ49,n2),
  ",vQ50=",
  string(vQ50,n2),
  ",vQ51=",
  string(vQ51,n2)
).
compute p1605="(vQ49 in 1 | vQ50 in 1)，應答vQ51而未答".
end if.

* logic check show vQ52.
do if (any(vQ51,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88)) & any(1,vQ52_96).
compute m1606=concat("vQ51=",string(vQ51,n2),",vQ52=",string(vQ52,n2)).
compute p1606="vQ51 in 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88，應答vQ52而未答".
end if.

* logic check show vZ2_2.
do if (any(vD1,3)) & any(1,vZ2_2_96).
compute m1607=concat("vD1=",string(vD1,n2),",vZ2_2=",string(vZ2_2,n11)).
compute p1607="vD1 in 3，應答vZ2_2而未答".
end if.

* logic check show vZE2_1.
do if (any(vZE2m01,1)| any(vZE2m02,1)) & vZE2_1="96".
compute m1608=concat(
  "vZE2m01=",
  string(vZE2m01,n2),
  ",vZE2m02=",
  string(vZE2m02,n2),
  ",vZE2_1=",
  rtrim(ltrim(vZE2_1))
).
compute p1608="vZE2m01 in 1 | vZE2m02 in 1，應答vZE2_1而未答".
end if.

* logic check show vZE2_2.
do if (any(vZE2m01,1)) & vZE2_2="96".
compute m1609=concat("vZE2m01=",string(vZE2m01,n2),",vZE2_2=",rtrim(ltrim(vZE2_2))).
compute p1609="vZE2m01 in 1，應答vZE2_2而未答".
end if.

* logic check show vZE2_3.
do if (any(vZE2m02,1)) & vZE2_3="96".
compute m1610=concat("vZE2m02=",string(vZE2m02,n2),",vZE2_3=",rtrim(ltrim(vZE2_3))).
compute p1610="vZE2m02 in 1，應答vZE2_3而未答".
end if.

* logic check limit vD3.
do if not any(mod(trunc(vD3/10),10),0,1,2,3,4,5).
compute m1611=concat("vD3=",string(vD3,n5)).
compute p1611="vD3第3碼應為0,1,2,3,4,5".
end if.

* logic check limit vKLI2.
do if not any(mod(trunc(vKLI2/10),10),0,1,2,3,4,5).
compute m1612=concat("vKLI2=",string(vKLI2,n5)).
compute p1612="vKLI2第3碼應為0,1,2,3,4,5".
end if.

* logic check limit vKFB2.
do if not any(mod(trunc(vKFB2/10),10),0,1,2,3,4,5).
compute m1613=concat("vKFB2=",string(vKFB2,n5)).
compute p1613="vKFB2第3碼應為0,1,2,3,4,5".
end if.

* logic check limit vKIG2.
do if not any(mod(trunc(vKIG2/10),10),0,1,2,3,4,5).
compute m1614=concat("vKIG2=",string(vKIG2,n5)).
compute p1614="vKIG2第3碼應為0,1,2,3,4,5".
end if.

* logic check limit vKTT2.
do if not any(mod(trunc(vKTT2/10),10),0,1,2,3,4,5).
compute m1615=concat("vKTT2=",string(vKTT2,n5)).
compute p1615="vKTT2第3碼應為0,1,2,3,4,5".
end if.

* logic check limit vP5_2.
do if not any(mod(trunc(vP5_2/10),10),0,1,2,3,4,5).
compute m1616=concat("vP5_2=",string(vP5_2,n5)).
compute p1616="vP5_2第3碼應為0,1,2,3,4,5".
end if.

* logic check limit vKYT2.
do if not any(mod(trunc(vKYT2/10),10),0,1,2,3,4,5).
compute m1617=concat("vKYT2=",string(vKYT2,n5)).
compute p1617="vKYT2第3碼應為0,1,2,3,4,5".
end if.

* logic check limit vE3.
do if not any(mod(trunc(vE3/10),10),0,1,2,3,4,5).
compute m1618=concat("vE3=",string(vE3,n5)).
compute p1618="vE3第3碼應為0,1,2,3,4,5".
end if.

* logic check limit vG5.
do if not any(mod(trunc(vG5/10),10),0,1,2,3,4,5).
compute m1619=concat("vG5=",string(vG5,n5)).
compute p1619="vG5第3碼應為0,1,2,3,4,5".
end if.

* logic check limit vB2.
do if not any(mod(trunc(vB2/10),10),0,1,2,3,4,5).
compute m1620=concat("vB2=",string(vB2,n5)).
compute p1620="vB2第3碼應為0,1,2,3,4,5".
end if.

* logic check limit vB4.
do if not any(mod(trunc(vB4/10),10),0,1,2,3,4,5).
compute m1621=concat("vB4=",string(vB4,n5)).
compute p1621="vB4第3碼應為0,1,2,3,4,5".
end if.

* logic check limit vB6.
do if not any(mod(trunc(vB6/10),10),0,1,2,3,4,5).
compute m1622=concat("vB6=",string(vB6,n5)).
compute p1622="vB6第3碼應為0,1,2,3,4,5".
end if.

* logic check limit vI2.
do if not any(mod(trunc(vI2/10),10),0,1,2,3,4,5).
compute m1623=concat("vI2=",string(vI2,n5)).
compute p1623="vI2第3碼應為0,1,2,3,4,5".
end if.

* logic check limit vI4.
do if not any(mod(trunc(vI4/10),10),0,1,2,3,4,5).
compute m1624=concat("vI4=",string(vI4,n5)).
compute p1624="vI4第3碼應為0,1,2,3,4,5".
end if.

* logic check limit vG2.
do if not any(mod(trunc(vG2/10),10),0,1,2,3,4,5).
compute m1625=concat("vG2=",string(vG2,n5)).
compute p1625="vG2第3碼應為0,1,2,3,4,5".
end if.

* logic check limit vF2.
do if not any(mod(trunc(vF2/10),10),0,1,2,3,4,5).
compute m1626=concat("vF2=",string(vF2,n5)).
compute p1626="vF2第3碼應為0,1,2,3,4,5".
end if.

* logic check limit vF4.
do if not any(mod(trunc(vF4/10),10),0,1,2,3,4,5).
compute m1627=concat("vF4=",string(vF4,n5)).
compute p1627="vF4第3碼應為0,1,2,3,4,5".
end if.

* logic check limit vC2.
do if not any(mod(trunc(vC2/10),10),0,1,2,3,4,5).
compute m1628=concat("vC2=",string(vC2,n5)).
compute p1628="vC2第3碼應為0,1,2,3,4,5".
end if.

* SYNTAXWORK_END_LOGIC.
