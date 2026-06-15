**3.複選題檢核.
* F1 F2 組合.
STRING F1 F2 (A600).
COMPUTE F1 = Rtrim(Ltrim(concat("vF1m1=",string(vF1m1,f2)," , ","vF1m2=",string(vF1m2,f2)," , ","vF1m3=",string(vF1m3,f2)," , ","vF1m4=",string(vF1m4,f2)," , ","vF1m5=",string(vF1m5,f2)," , ","vF1m6=",string(vF1m6,f2)," , ","vF1m7=",string(vF1m7,f2)," , ","vF1m8=",string(vF1m8,f2)," , ","vF1m9=",string(vF1m9,f2)," , ","vF1m10=",string(vF1m10,f2)," , ","vF1m11=",string(vF1m11,f2)))).
COMPUTE F2 = Rtrim(Ltrim(concat("vF2m1=",string(vF2m1,f2)," , ","vF2m2=",string(vF2m2,f2)," , ","vF2m3=",string(vF2m3,f2)," , ","vF2m4=",string(vF2m4,f2)," , ","vF2m5=",string(vF2m5,f2)," , ","vF2m6=",string(vF2m6,f2)," , ","vF2m7=",string(vF2m7,f2)," , ","vF2m8=",string(vF2m8,f2)," , ","vF2m9=",string(vF2m9,f2)," , ","vF2m10=",string(vF2m10,f2)," , ","vF2m11=",string(vF2m11,f2)))).

*F1.
vector a=vF1m1 to vF1m11.
COMPUTE #F1zero = (SUM(vF1m1 TO vF1m11) = 0).
loop #i=1 to 10.
do if (any(a(#i),0,1) & any(a(#i+1),96))
| (any(a(#i),96) and not any(a(#i+1),96))
| #F1zero=1.
compute m251=Rtrim(Ltrim(F1)).
compute p251="F1至少選1項或選特殊碼應一致".
end if.
end loop.
exec.

*F2.
vector a=vF2m1 to vF2m11.
COMPUTE #F2zero = (SUM(vF2m1 TO vF2m11) = 0).
loop #i=1 to 10.
do if (any(a(#i),0,1) & any(a(#i+1),96))
| (any(a(#i),96) and not any(a(#i+1),96))
| #F2zero=1.
compute m252=Rtrim(Ltrim(F2)).
compute p252="F2至少選1項或選特殊碼應一致".
end if.
end loop.
exec.

**3.1複選互斥邏輯.
*F2=10 複選題內互斥.
do if any(vF2m10,1) & any(1,vF2m1 to vF2m9).
compute m253=Rtrim(Ltrim(F2)).
compute p253="F2(10)複選題選項應互斥".
end if.
Exec.
