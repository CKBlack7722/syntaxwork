* Encoding: UTF-8.
**LOGIC GROUP CHECKS.
* logic check show v33_1.
do if b=1 & any(1,v33_1_96).
compute m350=concat("b=",string(b,n2),",v33_1=",string(v33_1,n14)).
compute p350="b=1，應答v33_1而未答".
end if.

* logic check hide v33_1.
do if b~=1 & any(0,v33_1_96).
compute m351=concat("b=",string(b,n2),",v33_1=",string(v33_1,n14)).
compute p351="b~=1，不應答v33_1而答".
end if.

* logic check show v33_2.
do if b=2 & any(1,v33_2_96).
compute m352=concat("b=",string(b,n2),",v33_2=",string(v33_2,n14)).
compute p352="b=2，應答v33_2而未答".
end if.

* logic check hide v33_2.
do if b~=2 & any(0,v33_2_96).
compute m353=concat("b=",string(b,n2),",v33_2=",string(v33_2,n14)).
compute p353="b~=2，不應答v33_2而答".
end if.

* logic check show v33_3.
do if b=3 & any(1,v33_3_96).
compute m354=concat("b=",string(b,n2),",v33_3=",string(v33_3,n14)).
compute p354="b=3，應答v33_3而未答".
end if.

* logic check hide v33_3.
do if b~=3 & any(0,v33_3_96).
compute m355=concat("b=",string(b,n2),",v33_3=",string(v33_3,n14)).
compute p355="b~=3，不應答v33_3而答".
end if.

* logic check show v33_4.
do if b=4 & any(1,v33_4_96).
compute m356=concat("b=",string(b,n2),",v33_4=",string(v33_4,n14)).
compute p356="b=4，應答v33_4而未答".
end if.

* logic check hide v33_4.
do if b~=4 & any(0,v33_4_96).
compute m357=concat("b=",string(b,n2),",v33_4=",string(v33_4,n14)).
compute p357="b~=4，不應答v33_4而答".
end if.

* logic check show v33_5.
do if b=5 & any(1,v33_5_96).
compute m358=concat("b=",string(b,n2),",v33_5=",string(v33_5,n14)).
compute p358="b=5，應答v33_5而未答".
end if.

* logic check hide v33_5.
do if b~=5 & any(0,v33_5_96).
compute m359=concat("b=",string(b,n2),",v33_5=",string(v33_5,n14)).
compute p359="b~=5，不應答v33_5而答".
end if.

* logic check hide v51.
do if v50<=3 & any(0,v51_96).
compute m360=concat("v50=",string(v50,n2),",v51=",string(v51,n2)).
compute p360="v50<=3，不應答v51而答".
end if.

* logic check show v51.
do if v50>=4 & v50<96 & any(1,v51_96).
compute m361=concat("v50=",string(v50,n2),",v51=",string(v51,n2)).
compute p361="v50>=4 & v50<96，應答v51而未答".
end if.

* logic check show v58.
do if v57=3 & any(1,v58_96).
compute m362=concat("v57=",string(v57,n2),",v58=",string(v58,n2)).
compute p362="v57=3，應答v58而未答".
end if.

* logic check hide v58.
do if v57~=3 & any(0,v58_96).
compute m363=concat("v57=",string(v57,n2),",v58=",string(v58,n2)).
compute p363="v57~=3，不應答v58而答".
end if.

* logic check show v71_1,v71_2s1,v71_2s2,v71_2s3,v71_2s4.
do if any(v70,1,2,3,4,10) & (any(1,v71_1_96) | v71_2s1="96" | v71_2s2="96" | v71_2s3="96" | v71_2s4="96").
compute m364=concat(
  "v70=",
  string(v70,n2),
  ",v71_1=",
  string(v71_1,n2),
  ",v71_2s1=",
  rtrim(ltrim(v71_2s1)),
  ",v71_2s2=",
  rtrim(ltrim(v71_2s2)),
  ",v71_2s3=",
  rtrim(ltrim(v71_2s3)),
  ",v71_2s4=",
  rtrim(ltrim(v71_2s4))
).
compute p364="v70 in 1~4,10，應答v71_1,v71_2s1,v71_2s2,v71_2s3,v71_2s4而未答".
end if.

* logic check hide v71_1,v71_2s1,v71_2s2,v71_2s3,v71_2s4.
do if v70>=5 & v70<10 & (any(0,v71_1_96) | v71_2s1~="96" | v71_2s2~="96" | v71_2s3~="96" | v71_2s4~="96").
compute m365=concat(
  "v70=",
  string(v70,n2),
  ",v71_1=",
  string(v71_1,n2),
  ",v71_2s1=",
  rtrim(ltrim(v71_2s1)),
  ",v71_2s2=",
  rtrim(ltrim(v71_2s2)),
  ",v71_2s3=",
  rtrim(ltrim(v71_2s3)),
  ",v71_2s4=",
  rtrim(ltrim(v71_2s4))
).
compute p365="v70>=5 & v70<10，不應答v71_1,v71_2s1,v71_2s2,v71_2s3,v71_2s4而答".
end if.

* logic check hide vZ2city.
do if v70>=4 & v70<10 & any(0,vZ2city_96).
compute m366=concat("v70=",string(v70,n2),",vZ2city=",string(vZ2city,n2)).
compute p366="v70>=4 & v70<10，不應答vZ2city而答".
end if.

* logic check show vZ2city.
do if any(v70,1,2,3,10) & any(1,vZ2city_96).
compute m367=concat("v70=",string(v70,n2),",vZ2city=",string(vZ2city,n2)).
compute p367="v70 in 1~3,10，應答vZ2city而未答".
end if.

* logic check show vZ3city.
do if v70=5 & any(1,vZ3city_96).
compute m368=concat("v70=",string(v70,n2),",vZ3city=",string(vZ3city,n2)).
compute p368="v70=5，應答vZ3city而未答".
end if.

* logic check hide vZ3city.
do if v70~=5 & any(0,vZ3city_96).
compute m369=concat("v70=",string(v70,n2),",vZ3city=",string(vZ3city,n2)).
compute p369="v70~=5，不應答vZ3city而答".
end if.
