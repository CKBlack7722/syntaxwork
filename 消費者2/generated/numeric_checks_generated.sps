* Encoding: UTF-8.

**NUMERIC CHECKS.

* SYNTAXWORK_BEGIN_NUMERIC.

*vG0city=1,29 .
do if not range(vG0city,1,29) | sys(vG0city).
compute m101=concat("vG0city=",string(vG0city,f2)).
compute p101="vG0city為不合理值或遺漏值".
end if.
Exec.

*vEND1=20260609000000,20260629000000 99969696969696 .
do if not range(vEND1,20260609000000,20260629000000,99969696969696,99969696969696) | sys(vEND1).
compute m102=concat("vEND1=",string(vEND1,f14)).
compute p102="vEND1為不合理值或遺漏值".
end if.
Exec.

*vA0=1 .
do if not range(vA0,1,1) | sys(vA0).
compute m103=concat("vA0=",string(vA0,f2)).
compute p103="vA0為不合理值或遺漏值".
end if.
Exec.

*vA1=0,999999999 .
do if not range(vA1,0,999999999) | sys(vA1).
compute m104=concat("vA1=",string(vA1,f10)).
compute p104="vA1為不合理值或遺漏值".
end if.
Exec.

*vA2=0,999999999 .
do if not range(vA2,0,999999999) | sys(vA2).
compute m105=concat("vA2=",string(vA2,f10)).
compute p105="vA2為不合理值或遺漏值".
end if.
Exec.

*vA3=0,999999999 .
do if not range(vA3,0,999999999) | sys(vA3).
compute m106=concat("vA3=",string(vA3,f10)).
compute p106="vA3為不合理值或遺漏值".
end if.
Exec.

*vA4=0,999999999 .
do if not range(vA4,0,999999999) | sys(vA4).
compute m107=concat("vA4=",string(vA4,f10)).
compute p107="vA4為不合理值或遺漏值".
end if.
Exec.

*vA5=0,999999999 .
do if not range(vA5,0,999999999) | sys(vA5).
compute m108=concat("vA5=",string(vA5,f10)).
compute p108="vA5為不合理值或遺漏值".
end if.
Exec.

*vA6=0,999999999 .
do if not range(vA6,0,999999999) | sys(vA6).
compute m109=concat("vA6=",string(vA6,f10)).
compute p109="vA6為不合理值或遺漏值".
end if.
Exec.

*vA7=0,999999999 .
do if not range(vA7,0,999999999) | sys(vA7).
compute m110=concat("vA7=",string(vA7,f10)).
compute p110="vA7為不合理值或遺漏值".
end if.
Exec.

*vA7R=1,999999999 .
do if not range(vA7R,1,999999999) | sys(vA7R).
compute m111=concat("vA7R=",string(vA7R,f10)).
compute p111="vA7R為不合理值或遺漏值".
end if.
Exec.

*vEND2=20260609000000,20260629000000 99969696969696 .
do if not range(vEND2,20260609000000,20260629000000,99969696969696,99969696969696) | sys(vEND2).
compute m112=concat("vEND2=",string(vEND2,f14)).
compute p112="vEND2為不合理值或遺漏值".
end if.
Exec.

*vB1=1,3 .
do if not range(vB1,1,3) | sys(vB1).
compute m113=concat("vB1=",string(vB1,f2)).
compute p113="vB1為不合理值或遺漏值".
end if.
Exec.

*vB1U=1,999999999 9999999996 .
do if not range(vB1U,1,999999999,9999999996,9999999996) | sys(vB1U).
compute m114=concat("vB1U=",string(vB1U,f10)).
compute p114="vB1U為不合理值或遺漏值".
end if.
Exec.

*vB1D=1,999999999 9999999996 .
do if not range(vB1D,1,999999999,9999999996,9999999996) | sys(vB1D).
compute m115=concat("vB1D=",string(vB1D,f10)).
compute p115="vB1D為不合理值或遺漏值".
end if.
Exec.

*vB2=1,3 .
do if not range(vB2,1,3) | sys(vB2).
compute m116=concat("vB2=",string(vB2,f2)).
compute p116="vB2為不合理值或遺漏值".
end if.
Exec.

*vB2U=1,999999999 9999999996 .
do if not range(vB2U,1,999999999,9999999996,9999999996) | sys(vB2U).
compute m117=concat("vB2U=",string(vB2U,f10)).
compute p117="vB2U為不合理值或遺漏值".
end if.
Exec.

*vB2D=1,999999999 9999999996 .
do if not range(vB2D,1,999999999,9999999996,9999999996) | sys(vB2D).
compute m118=concat("vB2D=",string(vB2D,f10)).
compute p118="vB2D為不合理值或遺漏值".
end if.
Exec.

*vB3=1,3 .
do if not range(vB3,1,3) | sys(vB3).
compute m119=concat("vB3=",string(vB3,f2)).
compute p119="vB3為不合理值或遺漏值".
end if.
Exec.

*vB3U=1,999999999 9999999996 .
do if not range(vB3U,1,999999999,9999999996,9999999996) | sys(vB3U).
compute m120=concat("vB3U=",string(vB3U,f10)).
compute p120="vB3U為不合理值或遺漏值".
end if.
Exec.

*vB3D=1,999999999 9999999996 .
do if not range(vB3D,1,999999999,9999999996,9999999996) | sys(vB3D).
compute m121=concat("vB3D=",string(vB3D,f10)).
compute p121="vB3D為不合理值或遺漏值".
end if.
Exec.

*vB4=1,3 .
do if not range(vB4,1,3) | sys(vB4).
compute m122=concat("vB4=",string(vB4,f2)).
compute p122="vB4為不合理值或遺漏值".
end if.
Exec.

*vB4U=1,999999999 9999999996 .
do if not range(vB4U,1,999999999,9999999996,9999999996) | sys(vB4U).
compute m123=concat("vB4U=",string(vB4U,f10)).
compute p123="vB4U為不合理值或遺漏值".
end if.
Exec.

*vB4D=1,999999999 9999999996 .
do if not range(vB4D,1,999999999,9999999996,9999999996) | sys(vB4D).
compute m124=concat("vB4D=",string(vB4D,f10)).
compute p124="vB4D為不合理值或遺漏值".
end if.
Exec.

*vB5=1,3 .
do if not range(vB5,1,3) | sys(vB5).
compute m125=concat("vB5=",string(vB5,f2)).
compute p125="vB5為不合理值或遺漏值".
end if.
Exec.

*vB5U=1,999999999 9999999996 .
do if not range(vB5U,1,999999999,9999999996,9999999996) | sys(vB5U).
compute m126=concat("vB5U=",string(vB5U,f10)).
compute p126="vB5U為不合理值或遺漏值".
end if.
Exec.

*vB5D=1,999999999 9999999996 .
do if not range(vB5D,1,999999999,9999999996,9999999996) | sys(vB5D).
compute m127=concat("vB5D=",string(vB5D,f10)).
compute p127="vB5D為不合理值或遺漏值".
end if.
Exec.

*vB6=1,3 .
do if not range(vB6,1,3) | sys(vB6).
compute m128=concat("vB6=",string(vB6,f2)).
compute p128="vB6為不合理值或遺漏值".
end if.
Exec.

*vB6U=1,999999999 9999999996 .
do if not range(vB6U,1,999999999,9999999996,9999999996) | sys(vB6U).
compute m129=concat("vB6U=",string(vB6U,f10)).
compute p129="vB6U為不合理值或遺漏值".
end if.
Exec.

*vB6D=1,999999999 9999999996 .
do if not range(vB6D,1,999999999,9999999996,9999999996) | sys(vB6D).
compute m130=concat("vB6D=",string(vB6D,f10)).
compute p130="vB6D為不合理值或遺漏值".
end if.
Exec.

*vB7=1,3 .
do if not range(vB7,1,3) | sys(vB7).
compute m131=concat("vB7=",string(vB7,f2)).
compute p131="vB7為不合理值或遺漏值".
end if.
Exec.

*vB7U=1,999999999 9999999996 .
do if not range(vB7U,1,999999999,9999999996,9999999996) | sys(vB7U).
compute m132=concat("vB7U=",string(vB7U,f10)).
compute p132="vB7U為不合理值或遺漏值".
end if.
Exec.

*vB7D=1,999999999 9999999996 .
do if not range(vB7D,1,999999999,9999999996,9999999996) | sys(vB7D).
compute m133=concat("vB7D=",string(vB7D,f10)).
compute p133="vB7D為不合理值或遺漏值".
end if.
Exec.

*vB7R=1,3 .
do if not range(vB7R,1,3) | sys(vB7R).
compute m134=concat("vB7R=",string(vB7R,f2)).
compute p134="vB7R為不合理值或遺漏值".
end if.
Exec.

*vB7UR=1,999999999 9999999996 .
do if not range(vB7UR,1,999999999,9999999996,9999999996) | sys(vB7UR).
compute m135=concat("vB7UR=",string(vB7UR,f10)).
compute p135="vB7UR為不合理值或遺漏值".
end if.
Exec.

*vB7DR=1,999999999 9999999996 .
do if not range(vB7DR,1,999999999,9999999996,9999999996) | sys(vB7DR).
compute m136=concat("vB7DR=",string(vB7DR,f10)).
compute p136="vB7DR為不合理值或遺漏值".
end if.
Exec.

*vC1=1,3 .
do if not range(vC1,1,3) | sys(vC1).
compute m137=concat("vC1=",string(vC1,f2)).
compute p137="vC1為不合理值或遺漏值".
end if.
Exec.

*vC1U=1,4 96 .
do if not range(vC1U,1,4,96,96) | sys(vC1U).
compute m138=concat("vC1U=",string(vC1U,f2)).
compute p138="vC1U為不合理值或遺漏值".
end if.
Exec.

*vC1U4=3,999 9999999996 .
do if not range(vC1U4,3,999,9999999996,9999999996) | sys(vC1U4).
compute m139=concat("vC1U4=",string(vC1U4,f10)).
compute p139="vC1U4為不合理值或遺漏值".
end if.
Exec.

*vC1U4R=1,2 96 .
do if not range(vC1U4R,1,2,96,96) | sys(vC1U4R).
compute m140=concat("vC1U4R=",string(vC1U4R,f2)).
compute p140="vC1U4R為不合理值或遺漏值".
end if.
Exec.

*vC1D=1,4 96 .
do if not range(vC1D,1,4,96,96) | sys(vC1D).
compute m141=concat("vC1D=",string(vC1D,f2)).
compute p141="vC1D為不合理值或遺漏值".
end if.
Exec.

*vC1D1=-100000,0.49999 9999999996 .
do if not range(vC1D1,-100000,0.49999,9999999996,9999999996) | sys(vC1D1).
compute m142=concat("vC1D1=",string(vC1D1,f10)).
compute p142="vC1D1為不合理值或遺漏值".
end if.
Exec.

*vC1D1R=1,2 96 .
do if not range(vC1D1R,1,2,96,96) | sys(vC1D1R).
compute m143=concat("vC1D1R=",string(vC1D1R,f2)).
compute p143="vC1D1R為不合理值或遺漏值".
end if.
Exec.

*vC3=1,7 96 .
do if not range(vC3,1,7,96,96) | sys(vC3).
compute m144=concat("vC3=",string(vC3,f2)).
compute p144="vC3為不合理值或遺漏值".
end if.
Exec.

*vC2=1,7 96 .
do if not range(vC2,1,7,96,96) | sys(vC2).
compute m145=concat("vC2=",string(vC2,f2)).
compute p145="vC2為不合理值或遺漏值".
end if.
Exec.

*vC2U7=3,999 9999999996 .
do if not range(vC2U7,3,999,9999999996,9999999996) | sys(vC2U7).
compute m146=concat("vC2U7=",string(vC2U7,f6)).
compute p146="vC2U7為不合理值或遺漏值".
end if.
Exec.

*vC2U7R=1,2 96 .
do if not range(vC2U7R,1,2,96,96) | sys(vC2U7R).
compute m147=concat("vC2U7R=",string(vC2U7R,f2)).
compute p147="vC2U7R為不合理值或遺漏值".
end if.
Exec.

*vC2D1=-100000,0.49999 9999999996 .
do if not range(vC2D1,-100000,0.49999,9999999996,9999999996) | sys(vC2D1).
compute m148=concat("vC2D1=",string(vC2D1,f6)).
compute p148="vC2D1為不合理值或遺漏值".
end if.
Exec.

*vC2D1R=1,2 96 .
do if not range(vC2D1R,1,2,96,96) | sys(vC2D1R).
compute m149=concat("vC2D1R=",string(vC2D1R,f2)).
compute p149="vC2D1R為不合理值或遺漏值".
end if.
Exec.

*vD1=1,3 7 96 .
do if not range(vD1,1,3,7,7,96,96) | sys(vD1).
compute m150=concat("vD1=",string(vD1,f2)).
compute p150="vD1為不合理值或遺漏值".
end if.
Exec.

*vD1D=1,5 96 .
do if not range(vD1D,1,5,96,96) | sys(vD1D).
compute m151=concat("vD1D=",string(vD1D,f2)).
compute p151="vD1D為不合理值或遺漏值".
end if.
Exec.

*vD1D5=20,999999 9999996 .
do if not range(vD1D5,20,999999,9999996,9999996) | sys(vD1D5).
compute m152=concat("vD1D5=",string(vD1D5,f7)).
compute p152="vD1D5為不合理值或遺漏值".
end if.
Exec.

*vD1U=1,5 96 .
do if not range(vD1U,1,5,96,96) | sys(vD1U).
compute m153=concat("vD1U=",string(vD1U,f2)).
compute p153="vD1U為不合理值或遺漏值".
end if.
Exec.

*vD1U5=20,999999 9999996 .
do if not range(vD1U5,20,999999,9999996,9999996) | sys(vD1U5).
compute m154=concat("vD1U5=",string(vD1U5,f7)).
compute p154="vD1U5為不合理值或遺漏值".
end if.
Exec.

*vE1=1,3 96 .
do if not range(vE1,1,3,96,96) | sys(vE1).
compute m155=concat("vE1=",string(vE1,f2)).
compute p155="vE1為不合理值或遺漏值".
end if.
Exec.

*vF1m1=0,1 96 .
do if not range(vF1m1,0,1,96,96) | sys(vF1m1).
compute m156=concat("vF1m1=",string(vF1m1,f2)).
compute p156="vF1m1為不合理值或遺漏值".
end if.
Exec.

*vF1m2=0,1 96 .
do if not range(vF1m2,0,1,96,96) | sys(vF1m2).
compute m157=concat("vF1m2=",string(vF1m2,f2)).
compute p157="vF1m2為不合理值或遺漏值".
end if.
Exec.

*vF1m3=0,1 96 .
do if not range(vF1m3,0,1,96,96) | sys(vF1m3).
compute m158=concat("vF1m3=",string(vF1m3,f2)).
compute p158="vF1m3為不合理值或遺漏值".
end if.
Exec.

*vF1m4=0,1 96 .
do if not range(vF1m4,0,1,96,96) | sys(vF1m4).
compute m159=concat("vF1m4=",string(vF1m4,f2)).
compute p159="vF1m4為不合理值或遺漏值".
end if.
Exec.

*vF1m5=0,1 96 .
do if not range(vF1m5,0,1,96,96) | sys(vF1m5).
compute m160=concat("vF1m5=",string(vF1m5,f2)).
compute p160="vF1m5為不合理值或遺漏值".
end if.
Exec.

*vF1m6=0,1 96 .
do if not range(vF1m6,0,1,96,96) | sys(vF1m6).
compute m161=concat("vF1m6=",string(vF1m6,f2)).
compute p161="vF1m6為不合理值或遺漏值".
end if.
Exec.

*vF1m7=0,1 96 .
do if not range(vF1m7,0,1,96,96) | sys(vF1m7).
compute m162=concat("vF1m7=",string(vF1m7,f2)).
compute p162="vF1m7為不合理值或遺漏值".
end if.
Exec.

*vF1m8=0,1 96 .
do if not range(vF1m8,0,1,96,96) | sys(vF1m8).
compute m163=concat("vF1m8=",string(vF1m8,f2)).
compute p163="vF1m8為不合理值或遺漏值".
end if.
Exec.

*vF1m9=0,1 96 .
do if not range(vF1m9,0,1,96,96) | sys(vF1m9).
compute m164=concat("vF1m9=",string(vF1m9,f2)).
compute p164="vF1m9為不合理值或遺漏值".
end if.
Exec.

*vF1m10=0,1 96 .
do if not range(vF1m10,0,1,96,96) | sys(vF1m10).
compute m165=concat("vF1m10=",string(vF1m10,f2)).
compute p165="vF1m10為不合理值或遺漏值".
end if.
Exec.

*vF1m11=0,1 96 .
do if not range(vF1m11,0,1,96,96) | sys(vF1m11).
compute m166=concat("vF1m11=",string(vF1m11,f2)).
compute p166="vF1m11為不合理值或遺漏值".
end if.
Exec.

*vF1_1=1,5 96 .
do if not range(vF1_1,1,5,96,96) | sys(vF1_1).
compute m167=concat("vF1_1=",string(vF1_1,f2)).
compute p167="vF1_1為不合理值或遺漏值".
end if.
Exec.

*vF1_2=1,5 96 .
do if not range(vF1_2,1,5,96,96) | sys(vF1_2).
compute m168=concat("vF1_2=",string(vF1_2,f2)).
compute p168="vF1_2為不合理值或遺漏值".
end if.
Exec.

*vF1_3=1,5 96 .
do if not range(vF1_3,1,5,96,96) | sys(vF1_3).
compute m169=concat("vF1_3=",string(vF1_3,f2)).
compute p169="vF1_3為不合理值或遺漏值".
end if.
Exec.

*vF2m1=0,1 96 .
do if not range(vF2m1,0,1,96,96) | sys(vF2m1).
compute m170=concat("vF2m1=",string(vF2m1,f2)).
compute p170="vF2m1為不合理值或遺漏值".
end if.
Exec.

*vF2m2=0,1 96 .
do if not range(vF2m2,0,1,96,96) | sys(vF2m2).
compute m171=concat("vF2m2=",string(vF2m2,f2)).
compute p171="vF2m2為不合理值或遺漏值".
end if.
Exec.

*vF2m3=0,1 96 .
do if not range(vF2m3,0,1,96,96) | sys(vF2m3).
compute m172=concat("vF2m3=",string(vF2m3,f2)).
compute p172="vF2m3為不合理值或遺漏值".
end if.
Exec.

*vF2m4=0,1 96 .
do if not range(vF2m4,0,1,96,96) | sys(vF2m4).
compute m173=concat("vF2m4=",string(vF2m4,f2)).
compute p173="vF2m4為不合理值或遺漏值".
end if.
Exec.

*vF2m5=0,1 96 .
do if not range(vF2m5,0,1,96,96) | sys(vF2m5).
compute m174=concat("vF2m5=",string(vF2m5,f2)).
compute p174="vF2m5為不合理值或遺漏值".
end if.
Exec.

*vF2m6=0,1 96 .
do if not range(vF2m6,0,1,96,96) | sys(vF2m6).
compute m175=concat("vF2m6=",string(vF2m6,f2)).
compute p175="vF2m6為不合理值或遺漏值".
end if.
Exec.

*vF2m7=0,1 96 .
do if not range(vF2m7,0,1,96,96) | sys(vF2m7).
compute m176=concat("vF2m7=",string(vF2m7,f2)).
compute p176="vF2m7為不合理值或遺漏值".
end if.
Exec.

*vF2m8=0,1 96 .
do if not range(vF2m8,0,1,96,96) | sys(vF2m8).
compute m177=concat("vF2m8=",string(vF2m8,f2)).
compute p177="vF2m8為不合理值或遺漏值".
end if.
Exec.

*vF2m9=0,1 96 .
do if not range(vF2m9,0,1,96,96) | sys(vF2m9).
compute m178=concat("vF2m9=",string(vF2m9,f2)).
compute p178="vF2m9為不合理值或遺漏值".
end if.
Exec.

*vF2m10=0,1 96 .
do if not range(vF2m10,0,1,96,96) | sys(vF2m10).
compute m179=concat("vF2m10=",string(vF2m10,f2)).
compute p179="vF2m10為不合理值或遺漏值".
end if.
Exec.

*vF2m11=0,1 96 .
do if not range(vF2m11,0,1,96,96) | sys(vF2m11).
compute m180=concat("vF2m11=",string(vF2m11,f2)).
compute p180="vF2m11為不合理值或遺漏值".
end if.
Exec.

*vF3=1,3 .
do if not range(vF3,1,3) | sys(vF3).
compute m181=concat("vF3=",string(vF3,f2)).
compute p181="vF3為不合理值或遺漏值".
end if.
Exec.

*vF4=1,3 .
do if not range(vF4,1,3) | sys(vF4).
compute m182=concat("vF4=",string(vF4,f2)).
compute p182="vF4為不合理值或遺漏值".
end if.
Exec.

*vF5=1,4 .
do if not range(vF5,1,4) | sys(vF5).
compute m183=concat("vF5=",string(vF5,f2)).
compute p183="vF5為不合理值或遺漏值".
end if.
Exec.

*vF6=1,4 .
do if not range(vF6,1,4) | sys(vF6).
compute m184=concat("vF6=",string(vF6,f2)).
compute p184="vF6為不合理值或遺漏值".
end if.
Exec.

*vF7=1,5 .
do if not range(vF7,1,5) | sys(vF7).
compute m185=concat("vF7=",string(vF7,f2)).
compute p185="vF7為不合理值或遺漏值".
end if.
Exec.

*vG1=21,95 .
do if not range(vG1,21,95) | sys(vG1).
compute m186=concat("vG1=",string(vG1,f3)).
compute p186="vG1為不合理值或遺漏值".
end if.
Exec.

*vG2=1,6 .
do if not range(vG2,1,6) | sys(vG2).
compute m187=concat("vG2=",string(vG2,f2)).
compute p187="vG2為不合理值或遺漏值".
end if.
Exec.

*vG3=1,5 .
do if not range(vG3,1,5) | sys(vG3).
compute m188=concat("vG3=",string(vG3,f2)).
compute p188="vG3為不合理值或遺漏值".
end if.
Exec.

*vG4=0,999999 .
do if not range(vG4,0,999999) | sys(vG4).
compute m189=concat("vG4=",string(vG4,f3)).
compute p189="vG4為不合理值或遺漏值".
end if.
Exec.

*vG5=1,2 .
do if not range(vG5,1,2) | sys(vG5).
compute m190=concat("vG5=",string(vG5,f2)).
compute p190="vG5為不合理值或遺漏值".
end if.
Exec.

*vG6=1,5 .
do if not range(vG6,1,5) | sys(vG6).
compute m191=concat("vG6=",string(vG6,f2)).
compute p191="vG6為不合理值或遺漏值".
end if.
Exec.

*vG7=0,999999 .
do if not range(vG7,0,999999) | sys(vG7).
compute m192=concat("vG7=",string(vG7,f3)).
compute p192="vG7為不合理值或遺漏值".
end if.
Exec.

*vX1=1,2 .
do if not range(vX1,1,2) | sys(vX1).
compute m193=concat("vX1=",string(vX1,f2)).
compute p193="vX1為不合理值或遺漏值".
end if.
Exec.

*vEND3=20260609000000,20260629000000 .
do if not range(vEND3,20260609000000,20260629000000) | sys(vEND3).
compute m194=concat("vEND3=",string(vEND3,f14)).
compute p194="vEND3為不合理值或遺漏值".
end if.
Exec.

* SYNTAXWORK_END_NUMERIC.
