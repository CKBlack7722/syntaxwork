* aggregate variables.
compute sumE5_E12_min=0.
if (not(any(vE5,9797,9898,99996))) sumE5_E12_min=sumE5_E12_min + (trunc(vE5/100)*60 + mod(vE5,100)).
if (not(any(vE6,9797,9898,99996))) sumE5_E12_min=sumE5_E12_min + (trunc(vE6/100)*60 + mod(vE6,100)).
if (not(any(vE8,9797,9898,99996))) sumE5_E12_min=sumE5_E12_min + (trunc(vE8/100)*60 + mod(vE8,100)).
if (not(any(vE9,9797,9898,99996))) sumE5_E12_min=sumE5_E12_min + (trunc(vE9/100)*60 + mod(vE9,100)).
if (not(any(vE11,9797,9898,99996))) sumE5_E12_min=sumE5_E12_min + (trunc(vE11/100)*60 + mod(vE11,100)).
if (not(any(vE12,9797,9898,99996))) sumE5_E12_min=sumE5_E12_min + (trunc(vE12/100)*60 + mod(vE12,100)).
compute sumE5_E12=sumE5_E12_min/60.

compute sumE5_E8_E11_min=0.
if (not(any(vE5,9797,9898,99996))) sumE5_E8_E11_min=sumE5_E8_E11_min + (trunc(vE5/100)*60 + mod(vE5,100)).
if (not(any(vE8,9797,9898,99996))) sumE5_E8_E11_min=sumE5_E8_E11_min + (trunc(vE8/100)*60 + mod(vE8,100)).
if (not(any(vE11,9797,9898,99996))) sumE5_E8_E11_min=sumE5_E8_E11_min + (trunc(vE11/100)*60 + mod(vE11,100)).
compute sumE5_E8_E11=sumE5_E8_E11_min/60.

compute sumE6_E9_E12_min=0.
if (not(any(vE6,9797,9898,99996))) sumE6_E9_E12_min=sumE6_E9_E12_min + (trunc(vE6/100)*60 + mod(vE6,100)).
if (not(any(vE9,9797,9898,99996))) sumE6_E9_E12_min=sumE6_E9_E12_min + (trunc(vE9/100)*60 + mod(vE9,100)).
if (not(any(vE12,9797,9898,99996))) sumE6_E9_E12_min=sumE6_E9_E12_min + (trunc(vE12/100)*60 + mod(vE12,100)).
compute sumE6_E9_E12=sumE6_E9_E12_min/60.

compute sumE5_E6_min=0.
if (not(any(vE5,9797,9898,99996))) sumE5_E6_min=sumE5_E6_min + (trunc(vE5/100)*60 + mod(vE5,100)).
if (not(any(vE6,9797,9898,99996))) sumE5_E6_min=sumE5_E6_min + (trunc(vE6/100)*60 + mod(vE6,100)).
compute sumE5_E6=sumE5_E6_min/60.

compute sumE8_E9_min=0.
if (not(any(vE8,9797,9898,99996))) sumE8_E9_min=sumE8_E9_min + (trunc(vE8/100)*60 + mod(vE8,100)).
if (not(any(vE9,9797,9898,99996))) sumE8_E9_min=sumE8_E9_min + (trunc(vE9/100)*60 + mod(vE9,100)).
compute sumE8_E9=sumE8_E9_min/60.

compute sumE11_E12_min=0.
if (not(any(vE11,9797,9898,99996))) sumE11_E12_min=sumE11_E12_min + (trunc(vE11/100)*60 + mod(vE11,100)).
if (not(any(vE12,9797,9898,99996))) sumE11_E12_min=sumE11_E12_min + (trunc(vE12/100)*60 + mod(vE12,100)).
compute sumE11_E12=sumE11_E12_min/60.

* external check row 10: E5,E8,E11.
do if (sumE5_E8_E11>16).
compute m1709=concat(
  "vE5=",
  string(vE5,n5),
  ",vE8=",
  string(vE8,n5),
  ",vE11=",
  string(vE11,n5),
  ",sumE5_E12=",
  string(sumE5_E12,n8),
  ",sumE5_E8_E11=",
  string(sumE5_E8_E11,n8),
  ",vE6=",
  string(vE6,n5),
  ",vE9=",
  string(vE9,n5),
  ",vE12=",
  string(vE12,n5)
).
compute p1709="各項裝置(手機、平板及電腦)因工作與課業而上網的時間相加超過16小時,列出確認。".
compute s1709=2.
end if.
exec.

* external check row 11: E5,E8,E11.
do if (sumE6_E9_E12>16).
compute m1710=concat(
  "vE6=",
  string(vE6,n5),
  ",vE9=",
  string(vE9,n5),
  ",vE12=",
  string(vE12,n5),
  ",sumE5_E12=",
  string(sumE5_E12,n8),
  ",sumE6_E9_E12=",
  string(sumE6_E9_E12,n8),
  ",vE5=",
  string(vE5,n5),
  ",vE8=",
  string(vE8,n5),
  ",vE11=",
  string(vE11,n5)
).
compute p1710="各項裝置(手機、平板及電腦)非因工作與課業而上網的時間相加超過16小時,列出確認。".
compute s1710=2.
end if.
exec.

* external check row 12: E5,E6.
do if (sumE5_E6>16).
compute m1711=concat(
  "vE5=",
  string(vE5,n5),
  ",vE6=",
  string(vE6,n5),
  ",sumE5_E12=",
  string(sumE5_E12,n8),
  ",sumE5_E6=",
  string(sumE5_E6,n8),
  ",vE8=",
  string(vE8,n5),
  ",vE9=",
  string(vE9,n5),
  ",vE11=",
  string(vE11,n5),
  ",vE12=",
  string(vE12,n5)
).
compute p1711="vE5、vE6使用手機上網的時間相加超過16小時。".
compute s1711=2.
end if.
exec.

* external check row 13: E8,E9.
do if (sumE8_E9>16).
compute m1712=concat(
  "vE8=",
  string(vE8,n5),
  ",vE9=",
  string(vE9,n5),
  ",sumE5_E12=",
  string(sumE5_E12,n8),
  ",sumE8_E9=",
  string(sumE8_E9,n8),
  ",vE5=",
  string(vE5,n5),
  ",vE6=",
  string(vE6,n5),
  ",vE11=",
  string(vE11,n5),
  ",vE12=",
  string(vE12,n5)
).
compute p1712="vE8、vE9使用平板上網的時間相加超過16小時。".
compute s1712=2.
end if.
exec.

* external check row 14: E11,E12.
do if (sumE11_E12>16).
compute m1713=concat(
  "vE11=",
  string(vE11,n5),
  ",vE12=",
  string(vE12,n5),
  ",sumE5_E12=",
  string(sumE5_E12,n8),
  ",sumE11_E12=",
  string(sumE11_E12,n8),
  ",vE5=",
  string(vE5,n5),
  ",vE6=",
  string(vE6,n5),
  ",vE8=",
  string(vE8,n5),
  ",vE9=",
  string(vE9,n5)
).
compute p1713="vE11、vE12使用電腦上網的時間相加超過16小時。".
compute s1713=2.
end if.
exec.
