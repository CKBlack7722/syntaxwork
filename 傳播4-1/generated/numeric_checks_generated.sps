* Encoding: UTF-8.

**NUMERIC CHECKS.

* SYNTAXWORK_BEGIN_NUMERIC.

*vZA=1,3 .
do if not range(vZA,1,3) | sys(vZA).
compute m101=concat("vZA=",string(vZA,f2)).
compute p101="vZA為不合理值或遺漏值".
compute s101=1.
end if.
Exec.

*vZA0=1,2 .
do if not range(vZA0,1,2) | sys(vZA0).
compute m102=concat("vZA0=",string(vZA0,f2)).
compute p102="vZA0為不合理值或遺漏值".
compute s102=1.
end if.
Exec.

*vZA0_1=1,2 .
do if not range(vZA0_1,1,2) | sys(vZA0_1).
compute m103=concat("vZA0_1=",string(vZA0_1,f2)).
compute p103="vZA0_1為不合理值或遺漏值".
compute s103=1.
end if.
Exec.

*vSF0=1 .
do if not range(vSF0,1,1) | sys(vSF0).
compute m104=concat("vSF0=",string(vSF0,f2)).
compute p104="vSF0為不合理值或遺漏值".
compute s104=1.
end if.
Exec.

*vA1=1,96 997,998 .
do if not range(vA1,1,96,997,998) | sys(vA1).
compute m105=concat("vA1=",string(vA1,f4)).
compute p105="vA1為不合理值或遺漏值".
compute s105=1.
end if.
Exec.

*vA2=1,12 97 997,998 .
do if not range(vA2,1,12,97,97,997,998) | sys(vA2).
compute m106=concat("vA2=",string(vA2,f2)).
compute p106="vA2為不合理值或遺漏值".
compute s106=1.
end if.
Exec.

*vA3=1,21 97,98 .
do if not range(vA3,1,21,97,98) | sys(vA3).
compute m107=concat("vA3=",string(vA3,f2)).
compute p107="vA3為不合理值或遺漏值".
compute s107=1.
end if.
Exec.

*vA4=1,2 97,98 .
do if not range(vA4,1,2,97,98) | sys(vA4).
compute m108=concat("vA4=",string(vA4,f2)).
compute p108="vA4為不合理值或遺漏值".
compute s108=1.
end if.
Exec.

*vA5city=1,29 .
do if not range(vA5city,1,29) | sys(vA5city).
compute m109=concat("vA5city=",string(vA5city,f2)).
compute p109="vA5city為不合理值或遺漏值".
compute s109=1.
end if.
Exec.

*vA5town=<long valid range; see do if range arguments below>.
do if not range(
  vA5town, 100, 103, 104, 105, 106, 108, 110, 111, 112, 114, 115, 116, 200, 201, 202, 203, 204, 205, 206, 207, 208, 209, 210, 211, 212, 220, 221, 222, 223, 224,
  226, 227, 228, 231, 232, 233, 234, 235, 236, 237, 238, 239, 241, 242, 243, 244, 247, 248, 249, 251, 252, 253, 260, 261, 262, 263, 264, 265, 266, 267, 268,
  269, 270, 272, 302, 303, 304, 305, 306, 307, 308, 310, 311, 312, 313, 314, 315, 320, 324, 325, 326, 327, 328, 330, 333, 334, 335, 336, 337, 338, 350, 351,
  352, 353, 354, 356, 357, 358, 360, 361, 362, 363, 364, 365, 366, 367, 368, 369, 400, 401, 402, 403, 404, 406, 407, 408, 411, 412, 413, 414, 420, 421, 422,
  423, 424, 426, 427, 428, 429, 432, 433, 434, 435, 436, 437, 438, 439, 500, 502, 503, 504, 505, 506, 507, 508, 509, 510, 511, 512, 513, 514, 515, 516, 520,
  521, 522, 523, 524, 525, 526, 527, 528, 530, 540, 541, 542, 544, 545, 546, 551, 552, 553, 555, 556, 557, 558, 602, 603, 604, 605, 606, 607, 608, 611, 612,
  613, 614, 615, 616, 621, 622, 623, 624, 625, 630, 631, 632, 633, 634, 635, 636, 637, 638, 640, 643, 646, 647, 648, 649, 651, 652, 653, 654, 655, 700, 701,
  702, 704, 708, 709, 710, 711, 712, 713, 714, 715, 716, 717, 718, 719, 720, 721, 722, 723, 724, 725, 726, 727, 730, 731, 732, 733, 734, 735, 736, 737, 741,
  742, 743, 744, 745, 800, 801, 802, 803, 804, 805, 806, 807, 811, 812, 813, 814, 815, 820, 821, 822, 823, 824, 825, 826, 827, 828, 829, 830, 831, 832, 833,
  840, 842, 843, 844, 845, 846, 847, 848, 849, 851, 852, 880, 881, 882, 883, 884, 885, 890, 891, 892, 893, 894, 896, 900, 901, 902, 903, 904, 905, 906, 907,
  908, 909, 911, 912, 913, 920, 921, 922, 923, 924, 925, 926, 927, 928, 929, 931, 932, 940, 941, 942, 943, 944, 945, 946, 947, 950, 951, 952, 953, 954, 955,
  956, 957, 958, 959, 961, 962, 963, 964, 965, 966, 970, 971, 972, 973, 974, 975, 976, 977, 978, 979, 981, 982, 983, 3001, 3002, 3003, 6001, 6002, 9997, 9998,
  9996
) | sys(vA5town).
compute m110=concat("vA5town=",string(vA5town,f4)).
compute p110="vA5town為不合理值或遺漏值".
compute s110=1.
end if.
Exec.

*vA6=1,88 97,98 .
do if not range(vA6,1,88,97,98) | sys(vA6).
compute m111=concat("vA6=",string(vA6,f2)).
compute p111="vA6為不合理值或遺漏值".
compute s111=1.
end if.
Exec.

*vA7=1,88 97,98 .
do if not range(vA7,1,88,97,98) | sys(vA7).
compute m112=concat("vA7=",string(vA7,f2)).
compute p112="vA7為不合理值或遺漏值".
compute s112=1.
end if.
Exec.

*vA8=1,88 97,98 .
do if not range(vA8,1,88,97,98) | sys(vA8).
compute m113=concat("vA8=",string(vA8,f2)).
compute p113="vA8為不合理值或遺漏值".
compute s113=1.
end if.
Exec.

*vA9=1,88 97,98 .
do if not range(vA9,1,88,97,98) | sys(vA9).
compute m114=concat("vA9=",string(vA9,f2)).
compute p114="vA9為不合理值或遺漏值".
compute s114=1.
end if.
Exec.

*vO1_1=1,88 97,98 .
do if not range(vO1_1,1,88,97,98) | sys(vO1_1).
compute m115=concat("vO1_1=",string(vO1_1,f2)).
compute p115="vO1_1為不合理值或遺漏值".
compute s115=1.
end if.
Exec.

*vO1=1,88 97 98 .
do if not range(vO1,1,88,97,97,98,98) | sys(vO1).
compute m116=concat("vO1=",string(vO1,f2)).
compute p116="vO1為不合理值或遺漏值".
compute s116=1.
end if.
Exec.

*vO2=1,88 97 98 .
do if not range(vO2,1,88,97,97,98,98) | sys(vO2).
compute m117=concat("vO2=",string(vO2,f2)).
compute p117="vO2為不合理值或遺漏值".
compute s117=1.
end if.
Exec.

*vO3=1,88 97 98 .
do if not range(vO3,1,88,97,97,98,98) | sys(vO3).
compute m118=concat("vO3=",string(vO3,f2)).
compute p118="vO3為不合理值或遺漏值".
compute s118=1.
end if.
Exec.

*vO4=0,5000 9991 9997 9998 .
do if not range(vO4,0,5000,9991,9991,9997,9997,9998,9998) | sys(vO4).
compute m119=concat("vO4=",string(vO4,f5)).
compute p119="vO4為不合理值或遺漏值".
compute s119=1.
end if.
Exec.

*vD1=1,3 97,98 .
do if not range(vD1,1,3,97,98) | sys(vD1).
compute m120=concat("vD1=",string(vD1,f2)).
compute p120="vD1為不合理值或遺漏值".
compute s120=1.
end if.
Exec.

*vD2=0.5,7 95 97,98 .
do if not range(vD2,0.5,7,95,95,97,98) | sys(vD2).
compute m121=concat("vD2=",string(vD2,f4)).
compute p121="vD2為不合理值或遺漏值".
compute s121=1.
end if.
Exec.

*vD3=1,2359 9797 9898 .
do if not range(vD3,1,2359,9797,9797,9898,9898) | sys(vD3).
compute m122=concat("vD3=",string(vD3,f5)).
compute p122="vD3為不合理值或遺漏值".
compute s122=1.
end if.
Exec.

*vD4sD4=1,2 .
do if not range(vD4sD4,1,2) | sys(vD4sD4).
compute m123=concat("vD4sD4=",string(vD4sD4,f2)).
compute p123="vD4sD4為不合理值或遺漏值".
compute s123=1.
end if.
Exec.

*vD4sD5=1,2 .
do if not range(vD4sD5,1,2) | sys(vD4sD5).
compute m124=concat("vD4sD5=",string(vD4sD5,f2)).
compute p124="vD4sD5為不合理值或遺漏值".
compute s124=1.
end if.
Exec.

*vD4sD6=1,2 .
do if not range(vD4sD6,1,2) | sys(vD4sD6).
compute m125=concat("vD4sD6=",string(vD4sD6,f2)).
compute p125="vD4sD6為不合理值或遺漏值".
compute s125=1.
end if.
Exec.

*vD4sD7=1,2 .
do if not range(vD4sD7,1,2) | sys(vD4sD7).
compute m126=concat("vD4sD7=",string(vD4sD7,f2)).
compute p126="vD4sD7為不合理值或遺漏值".
compute s126=1.
end if.
Exec.

*vD4sD8=1,2 .
do if not range(vD4sD8,1,2) | sys(vD4sD8).
compute m127=concat("vD4sD8=",string(vD4sD8,f2)).
compute p127="vD4sD8為不合理值或遺漏值".
compute s127=1.
end if.
Exec.

*vK1m01=0,1 .
do if not range(vK1m01,0,1) | sys(vK1m01).
compute m128=concat("vK1m01=",string(vK1m01,f2)).
compute p128="vK1m01為不合理值或遺漏值".
compute s128=1.
end if.
Exec.

*vK1m02=0,1 .
do if not range(vK1m02,0,1) | sys(vK1m02).
compute m129=concat("vK1m02=",string(vK1m02,f2)).
compute p129="vK1m02為不合理值或遺漏值".
compute s129=1.
end if.
Exec.

*vK1m03=0,1 .
do if not range(vK1m03,0,1) | sys(vK1m03).
compute m130=concat("vK1m03=",string(vK1m03,f2)).
compute p130="vK1m03為不合理值或遺漏值".
compute s130=1.
end if.
Exec.

*vK1m04=0,1 .
do if not range(vK1m04,0,1) | sys(vK1m04).
compute m131=concat("vK1m04=",string(vK1m04,f2)).
compute p131="vK1m04為不合理值或遺漏值".
compute s131=1.
end if.
Exec.

*vK1m05=0,1 .
do if not range(vK1m05,0,1) | sys(vK1m05).
compute m132=concat("vK1m05=",string(vK1m05,f2)).
compute p132="vK1m05為不合理值或遺漏值".
compute s132=1.
end if.
Exec.

*vK1m06=0,1 .
do if not range(vK1m06,0,1) | sys(vK1m06).
compute m133=concat("vK1m06=",string(vK1m06,f2)).
compute p133="vK1m06為不合理值或遺漏值".
compute s133=1.
end if.
Exec.

*vK1m07=0,1 .
do if not range(vK1m07,0,1) | sys(vK1m07).
compute m134=concat("vK1m07=",string(vK1m07,f2)).
compute p134="vK1m07為不合理值或遺漏值".
compute s134=1.
end if.
Exec.

*vK1m08=0,1 .
do if not range(vK1m08,0,1) | sys(vK1m08).
compute m135=concat("vK1m08=",string(vK1m08,f2)).
compute p135="vK1m08為不合理值或遺漏值".
compute s135=1.
end if.
Exec.

*vK1m09=0,1 .
do if not range(vK1m09,0,1) | sys(vK1m09).
compute m136=concat("vK1m09=",string(vK1m09,f2)).
compute p136="vK1m09為不合理值或遺漏值".
compute s136=1.
end if.
Exec.

*vK1m10=0,1 96 .
do if not range(vK1m10,0,1,96,96) | sys(vK1m10).
compute m137=concat("vK1m10=",string(vK1m10,f2)).
compute p137="vK1m10為不合理值或遺漏值".
compute s137=1.
end if.
Exec.

*vK1m11=0,1 96 .
do if not range(vK1m11,0,1,96,96) | sys(vK1m11).
compute m138=concat("vK1m11=",string(vK1m11,f2)).
compute p138="vK1m11為不合理值或遺漏值".
compute s138=1.
end if.
Exec.

*vK1m12=0,1 96 .
do if not range(vK1m12,0,1,96,96) | sys(vK1m12).
compute m139=concat("vK1m12=",string(vK1m12,f2)).
compute p139="vK1m12為不合理值或遺漏值".
compute s139=1.
end if.
Exec.

*vK1m13=0,1 96 .
do if not range(vK1m13,0,1,96,96) | sys(vK1m13).
compute m140=concat("vK1m13=",string(vK1m13,f2)).
compute p140="vK1m13為不合理值或遺漏值".
compute s140=1.
end if.
Exec.

*vK1m88=0,1 96 .
do if not range(vK1m88,0,1,96,96) | sys(vK1m88).
compute m141=concat("vK1m88=",string(vK1m88,f2)).
compute p141="vK1m88為不合理值或遺漏值".
compute s141=1.
end if.
Exec.

*vK1m90=0,1 96 .
do if not range(vK1m90,0,1,96,96) | sys(vK1m90).
compute m142=concat("vK1m90=",string(vK1m90,f2)).
compute p142="vK1m90為不合理值或遺漏值".
compute s142=1.
end if.
Exec.

*vK2m01=0,1 .
do if not range(vK2m01,0,1) | sys(vK2m01).
compute m143=concat("vK2m01=",string(vK2m01,f2)).
compute p143="vK2m01為不合理值或遺漏值".
compute s143=1.
end if.
Exec.

*vK2m02=0,1 .
do if not range(vK2m02,0,1) | sys(vK2m02).
compute m144=concat("vK2m02=",string(vK2m02,f2)).
compute p144="vK2m02為不合理值或遺漏值".
compute s144=1.
end if.
Exec.

*vK2m03=0,1 .
do if not range(vK2m03,0,1) | sys(vK2m03).
compute m145=concat("vK2m03=",string(vK2m03,f2)).
compute p145="vK2m03為不合理值或遺漏值".
compute s145=1.
end if.
Exec.

*vK2m04=0,1 .
do if not range(vK2m04,0,1) | sys(vK2m04).
compute m146=concat("vK2m04=",string(vK2m04,f2)).
compute p146="vK2m04為不合理值或遺漏值".
compute s146=1.
end if.
Exec.

*vK2m05=0,1 .
do if not range(vK2m05,0,1) | sys(vK2m05).
compute m147=concat("vK2m05=",string(vK2m05,f2)).
compute p147="vK2m05為不合理值或遺漏值".
compute s147=1.
end if.
Exec.

*vK2m06=0,1 .
do if not range(vK2m06,0,1) | sys(vK2m06).
compute m148=concat("vK2m06=",string(vK2m06,f2)).
compute p148="vK2m06為不合理值或遺漏值".
compute s148=1.
end if.
Exec.

*vK2m07=0,1 .
do if not range(vK2m07,0,1) | sys(vK2m07).
compute m149=concat("vK2m07=",string(vK2m07,f2)).
compute p149="vK2m07為不合理值或遺漏值".
compute s149=1.
end if.
Exec.

*vK2m08=0,1 .
do if not range(vK2m08,0,1) | sys(vK2m08).
compute m150=concat("vK2m08=",string(vK2m08,f2)).
compute p150="vK2m08為不合理值或遺漏值".
compute s150=1.
end if.
Exec.

*vK2m09=0,1 .
do if not range(vK2m09,0,1) | sys(vK2m09).
compute m151=concat("vK2m09=",string(vK2m09,f2)).
compute p151="vK2m09為不合理值或遺漏值".
compute s151=1.
end if.
Exec.

*vK2m11=0,1 96 .
do if not range(vK2m11,0,1,96,96) | sys(vK2m11).
compute m152=concat("vK2m11=",string(vK2m11,f2)).
compute p152="vK2m11為不合理值或遺漏值".
compute s152=1.
end if.
Exec.

*vK2m12=0,1 96 .
do if not range(vK2m12,0,1,96,96) | sys(vK2m12).
compute m153=concat("vK2m12=",string(vK2m12,f2)).
compute p153="vK2m12為不合理值或遺漏值".
compute s153=1.
end if.
Exec.

*vK2m13=0,1 96 .
do if not range(vK2m13,0,1,96,96) | sys(vK2m13).
compute m154=concat("vK2m13=",string(vK2m13,f2)).
compute p154="vK2m13為不合理值或遺漏值".
compute s154=1.
end if.
Exec.

*vK2m88=0,1 96 .
do if not range(vK2m88,0,1,96,96) | sys(vK2m88).
compute m155=concat("vK2m88=",string(vK2m88,f2)).
compute p155="vK2m88為不合理值或遺漏值".
compute s155=1.
end if.
Exec.

*vK2m90=0,1 96 .
do if not range(vK2m90,0,1,96,96) | sys(vK2m90).
compute m156=concat("vK2m90=",string(vK2m90,f2)).
compute p156="vK2m90為不合理值或遺漏值".
compute s156=1.
end if.
Exec.

*vE17=1,88 97,98 .
do if not range(vE17,1,88,97,98) | sys(vE17).
compute m157=concat("vE17=",string(vE17,f2)).
compute p157="vE17為不合理值或遺漏值".
compute s157=1.
end if.
Exec.

*vKLI1=0.5,7 95 97,98 .
do if not range(vKLI1,0.5,7,95,95,97,98) | sys(vKLI1).
compute m158=concat("vKLI1=",string(vKLI1,f4)).
compute p158="vKLI1為不合理值或遺漏值".
compute s158=1.
end if.
Exec.

*vKLI2=1,2359 9797 9898 .
do if not range(vKLI2,1,2359,9797,9797,9898,9898) | sys(vKLI2).
compute m159=concat("vKLI2=",string(vKLI2,f5)).
compute p159="vKLI2為不合理值或遺漏值".
compute s159=1.
end if.
Exec.

*vKFB1=0.5,7 95 97,98 .
do if not range(vKFB1,0.5,7,95,95,97,98) | sys(vKFB1).
compute m160=concat("vKFB1=",string(vKFB1,f4)).
compute p160="vKFB1為不合理值或遺漏值".
compute s160=1.
end if.
Exec.

*vKFB2=1,2359 9797 9898 .
do if not range(vKFB2,1,2359,9797,9797,9898,9898) | sys(vKFB2).
compute m161=concat("vKFB2=",string(vKFB2,f5)).
compute p161="vKFB2為不合理值或遺漏值".
compute s161=1.
end if.
Exec.

*vKFB3m01=0,1 .
do if not range(vKFB3m01,0,1) | sys(vKFB3m01).
compute m162=concat("vKFB3m01=",string(vKFB3m01,f2)).
compute p162="vKFB3m01為不合理值或遺漏值".
compute s162=1.
end if.
Exec.

*vKFB3m02=0,1 .
do if not range(vKFB3m02,0,1) | sys(vKFB3m02).
compute m163=concat("vKFB3m02=",string(vKFB3m02,f2)).
compute p163="vKFB3m02為不合理值或遺漏值".
compute s163=1.
end if.
Exec.

*vKFB3m03=0,1 .
do if not range(vKFB3m03,0,1) | sys(vKFB3m03).
compute m164=concat("vKFB3m03=",string(vKFB3m03,f2)).
compute p164="vKFB3m03為不合理值或遺漏值".
compute s164=1.
end if.
Exec.

*vKFB3m04=0,1 .
do if not range(vKFB3m04,0,1) | sys(vKFB3m04).
compute m165=concat("vKFB3m04=",string(vKFB3m04,f2)).
compute p165="vKFB3m04為不合理值或遺漏值".
compute s165=1.
end if.
Exec.

*vKFB3m05=0,1 .
do if not range(vKFB3m05,0,1) | sys(vKFB3m05).
compute m166=concat("vKFB3m05=",string(vKFB3m05,f2)).
compute p166="vKFB3m05為不合理值或遺漏值".
compute s166=1.
end if.
Exec.

*vKFB3m06=0,1 .
do if not range(vKFB3m06,0,1) | sys(vKFB3m06).
compute m167=concat("vKFB3m06=",string(vKFB3m06,f2)).
compute p167="vKFB3m06為不合理值或遺漏值".
compute s167=1.
end if.
Exec.

*vKFB3m07=0,1 .
do if not range(vKFB3m07,0,1) | sys(vKFB3m07).
compute m168=concat("vKFB3m07=",string(vKFB3m07,f2)).
compute p168="vKFB3m07為不合理值或遺漏值".
compute s168=1.
end if.
Exec.

*vKFB3m08=0,1 .
do if not range(vKFB3m08,0,1) | sys(vKFB3m08).
compute m169=concat("vKFB3m08=",string(vKFB3m08,f2)).
compute p169="vKFB3m08為不合理值或遺漏值".
compute s169=1.
end if.
Exec.

*vKFB3m09=0,1 .
do if not range(vKFB3m09,0,1) | sys(vKFB3m09).
compute m170=concat("vKFB3m09=",string(vKFB3m09,f2)).
compute p170="vKFB3m09為不合理值或遺漏值".
compute s170=1.
end if.
Exec.

*vKFB3m10=0,1 96 .
do if not range(vKFB3m10,0,1,96,96) | sys(vKFB3m10).
compute m171=concat("vKFB3m10=",string(vKFB3m10,f2)).
compute p171="vKFB3m10為不合理值或遺漏值".
compute s171=1.
end if.
Exec.

*vKFB3m11=0,1 96 .
do if not range(vKFB3m11,0,1,96,96) | sys(vKFB3m11).
compute m172=concat("vKFB3m11=",string(vKFB3m11,f2)).
compute p172="vKFB3m11為不合理值或遺漏值".
compute s172=1.
end if.
Exec.

*vKFB3m12=0,1 96 .
do if not range(vKFB3m12,0,1,96,96) | sys(vKFB3m12).
compute m173=concat("vKFB3m12=",string(vKFB3m12,f2)).
compute p173="vKFB3m12為不合理值或遺漏值".
compute s173=1.
end if.
Exec.

*vKFB3m13=0,1 96 .
do if not range(vKFB3m13,0,1,96,96) | sys(vKFB3m13).
compute m174=concat("vKFB3m13=",string(vKFB3m13,f2)).
compute p174="vKFB3m13為不合理值或遺漏值".
compute s174=1.
end if.
Exec.

*vKFB3m14=0,1 96 .
do if not range(vKFB3m14,0,1,96,96) | sys(vKFB3m14).
compute m175=concat("vKFB3m14=",string(vKFB3m14,f2)).
compute p175="vKFB3m14為不合理值或遺漏值".
compute s175=1.
end if.
Exec.

*vKFB3m15=0,1 96 .
do if not range(vKFB3m15,0,1,96,96) | sys(vKFB3m15).
compute m176=concat("vKFB3m15=",string(vKFB3m15,f2)).
compute p176="vKFB3m15為不合理值或遺漏值".
compute s176=1.
end if.
Exec.

*vKFB3m16=0,1 96 .
do if not range(vKFB3m16,0,1,96,96) | sys(vKFB3m16).
compute m177=concat("vKFB3m16=",string(vKFB3m16,f2)).
compute p177="vKFB3m16為不合理值或遺漏值".
compute s177=1.
end if.
Exec.

*vKFB3m17=0,1 96 .
do if not range(vKFB3m17,0,1,96,96) | sys(vKFB3m17).
compute m178=concat("vKFB3m17=",string(vKFB3m17,f2)).
compute p178="vKFB3m17為不合理值或遺漏值".
compute s178=1.
end if.
Exec.

*vKFB3m88=0,1 96 .
do if not range(vKFB3m88,0,1,96,96) | sys(vKFB3m88).
compute m179=concat("vKFB3m88=",string(vKFB3m88,f2)).
compute p179="vKFB3m88為不合理值或遺漏值".
compute s179=1.
end if.
Exec.

*vKFB4m01=0,1 .
do if not range(vKFB4m01,0,1) | sys(vKFB4m01).
compute m180=concat("vKFB4m01=",string(vKFB4m01,f2)).
compute p180="vKFB4m01為不合理值或遺漏值".
compute s180=1.
end if.
Exec.

*vKFB4m02=0,1 .
do if not range(vKFB4m02,0,1) | sys(vKFB4m02).
compute m181=concat("vKFB4m02=",string(vKFB4m02,f2)).
compute p181="vKFB4m02為不合理值或遺漏值".
compute s181=1.
end if.
Exec.

*vKFB4m03=0,1 .
do if not range(vKFB4m03,0,1) | sys(vKFB4m03).
compute m182=concat("vKFB4m03=",string(vKFB4m03,f2)).
compute p182="vKFB4m03為不合理值或遺漏值".
compute s182=1.
end if.
Exec.

*vKFB4m04=0,1 .
do if not range(vKFB4m04,0,1) | sys(vKFB4m04).
compute m183=concat("vKFB4m04=",string(vKFB4m04,f2)).
compute p183="vKFB4m04為不合理值或遺漏值".
compute s183=1.
end if.
Exec.

*vKFB4m05=0,1 .
do if not range(vKFB4m05,0,1) | sys(vKFB4m05).
compute m184=concat("vKFB4m05=",string(vKFB4m05,f2)).
compute p184="vKFB4m05為不合理值或遺漏值".
compute s184=1.
end if.
Exec.

*vKFB4m06=0,1 .
do if not range(vKFB4m06,0,1) | sys(vKFB4m06).
compute m185=concat("vKFB4m06=",string(vKFB4m06,f2)).
compute p185="vKFB4m06為不合理值或遺漏值".
compute s185=1.
end if.
Exec.

*vKFB4m07=0,1 .
do if not range(vKFB4m07,0,1) | sys(vKFB4m07).
compute m186=concat("vKFB4m07=",string(vKFB4m07,f2)).
compute p186="vKFB4m07為不合理值或遺漏值".
compute s186=1.
end if.
Exec.

*vKFB4m08=0,1 .
do if not range(vKFB4m08,0,1) | sys(vKFB4m08).
compute m187=concat("vKFB4m08=",string(vKFB4m08,f2)).
compute p187="vKFB4m08為不合理值或遺漏值".
compute s187=1.
end if.
Exec.

*vKFB4m09=0,1 .
do if not range(vKFB4m09,0,1) | sys(vKFB4m09).
compute m188=concat("vKFB4m09=",string(vKFB4m09,f2)).
compute p188="vKFB4m09為不合理值或遺漏值".
compute s188=1.
end if.
Exec.

*vKFB4m10=0,1 96 .
do if not range(vKFB4m10,0,1,96,96) | sys(vKFB4m10).
compute m189=concat("vKFB4m10=",string(vKFB4m10,f2)).
compute p189="vKFB4m10為不合理值或遺漏值".
compute s189=1.
end if.
Exec.

*vKFB4m11=0,1 96 .
do if not range(vKFB4m11,0,1,96,96) | sys(vKFB4m11).
compute m190=concat("vKFB4m11=",string(vKFB4m11,f2)).
compute p190="vKFB4m11為不合理值或遺漏值".
compute s190=1.
end if.
Exec.

*vKFB4m12=0,1 96 .
do if not range(vKFB4m12,0,1,96,96) | sys(vKFB4m12).
compute m191=concat("vKFB4m12=",string(vKFB4m12,f2)).
compute p191="vKFB4m12為不合理值或遺漏值".
compute s191=1.
end if.
Exec.

*vKFB4m13=0,1 96 .
do if not range(vKFB4m13,0,1,96,96) | sys(vKFB4m13).
compute m192=concat("vKFB4m13=",string(vKFB4m13,f2)).
compute p192="vKFB4m13為不合理值或遺漏值".
compute s192=1.
end if.
Exec.

*vKFB4m14=0,1 96 .
do if not range(vKFB4m14,0,1,96,96) | sys(vKFB4m14).
compute m193=concat("vKFB4m14=",string(vKFB4m14,f2)).
compute p193="vKFB4m14為不合理值或遺漏值".
compute s193=1.
end if.
Exec.

*vKFB4m15=0,1 96 .
do if not range(vKFB4m15,0,1,96,96) | sys(vKFB4m15).
compute m194=concat("vKFB4m15=",string(vKFB4m15,f2)).
compute p194="vKFB4m15為不合理值或遺漏值".
compute s194=1.
end if.
Exec.

*vKFB4m16=0,1 96 .
do if not range(vKFB4m16,0,1,96,96) | sys(vKFB4m16).
compute m195=concat("vKFB4m16=",string(vKFB4m16,f2)).
compute p195="vKFB4m16為不合理值或遺漏值".
compute s195=1.
end if.
Exec.

*vKFB4m17=0,1 96 .
do if not range(vKFB4m17,0,1,96,96) | sys(vKFB4m17).
compute m196=concat("vKFB4m17=",string(vKFB4m17,f2)).
compute p196="vKFB4m17為不合理值或遺漏值".
compute s196=1.
end if.
Exec.

*vKFB4m18=0,1 96 .
do if not range(vKFB4m18,0,1,96,96) | sys(vKFB4m18).
compute m197=concat("vKFB4m18=",string(vKFB4m18,f2)).
compute p197="vKFB4m18為不合理值或遺漏值".
compute s197=1.
end if.
Exec.

*vKFB4m88=0,1 96 .
do if not range(vKFB4m88,0,1,96,96) | sys(vKFB4m88).
compute m198=concat("vKFB4m88=",string(vKFB4m88,f2)).
compute p198="vKFB4m88為不合理值或遺漏值".
compute s198=1.
end if.
Exec.

*vKIG1=0.5,7 95 97,98 .
do if not range(vKIG1,0.5,7,95,95,97,98) | sys(vKIG1).
compute m199=concat("vKIG1=",string(vKIG1,f4)).
compute p199="vKIG1為不合理值或遺漏值".
compute s199=1.
end if.
Exec.

*vKIG2=1,2359 9797 9898 .
do if not range(vKIG2,1,2359,9797,9797,9898,9898) | sys(vKIG2).
compute m200=concat("vKIG2=",string(vKIG2,f5)).
compute p200="vKIG2為不合理值或遺漏值".
compute s200=1.
end if.
Exec.

*vKIG3m01=0,1 .
do if not range(vKIG3m01,0,1) | sys(vKIG3m01).
compute m201=concat("vKIG3m01=",string(vKIG3m01,f2)).
compute p201="vKIG3m01為不合理值或遺漏值".
compute s201=1.
end if.
Exec.

*vKIG3m02=0,1 .
do if not range(vKIG3m02,0,1) | sys(vKIG3m02).
compute m202=concat("vKIG3m02=",string(vKIG3m02,f2)).
compute p202="vKIG3m02為不合理值或遺漏值".
compute s202=1.
end if.
Exec.

*vKIG3m03=0,1 .
do if not range(vKIG3m03,0,1) | sys(vKIG3m03).
compute m203=concat("vKIG3m03=",string(vKIG3m03,f2)).
compute p203="vKIG3m03為不合理值或遺漏值".
compute s203=1.
end if.
Exec.

*vKIG3m04=0,1 .
do if not range(vKIG3m04,0,1) | sys(vKIG3m04).
compute m204=concat("vKIG3m04=",string(vKIG3m04,f2)).
compute p204="vKIG3m04為不合理值或遺漏值".
compute s204=1.
end if.
Exec.

*vKIG3m05=0,1 .
do if not range(vKIG3m05,0,1) | sys(vKIG3m05).
compute m205=concat("vKIG3m05=",string(vKIG3m05,f2)).
compute p205="vKIG3m05為不合理值或遺漏值".
compute s205=1.
end if.
Exec.

*vKIG3m06=0,1 .
do if not range(vKIG3m06,0,1) | sys(vKIG3m06).
compute m206=concat("vKIG3m06=",string(vKIG3m06,f2)).
compute p206="vKIG3m06為不合理值或遺漏值".
compute s206=1.
end if.
Exec.

*vKIG3m07=0,1 .
do if not range(vKIG3m07,0,1) | sys(vKIG3m07).
compute m207=concat("vKIG3m07=",string(vKIG3m07,f2)).
compute p207="vKIG3m07為不合理值或遺漏值".
compute s207=1.
end if.
Exec.

*vKIG3m08=0,1 .
do if not range(vKIG3m08,0,1) | sys(vKIG3m08).
compute m208=concat("vKIG3m08=",string(vKIG3m08,f2)).
compute p208="vKIG3m08為不合理值或遺漏值".
compute s208=1.
end if.
Exec.

*vKIG3m09=0,1 .
do if not range(vKIG3m09,0,1) | sys(vKIG3m09).
compute m209=concat("vKIG3m09=",string(vKIG3m09,f2)).
compute p209="vKIG3m09為不合理值或遺漏值".
compute s209=1.
end if.
Exec.

*vKIG3m10=0,1 96 .
do if not range(vKIG3m10,0,1,96,96) | sys(vKIG3m10).
compute m210=concat("vKIG3m10=",string(vKIG3m10,f2)).
compute p210="vKIG3m10為不合理值或遺漏值".
compute s210=1.
end if.
Exec.

*vKIG3m11=0,1 96 .
do if not range(vKIG3m11,0,1,96,96) | sys(vKIG3m11).
compute m211=concat("vKIG3m11=",string(vKIG3m11,f2)).
compute p211="vKIG3m11為不合理值或遺漏值".
compute s211=1.
end if.
Exec.

*vKIG3m12=0,1 96 .
do if not range(vKIG3m12,0,1,96,96) | sys(vKIG3m12).
compute m212=concat("vKIG3m12=",string(vKIG3m12,f2)).
compute p212="vKIG3m12為不合理值或遺漏值".
compute s212=1.
end if.
Exec.

*vKIG3m13=0,1 96 .
do if not range(vKIG3m13,0,1,96,96) | sys(vKIG3m13).
compute m213=concat("vKIG3m13=",string(vKIG3m13,f2)).
compute p213="vKIG3m13為不合理值或遺漏值".
compute s213=1.
end if.
Exec.

*vKIG3m14=0,1 96 .
do if not range(vKIG3m14,0,1,96,96) | sys(vKIG3m14).
compute m214=concat("vKIG3m14=",string(vKIG3m14,f2)).
compute p214="vKIG3m14為不合理值或遺漏值".
compute s214=1.
end if.
Exec.

*vKIG3m15=0,1 96 .
do if not range(vKIG3m15,0,1,96,96) | sys(vKIG3m15).
compute m215=concat("vKIG3m15=",string(vKIG3m15,f2)).
compute p215="vKIG3m15為不合理值或遺漏值".
compute s215=1.
end if.
Exec.

*vKIG3m16=0,1 96 .
do if not range(vKIG3m16,0,1,96,96) | sys(vKIG3m16).
compute m216=concat("vKIG3m16=",string(vKIG3m16,f2)).
compute p216="vKIG3m16為不合理值或遺漏值".
compute s216=1.
end if.
Exec.

*vKIG3m17=0,1 96 .
do if not range(vKIG3m17,0,1,96,96) | sys(vKIG3m17).
compute m217=concat("vKIG3m17=",string(vKIG3m17,f2)).
compute p217="vKIG3m17為不合理值或遺漏值".
compute s217=1.
end if.
Exec.

*vKIG3m88=0,1 96 .
do if not range(vKIG3m88,0,1,96,96) | sys(vKIG3m88).
compute m218=concat("vKIG3m88=",string(vKIG3m88,f2)).
compute p218="vKIG3m88為不合理值或遺漏值".
compute s218=1.
end if.
Exec.

*vKIG4m01=0,1 .
do if not range(vKIG4m01,0,1) | sys(vKIG4m01).
compute m219=concat("vKIG4m01=",string(vKIG4m01,f2)).
compute p219="vKIG4m01為不合理值或遺漏值".
compute s219=1.
end if.
Exec.

*vKIG4m02=0,1 .
do if not range(vKIG4m02,0,1) | sys(vKIG4m02).
compute m220=concat("vKIG4m02=",string(vKIG4m02,f2)).
compute p220="vKIG4m02為不合理值或遺漏值".
compute s220=1.
end if.
Exec.

*vKIG4m03=0,1 .
do if not range(vKIG4m03,0,1) | sys(vKIG4m03).
compute m221=concat("vKIG4m03=",string(vKIG4m03,f2)).
compute p221="vKIG4m03為不合理值或遺漏值".
compute s221=1.
end if.
Exec.

*vKIG4m04=0,1 .
do if not range(vKIG4m04,0,1) | sys(vKIG4m04).
compute m222=concat("vKIG4m04=",string(vKIG4m04,f2)).
compute p222="vKIG4m04為不合理值或遺漏值".
compute s222=1.
end if.
Exec.

*vKIG4m05=0,1 .
do if not range(vKIG4m05,0,1) | sys(vKIG4m05).
compute m223=concat("vKIG4m05=",string(vKIG4m05,f2)).
compute p223="vKIG4m05為不合理值或遺漏值".
compute s223=1.
end if.
Exec.

*vKIG4m06=0,1 .
do if not range(vKIG4m06,0,1) | sys(vKIG4m06).
compute m224=concat("vKIG4m06=",string(vKIG4m06,f2)).
compute p224="vKIG4m06為不合理值或遺漏值".
compute s224=1.
end if.
Exec.

*vKIG4m07=0,1 .
do if not range(vKIG4m07,0,1) | sys(vKIG4m07).
compute m225=concat("vKIG4m07=",string(vKIG4m07,f2)).
compute p225="vKIG4m07為不合理值或遺漏值".
compute s225=1.
end if.
Exec.

*vKIG4m08=0,1 .
do if not range(vKIG4m08,0,1) | sys(vKIG4m08).
compute m226=concat("vKIG4m08=",string(vKIG4m08,f2)).
compute p226="vKIG4m08為不合理值或遺漏值".
compute s226=1.
end if.
Exec.

*vKIG4m09=0,1 .
do if not range(vKIG4m09,0,1) | sys(vKIG4m09).
compute m227=concat("vKIG4m09=",string(vKIG4m09,f2)).
compute p227="vKIG4m09為不合理值或遺漏值".
compute s227=1.
end if.
Exec.

*vKIG4m10=0,1 96 .
do if not range(vKIG4m10,0,1,96,96) | sys(vKIG4m10).
compute m228=concat("vKIG4m10=",string(vKIG4m10,f2)).
compute p228="vKIG4m10為不合理值或遺漏值".
compute s228=1.
end if.
Exec.

*vKIG4m11=0,1 96 .
do if not range(vKIG4m11,0,1,96,96) | sys(vKIG4m11).
compute m229=concat("vKIG4m11=",string(vKIG4m11,f2)).
compute p229="vKIG4m11為不合理值或遺漏值".
compute s229=1.
end if.
Exec.

*vKIG4m12=0,1 96 .
do if not range(vKIG4m12,0,1,96,96) | sys(vKIG4m12).
compute m230=concat("vKIG4m12=",string(vKIG4m12,f2)).
compute p230="vKIG4m12為不合理值或遺漏值".
compute s230=1.
end if.
Exec.

*vKIG4m13=0,1 96 .
do if not range(vKIG4m13,0,1,96,96) | sys(vKIG4m13).
compute m231=concat("vKIG4m13=",string(vKIG4m13,f2)).
compute p231="vKIG4m13為不合理值或遺漏值".
compute s231=1.
end if.
Exec.

*vKIG4m14=0,1 96 .
do if not range(vKIG4m14,0,1,96,96) | sys(vKIG4m14).
compute m232=concat("vKIG4m14=",string(vKIG4m14,f2)).
compute p232="vKIG4m14為不合理值或遺漏值".
compute s232=1.
end if.
Exec.

*vKIG4m88=0,1 96 .
do if not range(vKIG4m88,0,1,96,96) | sys(vKIG4m88).
compute m233=concat("vKIG4m88=",string(vKIG4m88,f2)).
compute p233="vKIG4m88為不合理值或遺漏值".
compute s233=1.
end if.
Exec.

*vKTT1=0.5,7 95 97,98 .
do if not range(vKTT1,0.5,7,95,95,97,98) | sys(vKTT1).
compute m234=concat("vKTT1=",string(vKTT1,f4)).
compute p234="vKTT1為不合理值或遺漏值".
compute s234=1.
end if.
Exec.

*vKTT2=1,2359 9797 9898 .
do if not range(vKTT2,1,2359,9797,9797,9898,9898) | sys(vKTT2).
compute m235=concat("vKTT2=",string(vKTT2,f5)).
compute p235="vKTT2為不合理值或遺漏值".
compute s235=1.
end if.
Exec.

*vKTT3m01=0,1 .
do if not range(vKTT3m01,0,1) | sys(vKTT3m01).
compute m236=concat("vKTT3m01=",string(vKTT3m01,f2)).
compute p236="vKTT3m01為不合理值或遺漏值".
compute s236=1.
end if.
Exec.

*vKTT3m02=0,1 .
do if not range(vKTT3m02,0,1) | sys(vKTT3m02).
compute m237=concat("vKTT3m02=",string(vKTT3m02,f2)).
compute p237="vKTT3m02為不合理值或遺漏值".
compute s237=1.
end if.
Exec.

*vKTT3m03=0,1 .
do if not range(vKTT3m03,0,1) | sys(vKTT3m03).
compute m238=concat("vKTT3m03=",string(vKTT3m03,f2)).
compute p238="vKTT3m03為不合理值或遺漏值".
compute s238=1.
end if.
Exec.

*vKTT3m04=0,1 .
do if not range(vKTT3m04,0,1) | sys(vKTT3m04).
compute m239=concat("vKTT3m04=",string(vKTT3m04,f2)).
compute p239="vKTT3m04為不合理值或遺漏值".
compute s239=1.
end if.
Exec.

*vKTT3m05=0,1 .
do if not range(vKTT3m05,0,1) | sys(vKTT3m05).
compute m240=concat("vKTT3m05=",string(vKTT3m05,f2)).
compute p240="vKTT3m05為不合理值或遺漏值".
compute s240=1.
end if.
Exec.

*vKTT3m06=0,1 .
do if not range(vKTT3m06,0,1) | sys(vKTT3m06).
compute m241=concat("vKTT3m06=",string(vKTT3m06,f2)).
compute p241="vKTT3m06為不合理值或遺漏值".
compute s241=1.
end if.
Exec.

*vKTT3m07=0,1 .
do if not range(vKTT3m07,0,1) | sys(vKTT3m07).
compute m242=concat("vKTT3m07=",string(vKTT3m07,f2)).
compute p242="vKTT3m07為不合理值或遺漏值".
compute s242=1.
end if.
Exec.

*vKTT3m08=0,1 .
do if not range(vKTT3m08,0,1) | sys(vKTT3m08).
compute m243=concat("vKTT3m08=",string(vKTT3m08,f2)).
compute p243="vKTT3m08為不合理值或遺漏值".
compute s243=1.
end if.
Exec.

*vKTT3m09=0,1 .
do if not range(vKTT3m09,0,1) | sys(vKTT3m09).
compute m244=concat("vKTT3m09=",string(vKTT3m09,f2)).
compute p244="vKTT3m09為不合理值或遺漏值".
compute s244=1.
end if.
Exec.

*vKTT3m10=0,1 96 .
do if not range(vKTT3m10,0,1,96,96) | sys(vKTT3m10).
compute m245=concat("vKTT3m10=",string(vKTT3m10,f2)).
compute p245="vKTT3m10為不合理值或遺漏值".
compute s245=1.
end if.
Exec.

*vKTT3m11=0,1 96 .
do if not range(vKTT3m11,0,1,96,96) | sys(vKTT3m11).
compute m246=concat("vKTT3m11=",string(vKTT3m11,f2)).
compute p246="vKTT3m11為不合理值或遺漏值".
compute s246=1.
end if.
Exec.

*vKTT3m12=0,1 96 .
do if not range(vKTT3m12,0,1,96,96) | sys(vKTT3m12).
compute m247=concat("vKTT3m12=",string(vKTT3m12,f2)).
compute p247="vKTT3m12為不合理值或遺漏值".
compute s247=1.
end if.
Exec.

*vKTT3m13=0,1 96 .
do if not range(vKTT3m13,0,1,96,96) | sys(vKTT3m13).
compute m248=concat("vKTT3m13=",string(vKTT3m13,f2)).
compute p248="vKTT3m13為不合理值或遺漏值".
compute s248=1.
end if.
Exec.

*vKTT3m14=0,1 96 .
do if not range(vKTT3m14,0,1,96,96) | sys(vKTT3m14).
compute m249=concat("vKTT3m14=",string(vKTT3m14,f2)).
compute p249="vKTT3m14為不合理值或遺漏值".
compute s249=1.
end if.
Exec.

*vKTT3m15=0,1 96 .
do if not range(vKTT3m15,0,1,96,96) | sys(vKTT3m15).
compute m250=concat("vKTT3m15=",string(vKTT3m15,f2)).
compute p250="vKTT3m15為不合理值或遺漏值".
compute s250=1.
end if.
Exec.

*vKTT3m16=0,1 96 .
do if not range(vKTT3m16,0,1,96,96) | sys(vKTT3m16).
compute m251=concat("vKTT3m16=",string(vKTT3m16,f2)).
compute p251="vKTT3m16為不合理值或遺漏值".
compute s251=1.
end if.
Exec.

*vKTT3m88=0,1 96 .
do if not range(vKTT3m88,0,1,96,96) | sys(vKTT3m88).
compute m252=concat("vKTT3m88=",string(vKTT3m88,f2)).
compute p252="vKTT3m88為不合理值或遺漏值".
compute s252=1.
end if.
Exec.

*vKTT4m01=0,1 .
do if not range(vKTT4m01,0,1) | sys(vKTT4m01).
compute m253=concat("vKTT4m01=",string(vKTT4m01,f2)).
compute p253="vKTT4m01為不合理值或遺漏值".
compute s253=1.
end if.
Exec.

*vKTT4m02=0,1 .
do if not range(vKTT4m02,0,1) | sys(vKTT4m02).
compute m254=concat("vKTT4m02=",string(vKTT4m02,f2)).
compute p254="vKTT4m02為不合理值或遺漏值".
compute s254=1.
end if.
Exec.

*vKTT4m03=0,1 .
do if not range(vKTT4m03,0,1) | sys(vKTT4m03).
compute m255=concat("vKTT4m03=",string(vKTT4m03,f2)).
compute p255="vKTT4m03為不合理值或遺漏值".
compute s255=1.
end if.
Exec.

*vKTT4m04=0,1 .
do if not range(vKTT4m04,0,1) | sys(vKTT4m04).
compute m256=concat("vKTT4m04=",string(vKTT4m04,f2)).
compute p256="vKTT4m04為不合理值或遺漏值".
compute s256=1.
end if.
Exec.

*vKTT4m05=0,1 .
do if not range(vKTT4m05,0,1) | sys(vKTT4m05).
compute m257=concat("vKTT4m05=",string(vKTT4m05,f2)).
compute p257="vKTT4m05為不合理值或遺漏值".
compute s257=1.
end if.
Exec.

*vKTT4m06=0,1 .
do if not range(vKTT4m06,0,1) | sys(vKTT4m06).
compute m258=concat("vKTT4m06=",string(vKTT4m06,f2)).
compute p258="vKTT4m06為不合理值或遺漏值".
compute s258=1.
end if.
Exec.

*vKTT4m07=0,1 .
do if not range(vKTT4m07,0,1) | sys(vKTT4m07).
compute m259=concat("vKTT4m07=",string(vKTT4m07,f2)).
compute p259="vKTT4m07為不合理值或遺漏值".
compute s259=1.
end if.
Exec.

*vKTT4m08=0,1 .
do if not range(vKTT4m08,0,1) | sys(vKTT4m08).
compute m260=concat("vKTT4m08=",string(vKTT4m08,f2)).
compute p260="vKTT4m08為不合理值或遺漏值".
compute s260=1.
end if.
Exec.

*vKTT4m09=0,1 .
do if not range(vKTT4m09,0,1) | sys(vKTT4m09).
compute m261=concat("vKTT4m09=",string(vKTT4m09,f2)).
compute p261="vKTT4m09為不合理值或遺漏值".
compute s261=1.
end if.
Exec.

*vKTT4m10=0,1 96 .
do if not range(vKTT4m10,0,1,96,96) | sys(vKTT4m10).
compute m262=concat("vKTT4m10=",string(vKTT4m10,f2)).
compute p262="vKTT4m10為不合理值或遺漏值".
compute s262=1.
end if.
Exec.

*vKTT4m11=0,1 96 .
do if not range(vKTT4m11,0,1,96,96) | sys(vKTT4m11).
compute m263=concat("vKTT4m11=",string(vKTT4m11,f2)).
compute p263="vKTT4m11為不合理值或遺漏值".
compute s263=1.
end if.
Exec.

*vKTT4m12=0,1 96 .
do if not range(vKTT4m12,0,1,96,96) | sys(vKTT4m12).
compute m264=concat("vKTT4m12=",string(vKTT4m12,f2)).
compute p264="vKTT4m12為不合理值或遺漏值".
compute s264=1.
end if.
Exec.

*vKTT4m13=0,1 96 .
do if not range(vKTT4m13,0,1,96,96) | sys(vKTT4m13).
compute m265=concat("vKTT4m13=",string(vKTT4m13,f2)).
compute p265="vKTT4m13為不合理值或遺漏值".
compute s265=1.
end if.
Exec.

*vKTT4m14=0,1 96 .
do if not range(vKTT4m14,0,1,96,96) | sys(vKTT4m14).
compute m266=concat("vKTT4m14=",string(vKTT4m14,f2)).
compute p266="vKTT4m14為不合理值或遺漏值".
compute s266=1.
end if.
Exec.

*vKTT4m88=0,1 96 .
do if not range(vKTT4m88,0,1,96,96) | sys(vKTT4m88).
compute m267=concat("vKTT4m88=",string(vKTT4m88,f2)).
compute p267="vKTT4m88為不合理值或遺漏值".
compute s267=1.
end if.
Exec.

*vKTT5m01=0,1 .
do if not range(vKTT5m01,0,1) | sys(vKTT5m01).
compute m268=concat("vKTT5m01=",string(vKTT5m01,f2)).
compute p268="vKTT5m01為不合理值或遺漏值".
compute s268=1.
end if.
Exec.

*vKTT5m02=0,1 .
do if not range(vKTT5m02,0,1) | sys(vKTT5m02).
compute m269=concat("vKTT5m02=",string(vKTT5m02,f2)).
compute p269="vKTT5m02為不合理值或遺漏值".
compute s269=1.
end if.
Exec.

*vKTT5m03=0,1 .
do if not range(vKTT5m03,0,1) | sys(vKTT5m03).
compute m270=concat("vKTT5m03=",string(vKTT5m03,f2)).
compute p270="vKTT5m03為不合理值或遺漏值".
compute s270=1.
end if.
Exec.

*vKTT5m04=0,1 .
do if not range(vKTT5m04,0,1) | sys(vKTT5m04).
compute m271=concat("vKTT5m04=",string(vKTT5m04,f2)).
compute p271="vKTT5m04為不合理值或遺漏值".
compute s271=1.
end if.
Exec.

*vKTT5m05=0,1 .
do if not range(vKTT5m05,0,1) | sys(vKTT5m05).
compute m272=concat("vKTT5m05=",string(vKTT5m05,f2)).
compute p272="vKTT5m05為不合理值或遺漏值".
compute s272=1.
end if.
Exec.

*vKTT5m06=0,1 .
do if not range(vKTT5m06,0,1) | sys(vKTT5m06).
compute m273=concat("vKTT5m06=",string(vKTT5m06,f2)).
compute p273="vKTT5m06為不合理值或遺漏值".
compute s273=1.
end if.
Exec.

*vKTT5m07=0,1 .
do if not range(vKTT5m07,0,1) | sys(vKTT5m07).
compute m274=concat("vKTT5m07=",string(vKTT5m07,f2)).
compute p274="vKTT5m07為不合理值或遺漏值".
compute s274=1.
end if.
Exec.

*vKTT5m08=0,1 .
do if not range(vKTT5m08,0,1) | sys(vKTT5m08).
compute m275=concat("vKTT5m08=",string(vKTT5m08,f2)).
compute p275="vKTT5m08為不合理值或遺漏值".
compute s275=1.
end if.
Exec.

*vKTT5m09=0,1 .
do if not range(vKTT5m09,0,1) | sys(vKTT5m09).
compute m276=concat("vKTT5m09=",string(vKTT5m09,f2)).
compute p276="vKTT5m09為不合理值或遺漏值".
compute s276=1.
end if.
Exec.

*vKTT5m10=0,1 96 .
do if not range(vKTT5m10,0,1,96,96) | sys(vKTT5m10).
compute m277=concat("vKTT5m10=",string(vKTT5m10,f2)).
compute p277="vKTT5m10為不合理值或遺漏值".
compute s277=1.
end if.
Exec.

*vKTT5m11=0,1 96 .
do if not range(vKTT5m11,0,1,96,96) | sys(vKTT5m11).
compute m278=concat("vKTT5m11=",string(vKTT5m11,f2)).
compute p278="vKTT5m11為不合理值或遺漏值".
compute s278=1.
end if.
Exec.

*vKTT5m12=0,1 96 .
do if not range(vKTT5m12,0,1,96,96) | sys(vKTT5m12).
compute m279=concat("vKTT5m12=",string(vKTT5m12,f2)).
compute p279="vKTT5m12為不合理值或遺漏值".
compute s279=1.
end if.
Exec.

*vKTT5m88=0,1 96 .
do if not range(vKTT5m88,0,1,96,96) | sys(vKTT5m88).
compute m280=concat("vKTT5m88=",string(vKTT5m88,f2)).
compute p280="vKTT5m88為不合理值或遺漏值".
compute s280=1.
end if.
Exec.

*vP5_1=0.5,7 95 97,98 .
do if not range(vP5_1,0.5,7,95,95,97,98) | sys(vP5_1).
compute m281=concat("vP5_1=",string(vP5_1,f4)).
compute p281="vP5_1為不合理值或遺漏值".
compute s281=1.
end if.
Exec.

*vP5_2=1,2359 9797 9898 .
do if not range(vP5_2,1,2359,9797,9797,9898,9898) | sys(vP5_2).
compute m282=concat("vP5_2=",string(vP5_2,f5)).
compute p282="vP5_2為不合理值或遺漏值".
compute s282=1.
end if.
Exec.

*vK3m01=0,1 .
do if not range(vK3m01,0,1) | sys(vK3m01).
compute m283=concat("vK3m01=",string(vK3m01,f2)).
compute p283="vK3m01為不合理值或遺漏值".
compute s283=1.
end if.
Exec.

*vK3m02=0,1 .
do if not range(vK3m02,0,1) | sys(vK3m02).
compute m284=concat("vK3m02=",string(vK3m02,f2)).
compute p284="vK3m02為不合理值或遺漏值".
compute s284=1.
end if.
Exec.

*vK3m03=0,1 .
do if not range(vK3m03,0,1) | sys(vK3m03).
compute m285=concat("vK3m03=",string(vK3m03,f2)).
compute p285="vK3m03為不合理值或遺漏值".
compute s285=1.
end if.
Exec.

*vK3m04=0,1 .
do if not range(vK3m04,0,1) | sys(vK3m04).
compute m286=concat("vK3m04=",string(vK3m04,f2)).
compute p286="vK3m04為不合理值或遺漏值".
compute s286=1.
end if.
Exec.

*vK3m05=0,1 .
do if not range(vK3m05,0,1) | sys(vK3m05).
compute m287=concat("vK3m05=",string(vK3m05,f2)).
compute p287="vK3m05為不合理值或遺漏值".
compute s287=1.
end if.
Exec.

*vK3m06=0,1 .
do if not range(vK3m06,0,1) | sys(vK3m06).
compute m288=concat("vK3m06=",string(vK3m06,f2)).
compute p288="vK3m06為不合理值或遺漏值".
compute s288=1.
end if.
Exec.

*vK3m07=0,1 .
do if not range(vK3m07,0,1) | sys(vK3m07).
compute m289=concat("vK3m07=",string(vK3m07,f2)).
compute p289="vK3m07為不合理值或遺漏值".
compute s289=1.
end if.
Exec.

*vK3m08=0,1 .
do if not range(vK3m08,0,1) | sys(vK3m08).
compute m290=concat("vK3m08=",string(vK3m08,f2)).
compute p290="vK3m08為不合理值或遺漏值".
compute s290=1.
end if.
Exec.

*vK3m09=0,1 .
do if not range(vK3m09,0,1) | sys(vK3m09).
compute m291=concat("vK3m09=",string(vK3m09,f2)).
compute p291="vK3m09為不合理值或遺漏值".
compute s291=1.
end if.
Exec.

*vK3m88=0,1 96 .
do if not range(vK3m88,0,1,96,96) | sys(vK3m88).
compute m292=concat("vK3m88=",string(vK3m88,f2)).
compute p292="vK3m88為不合理值或遺漏值".
compute s292=1.
end if.
Exec.

*vK3m90=0,1 96 .
do if not range(vK3m90,0,1,96,96) | sys(vK3m90).
compute m293=concat("vK3m90=",string(vK3m90,f2)).
compute p293="vK3m90為不合理值或遺漏值".
compute s293=1.
end if.
Exec.

*vE18=1,88 97,98 .
do if not range(vE18,1,88,97,98) | sys(vE18).
compute m294=concat("vE18=",string(vE18,f2)).
compute p294="vE18為不合理值或遺漏值".
compute s294=1.
end if.
Exec.

*vKYT1=0.5,7 95 97,98 .
do if not range(vKYT1,0.5,7,95,95,97,98) | sys(vKYT1).
compute m295=concat("vKYT1=",string(vKYT1,f4)).
compute p295="vKYT1為不合理值或遺漏值".
compute s295=1.
end if.
Exec.

*vKYT2=1,2359 9797 9898 .
do if not range(vKYT2,1,2359,9797,9797,9898,9898) | sys(vKYT2).
compute m296=concat("vKYT2=",string(vKYT2,f5)).
compute p296="vKYT2為不合理值或遺漏值".
compute s296=1.
end if.
Exec.

*vE1=1,88 97,98 .
do if not range(vE1,1,88,97,98) | sys(vE1).
compute m297=concat("vE1=",string(vE1,f2)).
compute p297="vE1為不合理值或遺漏值".
compute s297=1.
end if.
Exec.

*vE2m01=0,1 .
do if not range(vE2m01,0,1) | sys(vE2m01).
compute m298=concat("vE2m01=",string(vE2m01,f2)).
compute p298="vE2m01為不合理值或遺漏值".
compute s298=1.
end if.
Exec.

*vE2m02=0,1 .
do if not range(vE2m02,0,1) | sys(vE2m02).
compute m299=concat("vE2m02=",string(vE2m02,f2)).
compute p299="vE2m02為不合理值或遺漏值".
compute s299=1.
end if.
Exec.

*vE2m03=0,1 .
do if not range(vE2m03,0,1) | sys(vE2m03).
compute m300=concat("vE2m03=",string(vE2m03,f2)).
compute p300="vE2m03為不合理值或遺漏值".
compute s300=1.
end if.
Exec.

*vE2m04=0,1 .
do if not range(vE2m04,0,1) | sys(vE2m04).
compute m301=concat("vE2m04=",string(vE2m04,f2)).
compute p301="vE2m04為不合理值或遺漏值".
compute s301=1.
end if.
Exec.

*vE2m88=0,1 96 .
do if not range(vE2m88,0,1,96,96) | sys(vE2m88).
compute m302=concat("vE2m88=",string(vE2m88,f2)).
compute p302="vE2m88為不合理值或遺漏值".
compute s302=1.
end if.
Exec.

*vE4=0.5,7 95 97,98 .
do if not range(vE4,0.5,7,95,95,97,98) | sys(vE4).
compute m303=concat("vE4=",string(vE4,f4)).
compute p303="vE4為不合理值或遺漏值".
compute s303=1.
end if.
Exec.

*vCKE4=96 .
do if not range(vCKE4,96,96) | sys(vCKE4).
compute m304=concat("vCKE4=",string(vCKE4,f2)).
compute p304="vCKE4為不合理值或遺漏值".
compute s304=1.
end if.
Exec.

*vE5=0,2359 9797 9898 .
do if not range(vE5,0,2359,9797,9797,9898,9898) | sys(vE5).
compute m305=concat("vE5=",string(vE5,f5)).
compute p305="vE5為不合理值或遺漏值".
compute s305=1.
end if.
Exec.

*vE6=0,2359 9797 9898 .
do if not range(vE6,0,2359,9797,9797,9898,9898) | sys(vE6).
compute m306=concat("vE6=",string(vE6,f5)).
compute p306="vE6為不合理值或遺漏值".
compute s306=1.
end if.
Exec.

*vCKE5=1,88 97,98 .
do if not range(vCKE5,1,88,97,98) | sys(vCKE5).
compute m307=concat("vCKE5=",string(vCKE5,f2)).
compute p307="vCKE5為不合理值或遺漏值".
compute s307=1.
end if.
Exec.

*vE7=0.5,7 95 97,98 .
do if not range(vE7,0.5,7,95,95,97,98) | sys(vE7).
compute m308=concat("vE7=",string(vE7,f4)).
compute p308="vE7為不合理值或遺漏值".
compute s308=1.
end if.
Exec.

*vE8=0,2359 9797 9898 .
do if not range(vE8,0,2359,9797,9797,9898,9898) | sys(vE8).
compute m309=concat("vE8=",string(vE8,f5)).
compute p309="vE8為不合理值或遺漏值".
compute s309=1.
end if.
Exec.

*vE9=0,2359 9797 9898 .
do if not range(vE9,0,2359,9797,9797,9898,9898) | sys(vE9).
compute m310=concat("vE9=",string(vE9,f5)).
compute p310="vE9為不合理值或遺漏值".
compute s310=1.
end if.
Exec.

*vCKE8=1,88 97,98 .
do if not range(vCKE8,1,88,97,98) | sys(vCKE8).
compute m311=concat("vCKE8=",string(vCKE8,f2)).
compute p311="vCKE8為不合理值或遺漏值".
compute s311=1.
end if.
Exec.

*vE10=0.5,7 95 97,98 .
do if not range(vE10,0.5,7,95,95,97,98) | sys(vE10).
compute m312=concat("vE10=",string(vE10,f4)).
compute p312="vE10為不合理值或遺漏值".
compute s312=1.
end if.
Exec.

*vE11=0,2359 9797 9898 .
do if not range(vE11,0,2359,9797,9797,9898,9898) | sys(vE11).
compute m313=concat("vE11=",string(vE11,f5)).
compute p313="vE11為不合理值或遺漏值".
compute s313=1.
end if.
Exec.

*vE12=0,2359 9797 9898 .
do if not range(vE12,0,2359,9797,9797,9898,9898) | sys(vE12).
compute m314=concat("vE12=",string(vE12,f5)).
compute p314="vE12為不合理值或遺漏值".
compute s314=1.
end if.
Exec.

*vCKE11=1,88 97,98 .
do if not range(vCKE11,1,88,97,98) | sys(vCKE11).
compute m315=concat("vCKE11=",string(vCKE11,f2)).
compute p315="vCKE11為不合理值或遺漏值".
compute s315=1.
end if.
Exec.

*vE3=1,2359 9797 9898 .
do if not range(vE3,1,2359,9797,9797,9898,9898) | sys(vE3).
compute m316=concat("vE3=",string(vE3,f5)).
compute p316="vE3為不合理值或遺漏值".
compute s316=1.
end if.
Exec.

*vE13m01=0,1 .
do if not range(vE13m01,0,1) | sys(vE13m01).
compute m317=concat("vE13m01=",string(vE13m01,f2)).
compute p317="vE13m01為不合理值或遺漏值".
compute s317=1.
end if.
Exec.

*vE13m02=0,1 .
do if not range(vE13m02,0,1) | sys(vE13m02).
compute m318=concat("vE13m02=",string(vE13m02,f2)).
compute p318="vE13m02為不合理值或遺漏值".
compute s318=1.
end if.
Exec.

*vE13m03=0,1 .
do if not range(vE13m03,0,1) | sys(vE13m03).
compute m319=concat("vE13m03=",string(vE13m03,f2)).
compute p319="vE13m03為不合理值或遺漏值".
compute s319=1.
end if.
Exec.

*vE13m04=0,1 .
do if not range(vE13m04,0,1) | sys(vE13m04).
compute m320=concat("vE13m04=",string(vE13m04,f2)).
compute p320="vE13m04為不合理值或遺漏值".
compute s320=1.
end if.
Exec.

*vE13m05=0,1 .
do if not range(vE13m05,0,1) | sys(vE13m05).
compute m321=concat("vE13m05=",string(vE13m05,f2)).
compute p321="vE13m05為不合理值或遺漏值".
compute s321=1.
end if.
Exec.

*vE13m06=0,1 .
do if not range(vE13m06,0,1) | sys(vE13m06).
compute m322=concat("vE13m06=",string(vE13m06,f2)).
compute p322="vE13m06為不合理值或遺漏值".
compute s322=1.
end if.
Exec.

*vE13m88=0,1 96 .
do if not range(vE13m88,0,1,96,96) | sys(vE13m88).
compute m323=concat("vE13m88=",string(vE13m88,f2)).
compute p323="vE13m88為不合理值或遺漏值".
compute s323=1.
end if.
Exec.

*vE14=0,100000 999991 999997,999998 .
do if not range(vE14,0,100000,999991,999991,999997,999998) | sys(vE14).
compute m324=concat("vE14=",string(vE14,f7)).
compute p324="vE14為不合理值或遺漏值".
compute s324=1.
end if.
Exec.

*vG7m01=0,1 .
do if not range(vG7m01,0,1) | sys(vG7m01).
compute m325=concat("vG7m01=",string(vG7m01,f2)).
compute p325="vG7m01為不合理值或遺漏值".
compute s325=1.
end if.
Exec.

*vG7m02=0,1 .
do if not range(vG7m02,0,1) | sys(vG7m02).
compute m326=concat("vG7m02=",string(vG7m02,f2)).
compute p326="vG7m02為不合理值或遺漏值".
compute s326=1.
end if.
Exec.

*vG7m03=0,1 .
do if not range(vG7m03,0,1) | sys(vG7m03).
compute m327=concat("vG7m03=",string(vG7m03,f2)).
compute p327="vG7m03為不合理值或遺漏值".
compute s327=1.
end if.
Exec.

*vG7m04=0,1 .
do if not range(vG7m04,0,1) | sys(vG7m04).
compute m328=concat("vG7m04=",string(vG7m04,f2)).
compute p328="vG7m04為不合理值或遺漏值".
compute s328=1.
end if.
Exec.

*vG7m05=0,1 .
do if not range(vG7m05,0,1) | sys(vG7m05).
compute m329=concat("vG7m05=",string(vG7m05,f2)).
compute p329="vG7m05為不合理值或遺漏值".
compute s329=1.
end if.
Exec.

*vG7m06=0,1 .
do if not range(vG7m06,0,1) | sys(vG7m06).
compute m330=concat("vG7m06=",string(vG7m06,f2)).
compute p330="vG7m06為不合理值或遺漏值".
compute s330=1.
end if.
Exec.

*vG7m07=0,1 .
do if not range(vG7m07,0,1) | sys(vG7m07).
compute m331=concat("vG7m07=",string(vG7m07,f2)).
compute p331="vG7m07為不合理值或遺漏值".
compute s331=1.
end if.
Exec.

*vG7m08=0,1 .
do if not range(vG7m08,0,1) | sys(vG7m08).
compute m332=concat("vG7m08=",string(vG7m08,f2)).
compute p332="vG7m08為不合理值或遺漏值".
compute s332=1.
end if.
Exec.

*vG7m09=0,1 .
do if not range(vG7m09,0,1) | sys(vG7m09).
compute m333=concat("vG7m09=",string(vG7m09,f2)).
compute p333="vG7m09為不合理值或遺漏值".
compute s333=1.
end if.
Exec.

*vG7m10=0,1 96 .
do if not range(vG7m10,0,1,96,96) | sys(vG7m10).
compute m334=concat("vG7m10=",string(vG7m10,f2)).
compute p334="vG7m10為不合理值或遺漏值".
compute s334=1.
end if.
Exec.

*vG7m11=0,1 96 .
do if not range(vG7m11,0,1,96,96) | sys(vG7m11).
compute m335=concat("vG7m11=",string(vG7m11,f2)).
compute p335="vG7m11為不合理值或遺漏值".
compute s335=1.
end if.
Exec.

*vG7m12=0,1 96 .
do if not range(vG7m12,0,1,96,96) | sys(vG7m12).
compute m336=concat("vG7m12=",string(vG7m12,f2)).
compute p336="vG7m12為不合理值或遺漏值".
compute s336=1.
end if.
Exec.

*vG7m88=0,1 96 .
do if not range(vG7m88,0,1,96,96) | sys(vG7m88).
compute m337=concat("vG7m88=",string(vG7m88,f2)).
compute p337="vG7m88為不合理值或遺漏值".
compute s337=1.
end if.
Exec.

*vG7m90=0,1 96 .
do if not range(vG7m90,0,1,96,96) | sys(vG7m90).
compute m338=concat("vG7m90=",string(vG7m90,f2)).
compute p338="vG7m90為不合理值或遺漏值".
compute s338=1.
end if.
Exec.

*vG8m01=0,1 .
do if not range(vG8m01,0,1) | sys(vG8m01).
compute m339=concat("vG8m01=",string(vG8m01,f2)).
compute p339="vG8m01為不合理值或遺漏值".
compute s339=1.
end if.
Exec.

*vG8m02=0,1 .
do if not range(vG8m02,0,1) | sys(vG8m02).
compute m340=concat("vG8m02=",string(vG8m02,f2)).
compute p340="vG8m02為不合理值或遺漏值".
compute s340=1.
end if.
Exec.

*vG8m03=0,1 .
do if not range(vG8m03,0,1) | sys(vG8m03).
compute m341=concat("vG8m03=",string(vG8m03,f2)).
compute p341="vG8m03為不合理值或遺漏值".
compute s341=1.
end if.
Exec.

*vG8m04=0,1 .
do if not range(vG8m04,0,1) | sys(vG8m04).
compute m342=concat("vG8m04=",string(vG8m04,f2)).
compute p342="vG8m04為不合理值或遺漏值".
compute s342=1.
end if.
Exec.

*vG8m05=0,1 .
do if not range(vG8m05,0,1) | sys(vG8m05).
compute m343=concat("vG8m05=",string(vG8m05,f2)).
compute p343="vG8m05為不合理值或遺漏值".
compute s343=1.
end if.
Exec.

*vG8m06=0,1 .
do if not range(vG8m06,0,1) | sys(vG8m06).
compute m344=concat("vG8m06=",string(vG8m06,f2)).
compute p344="vG8m06為不合理值或遺漏值".
compute s344=1.
end if.
Exec.

*vG8m07=0,1 .
do if not range(vG8m07,0,1) | sys(vG8m07).
compute m345=concat("vG8m07=",string(vG8m07,f2)).
compute p345="vG8m07為不合理值或遺漏值".
compute s345=1.
end if.
Exec.

*vG8m08=0,1 .
do if not range(vG8m08,0,1) | sys(vG8m08).
compute m346=concat("vG8m08=",string(vG8m08,f2)).
compute p346="vG8m08為不合理值或遺漏值".
compute s346=1.
end if.
Exec.

*vG8m09=0,1 .
do if not range(vG8m09,0,1) | sys(vG8m09).
compute m347=concat("vG8m09=",string(vG8m09,f2)).
compute p347="vG8m09為不合理值或遺漏值".
compute s347=1.
end if.
Exec.

*vG8m10=0,1 96 .
do if not range(vG8m10,0,1,96,96) | sys(vG8m10).
compute m348=concat("vG8m10=",string(vG8m10,f2)).
compute p348="vG8m10為不合理值或遺漏值".
compute s348=1.
end if.
Exec.

*vG8m11=0,1 96 .
do if not range(vG8m11,0,1,96,96) | sys(vG8m11).
compute m349=concat("vG8m11=",string(vG8m11,f2)).
compute p349="vG8m11為不合理值或遺漏值".
compute s349=1.
end if.
Exec.

*vG8m12=0,1 96 .
do if not range(vG8m12,0,1,96,96) | sys(vG8m12).
compute m350=concat("vG8m12=",string(vG8m12,f2)).
compute p350="vG8m12為不合理值或遺漏值".
compute s350=1.
end if.
Exec.

*vG8m13=0,1 96 .
do if not range(vG8m13,0,1,96,96) | sys(vG8m13).
compute m351=concat("vG8m13=",string(vG8m13,f2)).
compute p351="vG8m13為不合理值或遺漏值".
compute s351=1.
end if.
Exec.

*vG8m14=0,1 96 .
do if not range(vG8m14,0,1,96,96) | sys(vG8m14).
compute m352=concat("vG8m14=",string(vG8m14,f2)).
compute p352="vG8m14為不合理值或遺漏值".
compute s352=1.
end if.
Exec.

*vG8m15=0,1 96 .
do if not range(vG8m15,0,1,96,96) | sys(vG8m15).
compute m353=concat("vG8m15=",string(vG8m15,f2)).
compute p353="vG8m15為不合理值或遺漏值".
compute s353=1.
end if.
Exec.

*vG8m16=0,1 96 .
do if not range(vG8m16,0,1,96,96) | sys(vG8m16).
compute m354=concat("vG8m16=",string(vG8m16,f2)).
compute p354="vG8m16為不合理值或遺漏值".
compute s354=1.
end if.
Exec.

*vG8m88=0,1 96 .
do if not range(vG8m88,0,1,96,96) | sys(vG8m88).
compute m355=concat("vG8m88=",string(vG8m88,f2)).
compute p355="vG8m88為不合理值或遺漏值".
compute s355=1.
end if.
Exec.

*vG8m90=0,1 96 .
do if not range(vG8m90,0,1,96,96) | sys(vG8m90).
compute m356=concat("vG8m90=",string(vG8m90,f2)).
compute p356="vG8m90為不合理值或遺漏值".
compute s356=1.
end if.
Exec.

*vG9m01=0,1 .
do if not range(vG9m01,0,1) | sys(vG9m01).
compute m357=concat("vG9m01=",string(vG9m01,f2)).
compute p357="vG9m01為不合理值或遺漏值".
compute s357=1.
end if.
Exec.

*vG9m02=0,1 .
do if not range(vG9m02,0,1) | sys(vG9m02).
compute m358=concat("vG9m02=",string(vG9m02,f2)).
compute p358="vG9m02為不合理值或遺漏值".
compute s358=1.
end if.
Exec.

*vG9m03=0,1 .
do if not range(vG9m03,0,1) | sys(vG9m03).
compute m359=concat("vG9m03=",string(vG9m03,f2)).
compute p359="vG9m03為不合理值或遺漏值".
compute s359=1.
end if.
Exec.

*vG9m04=0,1 .
do if not range(vG9m04,0,1) | sys(vG9m04).
compute m360=concat("vG9m04=",string(vG9m04,f2)).
compute p360="vG9m04為不合理值或遺漏值".
compute s360=1.
end if.
Exec.

*vG9m05=0,1 .
do if not range(vG9m05,0,1) | sys(vG9m05).
compute m361=concat("vG9m05=",string(vG9m05,f2)).
compute p361="vG9m05為不合理值或遺漏值".
compute s361=1.
end if.
Exec.

*vG9m06=0,1 .
do if not range(vG9m06,0,1) | sys(vG9m06).
compute m362=concat("vG9m06=",string(vG9m06,f2)).
compute p362="vG9m06為不合理值或遺漏值".
compute s362=1.
end if.
Exec.

*vG9m07=0,1 .
do if not range(vG9m07,0,1) | sys(vG9m07).
compute m363=concat("vG9m07=",string(vG9m07,f2)).
compute p363="vG9m07為不合理值或遺漏值".
compute s363=1.
end if.
Exec.

*vG9m08=0,1 .
do if not range(vG9m08,0,1) | sys(vG9m08).
compute m364=concat("vG9m08=",string(vG9m08,f2)).
compute p364="vG9m08為不合理值或遺漏值".
compute s364=1.
end if.
Exec.

*vG9m09=0,1 .
do if not range(vG9m09,0,1) | sys(vG9m09).
compute m365=concat("vG9m09=",string(vG9m09,f2)).
compute p365="vG9m09為不合理值或遺漏值".
compute s365=1.
end if.
Exec.

*vG9m10=0,1 96 .
do if not range(vG9m10,0,1,96,96) | sys(vG9m10).
compute m366=concat("vG9m10=",string(vG9m10,f2)).
compute p366="vG9m10為不合理值或遺漏值".
compute s366=1.
end if.
Exec.

*vG9m11=0,1 96 .
do if not range(vG9m11,0,1,96,96) | sys(vG9m11).
compute m367=concat("vG9m11=",string(vG9m11,f2)).
compute p367="vG9m11為不合理值或遺漏值".
compute s367=1.
end if.
Exec.

*vG9m12=0,1 96 .
do if not range(vG9m12,0,1,96,96) | sys(vG9m12).
compute m368=concat("vG9m12=",string(vG9m12,f2)).
compute p368="vG9m12為不合理值或遺漏值".
compute s368=1.
end if.
Exec.

*vG9m13=0,1 96 .
do if not range(vG9m13,0,1,96,96) | sys(vG9m13).
compute m369=concat("vG9m13=",string(vG9m13,f2)).
compute p369="vG9m13為不合理值或遺漏值".
compute s369=1.
end if.
Exec.

*vG9m88=0,1 96 .
do if not range(vG9m88,0,1,96,96) | sys(vG9m88).
compute m370=concat("vG9m88=",string(vG9m88,f2)).
compute p370="vG9m88為不合理值或遺漏值".
compute s370=1.
end if.
Exec.

*vG9m90=0,1 96 .
do if not range(vG9m90,0,1,96,96) | sys(vG9m90).
compute m371=concat("vG9m90=",string(vG9m90,f2)).
compute p371="vG9m90為不合理值或遺漏值".
compute s371=1.
end if.
Exec.

*vG10m01=0,1 .
do if not range(vG10m01,0,1) | sys(vG10m01).
compute m372=concat("vG10m01=",string(vG10m01,f2)).
compute p372="vG10m01為不合理值或遺漏值".
compute s372=1.
end if.
Exec.

*vG10m02=0,1 .
do if not range(vG10m02,0,1) | sys(vG10m02).
compute m373=concat("vG10m02=",string(vG10m02,f2)).
compute p373="vG10m02為不合理值或遺漏值".
compute s373=1.
end if.
Exec.

*vG10m03=0,1 .
do if not range(vG10m03,0,1) | sys(vG10m03).
compute m374=concat("vG10m03=",string(vG10m03,f2)).
compute p374="vG10m03為不合理值或遺漏值".
compute s374=1.
end if.
Exec.

*vG10m04=0,1 .
do if not range(vG10m04,0,1) | sys(vG10m04).
compute m375=concat("vG10m04=",string(vG10m04,f2)).
compute p375="vG10m04為不合理值或遺漏值".
compute s375=1.
end if.
Exec.

*vG10m05=0,1 .
do if not range(vG10m05,0,1) | sys(vG10m05).
compute m376=concat("vG10m05=",string(vG10m05,f2)).
compute p376="vG10m05為不合理值或遺漏值".
compute s376=1.
end if.
Exec.

*vG10m06=0,1 .
do if not range(vG10m06,0,1) | sys(vG10m06).
compute m377=concat("vG10m06=",string(vG10m06,f2)).
compute p377="vG10m06為不合理值或遺漏值".
compute s377=1.
end if.
Exec.

*vG10m07=0,1 .
do if not range(vG10m07,0,1) | sys(vG10m07).
compute m378=concat("vG10m07=",string(vG10m07,f2)).
compute p378="vG10m07為不合理值或遺漏值".
compute s378=1.
end if.
Exec.

*vG10m08=0,1 .
do if not range(vG10m08,0,1) | sys(vG10m08).
compute m379=concat("vG10m08=",string(vG10m08,f2)).
compute p379="vG10m08為不合理值或遺漏值".
compute s379=1.
end if.
Exec.

*vG10m09=0,1 .
do if not range(vG10m09,0,1) | sys(vG10m09).
compute m380=concat("vG10m09=",string(vG10m09,f2)).
compute p380="vG10m09為不合理值或遺漏值".
compute s380=1.
end if.
Exec.

*vG10m10=0,1 96 .
do if not range(vG10m10,0,1,96,96) | sys(vG10m10).
compute m381=concat("vG10m10=",string(vG10m10,f2)).
compute p381="vG10m10為不合理值或遺漏值".
compute s381=1.
end if.
Exec.

*vG10m11=0,1 96 .
do if not range(vG10m11,0,1,96,96) | sys(vG10m11).
compute m382=concat("vG10m11=",string(vG10m11,f2)).
compute p382="vG10m11為不合理值或遺漏值".
compute s382=1.
end if.
Exec.

*vG10m12=0,1 96 .
do if not range(vG10m12,0,1,96,96) | sys(vG10m12).
compute m383=concat("vG10m12=",string(vG10m12,f2)).
compute p383="vG10m12為不合理值或遺漏值".
compute s383=1.
end if.
Exec.

*vG10m13=0,1 96 .
do if not range(vG10m13,0,1,96,96) | sys(vG10m13).
compute m384=concat("vG10m13=",string(vG10m13,f2)).
compute p384="vG10m13為不合理值或遺漏值".
compute s384=1.
end if.
Exec.

*vG10m14=0,1 96 .
do if not range(vG10m14,0,1,96,96) | sys(vG10m14).
compute m385=concat("vG10m14=",string(vG10m14,f2)).
compute p385="vG10m14為不合理值或遺漏值".
compute s385=1.
end if.
Exec.

*vG10m15=0,1 96 .
do if not range(vG10m15,0,1,96,96) | sys(vG10m15).
compute m386=concat("vG10m15=",string(vG10m15,f2)).
compute p386="vG10m15為不合理值或遺漏值".
compute s386=1.
end if.
Exec.

*vG10m16=0,1 96 .
do if not range(vG10m16,0,1,96,96) | sys(vG10m16).
compute m387=concat("vG10m16=",string(vG10m16,f2)).
compute p387="vG10m16為不合理值或遺漏值".
compute s387=1.
end if.
Exec.

*vG10m17=0,1 96 .
do if not range(vG10m17,0,1,96,96) | sys(vG10m17).
compute m388=concat("vG10m17=",string(vG10m17,f2)).
compute p388="vG10m17為不合理值或遺漏值".
compute s388=1.
end if.
Exec.

*vG10m18=0,1 96 .
do if not range(vG10m18,0,1,96,96) | sys(vG10m18).
compute m389=concat("vG10m18=",string(vG10m18,f2)).
compute p389="vG10m18為不合理值或遺漏值".
compute s389=1.
end if.
Exec.

*vG10m19=0,1 96 .
do if not range(vG10m19,0,1,96,96) | sys(vG10m19).
compute m390=concat("vG10m19=",string(vG10m19,f2)).
compute p390="vG10m19為不合理值或遺漏值".
compute s390=1.
end if.
Exec.

*vG10m88=0,1 96 .
do if not range(vG10m88,0,1,96,96) | sys(vG10m88).
compute m391=concat("vG10m88=",string(vG10m88,f2)).
compute p391="vG10m88為不合理值或遺漏值".
compute s391=1.
end if.
Exec.

*vG10m90=0,1 96 .
do if not range(vG10m90,0,1,96,96) | sys(vG10m90).
compute m392=concat("vG10m90=",string(vG10m90,f2)).
compute p392="vG10m90為不合理值或遺漏值".
compute s392=1.
end if.
Exec.

*vG11m01=0,1 .
do if not range(vG11m01,0,1) | sys(vG11m01).
compute m393=concat("vG11m01=",string(vG11m01,f2)).
compute p393="vG11m01為不合理值或遺漏值".
compute s393=1.
end if.
Exec.

*vG11m02=0,1 .
do if not range(vG11m02,0,1) | sys(vG11m02).
compute m394=concat("vG11m02=",string(vG11m02,f2)).
compute p394="vG11m02為不合理值或遺漏值".
compute s394=1.
end if.
Exec.

*vG11m03=0,1 .
do if not range(vG11m03,0,1) | sys(vG11m03).
compute m395=concat("vG11m03=",string(vG11m03,f2)).
compute p395="vG11m03為不合理值或遺漏值".
compute s395=1.
end if.
Exec.

*vG11m04=0,1 .
do if not range(vG11m04,0,1) | sys(vG11m04).
compute m396=concat("vG11m04=",string(vG11m04,f2)).
compute p396="vG11m04為不合理值或遺漏值".
compute s396=1.
end if.
Exec.

*vG11m05=0,1 .
do if not range(vG11m05,0,1) | sys(vG11m05).
compute m397=concat("vG11m05=",string(vG11m05,f2)).
compute p397="vG11m05為不合理值或遺漏值".
compute s397=1.
end if.
Exec.

*vG11m88=0,1 96 .
do if not range(vG11m88,0,1,96,96) | sys(vG11m88).
compute m398=concat("vG11m88=",string(vG11m88,f2)).
compute p398="vG11m88為不合理值或遺漏值".
compute s398=1.
end if.
Exec.

*vG11m90=0,1 96 .
do if not range(vG11m90,0,1,96,96) | sys(vG11m90).
compute m399=concat("vG11m90=",string(vG11m90,f2)).
compute p399="vG11m90為不合理值或遺漏值".
compute s399=1.
end if.
Exec.

*vG4=0.5,7 95 97,98 .
do if not range(vG4,0.5,7,95,95,97,98) | sys(vG4).
compute m400=concat("vG4=",string(vG4,f4)).
compute p400="vG4為不合理值或遺漏值".
compute s400=1.
end if.
Exec.

*vG5=1,2359 9797 9898 .
do if not range(vG5,1,2359,9797,9797,9898,9898) | sys(vG5).
compute m401=concat("vG5=",string(vG5,f5)).
compute p401="vG5為不合理值或遺漏值".
compute s401=1.
end if.
Exec.

*vB1=0,5 95 97,98 .
do if not range(vB1,0,5,95,95,97,98) | sys(vB1).
compute m402=concat("vB1=",string(vB1,f4)).
compute p402="vB1為不合理值或遺漏值".
compute s402=1.
end if.
Exec.

*vB2=1,2359 9797 9898 .
do if not range(vB2,1,2359,9797,9797,9898,9898) | sys(vB2).
compute m403=concat("vB2=",string(vB2,f5)).
compute p403="vB2為不合理值或遺漏值".
compute s403=1.
end if.
Exec.

*vB3=0,2 95 97,98 .
do if not range(vB3,0,2,95,95,97,98) | sys(vB3).
compute m404=concat("vB3=",string(vB3,f4)).
compute p404="vB3為不合理值或遺漏值".
compute s404=1.
end if.
Exec.

*vB4=1,2359 9797 9898 .
do if not range(vB4,1,2359,9797,9797,9898,9898) | sys(vB4).
compute m405=concat("vB4=",string(vB4,f5)).
compute p405="vB4為不合理值或遺漏值".
compute s405=1.
end if.
Exec.

*vB5=0,7 95 97,98 .
do if not range(vB5,0,7,95,95,97,98) | sys(vB5).
compute m406=concat("vB5=",string(vB5,f4)).
compute p406="vB5為不合理值或遺漏值".
compute s406=1.
end if.
Exec.

*vCKB5=96 .
do if not range(vCKB5,96,96) | sys(vCKB5).
compute m407=concat("vCKB5=",string(vCKB5,f2)).
compute p407="vCKB5為不合理值或遺漏值".
compute s407=1.
end if.
Exec.

*vB6=1,2359 9797 9898 .
do if not range(vB6,1,2359,9797,9797,9898,9898) | sys(vB6).
compute m408=concat("vB6=",string(vB6,f5)).
compute p408="vB6為不合理值或遺漏值".
compute s408=1.
end if.
Exec.

*vB7am01=0,1 .
do if not range(vB7am01,0,1) | sys(vB7am01).
compute m409=concat("vB7am01=",string(vB7am01,f2)).
compute p409="vB7am01為不合理值或遺漏值".
compute s409=1.
end if.
Exec.

*vB7am02=0,1 .
do if not range(vB7am02,0,1) | sys(vB7am02).
compute m410=concat("vB7am02=",string(vB7am02,f2)).
compute p410="vB7am02為不合理值或遺漏值".
compute s410=1.
end if.
Exec.

*vB7am03=0,1 .
do if not range(vB7am03,0,1) | sys(vB7am03).
compute m411=concat("vB7am03=",string(vB7am03,f2)).
compute p411="vB7am03為不合理值或遺漏值".
compute s411=1.
end if.
Exec.

*vB7am04=0,1 .
do if not range(vB7am04,0,1) | sys(vB7am04).
compute m412=concat("vB7am04=",string(vB7am04,f2)).
compute p412="vB7am04為不合理值或遺漏值".
compute s412=1.
end if.
Exec.

*vB7am05=0,1 .
do if not range(vB7am05,0,1) | sys(vB7am05).
compute m413=concat("vB7am05=",string(vB7am05,f2)).
compute p413="vB7am05為不合理值或遺漏值".
compute s413=1.
end if.
Exec.

*vB7am06=0,1 .
do if not range(vB7am06,0,1) | sys(vB7am06).
compute m414=concat("vB7am06=",string(vB7am06,f2)).
compute p414="vB7am06為不合理值或遺漏值".
compute s414=1.
end if.
Exec.

*vB7am07=0,1 .
do if not range(vB7am07,0,1) | sys(vB7am07).
compute m415=concat("vB7am07=",string(vB7am07,f2)).
compute p415="vB7am07為不合理值或遺漏值".
compute s415=1.
end if.
Exec.

*vB7am08=0,1 .
do if not range(vB7am08,0,1) | sys(vB7am08).
compute m416=concat("vB7am08=",string(vB7am08,f2)).
compute p416="vB7am08為不合理值或遺漏值".
compute s416=1.
end if.
Exec.

*vB7am09=0,1 .
do if not range(vB7am09,0,1) | sys(vB7am09).
compute m417=concat("vB7am09=",string(vB7am09,f2)).
compute p417="vB7am09為不合理值或遺漏值".
compute s417=1.
end if.
Exec.

*vB7am10=0,1 96 .
do if not range(vB7am10,0,1,96,96) | sys(vB7am10).
compute m418=concat("vB7am10=",string(vB7am10,f2)).
compute p418="vB7am10為不合理值或遺漏值".
compute s418=1.
end if.
Exec.

*vB7am11=0,1 96 .
do if not range(vB7am11,0,1,96,96) | sys(vB7am11).
compute m419=concat("vB7am11=",string(vB7am11,f2)).
compute p419="vB7am11為不合理值或遺漏值".
compute s419=1.
end if.
Exec.

*vB7am12=0,1 96 .
do if not range(vB7am12,0,1,96,96) | sys(vB7am12).
compute m420=concat("vB7am12=",string(vB7am12,f2)).
compute p420="vB7am12為不合理值或遺漏值".
compute s420=1.
end if.
Exec.

*vB7am13=0,1 96 .
do if not range(vB7am13,0,1,96,96) | sys(vB7am13).
compute m421=concat("vB7am13=",string(vB7am13,f2)).
compute p421="vB7am13為不合理值或遺漏值".
compute s421=1.
end if.
Exec.

*vB7am14=0,1 96 .
do if not range(vB7am14,0,1,96,96) | sys(vB7am14).
compute m422=concat("vB7am14=",string(vB7am14,f2)).
compute p422="vB7am14為不合理值或遺漏值".
compute s422=1.
end if.
Exec.

*vB7am15=0,1 96 .
do if not range(vB7am15,0,1,96,96) | sys(vB7am15).
compute m423=concat("vB7am15=",string(vB7am15,f2)).
compute p423="vB7am15為不合理值或遺漏值".
compute s423=1.
end if.
Exec.

*vB7am16=0,1 96 .
do if not range(vB7am16,0,1,96,96) | sys(vB7am16).
compute m424=concat("vB7am16=",string(vB7am16,f2)).
compute p424="vB7am16為不合理值或遺漏值".
compute s424=1.
end if.
Exec.

*vB7am17=0,1 96 .
do if not range(vB7am17,0,1,96,96) | sys(vB7am17).
compute m425=concat("vB7am17=",string(vB7am17,f2)).
compute p425="vB7am17為不合理值或遺漏值".
compute s425=1.
end if.
Exec.

*vB7am18=0,1 96 .
do if not range(vB7am18,0,1,96,96) | sys(vB7am18).
compute m426=concat("vB7am18=",string(vB7am18,f2)).
compute p426="vB7am18為不合理值或遺漏值".
compute s426=1.
end if.
Exec.

*vB7am19=0,1 96 .
do if not range(vB7am19,0,1,96,96) | sys(vB7am19).
compute m427=concat("vB7am19=",string(vB7am19,f2)).
compute p427="vB7am19為不合理值或遺漏值".
compute s427=1.
end if.
Exec.

*vB7am20=0,1 96 .
do if not range(vB7am20,0,1,96,96) | sys(vB7am20).
compute m428=concat("vB7am20=",string(vB7am20,f2)).
compute p428="vB7am20為不合理值或遺漏值".
compute s428=1.
end if.
Exec.

*vB7am21=0,1 96 .
do if not range(vB7am21,0,1,96,96) | sys(vB7am21).
compute m429=concat("vB7am21=",string(vB7am21,f2)).
compute p429="vB7am21為不合理值或遺漏值".
compute s429=1.
end if.
Exec.

*vB7am22=0,1 96 .
do if not range(vB7am22,0,1,96,96) | sys(vB7am22).
compute m430=concat("vB7am22=",string(vB7am22,f2)).
compute p430="vB7am22為不合理值或遺漏值".
compute s430=1.
end if.
Exec.

*vB7am23=0,1 96 .
do if not range(vB7am23,0,1,96,96) | sys(vB7am23).
compute m431=concat("vB7am23=",string(vB7am23,f2)).
compute p431="vB7am23為不合理值或遺漏值".
compute s431=1.
end if.
Exec.

*vB7am24=0,1 96 .
do if not range(vB7am24,0,1,96,96) | sys(vB7am24).
compute m432=concat("vB7am24=",string(vB7am24,f2)).
compute p432="vB7am24為不合理值或遺漏值".
compute s432=1.
end if.
Exec.

*vB7am25=0,1 96 .
do if not range(vB7am25,0,1,96,96) | sys(vB7am25).
compute m433=concat("vB7am25=",string(vB7am25,f2)).
compute p433="vB7am25為不合理值或遺漏值".
compute s433=1.
end if.
Exec.

*vB7am26=0,1 96 .
do if not range(vB7am26,0,1,96,96) | sys(vB7am26).
compute m434=concat("vB7am26=",string(vB7am26,f2)).
compute p434="vB7am26為不合理值或遺漏值".
compute s434=1.
end if.
Exec.

*vB7am27=0,1 96 .
do if not range(vB7am27,0,1,96,96) | sys(vB7am27).
compute m435=concat("vB7am27=",string(vB7am27,f2)).
compute p435="vB7am27為不合理值或遺漏值".
compute s435=1.
end if.
Exec.

*vB7am28=0,1 96 .
do if not range(vB7am28,0,1,96,96) | sys(vB7am28).
compute m436=concat("vB7am28=",string(vB7am28,f2)).
compute p436="vB7am28為不合理值或遺漏值".
compute s436=1.
end if.
Exec.

*vB7am29=0,1 96 .
do if not range(vB7am29,0,1,96,96) | sys(vB7am29).
compute m437=concat("vB7am29=",string(vB7am29,f2)).
compute p437="vB7am29為不合理值或遺漏值".
compute s437=1.
end if.
Exec.

*vB7am30=0,1 96 .
do if not range(vB7am30,0,1,96,96) | sys(vB7am30).
compute m438=concat("vB7am30=",string(vB7am30,f2)).
compute p438="vB7am30為不合理值或遺漏值".
compute s438=1.
end if.
Exec.

*vB7am31=0,1 96 .
do if not range(vB7am31,0,1,96,96) | sys(vB7am31).
compute m439=concat("vB7am31=",string(vB7am31,f2)).
compute p439="vB7am31為不合理值或遺漏值".
compute s439=1.
end if.
Exec.

*vB7am32=0,1 96 .
do if not range(vB7am32,0,1,96,96) | sys(vB7am32).
compute m440=concat("vB7am32=",string(vB7am32,f2)).
compute p440="vB7am32為不合理值或遺漏值".
compute s440=1.
end if.
Exec.

*vB7am33=0,1 96 .
do if not range(vB7am33,0,1,96,96) | sys(vB7am33).
compute m441=concat("vB7am33=",string(vB7am33,f2)).
compute p441="vB7am33為不合理值或遺漏值".
compute s441=1.
end if.
Exec.

*vB7am34=0,1 96 .
do if not range(vB7am34,0,1,96,96) | sys(vB7am34).
compute m442=concat("vB7am34=",string(vB7am34,f2)).
compute p442="vB7am34為不合理值或遺漏值".
compute s442=1.
end if.
Exec.

*vB7am35=0,1 96 .
do if not range(vB7am35,0,1,96,96) | sys(vB7am35).
compute m443=concat("vB7am35=",string(vB7am35,f2)).
compute p443="vB7am35為不合理值或遺漏值".
compute s443=1.
end if.
Exec.

*vB7am36=0,1 96 .
do if not range(vB7am36,0,1,96,96) | sys(vB7am36).
compute m444=concat("vB7am36=",string(vB7am36,f2)).
compute p444="vB7am36為不合理值或遺漏值".
compute s444=1.
end if.
Exec.

*vB7am37=0,1 96 .
do if not range(vB7am37,0,1,96,96) | sys(vB7am37).
compute m445=concat("vB7am37=",string(vB7am37,f2)).
compute p445="vB7am37為不合理值或遺漏值".
compute s445=1.
end if.
Exec.

*vB7am38=0,1 96 .
do if not range(vB7am38,0,1,96,96) | sys(vB7am38).
compute m446=concat("vB7am38=",string(vB7am38,f2)).
compute p446="vB7am38為不合理值或遺漏值".
compute s446=1.
end if.
Exec.

*vB7am39=0,1 96 .
do if not range(vB7am39,0,1,96,96) | sys(vB7am39).
compute m447=concat("vB7am39=",string(vB7am39,f2)).
compute p447="vB7am39為不合理值或遺漏值".
compute s447=1.
end if.
Exec.

*vB7am40=0,1 96 .
do if not range(vB7am40,0,1,96,96) | sys(vB7am40).
compute m448=concat("vB7am40=",string(vB7am40,f2)).
compute p448="vB7am40為不合理值或遺漏值".
compute s448=1.
end if.
Exec.

*vB7am41=0,1 96 .
do if not range(vB7am41,0,1,96,96) | sys(vB7am41).
compute m449=concat("vB7am41=",string(vB7am41,f2)).
compute p449="vB7am41為不合理值或遺漏值".
compute s449=1.
end if.
Exec.

*vB7am42=0,1 96 .
do if not range(vB7am42,0,1,96,96) | sys(vB7am42).
compute m450=concat("vB7am42=",string(vB7am42,f2)).
compute p450="vB7am42為不合理值或遺漏值".
compute s450=1.
end if.
Exec.

*vB7am43=0,1 96 .
do if not range(vB7am43,0,1,96,96) | sys(vB7am43).
compute m451=concat("vB7am43=",string(vB7am43,f2)).
compute p451="vB7am43為不合理值或遺漏值".
compute s451=1.
end if.
Exec.

*vB7am44=0,1 96 .
do if not range(vB7am44,0,1,96,96) | sys(vB7am44).
compute m452=concat("vB7am44=",string(vB7am44,f2)).
compute p452="vB7am44為不合理值或遺漏值".
compute s452=1.
end if.
Exec.

*vB7am45=0,1 96 .
do if not range(vB7am45,0,1,96,96) | sys(vB7am45).
compute m453=concat("vB7am45=",string(vB7am45,f2)).
compute p453="vB7am45為不合理值或遺漏值".
compute s453=1.
end if.
Exec.

*vB7am46=0,1 96 .
do if not range(vB7am46,0,1,96,96) | sys(vB7am46).
compute m454=concat("vB7am46=",string(vB7am46,f2)).
compute p454="vB7am46為不合理值或遺漏值".
compute s454=1.
end if.
Exec.

*vB7am47=0,1 96 .
do if not range(vB7am47,0,1,96,96) | sys(vB7am47).
compute m455=concat("vB7am47=",string(vB7am47,f2)).
compute p455="vB7am47為不合理值或遺漏值".
compute s455=1.
end if.
Exec.

*vB7am48=0,1 96 .
do if not range(vB7am48,0,1,96,96) | sys(vB7am48).
compute m456=concat("vB7am48=",string(vB7am48,f2)).
compute p456="vB7am48為不合理值或遺漏值".
compute s456=1.
end if.
Exec.

*vB7am49=0,1 96 .
do if not range(vB7am49,0,1,96,96) | sys(vB7am49).
compute m457=concat("vB7am49=",string(vB7am49,f2)).
compute p457="vB7am49為不合理值或遺漏值".
compute s457=1.
end if.
Exec.

*vB7am50=0,1 96 .
do if not range(vB7am50,0,1,96,96) | sys(vB7am50).
compute m458=concat("vB7am50=",string(vB7am50,f2)).
compute p458="vB7am50為不合理值或遺漏值".
compute s458=1.
end if.
Exec.

*vB7am51=0,1 96 .
do if not range(vB7am51,0,1,96,96) | sys(vB7am51).
compute m459=concat("vB7am51=",string(vB7am51,f2)).
compute p459="vB7am51為不合理值或遺漏值".
compute s459=1.
end if.
Exec.

*vB7am52=0,1 96 .
do if not range(vB7am52,0,1,96,96) | sys(vB7am52).
compute m460=concat("vB7am52=",string(vB7am52,f2)).
compute p460="vB7am52為不合理值或遺漏值".
compute s460=1.
end if.
Exec.

*vB7am53=0,1 96 .
do if not range(vB7am53,0,1,96,96) | sys(vB7am53).
compute m461=concat("vB7am53=",string(vB7am53,f2)).
compute p461="vB7am53為不合理值或遺漏值".
compute s461=1.
end if.
Exec.

*vB7am54=0,1 96 .
do if not range(vB7am54,0,1,96,96) | sys(vB7am54).
compute m462=concat("vB7am54=",string(vB7am54,f2)).
compute p462="vB7am54為不合理值或遺漏值".
compute s462=1.
end if.
Exec.

*vB7am88=0,1 96 .
do if not range(vB7am88,0,1,96,96) | sys(vB7am88).
compute m463=concat("vB7am88=",string(vB7am88,f2)).
compute p463="vB7am88為不合理值或遺漏值".
compute s463=1.
end if.
Exec.

*vB7=1,88 97,98 .
do if not range(vB7,1,88,97,98) | sys(vB7).
compute m464=concat("vB7=",string(vB7,f2)).
compute p464="vB7為不合理值或遺漏值".
compute s464=1.
end if.
Exec.

*vB8m01=0,1 .
do if not range(vB8m01,0,1) | sys(vB8m01).
compute m465=concat("vB8m01=",string(vB8m01,f2)).
compute p465="vB8m01為不合理值或遺漏值".
compute s465=1.
end if.
Exec.

*vB8m02=0,1 .
do if not range(vB8m02,0,1) | sys(vB8m02).
compute m466=concat("vB8m02=",string(vB8m02,f2)).
compute p466="vB8m02為不合理值或遺漏值".
compute s466=1.
end if.
Exec.

*vB8m03=0,1 .
do if not range(vB8m03,0,1) | sys(vB8m03).
compute m467=concat("vB8m03=",string(vB8m03,f2)).
compute p467="vB8m03為不合理值或遺漏值".
compute s467=1.
end if.
Exec.

*vB8m04=0,1 .
do if not range(vB8m04,0,1) | sys(vB8m04).
compute m468=concat("vB8m04=",string(vB8m04,f2)).
compute p468="vB8m04為不合理值或遺漏值".
compute s468=1.
end if.
Exec.

*vB8m05=0,1 .
do if not range(vB8m05,0,1) | sys(vB8m05).
compute m469=concat("vB8m05=",string(vB8m05,f2)).
compute p469="vB8m05為不合理值或遺漏值".
compute s469=1.
end if.
Exec.

*vB8m06=0,1 .
do if not range(vB8m06,0,1) | sys(vB8m06).
compute m470=concat("vB8m06=",string(vB8m06,f2)).
compute p470="vB8m06為不合理值或遺漏值".
compute s470=1.
end if.
Exec.

*vB8m07=0,1 .
do if not range(vB8m07,0,1) | sys(vB8m07).
compute m471=concat("vB8m07=",string(vB8m07,f2)).
compute p471="vB8m07為不合理值或遺漏值".
compute s471=1.
end if.
Exec.

*vB8m08=0,1 .
do if not range(vB8m08,0,1) | sys(vB8m08).
compute m472=concat("vB8m08=",string(vB8m08,f2)).
compute p472="vB8m08為不合理值或遺漏值".
compute s472=1.
end if.
Exec.

*vB8m09=0,1 .
do if not range(vB8m09,0,1) | sys(vB8m09).
compute m473=concat("vB8m09=",string(vB8m09,f2)).
compute p473="vB8m09為不合理值或遺漏值".
compute s473=1.
end if.
Exec.

*vB8m10=0,1 96 .
do if not range(vB8m10,0,1,96,96) | sys(vB8m10).
compute m474=concat("vB8m10=",string(vB8m10,f2)).
compute p474="vB8m10為不合理值或遺漏值".
compute s474=1.
end if.
Exec.

*vB8m88=0,1 96 .
do if not range(vB8m88,0,1,96,96) | sys(vB8m88).
compute m475=concat("vB8m88=",string(vB8m88,f2)).
compute p475="vB8m88為不合理值或遺漏值".
compute s475=1.
end if.
Exec.

*vI1=0,5 95 97,98 .
do if not range(vI1,0,5,95,95,97,98) | sys(vI1).
compute m476=concat("vI1=",string(vI1,f4)).
compute p476="vI1為不合理值或遺漏值".
compute s476=1.
end if.
Exec.

*vI2=1,2359 9797 9898 .
do if not range(vI2,1,2359,9797,9797,9898,9898) | sys(vI2).
compute m477=concat("vI2=",string(vI2,f5)).
compute p477="vI2為不合理值或遺漏值".
compute s477=1.
end if.
Exec.

*vI3=0,2 95 97,98 .
do if not range(vI3,0,2,95,95,97,98) | sys(vI3).
compute m478=concat("vI3=",string(vI3,f4)).
compute p478="vI3為不合理值或遺漏值".
compute s478=1.
end if.
Exec.

*vI4=1,2359 9797 9898 .
do if not range(vI4,1,2359,9797,9797,9898,9898) | sys(vI4).
compute m479=concat("vI4=",string(vI4,f5)).
compute p479="vI4為不合理值或遺漏值".
compute s479=1.
end if.
Exec.

*vCKI4=96 .
do if not range(vCKI4,96,96) | sys(vCKI4).
compute m480=concat("vCKI4=",string(vCKI4,f2)).
compute p480="vCKI4為不合理值或遺漏值".
compute s480=1.
end if.
Exec.

*vG1=0,7 95 97,98 .
do if not range(vG1,0,7,95,95,97,98) | sys(vG1).
compute m481=concat("vG1=",string(vG1,f4)).
compute p481="vG1為不合理值或遺漏值".
compute s481=1.
end if.
Exec.

*vG2=1,2359 9797 9898 .
do if not range(vG2,1,2359,9797,9797,9898,9898) | sys(vG2).
compute m482=concat("vG2=",string(vG2,f5)).
compute p482="vG2為不合理值或遺漏值".
compute s482=1.
end if.
Exec.

*vG3m01=0,1 .
do if not range(vG3m01,0,1) | sys(vG3m01).
compute m483=concat("vG3m01=",string(vG3m01,f2)).
compute p483="vG3m01為不合理值或遺漏值".
compute s483=1.
end if.
Exec.

*vG3m02=0,1 .
do if not range(vG3m02,0,1) | sys(vG3m02).
compute m484=concat("vG3m02=",string(vG3m02,f2)).
compute p484="vG3m02為不合理值或遺漏值".
compute s484=1.
end if.
Exec.

*vG3m03=0,1 .
do if not range(vG3m03,0,1) | sys(vG3m03).
compute m485=concat("vG3m03=",string(vG3m03,f2)).
compute p485="vG3m03為不合理值或遺漏值".
compute s485=1.
end if.
Exec.

*vG3m04=0,1 .
do if not range(vG3m04,0,1) | sys(vG3m04).
compute m486=concat("vG3m04=",string(vG3m04,f2)).
compute p486="vG3m04為不合理值或遺漏值".
compute s486=1.
end if.
Exec.

*vG3m05=0,1 .
do if not range(vG3m05,0,1) | sys(vG3m05).
compute m487=concat("vG3m05=",string(vG3m05,f2)).
compute p487="vG3m05為不合理值或遺漏值".
compute s487=1.
end if.
Exec.

*vG3m06=0,1 .
do if not range(vG3m06,0,1) | sys(vG3m06).
compute m488=concat("vG3m06=",string(vG3m06,f2)).
compute p488="vG3m06為不合理值或遺漏值".
compute s488=1.
end if.
Exec.

*vG3m07=0,1 .
do if not range(vG3m07,0,1) | sys(vG3m07).
compute m489=concat("vG3m07=",string(vG3m07,f2)).
compute p489="vG3m07為不合理值或遺漏值".
compute s489=1.
end if.
Exec.

*vG3m08=0,1 .
do if not range(vG3m08,0,1) | sys(vG3m08).
compute m490=concat("vG3m08=",string(vG3m08,f2)).
compute p490="vG3m08為不合理值或遺漏值".
compute s490=1.
end if.
Exec.

*vG3m09=0,1 .
do if not range(vG3m09,0,1) | sys(vG3m09).
compute m491=concat("vG3m09=",string(vG3m09,f2)).
compute p491="vG3m09為不合理值或遺漏值".
compute s491=1.
end if.
Exec.

*vG3m10=0,1 96 .
do if not range(vG3m10,0,1,96,96) | sys(vG3m10).
compute m492=concat("vG3m10=",string(vG3m10,f2)).
compute p492="vG3m10為不合理值或遺漏值".
compute s492=1.
end if.
Exec.

*vG3m11=0,1 96 .
do if not range(vG3m11,0,1,96,96) | sys(vG3m11).
compute m493=concat("vG3m11=",string(vG3m11,f2)).
compute p493="vG3m11為不合理值或遺漏值".
compute s493=1.
end if.
Exec.

*vG3m12=0,1 96 .
do if not range(vG3m12,0,1,96,96) | sys(vG3m12).
compute m494=concat("vG3m12=",string(vG3m12,f2)).
compute p494="vG3m12為不合理值或遺漏值".
compute s494=1.
end if.
Exec.

*vG3m13=0,1 96 .
do if not range(vG3m13,0,1,96,96) | sys(vG3m13).
compute m495=concat("vG3m13=",string(vG3m13,f2)).
compute p495="vG3m13為不合理值或遺漏值".
compute s495=1.
end if.
Exec.

*vG3m14=0,1 96 .
do if not range(vG3m14,0,1,96,96) | sys(vG3m14).
compute m496=concat("vG3m14=",string(vG3m14,f2)).
compute p496="vG3m14為不合理值或遺漏值".
compute s496=1.
end if.
Exec.

*vG3m15=0,1 96 .
do if not range(vG3m15,0,1,96,96) | sys(vG3m15).
compute m497=concat("vG3m15=",string(vG3m15,f2)).
compute p497="vG3m15為不合理值或遺漏值".
compute s497=1.
end if.
Exec.

*vG3m16=0,1 96 .
do if not range(vG3m16,0,1,96,96) | sys(vG3m16).
compute m498=concat("vG3m16=",string(vG3m16,f2)).
compute p498="vG3m16為不合理值或遺漏值".
compute s498=1.
end if.
Exec.

*vG3m18=0,1 96 .
do if not range(vG3m18,0,1,96,96) | sys(vG3m18).
compute m499=concat("vG3m18=",string(vG3m18,f2)).
compute p499="vG3m18為不合理值或遺漏值".
compute s499=1.
end if.
Exec.

*vG3m19=0,1 96 .
do if not range(vG3m19,0,1,96,96) | sys(vG3m19).
compute m500=concat("vG3m19=",string(vG3m19,f2)).
compute p500="vG3m19為不合理值或遺漏值".
compute s500=1.
end if.
Exec.

*vG3m20=0,1 96 .
do if not range(vG3m20,0,1,96,96) | sys(vG3m20).
compute m501=concat("vG3m20=",string(vG3m20,f2)).
compute p501="vG3m20為不合理值或遺漏值".
compute s501=1.
end if.
Exec.

*vG3m21=0,1 96 .
do if not range(vG3m21,0,1,96,96) | sys(vG3m21).
compute m502=concat("vG3m21=",string(vG3m21,f2)).
compute p502="vG3m21為不合理值或遺漏值".
compute s502=1.
end if.
Exec.

*vG3m22=0,1 96 .
do if not range(vG3m22,0,1,96,96) | sys(vG3m22).
compute m503=concat("vG3m22=",string(vG3m22,f2)).
compute p503="vG3m22為不合理值或遺漏值".
compute s503=1.
end if.
Exec.

*vG3m23=0,1 96 .
do if not range(vG3m23,0,1,96,96) | sys(vG3m23).
compute m504=concat("vG3m23=",string(vG3m23,f2)).
compute p504="vG3m23為不合理值或遺漏值".
compute s504=1.
end if.
Exec.

*vG3m24=0,1 96 .
do if not range(vG3m24,0,1,96,96) | sys(vG3m24).
compute m505=concat("vG3m24=",string(vG3m24,f2)).
compute p505="vG3m24為不合理值或遺漏值".
compute s505=1.
end if.
Exec.

*vG3m25=0,1 96 .
do if not range(vG3m25,0,1,96,96) | sys(vG3m25).
compute m506=concat("vG3m25=",string(vG3m25,f2)).
compute p506="vG3m25為不合理值或遺漏值".
compute s506=1.
end if.
Exec.

*vG3m26=0,1 96 .
do if not range(vG3m26,0,1,96,96) | sys(vG3m26).
compute m507=concat("vG3m26=",string(vG3m26,f2)).
compute p507="vG3m26為不合理值或遺漏值".
compute s507=1.
end if.
Exec.

*vG3m27=0,1 96 .
do if not range(vG3m27,0,1,96,96) | sys(vG3m27).
compute m508=concat("vG3m27=",string(vG3m27,f2)).
compute p508="vG3m27為不合理值或遺漏值".
compute s508=1.
end if.
Exec.

*vG3m28=0,1 96 .
do if not range(vG3m28,0,1,96,96) | sys(vG3m28).
compute m509=concat("vG3m28=",string(vG3m28,f2)).
compute p509="vG3m28為不合理值或遺漏值".
compute s509=1.
end if.
Exec.

*vG3m29=0,1 96 .
do if not range(vG3m29,0,1,96,96) | sys(vG3m29).
compute m510=concat("vG3m29=",string(vG3m29,f2)).
compute p510="vG3m29為不合理值或遺漏值".
compute s510=1.
end if.
Exec.

*vG3m30=0,1 96 .
do if not range(vG3m30,0,1,96,96) | sys(vG3m30).
compute m511=concat("vG3m30=",string(vG3m30,f2)).
compute p511="vG3m30為不合理值或遺漏值".
compute s511=1.
end if.
Exec.

*vG3m31=0,1 96 .
do if not range(vG3m31,0,1,96,96) | sys(vG3m31).
compute m512=concat("vG3m31=",string(vG3m31,f2)).
compute p512="vG3m31為不合理值或遺漏值".
compute s512=1.
end if.
Exec.

*vG3m32=0,1 96 .
do if not range(vG3m32,0,1,96,96) | sys(vG3m32).
compute m513=concat("vG3m32=",string(vG3m32,f2)).
compute p513="vG3m32為不合理值或遺漏值".
compute s513=1.
end if.
Exec.

*vG3m33=0,1 96 .
do if not range(vG3m33,0,1,96,96) | sys(vG3m33).
compute m514=concat("vG3m33=",string(vG3m33,f2)).
compute p514="vG3m33為不合理值或遺漏值".
compute s514=1.
end if.
Exec.

*vG3m88=0,1 96 .
do if not range(vG3m88,0,1,96,96) | sys(vG3m88).
compute m515=concat("vG3m88=",string(vG3m88,f2)).
compute p515="vG3m88為不合理值或遺漏值".
compute s515=1.
end if.
Exec.

*vF0=1,89 90 97,98 .
do if not range(vF0,1,89,90,90,97,98) | sys(vF0).
compute m516=concat("vF0=",string(vF0,f2)).
compute p516="vF0為不合理值或遺漏值".
compute s516=1.
end if.
Exec.

*vF1=0.5,31 95 97,98 .
do if not range(vF1,0.5,31,95,95,97,98) | sys(vF1).
compute m517=concat("vF1=",string(vF1,f5)).
compute p517="vF1為不合理值或遺漏值".
compute s517=1.
end if.
Exec.

*vF2=1,2359 9797 9898 .
do if not range(vF2,1,2359,9797,9797,9898,9898) | sys(vF2).
compute m518=concat("vF2=",string(vF2,f5)).
compute p518="vF2為不合理值或遺漏值".
compute s518=1.
end if.
Exec.

*vF3=0.5,31 95 97,98 .
do if not range(vF3,0.5,31,95,95,97,98) | sys(vF3).
compute m519=concat("vF3=",string(vF3,f5)).
compute p519="vF3為不合理值或遺漏值".
compute s519=1.
end if.
Exec.

*vF4=1,2359 9797 9898 .
do if not range(vF4,1,2359,9797,9797,9898,9898) | sys(vF4).
compute m520=concat("vF4=",string(vF4,f5)).
compute p520="vF4為不合理值或遺漏值".
compute s520=1.
end if.
Exec.

*vF5m01=0,1 .
do if not range(vF5m01,0,1) | sys(vF5m01).
compute m521=concat("vF5m01=",string(vF5m01,f2)).
compute p521="vF5m01為不合理值或遺漏值".
compute s521=1.
end if.
Exec.

*vF5m02=0,1 .
do if not range(vF5m02,0,1) | sys(vF5m02).
compute m522=concat("vF5m02=",string(vF5m02,f2)).
compute p522="vF5m02為不合理值或遺漏值".
compute s522=1.
end if.
Exec.

*vF5m03=0,1 .
do if not range(vF5m03,0,1) | sys(vF5m03).
compute m523=concat("vF5m03=",string(vF5m03,f2)).
compute p523="vF5m03為不合理值或遺漏值".
compute s523=1.
end if.
Exec.

*vF5m04=0,1 .
do if not range(vF5m04,0,1) | sys(vF5m04).
compute m524=concat("vF5m04=",string(vF5m04,f2)).
compute p524="vF5m04為不合理值或遺漏值".
compute s524=1.
end if.
Exec.

*vF5m05=0,1 .
do if not range(vF5m05,0,1) | sys(vF5m05).
compute m525=concat("vF5m05=",string(vF5m05,f2)).
compute p525="vF5m05為不合理值或遺漏值".
compute s525=1.
end if.
Exec.

*vF5m06=0,1 .
do if not range(vF5m06,0,1) | sys(vF5m06).
compute m526=concat("vF5m06=",string(vF5m06,f2)).
compute p526="vF5m06為不合理值或遺漏值".
compute s526=1.
end if.
Exec.

*vF5m07=0,1 .
do if not range(vF5m07,0,1) | sys(vF5m07).
compute m527=concat("vF5m07=",string(vF5m07,f2)).
compute p527="vF5m07為不合理值或遺漏值".
compute s527=1.
end if.
Exec.

*vF5m08=0,1 .
do if not range(vF5m08,0,1) | sys(vF5m08).
compute m528=concat("vF5m08=",string(vF5m08,f2)).
compute p528="vF5m08為不合理值或遺漏值".
compute s528=1.
end if.
Exec.

*vF5m88=0,1 96 .
do if not range(vF5m88,0,1,96,96) | sys(vF5m88).
compute m529=concat("vF5m88=",string(vF5m88,f2)).
compute p529="vF5m88為不合理值或遺漏值".
compute s529=1.
end if.
Exec.

*vC1=0,7 95 97,98 .
do if not range(vC1,0,7,95,95,97,98) | sys(vC1).
compute m530=concat("vC1=",string(vC1,f4)).
compute p530="vC1為不合理值或遺漏值".
compute s530=1.
end if.
Exec.

*vC2=1,2359 9797 9898 .
do if not range(vC2,1,2359,9797,9797,9898,9898) | sys(vC2).
compute m531=concat("vC2=",string(vC2,f5)).
compute p531="vC2為不合理值或遺漏值".
compute s531=1.
end if.
Exec.

*vC3m01=0,1 .
do if not range(vC3m01,0,1) | sys(vC3m01).
compute m532=concat("vC3m01=",string(vC3m01,f2)).
compute p532="vC3m01為不合理值或遺漏值".
compute s532=1.
end if.
Exec.

*vC3m02=0,1 .
do if not range(vC3m02,0,1) | sys(vC3m02).
compute m533=concat("vC3m02=",string(vC3m02,f2)).
compute p533="vC3m02為不合理值或遺漏值".
compute s533=1.
end if.
Exec.

*vC3m03=0,1 .
do if not range(vC3m03,0,1) | sys(vC3m03).
compute m534=concat("vC3m03=",string(vC3m03,f2)).
compute p534="vC3m03為不合理值或遺漏值".
compute s534=1.
end if.
Exec.

*vC3m04=0,1 .
do if not range(vC3m04,0,1) | sys(vC3m04).
compute m535=concat("vC3m04=",string(vC3m04,f2)).
compute p535="vC3m04為不合理值或遺漏值".
compute s535=1.
end if.
Exec.

*vC3m05=0,1 .
do if not range(vC3m05,0,1) | sys(vC3m05).
compute m536=concat("vC3m05=",string(vC3m05,f2)).
compute p536="vC3m05為不合理值或遺漏值".
compute s536=1.
end if.
Exec.

*vC3m06=0,1 .
do if not range(vC3m06,0,1) | sys(vC3m06).
compute m537=concat("vC3m06=",string(vC3m06,f2)).
compute p537="vC3m06為不合理值或遺漏值".
compute s537=1.
end if.
Exec.

*vC3m07=0,1 .
do if not range(vC3m07,0,1) | sys(vC3m07).
compute m538=concat("vC3m07=",string(vC3m07,f2)).
compute p538="vC3m07為不合理值或遺漏值".
compute s538=1.
end if.
Exec.

*vC3m08=0,1 .
do if not range(vC3m08,0,1) | sys(vC3m08).
compute m539=concat("vC3m08=",string(vC3m08,f2)).
compute p539="vC3m08為不合理值或遺漏值".
compute s539=1.
end if.
Exec.

*vC3m09=0,1 .
do if not range(vC3m09,0,1) | sys(vC3m09).
compute m540=concat("vC3m09=",string(vC3m09,f2)).
compute p540="vC3m09為不合理值或遺漏值".
compute s540=1.
end if.
Exec.

*vC3m10=0,1 96 .
do if not range(vC3m10,0,1,96,96) | sys(vC3m10).
compute m541=concat("vC3m10=",string(vC3m10,f2)).
compute p541="vC3m10為不合理值或遺漏值".
compute s541=1.
end if.
Exec.

*vC3m11=0,1 96 .
do if not range(vC3m11,0,1,96,96) | sys(vC3m11).
compute m542=concat("vC3m11=",string(vC3m11,f2)).
compute p542="vC3m11為不合理值或遺漏值".
compute s542=1.
end if.
Exec.

*vC3m88=0,1 96 .
do if not range(vC3m88,0,1,96,96) | sys(vC3m88).
compute m543=concat("vC3m88=",string(vC3m88,f2)).
compute p543="vC3m88為不合理值或遺漏值".
compute s543=1.
end if.
Exec.

*vJ4_1=997,998 .
do if not range(vJ4_1,997,998) | sys(vJ4_1).
compute m544=concat("vJ4_1=",string(vJ4_1,f4)).
compute p544="vJ4_1為不合理值或遺漏值".
compute s544=1.
end if.
Exec.

*vJ4_2=1 997,998 .
do if not range(vJ4_2,1,1,997,998) | sys(vJ4_2).
compute m545=concat("vJ4_2=",string(vJ4_2,f4)).
compute p545="vJ4_2為不合理值或遺漏值".
compute s545=1.
end if.
Exec.

*vJ4_3=997,998 .
do if not range(vJ4_3,997,998) | sys(vJ4_3).
compute m546=concat("vJ4_3=",string(vJ4_3,f4)).
compute p546="vJ4_3為不合理值或遺漏值".
compute s546=1.
end if.
Exec.

*vJ4_4=1 997,998 .
do if not range(vJ4_4,1,1,997,998) | sys(vJ4_4).
compute m547=concat("vJ4_4=",string(vJ4_4,f4)).
compute p547="vJ4_4為不合理值或遺漏值".
compute s547=1.
end if.
Exec.

*vJ4_5=1 997,998 .
do if not range(vJ4_5,1,1,997,998) | sys(vJ4_5).
compute m548=concat("vJ4_5=",string(vJ4_5,f4)).
compute p548="vJ4_5為不合理值或遺漏值".
compute s548=1.
end if.
Exec.

*vJB1m01=0,1 .
do if not range(vJB1m01,0,1) | sys(vJB1m01).
compute m549=concat("vJB1m01=",string(vJB1m01,f2)).
compute p549="vJB1m01為不合理值或遺漏值".
compute s549=1.
end if.
Exec.

*vJB1m02=0,1 .
do if not range(vJB1m02,0,1) | sys(vJB1m02).
compute m550=concat("vJB1m02=",string(vJB1m02,f2)).
compute p550="vJB1m02為不合理值或遺漏值".
compute s550=1.
end if.
Exec.

*vJB1m03=0,1 .
do if not range(vJB1m03,0,1) | sys(vJB1m03).
compute m551=concat("vJB1m03=",string(vJB1m03,f2)).
compute p551="vJB1m03為不合理值或遺漏值".
compute s551=1.
end if.
Exec.

*vJB1m04=0,1 .
do if not range(vJB1m04,0,1) | sys(vJB1m04).
compute m552=concat("vJB1m04=",string(vJB1m04,f2)).
compute p552="vJB1m04為不合理值或遺漏值".
compute s552=1.
end if.
Exec.

*vJB1m05=0,1 .
do if not range(vJB1m05,0,1) | sys(vJB1m05).
compute m553=concat("vJB1m05=",string(vJB1m05,f2)).
compute p553="vJB1m05為不合理值或遺漏值".
compute s553=1.
end if.
Exec.

*vJB1m06=0,1 .
do if not range(vJB1m06,0,1) | sys(vJB1m06).
compute m554=concat("vJB1m06=",string(vJB1m06,f2)).
compute p554="vJB1m06為不合理值或遺漏值".
compute s554=1.
end if.
Exec.

*vJB1m07=0,1 .
do if not range(vJB1m07,0,1) | sys(vJB1m07).
compute m555=concat("vJB1m07=",string(vJB1m07,f2)).
compute p555="vJB1m07為不合理值或遺漏值".
compute s555=1.
end if.
Exec.

*vJB1m08=0,1 .
do if not range(vJB1m08,0,1) | sys(vJB1m08).
compute m556=concat("vJB1m08=",string(vJB1m08,f2)).
compute p556="vJB1m08為不合理值或遺漏值".
compute s556=1.
end if.
Exec.

*vJB1m09=0,1 .
do if not range(vJB1m09,0,1) | sys(vJB1m09).
compute m557=concat("vJB1m09=",string(vJB1m09,f2)).
compute p557="vJB1m09為不合理值或遺漏值".
compute s557=1.
end if.
Exec.

*vJB1m10=0,1 96 .
do if not range(vJB1m10,0,1,96,96) | sys(vJB1m10).
compute m558=concat("vJB1m10=",string(vJB1m10,f2)).
compute p558="vJB1m10為不合理值或遺漏值".
compute s558=1.
end if.
Exec.

*vJB1m11=0,1 96 .
do if not range(vJB1m11,0,1,96,96) | sys(vJB1m11).
compute m559=concat("vJB1m11=",string(vJB1m11,f2)).
compute p559="vJB1m11為不合理值或遺漏值".
compute s559=1.
end if.
Exec.

*vJB1m88=0,1 96 .
do if not range(vJB1m88,0,1,96,96) | sys(vJB1m88).
compute m560=concat("vJB1m88=",string(vJB1m88,f2)).
compute p560="vJB1m88為不合理值或遺漏值".
compute s560=1.
end if.
Exec.

*vJB1m90=0,1 96 .
do if not range(vJB1m90,0,1,96,96) | sys(vJB1m90).
compute m561=concat("vJB1m90=",string(vJB1m90,f2)).
compute p561="vJB1m90為不合理值或遺漏值".
compute s561=1.
end if.
Exec.

*vJB2m01=0,1 .
do if not range(vJB2m01,0,1) | sys(vJB2m01).
compute m562=concat("vJB2m01=",string(vJB2m01,f2)).
compute p562="vJB2m01為不合理值或遺漏值".
compute s562=1.
end if.
Exec.

*vJB2m02=0,1 .
do if not range(vJB2m02,0,1) | sys(vJB2m02).
compute m563=concat("vJB2m02=",string(vJB2m02,f2)).
compute p563="vJB2m02為不合理值或遺漏值".
compute s563=1.
end if.
Exec.

*vJB2m03=0,1 .
do if not range(vJB2m03,0,1) | sys(vJB2m03).
compute m564=concat("vJB2m03=",string(vJB2m03,f2)).
compute p564="vJB2m03為不合理值或遺漏值".
compute s564=1.
end if.
Exec.

*vJB2m04=0,1 .
do if not range(vJB2m04,0,1) | sys(vJB2m04).
compute m565=concat("vJB2m04=",string(vJB2m04,f2)).
compute p565="vJB2m04為不合理值或遺漏值".
compute s565=1.
end if.
Exec.

*vJB2m05=0,1 .
do if not range(vJB2m05,0,1) | sys(vJB2m05).
compute m566=concat("vJB2m05=",string(vJB2m05,f2)).
compute p566="vJB2m05為不合理值或遺漏值".
compute s566=1.
end if.
Exec.

*vJB2m06=0,1 .
do if not range(vJB2m06,0,1) | sys(vJB2m06).
compute m567=concat("vJB2m06=",string(vJB2m06,f2)).
compute p567="vJB2m06為不合理值或遺漏值".
compute s567=1.
end if.
Exec.

*vJB2m07=0,1 .
do if not range(vJB2m07,0,1) | sys(vJB2m07).
compute m568=concat("vJB2m07=",string(vJB2m07,f2)).
compute p568="vJB2m07為不合理值或遺漏值".
compute s568=1.
end if.
Exec.

*vJB2m88=0,1 96 .
do if not range(vJB2m88,0,1,96,96) | sys(vJB2m88).
compute m569=concat("vJB2m88=",string(vJB2m88,f2)).
compute p569="vJB2m88為不合理值或遺漏值".
compute s569=1.
end if.
Exec.

*vJB2m90=0,1 96 .
do if not range(vJB2m90,0,1,96,96) | sys(vJB2m90).
compute m570=concat("vJB2m90=",string(vJB2m90,f2)).
compute p570="vJB2m90為不合理值或遺漏值".
compute s570=1.
end if.
Exec.

*vH1=0,990 991 997,998 .
do if not range(vH1,0,990,991,991,997,998) | sys(vH1).
compute m571=concat("vH1=",string(vH1,f4)).
compute p571="vH1為不合理值或遺漏值".
compute s571=1.
end if.
Exec.

*vH2=1,5 97 997,998 .
do if not range(vH2,1,5,97,97,997,998) | sys(vH2).
compute m572=concat("vH2=",string(vH2,f2)).
compute p572="vH2為不合理值或遺漏值".
compute s572=1.
end if.
Exec.

*vH3=1,5 97,98 .
do if not range(vH3,1,5,97,98) | sys(vH3).
compute m573=concat("vH3=",string(vH3,f2)).
compute p573="vH3為不合理值或遺漏值".
compute s573=1.
end if.
Exec.

*vH4=0,990 991 997,998 .
do if not range(vH4,0,990,991,991,997,998) | sys(vH4).
compute m574=concat("vH4=",string(vH4,f4)).
compute p574="vH4為不合理值或遺漏值".
compute s574=1.
end if.
Exec.

*vH5=1,5 97 997,998 .
do if not range(vH5,1,5,97,97,997,998) | sys(vH5).
compute m575=concat("vH5=",string(vH5,f2)).
compute p575="vH5為不合理值或遺漏值".
compute s575=1.
end if.
Exec.

*vH6=1,5 97,98 .
do if not range(vH6,1,5,97,98) | sys(vH6).
compute m576=concat("vH6=",string(vH6,f2)).
compute p576="vH6為不合理值或遺漏值".
compute s576=1.
end if.
Exec.

*vH7=0,990 991 997,998 .
do if not range(vH7,0,990,991,991,997,998) | sys(vH7).
compute m577=concat("vH7=",string(vH7,f4)).
compute p577="vH7為不合理值或遺漏值".
compute s577=1.
end if.
Exec.

*vH7_1=0,990 991 997,998 .
do if not range(vH7_1,0,990,991,991,997,998) | sys(vH7_1).
compute m578=concat("vH7_1=",string(vH7_1,f4)).
compute p578="vH7_1為不合理值或遺漏值".
compute s578=1.
end if.
Exec.

*vH7_2=0,990 991 997,998 .
do if not range(vH7_2,0,990,991,991,997,998) | sys(vH7_2).
compute m579=concat("vH7_2=",string(vH7_2,f4)).
compute p579="vH7_2為不合理值或遺漏值".
compute s579=1.
end if.
Exec.

*vH7_3=0,990 991 997,998 .
do if not range(vH7_3,0,990,991,991,997,998) | sys(vH7_3).
compute m580=concat("vH7_3=",string(vH7_3,f4)).
compute p580="vH7_3為不合理值或遺漏值".
compute s580=1.
end if.
Exec.

*vCKH7=20260615000000,20260915000000 .
do if not range(vCKH7,20260615000000,20260915000000) | sys(vCKH7).
compute m581=concat("vCKH7=",string(vCKH7,f14)).
compute p581="vCKH7為不合理值或遺漏值".
compute s581=1.
end if.
Exec.

*vCKH7_1=20260615000000,20260915000000 .
do if not range(vCKH7_1,20260615000000,20260915000000) | sys(vCKH7_1).
compute m582=concat("vCKH7_1=",string(vCKH7_1,f14)).
compute p582="vCKH7_1為不合理值或遺漏值".
compute s582=1.
end if.
Exec.

*vCKH7_2=20260615000000,20260915000000 .
do if not range(vCKH7_2,20260615000000,20260915000000) | sys(vCKH7_2).
compute m583=concat("vCKH7_2=",string(vCKH7_2,f14)).
compute p583="vCKH7_2為不合理值或遺漏值".
compute s583=1.
end if.
Exec.

*vCKH7_3=20260615000000,20260915000000 .
do if not range(vCKH7_3,20260615000000,20260915000000) | sys(vCKH7_3).
compute m584=concat("vCKH7_3=",string(vCKH7_3,f14)).
compute p584="vCKH7_3為不合理值或遺漏值".
compute s584=1.
end if.
Exec.

*vH8=0,500 991 997,998 .
do if not range(vH8,0,500,991,991,997,998) | sys(vH8).
compute m585=concat("vH8=",string(vH8,f4)).
compute p585="vH8為不合理值或遺漏值".
compute s585=1.
end if.
Exec.

*vM1g1=0,140 997,998 .
do if not range(vM1g1,0,140,997,998) | sys(vM1g1).
compute m586=concat("vM1g1=",string(vM1g1,f4)).
compute p586="vM1g1為不合理值或遺漏值".
compute s586=1.
end if.
Exec.

*vM1g2=0,59 97,98 .
do if not range(vM1g2,0,59,97,98) | sys(vM1g2).
compute m587=concat("vM1g2=",string(vM1g2,f3)).
compute p587="vM1g2為不合理值或遺漏值".
compute s587=1.
end if.
Exec.

*vM2m01=0,1 .
do if not range(vM2m01,0,1) | sys(vM2m01).
compute m588=concat("vM2m01=",string(vM2m01,f2)).
compute p588="vM2m01為不合理值或遺漏值".
compute s588=1.
end if.
Exec.

*vM2m02=0,1 .
do if not range(vM2m02,0,1) | sys(vM2m02).
compute m589=concat("vM2m02=",string(vM2m02,f2)).
compute p589="vM2m02為不合理值或遺漏值".
compute s589=1.
end if.
Exec.

*vM2m03=0,1 .
do if not range(vM2m03,0,1) | sys(vM2m03).
compute m590=concat("vM2m03=",string(vM2m03,f2)).
compute p590="vM2m03為不合理值或遺漏值".
compute s590=1.
end if.
Exec.

*vM2m04=0,1 .
do if not range(vM2m04,0,1) | sys(vM2m04).
compute m591=concat("vM2m04=",string(vM2m04,f2)).
compute p591="vM2m04為不合理值或遺漏值".
compute s591=1.
end if.
Exec.

*vM2m05=0,1 .
do if not range(vM2m05,0,1) | sys(vM2m05).
compute m592=concat("vM2m05=",string(vM2m05,f2)).
compute p592="vM2m05為不合理值或遺漏值".
compute s592=1.
end if.
Exec.

*vM2m06=0,1 .
do if not range(vM2m06,0,1) | sys(vM2m06).
compute m593=concat("vM2m06=",string(vM2m06,f2)).
compute p593="vM2m06為不合理值或遺漏值".
compute s593=1.
end if.
Exec.

*vM2m07=0,1 .
do if not range(vM2m07,0,1) | sys(vM2m07).
compute m594=concat("vM2m07=",string(vM2m07,f2)).
compute p594="vM2m07為不合理值或遺漏值".
compute s594=1.
end if.
Exec.

*vM2m08=0,1 .
do if not range(vM2m08,0,1) | sys(vM2m08).
compute m595=concat("vM2m08=",string(vM2m08,f2)).
compute p595="vM2m08為不合理值或遺漏值".
compute s595=1.
end if.
Exec.

*vM2m09=0,1 .
do if not range(vM2m09,0,1) | sys(vM2m09).
compute m596=concat("vM2m09=",string(vM2m09,f2)).
compute p596="vM2m09為不合理值或遺漏值".
compute s596=1.
end if.
Exec.

*vM2m10=0,1 96 .
do if not range(vM2m10,0,1,96,96) | sys(vM2m10).
compute m597=concat("vM2m10=",string(vM2m10,f2)).
compute p597="vM2m10為不合理值或遺漏值".
compute s597=1.
end if.
Exec.

*vM2m11=0,1 96 .
do if not range(vM2m11,0,1,96,96) | sys(vM2m11).
compute m598=concat("vM2m11=",string(vM2m11,f2)).
compute p598="vM2m11為不合理值或遺漏值".
compute s598=1.
end if.
Exec.

*vM2m12=0,1 96 .
do if not range(vM2m12,0,1,96,96) | sys(vM2m12).
compute m599=concat("vM2m12=",string(vM2m12,f2)).
compute p599="vM2m12為不合理值或遺漏值".
compute s599=1.
end if.
Exec.

*vM2m13=0,1 96 .
do if not range(vM2m13,0,1,96,96) | sys(vM2m13).
compute m600=concat("vM2m13=",string(vM2m13,f2)).
compute p600="vM2m13為不合理值或遺漏值".
compute s600=1.
end if.
Exec.

*vM2m14=0,1 96 .
do if not range(vM2m14,0,1,96,96) | sys(vM2m14).
compute m601=concat("vM2m14=",string(vM2m14,f2)).
compute p601="vM2m14為不合理值或遺漏值".
compute s601=1.
end if.
Exec.

*vM2m15=0,1 96 .
do if not range(vM2m15,0,1,96,96) | sys(vM2m15).
compute m602=concat("vM2m15=",string(vM2m15,f2)).
compute p602="vM2m15為不合理值或遺漏值".
compute s602=1.
end if.
Exec.

*vM2m16=0,1 96 .
do if not range(vM2m16,0,1,96,96) | sys(vM2m16).
compute m603=concat("vM2m16=",string(vM2m16,f2)).
compute p603="vM2m16為不合理值或遺漏值".
compute s603=1.
end if.
Exec.

*vM2m88=0,1 96 .
do if not range(vM2m88,0,1,96,96) | sys(vM2m88).
compute m604=concat("vM2m88=",string(vM2m88,f2)).
compute p604="vM2m88為不合理值或遺漏值".
compute s604=1.
end if.
Exec.

*vM3m01=0,1 .
do if not range(vM3m01,0,1) | sys(vM3m01).
compute m605=concat("vM3m01=",string(vM3m01,f2)).
compute p605="vM3m01為不合理值或遺漏值".
compute s605=1.
end if.
Exec.

*vM3m02=0,1 .
do if not range(vM3m02,0,1) | sys(vM3m02).
compute m606=concat("vM3m02=",string(vM3m02,f2)).
compute p606="vM3m02為不合理值或遺漏值".
compute s606=1.
end if.
Exec.

*vM3m03=0,1 .
do if not range(vM3m03,0,1) | sys(vM3m03).
compute m607=concat("vM3m03=",string(vM3m03,f2)).
compute p607="vM3m03為不合理值或遺漏值".
compute s607=1.
end if.
Exec.

*vM3m04=0,1 .
do if not range(vM3m04,0,1) | sys(vM3m04).
compute m608=concat("vM3m04=",string(vM3m04,f2)).
compute p608="vM3m04為不合理值或遺漏值".
compute s608=1.
end if.
Exec.

*vM3m05=0,1 .
do if not range(vM3m05,0,1) | sys(vM3m05).
compute m609=concat("vM3m05=",string(vM3m05,f2)).
compute p609="vM3m05為不合理值或遺漏值".
compute s609=1.
end if.
Exec.

*vM3m06=0,1 .
do if not range(vM3m06,0,1) | sys(vM3m06).
compute m610=concat("vM3m06=",string(vM3m06,f2)).
compute p610="vM3m06為不合理值或遺漏值".
compute s610=1.
end if.
Exec.

*vM3m07=0,1 .
do if not range(vM3m07,0,1) | sys(vM3m07).
compute m611=concat("vM3m07=",string(vM3m07,f2)).
compute p611="vM3m07為不合理值或遺漏值".
compute s611=1.
end if.
Exec.

*vM3m08=0,1 .
do if not range(vM3m08,0,1) | sys(vM3m08).
compute m612=concat("vM3m08=",string(vM3m08,f2)).
compute p612="vM3m08為不合理值或遺漏值".
compute s612=1.
end if.
Exec.

*vM3m09=0,1 .
do if not range(vM3m09,0,1) | sys(vM3m09).
compute m613=concat("vM3m09=",string(vM3m09,f2)).
compute p613="vM3m09為不合理值或遺漏值".
compute s613=1.
end if.
Exec.

*vM3m10=0,1 96 .
do if not range(vM3m10,0,1,96,96) | sys(vM3m10).
compute m614=concat("vM3m10=",string(vM3m10,f2)).
compute p614="vM3m10為不合理值或遺漏值".
compute s614=1.
end if.
Exec.

*vM3m11=0,1 96 .
do if not range(vM3m11,0,1,96,96) | sys(vM3m11).
compute m615=concat("vM3m11=",string(vM3m11,f2)).
compute p615="vM3m11為不合理值或遺漏值".
compute s615=1.
end if.
Exec.

*vM3m12=0,1 96 .
do if not range(vM3m12,0,1,96,96) | sys(vM3m12).
compute m616=concat("vM3m12=",string(vM3m12,f2)).
compute p616="vM3m12為不合理值或遺漏值".
compute s616=1.
end if.
Exec.

*vM3m13=0,1 96 .
do if not range(vM3m13,0,1,96,96) | sys(vM3m13).
compute m617=concat("vM3m13=",string(vM3m13,f2)).
compute p617="vM3m13為不合理值或遺漏值".
compute s617=1.
end if.
Exec.

*vM3m88=0,1 96 .
do if not range(vM3m88,0,1,96,96) | sys(vM3m88).
compute m618=concat("vM3m88=",string(vM3m88,f2)).
compute p618="vM3m88為不合理值或遺漏值".
compute s618=1.
end if.
Exec.

*vM4sM4=0,1 96 .
do if not range(vM4sM4,0,1,96,96) | sys(vM4sM4).
compute m619=concat("vM4sM4=",string(vM4sM4,f2)).
compute p619="vM4sM4為不合理值或遺漏值".
compute s619=1.
end if.
Exec.

*vM4sM5=0,1 96 .
do if not range(vM4sM5,0,1,96,96) | sys(vM4sM5).
compute m620=concat("vM4sM5=",string(vM4sM5,f2)).
compute p620="vM4sM5為不合理值或遺漏值".
compute s620=1.
end if.
Exec.

*vM4sM6=0,1 96 .
do if not range(vM4sM6,0,1,96,96) | sys(vM4sM6).
compute m621=concat("vM4sM6=",string(vM4sM6,f2)).
compute p621="vM4sM6為不合理值或遺漏值".
compute s621=1.
end if.
Exec.

*vN1sN1=1,4 97,98 .
do if not range(vN1sN1,1,4,97,98) | sys(vN1sN1).
compute m622=concat("vN1sN1=",string(vN1sN1,f2)).
compute p622="vN1sN1為不合理值或遺漏值".
compute s622=1.
end if.
Exec.

*vN1sN2=1,4 97,98 .
do if not range(vN1sN2,1,4,97,98) | sys(vN1sN2).
compute m623=concat("vN1sN2=",string(vN1sN2,f2)).
compute p623="vN1sN2為不合理值或遺漏值".
compute s623=1.
end if.
Exec.

*vN1sN3=1,4 97,98 .
do if not range(vN1sN3,1,4,97,98) | sys(vN1sN3).
compute m624=concat("vN1sN3=",string(vN1sN3,f2)).
compute p624="vN1sN3為不合理值或遺漏值".
compute s624=1.
end if.
Exec.

*vN1sN4=1,4 97,98 .
do if not range(vN1sN4,1,4,97,98) | sys(vN1sN4).
compute m625=concat("vN1sN4=",string(vN1sN4,f2)).
compute p625="vN1sN4為不合理值或遺漏值".
compute s625=1.
end if.
Exec.

*vN1sN5=1,4 97,98 .
do if not range(vN1sN5,1,4,97,98) | sys(vN1sN5).
compute m626=concat("vN1sN5=",string(vN1sN5,f2)).
compute p626="vN1sN5為不合理值或遺漏值".
compute s626=1.
end if.
Exec.

*vN6sN6=1,4 97,98 .
do if not range(vN6sN6,1,4,97,98) | sys(vN6sN6).
compute m627=concat("vN6sN6=",string(vN6sN6,f2)).
compute p627="vN6sN6為不合理值或遺漏值".
compute s627=1.
end if.
Exec.

*vN6sN7=1,4 97,98 .
do if not range(vN6sN7,1,4,97,98) | sys(vN6sN7).
compute m628=concat("vN6sN7=",string(vN6sN7,f2)).
compute p628="vN6sN7為不合理值或遺漏值".
compute s628=1.
end if.
Exec.

*vN6sN8=1,4 97,98 .
do if not range(vN6sN8,1,4,97,98) | sys(vN6sN8).
compute m629=concat("vN6sN8=",string(vN6sN8,f2)).
compute p629="vN6sN8為不合理值或遺漏值".
compute s629=1.
end if.
Exec.

*vN6sN9=1,4 97,98 .
do if not range(vN6sN9,1,4,97,98) | sys(vN6sN9).
compute m630=concat("vN6sN9=",string(vN6sN9,f2)).
compute p630="vN6sN9為不合理值或遺漏值".
compute s630=1.
end if.
Exec.

*vN6sN10=1,4 97,98 .
do if not range(vN6sN10,1,4,97,98) | sys(vN6sN10).
compute m631=concat("vN6sN10=",string(vN6sN10,f2)).
compute p631="vN6sN10為不合理值或遺漏值".
compute s631=1.
end if.
Exec.

*vN11sN11=1,5 97,98 .
do if not range(vN11sN11,1,5,97,98) | sys(vN11sN11).
compute m632=concat("vN11sN11=",string(vN11sN11,f2)).
compute p632="vN11sN11為不合理值或遺漏值".
compute s632=1.
end if.
Exec.

*vN11sN12=1,5 97,98 .
do if not range(vN11sN12,1,5,97,98) | sys(vN11sN12).
compute m633=concat("vN11sN12=",string(vN11sN12,f2)).
compute p633="vN11sN12為不合理值或遺漏值".
compute s633=1.
end if.
Exec.

*vN11sN13=1,5 97,98 .
do if not range(vN11sN13,1,5,97,98) | sys(vN11sN13).
compute m634=concat("vN11sN13=",string(vN11sN13,f2)).
compute p634="vN11sN13為不合理值或遺漏值".
compute s634=1.
end if.
Exec.

*vN11sN14=1,5 97,98 .
do if not range(vN11sN14,1,5,97,98) | sys(vN11sN14).
compute m635=concat("vN11sN14=",string(vN11sN14,f2)).
compute p635="vN11sN14為不合理值或遺漏值".
compute s635=1.
end if.
Exec.

*vN11sN15=1,5 97,98 .
do if not range(vN11sN15,1,5,97,98) | sys(vN11sN15).
compute m636=concat("vN11sN15=",string(vN11sN15,f2)).
compute p636="vN11sN15為不合理值或遺漏值".
compute s636=1.
end if.
Exec.

*vN11sN16=1,5 97,98 .
do if not range(vN11sN16,1,5,97,98) | sys(vN11sN16).
compute m637=concat("vN11sN16=",string(vN11sN16,f2)).
compute p637="vN11sN16為不合理值或遺漏值".
compute s637=1.
end if.
Exec.

*vN17=1,5 90 97,98 .
do if not range(vN17,1,5,90,90,97,98) | sys(vN17).
compute m638=concat("vN17=",string(vN17,f2)).
compute p638="vN17為不合理值或遺漏值".
compute s638=1.
end if.
Exec.

*vN18sN18=1,5 97,98 .
do if not range(vN18sN18,1,5,97,98) | sys(vN18sN18).
compute m639=concat("vN18sN18=",string(vN18sN18,f2)).
compute p639="vN18sN18為不合理值或遺漏值".
compute s639=1.
end if.
Exec.

*vN18sN19=1,5 97,98 .
do if not range(vN18sN19,1,5,97,98) | sys(vN18sN19).
compute m640=concat("vN18sN19=",string(vN18sN19,f2)).
compute p640="vN18sN19為不合理值或遺漏值".
compute s640=1.
end if.
Exec.

*vN18sN20=1,5 97,98 .
do if not range(vN18sN20,1,5,97,98) | sys(vN18sN20).
compute m641=concat("vN18sN20=",string(vN18sN20,f2)).
compute p641="vN18sN20為不合理值或遺漏值".
compute s641=1.
end if.
Exec.

*vN21sN21=1,5 97,98 .
do if not range(vN21sN21,1,5,97,98) | sys(vN21sN21).
compute m642=concat("vN21sN21=",string(vN21sN21,f2)).
compute p642="vN21sN21為不合理值或遺漏值".
compute s642=1.
end if.
Exec.

*vN21sN22=1,5 97,98 .
do if not range(vN21sN22,1,5,97,98) | sys(vN21sN22).
compute m643=concat("vN21sN22=",string(vN21sN22,f2)).
compute p643="vN21sN22為不合理值或遺漏值".
compute s643=1.
end if.
Exec.

*vN23=1,5 97,98 .
do if not range(vN23,1,5,97,98) | sys(vN23).
compute m644=concat("vN23=",string(vN23,f2)).
compute p644="vN23為不合理值或遺漏值".
compute s644=1.
end if.
Exec.

*vN24=1,88 97,98 .
do if not range(vN24,1,88,97,98) | sys(vN24).
compute m645=concat("vN24=",string(vN24,f2)).
compute p645="vN24為不合理值或遺漏值".
compute s645=1.
end if.
Exec.

*vN25=1,5 90 97,98 .
do if not range(vN25,1,5,90,90,97,98) | sys(vN25).
compute m646=concat("vN25=",string(vN25,f2)).
compute p646="vN25為不合理值或遺漏值".
compute s646=1.
end if.
Exec.

*vN26=1,5 97,98 .
do if not range(vN26,1,5,97,98) | sys(vN26).
compute m647=concat("vN26=",string(vN26,f2)).
compute p647="vN26為不合理值或遺漏值".
compute s647=1.
end if.
Exec.

*vN27=1,5 97,98 .
do if not range(vN27,1,5,97,98) | sys(vN27).
compute m648=concat("vN27=",string(vN27,f2)).
compute p648="vN27為不合理值或遺漏值".
compute s648=1.
end if.
Exec.

*vN28=1,5 97,98 .
do if not range(vN28,1,5,97,98) | sys(vN28).
compute m649=concat("vN28=",string(vN28,f2)).
compute p649="vN28為不合理值或遺漏值".
compute s649=1.
end if.
Exec.

*vN29=1,5 97,98 .
do if not range(vN29,1,5,97,98) | sys(vN29).
compute m650=concat("vN29=",string(vN29,f2)).
compute p650="vN29為不合理值或遺漏值".
compute s650=1.
end if.
Exec.

*vN30=90 97,98 .
do if not range(vN30,90,90,97,98) | sys(vN30).
compute m651=concat("vN30=",string(vN30,f3)).
compute p651="vN30為不合理值或遺漏值".
compute s651=1.
end if.
Exec.

*vN31=97,98 .
do if not range(vN31,97,98) | sys(vN31).
compute m652=concat("vN31=",string(vN31,f3)).
compute p652="vN31為不合理值或遺漏值".
compute s652=1.
end if.
Exec.

*vN32=97,98 .
do if not range(vN32,97,98) | sys(vN32).
compute m653=concat("vN32=",string(vN32,f3)).
compute p653="vN32為不合理值或遺漏值".
compute s653=1.
end if.
Exec.

*vO5=1,23 97 98 .
do if not range(vO5,1,23,97,97,98,98) | sys(vO5).
compute m654=concat("vO5=",string(vO5,f2)).
compute p654="vO5為不合理值或遺漏值".
compute s654=1.
end if.
Exec.

*vN33sN33=1,4 97,98 .
do if not range(vN33sN33,1,4,97,98) | sys(vN33sN33).
compute m655=concat("vN33sN33=",string(vN33sN33,f2)).
compute p655="vN33sN33為不合理值或遺漏值".
compute s655=1.
end if.
Exec.

*vN33sN34=1,4 97,98 .
do if not range(vN33sN34,1,4,97,98) | sys(vN33sN34).
compute m656=concat("vN33sN34=",string(vN33sN34,f2)).
compute p656="vN33sN34為不合理值或遺漏值".
compute s656=1.
end if.
Exec.

*vN35sN35=0,7 97,98 .
do if not range(vN35sN35,0,7,97,98) | sys(vN35sN35).
compute m657=concat("vN35sN35=",string(vN35sN35,f2)).
compute p657="vN35sN35為不合理值或遺漏值".
compute s657=1.
end if.
Exec.

*vN35sN36=0,7 97,98 .
do if not range(vN35sN36,0,7,97,98) | sys(vN35sN36).
compute m658=concat("vN35sN36=",string(vN35sN36,f2)).
compute p658="vN35sN36為不合理值或遺漏值".
compute s658=1.
end if.
Exec.

*vN35sN37=0,7 97,98 .
do if not range(vN35sN37,0,7,97,98) | sys(vN35sN37).
compute m659=concat("vN35sN37=",string(vN35sN37,f2)).
compute p659="vN35sN37為不合理值或遺漏值".
compute s659=1.
end if.
Exec.

*vN35sN38=0,7 97,98 .
do if not range(vN35sN38,0,7,97,98) | sys(vN35sN38).
compute m660=concat("vN35sN38=",string(vN35sN38,f2)).
compute p660="vN35sN38為不合理值或遺漏值".
compute s660=1.
end if.
Exec.

*vQa=20260615000000,20260915000000 .
do if not range(vQa,20260615000000,20260915000000) | sys(vQa).
compute m661=concat("vQa=",string(vQa,f14)).
compute p661="vQa為不合理值或遺漏值".
compute s661=1.
end if.
Exec.

*vQ1=1,4 97,98 .
do if not range(vQ1,1,4,97,98) | sys(vQ1).
compute m662=concat("vQ1=",string(vQ1,f2)).
compute p662="vQ1為不合理值或遺漏值".
compute s662=1.
end if.
Exec.

*vQ2=1,4 97,98 .
do if not range(vQ2,1,4,97,98) | sys(vQ2).
compute m663=concat("vQ2=",string(vQ2,f2)).
compute p663="vQ2為不合理值或遺漏值".
compute s663=1.
end if.
Exec.

*vQ3=1,8 97,98 .
do if not range(vQ3,1,8,97,98) | sys(vQ3).
compute m664=concat("vQ3=",string(vQ3,f2)).
compute p664="vQ3為不合理值或遺漏值".
compute s664=1.
end if.
Exec.

*vQ4=1,8 97,98 .
do if not range(vQ4,1,8,97,98) | sys(vQ4).
compute m665=concat("vQ4=",string(vQ4,f2)).
compute p665="vQ4為不合理值或遺漏值".
compute s665=1.
end if.
Exec.

*vQ5=1,2 97,98 .
do if not range(vQ5,1,2,97,98) | sys(vQ5).
compute m666=concat("vQ5=",string(vQ5,f2)).
compute p666="vQ5為不合理值或遺漏值".
compute s666=1.
end if.
Exec.

*vQ6=1,4 90 97,98 .
do if not range(vQ6,1,4,90,90,97,98) | sys(vQ6).
compute m667=concat("vQ6=",string(vQ6,f2)).
compute p667="vQ6為不合理值或遺漏值".
compute s667=1.
end if.
Exec.

*vQ7=1,4 90 97,98 .
do if not range(vQ7,1,4,90,90,97,98) | sys(vQ7).
compute m668=concat("vQ7=",string(vQ7,f2)).
compute p668="vQ7為不合理值或遺漏值".
compute s668=1.
end if.
Exec.

*vQ8=1,4 90 97,98 .
do if not range(vQ8,1,4,90,90,97,98) | sys(vQ8).
compute m669=concat("vQ8=",string(vQ8,f2)).
compute p669="vQ8為不合理值或遺漏值".
compute s669=1.
end if.
Exec.

*vQ9=1,4 90 97,98 .
do if not range(vQ9,1,4,90,90,97,98) | sys(vQ9).
compute m670=concat("vQ9=",string(vQ9,f2)).
compute p670="vQ9為不合理值或遺漏值".
compute s670=1.
end if.
Exec.

*vQ10=1,2 97,98 .
do if not range(vQ10,1,2,97,98) | sys(vQ10).
compute m671=concat("vQ10=",string(vQ10,f2)).
compute p671="vQ10為不合理值或遺漏值".
compute s671=1.
end if.
Exec.

*vCKQ10=96 .
do if not range(vCKQ10,96,96) | sys(vCKQ10).
compute m672=concat("vCKQ10=",string(vCKQ10,f2)).
compute p672="vCKQ10為不合理值或遺漏值".
compute s672=1.
end if.
Exec.

*vQ11=1,4 90 97,98 .
do if not range(vQ11,1,4,90,90,97,98) | sys(vQ11).
compute m673=concat("vQ11=",string(vQ11,f2)).
compute p673="vQ11為不合理值或遺漏值".
compute s673=1.
end if.
Exec.

*vQ12=1,4 90 97,98 .
do if not range(vQ12,1,4,90,90,97,98) | sys(vQ12).
compute m674=concat("vQ12=",string(vQ12,f2)).
compute p674="vQ12為不合理值或遺漏值".
compute s674=1.
end if.
Exec.

*vQ13=1,4 90 97,98 .
do if not range(vQ13,1,4,90,90,97,98) | sys(vQ13).
compute m675=concat("vQ13=",string(vQ13,f2)).
compute p675="vQ13為不合理值或遺漏值".
compute s675=1.
end if.
Exec.

*vQ14=1,4 90 97,98 .
do if not range(vQ14,1,4,90,90,97,98) | sys(vQ14).
compute m676=concat("vQ14=",string(vQ14,f2)).
compute p676="vQ14為不合理值或遺漏值".
compute s676=1.
end if.
Exec.

*vQ15=1,2 97,98 .
do if not range(vQ15,1,2,97,98) | sys(vQ15).
compute m677=concat("vQ15=",string(vQ15,f2)).
compute p677="vQ15為不合理值或遺漏值".
compute s677=1.
end if.
Exec.

*vQ16=1,4 90 97,98 .
do if not range(vQ16,1,4,90,90,97,98) | sys(vQ16).
compute m678=concat("vQ16=",string(vQ16,f2)).
compute p678="vQ16為不合理值或遺漏值".
compute s678=1.
end if.
Exec.

*vQ17=1,4 90 97,98 .
do if not range(vQ17,1,4,90,90,97,98) | sys(vQ17).
compute m679=concat("vQ17=",string(vQ17,f2)).
compute p679="vQ17為不合理值或遺漏值".
compute s679=1.
end if.
Exec.

*vQ18=1,4 90 97,98 .
do if not range(vQ18,1,4,90,90,97,98) | sys(vQ18).
compute m680=concat("vQ18=",string(vQ18,f2)).
compute p680="vQ18為不合理值或遺漏值".
compute s680=1.
end if.
Exec.

*vQ19=1,4 90 97,98 .
do if not range(vQ19,1,4,90,90,97,98) | sys(vQ19).
compute m681=concat("vQ19=",string(vQ19,f2)).
compute p681="vQ19為不合理值或遺漏值".
compute s681=1.
end if.
Exec.

*vQ20m01=0,1 .
do if not range(vQ20m01,0,1) | sys(vQ20m01).
compute m682=concat("vQ20m01=",string(vQ20m01,f2)).
compute p682="vQ20m01為不合理值或遺漏值".
compute s682=1.
end if.
Exec.

*vQ20m02=0,1 .
do if not range(vQ20m02,0,1) | sys(vQ20m02).
compute m683=concat("vQ20m02=",string(vQ20m02,f2)).
compute p683="vQ20m02為不合理值或遺漏值".
compute s683=1.
end if.
Exec.

*vQ20m03=0,1 .
do if not range(vQ20m03,0,1) | sys(vQ20m03).
compute m684=concat("vQ20m03=",string(vQ20m03,f2)).
compute p684="vQ20m03為不合理值或遺漏值".
compute s684=1.
end if.
Exec.

*vQ20m04=0,1 .
do if not range(vQ20m04,0,1) | sys(vQ20m04).
compute m685=concat("vQ20m04=",string(vQ20m04,f2)).
compute p685="vQ20m04為不合理值或遺漏值".
compute s685=1.
end if.
Exec.

*vQ20m05=0,1 .
do if not range(vQ20m05,0,1) | sys(vQ20m05).
compute m686=concat("vQ20m05=",string(vQ20m05,f2)).
compute p686="vQ20m05為不合理值或遺漏值".
compute s686=1.
end if.
Exec.

*vQ20m06=0,1 .
do if not range(vQ20m06,0,1) | sys(vQ20m06).
compute m687=concat("vQ20m06=",string(vQ20m06,f2)).
compute p687="vQ20m06為不合理值或遺漏值".
compute s687=1.
end if.
Exec.

*vQ20m88=0,1 96 .
do if not range(vQ20m88,0,1,96,96) | sys(vQ20m88).
compute m688=concat("vQ20m88=",string(vQ20m88,f2)).
compute p688="vQ20m88為不合理值或遺漏值".
compute s688=1.
end if.
Exec.

*vQ20m90=0,1 96 .
do if not range(vQ20m90,0,1,96,96) | sys(vQ20m90).
compute m689=concat("vQ20m90=",string(vQ20m90,f2)).
compute p689="vQ20m90為不合理值或遺漏值".
compute s689=1.
end if.
Exec.

*vCKQ20A=96 .
do if not range(vCKQ20A,96,96) | sys(vCKQ20A).
compute m690=concat("vCKQ20A=",string(vCKQ20A,f2)).
compute p690="vCKQ20A為不合理值或遺漏值".
compute s690=1.
end if.
Exec.

*vCKQ20B=96 .
do if not range(vCKQ20B,96,96) | sys(vCKQ20B).
compute m691=concat("vCKQ20B=",string(vCKQ20B,f2)).
compute p691="vCKQ20B為不合理值或遺漏值".
compute s691=1.
end if.
Exec.

*vQ24g1=0,140 997,998 .
do if not range(vQ24g1,0,140,997,998) | sys(vQ24g1).
compute m692=concat("vQ24g1=",string(vQ24g1,f4)).
compute p692="vQ24g1為不合理值或遺漏值".
compute s692=1.
end if.
Exec.

*vQ24g2=0,59 97,98 .
do if not range(vQ24g2,0,59,97,98) | sys(vQ24g2).
compute m693=concat("vQ24g2=",string(vQ24g2,f3)).
compute p693="vQ24g2為不合理值或遺漏值".
compute s693=1.
end if.
Exec.

*vCKQ24=1 .
do if not range(vCKQ24,1,1) | sys(vCKQ24).
compute m694=concat("vCKQ24=",string(vCKQ24,f2)).
compute p694="vCKQ24為不合理值或遺漏值".
compute s694=1.
end if.
Exec.

*vQ25m01=0,1 .
do if not range(vQ25m01,0,1) | sys(vQ25m01).
compute m695=concat("vQ25m01=",string(vQ25m01,f2)).
compute p695="vQ25m01為不合理值或遺漏值".
compute s695=1.
end if.
Exec.

*vQ25m02=0,1 .
do if not range(vQ25m02,0,1) | sys(vQ25m02).
compute m696=concat("vQ25m02=",string(vQ25m02,f2)).
compute p696="vQ25m02為不合理值或遺漏值".
compute s696=1.
end if.
Exec.

*vQ25m03=0,1 .
do if not range(vQ25m03,0,1) | sys(vQ25m03).
compute m697=concat("vQ25m03=",string(vQ25m03,f2)).
compute p697="vQ25m03為不合理值或遺漏值".
compute s697=1.
end if.
Exec.

*vQ25m04=0,1 .
do if not range(vQ25m04,0,1) | sys(vQ25m04).
compute m698=concat("vQ25m04=",string(vQ25m04,f2)).
compute p698="vQ25m04為不合理值或遺漏值".
compute s698=1.
end if.
Exec.

*vQ25m05=0,1 .
do if not range(vQ25m05,0,1) | sys(vQ25m05).
compute m699=concat("vQ25m05=",string(vQ25m05,f2)).
compute p699="vQ25m05為不合理值或遺漏值".
compute s699=1.
end if.
Exec.

*vQ25m06=0,1 .
do if not range(vQ25m06,0,1) | sys(vQ25m06).
compute m700=concat("vQ25m06=",string(vQ25m06,f2)).
compute p700="vQ25m06為不合理值或遺漏值".
compute s700=1.
end if.
Exec.

*vQ25m07=0,1 .
do if not range(vQ25m07,0,1) | sys(vQ25m07).
compute m701=concat("vQ25m07=",string(vQ25m07,f2)).
compute p701="vQ25m07為不合理值或遺漏值".
compute s701=1.
end if.
Exec.

*vQ25m08=0,1 .
do if not range(vQ25m08,0,1) | sys(vQ25m08).
compute m702=concat("vQ25m08=",string(vQ25m08,f2)).
compute p702="vQ25m08為不合理值或遺漏值".
compute s702=1.
end if.
Exec.

*vQ25m09=0,1 .
do if not range(vQ25m09,0,1) | sys(vQ25m09).
compute m703=concat("vQ25m09=",string(vQ25m09,f2)).
compute p703="vQ25m09為不合理值或遺漏值".
compute s703=1.
end if.
Exec.

*vQ25m10=0,1 96 .
do if not range(vQ25m10,0,1,96,96) | sys(vQ25m10).
compute m704=concat("vQ25m10=",string(vQ25m10,f2)).
compute p704="vQ25m10為不合理值或遺漏值".
compute s704=1.
end if.
Exec.

*vQ25m11=0,1 96 .
do if not range(vQ25m11,0,1,96,96) | sys(vQ25m11).
compute m705=concat("vQ25m11=",string(vQ25m11,f2)).
compute p705="vQ25m11為不合理值或遺漏值".
compute s705=1.
end if.
Exec.

*vQ25m12=0,1 96 .
do if not range(vQ25m12,0,1,96,96) | sys(vQ25m12).
compute m706=concat("vQ25m12=",string(vQ25m12,f2)).
compute p706="vQ25m12為不合理值或遺漏值".
compute s706=1.
end if.
Exec.

*vQ25m13=0,1 96 .
do if not range(vQ25m13,0,1,96,96) | sys(vQ25m13).
compute m707=concat("vQ25m13=",string(vQ25m13,f2)).
compute p707="vQ25m13為不合理值或遺漏值".
compute s707=1.
end if.
Exec.

*vQ25m14=0,1 96 .
do if not range(vQ25m14,0,1,96,96) | sys(vQ25m14).
compute m708=concat("vQ25m14=",string(vQ25m14,f2)).
compute p708="vQ25m14為不合理值或遺漏值".
compute s708=1.
end if.
Exec.

*vQ25m15=0,1 96 .
do if not range(vQ25m15,0,1,96,96) | sys(vQ25m15).
compute m709=concat("vQ25m15=",string(vQ25m15,f2)).
compute p709="vQ25m15為不合理值或遺漏值".
compute s709=1.
end if.
Exec.

*vQ25m16=0,1 96 .
do if not range(vQ25m16,0,1,96,96) | sys(vQ25m16).
compute m710=concat("vQ25m16=",string(vQ25m16,f2)).
compute p710="vQ25m16為不合理值或遺漏值".
compute s710=1.
end if.
Exec.

*vQ25m17=0,1 96 .
do if not range(vQ25m17,0,1,96,96) | sys(vQ25m17).
compute m711=concat("vQ25m17=",string(vQ25m17,f2)).
compute p711="vQ25m17為不合理值或遺漏值".
compute s711=1.
end if.
Exec.

*vQ25m18=0,1 96 .
do if not range(vQ25m18,0,1,96,96) | sys(vQ25m18).
compute m712=concat("vQ25m18=",string(vQ25m18,f2)).
compute p712="vQ25m18為不合理值或遺漏值".
compute s712=1.
end if.
Exec.

*vQ25m19=0,1 96 .
do if not range(vQ25m19,0,1,96,96) | sys(vQ25m19).
compute m713=concat("vQ25m19=",string(vQ25m19,f2)).
compute p713="vQ25m19為不合理值或遺漏值".
compute s713=1.
end if.
Exec.

*vQ25m20=0,1 96 .
do if not range(vQ25m20,0,1,96,96) | sys(vQ25m20).
compute m714=concat("vQ25m20=",string(vQ25m20,f2)).
compute p714="vQ25m20為不合理值或遺漏值".
compute s714=1.
end if.
Exec.

*vQ25m21=0,1 96 .
do if not range(vQ25m21,0,1,96,96) | sys(vQ25m21).
compute m715=concat("vQ25m21=",string(vQ25m21,f2)).
compute p715="vQ25m21為不合理值或遺漏值".
compute s715=1.
end if.
Exec.

*vQ25m22=0,1 96 .
do if not range(vQ25m22,0,1,96,96) | sys(vQ25m22).
compute m716=concat("vQ25m22=",string(vQ25m22,f2)).
compute p716="vQ25m22為不合理值或遺漏值".
compute s716=1.
end if.
Exec.

*vQ25m23=0,1 96 .
do if not range(vQ25m23,0,1,96,96) | sys(vQ25m23).
compute m717=concat("vQ25m23=",string(vQ25m23,f2)).
compute p717="vQ25m23為不合理值或遺漏值".
compute s717=1.
end if.
Exec.

*vQ25m24=0,1 96 .
do if not range(vQ25m24,0,1,96,96) | sys(vQ25m24).
compute m718=concat("vQ25m24=",string(vQ25m24,f2)).
compute p718="vQ25m24為不合理值或遺漏值".
compute s718=1.
end if.
Exec.

*vQ25m25=0,1 96 .
do if not range(vQ25m25,0,1,96,96) | sys(vQ25m25).
compute m719=concat("vQ25m25=",string(vQ25m25,f2)).
compute p719="vQ25m25為不合理值或遺漏值".
compute s719=1.
end if.
Exec.

*vQ25m26=0,1 96 .
do if not range(vQ25m26,0,1,96,96) | sys(vQ25m26).
compute m720=concat("vQ25m26=",string(vQ25m26,f2)).
compute p720="vQ25m26為不合理值或遺漏值".
compute s720=1.
end if.
Exec.

*vQ25m27=0,1 96 .
do if not range(vQ25m27,0,1,96,96) | sys(vQ25m27).
compute m721=concat("vQ25m27=",string(vQ25m27,f2)).
compute p721="vQ25m27為不合理值或遺漏值".
compute s721=1.
end if.
Exec.

*vQ25m28=0,1 96 .
do if not range(vQ25m28,0,1,96,96) | sys(vQ25m28).
compute m722=concat("vQ25m28=",string(vQ25m28,f2)).
compute p722="vQ25m28為不合理值或遺漏值".
compute s722=1.
end if.
Exec.

*vQ25m29=0,1 96 .
do if not range(vQ25m29,0,1,96,96) | sys(vQ25m29).
compute m723=concat("vQ25m29=",string(vQ25m29,f2)).
compute p723="vQ25m29為不合理值或遺漏值".
compute s723=1.
end if.
Exec.

*vQ25m30=0,1 96 .
do if not range(vQ25m30,0,1,96,96) | sys(vQ25m30).
compute m724=concat("vQ25m30=",string(vQ25m30,f2)).
compute p724="vQ25m30為不合理值或遺漏值".
compute s724=1.
end if.
Exec.

*vQ25m31=0,1 96 .
do if not range(vQ25m31,0,1,96,96) | sys(vQ25m31).
compute m725=concat("vQ25m31=",string(vQ25m31,f2)).
compute p725="vQ25m31為不合理值或遺漏值".
compute s725=1.
end if.
Exec.

*vQ25m88=0,1 96 .
do if not range(vQ25m88,0,1,96,96) | sys(vQ25m88).
compute m726=concat("vQ25m88=",string(vQ25m88,f2)).
compute p726="vQ25m88為不合理值或遺漏值".
compute s726=1.
end if.
Exec.

*vQ21g1=0,140 997,998 .
do if not range(vQ21g1,0,140,997,998) | sys(vQ21g1).
compute m727=concat("vQ21g1=",string(vQ21g1,f4)).
compute p727="vQ21g1為不合理值或遺漏值".
compute s727=1.
end if.
Exec.

*vQ21g2=0,59 97,98 .
do if not range(vQ21g2,0,59,97,98) | sys(vQ21g2).
compute m728=concat("vQ21g2=",string(vQ21g2,f3)).
compute p728="vQ21g2為不合理值或遺漏值".
compute s728=1.
end if.
Exec.

*vCKQ21=1 .
do if not range(vCKQ21,1,1) | sys(vCKQ21).
compute m729=concat("vCKQ21=",string(vCKQ21,f2)).
compute p729="vCKQ21為不合理值或遺漏值".
compute s729=1.
end if.
Exec.

*vQ22m01=0,1 .
do if not range(vQ22m01,0,1) | sys(vQ22m01).
compute m730=concat("vQ22m01=",string(vQ22m01,f2)).
compute p730="vQ22m01為不合理值或遺漏值".
compute s730=1.
end if.
Exec.

*vQ22m02=0,1 .
do if not range(vQ22m02,0,1) | sys(vQ22m02).
compute m731=concat("vQ22m02=",string(vQ22m02,f2)).
compute p731="vQ22m02為不合理值或遺漏值".
compute s731=1.
end if.
Exec.

*vQ22m03=0,1 .
do if not range(vQ22m03,0,1) | sys(vQ22m03).
compute m732=concat("vQ22m03=",string(vQ22m03,f2)).
compute p732="vQ22m03為不合理值或遺漏值".
compute s732=1.
end if.
Exec.

*vQ22m04=0,1 .
do if not range(vQ22m04,0,1) | sys(vQ22m04).
compute m733=concat("vQ22m04=",string(vQ22m04,f2)).
compute p733="vQ22m04為不合理值或遺漏值".
compute s733=1.
end if.
Exec.

*vQ22m05=0,1 .
do if not range(vQ22m05,0,1) | sys(vQ22m05).
compute m734=concat("vQ22m05=",string(vQ22m05,f2)).
compute p734="vQ22m05為不合理值或遺漏值".
compute s734=1.
end if.
Exec.

*vQ22m06=0,1 .
do if not range(vQ22m06,0,1) | sys(vQ22m06).
compute m735=concat("vQ22m06=",string(vQ22m06,f2)).
compute p735="vQ22m06為不合理值或遺漏值".
compute s735=1.
end if.
Exec.

*vQ22m07=0,1 .
do if not range(vQ22m07,0,1) | sys(vQ22m07).
compute m736=concat("vQ22m07=",string(vQ22m07,f2)).
compute p736="vQ22m07為不合理值或遺漏值".
compute s736=1.
end if.
Exec.

*vQ22m08=0,1 .
do if not range(vQ22m08,0,1) | sys(vQ22m08).
compute m737=concat("vQ22m08=",string(vQ22m08,f2)).
compute p737="vQ22m08為不合理值或遺漏值".
compute s737=1.
end if.
Exec.

*vQ22m09=0,1 .
do if not range(vQ22m09,0,1) | sys(vQ22m09).
compute m738=concat("vQ22m09=",string(vQ22m09,f2)).
compute p738="vQ22m09為不合理值或遺漏值".
compute s738=1.
end if.
Exec.

*vQ22m10=0,1 96 .
do if not range(vQ22m10,0,1,96,96) | sys(vQ22m10).
compute m739=concat("vQ22m10=",string(vQ22m10,f2)).
compute p739="vQ22m10為不合理值或遺漏值".
compute s739=1.
end if.
Exec.

*vQ22m11=0,1 96 .
do if not range(vQ22m11,0,1,96,96) | sys(vQ22m11).
compute m740=concat("vQ22m11=",string(vQ22m11,f2)).
compute p740="vQ22m11為不合理值或遺漏值".
compute s740=1.
end if.
Exec.

*vQ22m12=0,1 96 .
do if not range(vQ22m12,0,1,96,96) | sys(vQ22m12).
compute m741=concat("vQ22m12=",string(vQ22m12,f2)).
compute p741="vQ22m12為不合理值或遺漏值".
compute s741=1.
end if.
Exec.

*vQ22m13=0,1 96 .
do if not range(vQ22m13,0,1,96,96) | sys(vQ22m13).
compute m742=concat("vQ22m13=",string(vQ22m13,f2)).
compute p742="vQ22m13為不合理值或遺漏值".
compute s742=1.
end if.
Exec.

*vQ22m14=0,1 96 .
do if not range(vQ22m14,0,1,96,96) | sys(vQ22m14).
compute m743=concat("vQ22m14=",string(vQ22m14,f2)).
compute p743="vQ22m14為不合理值或遺漏值".
compute s743=1.
end if.
Exec.

*vQ22m15=0,1 96 .
do if not range(vQ22m15,0,1,96,96) | sys(vQ22m15).
compute m744=concat("vQ22m15=",string(vQ22m15,f2)).
compute p744="vQ22m15為不合理值或遺漏值".
compute s744=1.
end if.
Exec.

*vQ22m16=0,1 96 .
do if not range(vQ22m16,0,1,96,96) | sys(vQ22m16).
compute m745=concat("vQ22m16=",string(vQ22m16,f2)).
compute p745="vQ22m16為不合理值或遺漏值".
compute s745=1.
end if.
Exec.

*vQ22m17=0,1 96 .
do if not range(vQ22m17,0,1,96,96) | sys(vQ22m17).
compute m746=concat("vQ22m17=",string(vQ22m17,f2)).
compute p746="vQ22m17為不合理值或遺漏值".
compute s746=1.
end if.
Exec.

*vQ22m18=0,1 96 .
do if not range(vQ22m18,0,1,96,96) | sys(vQ22m18).
compute m747=concat("vQ22m18=",string(vQ22m18,f2)).
compute p747="vQ22m18為不合理值或遺漏值".
compute s747=1.
end if.
Exec.

*vQ22m19=0,1 96 .
do if not range(vQ22m19,0,1,96,96) | sys(vQ22m19).
compute m748=concat("vQ22m19=",string(vQ22m19,f2)).
compute p748="vQ22m19為不合理值或遺漏值".
compute s748=1.
end if.
Exec.

*vQ22m20=0,1 96 .
do if not range(vQ22m20,0,1,96,96) | sys(vQ22m20).
compute m749=concat("vQ22m20=",string(vQ22m20,f2)).
compute p749="vQ22m20為不合理值或遺漏值".
compute s749=1.
end if.
Exec.

*vQ22m21=0,1 96 .
do if not range(vQ22m21,0,1,96,96) | sys(vQ22m21).
compute m750=concat("vQ22m21=",string(vQ22m21,f2)).
compute p750="vQ22m21為不合理值或遺漏值".
compute s750=1.
end if.
Exec.

*vQ22m22=0,1 96 .
do if not range(vQ22m22,0,1,96,96) | sys(vQ22m22).
compute m751=concat("vQ22m22=",string(vQ22m22,f2)).
compute p751="vQ22m22為不合理值或遺漏值".
compute s751=1.
end if.
Exec.

*vQ22m23=0,1 96 .
do if not range(vQ22m23,0,1,96,96) | sys(vQ22m23).
compute m752=concat("vQ22m23=",string(vQ22m23,f2)).
compute p752="vQ22m23為不合理值或遺漏值".
compute s752=1.
end if.
Exec.

*vQ22m24=0,1 96 .
do if not range(vQ22m24,0,1,96,96) | sys(vQ22m24).
compute m753=concat("vQ22m24=",string(vQ22m24,f2)).
compute p753="vQ22m24為不合理值或遺漏值".
compute s753=1.
end if.
Exec.

*vQ22m25=0,1 96 .
do if not range(vQ22m25,0,1,96,96) | sys(vQ22m25).
compute m754=concat("vQ22m25=",string(vQ22m25,f2)).
compute p754="vQ22m25為不合理值或遺漏值".
compute s754=1.
end if.
Exec.

*vQ22m26=0,1 96 .
do if not range(vQ22m26,0,1,96,96) | sys(vQ22m26).
compute m755=concat("vQ22m26=",string(vQ22m26,f2)).
compute p755="vQ22m26為不合理值或遺漏值".
compute s755=1.
end if.
Exec.

*vQ22m27=0,1 96 .
do if not range(vQ22m27,0,1,96,96) | sys(vQ22m27).
compute m756=concat("vQ22m27=",string(vQ22m27,f2)).
compute p756="vQ22m27為不合理值或遺漏值".
compute s756=1.
end if.
Exec.

*vQ22m28=0,1 96 .
do if not range(vQ22m28,0,1,96,96) | sys(vQ22m28).
compute m757=concat("vQ22m28=",string(vQ22m28,f2)).
compute p757="vQ22m28為不合理值或遺漏值".
compute s757=1.
end if.
Exec.

*vQ22m29=0,1 96 .
do if not range(vQ22m29,0,1,96,96) | sys(vQ22m29).
compute m758=concat("vQ22m29=",string(vQ22m29,f2)).
compute p758="vQ22m29為不合理值或遺漏值".
compute s758=1.
end if.
Exec.

*vQ22m30=0,1 96 .
do if not range(vQ22m30,0,1,96,96) | sys(vQ22m30).
compute m759=concat("vQ22m30=",string(vQ22m30,f2)).
compute p759="vQ22m30為不合理值或遺漏值".
compute s759=1.
end if.
Exec.

*vQ22m31=0,1 96 .
do if not range(vQ22m31,0,1,96,96) | sys(vQ22m31).
compute m760=concat("vQ22m31=",string(vQ22m31,f2)).
compute p760="vQ22m31為不合理值或遺漏值".
compute s760=1.
end if.
Exec.

*vQ22m32=0,1 96 .
do if not range(vQ22m32,0,1,96,96) | sys(vQ22m32).
compute m761=concat("vQ22m32=",string(vQ22m32,f2)).
compute p761="vQ22m32為不合理值或遺漏值".
compute s761=1.
end if.
Exec.

*vQ22m33=0,1 96 .
do if not range(vQ22m33,0,1,96,96) | sys(vQ22m33).
compute m762=concat("vQ22m33=",string(vQ22m33,f2)).
compute p762="vQ22m33為不合理值或遺漏值".
compute s762=1.
end if.
Exec.

*vQ22m34=0,1 96 .
do if not range(vQ22m34,0,1,96,96) | sys(vQ22m34).
compute m763=concat("vQ22m34=",string(vQ22m34,f2)).
compute p763="vQ22m34為不合理值或遺漏值".
compute s763=1.
end if.
Exec.

*vQ22m35=0,1 96 .
do if not range(vQ22m35,0,1,96,96) | sys(vQ22m35).
compute m764=concat("vQ22m35=",string(vQ22m35,f2)).
compute p764="vQ22m35為不合理值或遺漏值".
compute s764=1.
end if.
Exec.

*vQ22m36=0,1 96 .
do if not range(vQ22m36,0,1,96,96) | sys(vQ22m36).
compute m765=concat("vQ22m36=",string(vQ22m36,f2)).
compute p765="vQ22m36為不合理值或遺漏值".
compute s765=1.
end if.
Exec.

*vQ22m37=0,1 96 .
do if not range(vQ22m37,0,1,96,96) | sys(vQ22m37).
compute m766=concat("vQ22m37=",string(vQ22m37,f2)).
compute p766="vQ22m37為不合理值或遺漏值".
compute s766=1.
end if.
Exec.

*vQ22m38=0,1 96 .
do if not range(vQ22m38,0,1,96,96) | sys(vQ22m38).
compute m767=concat("vQ22m38=",string(vQ22m38,f2)).
compute p767="vQ22m38為不合理值或遺漏值".
compute s767=1.
end if.
Exec.

*vQ22m39=0,1 96 .
do if not range(vQ22m39,0,1,96,96) | sys(vQ22m39).
compute m768=concat("vQ22m39=",string(vQ22m39,f2)).
compute p768="vQ22m39為不合理值或遺漏值".
compute s768=1.
end if.
Exec.

*vQ22m40=0,1 96 .
do if not range(vQ22m40,0,1,96,96) | sys(vQ22m40).
compute m769=concat("vQ22m40=",string(vQ22m40,f2)).
compute p769="vQ22m40為不合理值或遺漏值".
compute s769=1.
end if.
Exec.

*vQ22m88=0,1 96 .
do if not range(vQ22m88,0,1,96,96) | sys(vQ22m88).
compute m770=concat("vQ22m88=",string(vQ22m88,f2)).
compute p770="vQ22m88為不合理值或遺漏值".
compute s770=1.
end if.
Exec.

*vQ23m01=0,1 .
do if not range(vQ23m01,0,1) | sys(vQ23m01).
compute m771=concat("vQ23m01=",string(vQ23m01,f2)).
compute p771="vQ23m01為不合理值或遺漏值".
compute s771=1.
end if.
Exec.

*vQ23m02=0,1 .
do if not range(vQ23m02,0,1) | sys(vQ23m02).
compute m772=concat("vQ23m02=",string(vQ23m02,f2)).
compute p772="vQ23m02為不合理值或遺漏值".
compute s772=1.
end if.
Exec.

*vQ23m03=0,1 .
do if not range(vQ23m03,0,1) | sys(vQ23m03).
compute m773=concat("vQ23m03=",string(vQ23m03,f2)).
compute p773="vQ23m03為不合理值或遺漏值".
compute s773=1.
end if.
Exec.

*vQ23m04=0,1 .
do if not range(vQ23m04,0,1) | sys(vQ23m04).
compute m774=concat("vQ23m04=",string(vQ23m04,f2)).
compute p774="vQ23m04為不合理值或遺漏值".
compute s774=1.
end if.
Exec.

*vQ23m05=0,1 .
do if not range(vQ23m05,0,1) | sys(vQ23m05).
compute m775=concat("vQ23m05=",string(vQ23m05,f2)).
compute p775="vQ23m05為不合理值或遺漏值".
compute s775=1.
end if.
Exec.

*vQ23m06=0,1 .
do if not range(vQ23m06,0,1) | sys(vQ23m06).
compute m776=concat("vQ23m06=",string(vQ23m06,f2)).
compute p776="vQ23m06為不合理值或遺漏值".
compute s776=1.
end if.
Exec.

*vQ23m07=0,1 .
do if not range(vQ23m07,0,1) | sys(vQ23m07).
compute m777=concat("vQ23m07=",string(vQ23m07,f2)).
compute p777="vQ23m07為不合理值或遺漏值".
compute s777=1.
end if.
Exec.

*vQ23m08=0,1 .
do if not range(vQ23m08,0,1) | sys(vQ23m08).
compute m778=concat("vQ23m08=",string(vQ23m08,f2)).
compute p778="vQ23m08為不合理值或遺漏值".
compute s778=1.
end if.
Exec.

*vQ23m09=0,1 .
do if not range(vQ23m09,0,1) | sys(vQ23m09).
compute m779=concat("vQ23m09=",string(vQ23m09,f2)).
compute p779="vQ23m09為不合理值或遺漏值".
compute s779=1.
end if.
Exec.

*vQ23m10=0,1 96 .
do if not range(vQ23m10,0,1,96,96) | sys(vQ23m10).
compute m780=concat("vQ23m10=",string(vQ23m10,f2)).
compute p780="vQ23m10為不合理值或遺漏值".
compute s780=1.
end if.
Exec.

*vQ23m11=0,1 96 .
do if not range(vQ23m11,0,1,96,96) | sys(vQ23m11).
compute m781=concat("vQ23m11=",string(vQ23m11,f2)).
compute p781="vQ23m11為不合理值或遺漏值".
compute s781=1.
end if.
Exec.

*vQ23m12=0,1 96 .
do if not range(vQ23m12,0,1,96,96) | sys(vQ23m12).
compute m782=concat("vQ23m12=",string(vQ23m12,f2)).
compute p782="vQ23m12為不合理值或遺漏值".
compute s782=1.
end if.
Exec.

*vQ23m13=0,1 96 .
do if not range(vQ23m13,0,1,96,96) | sys(vQ23m13).
compute m783=concat("vQ23m13=",string(vQ23m13,f2)).
compute p783="vQ23m13為不合理值或遺漏值".
compute s783=1.
end if.
Exec.

*vQ23m14=0,1 96 .
do if not range(vQ23m14,0,1,96,96) | sys(vQ23m14).
compute m784=concat("vQ23m14=",string(vQ23m14,f2)).
compute p784="vQ23m14為不合理值或遺漏值".
compute s784=1.
end if.
Exec.

*vQ23m15=0,1 96 .
do if not range(vQ23m15,0,1,96,96) | sys(vQ23m15).
compute m785=concat("vQ23m15=",string(vQ23m15,f2)).
compute p785="vQ23m15為不合理值或遺漏值".
compute s785=1.
end if.
Exec.

*vQ23m16=0,1 96 .
do if not range(vQ23m16,0,1,96,96) | sys(vQ23m16).
compute m786=concat("vQ23m16=",string(vQ23m16,f2)).
compute p786="vQ23m16為不合理值或遺漏值".
compute s786=1.
end if.
Exec.

*vQ23m17=0,1 96 .
do if not range(vQ23m17,0,1,96,96) | sys(vQ23m17).
compute m787=concat("vQ23m17=",string(vQ23m17,f2)).
compute p787="vQ23m17為不合理值或遺漏值".
compute s787=1.
end if.
Exec.

*vQ23m18=0,1 96 .
do if not range(vQ23m18,0,1,96,96) | sys(vQ23m18).
compute m788=concat("vQ23m18=",string(vQ23m18,f2)).
compute p788="vQ23m18為不合理值或遺漏值".
compute s788=1.
end if.
Exec.

*vQ23m19=0,1 96 .
do if not range(vQ23m19,0,1,96,96) | sys(vQ23m19).
compute m789=concat("vQ23m19=",string(vQ23m19,f2)).
compute p789="vQ23m19為不合理值或遺漏值".
compute s789=1.
end if.
Exec.

*vQ23m20=0,1 96 .
do if not range(vQ23m20,0,1,96,96) | sys(vQ23m20).
compute m790=concat("vQ23m20=",string(vQ23m20,f2)).
compute p790="vQ23m20為不合理值或遺漏值".
compute s790=1.
end if.
Exec.

*vQ23m21=0,1 96 .
do if not range(vQ23m21,0,1,96,96) | sys(vQ23m21).
compute m791=concat("vQ23m21=",string(vQ23m21,f2)).
compute p791="vQ23m21為不合理值或遺漏值".
compute s791=1.
end if.
Exec.

*vQ23m22=0,1 96 .
do if not range(vQ23m22,0,1,96,96) | sys(vQ23m22).
compute m792=concat("vQ23m22=",string(vQ23m22,f2)).
compute p792="vQ23m22為不合理值或遺漏值".
compute s792=1.
end if.
Exec.

*vQ23m23=0,1 96 .
do if not range(vQ23m23,0,1,96,96) | sys(vQ23m23).
compute m793=concat("vQ23m23=",string(vQ23m23,f2)).
compute p793="vQ23m23為不合理值或遺漏值".
compute s793=1.
end if.
Exec.

*vQ23m24=0,1 96 .
do if not range(vQ23m24,0,1,96,96) | sys(vQ23m24).
compute m794=concat("vQ23m24=",string(vQ23m24,f2)).
compute p794="vQ23m24為不合理值或遺漏值".
compute s794=1.
end if.
Exec.

*vQ23m25=0,1 96 .
do if not range(vQ23m25,0,1,96,96) | sys(vQ23m25).
compute m795=concat("vQ23m25=",string(vQ23m25,f2)).
compute p795="vQ23m25為不合理值或遺漏值".
compute s795=1.
end if.
Exec.

*vQ23m26=0,1 96 .
do if not range(vQ23m26,0,1,96,96) | sys(vQ23m26).
compute m796=concat("vQ23m26=",string(vQ23m26,f2)).
compute p796="vQ23m26為不合理值或遺漏值".
compute s796=1.
end if.
Exec.

*vQ23m27=0,1 96 .
do if not range(vQ23m27,0,1,96,96) | sys(vQ23m27).
compute m797=concat("vQ23m27=",string(vQ23m27,f2)).
compute p797="vQ23m27為不合理值或遺漏值".
compute s797=1.
end if.
Exec.

*vQ23m88=0,1 96 .
do if not range(vQ23m88,0,1,96,96) | sys(vQ23m88).
compute m798=concat("vQ23m88=",string(vQ23m88,f2)).
compute p798="vQ23m88為不合理值或遺漏值".
compute s798=1.
end if.
Exec.

*vQ26Ag1=0,140 997,998 .
do if not range(vQ26Ag1,0,140,997,998) | sys(vQ26Ag1).
compute m799=concat("vQ26Ag1=",string(vQ26Ag1,f4)).
compute p799="vQ26Ag1為不合理值或遺漏值".
compute s799=1.
end if.
Exec.

*vQ26Ag2=0,59 97,98 .
do if not range(vQ26Ag2,0,59,97,98) | sys(vQ26Ag2).
compute m800=concat("vQ26Ag2=",string(vQ26Ag2,f3)).
compute p800="vQ26Ag2為不合理值或遺漏值".
compute s800=1.
end if.
Exec.

*vCKQ26A=1 .
do if not range(vCKQ26A,1,1) | sys(vCKQ26A).
compute m801=concat("vCKQ26A=",string(vCKQ26A,f2)).
compute p801="vCKQ26A為不合理值或遺漏值".
compute s801=1.
end if.
Exec.

*vQ26m01=0,1 .
do if not range(vQ26m01,0,1) | sys(vQ26m01).
compute m802=concat("vQ26m01=",string(vQ26m01,f2)).
compute p802="vQ26m01為不合理值或遺漏值".
compute s802=1.
end if.
Exec.

*vQ26m02=0,1 .
do if not range(vQ26m02,0,1) | sys(vQ26m02).
compute m803=concat("vQ26m02=",string(vQ26m02,f2)).
compute p803="vQ26m02為不合理值或遺漏值".
compute s803=1.
end if.
Exec.

*vQ26m03=0,1 .
do if not range(vQ26m03,0,1) | sys(vQ26m03).
compute m804=concat("vQ26m03=",string(vQ26m03,f2)).
compute p804="vQ26m03為不合理值或遺漏值".
compute s804=1.
end if.
Exec.

*vQ26m04=0,1 .
do if not range(vQ26m04,0,1) | sys(vQ26m04).
compute m805=concat("vQ26m04=",string(vQ26m04,f2)).
compute p805="vQ26m04為不合理值或遺漏值".
compute s805=1.
end if.
Exec.

*vQ26m05=0,1 .
do if not range(vQ26m05,0,1) | sys(vQ26m05).
compute m806=concat("vQ26m05=",string(vQ26m05,f2)).
compute p806="vQ26m05為不合理值或遺漏值".
compute s806=1.
end if.
Exec.

*vQ26m06=0,1 .
do if not range(vQ26m06,0,1) | sys(vQ26m06).
compute m807=concat("vQ26m06=",string(vQ26m06,f2)).
compute p807="vQ26m06為不合理值或遺漏值".
compute s807=1.
end if.
Exec.

*vQ26m07=0,1 .
do if not range(vQ26m07,0,1) | sys(vQ26m07).
compute m808=concat("vQ26m07=",string(vQ26m07,f2)).
compute p808="vQ26m07為不合理值或遺漏值".
compute s808=1.
end if.
Exec.

*vQ26m08=0,1 .
do if not range(vQ26m08,0,1) | sys(vQ26m08).
compute m809=concat("vQ26m08=",string(vQ26m08,f2)).
compute p809="vQ26m08為不合理值或遺漏值".
compute s809=1.
end if.
Exec.

*vQ26m09=0,1 .
do if not range(vQ26m09,0,1) | sys(vQ26m09).
compute m810=concat("vQ26m09=",string(vQ26m09,f2)).
compute p810="vQ26m09為不合理值或遺漏值".
compute s810=1.
end if.
Exec.

*vQ26m10=0,1 96 .
do if not range(vQ26m10,0,1,96,96) | sys(vQ26m10).
compute m811=concat("vQ26m10=",string(vQ26m10,f2)).
compute p811="vQ26m10為不合理值或遺漏值".
compute s811=1.
end if.
Exec.

*vQ26m11=0,1 96 .
do if not range(vQ26m11,0,1,96,96) | sys(vQ26m11).
compute m812=concat("vQ26m11=",string(vQ26m11,f2)).
compute p812="vQ26m11為不合理值或遺漏值".
compute s812=1.
end if.
Exec.

*vQ26m12=0,1 96 .
do if not range(vQ26m12,0,1,96,96) | sys(vQ26m12).
compute m813=concat("vQ26m12=",string(vQ26m12,f2)).
compute p813="vQ26m12為不合理值或遺漏值".
compute s813=1.
end if.
Exec.

*vQ26m13=0,1 96 .
do if not range(vQ26m13,0,1,96,96) | sys(vQ26m13).
compute m814=concat("vQ26m13=",string(vQ26m13,f2)).
compute p814="vQ26m13為不合理值或遺漏值".
compute s814=1.
end if.
Exec.

*vQ26m14=0,1 96 .
do if not range(vQ26m14,0,1,96,96) | sys(vQ26m14).
compute m815=concat("vQ26m14=",string(vQ26m14,f2)).
compute p815="vQ26m14為不合理值或遺漏值".
compute s815=1.
end if.
Exec.

*vQ26m15=0,1 96 .
do if not range(vQ26m15,0,1,96,96) | sys(vQ26m15).
compute m816=concat("vQ26m15=",string(vQ26m15,f2)).
compute p816="vQ26m15為不合理值或遺漏值".
compute s816=1.
end if.
Exec.

*vQ26m16=0,1 96 .
do if not range(vQ26m16,0,1,96,96) | sys(vQ26m16).
compute m817=concat("vQ26m16=",string(vQ26m16,f2)).
compute p817="vQ26m16為不合理值或遺漏值".
compute s817=1.
end if.
Exec.

*vQ26m17=0,1 96 .
do if not range(vQ26m17,0,1,96,96) | sys(vQ26m17).
compute m818=concat("vQ26m17=",string(vQ26m17,f2)).
compute p818="vQ26m17為不合理值或遺漏值".
compute s818=1.
end if.
Exec.

*vQ26m18=0,1 96 .
do if not range(vQ26m18,0,1,96,96) | sys(vQ26m18).
compute m819=concat("vQ26m18=",string(vQ26m18,f2)).
compute p819="vQ26m18為不合理值或遺漏值".
compute s819=1.
end if.
Exec.

*vQ26m19=0,1 96 .
do if not range(vQ26m19,0,1,96,96) | sys(vQ26m19).
compute m820=concat("vQ26m19=",string(vQ26m19,f2)).
compute p820="vQ26m19為不合理值或遺漏值".
compute s820=1.
end if.
Exec.

*vQ26m20=0,1 96 .
do if not range(vQ26m20,0,1,96,96) | sys(vQ26m20).
compute m821=concat("vQ26m20=",string(vQ26m20,f2)).
compute p821="vQ26m20為不合理值或遺漏值".
compute s821=1.
end if.
Exec.

*vQ26m21=0,1 96 .
do if not range(vQ26m21,0,1,96,96) | sys(vQ26m21).
compute m822=concat("vQ26m21=",string(vQ26m21,f2)).
compute p822="vQ26m21為不合理值或遺漏值".
compute s822=1.
end if.
Exec.

*vQ26m22=0,1 96 .
do if not range(vQ26m22,0,1,96,96) | sys(vQ26m22).
compute m823=concat("vQ26m22=",string(vQ26m22,f2)).
compute p823="vQ26m22為不合理值或遺漏值".
compute s823=1.
end if.
Exec.

*vQ26m23=0,1 96 .
do if not range(vQ26m23,0,1,96,96) | sys(vQ26m23).
compute m824=concat("vQ26m23=",string(vQ26m23,f2)).
compute p824="vQ26m23為不合理值或遺漏值".
compute s824=1.
end if.
Exec.

*vQ26m24=0,1 96 .
do if not range(vQ26m24,0,1,96,96) | sys(vQ26m24).
compute m825=concat("vQ26m24=",string(vQ26m24,f2)).
compute p825="vQ26m24為不合理值或遺漏值".
compute s825=1.
end if.
Exec.

*vQ26m25=0,1 96 .
do if not range(vQ26m25,0,1,96,96) | sys(vQ26m25).
compute m826=concat("vQ26m25=",string(vQ26m25,f2)).
compute p826="vQ26m25為不合理值或遺漏值".
compute s826=1.
end if.
Exec.

*vQ26m26=0,1 96 .
do if not range(vQ26m26,0,1,96,96) | sys(vQ26m26).
compute m827=concat("vQ26m26=",string(vQ26m26,f2)).
compute p827="vQ26m26為不合理值或遺漏值".
compute s827=1.
end if.
Exec.

*vQ26m27=0,1 96 .
do if not range(vQ26m27,0,1,96,96) | sys(vQ26m27).
compute m828=concat("vQ26m27=",string(vQ26m27,f2)).
compute p828="vQ26m27為不合理值或遺漏值".
compute s828=1.
end if.
Exec.

*vQ26m28=0,1 96 .
do if not range(vQ26m28,0,1,96,96) | sys(vQ26m28).
compute m829=concat("vQ26m28=",string(vQ26m28,f2)).
compute p829="vQ26m28為不合理值或遺漏值".
compute s829=1.
end if.
Exec.

*vQ26m29=0,1 96 .
do if not range(vQ26m29,0,1,96,96) | sys(vQ26m29).
compute m830=concat("vQ26m29=",string(vQ26m29,f2)).
compute p830="vQ26m29為不合理值或遺漏值".
compute s830=1.
end if.
Exec.

*vQ26m88=0,1 96 .
do if not range(vQ26m88,0,1,96,96) | sys(vQ26m88).
compute m831=concat("vQ26m88=",string(vQ26m88,f2)).
compute p831="vQ26m88為不合理值或遺漏值".
compute s831=1.
end if.
Exec.

*vQ27m01=0,1 .
do if not range(vQ27m01,0,1) | sys(vQ27m01).
compute m832=concat("vQ27m01=",string(vQ27m01,f2)).
compute p832="vQ27m01為不合理值或遺漏值".
compute s832=1.
end if.
Exec.

*vQ27m02=0,1 .
do if not range(vQ27m02,0,1) | sys(vQ27m02).
compute m833=concat("vQ27m02=",string(vQ27m02,f2)).
compute p833="vQ27m02為不合理值或遺漏值".
compute s833=1.
end if.
Exec.

*vQ27m03=0,1 .
do if not range(vQ27m03,0,1) | sys(vQ27m03).
compute m834=concat("vQ27m03=",string(vQ27m03,f2)).
compute p834="vQ27m03為不合理值或遺漏值".
compute s834=1.
end if.
Exec.

*vQ27m04=0,1 .
do if not range(vQ27m04,0,1) | sys(vQ27m04).
compute m835=concat("vQ27m04=",string(vQ27m04,f2)).
compute p835="vQ27m04為不合理值或遺漏值".
compute s835=1.
end if.
Exec.

*vQ27m05=0,1 .
do if not range(vQ27m05,0,1) | sys(vQ27m05).
compute m836=concat("vQ27m05=",string(vQ27m05,f2)).
compute p836="vQ27m05為不合理值或遺漏值".
compute s836=1.
end if.
Exec.

*vQ27m06=0,1 .
do if not range(vQ27m06,0,1) | sys(vQ27m06).
compute m837=concat("vQ27m06=",string(vQ27m06,f2)).
compute p837="vQ27m06為不合理值或遺漏值".
compute s837=1.
end if.
Exec.

*vQ27m07=0,1 .
do if not range(vQ27m07,0,1) | sys(vQ27m07).
compute m838=concat("vQ27m07=",string(vQ27m07,f2)).
compute p838="vQ27m07為不合理值或遺漏值".
compute s838=1.
end if.
Exec.

*vQ27m88=0,1 96 .
do if not range(vQ27m88,0,1,96,96) | sys(vQ27m88).
compute m839=concat("vQ27m88=",string(vQ27m88,f2)).
compute p839="vQ27m88為不合理值或遺漏值".
compute s839=1.
end if.
Exec.

*vP3_4=1,4 97,98 .
do if not range(vP3_4,1,4,97,98) | sys(vP3_4).
compute m840=concat("vP3_4=",string(vP3_4,f2)).
compute p840="vP3_4為不合理值或遺漏值".
compute s840=1.
end if.
Exec.

*vCKP3_4=96 .
do if not range(vCKP3_4,96,96) | sys(vCKP3_4).
compute m841=concat("vCKP3_4=",string(vCKP3_4,f2)).
compute p841="vCKP3_4為不合理值或遺漏值".
compute s841=1.
end if.
Exec.

*vP3_5=1,4 90 97,98 .
do if not range(vP3_5,1,4,90,90,97,98) | sys(vP3_5).
compute m842=concat("vP3_5=",string(vP3_5,f2)).
compute p842="vP3_5為不合理值或遺漏值".
compute s842=1.
end if.
Exec.

*vP3_6=1,4 97,98 .
do if not range(vP3_6,1,4,97,98) | sys(vP3_6).
compute m843=concat("vP3_6=",string(vP3_6,f2)).
compute p843="vP3_6為不合理值或遺漏值".
compute s843=1.
end if.
Exec.

*vP5_3R=1,4 97,98 .
do if not range(vP5_3R,1,4,97,98) | sys(vP5_3R).
compute m844=concat("vP5_3R=",string(vP5_3R,f2)).
compute p844="vP5_3R為不合理值或遺漏值".
compute s844=1.
end if.
Exec.

*vP5_4R=1,4 97,98 .
do if not range(vP5_4R,1,4,97,98) | sys(vP5_4R).
compute m845=concat("vP5_4R=",string(vP5_4R,f2)).
compute p845="vP5_4R為不合理值或遺漏值".
compute s845=1.
end if.
Exec.

*vP5_5=1,5 97,98 .
do if not range(vP5_5,1,5,97,98) | sys(vP5_5).
compute m846=concat("vP5_5=",string(vP5_5,f2)).
compute p846="vP5_5為不合理值或遺漏值".
compute s846=1.
end if.
Exec.

*vQ28=0,500 991 997,998 .
do if not range(vQ28,0,500,991,991,997,998) | sys(vQ28).
compute m847=concat("vQ28=",string(vQ28,f4)).
compute p847="vQ28為不合理值或遺漏值".
compute s847=1.
end if.
Exec.

*vQ30m01=0,1 .
do if not range(vQ30m01,0,1) | sys(vQ30m01).
compute m848=concat("vQ30m01=",string(vQ30m01,f2)).
compute p848="vQ30m01為不合理值或遺漏值".
compute s848=1.
end if.
Exec.

*vQ30m02=0,1 .
do if not range(vQ30m02,0,1) | sys(vQ30m02).
compute m849=concat("vQ30m02=",string(vQ30m02,f2)).
compute p849="vQ30m02為不合理值或遺漏值".
compute s849=1.
end if.
Exec.

*vQ30m03=0,1 .
do if not range(vQ30m03,0,1) | sys(vQ30m03).
compute m850=concat("vQ30m03=",string(vQ30m03,f2)).
compute p850="vQ30m03為不合理值或遺漏值".
compute s850=1.
end if.
Exec.

*vQ30m04=0,1 .
do if not range(vQ30m04,0,1) | sys(vQ30m04).
compute m851=concat("vQ30m04=",string(vQ30m04,f2)).
compute p851="vQ30m04為不合理值或遺漏值".
compute s851=1.
end if.
Exec.

*vQ30m05=0,1 .
do if not range(vQ30m05,0,1) | sys(vQ30m05).
compute m852=concat("vQ30m05=",string(vQ30m05,f2)).
compute p852="vQ30m05為不合理值或遺漏值".
compute s852=1.
end if.
Exec.

*vQ30m06=0,1 .
do if not range(vQ30m06,0,1) | sys(vQ30m06).
compute m853=concat("vQ30m06=",string(vQ30m06,f2)).
compute p853="vQ30m06為不合理值或遺漏值".
compute s853=1.
end if.
Exec.

*vQ30m07=0,1 .
do if not range(vQ30m07,0,1) | sys(vQ30m07).
compute m854=concat("vQ30m07=",string(vQ30m07,f2)).
compute p854="vQ30m07為不合理值或遺漏值".
compute s854=1.
end if.
Exec.

*vQ30m08=0,1 .
do if not range(vQ30m08,0,1) | sys(vQ30m08).
compute m855=concat("vQ30m08=",string(vQ30m08,f2)).
compute p855="vQ30m08為不合理值或遺漏值".
compute s855=1.
end if.
Exec.

*vQ30m90=0,1 96 .
do if not range(vQ30m90,0,1,96,96) | sys(vQ30m90).
compute m856=concat("vQ30m90=",string(vQ30m90,f2)).
compute p856="vQ30m90為不合理值或遺漏值".
compute s856=1.
end if.
Exec.

*vQ31m01=0,1 .
do if not range(vQ31m01,0,1) | sys(vQ31m01).
compute m857=concat("vQ31m01=",string(vQ31m01,f2)).
compute p857="vQ31m01為不合理值或遺漏值".
compute s857=1.
end if.
Exec.

*vQ31m02=0,1 .
do if not range(vQ31m02,0,1) | sys(vQ31m02).
compute m858=concat("vQ31m02=",string(vQ31m02,f2)).
compute p858="vQ31m02為不合理值或遺漏值".
compute s858=1.
end if.
Exec.

*vQ31m03=0,1 .
do if not range(vQ31m03,0,1) | sys(vQ31m03).
compute m859=concat("vQ31m03=",string(vQ31m03,f2)).
compute p859="vQ31m03為不合理值或遺漏值".
compute s859=1.
end if.
Exec.

*vQ31m04=0,1 .
do if not range(vQ31m04,0,1) | sys(vQ31m04).
compute m860=concat("vQ31m04=",string(vQ31m04,f2)).
compute p860="vQ31m04為不合理值或遺漏值".
compute s860=1.
end if.
Exec.

*vQ31m05=0,1 .
do if not range(vQ31m05,0,1) | sys(vQ31m05).
compute m861=concat("vQ31m05=",string(vQ31m05,f2)).
compute p861="vQ31m05為不合理值或遺漏值".
compute s861=1.
end if.
Exec.

*vQ31m06=0,1 .
do if not range(vQ31m06,0,1) | sys(vQ31m06).
compute m862=concat("vQ31m06=",string(vQ31m06,f2)).
compute p862="vQ31m06為不合理值或遺漏值".
compute s862=1.
end if.
Exec.

*vQ31m07=0,1 .
do if not range(vQ31m07,0,1) | sys(vQ31m07).
compute m863=concat("vQ31m07=",string(vQ31m07,f2)).
compute p863="vQ31m07為不合理值或遺漏值".
compute s863=1.
end if.
Exec.

*vQ31m08=0,1 .
do if not range(vQ31m08,0,1) | sys(vQ31m08).
compute m864=concat("vQ31m08=",string(vQ31m08,f2)).
compute p864="vQ31m08為不合理值或遺漏值".
compute s864=1.
end if.
Exec.

*vQ31m90=0,1 96 .
do if not range(vQ31m90,0,1,96,96) | sys(vQ31m90).
compute m865=concat("vQ31m90=",string(vQ31m90,f2)).
compute p865="vQ31m90為不合理值或遺漏值".
compute s865=1.
end if.
Exec.

*vQ32sQ32=1,5 97,98 .
do if not range(vQ32sQ32,1,5,97,98) | sys(vQ32sQ32).
compute m866=concat("vQ32sQ32=",string(vQ32sQ32,f2)).
compute p866="vQ32sQ32為不合理值或遺漏值".
compute s866=1.
end if.
Exec.

*vQ32sQ33=1,5 97,98 .
do if not range(vQ32sQ33,1,5,97,98) | sys(vQ32sQ33).
compute m867=concat("vQ32sQ33=",string(vQ32sQ33,f2)).
compute p867="vQ32sQ33為不合理值或遺漏值".
compute s867=1.
end if.
Exec.

*vQ32sQ34=1,5 97,98 .
do if not range(vQ32sQ34,1,5,97,98) | sys(vQ32sQ34).
compute m868=concat("vQ32sQ34=",string(vQ32sQ34,f2)).
compute p868="vQ32sQ34為不合理值或遺漏值".
compute s868=1.
end if.
Exec.

*vQ58s58=1,5 97,98 .
do if not range(vQ58s58,1,5,97,98) | sys(vQ58s58).
compute m869=concat("vQ58s58=",string(vQ58s58,f2)).
compute p869="vQ58s58為不合理值或遺漏值".
compute s869=1.
end if.
Exec.

*vQ58s59=1,5 97,98 .
do if not range(vQ58s59,1,5,97,98) | sys(vQ58s59).
compute m870=concat("vQ58s59=",string(vQ58s59,f2)).
compute p870="vQ58s59為不合理值或遺漏值".
compute s870=1.
end if.
Exec.

*vQ58s60=1,5 97,98 .
do if not range(vQ58s60,1,5,97,98) | sys(vQ58s60).
compute m871=concat("vQ58s60=",string(vQ58s60,f2)).
compute p871="vQ58s60為不合理值或遺漏值".
compute s871=1.
end if.
Exec.

*vQ58s61=1,5 97,98 .
do if not range(vQ58s61,1,5,97,98) | sys(vQ58s61).
compute m872=concat("vQ58s61=",string(vQ58s61,f2)).
compute p872="vQ58s61為不合理值或遺漏值".
compute s872=1.
end if.
Exec.

*vQ46=1,5 97,98 .
do if not range(vQ46,1,5,97,98) | sys(vQ46).
compute m873=concat("vQ46=",string(vQ46,f2)).
compute p873="vQ46為不合理值或遺漏值".
compute s873=1.
end if.
Exec.

*vP3_2=1,5 97,98 .
do if not range(vP3_2,1,5,97,98) | sys(vP3_2).
compute m874=concat("vP3_2=",string(vP3_2,f2)).
compute p874="vP3_2為不合理值或遺漏值".
compute s874=1.
end if.
Exec.

*vP3_3=1,5 97,98 .
do if not range(vP3_3,1,5,97,98) | sys(vP3_3).
compute m875=concat("vP3_3=",string(vP3_3,f2)).
compute p875="vP3_3為不合理值或遺漏值".
compute s875=1.
end if.
Exec.

*vP2_1=1,4 97,98 .
do if not range(vP2_1,1,4,97,98) | sys(vP2_1).
compute m876=concat("vP2_1=",string(vP2_1,f2)).
compute p876="vP2_1為不合理值或遺漏值".
compute s876=1.
end if.
Exec.

*vP2_2=1,4 97,98 .
do if not range(vP2_2,1,4,97,98) | sys(vP2_2).
compute m877=concat("vP2_2=",string(vP2_2,f2)).
compute p877="vP2_2為不合理值或遺漏值".
compute s877=1.
end if.
Exec.

*vP2_3=1,4 97,98 .
do if not range(vP2_3,1,4,97,98) | sys(vP2_3).
compute m878=concat("vP2_3=",string(vP2_3,f2)).
compute p878="vP2_3為不合理值或遺漏值".
compute s878=1.
end if.
Exec.

*vP2_4=1,5 97,98 .
do if not range(vP2_4,1,5,97,98) | sys(vP2_4).
compute m879=concat("vP2_4=",string(vP2_4,f2)).
compute p879="vP2_4為不合理值或遺漏值".
compute s879=1.
end if.
Exec.

*vP2_5=1,5 97,98 .
do if not range(vP2_5,1,5,97,98) | sys(vP2_5).
compute m880=concat("vP2_5=",string(vP2_5,f2)).
compute p880="vP2_5為不合理值或遺漏值".
compute s880=1.
end if.
Exec.

*vP2_6=1,5 97,98 .
do if not range(vP2_6,1,5,97,98) | sys(vP2_6).
compute m881=concat("vP2_6=",string(vP2_6,f2)).
compute p881="vP2_6為不合理值或遺漏值".
compute s881=1.
end if.
Exec.

*vQ43=1,8 97,98 .
do if not range(vQ43,1,8,97,98) | sys(vQ43).
compute m882=concat("vQ43=",string(vQ43,f2)).
compute p882="vQ43為不合理值或遺漏值".
compute s882=1.
end if.
Exec.

*vQ44=1,89 90,92 .
do if not range(vQ44,1,89,90,92) | sys(vQ44).
compute m883=concat("vQ44=",string(vQ44,f2)).
compute p883="vQ44為不合理值或遺漏值".
compute s883=1.
end if.
Exec.

*vQ45=1,89 90,92 .
do if not range(vQ45,1,89,90,92) | sys(vQ45).
compute m884=concat("vQ45=",string(vQ45,f2)).
compute p884="vQ45為不合理值或遺漏值".
compute s884=1.
end if.
Exec.

*vQ47=997,998 .
do if not range(vQ47,997,998) | sys(vQ47).
compute m885=concat("vQ47=",string(vQ47,f4)).
compute p885="vQ47為不合理值或遺漏值".
compute s885=1.
end if.
Exec.

*vQ48=997,998 .
do if not range(vQ48,997,998) | sys(vQ48).
compute m886=concat("vQ48=",string(vQ48,f4)).
compute p886="vQ48為不合理值或遺漏值".
compute s886=1.
end if.
Exec.

*vQ62=997,998 .
do if not range(vQ62,997,998) | sys(vQ62).
compute m887=concat("vQ62=",string(vQ62,f4)).
compute p887="vQ62為不合理值或遺漏值".
compute s887=1.
end if.
Exec.

*vQ49=1,2 97,98 .
do if not range(vQ49,1,2,97,98) | sys(vQ49).
compute m888=concat("vQ49=",string(vQ49,f2)).
compute p888="vQ49為不合理值或遺漏值".
compute s888=1.
end if.
Exec.

*vQ50=2 97,98 .
do if not range(vQ50,2,2,97,98) | sys(vQ50).
compute m889=concat("vQ50=",string(vQ50,f2)).
compute p889="vQ50為不合理值或遺漏值".
compute s889=1.
end if.
Exec.

*vQ51=1,88 .
do if not range(vQ51,1,88) | sys(vQ51).
compute m890=concat("vQ51=",string(vQ51,f2)).
compute p890="vQ51為不合理值或遺漏值".
compute s890=1.
end if.
Exec.

*vQ52=1,88 .
do if not range(vQ52,1,88) | sys(vQ52).
compute m891=concat("vQ52=",string(vQ52,f2)).
compute p891="vQ52為不合理值或遺漏值".
compute s891=1.
end if.
Exec.

*vQ53=1,88 93 95 97 .
do if not range(vQ53,1,88,93,93,95,95,97,97) | sys(vQ53).
compute m892=concat("vQ53=",string(vQ53,f2)).
compute p892="vQ53為不合理值或遺漏值".
compute s892=1.
end if.
Exec.

*vP3_1=97,98 .
do if not range(vP3_1,97,98) | sys(vP3_1).
compute m893=concat("vP3_1=",string(vP3_1,f3)).
compute p893="vP3_1為不合理值或遺漏值".
compute s893=1.
end if.
Exec.

*vQ54=1,88 97,98 .
do if not range(vQ54,1,88,97,98) | sys(vQ54).
compute m894=concat("vQ54=",string(vQ54,f2)).
compute p894="vQ54為不合理值或遺漏值".
compute s894=1.
end if.
Exec.

*vP5_6=0,10 97,98 .
do if not range(vP5_6,0,10,97,98) | sys(vP5_6).
compute m895=concat("vP5_6=",string(vP5_6,f2)).
compute p895="vP5_6為不合理值或遺漏值".
compute s895=1.
end if.
Exec.

*vQ55=1,4 97,98 .
do if not range(vQ55,1,4,97,98) | sys(vQ55).
compute m896=concat("vQ55=",string(vQ55,f2)).
compute p896="vQ55為不合理值或遺漏值".
compute s896=1.
end if.
Exec.

*vQ56=1,4 97,98 .
do if not range(vQ56,1,4,97,98) | sys(vQ56).
compute m897=concat("vQ56=",string(vQ56,f2)).
compute p897="vQ56為不合理值或遺漏值".
compute s897=1.
end if.
Exec.

*vQ57=1,4 97,98 .
do if not range(vQ57,1,4,97,98) | sys(vQ57).
compute m898=concat("vQ57=",string(vQ57,f2)).
compute p898="vQ57為不合理值或遺漏值".
compute s898=1.
end if.
Exec.

*vZ2_1g1=98 .
do if not range(vZ2_1g1,98,98) | sys(vZ2_1g1).
compute m899=concat("vZ2_1g1=",string(vZ2_1g1,f11)).
compute p899="vZ2_1g1為不合理值或遺漏值".
compute s899=1.
end if.
Exec.

*vZ2_1g2=98 .
do if not range(vZ2_1g2,98,98) | sys(vZ2_1g2).
compute m900=concat("vZ2_1g2=",string(vZ2_1g2,f9)).
compute p900="vZ2_1g2為不合理值或遺漏值".
compute s900=1.
end if.
Exec.

*vZ2_2=3 98 .
do if not range(vZ2_2,3,3,98,98) | sys(vZ2_2).
compute m901=concat("vZ2_2=",string(vZ2_2,f11)).
compute p901="vZ2_2為不合理值或遺漏值".
compute s901=1.
end if.
Exec.

*vZE1=1,4 .
do if not range(vZE1,1,4) | sys(vZE1).
compute m902=concat("vZE1=",string(vZE1,f2)).
compute p902="vZE1為不合理值或遺漏值".
compute s902=1.
end if.
Exec.

*vCkZE1=20260615000000,20260915000000 .
do if not range(vCkZE1,20260615000000,20260915000000) | sys(vCkZE1).
compute m903=concat("vCkZE1=",string(vCkZE1,f14)).
compute p903="vCkZE1為不合理值或遺漏值".
compute s903=1.
end if.
Exec.

*vZE2m01=0,1 .
do if not range(vZE2m01,0,1) | sys(vZE2m01).
compute m904=concat("vZE2m01=",string(vZE2m01,f2)).
compute p904="vZE2m01為不合理值或遺漏值".
compute s904=1.
end if.
Exec.

*vZE2m02=0,1 .
do if not range(vZE2m02,0,1) | sys(vZE2m02).
compute m905=concat("vZE2m02=",string(vZE2m02,f2)).
compute p905="vZE2m02為不合理值或遺漏值".
compute s905=1.
end if.
Exec.

*vZE2m03=0,1 .
do if not range(vZE2m03,0,1) | sys(vZE2m03).
compute m906=concat("vZE2m03=",string(vZE2m03,f2)).
compute p906="vZE2m03為不合理值或遺漏值".
compute s906=1.
end if.
Exec.

*vvckend=20260615000000,20260915000000 .
do if not range(vvckend,20260615000000,20260915000000) | sys(vvckend).
compute m907=concat("vvckend=",string(vvckend,f14)).
compute p907="vvckend為不合理值或遺漏值".
compute s907=1.
end if.
Exec.

* SYNTAXWORK_END_NUMERIC.
