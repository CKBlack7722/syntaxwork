* Encoding: UTF-8.
*淨零資料檢核.
*資料處理 讀a檔合併會員資料.
GET FILE="\\140.109.171.240\worker\worker_sec\網調協辦計畫\W202606 邁向淨零社會_永續能源創新科技的公眾支持\02資料檔及不符合品\02資料檔\01原始\0527\data_a.sav".
compute id=Rtrim(Ltrim(id)).
SORT CASES by id.
ALTER TYPE id (A20).
*補上wendtime的時間.
do if sys(wendtime).
compute wendtime = vEND.
end if.
EXECUTE.

save outfile="\\140.109.171.240\worker\worker_sec\網調協辦計畫\W202606 邁向淨零社會_永續能源創新科技的公眾支持\02資料檔及不符合品\02資料檔\02修改後\0527\data_a.sav"
/COMPRESSED.

MATCH FILES
  /FILE="\\140.109.171.240\worker\worker_sec\網調協辦計畫\W202606 邁向淨零社會_永續能源創新科技的公眾支持\02資料檔及不符合品\02資料檔\02修改後\0527\data_a.sav"
  /FILE="\\140.109.171.240\worker\worker_sec\網調協辦計畫\W202606 邁向淨零社會_永續能源創新科技的公眾支持\01樣本\第19-25套_分組.sav"
  /FILE="\\140.109.171.240\worker\worker_sec\網調協辦計畫\W202606 邁向淨零社會_永續能源創新科技的公眾支持\02資料檔及不符合品\04問卷品質\W202606_問卷填答時長_問卷品質.sav"
  /BY id.

*答案修改.
if id="008878G25" vZ1town=970.
*5/27.
if id="005977G22" v19=06.
if id="005309I21" v19o06="75".
if id="000212K04" v27o07="10".
if id="009160J25" v50=4.
if id="008514C25" v51=03.
if id="002088K10" v51=03.
if id="007779F24" v52=1.
if id="005076G21" v52=11.
if id="007205I23" v52=3.
if id="002918D19" v69=10.
if id="003965F20" v69=10.
if id="007999H24" v69=15.
if id="000363K05" v71_2s1="".
if id="006153I22" v71_2s1="拒答".
if id="005259I21" v71_2s1="拒答".
if id="004588B21" v71_2s1="拒答".
if id="006488B23" v71_2s1="拒答".
if id="002639A19" v71_2s1="拒答".
if id="000161K04" v71_2s1="拒答".
if id="002670B19" v71_2s1="拒答".
if id="002908D19" v71_2s1="拒答".
if id="004300I20" v71_2s1="拒答".
if id="007375A24" v71_2s1="拒答".
if id="003564A20" v71_2s1="拒答".
if id="006725D23" v71_2s1="拒答".
if id="003805D20" v71_2s1="拒答".
if id="007716F24" v71_2s1="拒答".
if id="006740F23" v71_2s1="拒答".
if id="003095G19" v71_2s1="拒答".
if id="009162J25" v71_2s1="拒答".
if id="000363K05" v71_2s2="".
if id="004947F21" v71_2s2="拒答".
if id="005778D22" v71_2s2="拒答".
if id="006153I22" v71_2s2="拒答".
if id="003429J19" v71_2s2="拒答".
if id="004919F21" v71_2s2="拒答".
if id="005259I21" v71_2s2="拒答".
if id="004588B21" v71_2s2="拒答".
if id="006488B23" v71_2s2="拒答".
if id="002639A19" v71_2s2="拒答".
if id="007466B24" v71_2s2="拒答".
if id="009132J25" v71_2s2="拒答".
if id="002577A19" v71_2s2="拒答".
if id="002671B19" v71_2s2="拒答".
if id="002858D19" v71_2s2="拒答".
if id="000161K04" v71_2s2="拒答".
if id="002670B19" v71_2s2="拒答".
if id="002908D19" v71_2s2="拒答".
if id="004300I20" v71_2s2="拒答".
if id="007375A24" v71_2s2="拒答".
if id="008316A25" v71_2s2="拒答".
if id="002757C19" v71_2s2="拒答".
if id="006145I22" v71_2s2="拒答".
if id="003564A20" v71_2s2="拒答".
if id="006725D23" v71_2s2="拒答".
if id="003805D20" v71_2s2="拒答".
if id="007716F24" v71_2s2="拒答".
if id="006173I22" v71_2s2="拒答".
if id="006740F23" v71_2s2="拒答".
if id="004124G20" v71_2s2="拒答".
if id="003095G19" v71_2s2="拒答".
if id="006078H22" v71_2s2="拒答".
if id="007850G24" v71_2s2="拒答".
if id="008873G25" v71_2s2="拒答".
if id="007337A24" v71_2s2="拒答".
if id="005655C22" v71_2s2="拒答".
if id="007272J23" v71_2s2="拒答".
if id="007030H23" v71_2s2="拒答".
if id="009185J25" v71_2s2="拒答".
if id="009162J25" v71_2s2="拒答".
if id="007978H24" v71_2s2="拒答".
if id="001054K07" v71_2s2="拒答".
if id="009080I25" v71_2s2="拒答".
if id="005076G21" v71_2s2="拒答".
if id="002717B19" v71_2s2="拒答".
if id="007484C24" v71_2s2="拒答".
if id="008357B25" v71_2s2="拒答".
if id="000363K05" v71_2s3="".
if id="004947F21" v71_2s3="拒答".
if id="005259I21" v71_2s3="拒答".
if id="004588B21" v71_2s3="拒答".
if id="006488B23" v71_2s3="拒答".
if id="002639A19" v71_2s3="拒答".
if id="002577A19" v71_2s3="拒答".
if id="000161K04" v71_2s3="拒答".
if id="002670B19" v71_2s3="拒答".
if id="002908D19" v71_2s3="拒答".
if id="004300I20" v71_2s3="拒答".
if id="007375A24" v71_2s3="拒答".
if id="006145I22" v71_2s3="拒答".
if id="003564A20" v71_2s3="拒答".
if id="006725D23" v71_2s3="拒答".
if id="003805D20" v71_2s3="拒答".
if id="007716F24" v71_2s3="拒答".
if id="003095G19" v71_2s3="拒答".
if id="004749D21" v71_2s3="拒答".
if id="006173I22" v71_2s3="拒答".
if id="007850G24" v71_2s3="拒答".
if id="008873G25" v71_2s3="拒答".
if id="009185J25" v71_2s3="拒答".
if id="007978H24" v71_2s3="拒答".
if id="007484C24" v71_2s3="拒答".
if id="003867D20" v71_2s3="拒答".
if id="000363K05" v71_2s4="".
if id="004947F21" v71_2s4="拒答".
if id="004688C21" v71_2s4="拒答".
if id="006153I22" v71_2s4="拒答".
if id="005259I21" v71_2s4="拒答".
if id="005642C22" v71_2s4="拒答".
if id="007783F24" v71_2s4="拒答".
if id="004588B21" v71_2s4="拒答".
if id="006488B23" v71_2s4="拒答".
if id="002639A19" v71_2s4="拒答".
if id="002577A19" v71_2s4="拒答".
if id="005778D22" v71_2s4="拒答".
if id="002858D19" v71_2s4="拒答".
if id="000161K04" v71_2s4="拒答".
if id="002670B19" v71_2s4="拒答".
if id="002908D19" v71_2s4="拒答".
if id="004300I20" v71_2s4="拒答".
if id="007375A24" v71_2s4="拒答".
if id="006145I22" v71_2s4="拒答".
if id="003564A20" v71_2s4="拒答".
if id="006725D23" v71_2s4="拒答".
if id="003805D20" v71_2s4="拒答".
if id="007716F24" v71_2s4="拒答".
if id="003095G19" v71_2s4="拒答".
if id="004749D21" v71_2s4="拒答".
if id="006173I22" v71_2s4="拒答".
if id="007540C24" v71_2s4="拒答".
if id="007850G24" v71_2s4="拒答".
if id="008873G25" v71_2s4="拒答".
if id="006755F23" v71_2s4="拒答".
if id="007235J23" v71_2s4="拒答".
if id="003733C20" v71_2s4="拒答".
if id="007944H24" v71_2s4="拒答".
if id="009185J25" v71_2s4="拒答".
if id="007978H24" v71_2s4="拒答".
if id="001352K08" v71_2s4="拒答".
if id="003716C20" v71_2s4="拒答".
if id="007484C24" v71_2s4="拒答".
if id="002717B19" v71_2s4="拒答".
if id="003867D20" v71_2s4="拒答".
if id="005905G22" v71_2s4="拒答".
if id="007593D24" v71_2s4="拒答".
if id="005655C22" v71_2s4="無".
if id="004680C21" v71_2s4="業務部門".
if id="001829K09" v74=4.
if id="006488B23" v75o05="拒答".
if id="004300I20" v75o05="拒答".
if id="009185J25" v75o05="拒答".
if id="005603C22" v13o05="或許，最靠近生活的空氣汙染不是以上這些，而很可能是生活區的餐飲業油煙或露天燃燒、交通工具".
if id="004608B21" v13=1.
if id="004204H20" v27o07="10".
if id="005322J21" v27=1.
if id="004663C21" v27o08="應另立獎勵機制，而非一昧要求企業多付碳費，鼓勵符合政府訂定標準(如環保標準)的企業可享折扣".
if id="000162K04" v28=6.	
if id="000162K04" v28o07="".
if id="002019K10" v28=1.
if id="002616A19" v28=1.
if id="002839C19" v28=1.
if id="007473B24" v28=1.
if id="008667F25" v28=1.
if id="003798D20" v28=1.
if id="003010F19" v28=1.
if id="005753D22" v28=1.
if id="002688B19" v28=1.
if id="000009K04" v28=1.
if id="004758D21" v28o08="你要有措施保護大眾阿 不能只想漲價 隨著時間通膨是應該的 只是薪資呢？".
if id="007525C24" v28=1.
if id="006733D23" v28o08="現在問題是政府取消核能導致物價上漲，這是非常愚昧無知的政策，明明知道台灣依賴高耗能產業還要搞無核政策".
if id="003172G19" v29=1.
if id="007473B24" v29=1.
if id="007025H23" v29=1.
if id="004608B21" v29=1.
if id="005948G22" v29=1.
if id="004758D21" v29=1.
if id="004914F21" v29=1.
if id="001473K08" v29o08="耗能越高的產業能源稅應該越高 但對於門民生必須品的生產行業 應該給予最低稅賦".
if id="004768D21" v29=1.
if id="001738K09" v2=3.
if id="001870K09" v45m06=0.
if id="003736C20" v45m06=0.
if id="005383J21" v45m06=0.
if id="002808C19" v45m06=0.
if id="005731D22" v45m06=0.
if id="004663C21" v45m06=0.
if id="007933H24" v45m06=0.
if id="001959K10" v50=4.
if id="001304K08" v50=4.
if id="003166G19" v50=01.
if id="003800D20" v50=4.
if id="000844K06" v50=01.
if id="000844K06" v51o07="".
if id="001326K08" v50=4.
if id="005217I21" v52=9.
if id="000702K06" v52=9.
if id="005691D22" v52=9.
if id="005625C22" v57=3.
if id="005396J21" v57=3.
if id="008343A25" v57=3.
if id="003969F20" v57=3.
if id="003798D20" v57=3.
if id="007379A24" v57=3.
if id="004208H20" v57=3.
if id="005282I21" v57=3.
if id="000514K05" v57=3.
if id="005394J21" v57=3.
if id="005856F22" v57o04="選擇對人民、國家最有利的狀態，依現今大國政治的傾向，我認為繼續維持現狀並非最好選擇，小國在國際生存困難".
if id="004390J20" v58=03.
if id="003167G19" v58=04.
if id="004525A21" v58=04.
if id="001387K08" v58=04.
if id="001451K08" v59=11.
if id="000294K04" v69=13.
if id="001368K08" v70=3.
if id="000722K06" v70=4.
if id="001277K07" v70=4.
if id="005153H21" v70=1.
if id="003756C20" v70=6.
if id="007779F24" v70=1.
if id="005557B22" v71_1=5.
if id="000363K05" v70=6.
if id="000363K05" v71_1=96.
if id="000954K06" v71_1=7.
if id="001414K08" v71_1=6.
if id="001018K07" v71_1=7.
if id="004460J20" v71_1=7.
if id="007779F24" v71_1=7.
if id="003375I19" v71_1=7.
if id="007748F24" v71_1=5.
if id="003756C20" v71_1=96.
if id="003756C20" v71_2s1="".
if id="003756C20" v71_2s2="".
if id="003756C20" v71_2s3="".
if id="003756C20" v71_2s4="".
if id="004862F21" v74=5.
if id="002086K10" v75=4.
if id="004183H20" v75=4.
if id="004530A21" v75=4.
if id="005003G21" v75=4.
if id="006471B23" v75=4.
if id="004768D21" v75=4.
if id="003824D20" v75=4.
if id="000294K04" v75=4.
if id="005977G22" v19o06="不清楚不便回答".
if id="009160J25" v50o05="".
if id="008514C25" v51o07="".
if id="002088K10" v51o07="".
if id="007779F24" v52o11="".
if id="005076G21" v52o11="拒答".
if id="007205I23" v52o11="".
if id="002918D19" v69o15="".
if id="003965F20" v69o15="".
if id="007999H24" v69o15="空中商專".
if id="001829K09" v74o09="".
if id="004608B21" v13o05="".
if id="005322J21" v27o08="".
if id="002019K10" v28o08="".
if id="002616A19" v28o08="".
if id="002839C19" v28o08="".
if id="007473B24" v28o08="".
if id="008667F25" v28o08="".
if id="003798D20" v28o08="".
if id="003010F19" v28o08="".
if id="005753D22" v28o08="".
if id="002688B19" v28o08="".
if id="000009K04" v28o08="".
if id="007525C24" v28o08="".
if id="003172G19" v29o08="".
if id="007473B24" v29o08="".
if id="007025H23" v29o08="".
if id="004608B21" v29o08="".
if id="005948G22" v29o08="".
if id="004758D21" v29o08="".
if id="004914F21" v29o08="".
if id="004768D21" v29o08="".
if id="001738K09" v2o14="".
if id="001870K09" v45o06="".
if id="003736C20" v45o06="".
if id="005383J21" v45o06="".
if id="002808C19" v45o06="".
if id="005731D22" v45o06="".
if id="004663C21" v45o06="".
if id="007933H24" v45o06="".
if id="001959K10" v50o05="".
if id="001304K08" v50o05="".
if id="003166G19" v50o05="".
if id="003800D20" v50o05="".
if id="000844K06" v50o05="".
if id="001326K08" v50o05="".
if id="005217I21" v52o11="".
if id="000702K06" v52o11="".
if id="005691D22" v52o11="".
if id="005625C22" v57o04="".
if id="005396J21" v57o04="".
if id="008343A25" v57o04="".
if id="003969F20" v57o04="".
if id="003798D20" v57o04="".
if id="007379A24" v57o04="".
if id="004208H20" v57o04="".
if id="005282I21" v57o04="".
if id="000514K05" v57o04="".
if id="005394J21" v57o04="".
if id="004390J20" v58o05="".
if id="003167G19" v58o05="".
if id="004525A21" v58o05="".
if id="001387K08" v58o05="".
if id="001451K08" v59o08="".
if id="000294K04" v69o15="".
if id="001368K08" v70o10="".
if id="000722K06" v70o10="".
if id="001277K07" v70o10="".
if id="005153H21" v70o10="".
if id="003756C20" v70o10="".
if id="007779F24" v70o10="".
if id="005557B22" v71_1o10="".
if id="000363K05" v71_1o10="".
if id="000954K06" v71_1o10="".
if id="001414K08" v71_1o10="".
if id="001018K07" v71_1o10="".
if id="004460J20" v71_1o10="".
if id="007779F24" v71_1o10="".
if id="003375I19" v71_1o10="".
if id="007748F24" v71_1o10="".
if id="003756C20" v71_1o10="".
if id="004862F21" v74o09="".
if id="002086K10" v75o05="".
if id="004183H20" v75o05="".
if id="004530A21" v75o05="".
if id="005003G21" v75o05="".
if id="006471B23" v75o05="".
if id="004768D21" v75o05="".
if id="003824D20" v75o05="".
if id="000294K04" v75o05="".
if id="001870K09" v45m04=1.
if id="003736C20" v45m04=1.
if id="005383J21" v45m04=1.
if id="002808C19" v45m04=1.
if id="005731D22" v45m04=1.
if id="004663C21" v45m04=1.
if id="007933H24" v45m04=1.
if id="005625C22" v58=1.
if id="005396J21" v58=4.
if id="008343A25" v58=1.
if id="003969F20" v58=1.
if id="003798D20" v58=1.
if id="007379A24" v58=1.
if id="004208H20" v58=1.
if id="005282I21" v58=1.
if id="000514K05" v58=1.
if id="005394J21" v58=2.
if id="003166G19" v51=96.
if id="000844K06" v51=96.
if id="003756C20" v71_2s1="96".
if id="003756C20" v71_2s2="96".
if id="003756C20" v71_2s3="96".
if id="003756C20" v71_2s4="96".
if id="001277K07" vZ2city=96.
if id="003756C20" vZ2city=96.
if id="000722K06" vZ2city=96.
if id="000363K05" v71_2s1="96".
if id="000363K05" v71_2s2="96".
if id="000363K05" v71_2s3="96".
if id="000363K05" v71_2s4="96".
if id="005575B22" v71_2s4="拒答".
if id="001730K09" v69=13.
if id="001730K09" v69o15="".

EXECUTE.
*給計畫備註.
STRING notes (A150).
if id="001478K08" notes="主動來電要求查看33_3情境內容".
if id="000946K06" notes="v49居住地區的年數超過受訪者年齡3歲".
if id="003713C20" notes="v49居住地區的年數超過受訪者年齡3歲".
if id="003843D20" notes="v49居住地區的年數超過受訪者年齡3歲".
if id="004221H20" notes="v49居住地區的年數超過受訪者年齡3歲".
if id="008829G25" notes="v49居住地區的年數超過受訪者年齡3歲".
if id="005062G21" notes="此案每天平均上網時間超過16小時".
if id="000725K06" notes="此案每天平均上網時間超過16小時".
if id="003514J19" notes="此案每天平均上網時間超過16小時".
if id="003555A20" notes="此案每天平均上網時間超過16小時".
if id="005515B22" notes="此案每天平均上網時間超過16小時".
if id="005899F22" notes="此案每天平均上網時間超過16小時".
if id="005944G22" notes="此案每天平均上網時間超過16小時".
if id="002582A19" notes="此案每天平均上網時間超過16小時".
if id="003074G19" notes="此案每天平均上網時間超過16小時".
if id="003106G19" notes="此案每天平均上網時間超過16小時".
if id="003128G19" notes="此案每天平均上網時間超過16小時".
if id="003628B20" notes="此案每天平均上網時間超過16小時".
if id="003680B20" notes="此案每天平均上網時間超過16小時".
if id="003694C20" notes="此案每天平均上網時間超過16小時".
if id="003860D20" notes="此案每天平均上網時間超過16小時".
if id="005682C22" notes="此案每天平均上網時間超過16小時".
if id="005732D22" notes="此案每天平均上網時間超過16小時".
if id="005979G22" notes="此案每天平均上網時間超過16小時".
if id="006073H22" notes="此案每天平均上網時間超過16小時".
if id="006703D23" notes="此案每天平均上網時間超過16小時".
if id="007145I23" notes="此案每天平均上網時間超過16小時".
if id="007903G24" notes="此案每天平均上網時間超過16小時".
if id="008222J24" notes="此案每天平均上網時間超過16小時".
if id="001501K08" notes="此案每天平均上網時間超過16小時".
if id="000139K04" notes="此案每天平均上網時間超過16小時".
if id="003784C20" notes="此案每天平均上網時間超過16小時".
if id="005825F22" notes="此案每天平均上網時間超過16小時".
if id="004137H20" notes="此案每天平均上網時間超過16小時".
if id="002963F19" notes="此案每天平均上網時間超過16小時".
if id="004670C21" notes="此案每天平均上網時間超過16小時".
if id="005734D22" notes="此案每天平均上網時間超過16小時".
if id="006450B23" notes="此案每天平均上網時間超過16小時".
if id="004755D21" notes="此案每天平均上網時間超過16小時".
if id="002032K10" notes="此案每天平均上網時間超過16小時".
if id="002841C19" notes="此案每天平均上網時間超過16小時".
if id="001108K07" notes="此案每天平均上網時間超過16小時".
if id="001166K07" notes="此案每天平均上網時間超過16小時".
if id="007712F24" notes="此案每天平均上網時間超過16小時".
if id="002812C19" notes="此案每天平均上網時間超過16小時".
if id="002669B19" notes="此案每天平均上網時間超過16小時".
if id="002709B19" notes="此案每天平均上網時間超過16小時".
if id="003814D20" notes="此案每天平均上網時間超過16小時".
if id="003831D20" notes="此案每天平均上網時間超過16小時".
if id="005076G21" notes="此案每天平均上網時間超過16小時".
if id="006430A23" notes="此案每天平均上網時間超過16小時".
if id="008880G25" notes="此案每天平均上網時間超過16小時".
if id="003341I19" notes="此案教育程度為(01)無".
if id="007404B24" notes="此案教育程度為(01)無".
if id="005096H21" notes="v70填答有工作，且不為沒有拿薪水，但v72個人平均每個月收入為(01)沒有收入".
if id="000213K04" notes="v70填答有工作，且不為沒有拿薪水，但v72個人平均每個月收入為(01)沒有收入".
if id="003923F20" notes="v70填答有工作，且不為沒有拿薪水，但v72個人平均每個月收入為(01)沒有收入".
if id="007375A24" notes="v70填答有工作，且不為沒有拿薪水，但v72個人平均每個月收入為(01)沒有收入".
if id="007838G24" notes="v70填答有工作，且不為沒有拿薪水，但v72個人平均每個月收入為(01)沒有收入".
if id="006314J22" notes="v70填答有工作，且不為沒有拿薪水，但v72個人平均每個月收入為(01)沒有收入".
if id="001899K09" notes="v70填答有工作，且不為沒有拿薪水，但v72個人平均每個月收入為(01)沒有收入".
EXECUTE.
***************************************************************.
*wlast_new.
NUMERIC wlast_new (F2.0).
DO IF NOT SYSMIS(vEND).
        COMPUTE wlast_new = 1.
ELSE IF NOT SYSMIS(v0).
    COMPUTE wlast_new = 4.
ELSE.
    COMPUTE wlast_new = 5.
END IF.
EXECUTE.
variable labels
wlast_new "填答結果".

value labels
wlast_new
1 "完成填答_成功樣本"
2 "部分填答_成功樣本"
3 "因故列為失敗案_未通過計畫品質條件_失敗案"
4 "部分填答_失敗樣本"
5 "未填答"/.
FREQUENCIES wlast_new.
EXECUTE.
***************************************************************.
*網路會員調查(必做)：人口變項比對，僅產生識別變項.
***************************************************************.
*性別不一致 gender2026. 
  do if any(v0,1,2) & any(gender2026,1,2) & gender2026~=v0 & not sys(vEND).
  compute CKgender=1.
  else if not sys(vEND).
  compute CKgender=0.
  end if.

  variable labels
  CKgender "人口特徵不一致_性別".
  value labels
  CKgender 1 "不一致" 0 "一致".
*****************************.
*****************************.
*年次不一致 birth2026.
  do if birth2026~=v1  & not sys(vEND).
  compute CKbirth=1.
  else if not sys(vEND).
  compute CKbirth=0.
  end if.

  variable labels
  CKbirth "人口特徵不一致_年次".
  value labels
  CKbirth 1 "不一致" 0 "一致".
*****************************.
*****************************.
*教育程度下降或上升2級.
*edu2026分類如后：2未上學但識字   3小學  4國（初）中/初職  5高中職  6五專/二專/三專  7技術學院/大學  8碩博士  9其他，請說明 98 拒答 .

do if range(edu2026,2,8) & range(v69,1,15) & ((any(v69,1,2,3)&any(edu2026,4,5,6,7,8))|(any(v69,4,5)&any(edu2026,5,6,7,8))|(any(v69,6,7,8)&any(edu2026,6,7,8))|
    (any(v69,9,10,11,12,13)&any(edu2026,8))|(range(v69,6,8)&any(edu2026,2,3))|(range(v69,9,13) & any(edu2026,4))|(any(v69,14)&any(edu2026,5))) & not sys(vEND).
  compute CKedu=1.
  else if not sys(vEND).
  compute CKedu=0.
  end if.

  variable labels
  CKedu "人口特徵不一致_教育程度".
  value labels
  CKedu 1 "不一致" 0 "一致".

*****************************.
*****************************.
*婚姻狀況由「已婚」變為「未婚」 marry2026 ( 1從未結婚   2同居  3已婚  4離婚  5分居  6喪偶 98 拒答)-本次無婚姻.
do if any(marry2026 ,3,4,5,6) & any(v73,1) & not sys(vEND).
compute CKmarry=1.
else if not sys(vEND).
compute CKmarry=0.
end if.
exec.

variable labels
  CKmarry "人口特徵不一致_婚姻狀況".
value labels
  CKmarry 1 "不一致" 0 "一致".


do if CKgender=1 | CKbirth=1 | CKedu=1 | CKmarry=1.
compute success=0.
else if not sys(vEND).
compute success=1.
end if.

  variable labels
  success "會員資料填答結果判定".
  value labels
  success 1 "人口特徵全部一致" 0 "人口特徵任一不一致標記".
exec.


***************************************************************.
*判斷注意力檢測題-.
***************************************************************.
do if ((b=1 & v34=1 & v35=1) | (b=2 & v34=1 & v35=2) | (b=3 & v34=2 & v35=1) | (b=4 & v34=2 & v35=2) | (b=5 & v34=4 & v35=4)) & not sys(vEND).
compute attention_ACQ=0.
else if  not sys(vEND).
compute attention_ACQ=1.
end if.
exec.

do if ((b=1 & v34=1) | (b=2 & v34=1) | (b=3 & v34=2) | (b=4 & v34=2) | (b=5 & v34=4 )) & not sys(vEND).
compute ACQ34=0.
else if  not sys(vEND).
compute ACQ34=1.
end if.

do if ((b=1 & v35=1) | (b=2 & v35=2) | (b=3 & v35=1) | (b=4 & v35=2) | (b=5 & v35=4)) & not sys(vEND).
compute ACQ35=0.
else if not sys(vEND).
compute ACQ35=1.
end if.

do if ACQ34=0 | ACQ35=0.
compute ACQ3435=0.
else if  not sys(vEND).
compute ACQ3435=1.
end if.
exec.

  variable labels
  notes "備註"
  attention_ACQ "完整2題注意力檢測題是否通過"
  ACQ3435 "34或35注意力檢測題是否通過".
  value labels
  attention_ACQ 1 "未通過" 0 "通過"/
  ACQ3435 1 "未通過" 0 "通過".

ALTER TYPE CKgender CKbirth CKedu CKmarry success attention_ACQ ACQ34 ACQ35 ACQ3435 (F2.0).

save outfile="\\140.109.171.240\worker\worker_sec\網調協辦計畫\W202606 邁向淨零社會_永續能源創新科技的公眾支持\02資料檔及不符合品\02資料檔\02修改後\結束處理\data_a.sav"
/COMPRESSED.

*篩出s檔.
GET FILE="\\140.109.171.240\worker\worker_sec\網調協辦計畫\W202606 邁向淨零社會_永續能源創新科技的公眾支持\02資料檔及不符合品\02資料檔\02修改後\結束處理\data_a.sav".
SELECT IF not sys(vEND).
NUMERIC v49f (F3.0).
VARIABLE LABELS
v49f "v49最終合併答案".

compute v49f=vCK49.
do if any(vCK49,996).
compute v49f=v49.
end if.

fre v49f.

save outfile="\\140.109.171.240\worker\worker_sec\網調協辦計畫\W202606 邁向淨零社會_永續能源創新科技的公眾支持\02資料檔及不符合品\02資料檔\02修改後\結束處理\data_s.sav"
/COMPRESSED.

*處理給計畫的s檔.
*調查期間的資料檔，不用給歷次寄發紀錄等變項，id+問卷資料＋注意力檢測題識別變項（此計畫可能會看注意力檢測題通過狀況評估，特別加入）.
GET FILE="\\140.109.171.240\worker\worker_sec\網調協辦計畫\W202606 邁向淨零社會_永續能源創新科技的公眾支持\02資料檔及不符合品\02資料檔\02修改後\結束處理\data_s.sav".

save outfile="\\140.109.171.240\worker\worker_sec\網調協辦計畫\W202606 邁向淨零社會_永續能源創新科技的公眾支持\02資料檔及不符合品\02資料檔\03給計畫\結束處理\data_s.sav"
/drop name email cellphone ic ip1 ip2 ip3 ip4 ip5 ip6 ip7 ip8 sendtime
rstime1
smstime1
smstime2
rstime3
smstime4
rt
smst
wstarttime
wendtime
wst1
device1
browser1
wst2
device2
browser2
wst3
device3
browser3
wst4
device4
browser4
wst5
device5
browser5
wst6
device6
browser6
wst7
device7
browser7
wst8
device8
browser8
ip9
wst9
device9
browser9
ip10
wst10
device10
browser10
ip11
wst11
device11
browser11
ip12
wst12
device12
browser12
ip13
wst13
device13
browser13
ip14
wst14
device14
browser14
ip15
wst15
device15
browser15
ip16
wst16
device16
browser16
ct
termination
r
wlast
wno
email2026
cellphone2026
gender2026
birth2026
marry2026
marry2026_oth
edu2026
edu2026_oth
city2026
city2026_oth
town2026
subgroup
group_priority
casenum
group
b
CKgender
CKbirth
CKedu
CKmarry
success
ACQ34
ACQ35
v49f
rstime2
smstime3
ip9
wst9
device9
browser9
notes
wlast_new
/COMPRESSED.

*進行資料處理及檢核.
GET FILE="\\140.109.171.240\worker\worker_sec\網調協辦計畫\W202606 邁向淨零社會_永續能源創新科技的公眾支持\02資料檔及不符合品\02資料檔\02修改後\結束處理\data_s.sav".

**產生檢核及不合品所需變項-前置作業***************************************************************************************.
*定義調查開始日期與調查結束日期.
compute startdate=20260512000000.
compute enddate=20260527000000.
exec.

*1.產生檢核日期.
string month (a3)  today (a8).
compute month=char.substr($date,4,3).
recode month ('JAN'="01")('FEB'="02")('MAR'="03")('APR'="04")('MAY'="05")('JUN'="06")
('JUL'="07") ('AUG'="08")('SEP'="09")('OCT'="10")('NOV'="11")('DEC'="12") into month.
compute today=concat("20",char.substr($date,8,2),char.substr(month,1,2),char.substr($date,1,2)).
alter type today (f8.0).

*2.利用資料檔結束時間產生日期變項. 
compute sdate=trunc(wstarttime/1000000).
compute edate=trunc(wendtime/1000000).
format sdate edate (f8.0).

*3.產生開放欄位檢查日期變項（每日修改），有需要可以彈性列出某些天的開放欄位.
compute keyindate1=20260512.
compute keyindate2=20260527.
compute keyin= today.
format keyindate1 keyindate2(f8.0).

**********************************************************************************************************.
*建立m p 變項放置不符合品中文說明.
string m100 to m600 p100 to p600(a900).
ALTER TYPE id(a20).

*樣本編號檢核.                                 
* 識別重複觀察值.
SORT CASES BY id(A).
MATCH FILES
  /FILE=*
  /BY id
  /FIRST=PrimaryFirst
  /LAST=PrimaryLast.
DO IF (PrimaryFirst).
COMPUTE  MatchSequence=1-PrimaryLast.
ELSE.
COMPUTE  MatchSequence=MatchSequence+1.
END IF.
LEAVE  MatchSequence.
FORMATS  MatchSequence (f7).
COMPUTE  InDupGrp=MatchSequence>0.
SORT CASES InDupGrp(D).
MATCH FILES
  /FILE=*
  /DROP=PrimaryFirst PrimaryLast InDupGrp.
VARIABLE LABELS  MatchSequence '相符觀察值的循序個數'.
VARIABLE LEVEL  MatchSequence (SCALE).
FREQUENCIES VARIABLES=MatchSequence.
EXECUTE.
do if MatchSequence>0 | id="" .    
  compute m100=concat("id=",id).                     
  compute p100="id為重複樣本/漏答".     
end if.                                                         
exec.     

**1.不合理值檢核.

*v1=21,95   .
do if not range(v1,21,95) | sys(v1).
compute m101=concat("v1=",string(v1,f3)).
compute p101="v1為不合理值或遺漏值".
end if.
Exec.

 

*v2=1,14   .
do if not range(v2,1,14) | sys(v2).
compute m102=concat("v2=",string(v2,f2)).
compute p102="v2為不合理值或遺漏值".
end if.
Exec.

 

*v3s1=0,20   .
do if not range(v3s1,0,20) | sys(v3s1).
compute m103=concat("v3s1=",string(v3s1,f3)).
compute p103="v3s1為不合理值或遺漏值".
end if.
Exec.

 

*v3s2=0,20   .
do if not range(v3s2,0,20) | sys(v3s2).
compute m104=concat("v3s2=",string(v3s2,f3)).
compute p104="v3s2為不合理值或遺漏值".
end if.


 

*v4=1,5   .
do if not range(v4,1,5) | sys(v4).
compute m105=concat("v4=",string(v4,f2)).
compute p105="v4為不合理值或遺漏值".
end if.


 

*v5=1,5   .
do if not range(v5,1,5) | sys(v5).
compute m106=concat("v5=",string(v5,f2)).
compute p106="v5為不合理值或遺漏值".
end if.


 

*v6=1,5   .
do if not range(v6,1,5) | sys(v6).
compute m107=concat("v6=",string(v6,f2)).
compute p107="v6為不合理值或遺漏值".
end if.


 

*v7=1,2   .
do if not range(v7,1,2) | sys(v7).
compute m108=concat("v7=",string(v7,f2)).
compute p108="v7為不合理值或遺漏值".
end if.


 

*v8=1,5   .
do if not range(v8,1,5) | sys(v8).
compute m109=concat("v8=",string(v8,f2)).
compute p109="v8為不合理值或遺漏值".
end if.


 

*v9=1,5   .
do if not range(v9,1,5) | sys(v9).
compute m110=concat("v9=",string(v9,f2)).
compute p110="v9為不合理值或遺漏值".
end if.


 

*v10=1,5   .
do if not range(v10,1,5) | sys(v10).
compute m111=concat("v10=",string(v10,f2)).
compute p111="v10為不合理值或遺漏值".
end if.


 

*v11=1,5   .
do if not range(v11,1,5) | sys(v11).
compute m112=concat("v11=",string(v11,f2)).
compute p112="v11為不合理值或遺漏值".
end if.


 

*v12=1,5   .
do if not range(v12,1,5) | sys(v12).
compute m113=concat("v12=",string(v12,f2)).
compute p113="v12為不合理值或遺漏值".
end if.


 

*v13=1,5   .
do if not range(v13,1,5) | sys(v13).
compute m114=concat("v13=",string(v13,f2)).
compute p114="v13為不合理值或遺漏值".
end if.


 

*v14=1,5   .
do if not range(v14,1,5) | sys(v14).
compute m115=concat("v14=",string(v14,f2)).
compute p115="v14為不合理值或遺漏值".
end if.


 

*v15=1,5   .
do if not range(v15,1,5) | sys(v15).
compute m116=concat("v15=",string(v15,f2)).
compute p116="v15為不合理值或遺漏值".
end if.


 

*v16=1,5   .
do if not range(v16,1,5) | sys(v16).
compute m117=concat("v16=",string(v16,f2)).
compute p117="v16為不合理值或遺漏值".
end if.


 

*v17=1,5   .
do if not range(v17,1,5) | sys(v17).
compute m118=concat("v17=",string(v17,f2)).
compute p118="v17為不合理值或遺漏值".
end if.


 

*v18=1,5   .
do if not range(v18,1,5) | sys(v18).
compute m119=concat("v18=",string(v18,f2)).
compute p119="v18為不合理值或遺漏值".
end if.


 

*v19=1,6   .
do if not range(v19,1,6) | sys(v19).
compute m120=concat("v19=",string(v19,f2)).
compute p120="v19為不合理值或遺漏值".
end if.


 

*v20=1,5   .
do if not range(v20,1,5) | sys(v20).
compute m121=concat("v20=",string(v20,f2)).
compute p121="v20為不合理值或遺漏值".
end if.


 

*v21=1,5   .
do if not range(v21,1,5) | sys(v21).
compute m122=concat("v21=",string(v21,f2)).
compute p122="v21為不合理值或遺漏值".
end if.


 

*v22=1,5   .
do if not range(v22,1,5) | sys(v22).
compute m123=concat("v22=",string(v22,f2)).
compute p123="v22為不合理值或遺漏值".
end if.


 

*v23=1,5   .
do if not range(v23,1,5) | sys(v23).
compute m124=concat("v23=",string(v23,f2)).
compute p124="v23為不合理值或遺漏值".
end if.


 

*v24=1,5   .
do if not range(v24,1,5) | sys(v24).
compute m125=concat("v24=",string(v24,f2)).
compute p125="v24為不合理值或遺漏值".
end if.


 

*v25=1,5   .
do if not range(v25,1,5) | sys(v25).
compute m126=concat("v25=",string(v25,f2)).
compute p126="v25為不合理值或遺漏值".
end if.


 

*v26=1,5   .
do if not range(v26,1,5) | sys(v26).
compute m127=concat("v26=",string(v26,f2)).
compute p127="v26為不合理值或遺漏值".
end if.


 

*v27=1,8   .
do if not range(v27,1,8) | sys(v27).
compute m128=concat("v27=",string(v27,f2)).
compute p128="v27為不合理值或遺漏值".
end if.


 

*v28=1,8   .
do if not range(v28,1,8) | sys(v28).
compute m129=concat("v28=",string(v28,f2)).
compute p129="v28為不合理值或遺漏值".
end if.


 

*v29=1,8   .
do if not range(v29,1,8) | sys(v29).
compute m130=concat("v29=",string(v29,f2)).
compute p130="v29為不合理值或遺漏值".
end if.


 

*v30s1=1,5   .
do if not range(v30s1,1,5) | sys(v30s1).
compute m131=concat("v30s1=",string(v30s1,f2)).
compute p131="v30s1為不合理值或遺漏值".
end if.


 

*v30s2=1,5   .
do if not range(v30s2,1,5) | sys(v30s2).
compute m132=concat("v30s2=",string(v30s2,f2)).
compute p132="v30s2為不合理值或遺漏值".
end if.


 

*v30s3=1,5   .
do if not range(v30s3,1,5) | sys(v30s3).
compute m133=concat("v30s3=",string(v30s3,f2)).
compute p133="v30s3為不合理值或遺漏值".
end if.


 

*v30s4=1,5   .
do if not range(v30s4,1,5) | sys(v30s4).
compute m134=concat("v30s4=",string(v30s4,f2)).
compute p134="v30s4為不合理值或遺漏值".
end if.


 

*v30s5=1,5   .
do if not range(v30s5,1,5) | sys(v30s5).
compute m135=concat("v30s5=",string(v30s5,f2)).
compute p135="v30s5為不合理值或遺漏值".
end if.


 

*v30s6=1,5   .
do if not range(v30s6,1,5) | sys(v30s6).
compute m136=concat("v30s6=",string(v30s6,f2)).
compute p136="v30s6為不合理值或遺漏值".
end if.


 

*v30s7=1,5   .
do if not range(v30s7,1,5) | sys(v30s7).
compute m137=concat("v30s7=",string(v30s7,f2)).
compute p137="v30s7為不合理值或遺漏值".
end if.


 

*v31s1=1,5   .
do if not range(v31s1,1,5) | sys(v31s1).
compute m138=concat("v31s1=",string(v31s1,f2)).
compute p138="v31s1為不合理值或遺漏值".
end if.


 

*v31s2=1,5   .
do if not range(v31s2,1,5) | sys(v31s2).
compute m139=concat("v31s2=",string(v31s2,f2)).
compute p139="v31s2為不合理值或遺漏值".
end if.


 

*v31s3=1,5   .
do if not range(v31s3,1,5) | sys(v31s3).
compute m140=concat("v31s3=",string(v31s3,f2)).
compute p140="v31s3為不合理值或遺漏值".
end if.


 

*v31s4=1,5   .
do if not range(v31s4,1,5) | sys(v31s4).
compute m141=concat("v31s4=",string(v31s4,f2)).
compute p141="v31s4為不合理值或遺漏值".
end if.


 

*v31s5=1,5   .
do if not range(v31s5,1,5) | sys(v31s5).
compute m142=concat("v31s5=",string(v31s5,f2)).
compute p142="v31s5為不合理值或遺漏值".
end if.


 

*v31s6=1,5   .
do if not range(v31s6,1,5) | sys(v31s6).
compute m143=concat("v31s6=",string(v31s6,f2)).
compute p143="v31s6為不合理值或遺漏值".
end if.


 

*v32s1=1,5   .
do if not range(v32s1,1,5) | sys(v32s1).
compute m144=concat("v32s1=",string(v32s1,f2)).
compute p144="v32s1為不合理值或遺漏值".
end if.


 

*v32s2=1,5   .
do if not range(v32s2,1,5) | sys(v32s2).
compute m145=concat("v32s2=",string(v32s2,f2)).
compute p145="v32s2為不合理值或遺漏值".
end if.


 

*v32s3=1,5   .
do if not range(v32s3,1,5) | sys(v32s3).
compute m146=concat("v32s3=",string(v32s3,f2)).
compute p146="v32s3為不合理值或遺漏值".
end if.


 

*v32s4=1,5   .
do if not range(v32s4,1,5) | sys(v32s4).
compute m147=concat("v32s4=",string(v32s4,f2)).
compute p147="v32s4為不合理值或遺漏值".
end if.


 

*v33=20260512000000,20260527000000   .
do if not range(v33,20260512000000,20260527000000) | sys(v33).
compute m148=concat("v33=",string(v33,f14)).
compute p148="v33為不合理值或遺漏值".
end if.


 

*v33_1=20260512000000,20260527000000 99969696969696  .
do if not range(v33_1,20260512000000,20260527000000,99969696969696,99969696969696) | sys(v33_1).
compute m149=concat("v33_1=",string(v33_1,f14)).
compute p149="v33_1為不合理值或遺漏值".
end if.


 

*v33_2=20260512000000,20260527000000 99969696969696  .
do if not range(v33_2,20260512000000,20260527000000,99969696969696,99969696969696) | sys(v33_2).
compute m150=concat("v33_2=",string(v33_2,f14)).
compute p150="v33_2為不合理值或遺漏值".
end if.


 

*v33_3=20260512000000,20260527000000 99969696969696  .
do if not range(v33_3,20260512000000,20260527000000,99969696969696,99969696969696) | sys(v33_3).
compute m151=concat("v33_3=",string(v33_3,f14)).
compute p151="v33_3為不合理值或遺漏值".
end if.


 

*v33_4=20260512000000,20260527000000 99969696969696  .
do if not range(v33_4,20260512000000,20260527000000,99969696969696,99969696969696) | sys(v33_4).
compute m152=concat("v33_4=",string(v33_4,f14)).
compute p152="v33_4為不合理值或遺漏值".
end if.


 

*v33_5=20260512000000,20260527000000 99969696969696  .
do if not range(v33_5,20260512000000,20260527000000,99969696969696,99969696969696) | sys(v33_5).
compute m153=concat("v33_5=",string(v33_5,f14)).
compute p153="v33_5為不合理值或遺漏值".
end if.


 

*v34=1,5   .
do if not range(v34,1,5) | sys(v34).
compute m154=concat("v34=",string(v34,f2)).
compute p154="v34為不合理值或遺漏值".
end if.


 

*v35=1,4   .
do if not range(v35,1,4) | sys(v35).
compute m155=concat("v35=",string(v35,f2)).
compute p155="v35為不合理值或遺漏值".
end if.


 

*v36=1,5   .
do if not range(v36,1,5) | sys(v36).
compute m156=concat("v36=",string(v36,f2)).
compute p156="v36為不合理值或遺漏值".
end if.


 

*v37=1,5   .
do if not range(v37,1,5) | sys(v37).
compute m157=concat("v37=",string(v37,f2)).
compute p157="v37為不合理值或遺漏值".
end if.


 

*v38=1,5   .
do if not range(v38,1,5) | sys(v38).
compute m158=concat("v38=",string(v38,f2)).
compute p158="v38為不合理值或遺漏值".
end if.


 

*v39=1,5   .
do if not range(v39,1,5) | sys(v39).
compute m159=concat("v39=",string(v39,f2)).
compute p159="v39為不合理值或遺漏值".
end if.


 

*v40=1,5   .
do if not range(v40,1,5) | sys(v40).
compute m160=concat("v40=",string(v40,f2)).
compute p160="v40為不合理值或遺漏值".
end if.


 

*v41=1,5   .
do if not range(v41,1,5) | sys(v41).
compute m161=concat("v41=",string(v41,f2)).
compute p161="v41為不合理值或遺漏值".
end if.


 

*v42=1,6   .
do if not range(v42,0,6) | sys(v42).
compute m162=concat("v42=",string(v42,f2)).
compute p162="v42為不合理值或遺漏值".
end if.


 

*v43=1,4   .
do if not range(v43,1,4) | sys(v43).
compute m163=concat("v43=",string(v43,f2)).
compute p163="v43為不合理值或遺漏值".
end if.


 

*v44=1,4   .
do if not range(v44,1,4) | sys(v44).
compute m164=concat("v44=",string(v44,f2)).
compute p164="v44為不合理值或遺漏值".
end if.


 

*v45m01=0,1   .
do if not range(v45m01,0,1) | sys(v45m01).
compute m165=concat("v45m01=",string(v45m01,f2)).
compute p165="v45m01為不合理值或遺漏值".
end if.


 

*v45m02=0,1   .
do if not range(v45m02,0,1) | sys(v45m02).
compute m166=concat("v45m02=",string(v45m02,f2)).
compute p166="v45m02為不合理值或遺漏值".
end if.


 

*v45m03=0,1   .
do if not range(v45m03,0,1) | sys(v45m03).
compute m167=concat("v45m03=",string(v45m03,f2)).
compute p167="v45m03為不合理值或遺漏值".
end if.


 

*v45m04=0,1   .
do if not range(v45m04,0,1) | sys(v45m04).
compute m168=concat("v45m04=",string(v45m04,f2)).
compute p168="v45m04為不合理值或遺漏值".
end if.


 

*v45m05=0,1   .
do if not range(v45m05,0,1) | sys(v45m05).
compute m169=concat("v45m05=",string(v45m05,f2)).
compute p169="v45m05為不合理值或遺漏值".
end if.


 

*v45m06=0,1   .
do if not range(v45m06,0,1) | sys(v45m06).
compute m170=concat("v45m06=",string(v45m06,f2)).
compute p170="v45m06為不合理值或遺漏值".
end if.


 

*v45m07=0,1   .
do if not range(v45m07,0,1) | sys(v45m07).
compute m171=concat("v45m07=",string(v45m07,f2)).
compute p171="v45m07為不合理值或遺漏值".
end if.


 

*v46m01=0,1   .
do if not range(v46m01,0,1) | sys(v46m01).
compute m172=concat("v46m01=",string(v46m01,f2)).
compute p172="v46m01為不合理值或遺漏值".
end if.


 

*v46m02=0,1   .
do if not range(v46m02,0,1) | sys(v46m02).
compute m173=concat("v46m02=",string(v46m02,f2)).
compute p173="v46m02為不合理值或遺漏值".
end if.


 

*v46m03=0,1   .
do if not range(v46m03,0,1) | sys(v46m03).
compute m174=concat("v46m03=",string(v46m03,f2)).
compute p174="v46m03為不合理值或遺漏值".
end if.


 

*v46m04=0,1   .
do if not range(v46m04,0,1) | sys(v46m04).
compute m175=concat("v46m04=",string(v46m04,f2)).
compute p175="v46m04為不合理值或遺漏值".
end if.


 

*v46m05=0,1   .
do if not range(v46m05,0,1) | sys(v46m05).
compute m176=concat("v46m05=",string(v46m05,f2)).
compute p176="v46m05為不合理值或遺漏值".
end if.


 

*v46m06=0,1   .
do if not range(v46m06,0,1) | sys(v46m06).
compute m177=concat("v46m06=",string(v46m06,f2)).
compute p177="v46m06為不合理值或遺漏值".
end if.


 

*v46m07=0,1   .
do if not range(v46m07,0,1) | sys(v46m07).
compute m178=concat("v46m07=",string(v46m07,f2)).
compute p178="v46m07為不合理值或遺漏值".
end if.


 

*v47=0001,2359   .
do if not range(v47,0001,2359) | sys(v47).
compute m179=concat("v47=",string(v47,f4)).
compute p179="v47為不合理值或遺漏值".
end if.


 

*v48m01=0,1   .
do if not range(v48m01,0,1) | sys(v48m01).
compute m180=concat("v48m01=",string(v48m01,f2)).
compute p180="v48m01為不合理值或遺漏值".
end if.


 

*v48m02=0,1   .
do if not range(v48m02,0,1) | sys(v48m02).
compute m181=concat("v48m02=",string(v48m02,f2)).
compute p181="v48m02為不合理值或遺漏值".
end if.


 

*v48m03=0,1   .
do if not range(v48m03,0,1) | sys(v48m03).
compute m182=concat("v48m03=",string(v48m03,f2)).
compute p182="v48m03為不合理值或遺漏值".
end if.


 

*v48m04=0,1   .
do if not range(v48m04,0,1) | sys(v48m04).
compute m183=concat("v48m04=",string(v48m04,f2)).
compute p183="v48m04為不合理值或遺漏值".
end if.


 

*v48m05=0,1   .
do if not range(v48m05,0,1) | sys(v48m05).
compute m184=concat("v48m05=",string(v48m05,f2)).
compute p184="v48m05為不合理值或遺漏值".
end if.


 

*v48m06=0,1   .
do if not range(v48m06,0,1) | sys(v48m06).
compute m185=concat("v48m06=",string(v48m06,f2)).
compute p185="v48m06為不合理值或遺漏值".
end if.


 

*v48m07=0,1   .
do if not range(v48m07,0,1) | sys(v48m07).
compute m186=concat("v48m07=",string(v48m07,f2)).
compute p186="v48m07為不合理值或遺漏值".
end if.


 

*v49=1,94   .
do if not range(v49,1,94) | sys(v49).
compute m187=concat("v49=",string(v49,f3)).
compute p187="v49為不合理值或遺漏值".
end if.


 

*vCK49=1,94 996  .
do if not range(vCK49,1,94,996,996) | sys(vCK49).
compute m188=concat("vCK49=",string(vCK49,f3)).
compute p188="vCK49為不合理值或遺漏值".
end if.


 

*v50=1,5   .
do if not range(v50,1,5) | sys(v50).
compute m189=concat("v50=",string(v50,f2)).
compute p189="v50為不合理值或遺漏值".
end if.


 

*v51=1,7   .
do if not range(v51,1,7,96,96) | sys(v51) .
compute m190=concat("v51=",string(v51,f2)).
compute p190="v51為不合理值或遺漏值".
end if.


 

*v52=1,11   .
do if not range(v52,1,11) | sys(v52).
compute m191=concat("v52=",string(v52,f2)).
compute p191="v52為不合理值或遺漏值".
end if.


 

*v53=1,130   .
do if not range(v53,1,130) | sys(v53).
compute m192=concat("v53=",string(v53,f4)).
compute p192="v53為不合理值或遺漏值".
end if.


 

*v54=0,999   .
do if not range(v54,0,999) | sys(v54).
compute m193=concat("v54=",string(v54,f4)).
compute p193="v54為不合理值或遺漏值".
end if.


 

*v55=1,2   .
do if not range(v55,1,2) | sys(v55).
compute m194=concat("v55=",string(v55,f2)).
compute p194="v55為不合理值或遺漏值".
end if.


 

*v56=1,3   .
do if not range(v56,1,3) | sys(v56).
compute m195=concat("v56=",string(v56,f2)).
compute p195="v56為不合理值或遺漏值".
end if.


 

*v57=1,4   .
do if not range(v57,1,4) | sys(v57).
compute m196=concat("v57=",string(v57,f2)).
compute p196="v57為不合理值或遺漏值".
end if.


 

*v58=1,5 96  .
do if not range(v58,1,5,96,96) | sys(v58).
compute m197=concat("v58=",string(v58,f2)).
compute p197="v58為不合理值或遺漏值".
end if.


 

*v59=1,11   .
do if not range(v59,1,11) | sys(v59).
compute m198=concat("v59=",string(v59,f2)).
compute p198="v59為不合理值或遺漏值".
end if.


 

*v60=1,6   .
do if not range(v60,1,6) | sys(v60).
compute m199=concat("v60=",string(v60,f2)).
compute p199="v60為不合理值或遺漏值".
end if.


 

*v61=1,3   .
do if not range(v61,1,3) | sys(v61).
compute m200=concat("v61=",string(v61,f2)).
compute p200="v61為不合理值或遺漏值".
end if.


 

*v62=1,6   .
do if not range(v62,1,6) | sys(v62).
compute m201=concat("v62=",string(v62,f2)).
compute p201="v62為不合理值或遺漏值".
end if.


 

*v63=1,10   .
do if not range(v63,1,10) | sys(v63).
compute m202=concat("v63=",string(v63,f3)).
compute p202="v63為不合理值或遺漏值".
end if.


 

*v64=1,4   .
do if not range(v64,1,4) | sys(v64).
compute m203=concat("v64=",string(v64,f2)).
compute p203="v64為不合理值或遺漏值".
end if.


 

*v65=1,4   .
do if not range(v65,1,4) | sys(v65).
compute m204=concat("v65=",string(v65,f2)).
compute p204="v65為不合理值或遺漏值".
end if.


 

*v66=1,5   .
do if not range(v66,1,5) | sys(v66).
compute m205=concat("v66=",string(v66,f2)).
compute p205="v66為不合理值或遺漏值".
end if.


 

*v67=1,4   .
do if not range(v67,1,4) | sys(v67).
compute m206=concat("v67=",string(v67,f2)).
compute p206="v67為不合理值或遺漏值".
end if.


 

*v68=1,5   .
do if not range(v68,1,5) | sys(v68).
compute m207=concat("v68=",string(v68,f2)).
compute p207="v68為不合理值或遺漏值".
end if.


 

*v69=1,15   .
do if not range(v69,1,15) | sys(v69).
compute m208=concat("v69=",string(v69,f2)).
compute p208="v69為不合理值或遺漏值".
end if.


 

*v70=1,10   .
do if not range(v70,1,10) | sys(v70).
compute m209=concat("v70=",string(v70,f2)).
compute p209="v70為不合理值或遺漏值".
end if.


 

*v71_1=1,10 96  .
do if not range(v71_1,1,10,96,96) | sys(v71_1).
compute m210=concat("v71_1=",string(v71_1,f2)).
compute p210="v71_1為不合理值或遺漏值".
end if.


 

*v72=1,18   .
do if not range(v72,1,18) | sys(v72).
compute m211=concat("v72=",string(v72,f2)).
compute p211="v72為不合理值或遺漏值".
end if.


 

*v73=1,5   .
do if not range(v73,1,5) | sys(v73).
compute m212=concat("v73=",string(v73,f2)).
compute p212="v73為不合理值或遺漏值".
end if.


 

*v74=1,9   .
do if not range(v74,1,9) | sys(v74).
compute m213=concat("v74=",string(v74,f2)).
compute p213="v74為不合理值或遺漏值".
end if.


 

*v75=1,5   .
do if not range(v75,1,5) | sys(v75).
compute m214=concat("v75=",string(v75,f2)).
compute p214="v75為不合理值或遺漏值".
end if.


 

*v76=1,2   .
do if not range(v76,1,2) | sys(v76).
compute m215=concat("v76=",string(v76,f2)).
compute p215="v76為不合理值或遺漏值".
end if.



*v77=1,4   .
do if not range(v77,1,4) | sys(v77).
compute m216=concat("v77=",string(v77,f2)).
compute p216="v77為不合理值或遺漏值".
end if.


 *vZ1city=1,29   .
do if not range(vZ1city,1,29) | sys(vZ1city).
compute m217=concat("vZ1city=",string(vZ1city,f2)).
compute p217="vZ1city為不合理值或遺漏值".
end if.


*vZ1town=100,103,104,105,106,108,110,111,112,114,115,116,200,201,202,203,204,205,206,207,208,209,210,211,212,220,221,222,223,224,226,
    227,228,231,232,233,234,235,236,237,238,239,241,242,243,244,247,248,249,251,252,253,260,261,262,263,264,265,266,267,268,269,270,272 .
do if not any(vZ1town,100,103,104,105,106,108,110,111,112,114,115,116,200,201,202,203,204,205,206,207,208,209,210,211,212,220,221,222,223,224,
 226,227,228,231,232,233,234,235,236,237,238,239,241,242,243,244,247,248,249,251,252,253,260,261,262,263,264,265,266,267,268,269,270,272,302,
 303,304,305,306,307,308,310,311,312,313,314,315,320,324,325,326,327,328,330,333,334,335,336,337,338,350,351,352,353,354,356,357,358,360,361,
 362,363,364,365,366,367,368,369,400,401,402,403,404,406,407,408,411,412,413,414,420,421,422,423,424,426,427,428,429,432,433,434,435,436,437,
 438,439,500,502,503,504,505,506,507,508,509,510,511,512,513,514,515,516,520,521,522,523,524,525,526,527,528,530,540,541,542,544,545,546,551,
 552,553,555,556,557,558,602,603,604,605,606,607,608,611,612,613,614,615,616,621,622,623,624,625,630,631,632,633,634,635,636,637,638,640,643,
 646,647,648,649,651,652,653,654,655,700,701,702,704,708,709,710,711,712,713,714,715,716,717,718,719,720,721,722,723,724,725,726,727,730,731,
 732,733,734,735,736,737,741,742,743,744,745,800,801,802,803,804,805,806,807,811,812,813,814,815,820,821,822,823,824,825,826,827,828,829,830,
 831,832,833,840,842,843,844,845,846,847,848,849,851,852,880,881,882,883,884,885,890,891,892,893,894,896,900,901,902,903,904,905,906,907,908,
 909,911,912,913,920,921,922,923,924,925,926,927,928,929,931,932,940,941,942,943,944,945,946,947,950,951,952,953,954,955,956,957,958,959,961,
 962,963,964,965,966,970,971,972,973,974,975,976,977,978,979,981,982,983,3001,3002,3003,6001,6002).
compute m218=concat("vZ1town=",string(vZ1town,f4)).
compute p218="vZ1town為不合理值或遺漏值".
end if.


 *vZ2city=1,29   .
do if not range(vZ2city,1,29,96,96) | sys(vZ2city).
compute m219=concat("vZ2city=",string(vZ2city,f2)).
compute p219="vZ2city為不合理值或遺漏值".
end if.


 *vZ2town=100,103,104,105,106,108,110,111,112,114,115,116,200,201,202,203,204,205,206,207,208,209,210,211,212,220,221,222,223,
    224,226,227,228,231,232,233,234,235,236,237,238,239,241,242,243,244,247,248,249,251,252,253,260,261,262,263,264,265,266,267,268,269,270,272 9996  .
do if not any(vZ3town,100,103,104,105,106,108,110,111,112,114,115,116,200,201,202,203,204,205,206,207,208,209,210,211,212,220,221,222,223,224,
 226,227,228,231,232,233,234,235,236,237,238,239,241,242,243,244,247,248,249,251,252,253,260,261,262,263,264,265,266,267,268,269,270,272,302,
 303,304,305,306,307,308,310,311,312,313,314,315,320,324,325,326,327,328,330,333,334,335,336,337,338,350,351,352,353,354,356,357,358,360,361,
 362,363,364,365,366,367,368,369,400,401,402,403,404,406,407,408,411,412,413,414,420,421,422,423,424,426,427,428,429,432,433,434,435,436,437,
 438,439,500,502,503,504,505,506,507,508,509,510,511,512,513,514,515,516,520,521,522,523,524,525,526,527,528,530,540,541,542,544,545,546,551,
 552,553,555,556,557,558,602,603,604,605,606,607,608,611,612,613,614,615,616,621,622,623,624,625,630,631,632,633,634,635,636,637,638,640,643,
 646,647,648,649,651,652,653,654,655,700,701,702,704,708,709,710,711,712,713,714,715,716,717,718,719,720,721,722,723,724,725,726,727,730,731,
 732,733,734,735,736,737,741,742,743,744,745,800,801,802,803,804,805,806,807,811,812,813,814,815,820,821,822,823,824,825,826,827,828,829,830,
 831,832,833,840,842,843,844,845,846,847,848,849,851,852,880,881,882,883,884,885,890,891,892,893,894,896,900,901,902,903,904,905,906,907,908,
 909,911,912,913,920,921,922,923,924,925,926,927,928,929,931,932,940,941,942,943,944,945,946,947,950,951,952,953,954,955,956,957,958,959,961,
 962,963,964,965,966,970,971,972,973,974,975,976,977,978,979,981,982,983,3001,3002,3003,6001,6002,9996).
compute m220=concat("vZ2town=",string(vZ2town,f4)).
compute p220="vZ2town為不合理值或遺漏值".
end if.


 

*vZ3city=1,29   .
do if not range(vZ3city,1,29,96,96) | sys(vZ3city).
compute m221=concat("vZ3city=",string(vZ3city,f2)).
compute p221="vZ3city為不合理值或遺漏值".
end if.


 

*vZ3town=100,103,104,105,106,108,110,111,112,114,115,116,200,201,202,203,204,205,206,207,208,209,210,211,212,220,221,222,223,224,226,227,228,231,
    232,233,234,235,236,237,238,239,241,242,243,244,247,248,249,251,252,253,260,261,262,263,264,265,266,267,268,269,270,272 9996  .
do if not any(vZ3town,100,103,104,105,106,108,110,111,112,114,115,116,200,201,202,203,204,205,206,207,208,209,210,211,212,220,221,222,223,224,
 226,227,228,231,232,233,234,235,236,237,238,239,241,242,243,244,247,248,249,251,252,253,260,261,262,263,264,265,266,267,268,269,270,272,302,
 303,304,305,306,307,308,310,311,312,313,314,315,320,324,325,326,327,328,330,333,334,335,336,337,338,350,351,352,353,354,356,357,358,360,361,
 362,363,364,365,366,367,368,369,400,401,402,403,404,406,407,408,411,412,413,414,420,421,422,423,424,426,427,428,429,432,433,434,435,436,437,
 438,439,500,502,503,504,505,506,507,508,509,510,511,512,513,514,515,516,520,521,522,523,524,525,526,527,528,530,540,541,542,544,545,546,551,
 552,553,555,556,557,558,602,603,604,605,606,607,608,611,612,613,614,615,616,621,622,623,624,625,630,631,632,633,634,635,636,637,638,640,643,
 646,647,648,649,651,652,653,654,655,700,701,702,704,708,709,710,711,712,713,714,715,716,717,718,719,720,721,722,723,724,725,726,727,730,731,
 732,733,734,735,736,737,741,742,743,744,745,800,801,802,803,804,805,806,807,811,812,813,814,815,820,821,822,823,824,825,826,827,828,829,830,
 831,832,833,840,842,843,844,845,846,847,848,849,851,852,880,881,882,883,884,885,890,891,892,893,894,896,900,901,902,903,904,905,906,907,908,
 909,911,912,913,920,921,922,923,924,925,926,927,928,929,931,932,940,941,942,943,944,945,946,947,950,951,952,953,954,955,956,957,958,959,961,
 962,963,964,965,966,970,971,972,973,974,975,976,977,978,979,981,982,983,3001,3002,3003,6001,6002,9996).
compute m222=concat("vZ3town=",string(vZ3town,f4)).
compute p222="vZ3town為不合理值或遺漏值".
end if.


 *vEND=20260512000000,20260527000000   .
do if not range(vEND,20260512000000,20260527100000) | sys(vEND).
compute m223=concat("vEND=",string(vEND,f14)).
compute p223="vEND為不合理值或遺漏值".
end if.



**2.開放欄位檢核.

*v2 開放欄位檢核 是否為複選題=0.
do if v2=14 & v2o14="".
Compute m251=concat("v2=",string(v2,n2),";v2o14=",char.substr(v2o14,1,150)).
compute p251="v2o14開放欄位應答而未答".
else if v2~=14 & v2o14~="".
compute m251=concat("v2=",string(v2,n2),";v2o14=",char.substr(v2o14,1,150)).
compute p251="v2o14開放欄位不該答而答".
else if v2=14 & v2o14~="".
compute m251=concat("v2=",string(v2,n2),";v2o14=",char.substr(v2o14,1,150)).
compute p251="v2o14開放欄位內容列出確認".
end if.


 

*v13 開放欄位檢核 是否為複選題=0.
do if v13=5 & v13o05="".
Compute m252=concat("v13=",string(v13,n2),";v13o05=",char.substr(v13o05,1,150)).
compute p252="v13o05開放欄位應答而未答".
else if v13~=5 & v13o05~="".
compute m252=concat("v13=",string(v13,n2),";v13o05=",char.substr(v13o05,1,150)).
compute p252="v13o05開放欄位不該答而答".
else if v13=5 & v13o05~="".
compute m252=concat("v13=",string(v13,n2),";v13o05=",char.substr(v13o05,1,150)).
compute p252="v13o05開放欄位內容列出確認".
end if.
Exec.

 

*v19 開放欄位檢核 是否為複選題=0.
do if v19=6 & v19o06="".
Compute m253=concat("v19=",string(v19,n2),";v19o06=",char.substr(v19o06,1,150)).
compute p253="v19o06開放欄位應答而未答".
else if v19~=6 & v19o06~="".
compute m253=concat("v19=",string(v19,n2),";v19o06=",char.substr(v19o06,1,150)).
compute p253="v19o06開放欄位不該答而答".
else if v19=6 & v19o06~="".
compute m253=concat("v19=",string(v19,n2),";v19o06=",char.substr(v19o06,1,150)).
compute p253="v19o06開放欄位內容列出確認".
end if.
Exec.

 

*v27 開放欄位檢核 是否為複選題=0.
do if v27=7 & v27o07="".
Compute m254=concat("v27=",string(v27,n2),";v27o07=",char.substr(v27o07,1,150)).
compute p254="v27o07開放欄位應答而未答".
else if v27~=7 & v27o07~="".
compute m254=concat("v27=",string(v27,n2),";v27o07=",char.substr(v27o07,1,150)).
compute p254="v27o07開放欄位不該答而答".
else if v27=7 & v27o07~="".
compute m254=concat("v27=",string(v27,n2),";v27o07=",char.substr(v27o07,1,150)).
compute p254="v27o07開放欄位內容列出確認".
end if.
Exec.

 

*v27 開放欄位檢核 是否為複選題=0.
do if v27=8 & v27o08="".
Compute m255=concat("v27=",string(v27,n2),";v27o08=",char.substr(v27o08,1,150)).
compute p255="v27o08開放欄位應答而未答".
else if v27~=8 & v27o08~="".
compute m255=concat("v27=",string(v27,n2),";v27o08=",char.substr(v27o08,1,150)).
compute p255="v27o08開放欄位不該答而答".
else if v27=8 & v27o08~="".
compute m255=concat("v27=",string(v27,n2),";v27o08=",char.substr(v27o08,1,150)).
compute p255="v27o08開放欄位內容列出確認".
end if.
Exec.

 

*v28 開放欄位檢核 是否為複選題=0.
do if v28=7 & v28o07="".
Compute m256=concat("v28=",string(v28,n2),";v28o07=",char.substr(v28o07,1,150)).
compute p256="v28o07開放欄位應答而未答".
else if v28~=7 & v28o07~="".
compute m256=concat("v28=",string(v28,n2),";v28o07=",char.substr(v28o07,1,150)).
compute p256="v28o07開放欄位不該答而答".
else if v28=7 & v28o07~="".
compute m256=concat("v28=",string(v28,n2),";v28o07=",char.substr(v28o07,1,150)).
compute p256="v28o07開放欄位內容列出確認".
end if.
Exec.

 

*v28 開放欄位檢核 是否為複選題=0.
do if v28=8 & v28o08="".
Compute m257=concat("v28=",string(v28,n2),";v28o08=",char.substr(v28o08,1,150)).
compute p257="v28o08開放欄位應答而未答".
else if v28~=8 & v28o08~="".
compute m257=concat("v28=",string(v28,n2),";v28o08=",char.substr(v28o08,1,150)).
compute p257="v28o08開放欄位不該答而答".
else if v28=8 & v28o08~="".
compute m257=concat("v28=",string(v28,n2),";v28o08=",char.substr(v28o08,1,150)).
compute p257="v28o08開放欄位內容列出確認".
end if.
Exec.

 

*v29 開放欄位檢核 是否為複選題=0.
do if v29=7 & v29o07="".
Compute m258=concat("v29=",string(v29,n2),";v29o07=",char.substr(v29o07,1,150)).
compute p258="v29o07開放欄位應答而未答".
else if v29~=7 & v29o07~="".
compute m258=concat("v29=",string(v29,n2),";v29o07=",char.substr(v29o07,1,150)).
compute p258="v29o07開放欄位不該答而答".
else if v29=7 & v29o07~="".
compute m258=concat("v29=",string(v29,n2),";v29o07=",char.substr(v29o07,1,150)).
compute p258="v29o07開放欄位內容列出確認".
end if.
Exec.

 

*v29 開放欄位檢核 是否為複選題=0.
do if v29=8 & v29o08="".
Compute m259=concat("v29=",string(v29,n2),";v29o08=",char.substr(v29o08,1,150)).
compute p259="v29o08開放欄位應答而未答".
else if v29~=8 & v29o08~="".
compute m259=concat("v29=",string(v29,n2),";v29o08=",char.substr(v29o08,1,150)).
compute p259="v29o08開放欄位不該答而答".
else if v29=8 & v29o08~="".
compute m259=concat("v29=",string(v29,n2),";v29o08=",char.substr(v29o08,1,150)).
compute p259="v29o08開放欄位內容列出確認".
end if.
Exec.

 

*v45o06 開放欄位檢核 是否為複選題=1.
do if v45m06=1 & v45o06="".
Compute m260=concat("v45m06=",string(v45m06,n2),";v45o06=",char.substr(v45o06,1,150)).
compute p260="v45o06開放欄位應答而未答".
else if v45m06~=1 & v45o06~="".
compute m260=concat("v45m06=",string(v45m06,n2),";v45o06=",char.substr(v45o06,1,150)).
compute p260="v45o06開放欄位不該答而答".
else if v45m06=1 & v45o06~="".
compute m260=concat("v45m06=",string(v45m06,n2),";v45o06=",char.substr(v45o06,1,150)).
compute p260="v45o06開放欄位內容列出確認".
end if.
Exec.

 

*v50 開放欄位檢核 是否為複選題=0.
do if v50=5 & v50o05="".
Compute m261=concat("v50=",string(v50,n2),";v50o05=",char.substr(v50o05,1,150)).
compute p261="v50o05開放欄位應答而未答".
else if v50~=5 & v50o05~="".
compute m261=concat("v50=",string(v50,n2),";v50o05=",char.substr(v50o05,1,150)).
compute p261="v50o05開放欄位不該答而答".
else if v50=5 & v50o05~="".
compute m261=concat("v50=",string(v50,n2),";v50o05=",char.substr(v50o05,1,150)).
compute p261="v50o05開放欄位內容列出確認".
end if.
Exec.

 

*v51 開放欄位檢核 是否為複選題=0.
do if v51=7 & v51o07="".
Compute m262=concat("v51=",string(v51,n2),";v51o07=",char.substr(v51o07,1,150)).
compute p262="v51o07開放欄位應答而未答".
else if v51~=7 & v51o07~="".
compute m262=concat("v51=",string(v51,n2),";v51o07=",char.substr(v51o07,1,150)).
compute p262="v51o07開放欄位不該答而答".
else if v51=7 & v51o07~="".
compute m262=concat("v51=",string(v51,n2),";v51o07=",char.substr(v51o07,1,150)).
compute p262="v51o07開放欄位內容列出確認".
end if.
Exec.

 

*v52 開放欄位檢核 是否為複選題=0.
do if v52=11 & v52o11="".
Compute m263=concat("v52=",string(v52,n2),";v52o11=",char.substr(v52o11,1,150)).
compute p263="v52o11開放欄位應答而未答".
else if v52~=11 & v52o11~="".
compute m263=concat("v52=",string(v52,n2),";v52o11=",char.substr(v52o11,1,150)).
compute p263="v52o11開放欄位不該答而答".
else if v52=11 & v52o11~="".
compute m263=concat("v52=",string(v52,n2),";v52o11=",char.substr(v52o11,1,150)).
compute p263="v52o11開放欄位內容列出確認".
end if.
Exec.

 

*v57 開放欄位檢核 是否為複選題=0.
do if v57=4 & v57o04="".
Compute m264=concat("v57=",string(v57,n2),";v57o04=",char.substr(v57o04,1,150)).
compute p264="v57o04開放欄位應答而未答".
else if v57~=4 & v57o04~="".
compute m264=concat("v57=",string(v57,n2),";v57o04=",char.substr(v57o04,1,150)).
compute p264="v57o04開放欄位不該答而答".
else if v57=4 & v57o04~="".
compute m264=concat("v57=",string(v57,n2),";v57o04=",char.substr(v57o04,1,150)).
compute p264="v57o04開放欄位內容列出確認".
end if.
Exec.

 

*v58 開放欄位檢核 是否為複選題=0.
do if v58=5 & v58o05="".
Compute m265=concat("v58=",string(v58,n2),";v58o05=",char.substr(v58o05,1,150)).
compute p265="v58o05開放欄位應答而未答".
else if v58~=5 & v58o05~="".
compute m265=concat("v58=",string(v58,n2),";v58o05=",char.substr(v58o05,1,150)).
compute p265="v58o05開放欄位不該答而答".
else if v58=5 & v58o05~="".
compute m265=concat("v58=",string(v58,n2),";v58o05=",char.substr(v58o05,1,150)).
compute p265="v58o05開放欄位內容列出確認".
end if.
Exec.

 

*v59 開放欄位檢核 是否為複選題=0.
do if v59=8 & v59o08="".
Compute m266=concat("v59=",string(v59,n2),";v59o08=",char.substr(v59o08,1,150)).
compute p266="v59o08開放欄位應答而未答".
else if v59~=8 & v59o08~="".
compute m266=concat("v59=",string(v59,n2),";v59o08=",char.substr(v59o08,1,150)).
compute p266="v59o08開放欄位不該答而答".
else if v59=8 & v59o08~="".
compute m266=concat("v59=",string(v59,n2),";v59o08=",char.substr(v59o08,1,150)).
compute p266="v59o08開放欄位內容列出確認".
end if.
Exec.

 

*v69 開放欄位檢核 是否為複選題=0.
do if v69=15 & v69o15="".
Compute m267=concat("v69=",string(v69,n2),";v69o15=",char.substr(v69o15,1,150)).
compute p267="v69o15開放欄位應答而未答".
else if v69~=15 & v69o15~="".
compute m267=concat("v69=",string(v69,n2),";v69o15=",char.substr(v69o15,1,150)).
compute p267="v69o15開放欄位不該答而答".
else if v69=15 & v69o15~="".
compute m267=concat("v69=",string(v69,n2),";v69o15=",char.substr(v69o15,1,150)).
compute p267="v69o15開放欄位內容列出確認".
end if.
Exec.

 

*v70 開放欄位檢核 是否為複選題=0.
do if v70=10 & v70o10="".
Compute m268=concat("v70=",string(v70,n2),";v70o10=",char.substr(v70o10,1,150)).
compute p268="v70o10行職業開放欄位應答而未答".
else if v70~=10 & v70o10~="".
compute m268=concat("v70=",string(v70,n2),";v70o10=",char.substr(v70o10,1,150)).
compute p268="v70o10行職業開放欄位不該答而答".
else if v70=10 & v70o10~="".
compute m268=concat("v70=",string(v70,n2),";v70o10=",char.substr(v70o10,1,150)).
compute p268="v70o10行職業開放欄位內容列出確認".
end if.
Exec.

 

*v71_1 開放欄位檢核 是否為複選題=0.
do if v71_1=10 & v71_1o10="".
Compute m269=concat("v71_1=",string(v71_1,n2),";v71_1o10=",char.substr(v71_1o10,1,150)).
compute p269="v71_1o10行職業開放欄位應答而未答".
else if v71_1~=10 & v71_1o10~="".
compute m269=concat("v71_1=",string(v71_1,n2),";v71_1o10=",char.substr(v71_1o10,1,150)).
compute p269="v71_1o10行職業開放欄位不該答而答".
else if v71_1=10 & v71_1o10~="".
compute m269=concat("v71_1=",string(v71_1,n2),";v71_1o10=",char.substr(v71_1o10,1,150)).
compute p269="v71_1o10行職業開放欄位內容列出確認".
end if.
Exec.

 

*v71_2s1 開放欄位檢核 是否為複選題=0.
do if range(v71_1,1,10) & v71_2s1="".
Compute m270=concat("v71_1=",string(v71_1,n2),";v71_2s1=",char.substr(v71_2s1,1,150)).
compute p270="v71_2s1行職業開放欄位應答而未答".
else if (v71_1=96 | sys(v71_1))& v71_2s1~="96".
compute m270=concat("v71_1=",string(v71_1,n2),";v71_2s1=",char.substr(v71_2s1,1,150)).
compute p270="v71_2s1行職業開放欄位不該答而答".
else if range(v71_1,1,10) & v71_2s1~="".
compute m270=concat("v71_1=",string(v71_1,n2),";v71_2s1=",char.substr(v71_2s1,1,150)).
compute p270="v71_2s1行職業開放欄位內容列出確認".
end if.
Exec.

 

*v71_2s2 開放欄位檢核 是否為複選題=0.
do if range(v71_1,1,10) & v71_2s2="".
Compute m271=concat("v71_1=",string(v71_1,n2),";v71_2s2=",char.substr(v71_2s2,1,150)).
compute p271="v71_2s2行職業開放欄位應答而未答".
else if  (v71_1=96 | sys(v71_1)) & v71_2s2~="96".
compute m271=concat("v71_1=",string(v71_1,n2),";v71_2s2=",char.substr(v71_2s2,1,150)).
compute p271="v71_2s2行職業開放欄位不該答而答".
else if range(v71_1,1,10) & v71_2s2~="".
compute m271=concat("v71_1=",string(v71_1,n2),";v71_2s2=",char.substr(v71_2s2,1,150)).
compute p271="v71_2s2行職業開放欄位內容列出確認".
end if.
Exec.

 

*v71_2s3 開放欄位檢核 是否為複選題=0.
do if range(v71_1,1,10) & v71_2s3="".
Compute m272=concat("v71_1=",string(v71_1,n2),";v71_2s3=",char.substr(v71_2s3,1,150)).
compute p272="v71_2s3行職業開放欄位應答而未答".
else if  (v71_1=96 | sys(v71_1)) & v71_2s3~="96".
compute m272=concat("v71_1=",string(v71_1,n2),";v71_2s3=",char.substr(v71_2s3,1,150)).
compute p272="v71_2s3行職業開放欄位不該答而答".
else if range(v71_1,1,10) & v71_2s3~="".
compute m272=concat("v71_1=",string(v71_1,n2),";v71_2s3=",char.substr(v71_2s3,1,150)).
compute p272="v71_2s3行職業開放欄位內容列出確認".
end if.
Exec.

 

*v71_2s4 開放欄位檢核 是否為複選題=0.
do if range(v71_1,1,10) & v71_2s4="".
Compute m273=concat("v71_1=",string(v71_1,n2),";v71_2s4=",char.substr(v71_2s4,1,150)).
compute p273="v71_2s4行職業開放欄位應答而未答".
else if  (v71_1=96 | sys(v71_1)) & v71_2s4~="96".
compute m273=concat("v71_1=",string(v71_1,n2),";v71_2s4=",char.substr(v71_2s4,1,150)).
compute p273="v71_2s4行職業開放欄位不該答而答".
else if range(v71_1,1,10) & v71_2s4~="".
compute m273=concat("v71_1=",string(v71_1,n2),";v71_2s4=",char.substr(v71_2s4,1,150)).
compute p273="v71_2s4行職業開放欄位內容列出確認".
end if.
Exec.

 

*v74 開放欄位檢核 是否為複選題=0.
do if v74=9 & v74o09="".
Compute m274=concat("v74=",string(v74,n2),";v74o09=",char.substr(v74o09,1,150)).
compute p274="v74o09行職業開放欄位應答而未答".
else if v74~=9 & v74o09~="".
compute m274=concat("v74=",string(v74,n2),";v74o09=",char.substr(v74o09,1,150)).
compute p274="v74o09行職業開放欄位不該答而答".
else if v74=9 & v74o09~="".
compute m274=concat("v74=",string(v74,n2),";v74o09=",char.substr(v74o09,1,150)).
compute p274="v74o09行職業開放欄位內容列出確認".
end if.
Exec.

 

*v75 開放欄位檢核 是否為複選題=0.
do if v75=5 & v75o05="".
Compute m275=concat("v75=",string(v75,n2),";v75o05=",char.substr(v75o05,1,150)).
compute p275="v75o05開放欄位應答而未答".
else if v75~=5 & v75o05~="".
compute m275=concat("v75=",string(v75,n2),";v75o05=",char.substr(v75o05,1,150)).
compute p275="v75o05開放欄位不該答而答".
else if v75=5 & v75o05~="".
compute m275=concat("v75=",string(v75,n2),";v75o05=",char.substr(v75o05,1,150)).
compute p275="v75o05開放欄位內容列出確認".
end if.
Exec.

 

*vZ1city 開放欄位檢核 是否為複選題=0.
do if vZ1city=29 & vZ1city_oth="".
Compute m276=concat("vZ1city=",string(vZ1city,n7),";vZ1city_oth=",char.substr(vZ1city_oth,1,150)).
compute p276="vZ1city_oth開放欄位應答而未答".
else if vZ1city~=29 & vZ1city_oth~="".
compute m276=concat("vZ1city=",string(vZ1city,n7),";vZ1city_oth=",char.substr(vZ1city_oth,1,150)).
compute p276="vZ1city_oth開放欄位不該答而答".
else if vZ1city=29 & vZ1city_oth~="".
compute m276=concat("vZ1city=",string(vZ1city,n7),";vZ1city_oth=",char.substr(vZ1city_oth,1,150)).
compute p276="vZ1city_oth開放欄位內容列出確認".
end if.
Exec.

 

*vZ2city 開放欄位檢核 是否為複選題=0.
do if vZ2city=29 & vZ2city_oth="".
Compute m277=concat("v70=",string(v70,n2),";vZ2city=",string(vZ2city,n7),";vZ2city_oth=",char.substr(vZ2city_oth,1,150)).
compute p277="vZ2city_oth開放欄位應答而未答".
else if vZ2city~=29 & vZ2city_oth~="".
compute m277=concat("v70=",string(v70,n2),";vZ2city=",string(vZ2city,n7),";vZ2city_oth=",char.substr(vZ2city_oth,1,150)).
compute p277="vZ2city_oth開放欄位不該答而答".
else if vZ2city=29 & vZ2city_oth~="".
compute m277=concat("v70=",string(v70,n2),";vZ2city=",string(vZ2city,n7),";vZ2city_oth=",char.substr(vZ2city_oth,1,150)).
compute p277="vZ2city_oth開放欄位內容列出確認".
end if.
Exec.

 

*vZ3city 開放欄位檢核 是否為複選題=0.
do if vZ3city=29 & vZ3city_oth="".
Compute m278=concat("vZ3city=",string(vZ3city,n7),";vZ3city_oth=",char.substr(vZ3city_oth,1,150)).
compute p278="vZ3city_oth開放欄位應答而未答".
else if vZ3city~=29 & vZ3city_oth~="".
compute m278=concat("vZ3city=",string(vZ3city,n7),";vZ3city_oth=",char.substr(vZ3city_oth,1,150)).
compute p278="vZ3city_oth開放欄位不該答而答".
else if vZ3city=29 & vZ3city_oth~="".
compute m278=concat("vZ3city=",string(vZ3city,n7),";vZ3city_oth=",char.substr(vZ3city_oth,1,150)).
compute p278="vZ3city_oth開放欄位內容列出確認".
end if.
Exec.

*行職業彙整輸出.
do if range(v70,1,4,10,10).
compute m279=concat("v70=",string(v70,n2),";v70o10=",char.substr(v70o10,1,150),";v71_1=",string(v71_1,n2),";v71_1o10=",char.substr(v71_1o10,1,150),";",char.substr(v71_2s1,1,150),
    ";",char.substr(v71_2s2,1,150),";",char.substr(v71_2s3,1,150),";",char.substr(v71_2s4,1,150)).
compute p279="完整行職業內容確認".
end if.
EXECUTE.

**3.複選題檢核.
* vQ24 組合.
STRING v45 v46 v48 (A600).
COMPUTE v45 = Rtrim(Ltrim(concat("v45m01=",string(v45m01,f2)," , ","v45m02=",string(v45m02,f2)," , ","v45m03=",string(v45m03,f2)," , ","v45m04=",string(v45m04,f2)," , ","v45m05=",string(v45m05,f2)," , ","v45m06=",string(v45m06,f2)
    ," , ","v45m07=",string(v45m07,f2)))).
COMPUTE v46 = Rtrim(Ltrim(concat("v46m01=",string(v46m01,f2)," , ","v46m02=",string(v46m02,f2)," , ","v46m03=",string(v46m03,f2)," , ","v46m04=",string(v46m04,f2)," , ","v46m05=",string(v46m05,f2)," , ","v46m06=",string(v46m06,f2)
    ," , ","v46m07=",string(v46m07,f2)))).
COMPUTE v48 = Rtrim(Ltrim(concat("v48m01=",string(v48m01,f2)," , ","v48m02=",string(v48m02,f2)," , ","v48m03=",string(v48m03,f2)," , ","v48m04=",string(v48m04,f2)," , ","v48m05=",string(v48m05,f2)," , ","v48m06=",string(v48m06,f2)
    ," , ","v48m07=",string(v48m07,f2)))).

*v45.
vector a=v45m01 to v45m07.
COMPUTE #45zero = (SUM(v45m01 TO v45m07) = 0).
loop #i=1 to 6.
do if (any(a(#i),0,1) & any(a(#i+1),96))
| (any(a(#i),96) and not any(a(#i+1),96))|#45zero =1.
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
| (any(a(#i),96) and not any(a(#i+1),96))| #46zero =1.
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
| (any(a(#i),96) and not any(a(#i+1),96))|#48zero =1.
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



**4.邏輯檢核.
SET MPRINT= no.
*///////////////////////////////.
DEFINE macro1(!POS !CHAREND('/'))
!do !i !in (!1).
do if  any(!i,96,996,999996,9999996,9999999996,99969696969696).
compute !concat(!i,"_96")=1.
else.
compute !concat(!i,"_96")=0.
end if.
!doend.
exec.

!ENDDEFINE.
*///////////////////////////////.
*請使用者輸入要處理的變項.
macro1
v0
v1
v2
v3s1
v3s2
v4
v5
v6
v7
v8
v9
v10
v11
v12
v13
v14
v15
v16
v17
v18
v19
v20
v21
v22
v23
v24
v25
v26
v27
v28
v29
v30s1
v30s2
v30s3
v30s4
v30s5
v30s6
v30s7
v31s1
v31s2
v31s3
v31s4
v31s5
v31s6
v32s1
v32s2
v32s3
v32s4
v33
v33_1
v33_2
v33_3
v33_4
v33_5
v34
v35
v36
v37
v38
v39
v40
v41
v42
v43
v44
v45m01
v45m02
v45m03
v45m04
v45m05
v45m06
v45m07
v46m01
v46m02
v46m03
v46m04
v46m05
v46m06
v46m07
v47
v48m01
v48m02
v48m03
v48m04
v48m05
v48m06
v48m07
v49
vCK49
v50
v51
v52
v53
v54
v55
v56
v57
v58
v59
v60
v61
v62
v63
v64
v65
v66
v67
v68
v69
v70
v71_1
v72
v73
v74
v75
v76
v77
vZ1city
vZ1town
vZ2city
vZ2town
vZ3city
vZ3town
vEND /.

*b1跳題邏輯.
do if b=1 & any(1,v33_1_96).
compute m401=concat("b=",string(b,n2),",v33_1=",string(v33_1,n14)).
compute p401="b=1，應答v33_1而未答".
end if.

do if b~=1 & any(0,v33_1_96).
compute m402=concat("b=",string(b,n2),",v33_1=",string(v33_1,n14)).
compute p402="b~=1，不應答v33_1而答".
end if.

*b2跳題邏輯.
do if b=2 & any(1,v33_2_96).
compute m403=concat("b=",string(b,n2),",v33_2=",string(v33_2,n14)).
compute p403="b=2，應答v33_2而未答".
end if.

do if b~=2 & any(0,v33_2_96).
compute m404=concat("b=",string(b,n2),",v33_2=",string(v33_2,n14)).
compute p404="b~=2，不應答v33_2而答".
end if.

*b3跳題邏輯.
do if b=3 & any(1,v33_3_96).
compute m405=concat("b=",string(b,n2),",v33_3=",string(v33_3,n14)).
compute p405="b=3，應答v33_3而未答".
end if.

do if b~=3 & any(0,v33_3_96).
compute m406=concat("b=",string(b,n2),",v33_3=",string(v33_3,n14)).
compute p406="b~=3，不應答v33_3而答".
end if.

*b4跳題邏輯.
do if b=4 & any(1,v33_4_96).
compute m407=concat("b=",string(b,n2),",v33_4=",string(v33_4,n14)).
compute p407="b=4，應答v33_4而未答".
end if.

do if b~=4 & any(0,v33_4_96).
compute m408=concat("b=",string(b,n2),",v33_3=",string(v33_4,n14)).
compute p408="b~=4，不應答v33_4而答".
end if.

*b5跳題邏輯.
do if b=5 & any(1,v33_5_96).
compute m409=concat("b=",string(b,n2),",v33_5=",string(v33_5,n14)).
compute p409="b=5，應答v33_5而未答".
end if.

do if b~=5 & any(0,v33_5_96).
compute m410=concat("b=",string(b,n2),",v33_5=",string(v33_5,n14)).
compute p410="b~=5，不應答v33_5而答".
end if.

*b5跳題邏輯.
do if v50<=3 & any(0,v51_96).
compute m411=concat("v50=",string(v50,n2),",v51=",string(v51,n2)).
compute p411="v50<=3，不應答v51而答".
end if.


do if v50>=4 & v50<96 & any(1,v51_96).
compute m412=concat("v50=",string(v50,n2),",v51=",string(v51,n2)).
compute p412="v50>=4，應答v51而未答".
end if.

do if v57=3 & any(1,v58_96).
compute m413=concat("v57=",string(v57,n2),",v58=",string(v58,n10)).
compute p413="v57=3，應答v58而未答".
end if.

do if v57~=3 & any(0,v58_96).
compute m414=concat("v57=",string(v57,n2),",v58=",string(v58,n10)).
compute p414="v57~=3，不應答v58而答".
end if.

do if any(v70,1,2,3,4,10) & (any(1,v71_1_96) | v71_2s1="96" | v71_2s2="96" | v71_2s3="96" |v71_2s4="96" ).
compute m415=concat("v70=",string(v70,n2),",v71_1=",string(v71_1,n2)).
compute p415="v70=1,2,3,4,10，應答v71而未答".
end if.

do if v70>=5 & v70<10 &  (any(0,v71_1_96) | v71_2s1~="96" | v71_2s2~="96" | v71_2s3~="96" |v71_2s4~="96" ).
compute m416=concat("v70=",string(v70,n2),",v71_1=",string(v71_1,n2)).
compute p416=" v70>=5 & v70<10，不應答v71而答".
end if.

*vZ2city跳題邏輯.
do if v70>=4 & v70<10 & any(0,vZ2city_96).
compute m417=concat("v70=",string(v70,n2),",vZ2city=",string(vZ2city,n2)).
compute p417="v70>=4 & v70<10，不應答vZ2city而答".
end if.

do if any(v70,1,2,3,10) & any(1,vZ2city_96).
compute m418=concat("v70=",string(v70,n2),",vZ2city=",string(vZ2city,n2)).
compute p418="v70 in 1~3,10，應答vZ2city而未答".
end if.

do if v70~=5 & any(0,vZ3city_96).
compute m419=concat("v70=",string(v70,n2),",vZ3city=",string(vZ3city,n2)).
compute p419="v70~=5，不應答vZ3city而答".
end if.

do if v70=5 & any(1,vZ3city_96).
compute m420=concat("v70=",string(v70,n2),",vZ3city=",string(vZ3city,n2)).
compute p420="v70=5，應答vZ3city而未答".
end if.


*檢核項目清單.
*1.v49居住地區的年數不應大於受訪者的年齡(115-v1)。.
compute v1check=115-v1.
compute v1check2=v49f-v1check.
do if v1check2>3.
compute m421=concat("v1=",string(v1,n2),",v49f=",string(v49f,n2),",計算後年齡=",string(v1check,n2),",年數差=",string(v1check2,n2)).
compute p421="v49居住地區的年數超過受訪者年齡3歲".
end if.

*2.教育程度不可能為(01)無.
do if v69=1.
compute m422=concat("v69=",string(v69,n2)).
compute p422="教育程度不應為(01)無".
end if.

*3.每天平均上網時間超過16小時.
do if v47>1600.
compute m423=concat("v47=",string(v47,n4)).
compute p423="每天平均上網時間超過16小時".
end if.

*4.v70有工作（選項01-03），且v71_1不為「(04)」者，v72個人平均每個月收入不應為(01)沒有收入。.
do if  any(v70,1,2,3) & v71_1~=4 & v72=1.
compute m424=concat("v70=",string(v70,n2),",v71_1=",string(v71_1,n2),",v72=",string(v72,n2)).
compute p424="v70填答有工作，且不為沒有拿薪水，但v72個人平均每個月收入為(01)沒有收入".
end if.
*"v70有工作（選項01-03），且v71_1不為「(04)」者，v72個人平均每個月收入不應為(01)沒有收入".

*教育程度上升2階列出本人填答.
 do if  ((range(v69,6,8)&any(edu2026,2,3))|(range(v69,9,13) & any(edu2026,4))|(any(v69,14)&any(edu2026,5))) & CKgender=0 & CKbirth=0.
compute m507=concat('v69=',string(v69,n2),',edu2026=',string(edu2026,n2),',gender2026=',string(gender2026,n2),',birth2026=',string(birth2026,n2)).
compute p507="本人填答教育程度上升兩階".
end if.


*教育程度上升2階列出非本人填答.
 do if  ((range(v69,6,8)&any(edu2026,2,3))|(range(v69,9,13) & any(edu2026,4))|(any(v69,14)&any(edu2026,5))) & (CKgender=1 or CKbirth=1).
compute m508=concat('v69=',string(v69,n2),',edu2026=',string(edu2026,n2),',gender2026=',string(gender2026,n2),',birth2026=',string(birth2026,n2)).
compute p508="非本人填答教育程度上升兩階".
end if.

save  outfile="\\140.109.171.240\worker\worker_sec\網調協辦計畫\W202606 邁向淨零社會_永續能源創新科技的公眾支持\02資料檔及不符合品\02資料檔\04檢核程式\結束處理\data_s_check.sav".
exec.
***************************************************************.
*資料轉置.
get file="\\140.109.171.240\worker\worker_sec\網調協辦計畫\W202606 邁向淨零社會_永續能源創新科技的公眾支持\02資料檔及不符合品\02資料檔\04檢核程式\結束處理\data_s_check.sav".
exec.
***************************************************************.
sort cases by id .
VARSTOCASES  
 /MAKE 變項名稱及答案 from m100 to m600
 /MAKE 不符合說明 from p100 to p600
 /KEEP =id  wno v0 v1 
 /null = drop                                                                         
 /count = count.   

 * string 不再列出 不給訪員 協辦回覆  (a20).
string 檢核日期(a4).
compute 檢核日期="0605".

*string indexC(a300).
*compute indexC=Rtrim(Ltrim(concat(string(id,f8)," ",char.substr(不符合說明,1,150)))).
*exec.

save  outfile="\\140.109.171.240\worker\worker_sec\網調協辦計畫\W202606 邁向淨零社會_永續能源創新科技的公眾支持\02資料檔及不符合品\02資料檔\04檢核程式\結束處理\data_s檢核結果.sav".
exec.

*輸出問卷不符合品.
temp.
select if char.index(不符合說明,"開放欄位")=0 & char.index(不符合說明,"完整行職業內容確認")=0.
SAVE TRANSLATE OUTFILE="\\140.109.171.240\worker\worker_sec\網調協辦計畫\W202606 邁向淨零社會_永續能源創新科技的公眾支持\02資料檔及不符合品\01不符合品\結束處理\問卷不符合品0605.xlsx"
  /TYPE=XLS
  /VERSION=12
  /MAP
  /FIELDNAMES VALUE=NAMES
  /CELLS=VALUES
  /EXCELOPTIONS SHEET='問卷不符合品'
  /MISSING=RECODE
  /rename=(id,v1,v0=樣本編號,年次,性別)
  /replace
  /keep=檢核日期  樣本編號 wno  性別 年次 變項名稱及答案 不符合說明. 

*輸出開放欄位.
temp.
select if char.index(不符合說明,"開放欄位")>0.
SAVE TRANSLATE OUTFILE='\\140.109.171.240\worker\worker_sec\網調協辦計畫\W202606 邁向淨零社會_永續能源創新科技的公眾支持\02資料檔及不符合品\01不符合品\結束處理\問卷不符合品0605.xlsx'
  /TYPE=XLS
  /VERSION=12
  /MAP
  /FIELDNAMES VALUE=NAMES
  /CELLS=VALUES
  /EXCELOPTIONS SHEET='開放欄位'
  /MISSING=RECODE
  /rename=(id,v1,v0=樣本編號,年次,性別)
  /APPEND
  /keep=檢核日期  樣本編號 wno  性別 年次 變項名稱及答案 不符合說明. 

*行職業內容完整確認.
temp.
select if char.index(不符合說明,"完整行職業內容確認")>0.
SAVE TRANSLATE OUTFILE="\\140.109.171.240\worker\worker_sec\網調協辦計畫\W202606 邁向淨零社會_永續能源創新科技的公眾支持\02資料檔及不符合品\01不符合品\結束處理\問卷不符合品0605.xlsx"
  /TYPE=XLS
  /VERSION=12
  /MAP
  /FIELDNAMES VALUE=NAMES
  /CELLS=VALUES
  /EXCELOPTIONS SHEET='完整行職業內容確認'
  /MISSING=RECODE
  /rename=(id,v1,v0=樣本編號,年次,性別)
  /APPEND
  /keep=檢核日期  樣本編號 wno  性別 年次 變項名稱及答案 不符合說明. 

