* Encoding: UTF-8.

* Generated survey check syntax.

* Sections are generated separately, then combined here in execution order.

* Encoding: UTF-8.

**NUMERIC CHECKS.

* SYNTAXWORK_BEGIN_NUMERIC.

*vZA=1,3 .
do if not range(vZA,1,3) | sys(vZA).
compute m101=concat("vZA=",string(vZA,f2)).
compute p101="vZA為不合理值或遺漏值".
end if.
Exec.

*vZA0=1,2 .
do if not range(vZA0,1,2) | sys(vZA0).
compute m102=concat("vZA0=",string(vZA0,f2)).
compute p102="vZA0為不合理值或遺漏值".
end if.
Exec.

*vZA0_1=1,2 .
do if not range(vZA0_1,1,2) | sys(vZA0_1).
compute m103=concat("vZA0_1=",string(vZA0_1,f2)).
compute p103="vZA0_1為不合理值或遺漏值".
end if.
Exec.

*vSF0=1 .
do if not range(vSF0,1,1) | sys(vSF0).
compute m104=concat("vSF0=",string(vSF0,f2)).
compute p104="vSF0為不合理值或遺漏值".
end if.
Exec.

*vA1=1,96 997,998 .
do if not range(vA1,1,96,997,998) | sys(vA1).
compute m105=concat("vA1=",string(vA1,f4)).
compute p105="vA1為不合理值或遺漏值".
end if.
Exec.

*vA2=1,12 97 997,998 .
do if not range(vA2,1,12,97,97,997,998) | sys(vA2).
compute m106=concat("vA2=",string(vA2,f2)).
compute p106="vA2為不合理值或遺漏值".
end if.
Exec.

*vA3=1,21 97,98 .
do if not range(vA3,1,21,97,98) | sys(vA3).
compute m107=concat("vA3=",string(vA3,f2)).
compute p107="vA3為不合理值或遺漏值".
end if.
Exec.

*vA4=1,2 97,98 .
do if not range(vA4,1,2,97,98) | sys(vA4).
compute m108=concat("vA4=",string(vA4,f2)).
compute p108="vA4為不合理值或遺漏值".
end if.
Exec.

*vA5city=1,29 .
do if not range(vA5city,1,29) | sys(vA5city).
compute m109=concat("vA5city=",string(vA5city,f2)).
compute p109="vA5city為不合理值或遺漏值".
end if.
Exec.

*vA5town=100,103,104,105,106,108,110,111,112,114,115,116,200,201,202,203,204,205,206,207,208,209,210,211,212,220,221,222,223,224,226,227,228,231,232,233,234,235,236,237,238,239,241,242,243,244,247,248,249,251,252,253,260,261,262,263,264,265,266,267,268,269,270,272,302,303,304,305,306,307,308,310,311,312,313,314,315,320,324,325,326,327,328,330,333,334,335,336,337,338,350,351,352,353,354,356,357,358,360,361,362,363,364,365,366,367,368,369,400,401,402,403,404,406,407,408,411,412,413,414,420,421,422,423,424,426,427,428,429,432,433,434,435,436,437,438,439,500,502,503,504,505,506,507,508,509,510,511,512,513,514,515,516,520,521,522,523,524,525,526,527,528,530,540,541,542,544,545,546,551,552,553,555,556,557,558,602,603,604,605,606,607,608,611,612,613,614,615,616,621,622,623,624,625,630,631,632,633,634,635,636,637,638,640,643,646,647,648,649,651,652,653,654,655,700,701,702,704,708,709,710,711,712,713,714,715,716,717,718,719,720,721,722,723,724,725,726,727,730,731,732,733,734,735,736,737,741,742,743,744,745,800,801,802,803,804,805,806,807,811,812,813,814,815,820,821,822,823,824,825,826,827,828,829,830,831,832,833,840,842,843,844,845,846,847,848,849,851,852,880,881,882,883,884,885,890,891,892,893,894,896,900,901,902,903,904,905,906,907,908,909,911,912,913,920,921,922,923,924,925,926,927,928,929,931,932,940,941,942,943,944,945,946,947,950,951,952,953,954,955,956,957,958,959,961,962,963,964,965,966,970,971,972,973,974,975,976,977,978,979,981,982,983,3001,3002,3003,6001,6002,9997,9998,9996 .
do if not range(vA5town,100,103,104,105,106,108,110,111,112,114,115,116,200,201,202,203,204,205,206,207,208,209,210,211,212,220,221,222,223,224,226,227,228,231,232,233,234,235,236,237,238,239,241,242,243,244,247,248,249,251,252,253,260,261,262,263,264,265,266,267,268,269,270,272,302,303,304,305,306,307,308,310,311,312,313,314,315,320,324,325,326,327,328,330,333,334,335,336,337,338,350,351,352,353,354,356,357,358,360,361,362,363,364,365,366,367,368,369,400,401,402,403,404,406,407,408,411,412,413,414,420,421,422,423,424,426,427,428,429,432,433,434,435,436,437,438,439,500,502,503,504,505,506,507,508,509,510,511,512,513,514,515,516,520,521,522,523,524,525,526,527,528,530,540,541,542,544,545,546,551,552,553,555,556,557,558,602,603,604,605,606,607,608,611,612,613,614,615,616,621,622,623,624,625,630,631,632,633,634,635,636,637,638,640,643,646,647,648,649,651,652,653,654,655,700,701,702,704,708,709,710,711,712,713,714,715,716,717,718,719,720,721,722,723,724,725,726,727,730,731,732,733,734,735,736,737,741,742,743,744,745,800,801,802,803,804,805,806,807,811,812,813,814,815,820,821,822,823,824,825,826,827,828,829,830,831,832,833,840,842,843,844,845,846,847,848,849,851,852,880,881,882,883,884,885,890,891,892,893,894,896,900,901,902,903,904,905,906,907,908,909,911,912,913,920,921,922,923,924,925,926,927,928,929,931,932,940,941,942,943,944,945,946,947,950,951,952,953,954,955,956,957,958,959,961,962,963,964,965,966,970,971,972,973,974,975,976,977,978,979,981,982,983,3001,3002,3003,6001,6002,9997,9998,9996) | sys(vA5town).
compute m110=concat("vA5town=",string(vA5town,f4)).
compute p110="vA5town為不合理值或遺漏值".
end if.
Exec.

*vA6=1,88 97,98 .
do if not range(vA6,1,88,97,98) | sys(vA6).
compute m111=concat("vA6=",string(vA6,f2)).
compute p111="vA6為不合理值或遺漏值".
end if.
Exec.

*vA7=1,88 97,98 .
do if not range(vA7,1,88,97,98) | sys(vA7).
compute m112=concat("vA7=",string(vA7,f2)).
compute p112="vA7為不合理值或遺漏值".
end if.
Exec.

*vA8=1,88 97,98 .
do if not range(vA8,1,88,97,98) | sys(vA8).
compute m113=concat("vA8=",string(vA8,f2)).
compute p113="vA8為不合理值或遺漏值".
end if.
Exec.

*vA9=1,88 97,98 .
do if not range(vA9,1,88,97,98) | sys(vA9).
compute m114=concat("vA9=",string(vA9,f2)).
compute p114="vA9為不合理值或遺漏值".
end if.
Exec.

*vO1_1=1,88 97,98 .
do if not range(vO1_1,1,88,97,98) | sys(vO1_1).
compute m115=concat("vO1_1=",string(vO1_1,f2)).
compute p115="vO1_1為不合理值或遺漏值".
end if.
Exec.

*vO1=1,88 97 98 .
do if not range(vO1,1,88,97,97,98,98) | sys(vO1).
compute m116=concat("vO1=",string(vO1,f2)).
compute p116="vO1為不合理值或遺漏值".
end if.
Exec.

*vO2=1,88 97 98 .
do if not range(vO2,1,88,97,97,98,98) | sys(vO2).
compute m117=concat("vO2=",string(vO2,f2)).
compute p117="vO2為不合理值或遺漏值".
end if.
Exec.

*vO3=1,88 97 98 .
do if not range(vO3,1,88,97,97,98,98) | sys(vO3).
compute m118=concat("vO3=",string(vO3,f2)).
compute p118="vO3為不合理值或遺漏值".
end if.
Exec.

*vO4=0,5000 9991 9997 9998 .
do if not range(vO4,0,5000,9991,9991,9997,9997,9998,9998) | sys(vO4).
compute m119=concat("vO4=",string(vO4,f5)).
compute p119="vO4為不合理值或遺漏值".
end if.
Exec.

*vD1=1,3 97,98 .
do if not range(vD1,1,3,97,98) | sys(vD1).
compute m120=concat("vD1=",string(vD1,f2)).
compute p120="vD1為不合理值或遺漏值".
end if.
Exec.

*vD2=0.5,7 95 97,98 .
do if not range(vD2,0.5,7,95,95,97,98) | sys(vD2).
compute m121=concat("vD2=",string(vD2,f4)).
compute p121="vD2為不合理值或遺漏值".
end if.
Exec.

*vD3=1,2359 9797 9898 .
do if not range(vD3,1,2359,9797,9797,9898,9898) | sys(vD3).
compute m122=concat("vD3=",string(vD3,f5)).
compute p122="vD3為不合理值或遺漏值".
end if.
Exec.

*vD4sD4=1,2 .
do if not range(vD4sD4,1,2) | sys(vD4sD4).
compute m123=concat("vD4sD4=",string(vD4sD4,f2)).
compute p123="vD4sD4為不合理值或遺漏值".
end if.
Exec.

*vD4sD5=1,2 .
do if not range(vD4sD5,1,2) | sys(vD4sD5).
compute m124=concat("vD4sD5=",string(vD4sD5,f2)).
compute p124="vD4sD5為不合理值或遺漏值".
end if.
Exec.

*vD4sD6=1,2 .
do if not range(vD4sD6,1,2) | sys(vD4sD6).
compute m125=concat("vD4sD6=",string(vD4sD6,f2)).
compute p125="vD4sD6為不合理值或遺漏值".
end if.
Exec.

*vD4sD7=1,2 .
do if not range(vD4sD7,1,2) | sys(vD4sD7).
compute m126=concat("vD4sD7=",string(vD4sD7,f2)).
compute p126="vD4sD7為不合理值或遺漏值".
end if.
Exec.

*vD4sD8=1,2 .
do if not range(vD4sD8,1,2) | sys(vD4sD8).
compute m127=concat("vD4sD8=",string(vD4sD8,f2)).
compute p127="vD4sD8為不合理值或遺漏值".
end if.
Exec.

*vK1m01=0,1 .
do if not range(vK1m01,0,1) | sys(vK1m01).
compute m128=concat("vK1m01=",string(vK1m01,f2)).
compute p128="vK1m01為不合理值或遺漏值".
end if.
Exec.

*vK1m02=0,1 .
do if not range(vK1m02,0,1) | sys(vK1m02).
compute m129=concat("vK1m02=",string(vK1m02,f2)).
compute p129="vK1m02為不合理值或遺漏值".
end if.
Exec.

*vK1m03=0,1 .
do if not range(vK1m03,0,1) | sys(vK1m03).
compute m130=concat("vK1m03=",string(vK1m03,f2)).
compute p130="vK1m03為不合理值或遺漏值".
end if.
Exec.

*vK1m04=0,1 .
do if not range(vK1m04,0,1) | sys(vK1m04).
compute m131=concat("vK1m04=",string(vK1m04,f2)).
compute p131="vK1m04為不合理值或遺漏值".
end if.
Exec.

*vK1m05=0,1 .
do if not range(vK1m05,0,1) | sys(vK1m05).
compute m132=concat("vK1m05=",string(vK1m05,f2)).
compute p132="vK1m05為不合理值或遺漏值".
end if.
Exec.

*vK1m06=0,1 .
do if not range(vK1m06,0,1) | sys(vK1m06).
compute m133=concat("vK1m06=",string(vK1m06,f2)).
compute p133="vK1m06為不合理值或遺漏值".
end if.
Exec.

*vK1m07=0,1 .
do if not range(vK1m07,0,1) | sys(vK1m07).
compute m134=concat("vK1m07=",string(vK1m07,f2)).
compute p134="vK1m07為不合理值或遺漏值".
end if.
Exec.

*vK1m08=0,1 .
do if not range(vK1m08,0,1) | sys(vK1m08).
compute m135=concat("vK1m08=",string(vK1m08,f2)).
compute p135="vK1m08為不合理值或遺漏值".
end if.
Exec.

*vK1m09=0,1 .
do if not range(vK1m09,0,1) | sys(vK1m09).
compute m136=concat("vK1m09=",string(vK1m09,f2)).
compute p136="vK1m09為不合理值或遺漏值".
end if.
Exec.

*vK1m10=0,1 96 .
do if not range(vK1m10,0,1,96,96) | sys(vK1m10).
compute m137=concat("vK1m10=",string(vK1m10,f2)).
compute p137="vK1m10為不合理值或遺漏值".
end if.
Exec.

*vK1m11=0,1 96 .
do if not range(vK1m11,0,1,96,96) | sys(vK1m11).
compute m138=concat("vK1m11=",string(vK1m11,f2)).
compute p138="vK1m11為不合理值或遺漏值".
end if.
Exec.

*vK1m12=0,1 96 .
do if not range(vK1m12,0,1,96,96) | sys(vK1m12).
compute m139=concat("vK1m12=",string(vK1m12,f2)).
compute p139="vK1m12為不合理值或遺漏值".
end if.
Exec.

*vK1m13=0,1 96 .
do if not range(vK1m13,0,1,96,96) | sys(vK1m13).
compute m140=concat("vK1m13=",string(vK1m13,f2)).
compute p140="vK1m13為不合理值或遺漏值".
end if.
Exec.

*vK1m88=0,1 96 .
do if not range(vK1m88,0,1,96,96) | sys(vK1m88).
compute m141=concat("vK1m88=",string(vK1m88,f2)).
compute p141="vK1m88為不合理值或遺漏值".
end if.
Exec.

*vK1m90=0,1 96 .
do if not range(vK1m90,0,1,96,96) | sys(vK1m90).
compute m142=concat("vK1m90=",string(vK1m90,f2)).
compute p142="vK1m90為不合理值或遺漏值".
end if.
Exec.

*vK2m01=0,1 .
do if not range(vK2m01,0,1) | sys(vK2m01).
compute m143=concat("vK2m01=",string(vK2m01,f2)).
compute p143="vK2m01為不合理值或遺漏值".
end if.
Exec.

*vK2m02=0,1 .
do if not range(vK2m02,0,1) | sys(vK2m02).
compute m144=concat("vK2m02=",string(vK2m02,f2)).
compute p144="vK2m02為不合理值或遺漏值".
end if.
Exec.

*vK2m03=0,1 .
do if not range(vK2m03,0,1) | sys(vK2m03).
compute m145=concat("vK2m03=",string(vK2m03,f2)).
compute p145="vK2m03為不合理值或遺漏值".
end if.
Exec.

*vK2m04=0,1 .
do if not range(vK2m04,0,1) | sys(vK2m04).
compute m146=concat("vK2m04=",string(vK2m04,f2)).
compute p146="vK2m04為不合理值或遺漏值".
end if.
Exec.

*vK2m05=0,1 .
do if not range(vK2m05,0,1) | sys(vK2m05).
compute m147=concat("vK2m05=",string(vK2m05,f2)).
compute p147="vK2m05為不合理值或遺漏值".
end if.
Exec.

*vK2m06=0,1 .
do if not range(vK2m06,0,1) | sys(vK2m06).
compute m148=concat("vK2m06=",string(vK2m06,f2)).
compute p148="vK2m06為不合理值或遺漏值".
end if.
Exec.

*vK2m07=0,1 .
do if not range(vK2m07,0,1) | sys(vK2m07).
compute m149=concat("vK2m07=",string(vK2m07,f2)).
compute p149="vK2m07為不合理值或遺漏值".
end if.
Exec.

*vK2m08=0,1 .
do if not range(vK2m08,0,1) | sys(vK2m08).
compute m150=concat("vK2m08=",string(vK2m08,f2)).
compute p150="vK2m08為不合理值或遺漏值".
end if.
Exec.

*vK2m09=0,1 .
do if not range(vK2m09,0,1) | sys(vK2m09).
compute m151=concat("vK2m09=",string(vK2m09,f2)).
compute p151="vK2m09為不合理值或遺漏值".
end if.
Exec.

*vK2m11=0,1 96 .
do if not range(vK2m11,0,1,96,96) | sys(vK2m11).
compute m152=concat("vK2m11=",string(vK2m11,f2)).
compute p152="vK2m11為不合理值或遺漏值".
end if.
Exec.

*vK2m12=0,1 96 .
do if not range(vK2m12,0,1,96,96) | sys(vK2m12).
compute m153=concat("vK2m12=",string(vK2m12,f2)).
compute p153="vK2m12為不合理值或遺漏值".
end if.
Exec.

*vK2m13=0,1 96 .
do if not range(vK2m13,0,1,96,96) | sys(vK2m13).
compute m154=concat("vK2m13=",string(vK2m13,f2)).
compute p154="vK2m13為不合理值或遺漏值".
end if.
Exec.

*vK2m88=0,1 96 .
do if not range(vK2m88,0,1,96,96) | sys(vK2m88).
compute m155=concat("vK2m88=",string(vK2m88,f2)).
compute p155="vK2m88為不合理值或遺漏值".
end if.
Exec.

*vK2m90=0,1 96 .
do if not range(vK2m90,0,1,96,96) | sys(vK2m90).
compute m156=concat("vK2m90=",string(vK2m90,f2)).
compute p156="vK2m90為不合理值或遺漏值".
end if.
Exec.

*vE17=1,88 97,98 .
do if not range(vE17,1,88,97,98) | sys(vE17).
compute m157=concat("vE17=",string(vE17,f2)).
compute p157="vE17為不合理值或遺漏值".
end if.
Exec.

*vKLI1=0.5,7 95 97,98 .
do if not range(vKLI1,0.5,7,95,95,97,98) | sys(vKLI1).
compute m158=concat("vKLI1=",string(vKLI1,f4)).
compute p158="vKLI1為不合理值或遺漏值".
end if.
Exec.

*vKLI2=1,2359 9797 9898 .
do if not range(vKLI2,1,2359,9797,9797,9898,9898) | sys(vKLI2).
compute m159=concat("vKLI2=",string(vKLI2,f5)).
compute p159="vKLI2為不合理值或遺漏值".
end if.
Exec.

*vKFB1=0.5,7 95 97,98 .
do if not range(vKFB1,0.5,7,95,95,97,98) | sys(vKFB1).
compute m160=concat("vKFB1=",string(vKFB1,f4)).
compute p160="vKFB1為不合理值或遺漏值".
end if.
Exec.

*vKFB2=1,2359 9797 9898 .
do if not range(vKFB2,1,2359,9797,9797,9898,9898) | sys(vKFB2).
compute m161=concat("vKFB2=",string(vKFB2,f5)).
compute p161="vKFB2為不合理值或遺漏值".
end if.
Exec.

*vKFB3m01=0,1 .
do if not range(vKFB3m01,0,1) | sys(vKFB3m01).
compute m162=concat("vKFB3m01=",string(vKFB3m01,f2)).
compute p162="vKFB3m01為不合理值或遺漏值".
end if.
Exec.

*vKFB3m02=0,1 .
do if not range(vKFB3m02,0,1) | sys(vKFB3m02).
compute m163=concat("vKFB3m02=",string(vKFB3m02,f2)).
compute p163="vKFB3m02為不合理值或遺漏值".
end if.
Exec.

*vKFB3m03=0,1 .
do if not range(vKFB3m03,0,1) | sys(vKFB3m03).
compute m164=concat("vKFB3m03=",string(vKFB3m03,f2)).
compute p164="vKFB3m03為不合理值或遺漏值".
end if.
Exec.

*vKFB3m04=0,1 .
do if not range(vKFB3m04,0,1) | sys(vKFB3m04).
compute m165=concat("vKFB3m04=",string(vKFB3m04,f2)).
compute p165="vKFB3m04為不合理值或遺漏值".
end if.
Exec.

*vKFB3m05=0,1 .
do if not range(vKFB3m05,0,1) | sys(vKFB3m05).
compute m166=concat("vKFB3m05=",string(vKFB3m05,f2)).
compute p166="vKFB3m05為不合理值或遺漏值".
end if.
Exec.

*vKFB3m06=0,1 .
do if not range(vKFB3m06,0,1) | sys(vKFB3m06).
compute m167=concat("vKFB3m06=",string(vKFB3m06,f2)).
compute p167="vKFB3m06為不合理值或遺漏值".
end if.
Exec.

*vKFB3m07=0,1 .
do if not range(vKFB3m07,0,1) | sys(vKFB3m07).
compute m168=concat("vKFB3m07=",string(vKFB3m07,f2)).
compute p168="vKFB3m07為不合理值或遺漏值".
end if.
Exec.

*vKFB3m08=0,1 .
do if not range(vKFB3m08,0,1) | sys(vKFB3m08).
compute m169=concat("vKFB3m08=",string(vKFB3m08,f2)).
compute p169="vKFB3m08為不合理值或遺漏值".
end if.
Exec.

*vKFB3m09=0,1 .
do if not range(vKFB3m09,0,1) | sys(vKFB3m09).
compute m170=concat("vKFB3m09=",string(vKFB3m09,f2)).
compute p170="vKFB3m09為不合理值或遺漏值".
end if.
Exec.

*vKFB3m10=0,1 96 .
do if not range(vKFB3m10,0,1,96,96) | sys(vKFB3m10).
compute m171=concat("vKFB3m10=",string(vKFB3m10,f2)).
compute p171="vKFB3m10為不合理值或遺漏值".
end if.
Exec.

*vKFB3m11=0,1 96 .
do if not range(vKFB3m11,0,1,96,96) | sys(vKFB3m11).
compute m172=concat("vKFB3m11=",string(vKFB3m11,f2)).
compute p172="vKFB3m11為不合理值或遺漏值".
end if.
Exec.

*vKFB3m12=0,1 96 .
do if not range(vKFB3m12,0,1,96,96) | sys(vKFB3m12).
compute m173=concat("vKFB3m12=",string(vKFB3m12,f2)).
compute p173="vKFB3m12為不合理值或遺漏值".
end if.
Exec.

*vKFB3m13=0,1 96 .
do if not range(vKFB3m13,0,1,96,96) | sys(vKFB3m13).
compute m174=concat("vKFB3m13=",string(vKFB3m13,f2)).
compute p174="vKFB3m13為不合理值或遺漏值".
end if.
Exec.

*vKFB3m14=0,1 96 .
do if not range(vKFB3m14,0,1,96,96) | sys(vKFB3m14).
compute m175=concat("vKFB3m14=",string(vKFB3m14,f2)).
compute p175="vKFB3m14為不合理值或遺漏值".
end if.
Exec.

*vKFB3m15=0,1 96 .
do if not range(vKFB3m15,0,1,96,96) | sys(vKFB3m15).
compute m176=concat("vKFB3m15=",string(vKFB3m15,f2)).
compute p176="vKFB3m15為不合理值或遺漏值".
end if.
Exec.

*vKFB3m16=0,1 96 .
do if not range(vKFB3m16,0,1,96,96) | sys(vKFB3m16).
compute m177=concat("vKFB3m16=",string(vKFB3m16,f2)).
compute p177="vKFB3m16為不合理值或遺漏值".
end if.
Exec.

*vKFB3m17=0,1 96 .
do if not range(vKFB3m17,0,1,96,96) | sys(vKFB3m17).
compute m178=concat("vKFB3m17=",string(vKFB3m17,f2)).
compute p178="vKFB3m17為不合理值或遺漏值".
end if.
Exec.

*vKFB3m88=0,1 96 .
do if not range(vKFB3m88,0,1,96,96) | sys(vKFB3m88).
compute m179=concat("vKFB3m88=",string(vKFB3m88,f2)).
compute p179="vKFB3m88為不合理值或遺漏值".
end if.
Exec.

*vKFB4m01=0,1 .
do if not range(vKFB4m01,0,1) | sys(vKFB4m01).
compute m180=concat("vKFB4m01=",string(vKFB4m01,f2)).
compute p180="vKFB4m01為不合理值或遺漏值".
end if.
Exec.

*vKFB4m02=0,1 .
do if not range(vKFB4m02,0,1) | sys(vKFB4m02).
compute m181=concat("vKFB4m02=",string(vKFB4m02,f2)).
compute p181="vKFB4m02為不合理值或遺漏值".
end if.
Exec.

*vKFB4m03=0,1 .
do if not range(vKFB4m03,0,1) | sys(vKFB4m03).
compute m182=concat("vKFB4m03=",string(vKFB4m03,f2)).
compute p182="vKFB4m03為不合理值或遺漏值".
end if.
Exec.

*vKFB4m04=0,1 .
do if not range(vKFB4m04,0,1) | sys(vKFB4m04).
compute m183=concat("vKFB4m04=",string(vKFB4m04,f2)).
compute p183="vKFB4m04為不合理值或遺漏值".
end if.
Exec.

*vKFB4m05=0,1 .
do if not range(vKFB4m05,0,1) | sys(vKFB4m05).
compute m184=concat("vKFB4m05=",string(vKFB4m05,f2)).
compute p184="vKFB4m05為不合理值或遺漏值".
end if.
Exec.

*vKFB4m06=0,1 .
do if not range(vKFB4m06,0,1) | sys(vKFB4m06).
compute m185=concat("vKFB4m06=",string(vKFB4m06,f2)).
compute p185="vKFB4m06為不合理值或遺漏值".
end if.
Exec.

*vKFB4m07=0,1 .
do if not range(vKFB4m07,0,1) | sys(vKFB4m07).
compute m186=concat("vKFB4m07=",string(vKFB4m07,f2)).
compute p186="vKFB4m07為不合理值或遺漏值".
end if.
Exec.

*vKFB4m08=0,1 .
do if not range(vKFB4m08,0,1) | sys(vKFB4m08).
compute m187=concat("vKFB4m08=",string(vKFB4m08,f2)).
compute p187="vKFB4m08為不合理值或遺漏值".
end if.
Exec.

*vKFB4m09=0,1 .
do if not range(vKFB4m09,0,1) | sys(vKFB4m09).
compute m188=concat("vKFB4m09=",string(vKFB4m09,f2)).
compute p188="vKFB4m09為不合理值或遺漏值".
end if.
Exec.

*vKFB4m10=0,1 96 .
do if not range(vKFB4m10,0,1,96,96) | sys(vKFB4m10).
compute m189=concat("vKFB4m10=",string(vKFB4m10,f2)).
compute p189="vKFB4m10為不合理值或遺漏值".
end if.
Exec.

*vKFB4m11=0,1 96 .
do if not range(vKFB4m11,0,1,96,96) | sys(vKFB4m11).
compute m190=concat("vKFB4m11=",string(vKFB4m11,f2)).
compute p190="vKFB4m11為不合理值或遺漏值".
end if.
Exec.

*vKFB4m12=0,1 96 .
do if not range(vKFB4m12,0,1,96,96) | sys(vKFB4m12).
compute m191=concat("vKFB4m12=",string(vKFB4m12,f2)).
compute p191="vKFB4m12為不合理值或遺漏值".
end if.
Exec.

*vKFB4m13=0,1 96 .
do if not range(vKFB4m13,0,1,96,96) | sys(vKFB4m13).
compute m192=concat("vKFB4m13=",string(vKFB4m13,f2)).
compute p192="vKFB4m13為不合理值或遺漏值".
end if.
Exec.

*vKFB4m14=0,1 96 .
do if not range(vKFB4m14,0,1,96,96) | sys(vKFB4m14).
compute m193=concat("vKFB4m14=",string(vKFB4m14,f2)).
compute p193="vKFB4m14為不合理值或遺漏值".
end if.
Exec.

*vKFB4m15=0,1 96 .
do if not range(vKFB4m15,0,1,96,96) | sys(vKFB4m15).
compute m194=concat("vKFB4m15=",string(vKFB4m15,f2)).
compute p194="vKFB4m15為不合理值或遺漏值".
end if.
Exec.

*vKFB4m16=0,1 96 .
do if not range(vKFB4m16,0,1,96,96) | sys(vKFB4m16).
compute m195=concat("vKFB4m16=",string(vKFB4m16,f2)).
compute p195="vKFB4m16為不合理值或遺漏值".
end if.
Exec.

*vKFB4m17=0,1 96 .
do if not range(vKFB4m17,0,1,96,96) | sys(vKFB4m17).
compute m196=concat("vKFB4m17=",string(vKFB4m17,f2)).
compute p196="vKFB4m17為不合理值或遺漏值".
end if.
Exec.

*vKFB4m18=0,1 96 .
do if not range(vKFB4m18,0,1,96,96) | sys(vKFB4m18).
compute m197=concat("vKFB4m18=",string(vKFB4m18,f2)).
compute p197="vKFB4m18為不合理值或遺漏值".
end if.
Exec.

*vKFB4m88=0,1 96 .
do if not range(vKFB4m88,0,1,96,96) | sys(vKFB4m88).
compute m198=concat("vKFB4m88=",string(vKFB4m88,f2)).
compute p198="vKFB4m88為不合理值或遺漏值".
end if.
Exec.

*vKIG1=0.5,7 95 97,98 .
do if not range(vKIG1,0.5,7,95,95,97,98) | sys(vKIG1).
compute m199=concat("vKIG1=",string(vKIG1,f4)).
compute p199="vKIG1為不合理值或遺漏值".
end if.
Exec.

*vKIG2=1,2359 9797 9898 .
do if not range(vKIG2,1,2359,9797,9797,9898,9898) | sys(vKIG2).
compute m200=concat("vKIG2=",string(vKIG2,f5)).
compute p200="vKIG2為不合理值或遺漏值".
end if.
Exec.

*vKIG3m01=0,1 .
do if not range(vKIG3m01,0,1) | sys(vKIG3m01).
compute m201=concat("vKIG3m01=",string(vKIG3m01,f2)).
compute p201="vKIG3m01為不合理值或遺漏值".
end if.
Exec.

*vKIG3m02=0,1 .
do if not range(vKIG3m02,0,1) | sys(vKIG3m02).
compute m202=concat("vKIG3m02=",string(vKIG3m02,f2)).
compute p202="vKIG3m02為不合理值或遺漏值".
end if.
Exec.

*vKIG3m03=0,1 .
do if not range(vKIG3m03,0,1) | sys(vKIG3m03).
compute m203=concat("vKIG3m03=",string(vKIG3m03,f2)).
compute p203="vKIG3m03為不合理值或遺漏值".
end if.
Exec.

*vKIG3m04=0,1 .
do if not range(vKIG3m04,0,1) | sys(vKIG3m04).
compute m204=concat("vKIG3m04=",string(vKIG3m04,f2)).
compute p204="vKIG3m04為不合理值或遺漏值".
end if.
Exec.

*vKIG3m05=0,1 .
do if not range(vKIG3m05,0,1) | sys(vKIG3m05).
compute m205=concat("vKIG3m05=",string(vKIG3m05,f2)).
compute p205="vKIG3m05為不合理值或遺漏值".
end if.
Exec.

*vKIG3m06=0,1 .
do if not range(vKIG3m06,0,1) | sys(vKIG3m06).
compute m206=concat("vKIG3m06=",string(vKIG3m06,f2)).
compute p206="vKIG3m06為不合理值或遺漏值".
end if.
Exec.

*vKIG3m07=0,1 .
do if not range(vKIG3m07,0,1) | sys(vKIG3m07).
compute m207=concat("vKIG3m07=",string(vKIG3m07,f2)).
compute p207="vKIG3m07為不合理值或遺漏值".
end if.
Exec.

*vKIG3m08=0,1 .
do if not range(vKIG3m08,0,1) | sys(vKIG3m08).
compute m208=concat("vKIG3m08=",string(vKIG3m08,f2)).
compute p208="vKIG3m08為不合理值或遺漏值".
end if.
Exec.

*vKIG3m09=0,1 .
do if not range(vKIG3m09,0,1) | sys(vKIG3m09).
compute m209=concat("vKIG3m09=",string(vKIG3m09,f2)).
compute p209="vKIG3m09為不合理值或遺漏值".
end if.
Exec.

*vKIG3m10=0,1 96 .
do if not range(vKIG3m10,0,1,96,96) | sys(vKIG3m10).
compute m210=concat("vKIG3m10=",string(vKIG3m10,f2)).
compute p210="vKIG3m10為不合理值或遺漏值".
end if.
Exec.

*vKIG3m11=0,1 96 .
do if not range(vKIG3m11,0,1,96,96) | sys(vKIG3m11).
compute m211=concat("vKIG3m11=",string(vKIG3m11,f2)).
compute p211="vKIG3m11為不合理值或遺漏值".
end if.
Exec.

*vKIG3m12=0,1 96 .
do if not range(vKIG3m12,0,1,96,96) | sys(vKIG3m12).
compute m212=concat("vKIG3m12=",string(vKIG3m12,f2)).
compute p212="vKIG3m12為不合理值或遺漏值".
end if.
Exec.

*vKIG3m13=0,1 96 .
do if not range(vKIG3m13,0,1,96,96) | sys(vKIG3m13).
compute m213=concat("vKIG3m13=",string(vKIG3m13,f2)).
compute p213="vKIG3m13為不合理值或遺漏值".
end if.
Exec.

*vKIG3m14=0,1 96 .
do if not range(vKIG3m14,0,1,96,96) | sys(vKIG3m14).
compute m214=concat("vKIG3m14=",string(vKIG3m14,f2)).
compute p214="vKIG3m14為不合理值或遺漏值".
end if.
Exec.

*vKIG3m15=0,1 96 .
do if not range(vKIG3m15,0,1,96,96) | sys(vKIG3m15).
compute m215=concat("vKIG3m15=",string(vKIG3m15,f2)).
compute p215="vKIG3m15為不合理值或遺漏值".
end if.
Exec.

*vKIG3m16=0,1 96 .
do if not range(vKIG3m16,0,1,96,96) | sys(vKIG3m16).
compute m216=concat("vKIG3m16=",string(vKIG3m16,f2)).
compute p216="vKIG3m16為不合理值或遺漏值".
end if.
Exec.

*vKIG3m17=0,1 96 .
do if not range(vKIG3m17,0,1,96,96) | sys(vKIG3m17).
compute m217=concat("vKIG3m17=",string(vKIG3m17,f2)).
compute p217="vKIG3m17為不合理值或遺漏值".
end if.
Exec.

*vKIG3m88=0,1 96 .
do if not range(vKIG3m88,0,1,96,96) | sys(vKIG3m88).
compute m218=concat("vKIG3m88=",string(vKIG3m88,f2)).
compute p218="vKIG3m88為不合理值或遺漏值".
end if.
Exec.

*vKIG4m01=0,1 .
do if not range(vKIG4m01,0,1) | sys(vKIG4m01).
compute m219=concat("vKIG4m01=",string(vKIG4m01,f2)).
compute p219="vKIG4m01為不合理值或遺漏值".
end if.
Exec.

*vKIG4m02=0,1 .
do if not range(vKIG4m02,0,1) | sys(vKIG4m02).
compute m220=concat("vKIG4m02=",string(vKIG4m02,f2)).
compute p220="vKIG4m02為不合理值或遺漏值".
end if.
Exec.

*vKIG4m03=0,1 .
do if not range(vKIG4m03,0,1) | sys(vKIG4m03).
compute m221=concat("vKIG4m03=",string(vKIG4m03,f2)).
compute p221="vKIG4m03為不合理值或遺漏值".
end if.
Exec.

*vKIG4m04=0,1 .
do if not range(vKIG4m04,0,1) | sys(vKIG4m04).
compute m222=concat("vKIG4m04=",string(vKIG4m04,f2)).
compute p222="vKIG4m04為不合理值或遺漏值".
end if.
Exec.

*vKIG4m05=0,1 .
do if not range(vKIG4m05,0,1) | sys(vKIG4m05).
compute m223=concat("vKIG4m05=",string(vKIG4m05,f2)).
compute p223="vKIG4m05為不合理值或遺漏值".
end if.
Exec.

*vKIG4m06=0,1 .
do if not range(vKIG4m06,0,1) | sys(vKIG4m06).
compute m224=concat("vKIG4m06=",string(vKIG4m06,f2)).
compute p224="vKIG4m06為不合理值或遺漏值".
end if.
Exec.

*vKIG4m07=0,1 .
do if not range(vKIG4m07,0,1) | sys(vKIG4m07).
compute m225=concat("vKIG4m07=",string(vKIG4m07,f2)).
compute p225="vKIG4m07為不合理值或遺漏值".
end if.
Exec.

*vKIG4m08=0,1 .
do if not range(vKIG4m08,0,1) | sys(vKIG4m08).
compute m226=concat("vKIG4m08=",string(vKIG4m08,f2)).
compute p226="vKIG4m08為不合理值或遺漏值".
end if.
Exec.

*vKIG4m09=0,1 .
do if not range(vKIG4m09,0,1) | sys(vKIG4m09).
compute m227=concat("vKIG4m09=",string(vKIG4m09,f2)).
compute p227="vKIG4m09為不合理值或遺漏值".
end if.
Exec.

*vKIG4m10=0,1 96 .
do if not range(vKIG4m10,0,1,96,96) | sys(vKIG4m10).
compute m228=concat("vKIG4m10=",string(vKIG4m10,f2)).
compute p228="vKIG4m10為不合理值或遺漏值".
end if.
Exec.

*vKIG4m11=0,1 96 .
do if not range(vKIG4m11,0,1,96,96) | sys(vKIG4m11).
compute m229=concat("vKIG4m11=",string(vKIG4m11,f2)).
compute p229="vKIG4m11為不合理值或遺漏值".
end if.
Exec.

*vKIG4m12=0,1 96 .
do if not range(vKIG4m12,0,1,96,96) | sys(vKIG4m12).
compute m230=concat("vKIG4m12=",string(vKIG4m12,f2)).
compute p230="vKIG4m12為不合理值或遺漏值".
end if.
Exec.

*vKIG4m13=0,1 96 .
do if not range(vKIG4m13,0,1,96,96) | sys(vKIG4m13).
compute m231=concat("vKIG4m13=",string(vKIG4m13,f2)).
compute p231="vKIG4m13為不合理值或遺漏值".
end if.
Exec.

*vKIG4m14=0,1 96 .
do if not range(vKIG4m14,0,1,96,96) | sys(vKIG4m14).
compute m232=concat("vKIG4m14=",string(vKIG4m14,f2)).
compute p232="vKIG4m14為不合理值或遺漏值".
end if.
Exec.

*vKIG4m88=0,1 96 .
do if not range(vKIG4m88,0,1,96,96) | sys(vKIG4m88).
compute m233=concat("vKIG4m88=",string(vKIG4m88,f2)).
compute p233="vKIG4m88為不合理值或遺漏值".
end if.
Exec.

*vKTT1=0.5,7 95 97,98 .
do if not range(vKTT1,0.5,7,95,95,97,98) | sys(vKTT1).
compute m234=concat("vKTT1=",string(vKTT1,f4)).
compute p234="vKTT1為不合理值或遺漏值".
end if.
Exec.

*vKTT2=1,2359 9797 9898 .
do if not range(vKTT2,1,2359,9797,9797,9898,9898) | sys(vKTT2).
compute m235=concat("vKTT2=",string(vKTT2,f5)).
compute p235="vKTT2為不合理值或遺漏值".
end if.
Exec.

*vKTT3m01=0,1 .
do if not range(vKTT3m01,0,1) | sys(vKTT3m01).
compute m236=concat("vKTT3m01=",string(vKTT3m01,f2)).
compute p236="vKTT3m01為不合理值或遺漏值".
end if.
Exec.

*vKTT3m02=0,1 .
do if not range(vKTT3m02,0,1) | sys(vKTT3m02).
compute m237=concat("vKTT3m02=",string(vKTT3m02,f2)).
compute p237="vKTT3m02為不合理值或遺漏值".
end if.
Exec.

*vKTT3m03=0,1 .
do if not range(vKTT3m03,0,1) | sys(vKTT3m03).
compute m238=concat("vKTT3m03=",string(vKTT3m03,f2)).
compute p238="vKTT3m03為不合理值或遺漏值".
end if.
Exec.

*vKTT3m04=0,1 .
do if not range(vKTT3m04,0,1) | sys(vKTT3m04).
compute m239=concat("vKTT3m04=",string(vKTT3m04,f2)).
compute p239="vKTT3m04為不合理值或遺漏值".
end if.
Exec.

*vKTT3m05=0,1 .
do if not range(vKTT3m05,0,1) | sys(vKTT3m05).
compute m240=concat("vKTT3m05=",string(vKTT3m05,f2)).
compute p240="vKTT3m05為不合理值或遺漏值".
end if.
Exec.

*vKTT3m06=0,1 .
do if not range(vKTT3m06,0,1) | sys(vKTT3m06).
compute m241=concat("vKTT3m06=",string(vKTT3m06,f2)).
compute p241="vKTT3m06為不合理值或遺漏值".
end if.
Exec.

*vKTT3m07=0,1 .
do if not range(vKTT3m07,0,1) | sys(vKTT3m07).
compute m242=concat("vKTT3m07=",string(vKTT3m07,f2)).
compute p242="vKTT3m07為不合理值或遺漏值".
end if.
Exec.

*vKTT3m08=0,1 .
do if not range(vKTT3m08,0,1) | sys(vKTT3m08).
compute m243=concat("vKTT3m08=",string(vKTT3m08,f2)).
compute p243="vKTT3m08為不合理值或遺漏值".
end if.
Exec.

*vKTT3m09=0,1 .
do if not range(vKTT3m09,0,1) | sys(vKTT3m09).
compute m244=concat("vKTT3m09=",string(vKTT3m09,f2)).
compute p244="vKTT3m09為不合理值或遺漏值".
end if.
Exec.

*vKTT3m10=0,1 96 .
do if not range(vKTT3m10,0,1,96,96) | sys(vKTT3m10).
compute m245=concat("vKTT3m10=",string(vKTT3m10,f2)).
compute p245="vKTT3m10為不合理值或遺漏值".
end if.
Exec.

*vKTT3m11=0,1 96 .
do if not range(vKTT3m11,0,1,96,96) | sys(vKTT3m11).
compute m246=concat("vKTT3m11=",string(vKTT3m11,f2)).
compute p246="vKTT3m11為不合理值或遺漏值".
end if.
Exec.

*vKTT3m12=0,1 96 .
do if not range(vKTT3m12,0,1,96,96) | sys(vKTT3m12).
compute m247=concat("vKTT3m12=",string(vKTT3m12,f2)).
compute p247="vKTT3m12為不合理值或遺漏值".
end if.
Exec.

*vKTT3m13=0,1 96 .
do if not range(vKTT3m13,0,1,96,96) | sys(vKTT3m13).
compute m248=concat("vKTT3m13=",string(vKTT3m13,f2)).
compute p248="vKTT3m13為不合理值或遺漏值".
end if.
Exec.

*vKTT3m14=0,1 96 .
do if not range(vKTT3m14,0,1,96,96) | sys(vKTT3m14).
compute m249=concat("vKTT3m14=",string(vKTT3m14,f2)).
compute p249="vKTT3m14為不合理值或遺漏值".
end if.
Exec.

*vKTT3m15=0,1 96 .
do if not range(vKTT3m15,0,1,96,96) | sys(vKTT3m15).
compute m250=concat("vKTT3m15=",string(vKTT3m15,f2)).
compute p250="vKTT3m15為不合理值或遺漏值".
end if.
Exec.

*vKTT3m16=0,1 96 .
do if not range(vKTT3m16,0,1,96,96) | sys(vKTT3m16).
compute m251=concat("vKTT3m16=",string(vKTT3m16,f2)).
compute p251="vKTT3m16為不合理值或遺漏值".
end if.
Exec.

*vKTT3m88=0,1 96 .
do if not range(vKTT3m88,0,1,96,96) | sys(vKTT3m88).
compute m252=concat("vKTT3m88=",string(vKTT3m88,f2)).
compute p252="vKTT3m88為不合理值或遺漏值".
end if.
Exec.

*vKTT4m01=0,1 .
do if not range(vKTT4m01,0,1) | sys(vKTT4m01).
compute m253=concat("vKTT4m01=",string(vKTT4m01,f2)).
compute p253="vKTT4m01為不合理值或遺漏值".
end if.
Exec.

*vKTT4m02=0,1 .
do if not range(vKTT4m02,0,1) | sys(vKTT4m02).
compute m254=concat("vKTT4m02=",string(vKTT4m02,f2)).
compute p254="vKTT4m02為不合理值或遺漏值".
end if.
Exec.

*vKTT4m03=0,1 .
do if not range(vKTT4m03,0,1) | sys(vKTT4m03).
compute m255=concat("vKTT4m03=",string(vKTT4m03,f2)).
compute p255="vKTT4m03為不合理值或遺漏值".
end if.
Exec.

*vKTT4m04=0,1 .
do if not range(vKTT4m04,0,1) | sys(vKTT4m04).
compute m256=concat("vKTT4m04=",string(vKTT4m04,f2)).
compute p256="vKTT4m04為不合理值或遺漏值".
end if.
Exec.

*vKTT4m05=0,1 .
do if not range(vKTT4m05,0,1) | sys(vKTT4m05).
compute m257=concat("vKTT4m05=",string(vKTT4m05,f2)).
compute p257="vKTT4m05為不合理值或遺漏值".
end if.
Exec.

*vKTT4m06=0,1 .
do if not range(vKTT4m06,0,1) | sys(vKTT4m06).
compute m258=concat("vKTT4m06=",string(vKTT4m06,f2)).
compute p258="vKTT4m06為不合理值或遺漏值".
end if.
Exec.

*vKTT4m07=0,1 .
do if not range(vKTT4m07,0,1) | sys(vKTT4m07).
compute m259=concat("vKTT4m07=",string(vKTT4m07,f2)).
compute p259="vKTT4m07為不合理值或遺漏值".
end if.
Exec.

*vKTT4m08=0,1 .
do if not range(vKTT4m08,0,1) | sys(vKTT4m08).
compute m260=concat("vKTT4m08=",string(vKTT4m08,f2)).
compute p260="vKTT4m08為不合理值或遺漏值".
end if.
Exec.

*vKTT4m09=0,1 .
do if not range(vKTT4m09,0,1) | sys(vKTT4m09).
compute m261=concat("vKTT4m09=",string(vKTT4m09,f2)).
compute p261="vKTT4m09為不合理值或遺漏值".
end if.
Exec.

*vKTT4m10=0,1 96 .
do if not range(vKTT4m10,0,1,96,96) | sys(vKTT4m10).
compute m262=concat("vKTT4m10=",string(vKTT4m10,f2)).
compute p262="vKTT4m10為不合理值或遺漏值".
end if.
Exec.

*vKTT4m11=0,1 96 .
do if not range(vKTT4m11,0,1,96,96) | sys(vKTT4m11).
compute m263=concat("vKTT4m11=",string(vKTT4m11,f2)).
compute p263="vKTT4m11為不合理值或遺漏值".
end if.
Exec.

*vKTT4m12=0,1 96 .
do if not range(vKTT4m12,0,1,96,96) | sys(vKTT4m12).
compute m264=concat("vKTT4m12=",string(vKTT4m12,f2)).
compute p264="vKTT4m12為不合理值或遺漏值".
end if.
Exec.

*vKTT4m13=0,1 96 .
do if not range(vKTT4m13,0,1,96,96) | sys(vKTT4m13).
compute m265=concat("vKTT4m13=",string(vKTT4m13,f2)).
compute p265="vKTT4m13為不合理值或遺漏值".
end if.
Exec.

*vKTT4m14=0,1 96 .
do if not range(vKTT4m14,0,1,96,96) | sys(vKTT4m14).
compute m266=concat("vKTT4m14=",string(vKTT4m14,f2)).
compute p266="vKTT4m14為不合理值或遺漏值".
end if.
Exec.

*vKTT4m88=0,1 96 .
do if not range(vKTT4m88,0,1,96,96) | sys(vKTT4m88).
compute m267=concat("vKTT4m88=",string(vKTT4m88,f2)).
compute p267="vKTT4m88為不合理值或遺漏值".
end if.
Exec.

*vKTT5m01=0,1 .
do if not range(vKTT5m01,0,1) | sys(vKTT5m01).
compute m268=concat("vKTT5m01=",string(vKTT5m01,f2)).
compute p268="vKTT5m01為不合理值或遺漏值".
end if.
Exec.

*vKTT5m02=0,1 .
do if not range(vKTT5m02,0,1) | sys(vKTT5m02).
compute m269=concat("vKTT5m02=",string(vKTT5m02,f2)).
compute p269="vKTT5m02為不合理值或遺漏值".
end if.
Exec.

*vKTT5m03=0,1 .
do if not range(vKTT5m03,0,1) | sys(vKTT5m03).
compute m270=concat("vKTT5m03=",string(vKTT5m03,f2)).
compute p270="vKTT5m03為不合理值或遺漏值".
end if.
Exec.

*vKTT5m04=0,1 .
do if not range(vKTT5m04,0,1) | sys(vKTT5m04).
compute m271=concat("vKTT5m04=",string(vKTT5m04,f2)).
compute p271="vKTT5m04為不合理值或遺漏值".
end if.
Exec.

*vKTT5m05=0,1 .
do if not range(vKTT5m05,0,1) | sys(vKTT5m05).
compute m272=concat("vKTT5m05=",string(vKTT5m05,f2)).
compute p272="vKTT5m05為不合理值或遺漏值".
end if.
Exec.

*vKTT5m06=0,1 .
do if not range(vKTT5m06,0,1) | sys(vKTT5m06).
compute m273=concat("vKTT5m06=",string(vKTT5m06,f2)).
compute p273="vKTT5m06為不合理值或遺漏值".
end if.
Exec.

*vKTT5m07=0,1 .
do if not range(vKTT5m07,0,1) | sys(vKTT5m07).
compute m274=concat("vKTT5m07=",string(vKTT5m07,f2)).
compute p274="vKTT5m07為不合理值或遺漏值".
end if.
Exec.

*vKTT5m08=0,1 .
do if not range(vKTT5m08,0,1) | sys(vKTT5m08).
compute m275=concat("vKTT5m08=",string(vKTT5m08,f2)).
compute p275="vKTT5m08為不合理值或遺漏值".
end if.
Exec.

*vKTT5m09=0,1 .
do if not range(vKTT5m09,0,1) | sys(vKTT5m09).
compute m276=concat("vKTT5m09=",string(vKTT5m09,f2)).
compute p276="vKTT5m09為不合理值或遺漏值".
end if.
Exec.

*vKTT5m10=0,1 96 .
do if not range(vKTT5m10,0,1,96,96) | sys(vKTT5m10).
compute m277=concat("vKTT5m10=",string(vKTT5m10,f2)).
compute p277="vKTT5m10為不合理值或遺漏值".
end if.
Exec.

*vKTT5m11=0,1 96 .
do if not range(vKTT5m11,0,1,96,96) | sys(vKTT5m11).
compute m278=concat("vKTT5m11=",string(vKTT5m11,f2)).
compute p278="vKTT5m11為不合理值或遺漏值".
end if.
Exec.

*vKTT5m12=0,1 96 .
do if not range(vKTT5m12,0,1,96,96) | sys(vKTT5m12).
compute m279=concat("vKTT5m12=",string(vKTT5m12,f2)).
compute p279="vKTT5m12為不合理值或遺漏值".
end if.
Exec.

*vKTT5m88=0,1 96 .
do if not range(vKTT5m88,0,1,96,96) | sys(vKTT5m88).
compute m280=concat("vKTT5m88=",string(vKTT5m88,f2)).
compute p280="vKTT5m88為不合理值或遺漏值".
end if.
Exec.

*vP5_1=0.5,7 95 97,98 .
do if not range(vP5_1,0.5,7,95,95,97,98) | sys(vP5_1).
compute m281=concat("vP5_1=",string(vP5_1,f4)).
compute p281="vP5_1為不合理值或遺漏值".
end if.
Exec.

*vP5_2=1,2359 9797 9898 .
do if not range(vP5_2,1,2359,9797,9797,9898,9898) | sys(vP5_2).
compute m282=concat("vP5_2=",string(vP5_2,f5)).
compute p282="vP5_2為不合理值或遺漏值".
end if.
Exec.

*vK3m01=0,1 .
do if not range(vK3m01,0,1) | sys(vK3m01).
compute m283=concat("vK3m01=",string(vK3m01,f2)).
compute p283="vK3m01為不合理值或遺漏值".
end if.
Exec.

*vK3m02=0,1 .
do if not range(vK3m02,0,1) | sys(vK3m02).
compute m284=concat("vK3m02=",string(vK3m02,f2)).
compute p284="vK3m02為不合理值或遺漏值".
end if.
Exec.

*vK3m03=0,1 .
do if not range(vK3m03,0,1) | sys(vK3m03).
compute m285=concat("vK3m03=",string(vK3m03,f2)).
compute p285="vK3m03為不合理值或遺漏值".
end if.
Exec.

*vK3m04=0,1 .
do if not range(vK3m04,0,1) | sys(vK3m04).
compute m286=concat("vK3m04=",string(vK3m04,f2)).
compute p286="vK3m04為不合理值或遺漏值".
end if.
Exec.

*vK3m05=0,1 .
do if not range(vK3m05,0,1) | sys(vK3m05).
compute m287=concat("vK3m05=",string(vK3m05,f2)).
compute p287="vK3m05為不合理值或遺漏值".
end if.
Exec.

*vK3m06=0,1 .
do if not range(vK3m06,0,1) | sys(vK3m06).
compute m288=concat("vK3m06=",string(vK3m06,f2)).
compute p288="vK3m06為不合理值或遺漏值".
end if.
Exec.

*vK3m07=0,1 .
do if not range(vK3m07,0,1) | sys(vK3m07).
compute m289=concat("vK3m07=",string(vK3m07,f2)).
compute p289="vK3m07為不合理值或遺漏值".
end if.
Exec.

*vK3m08=0,1 .
do if not range(vK3m08,0,1) | sys(vK3m08).
compute m290=concat("vK3m08=",string(vK3m08,f2)).
compute p290="vK3m08為不合理值或遺漏值".
end if.
Exec.

*vK3m09=0,1 .
do if not range(vK3m09,0,1) | sys(vK3m09).
compute m291=concat("vK3m09=",string(vK3m09,f2)).
compute p291="vK3m09為不合理值或遺漏值".
end if.
Exec.

*vK3m88=0,1 96 .
do if not range(vK3m88,0,1,96,96) | sys(vK3m88).
compute m292=concat("vK3m88=",string(vK3m88,f2)).
compute p292="vK3m88為不合理值或遺漏值".
end if.
Exec.

*vK3m90=0,1 96 .
do if not range(vK3m90,0,1,96,96) | sys(vK3m90).
compute m293=concat("vK3m90=",string(vK3m90,f2)).
compute p293="vK3m90為不合理值或遺漏值".
end if.
Exec.

*vE18=1,88 97,98 .
do if not range(vE18,1,88,97,98) | sys(vE18).
compute m294=concat("vE18=",string(vE18,f2)).
compute p294="vE18為不合理值或遺漏值".
end if.
Exec.

*vKYT1=0.5,7 95 97,98 .
do if not range(vKYT1,0.5,7,95,95,97,98) | sys(vKYT1).
compute m295=concat("vKYT1=",string(vKYT1,f4)).
compute p295="vKYT1為不合理值或遺漏值".
end if.
Exec.

*vKYT2=1,2359 9797 9898 .
do if not range(vKYT2,1,2359,9797,9797,9898,9898) | sys(vKYT2).
compute m296=concat("vKYT2=",string(vKYT2,f5)).
compute p296="vKYT2為不合理值或遺漏值".
end if.
Exec.

*vE1=1,88 97,98 .
do if not range(vE1,1,88,97,98) | sys(vE1).
compute m297=concat("vE1=",string(vE1,f2)).
compute p297="vE1為不合理值或遺漏值".
end if.
Exec.

*vE2m01=0,1 .
do if not range(vE2m01,0,1) | sys(vE2m01).
compute m298=concat("vE2m01=",string(vE2m01,f2)).
compute p298="vE2m01為不合理值或遺漏值".
end if.
Exec.

*vE2m02=0,1 .
do if not range(vE2m02,0,1) | sys(vE2m02).
compute m299=concat("vE2m02=",string(vE2m02,f2)).
compute p299="vE2m02為不合理值或遺漏值".
end if.
Exec.

*vE2m03=0,1 .
do if not range(vE2m03,0,1) | sys(vE2m03).
compute m300=concat("vE2m03=",string(vE2m03,f2)).
compute p300="vE2m03為不合理值或遺漏值".
end if.
Exec.

*vE2m04=0,1 .
do if not range(vE2m04,0,1) | sys(vE2m04).
compute m301=concat("vE2m04=",string(vE2m04,f2)).
compute p301="vE2m04為不合理值或遺漏值".
end if.
Exec.

*vE2m88=0,1 96 .
do if not range(vE2m88,0,1,96,96) | sys(vE2m88).
compute m302=concat("vE2m88=",string(vE2m88,f2)).
compute p302="vE2m88為不合理值或遺漏值".
end if.
Exec.

*vE4=0.5,7 95 97,98 .
do if not range(vE4,0.5,7,95,95,97,98) | sys(vE4).
compute m303=concat("vE4=",string(vE4,f4)).
compute p303="vE4為不合理值或遺漏值".
end if.
Exec.

*vCKE4=96 .
do if not range(vCKE4,96,96) | sys(vCKE4).
compute m304=concat("vCKE4=",string(vCKE4,f2)).
compute p304="vCKE4為不合理值或遺漏值".
end if.
Exec.

*vE5=0,2359 9797 9898 .
do if not range(vE5,0,2359,9797,9797,9898,9898) | sys(vE5).
compute m305=concat("vE5=",string(vE5,f5)).
compute p305="vE5為不合理值或遺漏值".
end if.
Exec.

*vE6=0,2359 9797 9898 .
do if not range(vE6,0,2359,9797,9797,9898,9898) | sys(vE6).
compute m306=concat("vE6=",string(vE6,f5)).
compute p306="vE6為不合理值或遺漏值".
end if.
Exec.

*vCKE5=1,88 97,98 .
do if not range(vCKE5,1,88,97,98) | sys(vCKE5).
compute m307=concat("vCKE5=",string(vCKE5,f2)).
compute p307="vCKE5為不合理值或遺漏值".
end if.
Exec.

*vE7=0.5,7 95 97,98 .
do if not range(vE7,0.5,7,95,95,97,98) | sys(vE7).
compute m308=concat("vE7=",string(vE7,f4)).
compute p308="vE7為不合理值或遺漏值".
end if.
Exec.

*vE8=0,2359 9797 9898 .
do if not range(vE8,0,2359,9797,9797,9898,9898) | sys(vE8).
compute m309=concat("vE8=",string(vE8,f5)).
compute p309="vE8為不合理值或遺漏值".
end if.
Exec.

*vE9=0,2359 9797 9898 .
do if not range(vE9,0,2359,9797,9797,9898,9898) | sys(vE9).
compute m310=concat("vE9=",string(vE9,f5)).
compute p310="vE9為不合理值或遺漏值".
end if.
Exec.

*vCKE8=1,88 97,98 .
do if not range(vCKE8,1,88,97,98) | sys(vCKE8).
compute m311=concat("vCKE8=",string(vCKE8,f2)).
compute p311="vCKE8為不合理值或遺漏值".
end if.
Exec.

*vE10=0.5,7 95 97,98 .
do if not range(vE10,0.5,7,95,95,97,98) | sys(vE10).
compute m312=concat("vE10=",string(vE10,f4)).
compute p312="vE10為不合理值或遺漏值".
end if.
Exec.

*vE11=0,2359 9797 9898 .
do if not range(vE11,0,2359,9797,9797,9898,9898) | sys(vE11).
compute m313=concat("vE11=",string(vE11,f5)).
compute p313="vE11為不合理值或遺漏值".
end if.
Exec.

*vE12=0,2359 9797 9898 .
do if not range(vE12,0,2359,9797,9797,9898,9898) | sys(vE12).
compute m314=concat("vE12=",string(vE12,f5)).
compute p314="vE12為不合理值或遺漏值".
end if.
Exec.

*vCKE11=1,88 97,98 .
do if not range(vCKE11,1,88,97,98) | sys(vCKE11).
compute m315=concat("vCKE11=",string(vCKE11,f2)).
compute p315="vCKE11為不合理值或遺漏值".
end if.
Exec.

*vE3=1,2359 9797 9898 .
do if not range(vE3,1,2359,9797,9797,9898,9898) | sys(vE3).
compute m316=concat("vE3=",string(vE3,f5)).
compute p316="vE3為不合理值或遺漏值".
end if.
Exec.

*vE13m01=0,1 .
do if not range(vE13m01,0,1) | sys(vE13m01).
compute m317=concat("vE13m01=",string(vE13m01,f2)).
compute p317="vE13m01為不合理值或遺漏值".
end if.
Exec.

*vE13m02=0,1 .
do if not range(vE13m02,0,1) | sys(vE13m02).
compute m318=concat("vE13m02=",string(vE13m02,f2)).
compute p318="vE13m02為不合理值或遺漏值".
end if.
Exec.

*vE13m03=0,1 .
do if not range(vE13m03,0,1) | sys(vE13m03).
compute m319=concat("vE13m03=",string(vE13m03,f2)).
compute p319="vE13m03為不合理值或遺漏值".
end if.
Exec.

*vE13m04=0,1 .
do if not range(vE13m04,0,1) | sys(vE13m04).
compute m320=concat("vE13m04=",string(vE13m04,f2)).
compute p320="vE13m04為不合理值或遺漏值".
end if.
Exec.

*vE13m05=0,1 .
do if not range(vE13m05,0,1) | sys(vE13m05).
compute m321=concat("vE13m05=",string(vE13m05,f2)).
compute p321="vE13m05為不合理值或遺漏值".
end if.
Exec.

*vE13m06=0,1 .
do if not range(vE13m06,0,1) | sys(vE13m06).
compute m322=concat("vE13m06=",string(vE13m06,f2)).
compute p322="vE13m06為不合理值或遺漏值".
end if.
Exec.

*vE13m88=0,1 96 .
do if not range(vE13m88,0,1,96,96) | sys(vE13m88).
compute m323=concat("vE13m88=",string(vE13m88,f2)).
compute p323="vE13m88為不合理值或遺漏值".
end if.
Exec.

*vE14=0,100000 999991 999997,999998 .
do if not range(vE14,0,100000,999991,999991,999997,999998) | sys(vE14).
compute m324=concat("vE14=",string(vE14,f7)).
compute p324="vE14為不合理值或遺漏值".
end if.
Exec.

*vG7m01=0,1 .
do if not range(vG7m01,0,1) | sys(vG7m01).
compute m325=concat("vG7m01=",string(vG7m01,f2)).
compute p325="vG7m01為不合理值或遺漏值".
end if.
Exec.

*vG7m02=0,1 .
do if not range(vG7m02,0,1) | sys(vG7m02).
compute m326=concat("vG7m02=",string(vG7m02,f2)).
compute p326="vG7m02為不合理值或遺漏值".
end if.
Exec.

*vG7m03=0,1 .
do if not range(vG7m03,0,1) | sys(vG7m03).
compute m327=concat("vG7m03=",string(vG7m03,f2)).
compute p327="vG7m03為不合理值或遺漏值".
end if.
Exec.

*vG7m04=0,1 .
do if not range(vG7m04,0,1) | sys(vG7m04).
compute m328=concat("vG7m04=",string(vG7m04,f2)).
compute p328="vG7m04為不合理值或遺漏值".
end if.
Exec.

*vG7m05=0,1 .
do if not range(vG7m05,0,1) | sys(vG7m05).
compute m329=concat("vG7m05=",string(vG7m05,f2)).
compute p329="vG7m05為不合理值或遺漏值".
end if.
Exec.

*vG7m06=0,1 .
do if not range(vG7m06,0,1) | sys(vG7m06).
compute m330=concat("vG7m06=",string(vG7m06,f2)).
compute p330="vG7m06為不合理值或遺漏值".
end if.
Exec.

*vG7m07=0,1 .
do if not range(vG7m07,0,1) | sys(vG7m07).
compute m331=concat("vG7m07=",string(vG7m07,f2)).
compute p331="vG7m07為不合理值或遺漏值".
end if.
Exec.

*vG7m08=0,1 .
do if not range(vG7m08,0,1) | sys(vG7m08).
compute m332=concat("vG7m08=",string(vG7m08,f2)).
compute p332="vG7m08為不合理值或遺漏值".
end if.
Exec.

*vG7m09=0,1 .
do if not range(vG7m09,0,1) | sys(vG7m09).
compute m333=concat("vG7m09=",string(vG7m09,f2)).
compute p333="vG7m09為不合理值或遺漏值".
end if.
Exec.

*vG7m10=0,1 96 .
do if not range(vG7m10,0,1,96,96) | sys(vG7m10).
compute m334=concat("vG7m10=",string(vG7m10,f2)).
compute p334="vG7m10為不合理值或遺漏值".
end if.
Exec.

*vG7m11=0,1 96 .
do if not range(vG7m11,0,1,96,96) | sys(vG7m11).
compute m335=concat("vG7m11=",string(vG7m11,f2)).
compute p335="vG7m11為不合理值或遺漏值".
end if.
Exec.

*vG7m12=0,1 96 .
do if not range(vG7m12,0,1,96,96) | sys(vG7m12).
compute m336=concat("vG7m12=",string(vG7m12,f2)).
compute p336="vG7m12為不合理值或遺漏值".
end if.
Exec.

*vG7m88=0,1 96 .
do if not range(vG7m88,0,1,96,96) | sys(vG7m88).
compute m337=concat("vG7m88=",string(vG7m88,f2)).
compute p337="vG7m88為不合理值或遺漏值".
end if.
Exec.

*vG7m90=0,1 96 .
do if not range(vG7m90,0,1,96,96) | sys(vG7m90).
compute m338=concat("vG7m90=",string(vG7m90,f2)).
compute p338="vG7m90為不合理值或遺漏值".
end if.
Exec.

*vG8m01=0,1 .
do if not range(vG8m01,0,1) | sys(vG8m01).
compute m339=concat("vG8m01=",string(vG8m01,f2)).
compute p339="vG8m01為不合理值或遺漏值".
end if.
Exec.

*vG8m02=0,1 .
do if not range(vG8m02,0,1) | sys(vG8m02).
compute m340=concat("vG8m02=",string(vG8m02,f2)).
compute p340="vG8m02為不合理值或遺漏值".
end if.
Exec.

*vG8m03=0,1 .
do if not range(vG8m03,0,1) | sys(vG8m03).
compute m341=concat("vG8m03=",string(vG8m03,f2)).
compute p341="vG8m03為不合理值或遺漏值".
end if.
Exec.

*vG8m04=0,1 .
do if not range(vG8m04,0,1) | sys(vG8m04).
compute m342=concat("vG8m04=",string(vG8m04,f2)).
compute p342="vG8m04為不合理值或遺漏值".
end if.
Exec.

*vG8m05=0,1 .
do if not range(vG8m05,0,1) | sys(vG8m05).
compute m343=concat("vG8m05=",string(vG8m05,f2)).
compute p343="vG8m05為不合理值或遺漏值".
end if.
Exec.

*vG8m06=0,1 .
do if not range(vG8m06,0,1) | sys(vG8m06).
compute m344=concat("vG8m06=",string(vG8m06,f2)).
compute p344="vG8m06為不合理值或遺漏值".
end if.
Exec.

*vG8m07=0,1 .
do if not range(vG8m07,0,1) | sys(vG8m07).
compute m345=concat("vG8m07=",string(vG8m07,f2)).
compute p345="vG8m07為不合理值或遺漏值".
end if.
Exec.

*vG8m08=0,1 .
do if not range(vG8m08,0,1) | sys(vG8m08).
compute m346=concat("vG8m08=",string(vG8m08,f2)).
compute p346="vG8m08為不合理值或遺漏值".
end if.
Exec.

*vG8m09=0,1 .
do if not range(vG8m09,0,1) | sys(vG8m09).
compute m347=concat("vG8m09=",string(vG8m09,f2)).
compute p347="vG8m09為不合理值或遺漏值".
end if.
Exec.

*vG8m10=0,1 96 .
do if not range(vG8m10,0,1,96,96) | sys(vG8m10).
compute m348=concat("vG8m10=",string(vG8m10,f2)).
compute p348="vG8m10為不合理值或遺漏值".
end if.
Exec.

*vG8m11=0,1 96 .
do if not range(vG8m11,0,1,96,96) | sys(vG8m11).
compute m349=concat("vG8m11=",string(vG8m11,f2)).
compute p349="vG8m11為不合理值或遺漏值".
end if.
Exec.

*vG8m12=0,1 96 .
do if not range(vG8m12,0,1,96,96) | sys(vG8m12).
compute m350=concat("vG8m12=",string(vG8m12,f2)).
compute p350="vG8m12為不合理值或遺漏值".
end if.
Exec.

*vG8m13=0,1 96 .
do if not range(vG8m13,0,1,96,96) | sys(vG8m13).
compute m351=concat("vG8m13=",string(vG8m13,f2)).
compute p351="vG8m13為不合理值或遺漏值".
end if.
Exec.

*vG8m14=0,1 96 .
do if not range(vG8m14,0,1,96,96) | sys(vG8m14).
compute m352=concat("vG8m14=",string(vG8m14,f2)).
compute p352="vG8m14為不合理值或遺漏值".
end if.
Exec.

*vG8m15=0,1 96 .
do if not range(vG8m15,0,1,96,96) | sys(vG8m15).
compute m353=concat("vG8m15=",string(vG8m15,f2)).
compute p353="vG8m15為不合理值或遺漏值".
end if.
Exec.

*vG8m16=0,1 96 .
do if not range(vG8m16,0,1,96,96) | sys(vG8m16).
compute m354=concat("vG8m16=",string(vG8m16,f2)).
compute p354="vG8m16為不合理值或遺漏值".
end if.
Exec.

*vG8m88=0,1 96 .
do if not range(vG8m88,0,1,96,96) | sys(vG8m88).
compute m355=concat("vG8m88=",string(vG8m88,f2)).
compute p355="vG8m88為不合理值或遺漏值".
end if.
Exec.

*vG8m90=0,1 96 .
do if not range(vG8m90,0,1,96,96) | sys(vG8m90).
compute m356=concat("vG8m90=",string(vG8m90,f2)).
compute p356="vG8m90為不合理值或遺漏值".
end if.
Exec.

*vG9m01=0,1 .
do if not range(vG9m01,0,1) | sys(vG9m01).
compute m357=concat("vG9m01=",string(vG9m01,f2)).
compute p357="vG9m01為不合理值或遺漏值".
end if.
Exec.

*vG9m02=0,1 .
do if not range(vG9m02,0,1) | sys(vG9m02).
compute m358=concat("vG9m02=",string(vG9m02,f2)).
compute p358="vG9m02為不合理值或遺漏值".
end if.
Exec.

*vG9m03=0,1 .
do if not range(vG9m03,0,1) | sys(vG9m03).
compute m359=concat("vG9m03=",string(vG9m03,f2)).
compute p359="vG9m03為不合理值或遺漏值".
end if.
Exec.

*vG9m04=0,1 .
do if not range(vG9m04,0,1) | sys(vG9m04).
compute m360=concat("vG9m04=",string(vG9m04,f2)).
compute p360="vG9m04為不合理值或遺漏值".
end if.
Exec.

*vG9m05=0,1 .
do if not range(vG9m05,0,1) | sys(vG9m05).
compute m361=concat("vG9m05=",string(vG9m05,f2)).
compute p361="vG9m05為不合理值或遺漏值".
end if.
Exec.

*vG9m06=0,1 .
do if not range(vG9m06,0,1) | sys(vG9m06).
compute m362=concat("vG9m06=",string(vG9m06,f2)).
compute p362="vG9m06為不合理值或遺漏值".
end if.
Exec.

*vG9m07=0,1 .
do if not range(vG9m07,0,1) | sys(vG9m07).
compute m363=concat("vG9m07=",string(vG9m07,f2)).
compute p363="vG9m07為不合理值或遺漏值".
end if.
Exec.

*vG9m08=0,1 .
do if not range(vG9m08,0,1) | sys(vG9m08).
compute m364=concat("vG9m08=",string(vG9m08,f2)).
compute p364="vG9m08為不合理值或遺漏值".
end if.
Exec.

*vG9m09=0,1 .
do if not range(vG9m09,0,1) | sys(vG9m09).
compute m365=concat("vG9m09=",string(vG9m09,f2)).
compute p365="vG9m09為不合理值或遺漏值".
end if.
Exec.

*vG9m10=0,1 96 .
do if not range(vG9m10,0,1,96,96) | sys(vG9m10).
compute m366=concat("vG9m10=",string(vG9m10,f2)).
compute p366="vG9m10為不合理值或遺漏值".
end if.
Exec.

*vG9m11=0,1 96 .
do if not range(vG9m11,0,1,96,96) | sys(vG9m11).
compute m367=concat("vG9m11=",string(vG9m11,f2)).
compute p367="vG9m11為不合理值或遺漏值".
end if.
Exec.

*vG9m12=0,1 96 .
do if not range(vG9m12,0,1,96,96) | sys(vG9m12).
compute m368=concat("vG9m12=",string(vG9m12,f2)).
compute p368="vG9m12為不合理值或遺漏值".
end if.
Exec.

*vG9m13=0,1 96 .
do if not range(vG9m13,0,1,96,96) | sys(vG9m13).
compute m369=concat("vG9m13=",string(vG9m13,f2)).
compute p369="vG9m13為不合理值或遺漏值".
end if.
Exec.

*vG9m88=0,1 96 .
do if not range(vG9m88,0,1,96,96) | sys(vG9m88).
compute m370=concat("vG9m88=",string(vG9m88,f2)).
compute p370="vG9m88為不合理值或遺漏值".
end if.
Exec.

*vG9m90=0,1 96 .
do if not range(vG9m90,0,1,96,96) | sys(vG9m90).
compute m371=concat("vG9m90=",string(vG9m90,f2)).
compute p371="vG9m90為不合理值或遺漏值".
end if.
Exec.

*vG10m01=0,1 .
do if not range(vG10m01,0,1) | sys(vG10m01).
compute m372=concat("vG10m01=",string(vG10m01,f2)).
compute p372="vG10m01為不合理值或遺漏值".
end if.
Exec.

*vG10m02=0,1 .
do if not range(vG10m02,0,1) | sys(vG10m02).
compute m373=concat("vG10m02=",string(vG10m02,f2)).
compute p373="vG10m02為不合理值或遺漏值".
end if.
Exec.

*vG10m03=0,1 .
do if not range(vG10m03,0,1) | sys(vG10m03).
compute m374=concat("vG10m03=",string(vG10m03,f2)).
compute p374="vG10m03為不合理值或遺漏值".
end if.
Exec.

*vG10m04=0,1 .
do if not range(vG10m04,0,1) | sys(vG10m04).
compute m375=concat("vG10m04=",string(vG10m04,f2)).
compute p375="vG10m04為不合理值或遺漏值".
end if.
Exec.

*vG10m05=0,1 .
do if not range(vG10m05,0,1) | sys(vG10m05).
compute m376=concat("vG10m05=",string(vG10m05,f2)).
compute p376="vG10m05為不合理值或遺漏值".
end if.
Exec.

*vG10m06=0,1 .
do if not range(vG10m06,0,1) | sys(vG10m06).
compute m377=concat("vG10m06=",string(vG10m06,f2)).
compute p377="vG10m06為不合理值或遺漏值".
end if.
Exec.

*vG10m07=0,1 .
do if not range(vG10m07,0,1) | sys(vG10m07).
compute m378=concat("vG10m07=",string(vG10m07,f2)).
compute p378="vG10m07為不合理值或遺漏值".
end if.
Exec.

*vG10m08=0,1 .
do if not range(vG10m08,0,1) | sys(vG10m08).
compute m379=concat("vG10m08=",string(vG10m08,f2)).
compute p379="vG10m08為不合理值或遺漏值".
end if.
Exec.

*vG10m09=0,1 .
do if not range(vG10m09,0,1) | sys(vG10m09).
compute m380=concat("vG10m09=",string(vG10m09,f2)).
compute p380="vG10m09為不合理值或遺漏值".
end if.
Exec.

*vG10m10=0,1 96 .
do if not range(vG10m10,0,1,96,96) | sys(vG10m10).
compute m381=concat("vG10m10=",string(vG10m10,f2)).
compute p381="vG10m10為不合理值或遺漏值".
end if.
Exec.

*vG10m11=0,1 96 .
do if not range(vG10m11,0,1,96,96) | sys(vG10m11).
compute m382=concat("vG10m11=",string(vG10m11,f2)).
compute p382="vG10m11為不合理值或遺漏值".
end if.
Exec.

*vG10m12=0,1 96 .
do if not range(vG10m12,0,1,96,96) | sys(vG10m12).
compute m383=concat("vG10m12=",string(vG10m12,f2)).
compute p383="vG10m12為不合理值或遺漏值".
end if.
Exec.

*vG10m13=0,1 96 .
do if not range(vG10m13,0,1,96,96) | sys(vG10m13).
compute m384=concat("vG10m13=",string(vG10m13,f2)).
compute p384="vG10m13為不合理值或遺漏值".
end if.
Exec.

*vG10m14=0,1 96 .
do if not range(vG10m14,0,1,96,96) | sys(vG10m14).
compute m385=concat("vG10m14=",string(vG10m14,f2)).
compute p385="vG10m14為不合理值或遺漏值".
end if.
Exec.

*vG10m15=0,1 96 .
do if not range(vG10m15,0,1,96,96) | sys(vG10m15).
compute m386=concat("vG10m15=",string(vG10m15,f2)).
compute p386="vG10m15為不合理值或遺漏值".
end if.
Exec.

*vG10m16=0,1 96 .
do if not range(vG10m16,0,1,96,96) | sys(vG10m16).
compute m387=concat("vG10m16=",string(vG10m16,f2)).
compute p387="vG10m16為不合理值或遺漏值".
end if.
Exec.

*vG10m17=0,1 96 .
do if not range(vG10m17,0,1,96,96) | sys(vG10m17).
compute m388=concat("vG10m17=",string(vG10m17,f2)).
compute p388="vG10m17為不合理值或遺漏值".
end if.
Exec.

*vG10m18=0,1 96 .
do if not range(vG10m18,0,1,96,96) | sys(vG10m18).
compute m389=concat("vG10m18=",string(vG10m18,f2)).
compute p389="vG10m18為不合理值或遺漏值".
end if.
Exec.

*vG10m19=0,1 96 .
do if not range(vG10m19,0,1,96,96) | sys(vG10m19).
compute m390=concat("vG10m19=",string(vG10m19,f2)).
compute p390="vG10m19為不合理值或遺漏值".
end if.
Exec.

*vG10m88=0,1 96 .
do if not range(vG10m88,0,1,96,96) | sys(vG10m88).
compute m391=concat("vG10m88=",string(vG10m88,f2)).
compute p391="vG10m88為不合理值或遺漏值".
end if.
Exec.

*vG10m90=0,1 96 .
do if not range(vG10m90,0,1,96,96) | sys(vG10m90).
compute m392=concat("vG10m90=",string(vG10m90,f2)).
compute p392="vG10m90為不合理值或遺漏值".
end if.
Exec.

*vG11m01=0,1 .
do if not range(vG11m01,0,1) | sys(vG11m01).
compute m393=concat("vG11m01=",string(vG11m01,f2)).
compute p393="vG11m01為不合理值或遺漏值".
end if.
Exec.

*vG11m02=0,1 .
do if not range(vG11m02,0,1) | sys(vG11m02).
compute m394=concat("vG11m02=",string(vG11m02,f2)).
compute p394="vG11m02為不合理值或遺漏值".
end if.
Exec.

*vG11m03=0,1 .
do if not range(vG11m03,0,1) | sys(vG11m03).
compute m395=concat("vG11m03=",string(vG11m03,f2)).
compute p395="vG11m03為不合理值或遺漏值".
end if.
Exec.

*vG11m04=0,1 .
do if not range(vG11m04,0,1) | sys(vG11m04).
compute m396=concat("vG11m04=",string(vG11m04,f2)).
compute p396="vG11m04為不合理值或遺漏值".
end if.
Exec.

*vG11m05=0,1 .
do if not range(vG11m05,0,1) | sys(vG11m05).
compute m397=concat("vG11m05=",string(vG11m05,f2)).
compute p397="vG11m05為不合理值或遺漏值".
end if.
Exec.

*vG11m88=0,1 96 .
do if not range(vG11m88,0,1,96,96) | sys(vG11m88).
compute m398=concat("vG11m88=",string(vG11m88,f2)).
compute p398="vG11m88為不合理值或遺漏值".
end if.
Exec.

*vG11m90=0,1 96 .
do if not range(vG11m90,0,1,96,96) | sys(vG11m90).
compute m399=concat("vG11m90=",string(vG11m90,f2)).
compute p399="vG11m90為不合理值或遺漏值".
end if.
Exec.

*vG4=0.5,7 95 97,98 .
do if not range(vG4,0.5,7,95,95,97,98) | sys(vG4).
compute m400=concat("vG4=",string(vG4,f4)).
compute p400="vG4為不合理值或遺漏值".
end if.
Exec.

*vG5=1,2359 9797 9898 .
do if not range(vG5,1,2359,9797,9797,9898,9898) | sys(vG5).
compute m401=concat("vG5=",string(vG5,f5)).
compute p401="vG5為不合理值或遺漏值".
end if.
Exec.

*vB1=0,5 95 97,98 .
do if not range(vB1,0,5,95,95,97,98) | sys(vB1).
compute m402=concat("vB1=",string(vB1,f4)).
compute p402="vB1為不合理值或遺漏值".
end if.
Exec.

*vB2=1,2359 9797 9898 .
do if not range(vB2,1,2359,9797,9797,9898,9898) | sys(vB2).
compute m403=concat("vB2=",string(vB2,f5)).
compute p403="vB2為不合理值或遺漏值".
end if.
Exec.

*vB3=0,2 95 97,98 .
do if not range(vB3,0,2,95,95,97,98) | sys(vB3).
compute m404=concat("vB3=",string(vB3,f4)).
compute p404="vB3為不合理值或遺漏值".
end if.
Exec.

*vB4=1,2359 9797 9898 .
do if not range(vB4,1,2359,9797,9797,9898,9898) | sys(vB4).
compute m405=concat("vB4=",string(vB4,f5)).
compute p405="vB4為不合理值或遺漏值".
end if.
Exec.

*vB5=0,7 95 97,98 .
do if not range(vB5,0,7,95,95,97,98) | sys(vB5).
compute m406=concat("vB5=",string(vB5,f4)).
compute p406="vB5為不合理值或遺漏值".
end if.
Exec.

*vCKB5=96 .
do if not range(vCKB5,96,96) | sys(vCKB5).
compute m407=concat("vCKB5=",string(vCKB5,f2)).
compute p407="vCKB5為不合理值或遺漏值".
end if.
Exec.

*vB6=1,2359 9797 9898 .
do if not range(vB6,1,2359,9797,9797,9898,9898) | sys(vB6).
compute m408=concat("vB6=",string(vB6,f5)).
compute p408="vB6為不合理值或遺漏值".
end if.
Exec.

*vB7am01=0,1 .
do if not range(vB7am01,0,1) | sys(vB7am01).
compute m409=concat("vB7am01=",string(vB7am01,f2)).
compute p409="vB7am01為不合理值或遺漏值".
end if.
Exec.

*vB7am02=0,1 .
do if not range(vB7am02,0,1) | sys(vB7am02).
compute m410=concat("vB7am02=",string(vB7am02,f2)).
compute p410="vB7am02為不合理值或遺漏值".
end if.
Exec.

*vB7am03=0,1 .
do if not range(vB7am03,0,1) | sys(vB7am03).
compute m411=concat("vB7am03=",string(vB7am03,f2)).
compute p411="vB7am03為不合理值或遺漏值".
end if.
Exec.

*vB7am04=0,1 .
do if not range(vB7am04,0,1) | sys(vB7am04).
compute m412=concat("vB7am04=",string(vB7am04,f2)).
compute p412="vB7am04為不合理值或遺漏值".
end if.
Exec.

*vB7am05=0,1 .
do if not range(vB7am05,0,1) | sys(vB7am05).
compute m413=concat("vB7am05=",string(vB7am05,f2)).
compute p413="vB7am05為不合理值或遺漏值".
end if.
Exec.

*vB7am06=0,1 .
do if not range(vB7am06,0,1) | sys(vB7am06).
compute m414=concat("vB7am06=",string(vB7am06,f2)).
compute p414="vB7am06為不合理值或遺漏值".
end if.
Exec.

*vB7am07=0,1 .
do if not range(vB7am07,0,1) | sys(vB7am07).
compute m415=concat("vB7am07=",string(vB7am07,f2)).
compute p415="vB7am07為不合理值或遺漏值".
end if.
Exec.

*vB7am08=0,1 .
do if not range(vB7am08,0,1) | sys(vB7am08).
compute m416=concat("vB7am08=",string(vB7am08,f2)).
compute p416="vB7am08為不合理值或遺漏值".
end if.
Exec.

*vB7am09=0,1 .
do if not range(vB7am09,0,1) | sys(vB7am09).
compute m417=concat("vB7am09=",string(vB7am09,f2)).
compute p417="vB7am09為不合理值或遺漏值".
end if.
Exec.

*vB7am10=0,1 96 .
do if not range(vB7am10,0,1,96,96) | sys(vB7am10).
compute m418=concat("vB7am10=",string(vB7am10,f2)).
compute p418="vB7am10為不合理值或遺漏值".
end if.
Exec.

*vB7am11=0,1 96 .
do if not range(vB7am11,0,1,96,96) | sys(vB7am11).
compute m419=concat("vB7am11=",string(vB7am11,f2)).
compute p419="vB7am11為不合理值或遺漏值".
end if.
Exec.

*vB7am12=0,1 96 .
do if not range(vB7am12,0,1,96,96) | sys(vB7am12).
compute m420=concat("vB7am12=",string(vB7am12,f2)).
compute p420="vB7am12為不合理值或遺漏值".
end if.
Exec.

*vB7am13=0,1 96 .
do if not range(vB7am13,0,1,96,96) | sys(vB7am13).
compute m421=concat("vB7am13=",string(vB7am13,f2)).
compute p421="vB7am13為不合理值或遺漏值".
end if.
Exec.

*vB7am14=0,1 96 .
do if not range(vB7am14,0,1,96,96) | sys(vB7am14).
compute m422=concat("vB7am14=",string(vB7am14,f2)).
compute p422="vB7am14為不合理值或遺漏值".
end if.
Exec.

*vB7am15=0,1 96 .
do if not range(vB7am15,0,1,96,96) | sys(vB7am15).
compute m423=concat("vB7am15=",string(vB7am15,f2)).
compute p423="vB7am15為不合理值或遺漏值".
end if.
Exec.

*vB7am16=0,1 96 .
do if not range(vB7am16,0,1,96,96) | sys(vB7am16).
compute m424=concat("vB7am16=",string(vB7am16,f2)).
compute p424="vB7am16為不合理值或遺漏值".
end if.
Exec.

*vB7am17=0,1 96 .
do if not range(vB7am17,0,1,96,96) | sys(vB7am17).
compute m425=concat("vB7am17=",string(vB7am17,f2)).
compute p425="vB7am17為不合理值或遺漏值".
end if.
Exec.

*vB7am18=0,1 96 .
do if not range(vB7am18,0,1,96,96) | sys(vB7am18).
compute m426=concat("vB7am18=",string(vB7am18,f2)).
compute p426="vB7am18為不合理值或遺漏值".
end if.
Exec.

*vB7am19=0,1 96 .
do if not range(vB7am19,0,1,96,96) | sys(vB7am19).
compute m427=concat("vB7am19=",string(vB7am19,f2)).
compute p427="vB7am19為不合理值或遺漏值".
end if.
Exec.

*vB7am20=0,1 96 .
do if not range(vB7am20,0,1,96,96) | sys(vB7am20).
compute m428=concat("vB7am20=",string(vB7am20,f2)).
compute p428="vB7am20為不合理值或遺漏值".
end if.
Exec.

*vB7am21=0,1 96 .
do if not range(vB7am21,0,1,96,96) | sys(vB7am21).
compute m429=concat("vB7am21=",string(vB7am21,f2)).
compute p429="vB7am21為不合理值或遺漏值".
end if.
Exec.

*vB7am22=0,1 96 .
do if not range(vB7am22,0,1,96,96) | sys(vB7am22).
compute m430=concat("vB7am22=",string(vB7am22,f2)).
compute p430="vB7am22為不合理值或遺漏值".
end if.
Exec.

*vB7am23=0,1 96 .
do if not range(vB7am23,0,1,96,96) | sys(vB7am23).
compute m431=concat("vB7am23=",string(vB7am23,f2)).
compute p431="vB7am23為不合理值或遺漏值".
end if.
Exec.

*vB7am24=0,1 96 .
do if not range(vB7am24,0,1,96,96) | sys(vB7am24).
compute m432=concat("vB7am24=",string(vB7am24,f2)).
compute p432="vB7am24為不合理值或遺漏值".
end if.
Exec.

*vB7am25=0,1 96 .
do if not range(vB7am25,0,1,96,96) | sys(vB7am25).
compute m433=concat("vB7am25=",string(vB7am25,f2)).
compute p433="vB7am25為不合理值或遺漏值".
end if.
Exec.

*vB7am26=0,1 96 .
do if not range(vB7am26,0,1,96,96) | sys(vB7am26).
compute m434=concat("vB7am26=",string(vB7am26,f2)).
compute p434="vB7am26為不合理值或遺漏值".
end if.
Exec.

*vB7am27=0,1 96 .
do if not range(vB7am27,0,1,96,96) | sys(vB7am27).
compute m435=concat("vB7am27=",string(vB7am27,f2)).
compute p435="vB7am27為不合理值或遺漏值".
end if.
Exec.

*vB7am28=0,1 96 .
do if not range(vB7am28,0,1,96,96) | sys(vB7am28).
compute m436=concat("vB7am28=",string(vB7am28,f2)).
compute p436="vB7am28為不合理值或遺漏值".
end if.
Exec.

*vB7am29=0,1 96 .
do if not range(vB7am29,0,1,96,96) | sys(vB7am29).
compute m437=concat("vB7am29=",string(vB7am29,f2)).
compute p437="vB7am29為不合理值或遺漏值".
end if.
Exec.

*vB7am30=0,1 96 .
do if not range(vB7am30,0,1,96,96) | sys(vB7am30).
compute m438=concat("vB7am30=",string(vB7am30,f2)).
compute p438="vB7am30為不合理值或遺漏值".
end if.
Exec.

*vB7am31=0,1 96 .
do if not range(vB7am31,0,1,96,96) | sys(vB7am31).
compute m439=concat("vB7am31=",string(vB7am31,f2)).
compute p439="vB7am31為不合理值或遺漏值".
end if.
Exec.

*vB7am32=0,1 96 .
do if not range(vB7am32,0,1,96,96) | sys(vB7am32).
compute m440=concat("vB7am32=",string(vB7am32,f2)).
compute p440="vB7am32為不合理值或遺漏值".
end if.
Exec.

*vB7am33=0,1 96 .
do if not range(vB7am33,0,1,96,96) | sys(vB7am33).
compute m441=concat("vB7am33=",string(vB7am33,f2)).
compute p441="vB7am33為不合理值或遺漏值".
end if.
Exec.

*vB7am34=0,1 96 .
do if not range(vB7am34,0,1,96,96) | sys(vB7am34).
compute m442=concat("vB7am34=",string(vB7am34,f2)).
compute p442="vB7am34為不合理值或遺漏值".
end if.
Exec.

*vB7am35=0,1 96 .
do if not range(vB7am35,0,1,96,96) | sys(vB7am35).
compute m443=concat("vB7am35=",string(vB7am35,f2)).
compute p443="vB7am35為不合理值或遺漏值".
end if.
Exec.

*vB7am36=0,1 96 .
do if not range(vB7am36,0,1,96,96) | sys(vB7am36).
compute m444=concat("vB7am36=",string(vB7am36,f2)).
compute p444="vB7am36為不合理值或遺漏值".
end if.
Exec.

*vB7am37=0,1 96 .
do if not range(vB7am37,0,1,96,96) | sys(vB7am37).
compute m445=concat("vB7am37=",string(vB7am37,f2)).
compute p445="vB7am37為不合理值或遺漏值".
end if.
Exec.

*vB7am38=0,1 96 .
do if not range(vB7am38,0,1,96,96) | sys(vB7am38).
compute m446=concat("vB7am38=",string(vB7am38,f2)).
compute p446="vB7am38為不合理值或遺漏值".
end if.
Exec.

*vB7am39=0,1 96 .
do if not range(vB7am39,0,1,96,96) | sys(vB7am39).
compute m447=concat("vB7am39=",string(vB7am39,f2)).
compute p447="vB7am39為不合理值或遺漏值".
end if.
Exec.

*vB7am40=0,1 96 .
do if not range(vB7am40,0,1,96,96) | sys(vB7am40).
compute m448=concat("vB7am40=",string(vB7am40,f2)).
compute p448="vB7am40為不合理值或遺漏值".
end if.
Exec.

*vB7am41=0,1 96 .
do if not range(vB7am41,0,1,96,96) | sys(vB7am41).
compute m449=concat("vB7am41=",string(vB7am41,f2)).
compute p449="vB7am41為不合理值或遺漏值".
end if.
Exec.

*vB7am42=0,1 96 .
do if not range(vB7am42,0,1,96,96) | sys(vB7am42).
compute m450=concat("vB7am42=",string(vB7am42,f2)).
compute p450="vB7am42為不合理值或遺漏值".
end if.
Exec.

*vB7am43=0,1 96 .
do if not range(vB7am43,0,1,96,96) | sys(vB7am43).
compute m451=concat("vB7am43=",string(vB7am43,f2)).
compute p451="vB7am43為不合理值或遺漏值".
end if.
Exec.

*vB7am44=0,1 96 .
do if not range(vB7am44,0,1,96,96) | sys(vB7am44).
compute m452=concat("vB7am44=",string(vB7am44,f2)).
compute p452="vB7am44為不合理值或遺漏值".
end if.
Exec.

*vB7am45=0,1 96 .
do if not range(vB7am45,0,1,96,96) | sys(vB7am45).
compute m453=concat("vB7am45=",string(vB7am45,f2)).
compute p453="vB7am45為不合理值或遺漏值".
end if.
Exec.

*vB7am46=0,1 96 .
do if not range(vB7am46,0,1,96,96) | sys(vB7am46).
compute m454=concat("vB7am46=",string(vB7am46,f2)).
compute p454="vB7am46為不合理值或遺漏值".
end if.
Exec.

*vB7am47=0,1 96 .
do if not range(vB7am47,0,1,96,96) | sys(vB7am47).
compute m455=concat("vB7am47=",string(vB7am47,f2)).
compute p455="vB7am47為不合理值或遺漏值".
end if.
Exec.

*vB7am48=0,1 96 .
do if not range(vB7am48,0,1,96,96) | sys(vB7am48).
compute m456=concat("vB7am48=",string(vB7am48,f2)).
compute p456="vB7am48為不合理值或遺漏值".
end if.
Exec.

*vB7am49=0,1 96 .
do if not range(vB7am49,0,1,96,96) | sys(vB7am49).
compute m457=concat("vB7am49=",string(vB7am49,f2)).
compute p457="vB7am49為不合理值或遺漏值".
end if.
Exec.

*vB7am50=0,1 96 .
do if not range(vB7am50,0,1,96,96) | sys(vB7am50).
compute m458=concat("vB7am50=",string(vB7am50,f2)).
compute p458="vB7am50為不合理值或遺漏值".
end if.
Exec.

*vB7am51=0,1 96 .
do if not range(vB7am51,0,1,96,96) | sys(vB7am51).
compute m459=concat("vB7am51=",string(vB7am51,f2)).
compute p459="vB7am51為不合理值或遺漏值".
end if.
Exec.

*vB7am52=0,1 96 .
do if not range(vB7am52,0,1,96,96) | sys(vB7am52).
compute m460=concat("vB7am52=",string(vB7am52,f2)).
compute p460="vB7am52為不合理值或遺漏值".
end if.
Exec.

*vB7am53=0,1 96 .
do if not range(vB7am53,0,1,96,96) | sys(vB7am53).
compute m461=concat("vB7am53=",string(vB7am53,f2)).
compute p461="vB7am53為不合理值或遺漏值".
end if.
Exec.

*vB7am54=0,1 96 .
do if not range(vB7am54,0,1,96,96) | sys(vB7am54).
compute m462=concat("vB7am54=",string(vB7am54,f2)).
compute p462="vB7am54為不合理值或遺漏值".
end if.
Exec.

*vB7am88=0,1 96 .
do if not range(vB7am88,0,1,96,96) | sys(vB7am88).
compute m463=concat("vB7am88=",string(vB7am88,f2)).
compute p463="vB7am88為不合理值或遺漏值".
end if.
Exec.

*vB7=1,88 97,98 .
do if not range(vB7,1,88,97,98) | sys(vB7).
compute m464=concat("vB7=",string(vB7,f2)).
compute p464="vB7為不合理值或遺漏值".
end if.
Exec.

*vB8m01=0,1 .
do if not range(vB8m01,0,1) | sys(vB8m01).
compute m465=concat("vB8m01=",string(vB8m01,f2)).
compute p465="vB8m01為不合理值或遺漏值".
end if.
Exec.

*vB8m02=0,1 .
do if not range(vB8m02,0,1) | sys(vB8m02).
compute m466=concat("vB8m02=",string(vB8m02,f2)).
compute p466="vB8m02為不合理值或遺漏值".
end if.
Exec.

*vB8m03=0,1 .
do if not range(vB8m03,0,1) | sys(vB8m03).
compute m467=concat("vB8m03=",string(vB8m03,f2)).
compute p467="vB8m03為不合理值或遺漏值".
end if.
Exec.

*vB8m04=0,1 .
do if not range(vB8m04,0,1) | sys(vB8m04).
compute m468=concat("vB8m04=",string(vB8m04,f2)).
compute p468="vB8m04為不合理值或遺漏值".
end if.
Exec.

*vB8m05=0,1 .
do if not range(vB8m05,0,1) | sys(vB8m05).
compute m469=concat("vB8m05=",string(vB8m05,f2)).
compute p469="vB8m05為不合理值或遺漏值".
end if.
Exec.

*vB8m06=0,1 .
do if not range(vB8m06,0,1) | sys(vB8m06).
compute m470=concat("vB8m06=",string(vB8m06,f2)).
compute p470="vB8m06為不合理值或遺漏值".
end if.
Exec.

*vB8m07=0,1 .
do if not range(vB8m07,0,1) | sys(vB8m07).
compute m471=concat("vB8m07=",string(vB8m07,f2)).
compute p471="vB8m07為不合理值或遺漏值".
end if.
Exec.

*vB8m08=0,1 .
do if not range(vB8m08,0,1) | sys(vB8m08).
compute m472=concat("vB8m08=",string(vB8m08,f2)).
compute p472="vB8m08為不合理值或遺漏值".
end if.
Exec.

*vB8m09=0,1 .
do if not range(vB8m09,0,1) | sys(vB8m09).
compute m473=concat("vB8m09=",string(vB8m09,f2)).
compute p473="vB8m09為不合理值或遺漏值".
end if.
Exec.

*vB8m10=0,1 96 .
do if not range(vB8m10,0,1,96,96) | sys(vB8m10).
compute m474=concat("vB8m10=",string(vB8m10,f2)).
compute p474="vB8m10為不合理值或遺漏值".
end if.
Exec.

*vB8m88=0,1 96 .
do if not range(vB8m88,0,1,96,96) | sys(vB8m88).
compute m475=concat("vB8m88=",string(vB8m88,f2)).
compute p475="vB8m88為不合理值或遺漏值".
end if.
Exec.

*vI1=0,5 95 97,98 .
do if not range(vI1,0,5,95,95,97,98) | sys(vI1).
compute m476=concat("vI1=",string(vI1,f4)).
compute p476="vI1為不合理值或遺漏值".
end if.
Exec.

*vI2=1,2359 9797 9898 .
do if not range(vI2,1,2359,9797,9797,9898,9898) | sys(vI2).
compute m477=concat("vI2=",string(vI2,f5)).
compute p477="vI2為不合理值或遺漏值".
end if.
Exec.

*vI3=0,2 95 97,98 .
do if not range(vI3,0,2,95,95,97,98) | sys(vI3).
compute m478=concat("vI3=",string(vI3,f4)).
compute p478="vI3為不合理值或遺漏值".
end if.
Exec.

*vI4=1,2359 9797 9898 .
do if not range(vI4,1,2359,9797,9797,9898,9898) | sys(vI4).
compute m479=concat("vI4=",string(vI4,f5)).
compute p479="vI4為不合理值或遺漏值".
end if.
Exec.

*vCKI4=96 .
do if not range(vCKI4,96,96) | sys(vCKI4).
compute m480=concat("vCKI4=",string(vCKI4,f2)).
compute p480="vCKI4為不合理值或遺漏值".
end if.
Exec.

*vG1=0,7 95 97,98 .
do if not range(vG1,0,7,95,95,97,98) | sys(vG1).
compute m481=concat("vG1=",string(vG1,f4)).
compute p481="vG1為不合理值或遺漏值".
end if.
Exec.

*vG2=1,2359 9797 9898 .
do if not range(vG2,1,2359,9797,9797,9898,9898) | sys(vG2).
compute m482=concat("vG2=",string(vG2,f5)).
compute p482="vG2為不合理值或遺漏值".
end if.
Exec.

*vG3m01=0,1 .
do if not range(vG3m01,0,1) | sys(vG3m01).
compute m483=concat("vG3m01=",string(vG3m01,f2)).
compute p483="vG3m01為不合理值或遺漏值".
end if.
Exec.

*vG3m02=0,1 .
do if not range(vG3m02,0,1) | sys(vG3m02).
compute m484=concat("vG3m02=",string(vG3m02,f2)).
compute p484="vG3m02為不合理值或遺漏值".
end if.
Exec.

*vG3m03=0,1 .
do if not range(vG3m03,0,1) | sys(vG3m03).
compute m485=concat("vG3m03=",string(vG3m03,f2)).
compute p485="vG3m03為不合理值或遺漏值".
end if.
Exec.

*vG3m04=0,1 .
do if not range(vG3m04,0,1) | sys(vG3m04).
compute m486=concat("vG3m04=",string(vG3m04,f2)).
compute p486="vG3m04為不合理值或遺漏值".
end if.
Exec.

*vG3m05=0,1 .
do if not range(vG3m05,0,1) | sys(vG3m05).
compute m487=concat("vG3m05=",string(vG3m05,f2)).
compute p487="vG3m05為不合理值或遺漏值".
end if.
Exec.

*vG3m06=0,1 .
do if not range(vG3m06,0,1) | sys(vG3m06).
compute m488=concat("vG3m06=",string(vG3m06,f2)).
compute p488="vG3m06為不合理值或遺漏值".
end if.
Exec.

*vG3m07=0,1 .
do if not range(vG3m07,0,1) | sys(vG3m07).
compute m489=concat("vG3m07=",string(vG3m07,f2)).
compute p489="vG3m07為不合理值或遺漏值".
end if.
Exec.

*vG3m08=0,1 .
do if not range(vG3m08,0,1) | sys(vG3m08).
compute m490=concat("vG3m08=",string(vG3m08,f2)).
compute p490="vG3m08為不合理值或遺漏值".
end if.
Exec.

*vG3m09=0,1 .
do if not range(vG3m09,0,1) | sys(vG3m09).
compute m491=concat("vG3m09=",string(vG3m09,f2)).
compute p491="vG3m09為不合理值或遺漏值".
end if.
Exec.

*vG3m10=0,1 96 .
do if not range(vG3m10,0,1,96,96) | sys(vG3m10).
compute m492=concat("vG3m10=",string(vG3m10,f2)).
compute p492="vG3m10為不合理值或遺漏值".
end if.
Exec.

*vG3m11=0,1 96 .
do if not range(vG3m11,0,1,96,96) | sys(vG3m11).
compute m493=concat("vG3m11=",string(vG3m11,f2)).
compute p493="vG3m11為不合理值或遺漏值".
end if.
Exec.

*vG3m12=0,1 96 .
do if not range(vG3m12,0,1,96,96) | sys(vG3m12).
compute m494=concat("vG3m12=",string(vG3m12,f2)).
compute p494="vG3m12為不合理值或遺漏值".
end if.
Exec.

*vG3m13=0,1 96 .
do if not range(vG3m13,0,1,96,96) | sys(vG3m13).
compute m495=concat("vG3m13=",string(vG3m13,f2)).
compute p495="vG3m13為不合理值或遺漏值".
end if.
Exec.

*vG3m14=0,1 96 .
do if not range(vG3m14,0,1,96,96) | sys(vG3m14).
compute m496=concat("vG3m14=",string(vG3m14,f2)).
compute p496="vG3m14為不合理值或遺漏值".
end if.
Exec.

*vG3m15=0,1 96 .
do if not range(vG3m15,0,1,96,96) | sys(vG3m15).
compute m497=concat("vG3m15=",string(vG3m15,f2)).
compute p497="vG3m15為不合理值或遺漏值".
end if.
Exec.

*vG3m16=0,1 96 .
do if not range(vG3m16,0,1,96,96) | sys(vG3m16).
compute m498=concat("vG3m16=",string(vG3m16,f2)).
compute p498="vG3m16為不合理值或遺漏值".
end if.
Exec.

*vG3m18=0,1 96 .
do if not range(vG3m18,0,1,96,96) | sys(vG3m18).
compute m499=concat("vG3m18=",string(vG3m18,f2)).
compute p499="vG3m18為不合理值或遺漏值".
end if.
Exec.

*vG3m19=0,1 96 .
do if not range(vG3m19,0,1,96,96) | sys(vG3m19).
compute m500=concat("vG3m19=",string(vG3m19,f2)).
compute p500="vG3m19為不合理值或遺漏值".
end if.
Exec.

*vG3m20=0,1 96 .
do if not range(vG3m20,0,1,96,96) | sys(vG3m20).
compute m501=concat("vG3m20=",string(vG3m20,f2)).
compute p501="vG3m20為不合理值或遺漏值".
end if.
Exec.

*vG3m21=0,1 96 .
do if not range(vG3m21,0,1,96,96) | sys(vG3m21).
compute m502=concat("vG3m21=",string(vG3m21,f2)).
compute p502="vG3m21為不合理值或遺漏值".
end if.
Exec.

*vG3m22=0,1 96 .
do if not range(vG3m22,0,1,96,96) | sys(vG3m22).
compute m503=concat("vG3m22=",string(vG3m22,f2)).
compute p503="vG3m22為不合理值或遺漏值".
end if.
Exec.

*vG3m23=0,1 96 .
do if not range(vG3m23,0,1,96,96) | sys(vG3m23).
compute m504=concat("vG3m23=",string(vG3m23,f2)).
compute p504="vG3m23為不合理值或遺漏值".
end if.
Exec.

*vG3m24=0,1 96 .
do if not range(vG3m24,0,1,96,96) | sys(vG3m24).
compute m505=concat("vG3m24=",string(vG3m24,f2)).
compute p505="vG3m24為不合理值或遺漏值".
end if.
Exec.

*vG3m25=0,1 96 .
do if not range(vG3m25,0,1,96,96) | sys(vG3m25).
compute m506=concat("vG3m25=",string(vG3m25,f2)).
compute p506="vG3m25為不合理值或遺漏值".
end if.
Exec.

*vG3m26=0,1 96 .
do if not range(vG3m26,0,1,96,96) | sys(vG3m26).
compute m507=concat("vG3m26=",string(vG3m26,f2)).
compute p507="vG3m26為不合理值或遺漏值".
end if.
Exec.

*vG3m27=0,1 96 .
do if not range(vG3m27,0,1,96,96) | sys(vG3m27).
compute m508=concat("vG3m27=",string(vG3m27,f2)).
compute p508="vG3m27為不合理值或遺漏值".
end if.
Exec.

*vG3m28=0,1 96 .
do if not range(vG3m28,0,1,96,96) | sys(vG3m28).
compute m509=concat("vG3m28=",string(vG3m28,f2)).
compute p509="vG3m28為不合理值或遺漏值".
end if.
Exec.

*vG3m29=0,1 96 .
do if not range(vG3m29,0,1,96,96) | sys(vG3m29).
compute m510=concat("vG3m29=",string(vG3m29,f2)).
compute p510="vG3m29為不合理值或遺漏值".
end if.
Exec.

*vG3m30=0,1 96 .
do if not range(vG3m30,0,1,96,96) | sys(vG3m30).
compute m511=concat("vG3m30=",string(vG3m30,f2)).
compute p511="vG3m30為不合理值或遺漏值".
end if.
Exec.

*vG3m31=0,1 96 .
do if not range(vG3m31,0,1,96,96) | sys(vG3m31).
compute m512=concat("vG3m31=",string(vG3m31,f2)).
compute p512="vG3m31為不合理值或遺漏值".
end if.
Exec.

*vG3m32=0,1 96 .
do if not range(vG3m32,0,1,96,96) | sys(vG3m32).
compute m513=concat("vG3m32=",string(vG3m32,f2)).
compute p513="vG3m32為不合理值或遺漏值".
end if.
Exec.

*vG3m33=0,1 96 .
do if not range(vG3m33,0,1,96,96) | sys(vG3m33).
compute m514=concat("vG3m33=",string(vG3m33,f2)).
compute p514="vG3m33為不合理值或遺漏值".
end if.
Exec.

*vG3m88=0,1 96 .
do if not range(vG3m88,0,1,96,96) | sys(vG3m88).
compute m515=concat("vG3m88=",string(vG3m88,f2)).
compute p515="vG3m88為不合理值或遺漏值".
end if.
Exec.

*vF0=1,89 90 97,98 .
do if not range(vF0,1,89,90,90,97,98) | sys(vF0).
compute m516=concat("vF0=",string(vF0,f2)).
compute p516="vF0為不合理值或遺漏值".
end if.
Exec.

*vF1=0.5,31 95 97,98 .
do if not range(vF1,0.5,31,95,95,97,98) | sys(vF1).
compute m517=concat("vF1=",string(vF1,f5)).
compute p517="vF1為不合理值或遺漏值".
end if.
Exec.

*vF2=1,2359 9797 9898 .
do if not range(vF2,1,2359,9797,9797,9898,9898) | sys(vF2).
compute m518=concat("vF2=",string(vF2,f5)).
compute p518="vF2為不合理值或遺漏值".
end if.
Exec.

*vF3=0.5,31 95 97,98 .
do if not range(vF3,0.5,31,95,95,97,98) | sys(vF3).
compute m519=concat("vF3=",string(vF3,f5)).
compute p519="vF3為不合理值或遺漏值".
end if.
Exec.

*vF4=1,2359 9797 9898 .
do if not range(vF4,1,2359,9797,9797,9898,9898) | sys(vF4).
compute m520=concat("vF4=",string(vF4,f5)).
compute p520="vF4為不合理值或遺漏值".
end if.
Exec.

*vF5m01=0,1 .
do if not range(vF5m01,0,1) | sys(vF5m01).
compute m521=concat("vF5m01=",string(vF5m01,f2)).
compute p521="vF5m01為不合理值或遺漏值".
end if.
Exec.

*vF5m02=0,1 .
do if not range(vF5m02,0,1) | sys(vF5m02).
compute m522=concat("vF5m02=",string(vF5m02,f2)).
compute p522="vF5m02為不合理值或遺漏值".
end if.
Exec.

*vF5m03=0,1 .
do if not range(vF5m03,0,1) | sys(vF5m03).
compute m523=concat("vF5m03=",string(vF5m03,f2)).
compute p523="vF5m03為不合理值或遺漏值".
end if.
Exec.

*vF5m04=0,1 .
do if not range(vF5m04,0,1) | sys(vF5m04).
compute m524=concat("vF5m04=",string(vF5m04,f2)).
compute p524="vF5m04為不合理值或遺漏值".
end if.
Exec.

*vF5m05=0,1 .
do if not range(vF5m05,0,1) | sys(vF5m05).
compute m525=concat("vF5m05=",string(vF5m05,f2)).
compute p525="vF5m05為不合理值或遺漏值".
end if.
Exec.

*vF5m06=0,1 .
do if not range(vF5m06,0,1) | sys(vF5m06).
compute m526=concat("vF5m06=",string(vF5m06,f2)).
compute p526="vF5m06為不合理值或遺漏值".
end if.
Exec.

*vF5m07=0,1 .
do if not range(vF5m07,0,1) | sys(vF5m07).
compute m527=concat("vF5m07=",string(vF5m07,f2)).
compute p527="vF5m07為不合理值或遺漏值".
end if.
Exec.

*vF5m08=0,1 .
do if not range(vF5m08,0,1) | sys(vF5m08).
compute m528=concat("vF5m08=",string(vF5m08,f2)).
compute p528="vF5m08為不合理值或遺漏值".
end if.
Exec.

*vF5m88=0,1 96 .
do if not range(vF5m88,0,1,96,96) | sys(vF5m88).
compute m529=concat("vF5m88=",string(vF5m88,f2)).
compute p529="vF5m88為不合理值或遺漏值".
end if.
Exec.

*vC1=0,7 95 97,98 .
do if not range(vC1,0,7,95,95,97,98) | sys(vC1).
compute m530=concat("vC1=",string(vC1,f4)).
compute p530="vC1為不合理值或遺漏值".
end if.
Exec.

*vC2=1,2359 9797 9898 .
do if not range(vC2,1,2359,9797,9797,9898,9898) | sys(vC2).
compute m531=concat("vC2=",string(vC2,f5)).
compute p531="vC2為不合理值或遺漏值".
end if.
Exec.

*vC3m01=0,1 .
do if not range(vC3m01,0,1) | sys(vC3m01).
compute m532=concat("vC3m01=",string(vC3m01,f2)).
compute p532="vC3m01為不合理值或遺漏值".
end if.
Exec.

*vC3m02=0,1 .
do if not range(vC3m02,0,1) | sys(vC3m02).
compute m533=concat("vC3m02=",string(vC3m02,f2)).
compute p533="vC3m02為不合理值或遺漏值".
end if.
Exec.

*vC3m03=0,1 .
do if not range(vC3m03,0,1) | sys(vC3m03).
compute m534=concat("vC3m03=",string(vC3m03,f2)).
compute p534="vC3m03為不合理值或遺漏值".
end if.
Exec.

*vC3m04=0,1 .
do if not range(vC3m04,0,1) | sys(vC3m04).
compute m535=concat("vC3m04=",string(vC3m04,f2)).
compute p535="vC3m04為不合理值或遺漏值".
end if.
Exec.

*vC3m05=0,1 .
do if not range(vC3m05,0,1) | sys(vC3m05).
compute m536=concat("vC3m05=",string(vC3m05,f2)).
compute p536="vC3m05為不合理值或遺漏值".
end if.
Exec.

*vC3m06=0,1 .
do if not range(vC3m06,0,1) | sys(vC3m06).
compute m537=concat("vC3m06=",string(vC3m06,f2)).
compute p537="vC3m06為不合理值或遺漏值".
end if.
Exec.

*vC3m07=0,1 .
do if not range(vC3m07,0,1) | sys(vC3m07).
compute m538=concat("vC3m07=",string(vC3m07,f2)).
compute p538="vC3m07為不合理值或遺漏值".
end if.
Exec.

*vC3m08=0,1 .
do if not range(vC3m08,0,1) | sys(vC3m08).
compute m539=concat("vC3m08=",string(vC3m08,f2)).
compute p539="vC3m08為不合理值或遺漏值".
end if.
Exec.

*vC3m09=0,1 .
do if not range(vC3m09,0,1) | sys(vC3m09).
compute m540=concat("vC3m09=",string(vC3m09,f2)).
compute p540="vC3m09為不合理值或遺漏值".
end if.
Exec.

*vC3m10=0,1 96 .
do if not range(vC3m10,0,1,96,96) | sys(vC3m10).
compute m541=concat("vC3m10=",string(vC3m10,f2)).
compute p541="vC3m10為不合理值或遺漏值".
end if.
Exec.

*vC3m11=0,1 96 .
do if not range(vC3m11,0,1,96,96) | sys(vC3m11).
compute m542=concat("vC3m11=",string(vC3m11,f2)).
compute p542="vC3m11為不合理值或遺漏值".
end if.
Exec.

*vC3m88=0,1 96 .
do if not range(vC3m88,0,1,96,96) | sys(vC3m88).
compute m543=concat("vC3m88=",string(vC3m88,f2)).
compute p543="vC3m88為不合理值或遺漏值".
end if.
Exec.

*vJ4_1=997,998 .
do if not range(vJ4_1,997,998) | sys(vJ4_1).
compute m544=concat("vJ4_1=",string(vJ4_1,f4)).
compute p544="vJ4_1為不合理值或遺漏值".
end if.
Exec.

*vJ4_2=1 997,998 .
do if not range(vJ4_2,1,1,997,998) | sys(vJ4_2).
compute m545=concat("vJ4_2=",string(vJ4_2,f4)).
compute p545="vJ4_2為不合理值或遺漏值".
end if.
Exec.

*vJ4_3=997,998 .
do if not range(vJ4_3,997,998) | sys(vJ4_3).
compute m546=concat("vJ4_3=",string(vJ4_3,f4)).
compute p546="vJ4_3為不合理值或遺漏值".
end if.
Exec.

*vJ4_4=1 997,998 .
do if not range(vJ4_4,1,1,997,998) | sys(vJ4_4).
compute m547=concat("vJ4_4=",string(vJ4_4,f4)).
compute p547="vJ4_4為不合理值或遺漏值".
end if.
Exec.

*vJ4_5=1 997,998 .
do if not range(vJ4_5,1,1,997,998) | sys(vJ4_5).
compute m548=concat("vJ4_5=",string(vJ4_5,f4)).
compute p548="vJ4_5為不合理值或遺漏值".
end if.
Exec.

*vJB1m01=0,1 .
do if not range(vJB1m01,0,1) | sys(vJB1m01).
compute m549=concat("vJB1m01=",string(vJB1m01,f2)).
compute p549="vJB1m01為不合理值或遺漏值".
end if.
Exec.

*vJB1m02=0,1 .
do if not range(vJB1m02,0,1) | sys(vJB1m02).
compute m550=concat("vJB1m02=",string(vJB1m02,f2)).
compute p550="vJB1m02為不合理值或遺漏值".
end if.
Exec.

*vJB1m03=0,1 .
do if not range(vJB1m03,0,1) | sys(vJB1m03).
compute m551=concat("vJB1m03=",string(vJB1m03,f2)).
compute p551="vJB1m03為不合理值或遺漏值".
end if.
Exec.

*vJB1m04=0,1 .
do if not range(vJB1m04,0,1) | sys(vJB1m04).
compute m552=concat("vJB1m04=",string(vJB1m04,f2)).
compute p552="vJB1m04為不合理值或遺漏值".
end if.
Exec.

*vJB1m05=0,1 .
do if not range(vJB1m05,0,1) | sys(vJB1m05).
compute m553=concat("vJB1m05=",string(vJB1m05,f2)).
compute p553="vJB1m05為不合理值或遺漏值".
end if.
Exec.

*vJB1m06=0,1 .
do if not range(vJB1m06,0,1) | sys(vJB1m06).
compute m554=concat("vJB1m06=",string(vJB1m06,f2)).
compute p554="vJB1m06為不合理值或遺漏值".
end if.
Exec.

*vJB1m07=0,1 .
do if not range(vJB1m07,0,1) | sys(vJB1m07).
compute m555=concat("vJB1m07=",string(vJB1m07,f2)).
compute p555="vJB1m07為不合理值或遺漏值".
end if.
Exec.

*vJB1m08=0,1 .
do if not range(vJB1m08,0,1) | sys(vJB1m08).
compute m556=concat("vJB1m08=",string(vJB1m08,f2)).
compute p556="vJB1m08為不合理值或遺漏值".
end if.
Exec.

*vJB1m09=0,1 .
do if not range(vJB1m09,0,1) | sys(vJB1m09).
compute m557=concat("vJB1m09=",string(vJB1m09,f2)).
compute p557="vJB1m09為不合理值或遺漏值".
end if.
Exec.

*vJB1m10=0,1 96 .
do if not range(vJB1m10,0,1,96,96) | sys(vJB1m10).
compute m558=concat("vJB1m10=",string(vJB1m10,f2)).
compute p558="vJB1m10為不合理值或遺漏值".
end if.
Exec.

*vJB1m11=0,1 96 .
do if not range(vJB1m11,0,1,96,96) | sys(vJB1m11).
compute m559=concat("vJB1m11=",string(vJB1m11,f2)).
compute p559="vJB1m11為不合理值或遺漏值".
end if.
Exec.

*vJB1m88=0,1 96 .
do if not range(vJB1m88,0,1,96,96) | sys(vJB1m88).
compute m560=concat("vJB1m88=",string(vJB1m88,f2)).
compute p560="vJB1m88為不合理值或遺漏值".
end if.
Exec.

*vJB1m90=0,1 96 .
do if not range(vJB1m90,0,1,96,96) | sys(vJB1m90).
compute m561=concat("vJB1m90=",string(vJB1m90,f2)).
compute p561="vJB1m90為不合理值或遺漏值".
end if.
Exec.

*vJB2m01=0,1 .
do if not range(vJB2m01,0,1) | sys(vJB2m01).
compute m562=concat("vJB2m01=",string(vJB2m01,f2)).
compute p562="vJB2m01為不合理值或遺漏值".
end if.
Exec.

*vJB2m02=0,1 .
do if not range(vJB2m02,0,1) | sys(vJB2m02).
compute m563=concat("vJB2m02=",string(vJB2m02,f2)).
compute p563="vJB2m02為不合理值或遺漏值".
end if.
Exec.

*vJB2m03=0,1 .
do if not range(vJB2m03,0,1) | sys(vJB2m03).
compute m564=concat("vJB2m03=",string(vJB2m03,f2)).
compute p564="vJB2m03為不合理值或遺漏值".
end if.
Exec.

*vJB2m04=0,1 .
do if not range(vJB2m04,0,1) | sys(vJB2m04).
compute m565=concat("vJB2m04=",string(vJB2m04,f2)).
compute p565="vJB2m04為不合理值或遺漏值".
end if.
Exec.

*vJB2m05=0,1 .
do if not range(vJB2m05,0,1) | sys(vJB2m05).
compute m566=concat("vJB2m05=",string(vJB2m05,f2)).
compute p566="vJB2m05為不合理值或遺漏值".
end if.
Exec.

*vJB2m06=0,1 .
do if not range(vJB2m06,0,1) | sys(vJB2m06).
compute m567=concat("vJB2m06=",string(vJB2m06,f2)).
compute p567="vJB2m06為不合理值或遺漏值".
end if.
Exec.

*vJB2m07=0,1 .
do if not range(vJB2m07,0,1) | sys(vJB2m07).
compute m568=concat("vJB2m07=",string(vJB2m07,f2)).
compute p568="vJB2m07為不合理值或遺漏值".
end if.
Exec.

*vJB2m88=0,1 96 .
do if not range(vJB2m88,0,1,96,96) | sys(vJB2m88).
compute m569=concat("vJB2m88=",string(vJB2m88,f2)).
compute p569="vJB2m88為不合理值或遺漏值".
end if.
Exec.

*vJB2m90=0,1 96 .
do if not range(vJB2m90,0,1,96,96) | sys(vJB2m90).
compute m570=concat("vJB2m90=",string(vJB2m90,f2)).
compute p570="vJB2m90為不合理值或遺漏值".
end if.
Exec.

*vH1=0,990 991 997,998 .
do if not range(vH1,0,990,991,991,997,998) | sys(vH1).
compute m571=concat("vH1=",string(vH1,f4)).
compute p571="vH1為不合理值或遺漏值".
end if.
Exec.

*vH2=1,5 97 997,998 .
do if not range(vH2,1,5,97,97,997,998) | sys(vH2).
compute m572=concat("vH2=",string(vH2,f2)).
compute p572="vH2為不合理值或遺漏值".
end if.
Exec.

*vH3=1,5 97,98 .
do if not range(vH3,1,5,97,98) | sys(vH3).
compute m573=concat("vH3=",string(vH3,f2)).
compute p573="vH3為不合理值或遺漏值".
end if.
Exec.

*vH4=0,990 991 997,998 .
do if not range(vH4,0,990,991,991,997,998) | sys(vH4).
compute m574=concat("vH4=",string(vH4,f4)).
compute p574="vH4為不合理值或遺漏值".
end if.
Exec.

*vH5=1,5 97 997,998 .
do if not range(vH5,1,5,97,97,997,998) | sys(vH5).
compute m575=concat("vH5=",string(vH5,f2)).
compute p575="vH5為不合理值或遺漏值".
end if.
Exec.

*vH6=1,5 97,98 .
do if not range(vH6,1,5,97,98) | sys(vH6).
compute m576=concat("vH6=",string(vH6,f2)).
compute p576="vH6為不合理值或遺漏值".
end if.
Exec.

*vH7=0,990 991 997,998 .
do if not range(vH7,0,990,991,991,997,998) | sys(vH7).
compute m577=concat("vH7=",string(vH7,f4)).
compute p577="vH7為不合理值或遺漏值".
end if.
Exec.

*vH7_1=0,990 991 997,998 .
do if not range(vH7_1,0,990,991,991,997,998) | sys(vH7_1).
compute m578=concat("vH7_1=",string(vH7_1,f4)).
compute p578="vH7_1為不合理值或遺漏值".
end if.
Exec.

*vH7_2=0,990 991 997,998 .
do if not range(vH7_2,0,990,991,991,997,998) | sys(vH7_2).
compute m579=concat("vH7_2=",string(vH7_2,f4)).
compute p579="vH7_2為不合理值或遺漏值".
end if.
Exec.

*vH7_3=0,990 991 997,998 .
do if not range(vH7_3,0,990,991,991,997,998) | sys(vH7_3).
compute m580=concat("vH7_3=",string(vH7_3,f4)).
compute p580="vH7_3為不合理值或遺漏值".
end if.
Exec.

*vCKH7=20260615000000,20260915000000 .
do if not range(vCKH7,20260615000000,20260915000000) | sys(vCKH7).
compute m581=concat("vCKH7=",string(vCKH7,f14)).
compute p581="vCKH7為不合理值或遺漏值".
end if.
Exec.

*vCKH7_1=20260615000000,20260915000000 .
do if not range(vCKH7_1,20260615000000,20260915000000) | sys(vCKH7_1).
compute m582=concat("vCKH7_1=",string(vCKH7_1,f14)).
compute p582="vCKH7_1為不合理值或遺漏值".
end if.
Exec.

*vCKH7_2=20260615000000,20260915000000 .
do if not range(vCKH7_2,20260615000000,20260915000000) | sys(vCKH7_2).
compute m583=concat("vCKH7_2=",string(vCKH7_2,f14)).
compute p583="vCKH7_2為不合理值或遺漏值".
end if.
Exec.

*vCKH7_3=20260615000000,20260915000000 .
do if not range(vCKH7_3,20260615000000,20260915000000) | sys(vCKH7_3).
compute m584=concat("vCKH7_3=",string(vCKH7_3,f14)).
compute p584="vCKH7_3為不合理值或遺漏值".
end if.
Exec.

*vH8=0,500 991 997,998 .
do if not range(vH8,0,500,991,991,997,998) | sys(vH8).
compute m585=concat("vH8=",string(vH8,f4)).
compute p585="vH8為不合理值或遺漏值".
end if.
Exec.

*vM1g1=0,140 997,998 .
do if not range(vM1g1,0,140,997,998) | sys(vM1g1).
compute m586=concat("vM1g1=",string(vM1g1,f4)).
compute p586="vM1g1為不合理值或遺漏值".
end if.
Exec.

*vM1g2=0,59 97,98 .
do if not range(vM1g2,0,59,97,98) | sys(vM1g2).
compute m587=concat("vM1g2=",string(vM1g2,f3)).
compute p587="vM1g2為不合理值或遺漏值".
end if.
Exec.

*vM2m01=0,1 .
do if not range(vM2m01,0,1) | sys(vM2m01).
compute m588=concat("vM2m01=",string(vM2m01,f2)).
compute p588="vM2m01為不合理值或遺漏值".
end if.
Exec.

*vM2m02=0,1 .
do if not range(vM2m02,0,1) | sys(vM2m02).
compute m589=concat("vM2m02=",string(vM2m02,f2)).
compute p589="vM2m02為不合理值或遺漏值".
end if.
Exec.

*vM2m03=0,1 .
do if not range(vM2m03,0,1) | sys(vM2m03).
compute m590=concat("vM2m03=",string(vM2m03,f2)).
compute p590="vM2m03為不合理值或遺漏值".
end if.
Exec.

*vM2m04=0,1 .
do if not range(vM2m04,0,1) | sys(vM2m04).
compute m591=concat("vM2m04=",string(vM2m04,f2)).
compute p591="vM2m04為不合理值或遺漏值".
end if.
Exec.

*vM2m05=0,1 .
do if not range(vM2m05,0,1) | sys(vM2m05).
compute m592=concat("vM2m05=",string(vM2m05,f2)).
compute p592="vM2m05為不合理值或遺漏值".
end if.
Exec.

*vM2m06=0,1 .
do if not range(vM2m06,0,1) | sys(vM2m06).
compute m593=concat("vM2m06=",string(vM2m06,f2)).
compute p593="vM2m06為不合理值或遺漏值".
end if.
Exec.

*vM2m07=0,1 .
do if not range(vM2m07,0,1) | sys(vM2m07).
compute m594=concat("vM2m07=",string(vM2m07,f2)).
compute p594="vM2m07為不合理值或遺漏值".
end if.
Exec.

*vM2m08=0,1 .
do if not range(vM2m08,0,1) | sys(vM2m08).
compute m595=concat("vM2m08=",string(vM2m08,f2)).
compute p595="vM2m08為不合理值或遺漏值".
end if.
Exec.

*vM2m09=0,1 .
do if not range(vM2m09,0,1) | sys(vM2m09).
compute m596=concat("vM2m09=",string(vM2m09,f2)).
compute p596="vM2m09為不合理值或遺漏值".
end if.
Exec.

*vM2m10=0,1 96 .
do if not range(vM2m10,0,1,96,96) | sys(vM2m10).
compute m597=concat("vM2m10=",string(vM2m10,f2)).
compute p597="vM2m10為不合理值或遺漏值".
end if.
Exec.

*vM2m11=0,1 96 .
do if not range(vM2m11,0,1,96,96) | sys(vM2m11).
compute m598=concat("vM2m11=",string(vM2m11,f2)).
compute p598="vM2m11為不合理值或遺漏值".
end if.
Exec.

*vM2m12=0,1 96 .
do if not range(vM2m12,0,1,96,96) | sys(vM2m12).
compute m599=concat("vM2m12=",string(vM2m12,f2)).
compute p599="vM2m12為不合理值或遺漏值".
end if.
Exec.

*vM2m13=0,1 96 .
do if not range(vM2m13,0,1,96,96) | sys(vM2m13).
compute m600=concat("vM2m13=",string(vM2m13,f2)).
compute p600="vM2m13為不合理值或遺漏值".
end if.
Exec.

*vM2m14=0,1 96 .
do if not range(vM2m14,0,1,96,96) | sys(vM2m14).
compute m601=concat("vM2m14=",string(vM2m14,f2)).
compute p601="vM2m14為不合理值或遺漏值".
end if.
Exec.

*vM2m15=0,1 96 .
do if not range(vM2m15,0,1,96,96) | sys(vM2m15).
compute m602=concat("vM2m15=",string(vM2m15,f2)).
compute p602="vM2m15為不合理值或遺漏值".
end if.
Exec.

*vM2m16=0,1 96 .
do if not range(vM2m16,0,1,96,96) | sys(vM2m16).
compute m603=concat("vM2m16=",string(vM2m16,f2)).
compute p603="vM2m16為不合理值或遺漏值".
end if.
Exec.

*vM2m88=0,1 96 .
do if not range(vM2m88,0,1,96,96) | sys(vM2m88).
compute m604=concat("vM2m88=",string(vM2m88,f2)).
compute p604="vM2m88為不合理值或遺漏值".
end if.
Exec.

*vM3m01=0,1 .
do if not range(vM3m01,0,1) | sys(vM3m01).
compute m605=concat("vM3m01=",string(vM3m01,f2)).
compute p605="vM3m01為不合理值或遺漏值".
end if.
Exec.

*vM3m02=0,1 .
do if not range(vM3m02,0,1) | sys(vM3m02).
compute m606=concat("vM3m02=",string(vM3m02,f2)).
compute p606="vM3m02為不合理值或遺漏值".
end if.
Exec.

*vM3m03=0,1 .
do if not range(vM3m03,0,1) | sys(vM3m03).
compute m607=concat("vM3m03=",string(vM3m03,f2)).
compute p607="vM3m03為不合理值或遺漏值".
end if.
Exec.

*vM3m04=0,1 .
do if not range(vM3m04,0,1) | sys(vM3m04).
compute m608=concat("vM3m04=",string(vM3m04,f2)).
compute p608="vM3m04為不合理值或遺漏值".
end if.
Exec.

*vM3m05=0,1 .
do if not range(vM3m05,0,1) | sys(vM3m05).
compute m609=concat("vM3m05=",string(vM3m05,f2)).
compute p609="vM3m05為不合理值或遺漏值".
end if.
Exec.

*vM3m06=0,1 .
do if not range(vM3m06,0,1) | sys(vM3m06).
compute m610=concat("vM3m06=",string(vM3m06,f2)).
compute p610="vM3m06為不合理值或遺漏值".
end if.
Exec.

*vM3m07=0,1 .
do if not range(vM3m07,0,1) | sys(vM3m07).
compute m611=concat("vM3m07=",string(vM3m07,f2)).
compute p611="vM3m07為不合理值或遺漏值".
end if.
Exec.

*vM3m08=0,1 .
do if not range(vM3m08,0,1) | sys(vM3m08).
compute m612=concat("vM3m08=",string(vM3m08,f2)).
compute p612="vM3m08為不合理值或遺漏值".
end if.
Exec.

*vM3m09=0,1 .
do if not range(vM3m09,0,1) | sys(vM3m09).
compute m613=concat("vM3m09=",string(vM3m09,f2)).
compute p613="vM3m09為不合理值或遺漏值".
end if.
Exec.

*vM3m10=0,1 96 .
do if not range(vM3m10,0,1,96,96) | sys(vM3m10).
compute m614=concat("vM3m10=",string(vM3m10,f2)).
compute p614="vM3m10為不合理值或遺漏值".
end if.
Exec.

*vM3m11=0,1 96 .
do if not range(vM3m11,0,1,96,96) | sys(vM3m11).
compute m615=concat("vM3m11=",string(vM3m11,f2)).
compute p615="vM3m11為不合理值或遺漏值".
end if.
Exec.

*vM3m12=0,1 96 .
do if not range(vM3m12,0,1,96,96) | sys(vM3m12).
compute m616=concat("vM3m12=",string(vM3m12,f2)).
compute p616="vM3m12為不合理值或遺漏值".
end if.
Exec.

*vM3m13=0,1 96 .
do if not range(vM3m13,0,1,96,96) | sys(vM3m13).
compute m617=concat("vM3m13=",string(vM3m13,f2)).
compute p617="vM3m13為不合理值或遺漏值".
end if.
Exec.

*vM3m88=0,1 96 .
do if not range(vM3m88,0,1,96,96) | sys(vM3m88).
compute m618=concat("vM3m88=",string(vM3m88,f2)).
compute p618="vM3m88為不合理值或遺漏值".
end if.
Exec.

*vM4sM4=0,1 96 .
do if not range(vM4sM4,0,1,96,96) | sys(vM4sM4).
compute m619=concat("vM4sM4=",string(vM4sM4,f2)).
compute p619="vM4sM4為不合理值或遺漏值".
end if.
Exec.

*vM4sM5=0,1 96 .
do if not range(vM4sM5,0,1,96,96) | sys(vM4sM5).
compute m620=concat("vM4sM5=",string(vM4sM5,f2)).
compute p620="vM4sM5為不合理值或遺漏值".
end if.
Exec.

*vM4sM6=0,1 96 .
do if not range(vM4sM6,0,1,96,96) | sys(vM4sM6).
compute m621=concat("vM4sM6=",string(vM4sM6,f2)).
compute p621="vM4sM6為不合理值或遺漏值".
end if.
Exec.

*vN1sN1=1,4 97,98 .
do if not range(vN1sN1,1,4,97,98) | sys(vN1sN1).
compute m622=concat("vN1sN1=",string(vN1sN1,f2)).
compute p622="vN1sN1為不合理值或遺漏值".
end if.
Exec.

*vN1sN2=1,4 97,98 .
do if not range(vN1sN2,1,4,97,98) | sys(vN1sN2).
compute m623=concat("vN1sN2=",string(vN1sN2,f2)).
compute p623="vN1sN2為不合理值或遺漏值".
end if.
Exec.

*vN1sN3=1,4 97,98 .
do if not range(vN1sN3,1,4,97,98) | sys(vN1sN3).
compute m624=concat("vN1sN3=",string(vN1sN3,f2)).
compute p624="vN1sN3為不合理值或遺漏值".
end if.
Exec.

*vN1sN4=1,4 97,98 .
do if not range(vN1sN4,1,4,97,98) | sys(vN1sN4).
compute m625=concat("vN1sN4=",string(vN1sN4,f2)).
compute p625="vN1sN4為不合理值或遺漏值".
end if.
Exec.

*vN1sN5=1,4 97,98 .
do if not range(vN1sN5,1,4,97,98) | sys(vN1sN5).
compute m626=concat("vN1sN5=",string(vN1sN5,f2)).
compute p626="vN1sN5為不合理值或遺漏值".
end if.
Exec.

*vN6sN6=1,4 97,98 .
do if not range(vN6sN6,1,4,97,98) | sys(vN6sN6).
compute m627=concat("vN6sN6=",string(vN6sN6,f2)).
compute p627="vN6sN6為不合理值或遺漏值".
end if.
Exec.

*vN6sN7=1,4 97,98 .
do if not range(vN6sN7,1,4,97,98) | sys(vN6sN7).
compute m628=concat("vN6sN7=",string(vN6sN7,f2)).
compute p628="vN6sN7為不合理值或遺漏值".
end if.
Exec.

*vN6sN8=1,4 97,98 .
do if not range(vN6sN8,1,4,97,98) | sys(vN6sN8).
compute m629=concat("vN6sN8=",string(vN6sN8,f2)).
compute p629="vN6sN8為不合理值或遺漏值".
end if.
Exec.

*vN6sN9=1,4 97,98 .
do if not range(vN6sN9,1,4,97,98) | sys(vN6sN9).
compute m630=concat("vN6sN9=",string(vN6sN9,f2)).
compute p630="vN6sN9為不合理值或遺漏值".
end if.
Exec.

*vN6sN10=1,4 97,98 .
do if not range(vN6sN10,1,4,97,98) | sys(vN6sN10).
compute m631=concat("vN6sN10=",string(vN6sN10,f2)).
compute p631="vN6sN10為不合理值或遺漏值".
end if.
Exec.

*vN11sN11=1,5 97,98 .
do if not range(vN11sN11,1,5,97,98) | sys(vN11sN11).
compute m632=concat("vN11sN11=",string(vN11sN11,f2)).
compute p632="vN11sN11為不合理值或遺漏值".
end if.
Exec.

*vN11sN12=1,5 97,98 .
do if not range(vN11sN12,1,5,97,98) | sys(vN11sN12).
compute m633=concat("vN11sN12=",string(vN11sN12,f2)).
compute p633="vN11sN12為不合理值或遺漏值".
end if.
Exec.

*vN11sN13=1,5 97,98 .
do if not range(vN11sN13,1,5,97,98) | sys(vN11sN13).
compute m634=concat("vN11sN13=",string(vN11sN13,f2)).
compute p634="vN11sN13為不合理值或遺漏值".
end if.
Exec.

*vN11sN14=1,5 97,98 .
do if not range(vN11sN14,1,5,97,98) | sys(vN11sN14).
compute m635=concat("vN11sN14=",string(vN11sN14,f2)).
compute p635="vN11sN14為不合理值或遺漏值".
end if.
Exec.

*vN11sN15=1,5 97,98 .
do if not range(vN11sN15,1,5,97,98) | sys(vN11sN15).
compute m636=concat("vN11sN15=",string(vN11sN15,f2)).
compute p636="vN11sN15為不合理值或遺漏值".
end if.
Exec.

*vN11sN16=1,5 97,98 .
do if not range(vN11sN16,1,5,97,98) | sys(vN11sN16).
compute m637=concat("vN11sN16=",string(vN11sN16,f2)).
compute p637="vN11sN16為不合理值或遺漏值".
end if.
Exec.

*vN17=1,5 90 97,98 .
do if not range(vN17,1,5,90,90,97,98) | sys(vN17).
compute m638=concat("vN17=",string(vN17,f2)).
compute p638="vN17為不合理值或遺漏值".
end if.
Exec.

*vN18sN18=1,5 97,98 .
do if not range(vN18sN18,1,5,97,98) | sys(vN18sN18).
compute m639=concat("vN18sN18=",string(vN18sN18,f2)).
compute p639="vN18sN18為不合理值或遺漏值".
end if.
Exec.

*vN18sN19=1,5 97,98 .
do if not range(vN18sN19,1,5,97,98) | sys(vN18sN19).
compute m640=concat("vN18sN19=",string(vN18sN19,f2)).
compute p640="vN18sN19為不合理值或遺漏值".
end if.
Exec.

*vN18sN20=1,5 97,98 .
do if not range(vN18sN20,1,5,97,98) | sys(vN18sN20).
compute m641=concat("vN18sN20=",string(vN18sN20,f2)).
compute p641="vN18sN20為不合理值或遺漏值".
end if.
Exec.

*vN21sN21=1,5 97,98 .
do if not range(vN21sN21,1,5,97,98) | sys(vN21sN21).
compute m642=concat("vN21sN21=",string(vN21sN21,f2)).
compute p642="vN21sN21為不合理值或遺漏值".
end if.
Exec.

*vN21sN22=1,5 97,98 .
do if not range(vN21sN22,1,5,97,98) | sys(vN21sN22).
compute m643=concat("vN21sN22=",string(vN21sN22,f2)).
compute p643="vN21sN22為不合理值或遺漏值".
end if.
Exec.

*vN23=1,5 97,98 .
do if not range(vN23,1,5,97,98) | sys(vN23).
compute m644=concat("vN23=",string(vN23,f2)).
compute p644="vN23為不合理值或遺漏值".
end if.
Exec.

*vN24=1,88 97,98 .
do if not range(vN24,1,88,97,98) | sys(vN24).
compute m645=concat("vN24=",string(vN24,f2)).
compute p645="vN24為不合理值或遺漏值".
end if.
Exec.

*vN25=1,5 90 97,98 .
do if not range(vN25,1,5,90,90,97,98) | sys(vN25).
compute m646=concat("vN25=",string(vN25,f2)).
compute p646="vN25為不合理值或遺漏值".
end if.
Exec.

*vN26=1,5 97,98 .
do if not range(vN26,1,5,97,98) | sys(vN26).
compute m647=concat("vN26=",string(vN26,f2)).
compute p647="vN26為不合理值或遺漏值".
end if.
Exec.

*vN27=1,5 97,98 .
do if not range(vN27,1,5,97,98) | sys(vN27).
compute m648=concat("vN27=",string(vN27,f2)).
compute p648="vN27為不合理值或遺漏值".
end if.
Exec.

*vN28=1,5 97,98 .
do if not range(vN28,1,5,97,98) | sys(vN28).
compute m649=concat("vN28=",string(vN28,f2)).
compute p649="vN28為不合理值或遺漏值".
end if.
Exec.

*vN29=1,5 97,98 .
do if not range(vN29,1,5,97,98) | sys(vN29).
compute m650=concat("vN29=",string(vN29,f2)).
compute p650="vN29為不合理值或遺漏值".
end if.
Exec.

*vN30=90 97,98 .
do if not range(vN30,90,90,97,98) | sys(vN30).
compute m651=concat("vN30=",string(vN30,f3)).
compute p651="vN30為不合理值或遺漏值".
end if.
Exec.

*vN31=97,98 .
do if not range(vN31,97,98) | sys(vN31).
compute m652=concat("vN31=",string(vN31,f3)).
compute p652="vN31為不合理值或遺漏值".
end if.
Exec.

*vN32=97,98 .
do if not range(vN32,97,98) | sys(vN32).
compute m653=concat("vN32=",string(vN32,f3)).
compute p653="vN32為不合理值或遺漏值".
end if.
Exec.

*vO5=1,23 97 98 .
do if not range(vO5,1,23,97,97,98,98) | sys(vO5).
compute m654=concat("vO5=",string(vO5,f2)).
compute p654="vO5為不合理值或遺漏值".
end if.
Exec.

*vN33sN33=1,4 97,98 .
do if not range(vN33sN33,1,4,97,98) | sys(vN33sN33).
compute m655=concat("vN33sN33=",string(vN33sN33,f2)).
compute p655="vN33sN33為不合理值或遺漏值".
end if.
Exec.

*vN33sN34=1,4 97,98 .
do if not range(vN33sN34,1,4,97,98) | sys(vN33sN34).
compute m656=concat("vN33sN34=",string(vN33sN34,f2)).
compute p656="vN33sN34為不合理值或遺漏值".
end if.
Exec.

*vN35sN35=0,7 97,98 .
do if not range(vN35sN35,0,7,97,98) | sys(vN35sN35).
compute m657=concat("vN35sN35=",string(vN35sN35,f2)).
compute p657="vN35sN35為不合理值或遺漏值".
end if.
Exec.

*vN35sN36=0,7 97,98 .
do if not range(vN35sN36,0,7,97,98) | sys(vN35sN36).
compute m658=concat("vN35sN36=",string(vN35sN36,f2)).
compute p658="vN35sN36為不合理值或遺漏值".
end if.
Exec.

*vN35sN37=0,7 97,98 .
do if not range(vN35sN37,0,7,97,98) | sys(vN35sN37).
compute m659=concat("vN35sN37=",string(vN35sN37,f2)).
compute p659="vN35sN37為不合理值或遺漏值".
end if.
Exec.

*vN35sN38=0,7 97,98 .
do if not range(vN35sN38,0,7,97,98) | sys(vN35sN38).
compute m660=concat("vN35sN38=",string(vN35sN38,f2)).
compute p660="vN35sN38為不合理值或遺漏值".
end if.
Exec.

*vQa=20260615000000,20260915000000 .
do if not range(vQa,20260615000000,20260915000000) | sys(vQa).
compute m661=concat("vQa=",string(vQa,f14)).
compute p661="vQa為不合理值或遺漏值".
end if.
Exec.

*vQ1=1,4 97,98 .
do if not range(vQ1,1,4,97,98) | sys(vQ1).
compute m662=concat("vQ1=",string(vQ1,f2)).
compute p662="vQ1為不合理值或遺漏值".
end if.
Exec.

*vQ2=1,4 97,98 .
do if not range(vQ2,1,4,97,98) | sys(vQ2).
compute m663=concat("vQ2=",string(vQ2,f2)).
compute p663="vQ2為不合理值或遺漏值".
end if.
Exec.

*vQ3=1,8 97,98 .
do if not range(vQ3,1,8,97,98) | sys(vQ3).
compute m664=concat("vQ3=",string(vQ3,f2)).
compute p664="vQ3為不合理值或遺漏值".
end if.
Exec.

*vQ4=1,8 97,98 .
do if not range(vQ4,1,8,97,98) | sys(vQ4).
compute m665=concat("vQ4=",string(vQ4,f2)).
compute p665="vQ4為不合理值或遺漏值".
end if.
Exec.

*vQ5=1,2 97,98 .
do if not range(vQ5,1,2,97,98) | sys(vQ5).
compute m666=concat("vQ5=",string(vQ5,f2)).
compute p666="vQ5為不合理值或遺漏值".
end if.
Exec.

*vQ6=1,4 90 97,98 .
do if not range(vQ6,1,4,90,90,97,98) | sys(vQ6).
compute m667=concat("vQ6=",string(vQ6,f2)).
compute p667="vQ6為不合理值或遺漏值".
end if.
Exec.

*vQ7=1,4 90 97,98 .
do if not range(vQ7,1,4,90,90,97,98) | sys(vQ7).
compute m668=concat("vQ7=",string(vQ7,f2)).
compute p668="vQ7為不合理值或遺漏值".
end if.
Exec.

*vQ8=1,4 90 97,98 .
do if not range(vQ8,1,4,90,90,97,98) | sys(vQ8).
compute m669=concat("vQ8=",string(vQ8,f2)).
compute p669="vQ8為不合理值或遺漏值".
end if.
Exec.

*vQ9=1,4 90 97,98 .
do if not range(vQ9,1,4,90,90,97,98) | sys(vQ9).
compute m670=concat("vQ9=",string(vQ9,f2)).
compute p670="vQ9為不合理值或遺漏值".
end if.
Exec.

*vQ10=1,2 97,98 .
do if not range(vQ10,1,2,97,98) | sys(vQ10).
compute m671=concat("vQ10=",string(vQ10,f2)).
compute p671="vQ10為不合理值或遺漏值".
end if.
Exec.

*vCKQ10=96 .
do if not range(vCKQ10,96,96) | sys(vCKQ10).
compute m672=concat("vCKQ10=",string(vCKQ10,f2)).
compute p672="vCKQ10為不合理值或遺漏值".
end if.
Exec.

*vQ11=1,4 90 97,98 .
do if not range(vQ11,1,4,90,90,97,98) | sys(vQ11).
compute m673=concat("vQ11=",string(vQ11,f2)).
compute p673="vQ11為不合理值或遺漏值".
end if.
Exec.

*vQ12=1,4 90 97,98 .
do if not range(vQ12,1,4,90,90,97,98) | sys(vQ12).
compute m674=concat("vQ12=",string(vQ12,f2)).
compute p674="vQ12為不合理值或遺漏值".
end if.
Exec.

*vQ13=1,4 90 97,98 .
do if not range(vQ13,1,4,90,90,97,98) | sys(vQ13).
compute m675=concat("vQ13=",string(vQ13,f2)).
compute p675="vQ13為不合理值或遺漏值".
end if.
Exec.

*vQ14=1,4 90 97,98 .
do if not range(vQ14,1,4,90,90,97,98) | sys(vQ14).
compute m676=concat("vQ14=",string(vQ14,f2)).
compute p676="vQ14為不合理值或遺漏值".
end if.
Exec.

*vQ15=1,2 97,98 .
do if not range(vQ15,1,2,97,98) | sys(vQ15).
compute m677=concat("vQ15=",string(vQ15,f2)).
compute p677="vQ15為不合理值或遺漏值".
end if.
Exec.

*vQ16=1,4 90 97,98 .
do if not range(vQ16,1,4,90,90,97,98) | sys(vQ16).
compute m678=concat("vQ16=",string(vQ16,f2)).
compute p678="vQ16為不合理值或遺漏值".
end if.
Exec.

*vQ17=1,4 90 97,98 .
do if not range(vQ17,1,4,90,90,97,98) | sys(vQ17).
compute m679=concat("vQ17=",string(vQ17,f2)).
compute p679="vQ17為不合理值或遺漏值".
end if.
Exec.

*vQ18=1,4 90 97,98 .
do if not range(vQ18,1,4,90,90,97,98) | sys(vQ18).
compute m680=concat("vQ18=",string(vQ18,f2)).
compute p680="vQ18為不合理值或遺漏值".
end if.
Exec.

*vQ19=1,4 90 97,98 .
do if not range(vQ19,1,4,90,90,97,98) | sys(vQ19).
compute m681=concat("vQ19=",string(vQ19,f2)).
compute p681="vQ19為不合理值或遺漏值".
end if.
Exec.

*vQ20m01=0,1 .
do if not range(vQ20m01,0,1) | sys(vQ20m01).
compute m682=concat("vQ20m01=",string(vQ20m01,f2)).
compute p682="vQ20m01為不合理值或遺漏值".
end if.
Exec.

*vQ20m02=0,1 .
do if not range(vQ20m02,0,1) | sys(vQ20m02).
compute m683=concat("vQ20m02=",string(vQ20m02,f2)).
compute p683="vQ20m02為不合理值或遺漏值".
end if.
Exec.

*vQ20m03=0,1 .
do if not range(vQ20m03,0,1) | sys(vQ20m03).
compute m684=concat("vQ20m03=",string(vQ20m03,f2)).
compute p684="vQ20m03為不合理值或遺漏值".
end if.
Exec.

*vQ20m04=0,1 .
do if not range(vQ20m04,0,1) | sys(vQ20m04).
compute m685=concat("vQ20m04=",string(vQ20m04,f2)).
compute p685="vQ20m04為不合理值或遺漏值".
end if.
Exec.

*vQ20m05=0,1 .
do if not range(vQ20m05,0,1) | sys(vQ20m05).
compute m686=concat("vQ20m05=",string(vQ20m05,f2)).
compute p686="vQ20m05為不合理值或遺漏值".
end if.
Exec.

*vQ20m06=0,1 .
do if not range(vQ20m06,0,1) | sys(vQ20m06).
compute m687=concat("vQ20m06=",string(vQ20m06,f2)).
compute p687="vQ20m06為不合理值或遺漏值".
end if.
Exec.

*vQ20m88=0,1 96 .
do if not range(vQ20m88,0,1,96,96) | sys(vQ20m88).
compute m688=concat("vQ20m88=",string(vQ20m88,f2)).
compute p688="vQ20m88為不合理值或遺漏值".
end if.
Exec.

*vQ20m90=0,1 96 .
do if not range(vQ20m90,0,1,96,96) | sys(vQ20m90).
compute m689=concat("vQ20m90=",string(vQ20m90,f2)).
compute p689="vQ20m90為不合理值或遺漏值".
end if.
Exec.

*vCKQ20A=96 .
do if not range(vCKQ20A,96,96) | sys(vCKQ20A).
compute m690=concat("vCKQ20A=",string(vCKQ20A,f2)).
compute p690="vCKQ20A為不合理值或遺漏值".
end if.
Exec.

*vCKQ20B=96 .
do if not range(vCKQ20B,96,96) | sys(vCKQ20B).
compute m691=concat("vCKQ20B=",string(vCKQ20B,f2)).
compute p691="vCKQ20B為不合理值或遺漏值".
end if.
Exec.

*vQ24g1=0,140 997,998 .
do if not range(vQ24g1,0,140,997,998) | sys(vQ24g1).
compute m692=concat("vQ24g1=",string(vQ24g1,f4)).
compute p692="vQ24g1為不合理值或遺漏值".
end if.
Exec.

*vQ24g2=0,59 97,98 .
do if not range(vQ24g2,0,59,97,98) | sys(vQ24g2).
compute m693=concat("vQ24g2=",string(vQ24g2,f3)).
compute p693="vQ24g2為不合理值或遺漏值".
end if.
Exec.

*vCKQ24=1 .
do if not range(vCKQ24,1,1) | sys(vCKQ24).
compute m694=concat("vCKQ24=",string(vCKQ24,f2)).
compute p694="vCKQ24為不合理值或遺漏值".
end if.
Exec.

*vQ25m01=0,1 .
do if not range(vQ25m01,0,1) | sys(vQ25m01).
compute m695=concat("vQ25m01=",string(vQ25m01,f2)).
compute p695="vQ25m01為不合理值或遺漏值".
end if.
Exec.

*vQ25m02=0,1 .
do if not range(vQ25m02,0,1) | sys(vQ25m02).
compute m696=concat("vQ25m02=",string(vQ25m02,f2)).
compute p696="vQ25m02為不合理值或遺漏值".
end if.
Exec.

*vQ25m03=0,1 .
do if not range(vQ25m03,0,1) | sys(vQ25m03).
compute m697=concat("vQ25m03=",string(vQ25m03,f2)).
compute p697="vQ25m03為不合理值或遺漏值".
end if.
Exec.

*vQ25m04=0,1 .
do if not range(vQ25m04,0,1) | sys(vQ25m04).
compute m698=concat("vQ25m04=",string(vQ25m04,f2)).
compute p698="vQ25m04為不合理值或遺漏值".
end if.
Exec.

*vQ25m05=0,1 .
do if not range(vQ25m05,0,1) | sys(vQ25m05).
compute m699=concat("vQ25m05=",string(vQ25m05,f2)).
compute p699="vQ25m05為不合理值或遺漏值".
end if.
Exec.

*vQ25m06=0,1 .
do if not range(vQ25m06,0,1) | sys(vQ25m06).
compute m700=concat("vQ25m06=",string(vQ25m06,f2)).
compute p700="vQ25m06為不合理值或遺漏值".
end if.
Exec.

*vQ25m07=0,1 .
do if not range(vQ25m07,0,1) | sys(vQ25m07).
compute m701=concat("vQ25m07=",string(vQ25m07,f2)).
compute p701="vQ25m07為不合理值或遺漏值".
end if.
Exec.

*vQ25m08=0,1 .
do if not range(vQ25m08,0,1) | sys(vQ25m08).
compute m702=concat("vQ25m08=",string(vQ25m08,f2)).
compute p702="vQ25m08為不合理值或遺漏值".
end if.
Exec.

*vQ25m09=0,1 .
do if not range(vQ25m09,0,1) | sys(vQ25m09).
compute m703=concat("vQ25m09=",string(vQ25m09,f2)).
compute p703="vQ25m09為不合理值或遺漏值".
end if.
Exec.

*vQ25m10=0,1 96 .
do if not range(vQ25m10,0,1,96,96) | sys(vQ25m10).
compute m704=concat("vQ25m10=",string(vQ25m10,f2)).
compute p704="vQ25m10為不合理值或遺漏值".
end if.
Exec.

*vQ25m11=0,1 96 .
do if not range(vQ25m11,0,1,96,96) | sys(vQ25m11).
compute m705=concat("vQ25m11=",string(vQ25m11,f2)).
compute p705="vQ25m11為不合理值或遺漏值".
end if.
Exec.

*vQ25m12=0,1 96 .
do if not range(vQ25m12,0,1,96,96) | sys(vQ25m12).
compute m706=concat("vQ25m12=",string(vQ25m12,f2)).
compute p706="vQ25m12為不合理值或遺漏值".
end if.
Exec.

*vQ25m13=0,1 96 .
do if not range(vQ25m13,0,1,96,96) | sys(vQ25m13).
compute m707=concat("vQ25m13=",string(vQ25m13,f2)).
compute p707="vQ25m13為不合理值或遺漏值".
end if.
Exec.

*vQ25m14=0,1 96 .
do if not range(vQ25m14,0,1,96,96) | sys(vQ25m14).
compute m708=concat("vQ25m14=",string(vQ25m14,f2)).
compute p708="vQ25m14為不合理值或遺漏值".
end if.
Exec.

*vQ25m15=0,1 96 .
do if not range(vQ25m15,0,1,96,96) | sys(vQ25m15).
compute m709=concat("vQ25m15=",string(vQ25m15,f2)).
compute p709="vQ25m15為不合理值或遺漏值".
end if.
Exec.

*vQ25m16=0,1 96 .
do if not range(vQ25m16,0,1,96,96) | sys(vQ25m16).
compute m710=concat("vQ25m16=",string(vQ25m16,f2)).
compute p710="vQ25m16為不合理值或遺漏值".
end if.
Exec.

*vQ25m17=0,1 96 .
do if not range(vQ25m17,0,1,96,96) | sys(vQ25m17).
compute m711=concat("vQ25m17=",string(vQ25m17,f2)).
compute p711="vQ25m17為不合理值或遺漏值".
end if.
Exec.

*vQ25m18=0,1 96 .
do if not range(vQ25m18,0,1,96,96) | sys(vQ25m18).
compute m712=concat("vQ25m18=",string(vQ25m18,f2)).
compute p712="vQ25m18為不合理值或遺漏值".
end if.
Exec.

*vQ25m19=0,1 96 .
do if not range(vQ25m19,0,1,96,96) | sys(vQ25m19).
compute m713=concat("vQ25m19=",string(vQ25m19,f2)).
compute p713="vQ25m19為不合理值或遺漏值".
end if.
Exec.

*vQ25m20=0,1 96 .
do if not range(vQ25m20,0,1,96,96) | sys(vQ25m20).
compute m714=concat("vQ25m20=",string(vQ25m20,f2)).
compute p714="vQ25m20為不合理值或遺漏值".
end if.
Exec.

*vQ25m21=0,1 96 .
do if not range(vQ25m21,0,1,96,96) | sys(vQ25m21).
compute m715=concat("vQ25m21=",string(vQ25m21,f2)).
compute p715="vQ25m21為不合理值或遺漏值".
end if.
Exec.

*vQ25m22=0,1 96 .
do if not range(vQ25m22,0,1,96,96) | sys(vQ25m22).
compute m716=concat("vQ25m22=",string(vQ25m22,f2)).
compute p716="vQ25m22為不合理值或遺漏值".
end if.
Exec.

*vQ25m23=0,1 96 .
do if not range(vQ25m23,0,1,96,96) | sys(vQ25m23).
compute m717=concat("vQ25m23=",string(vQ25m23,f2)).
compute p717="vQ25m23為不合理值或遺漏值".
end if.
Exec.

*vQ25m24=0,1 96 .
do if not range(vQ25m24,0,1,96,96) | sys(vQ25m24).
compute m718=concat("vQ25m24=",string(vQ25m24,f2)).
compute p718="vQ25m24為不合理值或遺漏值".
end if.
Exec.

*vQ25m25=0,1 96 .
do if not range(vQ25m25,0,1,96,96) | sys(vQ25m25).
compute m719=concat("vQ25m25=",string(vQ25m25,f2)).
compute p719="vQ25m25為不合理值或遺漏值".
end if.
Exec.

*vQ25m26=0,1 96 .
do if not range(vQ25m26,0,1,96,96) | sys(vQ25m26).
compute m720=concat("vQ25m26=",string(vQ25m26,f2)).
compute p720="vQ25m26為不合理值或遺漏值".
end if.
Exec.

*vQ25m27=0,1 96 .
do if not range(vQ25m27,0,1,96,96) | sys(vQ25m27).
compute m721=concat("vQ25m27=",string(vQ25m27,f2)).
compute p721="vQ25m27為不合理值或遺漏值".
end if.
Exec.

*vQ25m28=0,1 96 .
do if not range(vQ25m28,0,1,96,96) | sys(vQ25m28).
compute m722=concat("vQ25m28=",string(vQ25m28,f2)).
compute p722="vQ25m28為不合理值或遺漏值".
end if.
Exec.

*vQ25m29=0,1 96 .
do if not range(vQ25m29,0,1,96,96) | sys(vQ25m29).
compute m723=concat("vQ25m29=",string(vQ25m29,f2)).
compute p723="vQ25m29為不合理值或遺漏值".
end if.
Exec.

*vQ25m30=0,1 96 .
do if not range(vQ25m30,0,1,96,96) | sys(vQ25m30).
compute m724=concat("vQ25m30=",string(vQ25m30,f2)).
compute p724="vQ25m30為不合理值或遺漏值".
end if.
Exec.

*vQ25m31=0,1 96 .
do if not range(vQ25m31,0,1,96,96) | sys(vQ25m31).
compute m725=concat("vQ25m31=",string(vQ25m31,f2)).
compute p725="vQ25m31為不合理值或遺漏值".
end if.
Exec.

*vQ25m88=0,1 96 .
do if not range(vQ25m88,0,1,96,96) | sys(vQ25m88).
compute m726=concat("vQ25m88=",string(vQ25m88,f2)).
compute p726="vQ25m88為不合理值或遺漏值".
end if.
Exec.

*vQ21g1=0,140 997,998 .
do if not range(vQ21g1,0,140,997,998) | sys(vQ21g1).
compute m727=concat("vQ21g1=",string(vQ21g1,f4)).
compute p727="vQ21g1為不合理值或遺漏值".
end if.
Exec.

*vQ21g2=0,59 97,98 .
do if not range(vQ21g2,0,59,97,98) | sys(vQ21g2).
compute m728=concat("vQ21g2=",string(vQ21g2,f3)).
compute p728="vQ21g2為不合理值或遺漏值".
end if.
Exec.

*vCKQ21=1 .
do if not range(vCKQ21,1,1) | sys(vCKQ21).
compute m729=concat("vCKQ21=",string(vCKQ21,f2)).
compute p729="vCKQ21為不合理值或遺漏值".
end if.
Exec.

*vQ22m01=0,1 .
do if not range(vQ22m01,0,1) | sys(vQ22m01).
compute m730=concat("vQ22m01=",string(vQ22m01,f2)).
compute p730="vQ22m01為不合理值或遺漏值".
end if.
Exec.

*vQ22m02=0,1 .
do if not range(vQ22m02,0,1) | sys(vQ22m02).
compute m731=concat("vQ22m02=",string(vQ22m02,f2)).
compute p731="vQ22m02為不合理值或遺漏值".
end if.
Exec.

*vQ22m03=0,1 .
do if not range(vQ22m03,0,1) | sys(vQ22m03).
compute m732=concat("vQ22m03=",string(vQ22m03,f2)).
compute p732="vQ22m03為不合理值或遺漏值".
end if.
Exec.

*vQ22m04=0,1 .
do if not range(vQ22m04,0,1) | sys(vQ22m04).
compute m733=concat("vQ22m04=",string(vQ22m04,f2)).
compute p733="vQ22m04為不合理值或遺漏值".
end if.
Exec.

*vQ22m05=0,1 .
do if not range(vQ22m05,0,1) | sys(vQ22m05).
compute m734=concat("vQ22m05=",string(vQ22m05,f2)).
compute p734="vQ22m05為不合理值或遺漏值".
end if.
Exec.

*vQ22m06=0,1 .
do if not range(vQ22m06,0,1) | sys(vQ22m06).
compute m735=concat("vQ22m06=",string(vQ22m06,f2)).
compute p735="vQ22m06為不合理值或遺漏值".
end if.
Exec.

*vQ22m07=0,1 .
do if not range(vQ22m07,0,1) | sys(vQ22m07).
compute m736=concat("vQ22m07=",string(vQ22m07,f2)).
compute p736="vQ22m07為不合理值或遺漏值".
end if.
Exec.

*vQ22m08=0,1 .
do if not range(vQ22m08,0,1) | sys(vQ22m08).
compute m737=concat("vQ22m08=",string(vQ22m08,f2)).
compute p737="vQ22m08為不合理值或遺漏值".
end if.
Exec.

*vQ22m09=0,1 .
do if not range(vQ22m09,0,1) | sys(vQ22m09).
compute m738=concat("vQ22m09=",string(vQ22m09,f2)).
compute p738="vQ22m09為不合理值或遺漏值".
end if.
Exec.

*vQ22m10=0,1 96 .
do if not range(vQ22m10,0,1,96,96) | sys(vQ22m10).
compute m739=concat("vQ22m10=",string(vQ22m10,f2)).
compute p739="vQ22m10為不合理值或遺漏值".
end if.
Exec.

*vQ22m11=0,1 96 .
do if not range(vQ22m11,0,1,96,96) | sys(vQ22m11).
compute m740=concat("vQ22m11=",string(vQ22m11,f2)).
compute p740="vQ22m11為不合理值或遺漏值".
end if.
Exec.

*vQ22m12=0,1 96 .
do if not range(vQ22m12,0,1,96,96) | sys(vQ22m12).
compute m741=concat("vQ22m12=",string(vQ22m12,f2)).
compute p741="vQ22m12為不合理值或遺漏值".
end if.
Exec.

*vQ22m13=0,1 96 .
do if not range(vQ22m13,0,1,96,96) | sys(vQ22m13).
compute m742=concat("vQ22m13=",string(vQ22m13,f2)).
compute p742="vQ22m13為不合理值或遺漏值".
end if.
Exec.

*vQ22m14=0,1 96 .
do if not range(vQ22m14,0,1,96,96) | sys(vQ22m14).
compute m743=concat("vQ22m14=",string(vQ22m14,f2)).
compute p743="vQ22m14為不合理值或遺漏值".
end if.
Exec.

*vQ22m15=0,1 96 .
do if not range(vQ22m15,0,1,96,96) | sys(vQ22m15).
compute m744=concat("vQ22m15=",string(vQ22m15,f2)).
compute p744="vQ22m15為不合理值或遺漏值".
end if.
Exec.

*vQ22m16=0,1 96 .
do if not range(vQ22m16,0,1,96,96) | sys(vQ22m16).
compute m745=concat("vQ22m16=",string(vQ22m16,f2)).
compute p745="vQ22m16為不合理值或遺漏值".
end if.
Exec.

*vQ22m17=0,1 96 .
do if not range(vQ22m17,0,1,96,96) | sys(vQ22m17).
compute m746=concat("vQ22m17=",string(vQ22m17,f2)).
compute p746="vQ22m17為不合理值或遺漏值".
end if.
Exec.

*vQ22m18=0,1 96 .
do if not range(vQ22m18,0,1,96,96) | sys(vQ22m18).
compute m747=concat("vQ22m18=",string(vQ22m18,f2)).
compute p747="vQ22m18為不合理值或遺漏值".
end if.
Exec.

*vQ22m19=0,1 96 .
do if not range(vQ22m19,0,1,96,96) | sys(vQ22m19).
compute m748=concat("vQ22m19=",string(vQ22m19,f2)).
compute p748="vQ22m19為不合理值或遺漏值".
end if.
Exec.

*vQ22m20=0,1 96 .
do if not range(vQ22m20,0,1,96,96) | sys(vQ22m20).
compute m749=concat("vQ22m20=",string(vQ22m20,f2)).
compute p749="vQ22m20為不合理值或遺漏值".
end if.
Exec.

*vQ22m21=0,1 96 .
do if not range(vQ22m21,0,1,96,96) | sys(vQ22m21).
compute m750=concat("vQ22m21=",string(vQ22m21,f2)).
compute p750="vQ22m21為不合理值或遺漏值".
end if.
Exec.

*vQ22m22=0,1 96 .
do if not range(vQ22m22,0,1,96,96) | sys(vQ22m22).
compute m751=concat("vQ22m22=",string(vQ22m22,f2)).
compute p751="vQ22m22為不合理值或遺漏值".
end if.
Exec.

*vQ22m23=0,1 96 .
do if not range(vQ22m23,0,1,96,96) | sys(vQ22m23).
compute m752=concat("vQ22m23=",string(vQ22m23,f2)).
compute p752="vQ22m23為不合理值或遺漏值".
end if.
Exec.

*vQ22m24=0,1 96 .
do if not range(vQ22m24,0,1,96,96) | sys(vQ22m24).
compute m753=concat("vQ22m24=",string(vQ22m24,f2)).
compute p753="vQ22m24為不合理值或遺漏值".
end if.
Exec.

*vQ22m25=0,1 96 .
do if not range(vQ22m25,0,1,96,96) | sys(vQ22m25).
compute m754=concat("vQ22m25=",string(vQ22m25,f2)).
compute p754="vQ22m25為不合理值或遺漏值".
end if.
Exec.

*vQ22m26=0,1 96 .
do if not range(vQ22m26,0,1,96,96) | sys(vQ22m26).
compute m755=concat("vQ22m26=",string(vQ22m26,f2)).
compute p755="vQ22m26為不合理值或遺漏值".
end if.
Exec.

*vQ22m27=0,1 96 .
do if not range(vQ22m27,0,1,96,96) | sys(vQ22m27).
compute m756=concat("vQ22m27=",string(vQ22m27,f2)).
compute p756="vQ22m27為不合理值或遺漏值".
end if.
Exec.

*vQ22m28=0,1 96 .
do if not range(vQ22m28,0,1,96,96) | sys(vQ22m28).
compute m757=concat("vQ22m28=",string(vQ22m28,f2)).
compute p757="vQ22m28為不合理值或遺漏值".
end if.
Exec.

*vQ22m29=0,1 96 .
do if not range(vQ22m29,0,1,96,96) | sys(vQ22m29).
compute m758=concat("vQ22m29=",string(vQ22m29,f2)).
compute p758="vQ22m29為不合理值或遺漏值".
end if.
Exec.

*vQ22m30=0,1 96 .
do if not range(vQ22m30,0,1,96,96) | sys(vQ22m30).
compute m759=concat("vQ22m30=",string(vQ22m30,f2)).
compute p759="vQ22m30為不合理值或遺漏值".
end if.
Exec.

*vQ22m31=0,1 96 .
do if not range(vQ22m31,0,1,96,96) | sys(vQ22m31).
compute m760=concat("vQ22m31=",string(vQ22m31,f2)).
compute p760="vQ22m31為不合理值或遺漏值".
end if.
Exec.

*vQ22m32=0,1 96 .
do if not range(vQ22m32,0,1,96,96) | sys(vQ22m32).
compute m761=concat("vQ22m32=",string(vQ22m32,f2)).
compute p761="vQ22m32為不合理值或遺漏值".
end if.
Exec.

*vQ22m33=0,1 96 .
do if not range(vQ22m33,0,1,96,96) | sys(vQ22m33).
compute m762=concat("vQ22m33=",string(vQ22m33,f2)).
compute p762="vQ22m33為不合理值或遺漏值".
end if.
Exec.

*vQ22m34=0,1 96 .
do if not range(vQ22m34,0,1,96,96) | sys(vQ22m34).
compute m763=concat("vQ22m34=",string(vQ22m34,f2)).
compute p763="vQ22m34為不合理值或遺漏值".
end if.
Exec.

*vQ22m35=0,1 96 .
do if not range(vQ22m35,0,1,96,96) | sys(vQ22m35).
compute m764=concat("vQ22m35=",string(vQ22m35,f2)).
compute p764="vQ22m35為不合理值或遺漏值".
end if.
Exec.

*vQ22m36=0,1 96 .
do if not range(vQ22m36,0,1,96,96) | sys(vQ22m36).
compute m765=concat("vQ22m36=",string(vQ22m36,f2)).
compute p765="vQ22m36為不合理值或遺漏值".
end if.
Exec.

*vQ22m37=0,1 96 .
do if not range(vQ22m37,0,1,96,96) | sys(vQ22m37).
compute m766=concat("vQ22m37=",string(vQ22m37,f2)).
compute p766="vQ22m37為不合理值或遺漏值".
end if.
Exec.

*vQ22m38=0,1 96 .
do if not range(vQ22m38,0,1,96,96) | sys(vQ22m38).
compute m767=concat("vQ22m38=",string(vQ22m38,f2)).
compute p767="vQ22m38為不合理值或遺漏值".
end if.
Exec.

*vQ22m39=0,1 96 .
do if not range(vQ22m39,0,1,96,96) | sys(vQ22m39).
compute m768=concat("vQ22m39=",string(vQ22m39,f2)).
compute p768="vQ22m39為不合理值或遺漏值".
end if.
Exec.

*vQ22m40=0,1 96 .
do if not range(vQ22m40,0,1,96,96) | sys(vQ22m40).
compute m769=concat("vQ22m40=",string(vQ22m40,f2)).
compute p769="vQ22m40為不合理值或遺漏值".
end if.
Exec.

*vQ22m88=0,1 96 .
do if not range(vQ22m88,0,1,96,96) | sys(vQ22m88).
compute m770=concat("vQ22m88=",string(vQ22m88,f2)).
compute p770="vQ22m88為不合理值或遺漏值".
end if.
Exec.

*vQ23m01=0,1 .
do if not range(vQ23m01,0,1) | sys(vQ23m01).
compute m771=concat("vQ23m01=",string(vQ23m01,f2)).
compute p771="vQ23m01為不合理值或遺漏值".
end if.
Exec.

*vQ23m02=0,1 .
do if not range(vQ23m02,0,1) | sys(vQ23m02).
compute m772=concat("vQ23m02=",string(vQ23m02,f2)).
compute p772="vQ23m02為不合理值或遺漏值".
end if.
Exec.

*vQ23m03=0,1 .
do if not range(vQ23m03,0,1) | sys(vQ23m03).
compute m773=concat("vQ23m03=",string(vQ23m03,f2)).
compute p773="vQ23m03為不合理值或遺漏值".
end if.
Exec.

*vQ23m04=0,1 .
do if not range(vQ23m04,0,1) | sys(vQ23m04).
compute m774=concat("vQ23m04=",string(vQ23m04,f2)).
compute p774="vQ23m04為不合理值或遺漏值".
end if.
Exec.

*vQ23m05=0,1 .
do if not range(vQ23m05,0,1) | sys(vQ23m05).
compute m775=concat("vQ23m05=",string(vQ23m05,f2)).
compute p775="vQ23m05為不合理值或遺漏值".
end if.
Exec.

*vQ23m06=0,1 .
do if not range(vQ23m06,0,1) | sys(vQ23m06).
compute m776=concat("vQ23m06=",string(vQ23m06,f2)).
compute p776="vQ23m06為不合理值或遺漏值".
end if.
Exec.

*vQ23m07=0,1 .
do if not range(vQ23m07,0,1) | sys(vQ23m07).
compute m777=concat("vQ23m07=",string(vQ23m07,f2)).
compute p777="vQ23m07為不合理值或遺漏值".
end if.
Exec.

*vQ23m08=0,1 .
do if not range(vQ23m08,0,1) | sys(vQ23m08).
compute m778=concat("vQ23m08=",string(vQ23m08,f2)).
compute p778="vQ23m08為不合理值或遺漏值".
end if.
Exec.

*vQ23m09=0,1 .
do if not range(vQ23m09,0,1) | sys(vQ23m09).
compute m779=concat("vQ23m09=",string(vQ23m09,f2)).
compute p779="vQ23m09為不合理值或遺漏值".
end if.
Exec.

*vQ23m10=0,1 96 .
do if not range(vQ23m10,0,1,96,96) | sys(vQ23m10).
compute m780=concat("vQ23m10=",string(vQ23m10,f2)).
compute p780="vQ23m10為不合理值或遺漏值".
end if.
Exec.

*vQ23m11=0,1 96 .
do if not range(vQ23m11,0,1,96,96) | sys(vQ23m11).
compute m781=concat("vQ23m11=",string(vQ23m11,f2)).
compute p781="vQ23m11為不合理值或遺漏值".
end if.
Exec.

*vQ23m12=0,1 96 .
do if not range(vQ23m12,0,1,96,96) | sys(vQ23m12).
compute m782=concat("vQ23m12=",string(vQ23m12,f2)).
compute p782="vQ23m12為不合理值或遺漏值".
end if.
Exec.

*vQ23m13=0,1 96 .
do if not range(vQ23m13,0,1,96,96) | sys(vQ23m13).
compute m783=concat("vQ23m13=",string(vQ23m13,f2)).
compute p783="vQ23m13為不合理值或遺漏值".
end if.
Exec.

*vQ23m14=0,1 96 .
do if not range(vQ23m14,0,1,96,96) | sys(vQ23m14).
compute m784=concat("vQ23m14=",string(vQ23m14,f2)).
compute p784="vQ23m14為不合理值或遺漏值".
end if.
Exec.

*vQ23m15=0,1 96 .
do if not range(vQ23m15,0,1,96,96) | sys(vQ23m15).
compute m785=concat("vQ23m15=",string(vQ23m15,f2)).
compute p785="vQ23m15為不合理值或遺漏值".
end if.
Exec.

*vQ23m16=0,1 96 .
do if not range(vQ23m16,0,1,96,96) | sys(vQ23m16).
compute m786=concat("vQ23m16=",string(vQ23m16,f2)).
compute p786="vQ23m16為不合理值或遺漏值".
end if.
Exec.

*vQ23m17=0,1 96 .
do if not range(vQ23m17,0,1,96,96) | sys(vQ23m17).
compute m787=concat("vQ23m17=",string(vQ23m17,f2)).
compute p787="vQ23m17為不合理值或遺漏值".
end if.
Exec.

*vQ23m18=0,1 96 .
do if not range(vQ23m18,0,1,96,96) | sys(vQ23m18).
compute m788=concat("vQ23m18=",string(vQ23m18,f2)).
compute p788="vQ23m18為不合理值或遺漏值".
end if.
Exec.

*vQ23m19=0,1 96 .
do if not range(vQ23m19,0,1,96,96) | sys(vQ23m19).
compute m789=concat("vQ23m19=",string(vQ23m19,f2)).
compute p789="vQ23m19為不合理值或遺漏值".
end if.
Exec.

*vQ23m20=0,1 96 .
do if not range(vQ23m20,0,1,96,96) | sys(vQ23m20).
compute m790=concat("vQ23m20=",string(vQ23m20,f2)).
compute p790="vQ23m20為不合理值或遺漏值".
end if.
Exec.

*vQ23m21=0,1 96 .
do if not range(vQ23m21,0,1,96,96) | sys(vQ23m21).
compute m791=concat("vQ23m21=",string(vQ23m21,f2)).
compute p791="vQ23m21為不合理值或遺漏值".
end if.
Exec.

*vQ23m22=0,1 96 .
do if not range(vQ23m22,0,1,96,96) | sys(vQ23m22).
compute m792=concat("vQ23m22=",string(vQ23m22,f2)).
compute p792="vQ23m22為不合理值或遺漏值".
end if.
Exec.

*vQ23m23=0,1 96 .
do if not range(vQ23m23,0,1,96,96) | sys(vQ23m23).
compute m793=concat("vQ23m23=",string(vQ23m23,f2)).
compute p793="vQ23m23為不合理值或遺漏值".
end if.
Exec.

*vQ23m24=0,1 96 .
do if not range(vQ23m24,0,1,96,96) | sys(vQ23m24).
compute m794=concat("vQ23m24=",string(vQ23m24,f2)).
compute p794="vQ23m24為不合理值或遺漏值".
end if.
Exec.

*vQ23m25=0,1 96 .
do if not range(vQ23m25,0,1,96,96) | sys(vQ23m25).
compute m795=concat("vQ23m25=",string(vQ23m25,f2)).
compute p795="vQ23m25為不合理值或遺漏值".
end if.
Exec.

*vQ23m26=0,1 96 .
do if not range(vQ23m26,0,1,96,96) | sys(vQ23m26).
compute m796=concat("vQ23m26=",string(vQ23m26,f2)).
compute p796="vQ23m26為不合理值或遺漏值".
end if.
Exec.

*vQ23m27=0,1 96 .
do if not range(vQ23m27,0,1,96,96) | sys(vQ23m27).
compute m797=concat("vQ23m27=",string(vQ23m27,f2)).
compute p797="vQ23m27為不合理值或遺漏值".
end if.
Exec.

*vQ23m88=0,1 96 .
do if not range(vQ23m88,0,1,96,96) | sys(vQ23m88).
compute m798=concat("vQ23m88=",string(vQ23m88,f2)).
compute p798="vQ23m88為不合理值或遺漏值".
end if.
Exec.

*vQ26Ag1=0,140 997,998 .
do if not range(vQ26Ag1,0,140,997,998) | sys(vQ26Ag1).
compute m799=concat("vQ26Ag1=",string(vQ26Ag1,f4)).
compute p799="vQ26Ag1為不合理值或遺漏值".
end if.
Exec.

*vQ26Ag2=0,59 97,98 .
do if not range(vQ26Ag2,0,59,97,98) | sys(vQ26Ag2).
compute m800=concat("vQ26Ag2=",string(vQ26Ag2,f3)).
compute p800="vQ26Ag2為不合理值或遺漏值".
end if.
Exec.

*vCKQ26A=1 .
do if not range(vCKQ26A,1,1) | sys(vCKQ26A).
compute m801=concat("vCKQ26A=",string(vCKQ26A,f2)).
compute p801="vCKQ26A為不合理值或遺漏值".
end if.
Exec.

*vQ26m01=0,1 .
do if not range(vQ26m01,0,1) | sys(vQ26m01).
compute m802=concat("vQ26m01=",string(vQ26m01,f2)).
compute p802="vQ26m01為不合理值或遺漏值".
end if.
Exec.

*vQ26m02=0,1 .
do if not range(vQ26m02,0,1) | sys(vQ26m02).
compute m803=concat("vQ26m02=",string(vQ26m02,f2)).
compute p803="vQ26m02為不合理值或遺漏值".
end if.
Exec.

*vQ26m03=0,1 .
do if not range(vQ26m03,0,1) | sys(vQ26m03).
compute m804=concat("vQ26m03=",string(vQ26m03,f2)).
compute p804="vQ26m03為不合理值或遺漏值".
end if.
Exec.

*vQ26m04=0,1 .
do if not range(vQ26m04,0,1) | sys(vQ26m04).
compute m805=concat("vQ26m04=",string(vQ26m04,f2)).
compute p805="vQ26m04為不合理值或遺漏值".
end if.
Exec.

*vQ26m05=0,1 .
do if not range(vQ26m05,0,1) | sys(vQ26m05).
compute m806=concat("vQ26m05=",string(vQ26m05,f2)).
compute p806="vQ26m05為不合理值或遺漏值".
end if.
Exec.

*vQ26m06=0,1 .
do if not range(vQ26m06,0,1) | sys(vQ26m06).
compute m807=concat("vQ26m06=",string(vQ26m06,f2)).
compute p807="vQ26m06為不合理值或遺漏值".
end if.
Exec.

*vQ26m07=0,1 .
do if not range(vQ26m07,0,1) | sys(vQ26m07).
compute m808=concat("vQ26m07=",string(vQ26m07,f2)).
compute p808="vQ26m07為不合理值或遺漏值".
end if.
Exec.

*vQ26m08=0,1 .
do if not range(vQ26m08,0,1) | sys(vQ26m08).
compute m809=concat("vQ26m08=",string(vQ26m08,f2)).
compute p809="vQ26m08為不合理值或遺漏值".
end if.
Exec.

*vQ26m09=0,1 .
do if not range(vQ26m09,0,1) | sys(vQ26m09).
compute m810=concat("vQ26m09=",string(vQ26m09,f2)).
compute p810="vQ26m09為不合理值或遺漏值".
end if.
Exec.

*vQ26m10=0,1 96 .
do if not range(vQ26m10,0,1,96,96) | sys(vQ26m10).
compute m811=concat("vQ26m10=",string(vQ26m10,f2)).
compute p811="vQ26m10為不合理值或遺漏值".
end if.
Exec.

*vQ26m11=0,1 96 .
do if not range(vQ26m11,0,1,96,96) | sys(vQ26m11).
compute m812=concat("vQ26m11=",string(vQ26m11,f2)).
compute p812="vQ26m11為不合理值或遺漏值".
end if.
Exec.

*vQ26m12=0,1 96 .
do if not range(vQ26m12,0,1,96,96) | sys(vQ26m12).
compute m813=concat("vQ26m12=",string(vQ26m12,f2)).
compute p813="vQ26m12為不合理值或遺漏值".
end if.
Exec.

*vQ26m13=0,1 96 .
do if not range(vQ26m13,0,1,96,96) | sys(vQ26m13).
compute m814=concat("vQ26m13=",string(vQ26m13,f2)).
compute p814="vQ26m13為不合理值或遺漏值".
end if.
Exec.

*vQ26m14=0,1 96 .
do if not range(vQ26m14,0,1,96,96) | sys(vQ26m14).
compute m815=concat("vQ26m14=",string(vQ26m14,f2)).
compute p815="vQ26m14為不合理值或遺漏值".
end if.
Exec.

*vQ26m15=0,1 96 .
do if not range(vQ26m15,0,1,96,96) | sys(vQ26m15).
compute m816=concat("vQ26m15=",string(vQ26m15,f2)).
compute p816="vQ26m15為不合理值或遺漏值".
end if.
Exec.

*vQ26m16=0,1 96 .
do if not range(vQ26m16,0,1,96,96) | sys(vQ26m16).
compute m817=concat("vQ26m16=",string(vQ26m16,f2)).
compute p817="vQ26m16為不合理值或遺漏值".
end if.
Exec.

*vQ26m17=0,1 96 .
do if not range(vQ26m17,0,1,96,96) | sys(vQ26m17).
compute m818=concat("vQ26m17=",string(vQ26m17,f2)).
compute p818="vQ26m17為不合理值或遺漏值".
end if.
Exec.

*vQ26m18=0,1 96 .
do if not range(vQ26m18,0,1,96,96) | sys(vQ26m18).
compute m819=concat("vQ26m18=",string(vQ26m18,f2)).
compute p819="vQ26m18為不合理值或遺漏值".
end if.
Exec.

*vQ26m19=0,1 96 .
do if not range(vQ26m19,0,1,96,96) | sys(vQ26m19).
compute m820=concat("vQ26m19=",string(vQ26m19,f2)).
compute p820="vQ26m19為不合理值或遺漏值".
end if.
Exec.

*vQ26m20=0,1 96 .
do if not range(vQ26m20,0,1,96,96) | sys(vQ26m20).
compute m821=concat("vQ26m20=",string(vQ26m20,f2)).
compute p821="vQ26m20為不合理值或遺漏值".
end if.
Exec.

*vQ26m21=0,1 96 .
do if not range(vQ26m21,0,1,96,96) | sys(vQ26m21).
compute m822=concat("vQ26m21=",string(vQ26m21,f2)).
compute p822="vQ26m21為不合理值或遺漏值".
end if.
Exec.

*vQ26m22=0,1 96 .
do if not range(vQ26m22,0,1,96,96) | sys(vQ26m22).
compute m823=concat("vQ26m22=",string(vQ26m22,f2)).
compute p823="vQ26m22為不合理值或遺漏值".
end if.
Exec.

*vQ26m23=0,1 96 .
do if not range(vQ26m23,0,1,96,96) | sys(vQ26m23).
compute m824=concat("vQ26m23=",string(vQ26m23,f2)).
compute p824="vQ26m23為不合理值或遺漏值".
end if.
Exec.

*vQ26m24=0,1 96 .
do if not range(vQ26m24,0,1,96,96) | sys(vQ26m24).
compute m825=concat("vQ26m24=",string(vQ26m24,f2)).
compute p825="vQ26m24為不合理值或遺漏值".
end if.
Exec.

*vQ26m25=0,1 96 .
do if not range(vQ26m25,0,1,96,96) | sys(vQ26m25).
compute m826=concat("vQ26m25=",string(vQ26m25,f2)).
compute p826="vQ26m25為不合理值或遺漏值".
end if.
Exec.

*vQ26m26=0,1 96 .
do if not range(vQ26m26,0,1,96,96) | sys(vQ26m26).
compute m827=concat("vQ26m26=",string(vQ26m26,f2)).
compute p827="vQ26m26為不合理值或遺漏值".
end if.
Exec.

*vQ26m27=0,1 96 .
do if not range(vQ26m27,0,1,96,96) | sys(vQ26m27).
compute m828=concat("vQ26m27=",string(vQ26m27,f2)).
compute p828="vQ26m27為不合理值或遺漏值".
end if.
Exec.

*vQ26m28=0,1 96 .
do if not range(vQ26m28,0,1,96,96) | sys(vQ26m28).
compute m829=concat("vQ26m28=",string(vQ26m28,f2)).
compute p829="vQ26m28為不合理值或遺漏值".
end if.
Exec.

*vQ26m29=0,1 96 .
do if not range(vQ26m29,0,1,96,96) | sys(vQ26m29).
compute m830=concat("vQ26m29=",string(vQ26m29,f2)).
compute p830="vQ26m29為不合理值或遺漏值".
end if.
Exec.

*vQ26m88=0,1 96 .
do if not range(vQ26m88,0,1,96,96) | sys(vQ26m88).
compute m831=concat("vQ26m88=",string(vQ26m88,f2)).
compute p831="vQ26m88為不合理值或遺漏值".
end if.
Exec.

*vQ27m01=0,1 .
do if not range(vQ27m01,0,1) | sys(vQ27m01).
compute m832=concat("vQ27m01=",string(vQ27m01,f2)).
compute p832="vQ27m01為不合理值或遺漏值".
end if.
Exec.

*vQ27m02=0,1 .
do if not range(vQ27m02,0,1) | sys(vQ27m02).
compute m833=concat("vQ27m02=",string(vQ27m02,f2)).
compute p833="vQ27m02為不合理值或遺漏值".
end if.
Exec.

*vQ27m03=0,1 .
do if not range(vQ27m03,0,1) | sys(vQ27m03).
compute m834=concat("vQ27m03=",string(vQ27m03,f2)).
compute p834="vQ27m03為不合理值或遺漏值".
end if.
Exec.

*vQ27m04=0,1 .
do if not range(vQ27m04,0,1) | sys(vQ27m04).
compute m835=concat("vQ27m04=",string(vQ27m04,f2)).
compute p835="vQ27m04為不合理值或遺漏值".
end if.
Exec.

*vQ27m05=0,1 .
do if not range(vQ27m05,0,1) | sys(vQ27m05).
compute m836=concat("vQ27m05=",string(vQ27m05,f2)).
compute p836="vQ27m05為不合理值或遺漏值".
end if.
Exec.

*vQ27m06=0,1 .
do if not range(vQ27m06,0,1) | sys(vQ27m06).
compute m837=concat("vQ27m06=",string(vQ27m06,f2)).
compute p837="vQ27m06為不合理值或遺漏值".
end if.
Exec.

*vQ27m07=0,1 .
do if not range(vQ27m07,0,1) | sys(vQ27m07).
compute m838=concat("vQ27m07=",string(vQ27m07,f2)).
compute p838="vQ27m07為不合理值或遺漏值".
end if.
Exec.

*vQ27m88=0,1 96 .
do if not range(vQ27m88,0,1,96,96) | sys(vQ27m88).
compute m839=concat("vQ27m88=",string(vQ27m88,f2)).
compute p839="vQ27m88為不合理值或遺漏值".
end if.
Exec.

*vP3_4=1,4 97,98 .
do if not range(vP3_4,1,4,97,98) | sys(vP3_4).
compute m840=concat("vP3_4=",string(vP3_4,f2)).
compute p840="vP3_4為不合理值或遺漏值".
end if.
Exec.

*vCKP3_4=96 .
do if not range(vCKP3_4,96,96) | sys(vCKP3_4).
compute m841=concat("vCKP3_4=",string(vCKP3_4,f2)).
compute p841="vCKP3_4為不合理值或遺漏值".
end if.
Exec.

*vP3_5=1,4 90 97,98 .
do if not range(vP3_5,1,4,90,90,97,98) | sys(vP3_5).
compute m842=concat("vP3_5=",string(vP3_5,f2)).
compute p842="vP3_5為不合理值或遺漏值".
end if.
Exec.

*vP3_6=1,4 97,98 .
do if not range(vP3_6,1,4,97,98) | sys(vP3_6).
compute m843=concat("vP3_6=",string(vP3_6,f2)).
compute p843="vP3_6為不合理值或遺漏值".
end if.
Exec.

*vP5_3R=1,4 97,98 .
do if not range(vP5_3R,1,4,97,98) | sys(vP5_3R).
compute m844=concat("vP5_3R=",string(vP5_3R,f2)).
compute p844="vP5_3R為不合理值或遺漏值".
end if.
Exec.

*vP5_4R=1,4 97,98 .
do if not range(vP5_4R,1,4,97,98) | sys(vP5_4R).
compute m845=concat("vP5_4R=",string(vP5_4R,f2)).
compute p845="vP5_4R為不合理值或遺漏值".
end if.
Exec.

*vP5_5=1,5 97,98 .
do if not range(vP5_5,1,5,97,98) | sys(vP5_5).
compute m846=concat("vP5_5=",string(vP5_5,f2)).
compute p846="vP5_5為不合理值或遺漏值".
end if.
Exec.

*vQ28=0,500 991 997,998 .
do if not range(vQ28,0,500,991,991,997,998) | sys(vQ28).
compute m847=concat("vQ28=",string(vQ28,f4)).
compute p847="vQ28為不合理值或遺漏值".
end if.
Exec.

*vQ30m01=0,1 .
do if not range(vQ30m01,0,1) | sys(vQ30m01).
compute m848=concat("vQ30m01=",string(vQ30m01,f2)).
compute p848="vQ30m01為不合理值或遺漏值".
end if.
Exec.

*vQ30m02=0,1 .
do if not range(vQ30m02,0,1) | sys(vQ30m02).
compute m849=concat("vQ30m02=",string(vQ30m02,f2)).
compute p849="vQ30m02為不合理值或遺漏值".
end if.
Exec.

*vQ30m03=0,1 .
do if not range(vQ30m03,0,1) | sys(vQ30m03).
compute m850=concat("vQ30m03=",string(vQ30m03,f2)).
compute p850="vQ30m03為不合理值或遺漏值".
end if.
Exec.

*vQ30m04=0,1 .
do if not range(vQ30m04,0,1) | sys(vQ30m04).
compute m851=concat("vQ30m04=",string(vQ30m04,f2)).
compute p851="vQ30m04為不合理值或遺漏值".
end if.
Exec.

*vQ30m05=0,1 .
do if not range(vQ30m05,0,1) | sys(vQ30m05).
compute m852=concat("vQ30m05=",string(vQ30m05,f2)).
compute p852="vQ30m05為不合理值或遺漏值".
end if.
Exec.

*vQ30m06=0,1 .
do if not range(vQ30m06,0,1) | sys(vQ30m06).
compute m853=concat("vQ30m06=",string(vQ30m06,f2)).
compute p853="vQ30m06為不合理值或遺漏值".
end if.
Exec.

*vQ30m07=0,1 .
do if not range(vQ30m07,0,1) | sys(vQ30m07).
compute m854=concat("vQ30m07=",string(vQ30m07,f2)).
compute p854="vQ30m07為不合理值或遺漏值".
end if.
Exec.

*vQ30m08=0,1 .
do if not range(vQ30m08,0,1) | sys(vQ30m08).
compute m855=concat("vQ30m08=",string(vQ30m08,f2)).
compute p855="vQ30m08為不合理值或遺漏值".
end if.
Exec.

*vQ30m90=0,1 96 .
do if not range(vQ30m90,0,1,96,96) | sys(vQ30m90).
compute m856=concat("vQ30m90=",string(vQ30m90,f2)).
compute p856="vQ30m90為不合理值或遺漏值".
end if.
Exec.

*vQ31m01=0,1 .
do if not range(vQ31m01,0,1) | sys(vQ31m01).
compute m857=concat("vQ31m01=",string(vQ31m01,f2)).
compute p857="vQ31m01為不合理值或遺漏值".
end if.
Exec.

*vQ31m02=0,1 .
do if not range(vQ31m02,0,1) | sys(vQ31m02).
compute m858=concat("vQ31m02=",string(vQ31m02,f2)).
compute p858="vQ31m02為不合理值或遺漏值".
end if.
Exec.

*vQ31m03=0,1 .
do if not range(vQ31m03,0,1) | sys(vQ31m03).
compute m859=concat("vQ31m03=",string(vQ31m03,f2)).
compute p859="vQ31m03為不合理值或遺漏值".
end if.
Exec.

*vQ31m04=0,1 .
do if not range(vQ31m04,0,1) | sys(vQ31m04).
compute m860=concat("vQ31m04=",string(vQ31m04,f2)).
compute p860="vQ31m04為不合理值或遺漏值".
end if.
Exec.

*vQ31m05=0,1 .
do if not range(vQ31m05,0,1) | sys(vQ31m05).
compute m861=concat("vQ31m05=",string(vQ31m05,f2)).
compute p861="vQ31m05為不合理值或遺漏值".
end if.
Exec.

*vQ31m06=0,1 .
do if not range(vQ31m06,0,1) | sys(vQ31m06).
compute m862=concat("vQ31m06=",string(vQ31m06,f2)).
compute p862="vQ31m06為不合理值或遺漏值".
end if.
Exec.

*vQ31m07=0,1 .
do if not range(vQ31m07,0,1) | sys(vQ31m07).
compute m863=concat("vQ31m07=",string(vQ31m07,f2)).
compute p863="vQ31m07為不合理值或遺漏值".
end if.
Exec.

*vQ31m08=0,1 .
do if not range(vQ31m08,0,1) | sys(vQ31m08).
compute m864=concat("vQ31m08=",string(vQ31m08,f2)).
compute p864="vQ31m08為不合理值或遺漏值".
end if.
Exec.

*vQ31m90=0,1 96 .
do if not range(vQ31m90,0,1,96,96) | sys(vQ31m90).
compute m865=concat("vQ31m90=",string(vQ31m90,f2)).
compute p865="vQ31m90為不合理值或遺漏值".
end if.
Exec.

*vQ32sQ32=1,5 97,98 .
do if not range(vQ32sQ32,1,5,97,98) | sys(vQ32sQ32).
compute m866=concat("vQ32sQ32=",string(vQ32sQ32,f2)).
compute p866="vQ32sQ32為不合理值或遺漏值".
end if.
Exec.

*vQ32sQ33=1,5 97,98 .
do if not range(vQ32sQ33,1,5,97,98) | sys(vQ32sQ33).
compute m867=concat("vQ32sQ33=",string(vQ32sQ33,f2)).
compute p867="vQ32sQ33為不合理值或遺漏值".
end if.
Exec.

*vQ32sQ34=1,5 97,98 .
do if not range(vQ32sQ34,1,5,97,98) | sys(vQ32sQ34).
compute m868=concat("vQ32sQ34=",string(vQ32sQ34,f2)).
compute p868="vQ32sQ34為不合理值或遺漏值".
end if.
Exec.

*vQ58s58=1,5 97,98 .
do if not range(vQ58s58,1,5,97,98) | sys(vQ58s58).
compute m869=concat("vQ58s58=",string(vQ58s58,f2)).
compute p869="vQ58s58為不合理值或遺漏值".
end if.
Exec.

*vQ58s59=1,5 97,98 .
do if not range(vQ58s59,1,5,97,98) | sys(vQ58s59).
compute m870=concat("vQ58s59=",string(vQ58s59,f2)).
compute p870="vQ58s59為不合理值或遺漏值".
end if.
Exec.

*vQ58s60=1,5 97,98 .
do if not range(vQ58s60,1,5,97,98) | sys(vQ58s60).
compute m871=concat("vQ58s60=",string(vQ58s60,f2)).
compute p871="vQ58s60為不合理值或遺漏值".
end if.
Exec.

*vQ58s61=1,5 97,98 .
do if not range(vQ58s61,1,5,97,98) | sys(vQ58s61).
compute m872=concat("vQ58s61=",string(vQ58s61,f2)).
compute p872="vQ58s61為不合理值或遺漏值".
end if.
Exec.

*vQ46=1,5 97,98 .
do if not range(vQ46,1,5,97,98) | sys(vQ46).
compute m873=concat("vQ46=",string(vQ46,f2)).
compute p873="vQ46為不合理值或遺漏值".
end if.
Exec.

*vP3_2=1,5 97,98 .
do if not range(vP3_2,1,5,97,98) | sys(vP3_2).
compute m874=concat("vP3_2=",string(vP3_2,f2)).
compute p874="vP3_2為不合理值或遺漏值".
end if.
Exec.

*vP3_3=1,5 97,98 .
do if not range(vP3_3,1,5,97,98) | sys(vP3_3).
compute m875=concat("vP3_3=",string(vP3_3,f2)).
compute p875="vP3_3為不合理值或遺漏值".
end if.
Exec.

*vP2_1=1,4 97,98 .
do if not range(vP2_1,1,4,97,98) | sys(vP2_1).
compute m876=concat("vP2_1=",string(vP2_1,f2)).
compute p876="vP2_1為不合理值或遺漏值".
end if.
Exec.

*vP2_2=1,4 97,98 .
do if not range(vP2_2,1,4,97,98) | sys(vP2_2).
compute m877=concat("vP2_2=",string(vP2_2,f2)).
compute p877="vP2_2為不合理值或遺漏值".
end if.
Exec.

*vP2_3=1,4 97,98 .
do if not range(vP2_3,1,4,97,98) | sys(vP2_3).
compute m878=concat("vP2_3=",string(vP2_3,f2)).
compute p878="vP2_3為不合理值或遺漏值".
end if.
Exec.

*vP2_4=1,5 97,98 .
do if not range(vP2_4,1,5,97,98) | sys(vP2_4).
compute m879=concat("vP2_4=",string(vP2_4,f2)).
compute p879="vP2_4為不合理值或遺漏值".
end if.
Exec.

*vP2_5=1,5 97,98 .
do if not range(vP2_5,1,5,97,98) | sys(vP2_5).
compute m880=concat("vP2_5=",string(vP2_5,f2)).
compute p880="vP2_5為不合理值或遺漏值".
end if.
Exec.

*vP2_6=1,5 97,98 .
do if not range(vP2_6,1,5,97,98) | sys(vP2_6).
compute m881=concat("vP2_6=",string(vP2_6,f2)).
compute p881="vP2_6為不合理值或遺漏值".
end if.
Exec.

*vQ43=1,8 97,98 .
do if not range(vQ43,1,8,97,98) | sys(vQ43).
compute m882=concat("vQ43=",string(vQ43,f2)).
compute p882="vQ43為不合理值或遺漏值".
end if.
Exec.

*vQ44=1,89 90,92 .
do if not range(vQ44,1,89,90,92) | sys(vQ44).
compute m883=concat("vQ44=",string(vQ44,f2)).
compute p883="vQ44為不合理值或遺漏值".
end if.
Exec.

*vQ45=1,89 90,92 .
do if not range(vQ45,1,89,90,92) | sys(vQ45).
compute m884=concat("vQ45=",string(vQ45,f2)).
compute p884="vQ45為不合理值或遺漏值".
end if.
Exec.

*vQ47=997,998 .
do if not range(vQ47,997,998) | sys(vQ47).
compute m885=concat("vQ47=",string(vQ47,f4)).
compute p885="vQ47為不合理值或遺漏值".
end if.
Exec.

*vQ48=997,998 .
do if not range(vQ48,997,998) | sys(vQ48).
compute m886=concat("vQ48=",string(vQ48,f4)).
compute p886="vQ48為不合理值或遺漏值".
end if.
Exec.

*vQ62=997,998 .
do if not range(vQ62,997,998) | sys(vQ62).
compute m887=concat("vQ62=",string(vQ62,f4)).
compute p887="vQ62為不合理值或遺漏值".
end if.
Exec.

*vQ49=1,2 97,98 .
do if not range(vQ49,1,2,97,98) | sys(vQ49).
compute m888=concat("vQ49=",string(vQ49,f2)).
compute p888="vQ49為不合理值或遺漏值".
end if.
Exec.

*vQ50=2 97,98 .
do if not range(vQ50,2,2,97,98) | sys(vQ50).
compute m889=concat("vQ50=",string(vQ50,f2)).
compute p889="vQ50為不合理值或遺漏值".
end if.
Exec.

*vQ51=1,88 .
do if not range(vQ51,1,88) | sys(vQ51).
compute m890=concat("vQ51=",string(vQ51,f2)).
compute p890="vQ51為不合理值或遺漏值".
end if.
Exec.

*vQ52=1,88 .
do if not range(vQ52,1,88) | sys(vQ52).
compute m891=concat("vQ52=",string(vQ52,f2)).
compute p891="vQ52為不合理值或遺漏值".
end if.
Exec.

*vQ53=1,88 93 95 97 .
do if not range(vQ53,1,88,93,93,95,95,97,97) | sys(vQ53).
compute m892=concat("vQ53=",string(vQ53,f2)).
compute p892="vQ53為不合理值或遺漏值".
end if.
Exec.

*vP3_1=97,98 .
do if not range(vP3_1,97,98) | sys(vP3_1).
compute m893=concat("vP3_1=",string(vP3_1,f3)).
compute p893="vP3_1為不合理值或遺漏值".
end if.
Exec.

*vQ54=1,88 97,98 .
do if not range(vQ54,1,88,97,98) | sys(vQ54).
compute m894=concat("vQ54=",string(vQ54,f2)).
compute p894="vQ54為不合理值或遺漏值".
end if.
Exec.

*vP5_6=0,10 97,98 .
do if not range(vP5_6,0,10,97,98) | sys(vP5_6).
compute m895=concat("vP5_6=",string(vP5_6,f2)).
compute p895="vP5_6為不合理值或遺漏值".
end if.
Exec.

*vQ55=1,4 97,98 .
do if not range(vQ55,1,4,97,98) | sys(vQ55).
compute m896=concat("vQ55=",string(vQ55,f2)).
compute p896="vQ55為不合理值或遺漏值".
end if.
Exec.

*vQ56=1,4 97,98 .
do if not range(vQ56,1,4,97,98) | sys(vQ56).
compute m897=concat("vQ56=",string(vQ56,f2)).
compute p897="vQ56為不合理值或遺漏值".
end if.
Exec.

*vQ57=1,4 97,98 .
do if not range(vQ57,1,4,97,98) | sys(vQ57).
compute m898=concat("vQ57=",string(vQ57,f2)).
compute p898="vQ57為不合理值或遺漏值".
end if.
Exec.

*vZ2_1g1=98 .
do if not range(vZ2_1g1,98,98) | sys(vZ2_1g1).
compute m899=concat("vZ2_1g1=",string(vZ2_1g1,f11)).
compute p899="vZ2_1g1為不合理值或遺漏值".
end if.
Exec.

*vZ2_1g2=98 .
do if not range(vZ2_1g2,98,98) | sys(vZ2_1g2).
compute m900=concat("vZ2_1g2=",string(vZ2_1g2,f9)).
compute p900="vZ2_1g2為不合理值或遺漏值".
end if.
Exec.

*vZ2_2=3 98 .
do if not range(vZ2_2,3,3,98,98) | sys(vZ2_2).
compute m901=concat("vZ2_2=",string(vZ2_2,f11)).
compute p901="vZ2_2為不合理值或遺漏值".
end if.
Exec.

*vZE1=1,4 .
do if not range(vZE1,1,4) | sys(vZE1).
compute m902=concat("vZE1=",string(vZE1,f2)).
compute p902="vZE1為不合理值或遺漏值".
end if.
Exec.

*vCkZE1=20260615000000,20260915000000 .
do if not range(vCkZE1,20260615000000,20260915000000) | sys(vCkZE1).
compute m903=concat("vCkZE1=",string(vCkZE1,f14)).
compute p903="vCkZE1為不合理值或遺漏值".
end if.
Exec.

*vZE2m01=0,1 .
do if not range(vZE2m01,0,1) | sys(vZE2m01).
compute m904=concat("vZE2m01=",string(vZE2m01,f2)).
compute p904="vZE2m01為不合理值或遺漏值".
end if.
Exec.

*vZE2m02=0,1 .
do if not range(vZE2m02,0,1) | sys(vZE2m02).
compute m905=concat("vZE2m02=",string(vZE2m02,f2)).
compute p905="vZE2m02為不合理值或遺漏值".
end if.
Exec.

*vZE2m03=0,1 .
do if not range(vZE2m03,0,1) | sys(vZE2m03).
compute m906=concat("vZE2m03=",string(vZE2m03,f2)).
compute p906="vZE2m03為不合理值或遺漏值".
end if.
Exec.

*vvckend=20260615000000,20260915000000 .
do if not range(vvckend,20260615000000,20260915000000) | sys(vvckend).
compute m907=concat("vvckend=",string(vvckend,f14)).
compute p907="vvckend為不合理值或遺漏值".
end if.
Exec.

* SYNTAXWORK_END_NUMERIC.

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
do if v=1o88 & vO1o88="".
Compute m1008=concat("v=",string(v,n2),";vO1o88=",char.substr(vO1o88,1,150)).
compute p1008="vO1o88開放欄位應答而未答".
else if v~=1o88 & vO1o88~="".
Compute m1008=concat("v=",string(v,n2),";vO1o88=",char.substr(vO1o88,1,150)).
compute p1008="vO1o88開放欄位不該答而答".
else if v=1o88 & vO1o88~="" & range(keyin,keyindate1, Keyindate2).
Compute m1008=concat("v=",string(v,n2),";vO1o88=",char.substr(vO1o88,1,150)).
compute p1008="vO1o88開放欄位內容列出確認".
end if.
Exec.

*vO2o88 開放欄位檢核 是否為複選題=0.
do if v45o06=2o88 & vO2o88="".
Compute m1009=concat("v45o06=",string(v45o06,n2),";vO2o88=",char.substr(vO2o88,1,150)).
compute p1009="vO2o88開放欄位應答而未答".
else if v45o06~=2o88 & vO2o88~="".
Compute m1009=concat("v45o06=",string(v45o06,n2),";vO2o88=",char.substr(vO2o88,1,150)).
compute p1009="vO2o88開放欄位不該答而答".
else if v45o06=2o88 & vO2o88~="" & range(keyin,keyindate1, Keyindate2).
Compute m1009=concat("v45o06=",string(v45o06,n2),";vO2o88=",char.substr(vO2o88,1,150)).
compute p1009="vO2o88開放欄位內容列出確認".
end if.
Exec.

*vO3o88 開放欄位檢核 是否為複選題=0.
do if v=3o88 & vO3o88="".
Compute m1010=concat("v=",string(v,n2),";vO3o88=",char.substr(vO3o88,1,150)).
compute p1010="vO3o88開放欄位應答而未答".
else if v~=3o88 & vO3o88~="".
Compute m1010=concat("v=",string(v,n2),";vO3o88=",char.substr(vO3o88,1,150)).
compute p1010="vO3o88開放欄位不該答而答".
else if v=3o88 & vO3o88~="" & range(keyin,keyindate1, Keyindate2).
Compute m1010=concat("v=",string(v,n2),";vO3o88=",char.substr(vO3o88,1,150)).
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
do if v71_2s1=1 & vKTT4o88="".
Compute m1019=concat("v71_2s1=",string(v71_2s1,n2),";vKTT4o88=",char.substr(vKTT4o88,1,150)).
compute p1019="vKTT4o88開放欄位應答而未答".
else if v71_2s1~=1 & vKTT4o88~="".
Compute m1019=concat("v71_2s1=",string(v71_2s1,n2),";vKTT4o88=",char.substr(vKTT4o88,1,150)).
compute p1019="vKTT4o88開放欄位不該答而答".
else if v71_2s1=1 & vKTT4o88~="" & range(keyin,keyindate1, Keyindate2).
Compute m1019=concat("v71_2s1=",string(v71_2s1,n2),";vKTT4o88=",char.substr(vKTT4o88,1,150)).
compute p1019="vKTT4o88開放欄位內容列出確認".
end if.
Exec.

*vKTT5o88 開放欄位檢核 是否為複選題=1.
do if v71_2s2=1 & vKTT5o88="".
Compute m1020=concat("v71_2s2=",string(v71_2s2,n2),";vKTT5o88=",char.substr(vKTT5o88,1,150)).
compute p1020="vKTT5o88開放欄位應答而未答".
else if v71_2s2~=1 & vKTT5o88~="".
Compute m1020=concat("v71_2s2=",string(v71_2s2,n2),";vKTT5o88=",char.substr(vKTT5o88,1,150)).
compute p1020="vKTT5o88開放欄位不該答而答".
else if v71_2s2=1 & vKTT5o88~="" & range(keyin,keyindate1, Keyindate2).
Compute m1020=concat("v71_2s2=",string(v71_2s2,n2),";vKTT5o88=",char.substr(vKTT5o88,1,150)).
compute p1020="vKTT5o88開放欄位內容列出確認".
end if.
Exec.

*vK3o88 開放欄位檢核 是否為複選題=1.
do if v71_2s3=1 & vK3o88="".
Compute m1021=concat("v71_2s3=",string(v71_2s3,n2),";vK3o88=",char.substr(vK3o88,1,150)).
compute p1021="vK3o88開放欄位應答而未答".
else if v71_2s3~=1 & vK3o88~="".
Compute m1021=concat("v71_2s3=",string(v71_2s3,n2),";vK3o88=",char.substr(vK3o88,1,150)).
compute p1021="vK3o88開放欄位不該答而答".
else if v71_2s3=1 & vK3o88~="" & range(keyin,keyindate1, Keyindate2).
Compute m1021=concat("v71_2s3=",string(v71_2s3,n2),";vK3o88=",char.substr(vK3o88,1,150)).
compute p1021="vK3o88開放欄位內容列出確認".
end if.
Exec.

*vE18o88 開放欄位檢核 是否為複選題=0.
do if v71_2s4=88 & vE18o88="".
Compute m1022=concat("v71_2s4=",string(v71_2s4,n2),";vE18o88=",char.substr(vE18o88,1,150)).
compute p1022="vE18o88開放欄位應答而未答".
else if v71_2s4~=88 & vE18o88~="".
Compute m1022=concat("v71_2s4=",string(v71_2s4,n2),";vE18o88=",char.substr(vE18o88,1,150)).
compute p1022="vE18o88開放欄位不該答而答".
else if v71_2s4=88 & vE18o88~="" & range(keyin,keyindate1, Keyindate2).
Compute m1022=concat("v71_2s4=",string(v71_2s4,n2),";vE18o88=",char.substr(vE18o88,1,150)).
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

*vZE1o03 開放欄位檢核 是否為複選題=0.
do if vZE1=3 & vZE1o03="".
Compute m1052=concat("vZE1=",string(vZE1,n2),";vZE1o03=",char.substr(vZE1o03,1,150)).
compute p1052="vZE1o03開放欄位應答而未答".
else if vZE1~=3 & vZE1o03~="".
Compute m1052=concat("vZE1=",string(vZE1,n2),";vZE1o03=",char.substr(vZE1o03,1,150)).
compute p1052="vZE1o03開放欄位不該答而答".
else if vZE1=3 & vZE1o03~="" & range(keyin,keyindate1, Keyindate2).
Compute m1052=concat("vZE1=",string(vZE1,n2),";vZE1o03=",char.substr(vZE1o03,1,150)).
compute p1052="vZE1o03開放欄位內容列出確認".
end if.
Exec.

*vZE1o04 開放欄位檢核 是否為複選題=0.
do if vZE1=4 & vZE1o04="".
Compute m1053=concat("vZE1=",string(vZE1,n2),";vZE1o04=",char.substr(vZE1o04,1,150)).
compute p1053="vZE1o04開放欄位應答而未答".
else if vZE1~=4 & vZE1o04~="".
Compute m1053=concat("vZE1=",string(vZE1,n2),";vZE1o04=",char.substr(vZE1o04,1,150)).
compute p1053="vZE1o04開放欄位不該答而答".
else if vZE1=4 & vZE1o04~="" & range(keyin,keyindate1, Keyindate2).
Compute m1053=concat("vZE1=",string(vZE1,n2),";vZE1o04=",char.substr(vZE1o04,1,150)).
compute p1053="vZE1o04開放欄位內容列出確認".
end if.
Exec.

* SYNTAXWORK_END_OPEN.

**3.複選題檢核.
* K1 K2 KFB3 KFB4 KIG3 KIG4 KTT3 KTT4 KTT5 K3 E2 E13 G7 G8 G9 G10 G11 B7a B8 G3 F5 C3 JB1 JB2 M2 M3 Q20 Q25 Q22 Q23 Q26 Q27 Q30 Q31 ZE2 組合.
STRING K1 K2 KFB3 KFB4 KIG3 KIG4 KTT3 KTT4 KTT5 K3 E2 E13 G7 G8 G9 G10 G11 B7a B8 G3 F5 C3 JB1 JB2 M2 M3 Q20 Q25 Q22 Q23 Q26 Q27 Q30 Q31 ZE2 (A600).
COMPUTE K1 = Rtrim(Ltrim(concat("vK1m01=",string(vK1m01,f2)," , ","vK1m02=",string(vK1m02,f2)," , ","vK1m03=",string(vK1m03,f2)," , ","vK1m04=",string(vK1m04,f2)," , ","vK1m05=",string(vK1m05,f2)," , ","vK1m06=",string(vK1m06,f2)," , ","vK1m07=",string(vK1m07,f2)," , ","vK1m08=",string(vK1m08,f2)," , ","vK1m09=",string(vK1m09,f2)," , ","vK1m10=",string(vK1m10,f2)," , ","vK1m11=",string(vK1m11,f2)," , ","vK1m12=",string(vK1m12,f2)," , ","vK1m13=",string(vK1m13,f2)," , ","vK1m88=",string(vK1m88,f2)," , ","vK1m90=",string(vK1m90,f2)))).
COMPUTE K2 = Rtrim(Ltrim(concat("vK2m01=",string(vK2m01,f2)," , ","vK2m02=",string(vK2m02,f2)," , ","vK2m03=",string(vK2m03,f2)," , ","vK2m04=",string(vK2m04,f2)," , ","vK2m05=",string(vK2m05,f2)," , ","vK2m06=",string(vK2m06,f2)," , ","vK2m07=",string(vK2m07,f2)," , ","vK2m08=",string(vK2m08,f2)," , ","vK2m09=",string(vK2m09,f2)," , ","vK2m11=",string(vK2m11,f2)," , ","vK2m12=",string(vK2m12,f2)," , ","vK2m13=",string(vK2m13,f2)," , ","vK2m88=",string(vK2m88,f2)," , ","vK2m90=",string(vK2m90,f2)))).
COMPUTE KFB3 = Rtrim(Ltrim(concat("vKFB3m01=",string(vKFB3m01,f2)," , ","vKFB3m02=",string(vKFB3m02,f2)," , ","vKFB3m03=",string(vKFB3m03,f2)," , ","vKFB3m04=",string(vKFB3m04,f2)," , ","vKFB3m05=",string(vKFB3m05,f2)," , ","vKFB3m06=",string(vKFB3m06,f2)," , ","vKFB3m07=",string(vKFB3m07,f2)," , ","vKFB3m08=",string(vKFB3m08,f2)," , ","vKFB3m09=",string(vKFB3m09,f2)," , ","vKFB3m10=",string(vKFB3m10,f2)," , ","vKFB3m11=",string(vKFB3m11,f2)," , ","vKFB3m12=",string(vKFB3m12,f2)," , ","vKFB3m13=",string(vKFB3m13,f2)," , ","vKFB3m14=",string(vKFB3m14,f2)," , ","vKFB3m15=",string(vKFB3m15,f2)," , ","vKFB3m16=",string(vKFB3m16,f2)," , ","vKFB3m17=",string(vKFB3m17,f2)," , ","vKFB3m88=",string(vKFB3m88,f2)))).
COMPUTE KFB4 = Rtrim(Ltrim(concat("vKFB4m01=",string(vKFB4m01,f2)," , ","vKFB4m02=",string(vKFB4m02,f2)," , ","vKFB4m03=",string(vKFB4m03,f2)," , ","vKFB4m04=",string(vKFB4m04,f2)," , ","vKFB4m05=",string(vKFB4m05,f2)," , ","vKFB4m06=",string(vKFB4m06,f2)," , ","vKFB4m07=",string(vKFB4m07,f2)," , ","vKFB4m08=",string(vKFB4m08,f2)," , ","vKFB4m09=",string(vKFB4m09,f2)," , ","vKFB4m10=",string(vKFB4m10,f2)," , ","vKFB4m11=",string(vKFB4m11,f2)," , ","vKFB4m12=",string(vKFB4m12,f2)," , ","vKFB4m13=",string(vKFB4m13,f2)," , ","vKFB4m14=",string(vKFB4m14,f2)," , ","vKFB4m15=",string(vKFB4m15,f2)," , ","vKFB4m16=",string(vKFB4m16,f2)," , ","vKFB4m17=",string(vKFB4m17,f2)," , ","vKFB4m18=",string(vKFB4m18,f2)," , ","vKFB4m88=",string(vKFB4m88,f2)))).
COMPUTE KIG3 = Rtrim(Ltrim(concat("vKIG3m01=",string(vKIG3m01,f2)," , ","vKIG3m02=",string(vKIG3m02,f2)," , ","vKIG3m03=",string(vKIG3m03,f2)," , ","vKIG3m04=",string(vKIG3m04,f2)," , ","vKIG3m05=",string(vKIG3m05,f2)," , ","vKIG3m06=",string(vKIG3m06,f2)," , ","vKIG3m07=",string(vKIG3m07,f2)," , ","vKIG3m08=",string(vKIG3m08,f2)," , ","vKIG3m09=",string(vKIG3m09,f2)," , ","vKIG3m10=",string(vKIG3m10,f2)," , ","vKIG3m11=",string(vKIG3m11,f2)," , ","vKIG3m12=",string(vKIG3m12,f2)," , ","vKIG3m13=",string(vKIG3m13,f2)," , ","vKIG3m14=",string(vKIG3m14,f2)," , ","vKIG3m15=",string(vKIG3m15,f2)," , ","vKIG3m16=",string(vKIG3m16,f2)," , ","vKIG3m17=",string(vKIG3m17,f2)," , ","vKIG3m88=",string(vKIG3m88,f2)))).
COMPUTE KIG4 = Rtrim(Ltrim(concat("vKIG4m01=",string(vKIG4m01,f2)," , ","vKIG4m02=",string(vKIG4m02,f2)," , ","vKIG4m03=",string(vKIG4m03,f2)," , ","vKIG4m04=",string(vKIG4m04,f2)," , ","vKIG4m05=",string(vKIG4m05,f2)," , ","vKIG4m06=",string(vKIG4m06,f2)," , ","vKIG4m07=",string(vKIG4m07,f2)," , ","vKIG4m08=",string(vKIG4m08,f2)," , ","vKIG4m09=",string(vKIG4m09,f2)," , ","vKIG4m10=",string(vKIG4m10,f2)," , ","vKIG4m11=",string(vKIG4m11,f2)," , ","vKIG4m12=",string(vKIG4m12,f2)," , ","vKIG4m13=",string(vKIG4m13,f2)," , ","vKIG4m14=",string(vKIG4m14,f2)," , ","vKIG4m88=",string(vKIG4m88,f2)))).
COMPUTE KTT3 = Rtrim(Ltrim(concat("vKTT3m01=",string(vKTT3m01,f2)," , ","vKTT3m02=",string(vKTT3m02,f2)," , ","vKTT3m03=",string(vKTT3m03,f2)," , ","vKTT3m04=",string(vKTT3m04,f2)," , ","vKTT3m05=",string(vKTT3m05,f2)," , ","vKTT3m06=",string(vKTT3m06,f2)," , ","vKTT3m07=",string(vKTT3m07,f2)," , ","vKTT3m08=",string(vKTT3m08,f2)," , ","vKTT3m09=",string(vKTT3m09,f2)," , ","vKTT3m10=",string(vKTT3m10,f2)," , ","vKTT3m11=",string(vKTT3m11,f2)," , ","vKTT3m12=",string(vKTT3m12,f2)," , ","vKTT3m13=",string(vKTT3m13,f2)," , ","vKTT3m14=",string(vKTT3m14,f2)," , ","vKTT3m15=",string(vKTT3m15,f2)," , ","vKTT3m16=",string(vKTT3m16,f2)," , ","vKTT3m88=",string(vKTT3m88,f2)))).
COMPUTE KTT4 = Rtrim(Ltrim(concat("vKTT4m01=",string(vKTT4m01,f2)," , ","vKTT4m02=",string(vKTT4m02,f2)," , ","vKTT4m03=",string(vKTT4m03,f2)," , ","vKTT4m04=",string(vKTT4m04,f2)," , ","vKTT4m05=",string(vKTT4m05,f2)," , ","vKTT4m06=",string(vKTT4m06,f2)," , ","vKTT4m07=",string(vKTT4m07,f2)," , ","vKTT4m08=",string(vKTT4m08,f2)," , ","vKTT4m09=",string(vKTT4m09,f2)," , ","vKTT4m10=",string(vKTT4m10,f2)," , ","vKTT4m11=",string(vKTT4m11,f2)," , ","vKTT4m12=",string(vKTT4m12,f2)," , ","vKTT4m13=",string(vKTT4m13,f2)," , ","vKTT4m14=",string(vKTT4m14,f2)," , ","vKTT4m88=",string(vKTT4m88,f2)))).
COMPUTE KTT5 = Rtrim(Ltrim(concat("vKTT5m01=",string(vKTT5m01,f2)," , ","vKTT5m02=",string(vKTT5m02,f2)," , ","vKTT5m03=",string(vKTT5m03,f2)," , ","vKTT5m04=",string(vKTT5m04,f2)," , ","vKTT5m05=",string(vKTT5m05,f2)," , ","vKTT5m06=",string(vKTT5m06,f2)," , ","vKTT5m07=",string(vKTT5m07,f2)," , ","vKTT5m08=",string(vKTT5m08,f2)," , ","vKTT5m09=",string(vKTT5m09,f2)," , ","vKTT5m10=",string(vKTT5m10,f2)," , ","vKTT5m11=",string(vKTT5m11,f2)," , ","vKTT5m12=",string(vKTT5m12,f2)," , ","vKTT5m88=",string(vKTT5m88,f2)))).
COMPUTE K3 = Rtrim(Ltrim(concat("vK3m01=",string(vK3m01,f2)," , ","vK3m02=",string(vK3m02,f2)," , ","vK3m03=",string(vK3m03,f2)," , ","vK3m04=",string(vK3m04,f2)," , ","vK3m05=",string(vK3m05,f2)," , ","vK3m06=",string(vK3m06,f2)," , ","vK3m07=",string(vK3m07,f2)," , ","vK3m08=",string(vK3m08,f2)," , ","vK3m09=",string(vK3m09,f2)," , ","vK3m88=",string(vK3m88,f2)," , ","vK3m90=",string(vK3m90,f2)))).
COMPUTE E2 = Rtrim(Ltrim(concat("vE2m01=",string(vE2m01,f2)," , ","vE2m02=",string(vE2m02,f2)," , ","vE2m03=",string(vE2m03,f2)," , ","vE2m04=",string(vE2m04,f2)," , ","vE2m88=",string(vE2m88,f2)))).
COMPUTE E13 = Rtrim(Ltrim(concat("vE13m01=",string(vE13m01,f2)," , ","vE13m02=",string(vE13m02,f2)," , ","vE13m03=",string(vE13m03,f2)," , ","vE13m04=",string(vE13m04,f2)," , ","vE13m05=",string(vE13m05,f2)," , ","vE13m06=",string(vE13m06,f2)," , ","vE13m88=",string(vE13m88,f2)))).
COMPUTE G7 = Rtrim(Ltrim(concat("vG7m01=",string(vG7m01,f2)," , ","vG7m02=",string(vG7m02,f2)," , ","vG7m03=",string(vG7m03,f2)," , ","vG7m04=",string(vG7m04,f2)," , ","vG7m05=",string(vG7m05,f2)," , ","vG7m06=",string(vG7m06,f2)," , ","vG7m07=",string(vG7m07,f2)," , ","vG7m08=",string(vG7m08,f2)," , ","vG7m09=",string(vG7m09,f2)," , ","vG7m10=",string(vG7m10,f2)," , ","vG7m11=",string(vG7m11,f2)," , ","vG7m12=",string(vG7m12,f2)," , ","vG7m88=",string(vG7m88,f2)," , ","vG7m90=",string(vG7m90,f2)))).
COMPUTE G8 = Rtrim(Ltrim(concat("vG8m01=",string(vG8m01,f2)," , ","vG8m02=",string(vG8m02,f2)," , ","vG8m03=",string(vG8m03,f2)," , ","vG8m04=",string(vG8m04,f2)," , ","vG8m05=",string(vG8m05,f2)," , ","vG8m06=",string(vG8m06,f2)," , ","vG8m07=",string(vG8m07,f2)," , ","vG8m08=",string(vG8m08,f2)," , ","vG8m09=",string(vG8m09,f2)," , ","vG8m10=",string(vG8m10,f2)," , ","vG8m11=",string(vG8m11,f2)," , ","vG8m12=",string(vG8m12,f2)," , ","vG8m13=",string(vG8m13,f2)," , ","vG8m14=",string(vG8m14,f2)," , ","vG8m15=",string(vG8m15,f2)," , ","vG8m16=",string(vG8m16,f2)," , ","vG8m88=",string(vG8m88,f2)," , ","vG8m90=",string(vG8m90,f2)))).
COMPUTE G9 = Rtrim(Ltrim(concat("vG9m01=",string(vG9m01,f2)," , ","vG9m02=",string(vG9m02,f2)," , ","vG9m03=",string(vG9m03,f2)," , ","vG9m04=",string(vG9m04,f2)," , ","vG9m05=",string(vG9m05,f2)," , ","vG9m06=",string(vG9m06,f2)," , ","vG9m07=",string(vG9m07,f2)," , ","vG9m08=",string(vG9m08,f2)," , ","vG9m09=",string(vG9m09,f2)," , ","vG9m10=",string(vG9m10,f2)," , ","vG9m11=",string(vG9m11,f2)," , ","vG9m12=",string(vG9m12,f2)," , ","vG9m13=",string(vG9m13,f2)," , ","vG9m88=",string(vG9m88,f2)," , ","vG9m90=",string(vG9m90,f2)))).
COMPUTE G10 = Rtrim(Ltrim(concat("vG10m01=",string(vG10m01,f2)," , ","vG10m02=",string(vG10m02,f2)," , ","vG10m03=",string(vG10m03,f2)," , ","vG10m04=",string(vG10m04,f2)," , ","vG10m05=",string(vG10m05,f2)," , ","vG10m06=",string(vG10m06,f2)," , ","vG10m07=",string(vG10m07,f2)," , ","vG10m08=",string(vG10m08,f2)," , ","vG10m09=",string(vG10m09,f2)," , ","vG10m10=",string(vG10m10,f2)," , ","vG10m11=",string(vG10m11,f2)," , ","vG10m12=",string(vG10m12,f2)," , ","vG10m13=",string(vG10m13,f2)," , ","vG10m14=",string(vG10m14,f2)," , ","vG10m15=",string(vG10m15,f2)," , ","vG10m16=",string(vG10m16,f2)," , ","vG10m17=",string(vG10m17,f2)," , ","vG10m18=",string(vG10m18,f2)," , ","vG10m19=",string(vG10m19,f2)," , ","vG10m88=",string(vG10m88,f2)," , ","vG10m90=",string(vG10m90,f2)))).
COMPUTE G11 = Rtrim(Ltrim(concat("vG11m01=",string(vG11m01,f2)," , ","vG11m02=",string(vG11m02,f2)," , ","vG11m03=",string(vG11m03,f2)," , ","vG11m04=",string(vG11m04,f2)," , ","vG11m05=",string(vG11m05,f2)," , ","vG11m88=",string(vG11m88,f2)," , ","vG11m90=",string(vG11m90,f2)))).
COMPUTE B7a = Rtrim(Ltrim(concat("vB7am01=",string(vB7am01,f2)," , ","vB7am02=",string(vB7am02,f2)," , ","vB7am03=",string(vB7am03,f2)," , ","vB7am04=",string(vB7am04,f2)," , ","vB7am05=",string(vB7am05,f2)," , ","vB7am06=",string(vB7am06,f2)," , ","vB7am07=",string(vB7am07,f2)," , ","vB7am08=",string(vB7am08,f2)," , ","vB7am09=",string(vB7am09,f2)," , ","vB7am10=",string(vB7am10,f2)," , ","vB7am11=",string(vB7am11,f2)," , ","vB7am12=",string(vB7am12,f2)," , ","vB7am13=",string(vB7am13,f2)," , ","vB7am14=",string(vB7am14,f2)," , ","vB7am15=",string(vB7am15,f2)," , ","vB7am16=",string(vB7am16,f2)," , ","vB7am17=",string(vB7am17,f2)," , ","vB7am18=",string(vB7am18,f2)," , ","vB7am19=",string(vB7am19,f2)," , ","vB7am20=",string(vB7am20,f2)," , ","vB7am21=",string(vB7am21,f2)," , ","vB7am22=",string(vB7am22,f2)," , ","vB7am23=",string(vB7am23,f2)," , ","vB7am24=",string(vB7am24,f2)," , ","vB7am25=",string(vB7am25,f2)," , ","vB7am26=",string(vB7am26,f2)," , ","vB7am27=",string(vB7am27,f2)," , ","vB7am28=",string(vB7am28,f2)," , ","vB7am29=",string(vB7am29,f2)," , ","vB7am30=",string(vB7am30,f2)," , ","vB7am31=",string(vB7am31,f2)," , ","vB7am32=",string(vB7am32,f2)," , ","vB7am33=",string(vB7am33,f2)," , ","vB7am34=",string(vB7am34,f2)," , ","vB7am35=",string(vB7am35,f2)," , ","vB7am36=",string(vB7am36,f2)," , ","vB7am37=",string(vB7am37,f2)," , ","vB7am38=",string(vB7am38,f2)," , ","vB7am39=",string(vB7am39,f2)," , ","vB7am40=",string(vB7am40,f2)," , ","vB7am41=",string(vB7am41,f2)," , ","vB7am42=",string(vB7am42,f2)," , ","vB7am43=",string(vB7am43,f2)," , ","vB7am44=",string(vB7am44,f2)," , ","vB7am45=",string(vB7am45,f2)," , ","vB7am46=",string(vB7am46,f2)," , ","vB7am47=",string(vB7am47,f2)," , ","vB7am48=",string(vB7am48,f2)," , ","vB7am49=",string(vB7am49,f2)," , ","vB7am50=",string(vB7am50,f2)," , ","vB7am51=",string(vB7am51,f2)," , ","vB7am52=",string(vB7am52,f2)," , ","vB7am53=",string(vB7am53,f2)," , ","vB7am54=",string(vB7am54,f2)," , ","vB7am88=",string(vB7am88,f2)))).
COMPUTE B8 = Rtrim(Ltrim(concat("vB8m01=",string(vB8m01,f2)," , ","vB8m02=",string(vB8m02,f2)," , ","vB8m03=",string(vB8m03,f2)," , ","vB8m04=",string(vB8m04,f2)," , ","vB8m05=",string(vB8m05,f2)," , ","vB8m06=",string(vB8m06,f2)," , ","vB8m07=",string(vB8m07,f2)," , ","vB8m08=",string(vB8m08,f2)," , ","vB8m09=",string(vB8m09,f2)," , ","vB8m10=",string(vB8m10,f2)," , ","vB8m88=",string(vB8m88,f2)))).
COMPUTE G3 = Rtrim(Ltrim(concat("vG3m01=",string(vG3m01,f2)," , ","vG3m02=",string(vG3m02,f2)," , ","vG3m03=",string(vG3m03,f2)," , ","vG3m04=",string(vG3m04,f2)," , ","vG3m05=",string(vG3m05,f2)," , ","vG3m06=",string(vG3m06,f2)," , ","vG3m07=",string(vG3m07,f2)," , ","vG3m08=",string(vG3m08,f2)," , ","vG3m09=",string(vG3m09,f2)," , ","vG3m10=",string(vG3m10,f2)," , ","vG3m11=",string(vG3m11,f2)," , ","vG3m12=",string(vG3m12,f2)," , ","vG3m13=",string(vG3m13,f2)," , ","vG3m14=",string(vG3m14,f2)," , ","vG3m15=",string(vG3m15,f2)," , ","vG3m16=",string(vG3m16,f2)," , ","vG3m18=",string(vG3m18,f2)," , ","vG3m19=",string(vG3m19,f2)," , ","vG3m20=",string(vG3m20,f2)," , ","vG3m21=",string(vG3m21,f2)," , ","vG3m22=",string(vG3m22,f2)," , ","vG3m23=",string(vG3m23,f2)," , ","vG3m24=",string(vG3m24,f2)," , ","vG3m25=",string(vG3m25,f2)," , ","vG3m26=",string(vG3m26,f2)," , ","vG3m27=",string(vG3m27,f2)," , ","vG3m28=",string(vG3m28,f2)," , ","vG3m29=",string(vG3m29,f2)," , ","vG3m30=",string(vG3m30,f2)," , ","vG3m31=",string(vG3m31,f2)," , ","vG3m32=",string(vG3m32,f2)," , ","vG3m33=",string(vG3m33,f2)," , ","vG3m88=",string(vG3m88,f2)))).
COMPUTE F5 = Rtrim(Ltrim(concat("vF5m01=",string(vF5m01,f2)," , ","vF5m02=",string(vF5m02,f2)," , ","vF5m03=",string(vF5m03,f2)," , ","vF5m04=",string(vF5m04,f2)," , ","vF5m05=",string(vF5m05,f2)," , ","vF5m06=",string(vF5m06,f2)," , ","vF5m07=",string(vF5m07,f2)," , ","vF5m08=",string(vF5m08,f2)," , ","vF5m88=",string(vF5m88,f2)))).
COMPUTE C3 = Rtrim(Ltrim(concat("vC3m01=",string(vC3m01,f2)," , ","vC3m02=",string(vC3m02,f2)," , ","vC3m03=",string(vC3m03,f2)," , ","vC3m04=",string(vC3m04,f2)," , ","vC3m05=",string(vC3m05,f2)," , ","vC3m06=",string(vC3m06,f2)," , ","vC3m07=",string(vC3m07,f2)," , ","vC3m08=",string(vC3m08,f2)," , ","vC3m09=",string(vC3m09,f2)," , ","vC3m10=",string(vC3m10,f2)," , ","vC3m11=",string(vC3m11,f2)," , ","vC3m88=",string(vC3m88,f2)))).
COMPUTE JB1 = Rtrim(Ltrim(concat("vJB1m01=",string(vJB1m01,f2)," , ","vJB1m02=",string(vJB1m02,f2)," , ","vJB1m03=",string(vJB1m03,f2)," , ","vJB1m04=",string(vJB1m04,f2)," , ","vJB1m05=",string(vJB1m05,f2)," , ","vJB1m06=",string(vJB1m06,f2)," , ","vJB1m07=",string(vJB1m07,f2)," , ","vJB1m08=",string(vJB1m08,f2)," , ","vJB1m09=",string(vJB1m09,f2)," , ","vJB1m10=",string(vJB1m10,f2)," , ","vJB1m11=",string(vJB1m11,f2)," , ","vJB1m88=",string(vJB1m88,f2)," , ","vJB1m90=",string(vJB1m90,f2)))).
COMPUTE JB2 = Rtrim(Ltrim(concat("vJB2m01=",string(vJB2m01,f2)," , ","vJB2m02=",string(vJB2m02,f2)," , ","vJB2m03=",string(vJB2m03,f2)," , ","vJB2m04=",string(vJB2m04,f2)," , ","vJB2m05=",string(vJB2m05,f2)," , ","vJB2m06=",string(vJB2m06,f2)," , ","vJB2m07=",string(vJB2m07,f2)," , ","vJB2m88=",string(vJB2m88,f2)," , ","vJB2m90=",string(vJB2m90,f2)))).
COMPUTE M2 = Rtrim(Ltrim(concat("vM2m01=",string(vM2m01,f2)," , ","vM2m02=",string(vM2m02,f2)," , ","vM2m03=",string(vM2m03,f2)," , ","vM2m04=",string(vM2m04,f2)," , ","vM2m05=",string(vM2m05,f2)," , ","vM2m06=",string(vM2m06,f2)," , ","vM2m07=",string(vM2m07,f2)," , ","vM2m08=",string(vM2m08,f2)," , ","vM2m09=",string(vM2m09,f2)," , ","vM2m10=",string(vM2m10,f2)," , ","vM2m11=",string(vM2m11,f2)," , ","vM2m12=",string(vM2m12,f2)," , ","vM2m13=",string(vM2m13,f2)," , ","vM2m14=",string(vM2m14,f2)," , ","vM2m15=",string(vM2m15,f2)," , ","vM2m16=",string(vM2m16,f2)," , ","vM2m88=",string(vM2m88,f2)))).
COMPUTE M3 = Rtrim(Ltrim(concat("vM3m01=",string(vM3m01,f2)," , ","vM3m02=",string(vM3m02,f2)," , ","vM3m03=",string(vM3m03,f2)," , ","vM3m04=",string(vM3m04,f2)," , ","vM3m05=",string(vM3m05,f2)," , ","vM3m06=",string(vM3m06,f2)," , ","vM3m07=",string(vM3m07,f2)," , ","vM3m08=",string(vM3m08,f2)," , ","vM3m09=",string(vM3m09,f2)," , ","vM3m10=",string(vM3m10,f2)," , ","vM3m11=",string(vM3m11,f2)," , ","vM3m12=",string(vM3m12,f2)," , ","vM3m13=",string(vM3m13,f2)," , ","vM3m88=",string(vM3m88,f2)))).
COMPUTE Q20 = Rtrim(Ltrim(concat("vQ20m01=",string(vQ20m01,f2)," , ","vQ20m02=",string(vQ20m02,f2)," , ","vQ20m03=",string(vQ20m03,f2)," , ","vQ20m04=",string(vQ20m04,f2)," , ","vQ20m05=",string(vQ20m05,f2)," , ","vQ20m06=",string(vQ20m06,f2)," , ","vQ20m88=",string(vQ20m88,f2)," , ","vQ20m90=",string(vQ20m90,f2)))).
COMPUTE Q25 = Rtrim(Ltrim(concat("vQ25m01=",string(vQ25m01,f2)," , ","vQ25m02=",string(vQ25m02,f2)," , ","vQ25m03=",string(vQ25m03,f2)," , ","vQ25m04=",string(vQ25m04,f2)," , ","vQ25m05=",string(vQ25m05,f2)," , ","vQ25m06=",string(vQ25m06,f2)," , ","vQ25m07=",string(vQ25m07,f2)," , ","vQ25m08=",string(vQ25m08,f2)," , ","vQ25m09=",string(vQ25m09,f2)," , ","vQ25m10=",string(vQ25m10,f2)," , ","vQ25m11=",string(vQ25m11,f2)," , ","vQ25m12=",string(vQ25m12,f2)," , ","vQ25m13=",string(vQ25m13,f2)," , ","vQ25m14=",string(vQ25m14,f2)," , ","vQ25m15=",string(vQ25m15,f2)," , ","vQ25m16=",string(vQ25m16,f2)," , ","vQ25m17=",string(vQ25m17,f2)," , ","vQ25m18=",string(vQ25m18,f2)," , ","vQ25m19=",string(vQ25m19,f2)," , ","vQ25m20=",string(vQ25m20,f2)," , ","vQ25m21=",string(vQ25m21,f2)," , ","vQ25m22=",string(vQ25m22,f2)," , ","vQ25m23=",string(vQ25m23,f2)," , ","vQ25m24=",string(vQ25m24,f2)," , ","vQ25m25=",string(vQ25m25,f2)," , ","vQ25m26=",string(vQ25m26,f2)," , ","vQ25m27=",string(vQ25m27,f2)," , ","vQ25m28=",string(vQ25m28,f2)," , ","vQ25m29=",string(vQ25m29,f2)," , ","vQ25m30=",string(vQ25m30,f2)," , ","vQ25m31=",string(vQ25m31,f2)," , ","vQ25m88=",string(vQ25m88,f2)))).
COMPUTE Q22 = Rtrim(Ltrim(concat("vQ22m01=",string(vQ22m01,f2)," , ","vQ22m02=",string(vQ22m02,f2)," , ","vQ22m03=",string(vQ22m03,f2)," , ","vQ22m04=",string(vQ22m04,f2)," , ","vQ22m05=",string(vQ22m05,f2)," , ","vQ22m06=",string(vQ22m06,f2)," , ","vQ22m07=",string(vQ22m07,f2)," , ","vQ22m08=",string(vQ22m08,f2)," , ","vQ22m09=",string(vQ22m09,f2)," , ","vQ22m10=",string(vQ22m10,f2)," , ","vQ22m11=",string(vQ22m11,f2)," , ","vQ22m12=",string(vQ22m12,f2)," , ","vQ22m13=",string(vQ22m13,f2)," , ","vQ22m14=",string(vQ22m14,f2)," , ","vQ22m15=",string(vQ22m15,f2)," , ","vQ22m16=",string(vQ22m16,f2)," , ","vQ22m17=",string(vQ22m17,f2)," , ","vQ22m18=",string(vQ22m18,f2)," , ","vQ22m19=",string(vQ22m19,f2)," , ","vQ22m20=",string(vQ22m20,f2)," , ","vQ22m21=",string(vQ22m21,f2)," , ","vQ22m22=",string(vQ22m22,f2)," , ","vQ22m23=",string(vQ22m23,f2)," , ","vQ22m24=",string(vQ22m24,f2)," , ","vQ22m25=",string(vQ22m25,f2)," , ","vQ22m26=",string(vQ22m26,f2)," , ","vQ22m27=",string(vQ22m27,f2)," , ","vQ22m28=",string(vQ22m28,f2)," , ","vQ22m29=",string(vQ22m29,f2)," , ","vQ22m30=",string(vQ22m30,f2)," , ","vQ22m31=",string(vQ22m31,f2)," , ","vQ22m32=",string(vQ22m32,f2)," , ","vQ22m33=",string(vQ22m33,f2)," , ","vQ22m34=",string(vQ22m34,f2)," , ","vQ22m35=",string(vQ22m35,f2)," , ","vQ22m36=",string(vQ22m36,f2)," , ","vQ22m37=",string(vQ22m37,f2)," , ","vQ22m38=",string(vQ22m38,f2)," , ","vQ22m39=",string(vQ22m39,f2)," , ","vQ22m40=",string(vQ22m40,f2)," , ","vQ22m88=",string(vQ22m88,f2)))).
COMPUTE Q23 = Rtrim(Ltrim(concat("vQ23m01=",string(vQ23m01,f2)," , ","vQ23m02=",string(vQ23m02,f2)," , ","vQ23m03=",string(vQ23m03,f2)," , ","vQ23m04=",string(vQ23m04,f2)," , ","vQ23m05=",string(vQ23m05,f2)," , ","vQ23m06=",string(vQ23m06,f2)," , ","vQ23m07=",string(vQ23m07,f2)," , ","vQ23m08=",string(vQ23m08,f2)," , ","vQ23m09=",string(vQ23m09,f2)," , ","vQ23m10=",string(vQ23m10,f2)," , ","vQ23m11=",string(vQ23m11,f2)," , ","vQ23m12=",string(vQ23m12,f2)," , ","vQ23m13=",string(vQ23m13,f2)," , ","vQ23m14=",string(vQ23m14,f2)," , ","vQ23m15=",string(vQ23m15,f2)," , ","vQ23m16=",string(vQ23m16,f2)," , ","vQ23m17=",string(vQ23m17,f2)," , ","vQ23m18=",string(vQ23m18,f2)," , ","vQ23m19=",string(vQ23m19,f2)," , ","vQ23m20=",string(vQ23m20,f2)," , ","vQ23m21=",string(vQ23m21,f2)," , ","vQ23m22=",string(vQ23m22,f2)," , ","vQ23m23=",string(vQ23m23,f2)," , ","vQ23m24=",string(vQ23m24,f2)," , ","vQ23m25=",string(vQ23m25,f2)," , ","vQ23m26=",string(vQ23m26,f2)," , ","vQ23m27=",string(vQ23m27,f2)," , ","vQ23m88=",string(vQ23m88,f2)))).
COMPUTE Q26 = Rtrim(Ltrim(concat("vQ26m01=",string(vQ26m01,f2)," , ","vQ26m02=",string(vQ26m02,f2)," , ","vQ26m03=",string(vQ26m03,f2)," , ","vQ26m04=",string(vQ26m04,f2)," , ","vQ26m05=",string(vQ26m05,f2)," , ","vQ26m06=",string(vQ26m06,f2)," , ","vQ26m07=",string(vQ26m07,f2)," , ","vQ26m08=",string(vQ26m08,f2)," , ","vQ26m09=",string(vQ26m09,f2)," , ","vQ26m10=",string(vQ26m10,f2)," , ","vQ26m11=",string(vQ26m11,f2)," , ","vQ26m12=",string(vQ26m12,f2)," , ","vQ26m13=",string(vQ26m13,f2)," , ","vQ26m14=",string(vQ26m14,f2)," , ","vQ26m15=",string(vQ26m15,f2)," , ","vQ26m16=",string(vQ26m16,f2)," , ","vQ26m17=",string(vQ26m17,f2)," , ","vQ26m18=",string(vQ26m18,f2)," , ","vQ26m19=",string(vQ26m19,f2)," , ","vQ26m20=",string(vQ26m20,f2)," , ","vQ26m21=",string(vQ26m21,f2)," , ","vQ26m22=",string(vQ26m22,f2)," , ","vQ26m23=",string(vQ26m23,f2)," , ","vQ26m24=",string(vQ26m24,f2)," , ","vQ26m25=",string(vQ26m25,f2)," , ","vQ26m26=",string(vQ26m26,f2)," , ","vQ26m27=",string(vQ26m27,f2)," , ","vQ26m28=",string(vQ26m28,f2)," , ","vQ26m29=",string(vQ26m29,f2)," , ","vQ26m88=",string(vQ26m88,f2)))).
COMPUTE Q27 = Rtrim(Ltrim(concat("vQ27m01=",string(vQ27m01,f2)," , ","vQ27m02=",string(vQ27m02,f2)," , ","vQ27m03=",string(vQ27m03,f2)," , ","vQ27m04=",string(vQ27m04,f2)," , ","vQ27m05=",string(vQ27m05,f2)," , ","vQ27m06=",string(vQ27m06,f2)," , ","vQ27m07=",string(vQ27m07,f2)," , ","vQ27m88=",string(vQ27m88,f2)))).
COMPUTE Q30 = Rtrim(Ltrim(concat("vQ30m01=",string(vQ30m01,f2)," , ","vQ30m02=",string(vQ30m02,f2)," , ","vQ30m03=",string(vQ30m03,f2)," , ","vQ30m04=",string(vQ30m04,f2)," , ","vQ30m05=",string(vQ30m05,f2)," , ","vQ30m06=",string(vQ30m06,f2)," , ","vQ30m07=",string(vQ30m07,f2)," , ","vQ30m08=",string(vQ30m08,f2)," , ","vQ30m90=",string(vQ30m90,f2)))).
COMPUTE Q31 = Rtrim(Ltrim(concat("vQ31m01=",string(vQ31m01,f2)," , ","vQ31m02=",string(vQ31m02,f2)," , ","vQ31m03=",string(vQ31m03,f2)," , ","vQ31m04=",string(vQ31m04,f2)," , ","vQ31m05=",string(vQ31m05,f2)," , ","vQ31m06=",string(vQ31m06,f2)," , ","vQ31m07=",string(vQ31m07,f2)," , ","vQ31m08=",string(vQ31m08,f2)," , ","vQ31m90=",string(vQ31m90,f2)))).
COMPUTE ZE2 = Rtrim(Ltrim(concat("vZE2m01=",string(vZE2m01,f2)," , ","vZE2m02=",string(vZE2m02,f2)," , ","vZE2m03=",string(vZE2m03,f2)))).

*K1.
vector a=vK1m01 to vK1m90.
COMPUTE #K1zero = (SUM(vK1m01 TO vK1m90) = 0).
loop #i=1 to 14.
do if (any(a(#i),0,1) & any(a(#i+1),90))
| (any(a(#i),90) and not any(a(#i+1),90))
| #K1zero=1.
compute m1101=Rtrim(Ltrim(K1)).
compute p1101="K1至少選1項或選特殊碼應一致".
end if.
end loop.
exec.

*K2.
vector a=vK2m01 to vK2m90.
COMPUTE #K2zero = (SUM(vK2m01 TO vK2m90) = 0).
loop #i=1 to 13.
do if (any(a(#i),0,1) & any(a(#i+1),90))
| (any(a(#i),90) and not any(a(#i+1),90))
| #K2zero=1.
compute m1102=Rtrim(Ltrim(K2)).
compute p1102="K2至少選1項或選特殊碼應一致".
end if.
end loop.
exec.

*KFB3.
vector a=vKFB3m01 to vKFB3m88.
COMPUTE #KFB3zero = (SUM(vKFB3m01 TO vKFB3m88) = 0).
loop #i=1 to 17.
do if (any(a(#i),0,1) & any(a(#i+1),96))
| (any(a(#i),96) and not any(a(#i+1),96))
| #KFB3zero=1.
compute m1103=Rtrim(Ltrim(KFB3)).
compute p1103="KFB3至少選1項或選特殊碼應一致".
end if.
end loop.
exec.

*KFB4.
vector a=vKFB4m01 to vKFB4m88.
COMPUTE #KFB4zero = (SUM(vKFB4m01 TO vKFB4m88) = 0).
loop #i=1 to 18.
do if (any(a(#i),0,1) & any(a(#i+1),96))
| (any(a(#i),96) and not any(a(#i+1),96))
| #KFB4zero=1.
compute m1104=Rtrim(Ltrim(KFB4)).
compute p1104="KFB4至少選1項或選特殊碼應一致".
end if.
end loop.
exec.

*KIG3.
vector a=vKIG3m01 to vKIG3m88.
COMPUTE #KIG3zero = (SUM(vKIG3m01 TO vKIG3m88) = 0).
loop #i=1 to 17.
do if (any(a(#i),0,1) & any(a(#i+1),96))
| (any(a(#i),96) and not any(a(#i+1),96))
| #KIG3zero=1.
compute m1105=Rtrim(Ltrim(KIG3)).
compute p1105="KIG3至少選1項或選特殊碼應一致".
end if.
end loop.
exec.

*KIG4.
vector a=vKIG4m01 to vKIG4m88.
COMPUTE #KIG4zero = (SUM(vKIG4m01 TO vKIG4m88) = 0).
loop #i=1 to 14.
do if (any(a(#i),0,1) & any(a(#i+1),96))
| (any(a(#i),96) and not any(a(#i+1),96))
| #KIG4zero=1.
compute m1106=Rtrim(Ltrim(KIG4)).
compute p1106="KIG4至少選1項或選特殊碼應一致".
end if.
end loop.
exec.

*KTT3.
vector a=vKTT3m01 to vKTT3m88.
COMPUTE #KTT3zero = (SUM(vKTT3m01 TO vKTT3m88) = 0).
loop #i=1 to 16.
do if (any(a(#i),0,1) & any(a(#i+1),96))
| (any(a(#i),96) and not any(a(#i+1),96))
| #KTT3zero=1.
compute m1107=Rtrim(Ltrim(KTT3)).
compute p1107="KTT3至少選1項或選特殊碼應一致".
end if.
end loop.
exec.

*KTT4.
vector a=vKTT4m01 to vKTT4m88.
COMPUTE #KTT4zero = (SUM(vKTT4m01 TO vKTT4m88) = 0).
loop #i=1 to 14.
do if (any(a(#i),0,1) & any(a(#i+1),96))
| (any(a(#i),96) and not any(a(#i+1),96))
| #KTT4zero=1.
compute m1108=Rtrim(Ltrim(KTT4)).
compute p1108="KTT4至少選1項或選特殊碼應一致".
end if.
end loop.
exec.

*KTT5.
vector a=vKTT5m01 to vKTT5m88.
COMPUTE #KTT5zero = (SUM(vKTT5m01 TO vKTT5m88) = 0).
loop #i=1 to 12.
do if (any(a(#i),0,1) & any(a(#i+1),96))
| (any(a(#i),96) and not any(a(#i+1),96))
| #KTT5zero=1.
compute m1109=Rtrim(Ltrim(KTT5)).
compute p1109="KTT5至少選1項或選特殊碼應一致".
end if.
end loop.
exec.

*K3.
vector a=vK3m01 to vK3m90.
COMPUTE #K3zero = (SUM(vK3m01 TO vK3m90) = 0).
loop #i=1 to 10.
do if (any(a(#i),0,1) & any(a(#i+1),90))
| (any(a(#i),90) and not any(a(#i+1),90))
| #K3zero=1.
compute m1110=Rtrim(Ltrim(K3)).
compute p1110="K3至少選1項或選特殊碼應一致".
end if.
end loop.
exec.

*E2.
vector a=vE2m01 to vE2m88.
COMPUTE #E2zero = (SUM(vE2m01 TO vE2m88) = 0).
loop #i=1 to 4.
do if (any(a(#i),0,1) & any(a(#i+1),96))
| (any(a(#i),96) and not any(a(#i+1),96))
| #E2zero=1.
compute m1111=Rtrim(Ltrim(E2)).
compute p1111="E2至少選1項或選特殊碼應一致".
end if.
end loop.
exec.

*E13.
vector a=vE13m01 to vE13m88.
COMPUTE #E13zero = (SUM(vE13m01 TO vE13m88) = 0).
loop #i=1 to 6.
do if (any(a(#i),0,1) & any(a(#i+1),96))
| (any(a(#i),96) and not any(a(#i+1),96))
| #E13zero=1.
compute m1112=Rtrim(Ltrim(E13)).
compute p1112="E13至少選1項或選特殊碼應一致".
end if.
end loop.
exec.

*G7.
vector a=vG7m01 to vG7m90.
COMPUTE #G7zero = (SUM(vG7m01 TO vG7m90) = 0).
loop #i=1 to 13.
do if (any(a(#i),0,1) & any(a(#i+1),90))
| (any(a(#i),90) and not any(a(#i+1),90))
| #G7zero=1.
compute m1113=Rtrim(Ltrim(G7)).
compute p1113="G7至少選1項或選特殊碼應一致".
end if.
end loop.
exec.

*G8.
vector a=vG8m01 to vG8m90.
COMPUTE #G8zero = (SUM(vG8m01 TO vG8m90) = 0).
loop #i=1 to 17.
do if (any(a(#i),0,1) & any(a(#i+1),90))
| (any(a(#i),90) and not any(a(#i+1),90))
| #G8zero=1.
compute m1114=Rtrim(Ltrim(G8)).
compute p1114="G8至少選1項或選特殊碼應一致".
end if.
end loop.
exec.

*G9.
vector a=vG9m01 to vG9m90.
COMPUTE #G9zero = (SUM(vG9m01 TO vG9m90) = 0).
loop #i=1 to 14.
do if (any(a(#i),0,1) & any(a(#i+1),90))
| (any(a(#i),90) and not any(a(#i+1),90))
| #G9zero=1.
compute m1115=Rtrim(Ltrim(G9)).
compute p1115="G9至少選1項或選特殊碼應一致".
end if.
end loop.
exec.

*G10.
vector a=vG10m01 to vG10m90.
COMPUTE #G10zero = (SUM(vG10m01 TO vG10m90) = 0).
loop #i=1 to 20.
do if (any(a(#i),0,1) & any(a(#i+1),90))
| (any(a(#i),90) and not any(a(#i+1),90))
| #G10zero=1.
compute m1116=Rtrim(Ltrim(G10)).
compute p1116="G10至少選1項或選特殊碼應一致".
end if.
end loop.
exec.

*G11.
vector a=vG11m01 to vG11m90.
COMPUTE #G11zero = (SUM(vG11m01 TO vG11m90) = 0).
loop #i=1 to 6.
do if (any(a(#i),0,1) & any(a(#i+1),90))
| (any(a(#i),90) and not any(a(#i+1),90))
| #G11zero=1.
compute m1117=Rtrim(Ltrim(G11)).
compute p1117="G11至少選1項或選特殊碼應一致".
end if.
end loop.
exec.

*B7a.
vector a=vB7am01 to vB7am88.
COMPUTE #B7azero = (SUM(vB7am01 TO vB7am88) = 0).
loop #i=1 to 54.
do if (any(a(#i),0,1) & any(a(#i+1),96))
| (any(a(#i),96) and not any(a(#i+1),96))
| #B7azero=1.
compute m1118=Rtrim(Ltrim(B7a)).
compute p1118="B7a至少選1項或選特殊碼應一致".
end if.
end loop.
exec.

*B8.
vector a=vB8m01 to vB8m88.
COMPUTE #B8zero = (SUM(vB8m01 TO vB8m88) = 0).
loop #i=1 to 10.
do if (any(a(#i),0,1) & any(a(#i+1),96))
| (any(a(#i),96) and not any(a(#i+1),96))
| #B8zero=1.
compute m1119=Rtrim(Ltrim(B8)).
compute p1119="B8至少選1項或選特殊碼應一致".
end if.
end loop.
exec.

*G3.
vector a=vG3m01 to vG3m88.
COMPUTE #G3zero = (SUM(vG3m01 TO vG3m88) = 0).
loop #i=1 to 32.
do if (any(a(#i),0,1) & any(a(#i+1),96))
| (any(a(#i),96) and not any(a(#i+1),96))
| #G3zero=1.
compute m1120=Rtrim(Ltrim(G3)).
compute p1120="G3至少選1項或選特殊碼應一致".
end if.
end loop.
exec.

*F5.
vector a=vF5m01 to vF5m88.
COMPUTE #F5zero = (SUM(vF5m01 TO vF5m88) = 0).
loop #i=1 to 8.
do if (any(a(#i),0,1) & any(a(#i+1),96))
| (any(a(#i),96) and not any(a(#i+1),96))
| #F5zero=1.
compute m1121=Rtrim(Ltrim(F5)).
compute p1121="F5至少選1項或選特殊碼應一致".
end if.
end loop.
exec.

*C3.
vector a=vC3m01 to vC3m88.
COMPUTE #C3zero = (SUM(vC3m01 TO vC3m88) = 0).
loop #i=1 to 11.
do if (any(a(#i),0,1) & any(a(#i+1),96))
| (any(a(#i),96) and not any(a(#i+1),96))
| #C3zero=1.
compute m1122=Rtrim(Ltrim(C3)).
compute p1122="C3至少選1項或選特殊碼應一致".
end if.
end loop.
exec.

*JB1.
vector a=vJB1m01 to vJB1m90.
COMPUTE #JB1zero = (SUM(vJB1m01 TO vJB1m90) = 0).
loop #i=1 to 12.
do if (any(a(#i),0,1) & any(a(#i+1),90))
| (any(a(#i),90) and not any(a(#i+1),90))
| #JB1zero=1.
compute m1123=Rtrim(Ltrim(JB1)).
compute p1123="JB1至少選1項或選特殊碼應一致".
end if.
end loop.
exec.

*JB2.
vector a=vJB2m01 to vJB2m90.
COMPUTE #JB2zero = (SUM(vJB2m01 TO vJB2m90) = 0).
loop #i=1 to 8.
do if (any(a(#i),0,1) & any(a(#i+1),90))
| (any(a(#i),90) and not any(a(#i+1),90))
| #JB2zero=1.
compute m1124=Rtrim(Ltrim(JB2)).
compute p1124="JB2至少選1項或選特殊碼應一致".
end if.
end loop.
exec.

*M2.
vector a=vM2m01 to vM2m88.
COMPUTE #M2zero = (SUM(vM2m01 TO vM2m88) = 0).
loop #i=1 to 16.
do if (any(a(#i),0,1) & any(a(#i+1),96))
| (any(a(#i),96) and not any(a(#i+1),96))
| #M2zero=1.
compute m1125=Rtrim(Ltrim(M2)).
compute p1125="M2至少選1項或選特殊碼應一致".
end if.
end loop.
exec.

*M3.
vector a=vM3m01 to vM3m88.
COMPUTE #M3zero = (SUM(vM3m01 TO vM3m88) = 0).
loop #i=1 to 13.
do if (any(a(#i),0,1) & any(a(#i+1),96))
| (any(a(#i),96) and not any(a(#i+1),96))
| #M3zero=1.
compute m1126=Rtrim(Ltrim(M3)).
compute p1126="M3至少選1項或選特殊碼應一致".
end if.
end loop.
exec.

*Q20.
vector a=vQ20m01 to vQ20m90.
COMPUTE #Q20zero = (SUM(vQ20m01 TO vQ20m90) = 0).
loop #i=1 to 7.
do if (any(a(#i),0,1) & any(a(#i+1),90))
| (any(a(#i),90) and not any(a(#i+1),90))
| #Q20zero=1.
compute m1127=Rtrim(Ltrim(Q20)).
compute p1127="Q20至少選1項或選特殊碼應一致".
end if.
end loop.
exec.

*Q25.
vector a=vQ25m01 to vQ25m88.
COMPUTE #Q25zero = (SUM(vQ25m01 TO vQ25m88) = 0).
loop #i=1 to 31.
do if (any(a(#i),0,1) & any(a(#i+1),96))
| (any(a(#i),96) and not any(a(#i+1),96))
| #Q25zero=1.
compute m1128=Rtrim(Ltrim(Q25)).
compute p1128="Q25至少選1項或選特殊碼應一致".
end if.
end loop.
exec.

*Q22.
vector a=vQ22m01 to vQ22m88.
COMPUTE #Q22zero = (SUM(vQ22m01 TO vQ22m88) = 0).
loop #i=1 to 40.
do if (any(a(#i),0,1) & any(a(#i+1),96))
| (any(a(#i),96) and not any(a(#i+1),96))
| #Q22zero=1.
compute m1129=Rtrim(Ltrim(Q22)).
compute p1129="Q22至少選1項或選特殊碼應一致".
end if.
end loop.
exec.

*Q23.
vector a=vQ23m01 to vQ23m88.
COMPUTE #Q23zero = (SUM(vQ23m01 TO vQ23m88) = 0).
loop #i=1 to 27.
do if (any(a(#i),0,1) & any(a(#i+1),96))
| (any(a(#i),96) and not any(a(#i+1),96))
| #Q23zero=1.
compute m1130=Rtrim(Ltrim(Q23)).
compute p1130="Q23至少選1項或選特殊碼應一致".
end if.
end loop.
exec.

*Q26.
vector a=vQ26m01 to vQ26m88.
COMPUTE #Q26zero = (SUM(vQ26m01 TO vQ26m88) = 0).
loop #i=1 to 29.
do if (any(a(#i),0,1) & any(a(#i+1),96))
| (any(a(#i),96) and not any(a(#i+1),96))
| #Q26zero=1.
compute m1131=Rtrim(Ltrim(Q26)).
compute p1131="Q26至少選1項或選特殊碼應一致".
end if.
end loop.
exec.

*Q27.
vector a=vQ27m01 to vQ27m88.
COMPUTE #Q27zero = (SUM(vQ27m01 TO vQ27m88) = 0).
loop #i=1 to 7.
do if (any(a(#i),0,1) & any(a(#i+1),96))
| (any(a(#i),96) and not any(a(#i+1),96))
| #Q27zero=1.
compute m1132=Rtrim(Ltrim(Q27)).
compute p1132="Q27至少選1項或選特殊碼應一致".
end if.
end loop.
exec.

*Q30.
vector a=vQ30m01 to vQ30m90.
COMPUTE #Q30zero = (SUM(vQ30m01 TO vQ30m90) = 0).
loop #i=1 to 8.
do if (any(a(#i),0,1) & any(a(#i+1),90))
| (any(a(#i),90) and not any(a(#i+1),90))
| #Q30zero=1.
compute m1133=Rtrim(Ltrim(Q30)).
compute p1133="Q30至少選1項或選特殊碼應一致".
end if.
end loop.
exec.

*Q31.
vector a=vQ31m01 to vQ31m90.
COMPUTE #Q31zero = (SUM(vQ31m01 TO vQ31m90) = 0).
loop #i=1 to 8.
do if (any(a(#i),0,1) & any(a(#i+1),90))
| (any(a(#i),90) and not any(a(#i+1),90))
| #Q31zero=1.
compute m1134=Rtrim(Ltrim(Q31)).
compute p1134="Q31至少選1項或選特殊碼應一致".
end if.
end loop.
exec.

*ZE2.
vector a=vZE2m01 to vZE2m03.
COMPUTE #ZE2zero = (SUM(vZE2m01 TO vZE2m03) = 0).
loop #i=1 to 2.
do if (any(a(#i),0,1) & any(a(#i+1),96))
| (any(a(#i),96) and not any(a(#i+1),96))
| #ZE2zero=1.
compute m1135=Rtrim(Ltrim(ZE2)).
compute p1135="ZE2至少選1項或選特殊碼應一致".
end if.
end loop.
exec.

**3.1複選互斥邏輯.
*K1=90 複選題內互斥.
do if any(vK1m90,1) & any(1,vK1m01 to vK1m88).
compute m1201=Rtrim(Ltrim(K1)).
compute p1201="K1(90)複選題選項應互斥".
end if.
Exec.

*K2=90 複選題內互斥.
do if any(vK2m90,1) & any(1,vK2m01 to vK2m88).
compute m1202=Rtrim(Ltrim(K2)).
compute p1202="K2(90)複選題選項應互斥".
end if.
Exec.

*K3=90 複選題內互斥.
do if any(vK3m90,1) & any(1,vK3m01 to vK3m88).
compute m1203=Rtrim(Ltrim(K3)).
compute p1203="K3(90)複選題選項應互斥".
end if.
Exec.

*Q20=90 複選題內互斥.
do if any(vQ20m90,1) & any(1,vQ20m01 to vQ20m88).
compute m1204=Rtrim(Ltrim(Q20)).
compute p1204="Q20(90)複選題選項應互斥".
end if.
Exec.

*Q30=90 複選題內互斥.
do if any(vQ30m90,1) & any(1,vQ30m01 to vQ30m08).
compute m1205=Rtrim(Ltrim(Q30)).
compute p1205="Q30(90)複選題選項應互斥".
end if.
Exec.

*Q31=90 複選題內互斥.
do if any(vQ31m90,1) & any(1,vQ31m01 to vQ31m08).
compute m1206=Rtrim(Ltrim(Q31)).
compute p1206="Q31(90)複選題選項應互斥".
end if.
Exec.

*ZE2=3 複選題內互斥.
do if any(vZE2m03,1) & any(1,vZE2m01 to vZE2m02).
compute m1207=Rtrim(Ltrim(ZE2)).
compute p1207="ZE2(3)複選題選項應互斥".
end if.
Exec.

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

* Encoding: UTF-8.
**EXTERNAL CHECK ITEMS.
* SYNTAXWORK_BEGIN_EXTERNAL_CHECKS.
* external check row 2: sel_gen,O1.
do if sel_gen=2 & any(vO1,12,13).
compute m1701=concat("sel_gen=",string(sel_gen,n2),",vO1=",string(vO1,n2)).
compute p1701="受訪者為女性,但vO1工作狀況選(12)服義務役或(13)服(研發)替代役。".
end if.
exec.

* external check row 3: A1,A2,A3,A9.
do if vA1>=57 & any(vA3,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,97,98) & any(vA9,1,2).
compute m1702=concat(
  "vA1=",
  string(vA1,n4),
  ",vA2=",
  string(vA2,n2),
  ",vA3=",
  string(vA3,n2),
  ",vA9=",
  string(vA9,n2)
).
compute p1702="57年施行九年國民義務教育,出生年在57年次以後(57歲及以下),且為台灣出生者(vA3選1-22、97、98),於vA9教育程度,不應為(01)不識字、(02)自修/小學 | (年齡計算以114年減出生年)。".
end if.
exec.

* external check row 4: A1,A2,A9.
do if vA1>92 & any(vA9,7,8).
compute m1703=concat(
  "vA1=",
  string(vA1,n4),
  ",vA2=",
  string(vA2,n2),
  ",vA9=",
  string(vA9,n2)
).
compute p1703="出生年超過民國92年次(未滿22歲者),vA9教育程度不應為(07)碩士、(08)博士 | (年齡計算以114年減出生年)。".
end if.
exec.

* external check row 5: B2.
do if not(any(vB2,9797,9898)) & vB2>1200.
compute m1704=concat("vB2=",string(vB2,n5)).
compute p1704="vB2看電視的平常日(週一到週五),一整天看超過12小時,列出確認。".
end if.
exec.

* external check row 6: B4.
do if not(any(vB4,9797,9898)) & vB4>1200.
compute m1705=concat("vB4=",string(vB4,n5)).
compute p1705="vB4有看電視的週六或週日,一整天看超過12小時,列出確認。".
end if.
exec.

* external check row 7: B6.
do if not(any(vB6,9797,9898)) & vB6>1200.
compute m1706=concat("vB6=",string(vB6,n5)).
compute p1706="vB6看電視新聞的那一天,一整天看超過12小時,列出確認。".
end if.
exec.

* external check row 8: C2.
do if not(any(vC2,9797,9898)) & vC2>1200.
compute m1707=concat("vC2=",string(vC2,n5)).
compute p1707="vC2有聽廣播的那一天,一整天聽超過12小時,列出確認。".
end if.
exec.

* external check row 9: D3.
do if not(any(vD3,9797,9898)) & vD3>1600.
compute m1708=concat("vD3=",string(vD3,n5)).
compute p1708="vD3有用手機的那一天,一整天用超過16小時,列出確認。".
end if.
exec.

* external check row 10: E5,E8,E11.
compute sumE5_E12_min=(trunc(vE5/100)*60 + mod(vE5,100)) + (trunc(vE6/100)*60 + mod(vE6,100)) + (trunc(vE8/100)*60 + mod(vE8,100)) + (trunc(vE9/100)*60 + mod(vE9,100)) + (trunc(vE11/100)*60 + mod(vE11,100)) + (trunc(vE12/100)*60 + mod(vE12,100)).
compute sumE5_E8_E11_min=(trunc(vE5/100)*60 + mod(vE5,100)) + (trunc(vE8/100)*60 + mod(vE8,100)) + (trunc(vE11/100)*60 + mod(vE11,100)).
do if not(any(vE5,9797,9898)) & not(any(vE8,9797,9898)) & not(any(vE11,9797,9898)) & ((trunc(vE5/100)*60 + mod(vE5,100)) + (trunc(vE8/100)*60 + mod(vE8,100)) + (trunc(vE11/100)*60 + mod(vE11,100)))>960.
compute m1709=concat(
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
compute p1709="各項裝置(手機、平板及電腦)因工作與課業而上網的時間相加超過16小時,列出確認。".
end if.
exec.

* external check row 11: E5,E8,E11.
compute sumE5_E12_min=(trunc(vE5/100)*60 + mod(vE5,100)) + (trunc(vE6/100)*60 + mod(vE6,100)) + (trunc(vE8/100)*60 + mod(vE8,100)) + (trunc(vE9/100)*60 + mod(vE9,100)) + (trunc(vE11/100)*60 + mod(vE11,100)) + (trunc(vE12/100)*60 + mod(vE12,100)).
compute sumE6_E9_E12_min=(trunc(vE6/100)*60 + mod(vE6,100)) + (trunc(vE9/100)*60 + mod(vE9,100)) + (trunc(vE12/100)*60 + mod(vE12,100)).
do if not(any(vE6,9797,9898)) & not(any(vE9,9797,9898)) & not(any(vE12,9797,9898)) & ((trunc(vE6/100)*60 + mod(vE6,100)) + (trunc(vE9/100)*60 + mod(vE9,100)) + (trunc(vE12/100)*60 + mod(vE12,100)))>960.
compute m1710=concat(
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
compute p1710="各項裝置(手機、平板及電腦)非因工作與課業而上網的時間相加超過16小時,列出確認。".
end if.
exec.

* external check row 12: E5,E6.
compute sumE5_E12_min=(trunc(vE5/100)*60 + mod(vE5,100)) + (trunc(vE6/100)*60 + mod(vE6,100)) + (trunc(vE8/100)*60 + mod(vE8,100)) + (trunc(vE9/100)*60 + mod(vE9,100)) + (trunc(vE11/100)*60 + mod(vE11,100)) + (trunc(vE12/100)*60 + mod(vE12,100)).
compute sumE5_E6_min=(trunc(vE5/100)*60 + mod(vE5,100)) + (trunc(vE6/100)*60 + mod(vE6,100)).
do if not(any(vE5,9797,9898)) & not(any(vE6,9797,9898)) & ((trunc(vE5/100)*60 + mod(vE5,100)) + (trunc(vE6/100)*60 + mod(vE6,100)))>960.
compute m1711=concat(
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
compute p1711="vE5、vE6使用手機上網的時間相加超過16小時。".
end if.
exec.

* external check row 13: E8,E9.
compute sumE5_E12_min=(trunc(vE5/100)*60 + mod(vE5,100)) + (trunc(vE6/100)*60 + mod(vE6,100)) + (trunc(vE8/100)*60 + mod(vE8,100)) + (trunc(vE9/100)*60 + mod(vE9,100)) + (trunc(vE11/100)*60 + mod(vE11,100)) + (trunc(vE12/100)*60 + mod(vE12,100)).
compute sumE8_E9_min=(trunc(vE8/100)*60 + mod(vE8,100)) + (trunc(vE9/100)*60 + mod(vE9,100)).
do if not(any(vE8,9797,9898)) & not(any(vE9,9797,9898)) & ((trunc(vE8/100)*60 + mod(vE8,100)) + (trunc(vE9/100)*60 + mod(vE9,100)))>960.
compute m1712=concat(
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
compute p1712="vE8、vE9使用平板上網的時間相加超過16小時。".
end if.
exec.

* external check row 14: E11,E12.
compute sumE5_E12_min=(trunc(vE5/100)*60 + mod(vE5,100)) + (trunc(vE6/100)*60 + mod(vE6,100)) + (trunc(vE8/100)*60 + mod(vE8,100)) + (trunc(vE9/100)*60 + mod(vE9,100)) + (trunc(vE11/100)*60 + mod(vE11,100)) + (trunc(vE12/100)*60 + mod(vE12,100)).
compute sumE11_E12_min=(trunc(vE11/100)*60 + mod(vE11,100)) + (trunc(vE12/100)*60 + mod(vE12,100)).
do if not(any(vE11,9797,9898)) & not(any(vE12,9797,9898)) & ((trunc(vE11/100)*60 + mod(vE11,100)) + (trunc(vE12/100)*60 + mod(vE12,100)))>960.
compute m1713=concat(
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
compute p1713="vE11、vE12使用電腦上網的時間相加超過16小時。".
end if.
exec.

* external check row 15: E5,E6,D3.
do if (vE5+vE6)>(vD3+200).
compute m1714=concat(
  "vE5=",
  string(vE5,n5),
  ",vE6=",
  string(vE6,n5),
  ",vD3=",
  string(vD3,n5)
).
compute p1714="vE5、vE6使用手機上網的時間相加大於vD3的時間2小時,列出確認。".
end if.
exec.

* external check row 17: F2.
do if not(any(vF2,9797,9898)) & vF2>500.
compute m1716=concat("vF2=",string(vF2,n5)).
compute p1716="vF2有讀雜誌(紙本),一整天看超過5小時,列出確認。".
end if.
exec.

* external check row 18: F4.
do if not(any(vF4,9797,9898)) & vF4>500.
compute m1717=concat("vF4=",string(vF4,n5)).
compute p1717="vF4有讀雜誌(網路),一整天看超過5小時,列出確認。".
end if.
exec.

* external check row 19: G2.
do if not(any(vG2,9797,9898)) & vG2>500.
compute m1718=concat("vG2=",string(vG2,n5)).
compute p1718="vG2有讀報紙(紙本),一整天看超過5小時,列出確認。".
end if.
exec.

* external check row 20: G5.
do if not(any(vG5,9797,9898)) & vG5>500.
compute m1719=concat("vG5=",string(vG5,n5)).
compute p1719="vG5有上網看新聞的那一天,一整天看超過5小時,列出確認。".
end if.
exec.

* external check row 21: H1,H4,H7.
do if range(vH1,0,990) & range(vH4,0,990) & vH7=997.
compute m1720=concat(
  "vH1=",
  string(vH1,n4),
  ",vH4=",
  string(vH4,n4),
  ",vH7=",
  string(vH7,n4)
).
compute p1720="vH1「面對面」接觸人數回答0~990且vH4「網路上」接觸人數回答0~990,在vH7「面對面」且「網路上」接觸的人數卻回答(997)不知道。".
end if.
exec.

* external check row 22: H7,H7_1,H7_2,H7_3.
do if (not(any(vH7,991,997,998)) & vH7>30) | (not(any(vH7_1,991,997,998)) & vH7_1>30) | (not(any(vH7_2,991,997,998)) & vH7_2>30) | (not(any(vH7_3,991,997,998)) & vH7_3>30).
compute m1721=concat(
  "vH7=",
  string(vH7,n4),
  ",vH7_1=",
  string(vH7_1,n4),
  ",vH7_2=",
  string(vH7_2,n4),
  ",vH7_3=",
  string(vH7_3,n4)
).
compute p1721="vH7-vH7_3平常一天「面對面」且「網路上」接觸的人數超過30人,列出確認。".
end if.
exec.

* external check row 23: Q24.
do if not(any(vQ24g1,997,998)) & vQ24g1>35.
compute m1722=concat("vQ24g1=",string(vQ24g1,n4)).
compute p1722="vQ24看談話性政論節目,每星期看超過35小時,列出確認。".
end if.
exec.

* external check row 24: Q21.
do if not(any(vQ21g1,997,998)) & vQ21g1>35.
compute m1723=concat("vQ21g1=",string(vQ21g1,n4)).
compute p1723="vQ21看政治人物或政治網紅影片,每星期看超過35小時,列出確認。".
end if.
exec.

* external check row 25: Q26A.
do if not(any(vQ26Ag1,997,998)) & vQ26Ag1>35.
compute m1724=concat("vQ26Ag1=",string(vQ26Ag1,n4)).
compute p1724="vQ26A聽政治或公共事務播客,每星期聽超過35小時,列出確認。".
end if.
exec.

* external check row 26: Q28.
do if (not(any(vQ28,991,997,998)) & vQ28>50).
compute m1725=concat("vQ28=",string(vQ28,n4)).
compute p1725="vQ28經常一起討論政治或公共事務的人數超過50人,列出確認。".
end if.
exec.

* external check row 27: H8.
do if (not(any(vH8,991,997,998)) & vH8>50).
compute m1726=concat("vH8=",string(vH8,n4)).
compute p1726="vH8經常會一起討論「個人」問題或心事的人超過50人,列出確認。".
end if.
exec.

* external check row 28: I2.
do if not(any(vI2,9797,9898)) & vI2>1200.
compute m1727=concat("vI2=",string(vI2,n5)).
compute p1727="vI2看戲劇節目的平常日(週一到週五),一整天看超過12小時,列出確認。".
end if.
exec.

* external check row 29: I4.
do if not(any(vI4,9797,9898)) & vI4>1200.
compute m1728=concat("vI4=",string(vI4,n5)).
compute p1728="vI4看戲劇節目的週六或週日,一整天看超過12小時,列出確認。".
end if.
exec.

* external check row 30: KFB2.
do if not(any(vKFB2,9797,9898)) & vKFB2>1600.
compute m1729=concat("vKFB2=",string(vKFB2,n5)).
compute p1729="vKFB2有使用臉書,一整天用超過16小時,列出確認。".
end if.
exec.

* external check row 31: KIG2.
do if not(any(vKIG2,9797,9898)) & vKIG2>1600.
compute m1730=concat("vKIG2=",string(vKIG2,n5)).
compute p1730="vKIG2有使用IG,一整天用超過16小時,列出確認。".
end if.
exec.

* external check row 32: KLI2.
do if not(any(vKLI2,9797,9898)) & vKLI2>1600.
compute m1731=concat("vKLI2=",string(vKLI2,n5)).
compute p1731="vKLI2有使用LINE,一整天用超過16小時,列出確認。".
end if.
exec.

* external check row 33: KTT2.
do if not(any(vKTT2,9797,9898)) & vKTT2>1600.
compute m1732=concat("vKTT2=",string(vKTT2,n5)).
compute p1732="vKTT2有使用抖音(TikTok),一整天用超過16小時,列出確認。".
end if.
exec.

* external check row 34: KYT2.
do if not(any(vKYT2,9797,9898)) & vKYT2>1600.
compute m1733=concat("vKYT2=",string(vKYT2,n5)).
compute p1733="vKYT2有使用YouTube,一整天用超過16小時,列出確認。".
end if.
exec.

* external check row 35: P5_2.
do if not(any(vP5_2,9797,9898)) & vP5_2>1600.
compute m1734=concat("vP5_2=",string(vP5_2,n5)).
compute p1734="vP5_2有使用Threads,一整天用超過16小時,列出確認。".
end if.
exec.

* external check row 36: M1.
do if not(any(vM1g01,9797,9898)) & not(any(vM1g02,9797,9898)) & ((trunc(vM1g01/100)*60 + mod(vM1g01,100)) + (trunc(vM1g02/100)*60 + mod(vM1g02,100)))>3840.
compute m1735=concat("vM1g01=",string(vM1g01,n2),",vM1g02=",string(vM1g02,n2)).
compute p1735="vM1玩電玩遊戲一週超過64小時列出確認。".
end if.
exec.

* external check row 37: vA1,O1.
do if vA1>74 & vO1=9.
compute m1736=concat("vA1=",string(vA1,n4),",vO1=",string(vO1,n2)).
compute p1736="出生年超過民國74年次(未滿40歲者),vO1目前工作不應為(09)已經退休 | (年齡計算以114減出生年)。".
end if.
exec.

* external check row 41: K1,KTT4.
do if vK1m11=1 & vKTT4m13~=1 & vKTT4m14~=1.
compute m1740=concat(
  "vK1m11=",
  string(vK1m11,n2),
  ",vKTT4m13=",
  string(vKTT4m13,n2),
  ",vKTT4m14=",
  string(vKTT4m14,n2)
).
compute p1740="K1有選(11)抖音,KTT4非選(97)不知道(98)拒答者,沒有選(13)分享或轉貼、轉寄影片,也沒有選(14)傳送訊息或視訊".
end if.
exec.

* external check row 42: Q5,Q6,Q7,Q8,Q9.
do if vQ5=1 & vQ6=1 & vQ7=1 & vQ8=1 & vQ9=1.
compute m1741=concat(
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
compute p1741="Q5答有透過網路接觸到政治消息,但Q6-Q9皆回答(01)從來沒有".
end if.
exec.

* external check row 43: Q10,Q11,Q12,Q13,Q14.
do if vQ10=1 & vQ11=1 & vQ12=1 & vQ13=1 & vQ14=1.
compute m1742=concat(
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
compute p1742="Q10答有透過網路轉貼或分享政治消息,但Q11-Q14皆回答(01)從來沒有".
end if.
exec.

* external check row 44: Q47,Q51.
do if vQ47=0 & vQ51=1.
compute m1743=concat("vQ47=",string(vQ47,n4),",vQ51=",string(vQ51,n2)).
compute p1743="Q47答0分者,在Q51答(01)國民黨,請列出檢核。".
end if.
exec.

* external check row 45: Q48,Q51.
do if vQ48=0 & vQ51=2.
compute m1744=concat("vQ48=",string(vQ48,n4),",vQ51=",string(vQ51,n2)).
compute p1744="Q48答0分者,在Q51答(02)民進黨,請列出檢核。".
end if.
exec.

* external check row 46: Q62,Q51.
do if vQ62=0 & vQ51=8.
compute m1745=concat("vQ62=",string(vQ62,n4),",vQ51=",string(vQ51,n2)).
compute p1745="Q62答0分者,在Q51答(08)台灣民眾黨,請列出檢核。".
end if.
exec.

* external check row 47: Q53,P3_1.
do if vQ53=1 & vP3_1=0.
compute m1746=concat("vQ53=",string(vQ53,n2),",vP3_1=",string(vP3_1,n3)).
compute p1746="Q53答(01)儘快統一者,P3_1答0分者,請列出檢核。".
end if.
exec.

* external check row 48: Q53,P3_1.
do if vQ53=2 & vP3_1=10.
compute m1747=concat("vQ53=",string(vQ53,n2),",vP3_1=",string(vP3_1,n3)).
compute p1747="Q53答(02)儘快宣佈獨立,P3_1答10分者,請列出檢核。".
end if.
exec.

* SYNTAXWORK_END_EXTERNAL_CHECKS.
