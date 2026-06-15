**3.複選題檢核.
* v45 v46 v48 組合.
STRING v45 v46 v48 (A600).
COMPUTE v45 = Rtrim(Ltrim(concat("v45m01=",string(v45m01,f2)," , ","v45m02=",string(v45m02,f2)," , ","v45m03=",string(v45m03,f2)," , ","v45m04=",string(v45m04,f2)," , ","v45m05=",string(v45m05,f2)," , ","v45m06=",string(v45m06,f2)," , ","v45m07=",string(v45m07,f2)))).
COMPUTE v46 = Rtrim(Ltrim(concat("v46m01=",string(v46m01,f2)," , ","v46m02=",string(v46m02,f2)," , ","v46m03=",string(v46m03,f2)," , ","v46m04=",string(v46m04,f2)," , ","v46m05=",string(v46m05,f2)," , ","v46m06=",string(v46m06,f2)," , ","v46m07=",string(v46m07,f2)))).
COMPUTE v48 = Rtrim(Ltrim(concat("v48m01=",string(v48m01,f2)," , ","v48m02=",string(v48m02,f2)," , ","v48m03=",string(v48m03,f2)," , ","v48m04=",string(v48m04,f2)," , ","v48m05=",string(v48m05,f2)," , ","v48m06=",string(v48m06,f2)," , ","v48m07=",string(v48m07,f2)))).

*v45.
vector a=v45m01 to v45m07.
COMPUTE #45zero = (SUM(v45m01 TO v45m07) = 0).
loop #i=1 to 6.
do if (any(a(#i),0,1) & any(a(#i+1),96))
| (any(a(#i),96) and not any(a(#i+1),96))
| #45zero=1.
compute m301=Rtrim(Ltrim(v45)).
compute p301="v45至少選1項或選特殊碼應一致".
end if.
end loop.
exec.

*v46.
vector a=v46m01 to v46m07.
COMPUTE #46zero = (SUM(v46m01 TO v46m07) = 0).
loop #i=1 to 6.
do if (any(a(#i),0,1) & any(a(#i+1),96))
| (any(a(#i),96) and not any(a(#i+1),96))
| #46zero=1.
compute m302=Rtrim(Ltrim(v46)).
compute p302="v46至少選1項或選特殊碼應一致".
end if.
end loop.
exec.

*v48.
vector a=v48m01 to v48m07.
COMPUTE #48zero = (SUM(v48m01 TO v48m07) = 0).
loop #i=1 to 6.
do if (any(a(#i),0,1) & any(a(#i+1),96))
| (any(a(#i),96) and not any(a(#i+1),96))
| #48zero=1.
compute m303=Rtrim(Ltrim(v48)).
compute p303="v48至少選1項或選特殊碼應一致".
end if.
end loop.
exec.

**3.1複選互斥邏輯.
*v45=7 複選題內互斥.
do if any(v45m07,1) & any(1,v45m01 to v45m06).
compute m304=Rtrim(Ltrim(v45)).
compute p304="v45(7)複選題選項應互斥".
end if.
Exec.

*v46=7 複選題內互斥.
do if any(v46m07,1) & any(1,v46m01 to v46m06).
compute m305=Rtrim(Ltrim(v46)).
compute p305="v46(7)複選題選項應互斥".
end if.
Exec.

*v48=7 複選題內互斥.
do if any(v48m07,1) & any(1,v48m01 to v48m06).
compute m306=Rtrim(Ltrim(v48)).
compute p306="v48(7)複選題選項應互斥".
end if.
Exec.
