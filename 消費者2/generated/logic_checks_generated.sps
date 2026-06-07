* Encoding: UTF-8.
**LOGIC GROUP CHECKS.
* logic check show vA0.
do if (vG0city=29) & any(1,vA0_96).
compute m301=concat("vG0city=",string(vG0city,n2),",vA0=",string(vA0,n2)).
compute p301="vG0city=29，應答vA0而未答".
end if.

* logic check hide vA0.
do if (vG0city~=29) & any(0,vA0_96).
compute m302=concat("vG0city=",string(vG0city,n2),",vA0=",string(vA0,n2)).
compute p302="vG0city~=29，不應答vA0而答".
end if.

* logic check show vA7R,vB7R.
do if ((vA1+vA2+vA3+vA4+vA5+vA6)>vA7) & (any(1,vA7R_96) | any(1,vB7R_96)).
compute m303=concat(
  "vA1=",
  string(vA1,n10),
  ",vA2=",
  string(vA2,n10),
  ",vA3=",
  string(vA3,n10),
  ",vA4=",
  string(vA4,n10),
  ",vA5=",
  string(vA5,n10),
  ",vA6=",
  string(vA6,n10),
  ",vA7=",
  string(vA7,n10),
  ",vA7R=",
  string(vA7R,n10),
  ",vB7R=",
  string(vB7R,n2)
).
compute p303="(vA1+vA2+vA3+vA4+vA5+vA6)>vA7，應答vA7R,vB7R而未答".
end if.

* logic check hide vA7R,vB7R.
do if ((vA1+vA2+vA3+vA4+vA5+vA6)<=vA7) & (any(0,vA7R_96) | any(0,vB7R_96)).
compute m304=concat(
  "vA1=",
  string(vA1,n10),
  ",vA2=",
  string(vA2,n10),
  ",vA3=",
  string(vA3,n10),
  ",vA4=",
  string(vA4,n10),
  ",vA5=",
  string(vA5,n10),
  ",vA6=",
  string(vA6,n10),
  ",vA7=",
  string(vA7,n10),
  ",vA7R=",
  string(vA7R,n10),
  ",vB7R=",
  string(vB7R,n2)
).
compute p304="(vA1+vA2+vA3+vA4+vA5+vA6)<=vA7，不應答vA7R,vB7R而答".
end if.

* logic check show vEND2.
do if ((vA1+vA2+vA3+vA4+vA5+vA6)>(vA7R*1.1)) & any(1,vEND2_96).
compute m305=concat(
  "vA1=",
  string(vA1,n10),
  ",vA2=",
  string(vA2,n10),
  ",vA3=",
  string(vA3,n10),
  ",vA4=",
  string(vA4,n10),
  ",vA5=",
  string(vA5,n10),
  ",vA6=",
  string(vA6,n10),
  ",vA7R=",
  string(vA7R,n10),
  ",vEND2=",
  string(vEND2,n14)
).
compute p305="(vA1+vA2+vA3+vA4+vA5+vA6)>(vA7R*1.1)，應答vEND2而未答".
end if.

* logic check hide vEND2.
do if ((vA1+vA2+vA3+vA4+vA5+vA6)<=(vA7R*1.1)) & any(0,vEND2_96).
compute m306=concat(
  "vA1=",
  string(vA1,n10),
  ",vA2=",
  string(vA2,n10),
  ",vA3=",
  string(vA3,n10),
  ",vA4=",
  string(vA4,n10),
  ",vA5=",
  string(vA5,n10),
  ",vA6=",
  string(vA6,n10),
  ",vA7R=",
  string(vA7R,n10),
  ",vEND2=",
  string(vEND2,n14)
).
compute p306="(vA1+vA2+vA3+vA4+vA5+vA6)<=(vA7R*1.1)，不應答vEND2而答".
end if.

* logic check show vB1U.
do if (vB1=1) & any(1,vB1U_96).
compute m307=concat("vB1=",string(vB1,n2),",vB1U=",string(vB1U,n10)).
compute p307="vB1=1，應答vB1U而未答".
end if.

* logic check hide vB1U.
do if (vB1~=1) & any(0,vB1U_96).
compute m308=concat("vB1=",string(vB1,n2),",vB1U=",string(vB1U,n10)).
compute p308="vB1~=1，不應答vB1U而答".
end if.

* logic check show vB1D.
do if (vB1=2) & any(1,vB1D_96).
compute m309=concat("vB1=",string(vB1,n2),",vB1D=",string(vB1D,n10)).
compute p309="vB1=2，應答vB1D而未答".
end if.

* logic check hide vB1D.
do if (vB1~=2) & any(0,vB1D_96).
compute m310=concat("vB1=",string(vB1,n2),",vB1D=",string(vB1D,n10)).
compute p310="vB1~=2，不應答vB1D而答".
end if.

* logic check show vB2U.
do if (vB2=1) & any(1,vB2U_96).
compute m311=concat("vB2=",string(vB2,n2),",vB2U=",string(vB2U,n10)).
compute p311="vB2=1，應答vB2U而未答".
end if.

* logic check hide vB2U.
do if (vB2~=1) & any(0,vB2U_96).
compute m312=concat("vB2=",string(vB2,n2),",vB2U=",string(vB2U,n10)).
compute p312="vB2~=1，不應答vB2U而答".
end if.

* logic check show vB2D.
do if (vB2=2) & any(1,vB2D_96).
compute m313=concat("vB2=",string(vB2,n2),",vB2D=",string(vB2D,n10)).
compute p313="vB2=2，應答vB2D而未答".
end if.

* logic check hide vB2D.
do if (vB2~=2) & any(0,vB2D_96).
compute m314=concat("vB2=",string(vB2,n2),",vB2D=",string(vB2D,n10)).
compute p314="vB2~=2，不應答vB2D而答".
end if.

* logic check show vB3U.
do if (vB3=1) & any(1,vB3U_96).
compute m315=concat("vB3=",string(vB3,n2),",vB3U=",string(vB3U,n10)).
compute p315="vB3=1，應答vB3U而未答".
end if.

* logic check hide vB3U.
do if (vB3~=1) & any(0,vB3U_96).
compute m316=concat("vB3=",string(vB3,n2),",vB3U=",string(vB3U,n10)).
compute p316="vB3~=1，不應答vB3U而答".
end if.

* logic check show vB3D.
do if (vB3=2) & any(1,vB3D_96).
compute m317=concat("vB3=",string(vB3,n2),",vB3D=",string(vB3D,n10)).
compute p317="vB3=2，應答vB3D而未答".
end if.

* logic check hide vB3D.
do if (vB3~=2) & any(0,vB3D_96).
compute m318=concat("vB3=",string(vB3,n2),",vB3D=",string(vB3D,n10)).
compute p318="vB3~=2，不應答vB3D而答".
end if.

* logic check show vB4U.
do if (vB4=1) & any(1,vB4U_96).
compute m319=concat("vB4=",string(vB4,n2),",vB4U=",string(vB4U,n10)).
compute p319="vB4=1，應答vB4U而未答".
end if.

* logic check hide vB4U.
do if (vB4~=1) & any(0,vB4U_96).
compute m320=concat("vB4=",string(vB4,n2),",vB4U=",string(vB4U,n10)).
compute p320="vB4~=1，不應答vB4U而答".
end if.

* logic check show vB4D.
do if (vB4=2) & any(1,vB4D_96).
compute m321=concat("vB4=",string(vB4,n2),",vB4D=",string(vB4D,n10)).
compute p321="vB4=2，應答vB4D而未答".
end if.

* logic check hide vB4D.
do if (vB4~=2) & any(0,vB4D_96).
compute m322=concat("vB4=",string(vB4,n2),",vB4D=",string(vB4D,n10)).
compute p322="vB4~=2，不應答vB4D而答".
end if.

* logic check show vB5U.
do if (vB5=1) & any(1,vB5U_96).
compute m323=concat("vB5=",string(vB5,n2),",vB5U=",string(vB5U,n10)).
compute p323="vB5=1，應答vB5U而未答".
end if.

* logic check hide vB5U.
do if (vB5~=1) & any(0,vB5U_96).
compute m324=concat("vB5=",string(vB5,n2),",vB5U=",string(vB5U,n10)).
compute p324="vB5~=1，不應答vB5U而答".
end if.

* logic check show vB5D.
do if (vB5=2) & any(1,vB5D_96).
compute m325=concat("vB5=",string(vB5,n2),",vB5D=",string(vB5D,n10)).
compute p325="vB5=2，應答vB5D而未答".
end if.

* logic check hide vB5D.
do if (vB5~=2) & any(0,vB5D_96).
compute m326=concat("vB5=",string(vB5,n2),",vB5D=",string(vB5D,n10)).
compute p326="vB5~=2，不應答vB5D而答".
end if.

* logic check show vB6U.
do if (vB6=1) & any(1,vB6U_96).
compute m327=concat("vB6=",string(vB6,n2),",vB6U=",string(vB6U,n10)).
compute p327="vB6=1，應答vB6U而未答".
end if.

* logic check hide vB6U.
do if (vB6~=1) & any(0,vB6U_96).
compute m328=concat("vB6=",string(vB6,n2),",vB6U=",string(vB6U,n10)).
compute p328="vB6~=1，不應答vB6U而答".
end if.

* logic check show vB6D.
do if (vB6=2) & any(1,vB6D_96).
compute m329=concat("vB6=",string(vB6,n2),",vB6D=",string(vB6D,n10)).
compute p329="vB6=2，應答vB6D而未答".
end if.

* logic check hide vB6D.
do if (vB6~=2) & any(0,vB6D_96).
compute m330=concat("vB6=",string(vB6,n2),",vB6D=",string(vB6D,n10)).
compute p330="vB6~=2，不應答vB6D而答".
end if.

* logic check show vB7U.
do if (vB7=1) & any(1,vB7U_96).
compute m331=concat("vB7=",string(vB7,n2),",vB7U=",string(vB7U,n10)).
compute p331="vB7=1，應答vB7U而未答".
end if.

* logic check hide vB7U.
do if (vB7~=1) & any(0,vB7U_96).
compute m332=concat("vB7=",string(vB7,n2),",vB7U=",string(vB7U,n10)).
compute p332="vB7~=1，不應答vB7U而答".
end if.

* logic check show vB7D.
do if (vB7=2) & any(1,vB7D_96).
compute m333=concat("vB7=",string(vB7,n2),",vB7D=",string(vB7D,n10)).
compute p333="vB7=2，應答vB7D而未答".
end if.

* logic check hide vB7D.
do if (vB7~=2) & any(0,vB7D_96).
compute m334=concat("vB7=",string(vB7,n2),",vB7D=",string(vB7D,n10)).
compute p334="vB7~=2，不應答vB7D而答".
end if.

* logic check show vB7UR.
do if (vB7R=1) & any(1,vB7UR_96).
compute m335=concat("vB7R=",string(vB7R,n2),",vB7UR=",string(vB7UR,n10)).
compute p335="vB7R=1，應答vB7UR而未答".
end if.

* logic check hide vB7UR.
do if (vB7R~=1) & any(0,vB7UR_96).
compute m336=concat("vB7R=",string(vB7R,n2),",vB7UR=",string(vB7UR,n10)).
compute p336="vB7R~=1，不應答vB7UR而答".
end if.

* logic check show vB7DR.
do if (vB7R=2) & any(1,vB7DR_96).
compute m337=concat("vB7R=",string(vB7R,n2),",vB7DR=",string(vB7DR,n10)).
compute p337="vB7R=2，應答vB7DR而未答".
end if.

* logic check hide vB7DR.
do if (vB7R~=2) & any(0,vB7DR_96).
compute m338=concat("vB7R=",string(vB7R,n2),",vB7DR=",string(vB7DR,n10)).
compute p338="vB7R~=2，不應答vB7DR而答".
end if.

* logic check show vC1U,vC3.
do if (vC1=1) & (any(1,vC1U_96) | any(1,vC3_96)).
compute m339=concat(
  "vC1=",
  string(vC1,n2),
  ",vC1U=",
  string(vC1U,n2),
  ",vC3=",
  string(vC3,n2)
).
compute p339="vC1=1，應答vC1U,vC3而未答".
end if.

* logic check hide vC1U,vC3.
do if (vC1~=1) & (any(0,vC1U_96) | any(0,vC3_96)).
compute m340=concat(
  "vC1=",
  string(vC1,n2),
  ",vC1U=",
  string(vC1U,n2),
  ",vC3=",
  string(vC3,n2)
).
compute p340="vC1~=1，不應答vC1U,vC3而答".
end if.

* logic check show vC1D.
do if (vC1=2) & any(1,vC1D_96).
compute m341=concat("vC1=",string(vC1,n2),",vC1D=",string(vC1D,n2)).
compute p341="vC1=2，應答vC1D而未答".
end if.

* logic check hide vC1D.
do if (vC1~=2) & any(0,vC1D_96).
compute m342=concat("vC1=",string(vC1,n2),",vC1D=",string(vC1D,n2)).
compute p342="vC1~=2，不應答vC1D而答".
end if.

* logic check show vC1U5.
do if (vC1U=4) & any(1,vC1U5_96).
compute m343=concat("vC1U=",string(vC1U,n2),",vC1U5=",string(vC1U5,n10)).
compute p343="vC1U=4，應答vC1U5而未答".
end if.

* logic check hide vC1U5.
do if (vC1U<4) & any(0,vC1U5_96).
compute m344=concat("vC1U=",string(vC1U,n2),",vC1U5=",string(vC1U5,n10)).
compute p344="vC1U<4，不應答vC1U5而答".
end if.

* logic check show vC1U5R.
do if (vC1U5>=50 & vC1U5<9999999996) & any(1,vC1U5R_96).
compute m345=concat("vC1U5=",string(vC1U5,n10),",vC1U5R=",string(vC1U5R,n2)).
compute p345="vC1U5>=50 & vC1U5<9999999996，應答vC1U5R而未答".
end if.

* logic check hide vC1U5R.
do if (vC1U5<50 | vC1U5=9999999996) & any(0,vC1U5R_96).
compute m346=concat("vC1U5=",string(vC1U5,n10),",vC1U5R=",string(vC1U5R,n2)).
compute p346="vC1U5<50 | vC1U5=9999999996，不應答vC1U5R而答".
end if.

* logic check show vC1D1.
do if (vC1D=1) & any(1,vC1D1_96).
compute m347=concat("vC1D=",string(vC1D,n2),",vC1D1=",string(vC1D1,n10)).
compute p347="vC1D=1，應答vC1D1而未答".
end if.

* logic check hide vC1D1.
do if (vC1D~=1) & any(0,vC1D1_96).
compute m348=concat("vC1D=",string(vC1D,n2),",vC1D1=",string(vC1D1,n10)).
compute p348="vC1D~=1，不應答vC1D1而答".
end if.

* logic check show vC1D1R.
do if (vC1D1<=0) & any(1,vC1D1R_96).
compute m349=concat("vC1D1=",string(vC1D1,n10),",vC1D1R=",string(vC1D1R,n2)).
compute p349="vC1D1<=0，應答vC1D1R而未答".
end if.

* logic check hide vC1D1R.
do if (vC1D1>0 & vC1D1<0.5) & any(0,vC1D1R_96).
compute m350=concat("vC1D1=",string(vC1D1,n10),",vC1D1R=",string(vC1D1R,n2)).
compute p350="vC1D1>0 & vC1D1<0.5，不應答vC1D1R而答".
end if.

* logic check show vC2U7.
do if (vC2=7) & any(1,vC2U7_96).
compute m351=concat("vC2=",string(vC2,n2),",vC2U7=",string(vC2U7,n6)).
compute p351="vC2=7，應答vC2U7而未答".
end if.

* logic check hide vC2U7.
do if (vC2<7) & any(0,vC2U7_96).
compute m352=concat("vC2=",string(vC2,n2),",vC2U7=",string(vC2U7,n6)).
compute p352="vC2<7，不應答vC2U7而答".
end if.

* logic check show vC2U7R.
do if (vC2U7>=50 & vC2U7<999996) & any(1,vC2U7R_96).
compute m353=concat("vC2U7=",string(vC2U7,n6),",vC2U7R=",string(vC2U7R,n2)).
compute p353="vC2U7>=50 & vC2U7<999996，應答vC2U7R而未答".
end if.

* logic check hide vC2U7R.
do if (vC2U7<50 | vC2U7=999996) & any(0,vC2U7R_96).
compute m354=concat("vC2U7=",string(vC2U7,n6),",vC2U7R=",string(vC2U7R,n2)).
compute p354="vC2U7<50 | vC2U7=999996，不應答vC2U7R而答".
end if.

* logic check show vC2D1.
do if (vC2=1) & any(1,vC2D1_96).
compute m355=concat("vC2=",string(vC2,n2),",vC2D1=",string(vC2D1,n6)).
compute p355="vC2=1，應答vC2D1而未答".
end if.

* logic check hide vC2D1.
do if (vC2>1) & any(0,vC2D1_96).
compute m356=concat("vC2=",string(vC2,n2),",vC2D1=",string(vC2D1,n6)).
compute p356="vC2>1，不應答vC2D1而答".
end if.

* logic check show vC2D1R.
do if (vC2D1<=0) & any(1,vC2D1R_96).
compute m357=concat("vC2D1=",string(vC2D1,n6),",vC2D1R=",string(vC2D1R,n2)).
compute p357="vC2D1<=0，應答vC2D1R而未答".
end if.

* logic check hide vC2D1R.
do if (vC2D1>0) & any(0,vC2D1R_96).
compute m358=concat("vC2D1=",string(vC2D1,n6),",vC2D1R=",string(vC2D1R,n2)).
compute p358="vC2D1>0，不應答vC2D1R而答".
end if.

* logic check show vD1D.
do if (vD1=1) & any(1,vD1D_96).
compute m359=concat("vD1=",string(vD1,n2),",vD1D=",string(vD1D,n2)).
compute p359="vD1=1，應答vD1D而未答".
end if.

* logic check hide vD1D.
do if (vD1~=1) & any(0,vD1D_96).
compute m360=concat("vD1=",string(vD1,n2),",vD1D=",string(vD1D,n2)).
compute p360="vD1~=1，不應答vD1D而答".
end if.

* logic check show vD1U.
do if (vD1=2) & any(1,vD1U_96).
compute m361=concat("vD1=",string(vD1,n2),",vD1U=",string(vD1U,n2)).
compute p361="vD1=2，應答vD1U而未答".
end if.

* logic check hide vD1U.
do if (vD1~=2) & any(0,vD1U_96).
compute m362=concat("vD1=",string(vD1,n2),",vD1U=",string(vD1U,n2)).
compute p362="vD1~=2，不應答vD1U而答".
end if.

* logic check show vD1D5.
do if (vD1D=5) & any(1,vD1D5_96).
compute m363=concat("vD1D=",string(vD1D,n2),",vD1D5=",string(vD1D5,n7)).
compute p363="vD1D=5，應答vD1D5而未答".
end if.

* logic check hide vD1D5.
do if (vD1D~=5) & any(0,vD1D5_96).
compute m364=concat("vD1D=",string(vD1D,n2),",vD1D5=",string(vD1D5,n7)).
compute p364="vD1D~=5，不應答vD1D5而答".
end if.

* logic check show vD1U5.
do if (vD1U=5) & any(1,vD1U5_96).
compute m365=concat("vD1U=",string(vD1U,n2),",vD1U5=",string(vD1U5,n7)).
compute p365="vD1U=5，應答vD1U5而未答".
end if.

* logic check hide vD1U5.
do if (vD1U~=5) & any(0,vD1U5_96).
compute m366=concat("vD1U=",string(vD1U,n2),",vD1U5=",string(vD1U5,n7)).
compute p366="vD1U~=5，不應答vD1U5而答".
end if.

* logic check show vF1_1.
do if (vF1m3=1) & any(1,vF1_1_96).
compute m367=concat("vF1m3=",string(vF1m3,n2),",vF1_1=",string(vF1_1,n2)).
compute p367="vF1m3=1，應答vF1_1而未答".
end if.

* logic check hide vF1_1.
do if (vF1m3=0) & any(0,vF1_1_96).
compute m368=concat("vF1m3=",string(vF1m3,n2),",vF1_1=",string(vF1_1,n2)).
compute p368="vF1m3=0，不應答vF1_1而答".
end if.

* logic check show vF1_2,vF1_3.
do if (vF1m4=1) & (any(1,vF1_2_96) | any(1,vF1_3_96)).
compute m369=concat(
  "vF1m4=",
  string(vF1m4,n2),
  ",vF1_2=",
  string(vF1_2,n2),
  ",vF1_3=",
  string(vF1_3,n2)
).
compute p369="vF1m4=1，應答vF1_2,vF1_3而未答".
end if.

* logic check hide vF1_2,vF1_3.
do if (vF1m4=0) & (any(0,vF1_2_96) | any(0,vF1_3_96)).
compute m370=concat(
  "vF1m4=",
  string(vF1m4,n2),
  ",vF1_2=",
  string(vF1_2,n2),
  ",vF1_3=",
  string(vF1_3,n2)
).
compute p370="vF1m4=0，不應答vF1_2,vF1_3而答".
end if.

* logic check limit vB1.
do if (vA1=0) & any(vB1,2).
compute m371=concat("vA1=",string(vA1,n10),",vB1=",string(vB1,n2)).
compute p371="vA1=0，vB1不可為2".
end if.

* logic check limit vB1D.
do if (vB1=2) & vB1D>vA1.
compute m372=concat(
  "vB1=",
  string(vB1,n2),
  ",vB1D=",
  string(vB1D,n10),
  ",vA1=",
  string(vA1,n10)
).
compute p372="vB1=2，vB1D應<=vA1".
end if.

* logic check limit vB2.
do if (vA2=0) & any(vB2,2).
compute m373=concat("vA2=",string(vA2,n10),",vB2=",string(vB2,n2)).
compute p373="vA2=0，vB2不可為2".
end if.

* logic check limit vB2D.
do if (vB2=2) & vB2D>vA2.
compute m374=concat(
  "vB2=",
  string(vB2,n2),
  ",vB2D=",
  string(vB2D,n10),
  ",vA2=",
  string(vA2,n10)
).
compute p374="vB2=2，vB2D應<=vA2".
end if.

* logic check limit vB3.
do if (vA3=0) & any(vB3,2).
compute m375=concat("vA3=",string(vA3,n10),",vB3=",string(vB3,n2)).
compute p375="vA3=0，vB3不可為2".
end if.

* logic check limit vB3D.
do if (vB3=2) & vB3D>vA3.
compute m376=concat(
  "vB3=",
  string(vB3,n2),
  ",vB3D=",
  string(vB3D,n10),
  ",vA3=",
  string(vA3,n10)
).
compute p376="vB3=2，vB3D應<=vA3".
end if.

* logic check limit vB4.
do if (vA4=0) & any(vB4,2).
compute m377=concat("vA4=",string(vA4,n10),",vB4=",string(vB4,n2)).
compute p377="vA4=0，vB4不可為2".
end if.

* logic check limit vB4D.
do if (vB4=2) & vB4D>vA4.
compute m378=concat(
  "vB4=",
  string(vB4,n2),
  ",vB4D=",
  string(vB4D,n10),
  ",vA4=",
  string(vA4,n10)
).
compute p378="vB4=2，vB4D應<=vA4".
end if.

* logic check limit vB5.
do if (vA5=0) & any(vB5,2).
compute m379=concat("vA5=",string(vA5,n10),",vB5=",string(vB5,n2)).
compute p379="vA5=0，vB5不可為2".
end if.

* logic check limit vB5D.
do if (vB5=2) & vB5D>vA5.
compute m380=concat(
  "vB5=",
  string(vB5,n2),
  ",vB5D=",
  string(vB5D,n10),
  ",vA5=",
  string(vA5,n10)
).
compute p380="vB5=2，vB5D應<=vA5".
end if.

* logic check limit vB6.
do if (vA6=0) & any(vB6,2).
compute m381=concat("vA6=",string(vA6,n10),",vB6=",string(vB6,n2)).
compute p381="vA6=0，vB6不可為2".
end if.

* logic check limit vB6D.
do if (vB6=2) & vB6D>vA6.
compute m382=concat(
  "vB6=",
  string(vB6,n2),
  ",vB6D=",
  string(vB6D,n10),
  ",vA6=",
  string(vA6,n10)
).
compute p382="vB6=2，vB6D應<=vA6".
end if.

* logic check limit vB7.
do if (vA7=0) & any(vB7,2).
compute m383=concat("vA7=",string(vA7,n10),",vB7=",string(vB7,n2)).
compute p383="vA7=0，vB7不可為2".
end if.

* logic check limit vB7D.
do if (vB7=2) & vB7D>vA7.
compute m384=concat(
  "vB7=",
  string(vB7,n2),
  ",vB7D=",
  string(vB7D,n10),
  ",vA7=",
  string(vA7,n10)
).
compute p384="vB7=2，vB7D應<=vA7".
end if.

* logic check limit vB7DR.
do if (vB7R=2) & vB7DR>vA7R.
compute m385=concat(
  "vB7R=",
  string(vB7R,n2),
  ",vB7DR=",
  string(vB7DR,n10),
  ",vA7R=",
  string(vA7R,n10)
).
compute p385="vB7R=2，vB7DR應<=vA7R".
end if.
