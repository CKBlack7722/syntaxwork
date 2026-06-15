* Encoding: UTF-8.
**3.複選題檢核.
* multiple response display strings.
STRING Q24 (A600).
COMPUTE Q24 = Rtrim(Ltrim(concat("vQ24m1=",string(vQ24m1,f2)," , ","vQ24m2=",string(vQ24m2,f2)," , ","vQ24m3=",string(vQ24m3,f2)," , ","vQ24m4=",string(vQ24m4,f2)," , ","vQ24m5=",string(vQ24m5,f2)," , ","vQ24m6=",string(vQ24m6,f2)))).

*Q24.
vector a=vQ24m1 to vQ24m6.
COMPUTE #Q24zero = (SUM(vQ24m1 TO vQ24m6) = 0).
loop #i=1 to 5.
do if (any(a(#i),0,1) & any(a(#i+1),96))
| (any(a(#i),96) and not any(a(#i+1),96))|#Q24zero=1.
compute m301=Rtrim(Ltrim(Q24)).
compute p301="Q24至少選1項或選特殊碼應一致".
Break.
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
