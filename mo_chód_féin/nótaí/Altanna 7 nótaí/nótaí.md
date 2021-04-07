# nótaí ar Altanna

## Jeffrey (Siotrhún) Sardina

## Altanna ar LTCGA 7 BIOOPENER

### Linked Cancer Genome Atlas Database ("LTCGA") (Bunachar Nasctha Atlais Géanóim na hAilse)
Nasc: https://www.researchgate.net/publication/258849003_Linked_Cancer_Genome_Atlas_Database

Aidhmeanna
- Eolas ar an ailse a nascadh
- An t-eolas sin a chur ar fáil trí chríochphointe SPARQL

Eolas i TCGA
- 3 Leibhéial atá an: 1 (eolas lom), 2 (eolas normalaithe), 3 (eolas próiseáilte)
- Ní bhaineann siad úsáid ach as eolas próiseáilte

Tionscadail eile
- Deus et al. (anseo mar alt 5) -- TCGA a bhur ar fáil mar críochphointe SPARQL
- Robbins et.  al -- córas chun TCGA a shéanadh 7 a nótáil go leanúnach
- Ní rinne siad ach comhaid a fháil (ní dhearna siad tada leis an eolas isteach ins na comhaid)

Sreabhadh Oibre
- Eolas téacs ó TCGA => Glantóir eolais (roghnaigh cén saghais eolas atá á n-iarradh) => Aistriú gon RDF

Nascanna go Bunachair EN (Eolas Nasctha) eile
- Déanta trí LIMES (córas aimsithe nascanna)
- nasctha go HGNC OMIM, 7 Homologene

Structúr a Ointeolaíochta
- Aicmí déanta ar son na trí saghas eolais atá ina an TCGA:
    - Eolas pearsanta
    - Eolas cliniciúil
    - Bithshamplaí ón duine

Nascanna eile
- A dtionscadal: http://tcga.deri.ie/


### Big linked cancer data: Integrating linked TCGA and PubMed (Eolas mór nasctha na hailse: Comhcheangal LTCGA 7 PubMed)
Nasc: https://www.sciencedirect.com/science/article/abs/pii/S1570826814000523

A rinneadar
- Eolas scríofa (ó Pubmed) a nascadh le LTCGA
- É sin a chur ar fáil trí córas cuardaigh cónasctha
- Comhéadan grafach úsáideora a chur thar an gcóras seo, go dtí go bhfuil sé níos éasca eolas a fháil (Linked TCGA Dashboard)


### Towards precision medicine: discovering novel gynecological cancer biomarkers and pathways using linked data (Chun beachtleigheas: fáil bithbhealaí agus bithchomharthaí ailse gíneiceolaícohta nua trí eolas nasctha) (Fé Chruthú BIOOPENER)
Nasc: https://www.ncbi.nlm.nih.gov/pmc/articles/PMC5606033/
A rinneadar
- TGCA, COSMIC, ReACTOME, KEGG, 7 GO a nascadh trí Graf Eolais (GE)
- Illumina Human Body Map 2.0 (fointe eolais géinte le léiriú éagsúla ins an ailse) a úsáid (le TCGA 7 COSMIC fresin) le bithchomharthaí nua a fháil do na saghais aile a bhí i gceist acu. Léirigh siad a mbealaí freisin.

A dhéanann BIOOPENER
- Nascann sé TGCA, COSMIC, ReACTOME, KEGG, 7 GO
- Cruthaíonn sé nascanna idir na foinsí sin go uath-oibríoch
- Tá sé ana-cosúil be Bio2RDF (a deir siad féin!) agus bhain siad úsáid as obair Bio2RDF d'eolas REACTOMNE, KEGG,7 GO ar Bio2RDF

Dúshláin
- aistriú go RDF
- léiriú / fáil nascanna (trí phatrúin / trí chomhghaol)
- iarratais a déanamh ar an eolas go hinscálaithe

Iarrtais cónaidhme: SAFE
- Críochpointe amháin le iarratas a dhéanamh thar foinsí éagsúla
- Bhí orthu é a athrú ionas go oibróidh se le graf BIOOPENER
- Roghnaíonn sé cén bunachair triaracha / cén graf ainmnithe a bhreathnú air

Aistriú go RDF
- trí a gcód féinig

Nascadh
- trí owl:sameAs
- Nasc siad focail comhchiallacha le chéile (mar shampla, Hugo Symbol, TGCA_ID 7 ENSEMBL ID)


## Altanna fé Bitheolas Nasctha Ginearálta

### Publishing Life Science Data as Linked Open Data: the Case Study of miRBase (Foilsiú Eolas Bitheolaíochta mar Eolas Nasctha: staidéar cáis miRBase)
Nasc: https://arxiv.org/pdf/1205.2320.pdf (agus mar PDF anseo)
Aidhm
- Críochphointe SPARQL a chruthú d'eolas miARN
- Bhí siad ag iarradh sean-eagráin a mbunachair a chur ar fáil freisin, go dtí go bhfuil a stair iomlán ar fáil (cabhraíonn sé seo le hath-úsáid an eolais)

Críochphointe
- as feidhm anois (Nollag 2020)

Obair gaolta leis an obair seo
- HCLS (Semantic Web Health Care and Life Sciences Interest Group / Grúpa sainleasa an ghréasáin séameantach dírithe ar cúram sláinte agus bitheolaíocht). Déanta ag W3C 
- LOOD (Linked Open Drug Data / Eolas Nascatha Oscailte ar Drugaí)
- Chem2Bio2RDF
- Córais leaganaithe RDF

Ina mbunachar
- eolas ar miARN, tras-scríbhinní, géinte próitéine
- bithbhealaí Kegg (scríofa de lámh)

Leagain éagsúla
- D'úsáid siad roinnt comhaid chun teacht suas ar athruithe idir gach leagan
- Bhí roinnt eolas iomlán ann, agus roinnt foinse eolas gan ach eolas difríochta curtha isteach iontu

Foilsiú an eolais mar Eolas Oscailte Nasctha
- Bhain siad úsáid as "RDF fíorúil" go dtí go mbeadh siad in ann iarratais a chur ar miRBase gan aistriú iomlán go RDF


### BioMuta and BioXpress: mutation and expression knowledgebases for cancer biomarker discovery
Nasc: https://www.ncbi.nlm.nih.gov/pmc/articles/PMC5753215/
Níor léigh mé é ar iomlán -- Níl sé ar fáil mar RDF fé láthair (ach plean acu go mbeidh)

### OncoMX: A Knowledgebase for Exploring Cancer Biomarkers in the Context of Related Cancer and Healthy Data
nasc: https://ascopubs.org/doi/10.1200/CCI.19.00117?url_ver=Z39.88-2003&rfr_id=ori%3Arid%3Acrossref.org&rfr_dat=cr_pub++0pubmed&
Níor léigh mé é ar iomlán -- níl an t-eolas ar fáil ar mar RDF ach mar JSON


### NCI Thesaurus: A semantic model integrating cancer-related clinical and molecular information
Nasc: https://www-sciencedirect-com.elib.tcd.ie/science/article/pii/S1532046406000311?via%3Dihub (Trí TCD) (agus mar PDF anseo)
Aidhm
 - Ar dtús, eolas na haeilge ó fhoinsí éagsúla (tauirim is 40) a chur le chéile.
 - Anois, chun gaolta idir na coincheapa sin a a léiriú freisintrí OWL

Structúr
 - Bhí sé cruthaithe ar Ontylog (córas loighic tuairisce), ach anois tá sé ar fáil i bhformáid OWL fresin
 - Tá nascanna idir: drugaí, athruithe crómasóm, atruithe géinte, an ailse, agus prognóis.


### Regular Paths in SparQL: Querying the NCI Thesaurus
Nasc: https://www.ncbi.nlm.nih.gov/pmc/articles/PMC2656016/
Aidhm: labhairt fé GLEEN, forlíontán ARQ d'iarratais SPARQL. Ceadaíonn sé cruthú bealaí faisnéise (cosúil le RegEx) idir ainmníthe 7 cuspóirí.

## Altanna ar Meaisínfhoghlaim

### Knowledge Graph Embedding: A Survey of Approaches and Applications
Nasc: https://ieeexplore.ieee.org/document/8047276 (7 mar pdf anseo)
Buneolas
- Is é aistriú ó ghraf go veicteoir é leabú graif eolais. Léiríonn an t-alt caidé mar atá tú in ann an t-aistriú seo a dhéanamh. Tá roinnt rogha ann a léiríonn sé, iad nua nó in úsáid faoi láthair. Bhaineann an chóras meaisínfhoghlamtha triail as foghlai céard iad na fíricí fíora (ar cheart dóoibh a bheith ins an ngraf) agus céard iad na cinn bréagacha (nár cheart dóibh a bheith istigh ann).
- Ach tá tú in ann níos mó ná seo a dhéanamh leis an gcóras go deimhin.

Sreabhadh oibre, ge gnáth:
Aistriú gach firice (ina n-aonáin 7 ina bpreideacháidí) go spás leanúnach veicteora
Feidhm scóir a shainmhíniú do ghach fíric (mar thomhas ar cé chomh dóchúil is atá sí).

Saghais algarataim meaisínfhoghlamtha:
- a bhaineann úsáid as fíricí loma amháin:
    - a úsáidean achar Eoiclídeach mar fheidhm scóir
    - a úsáidean comhcholúlacht mar fheidhm scóir
    - Don dá shaghas ansin, is minic a cuireann aistriú ar an dá aonán (ainmní 7 cuspóir) mar ionadaíocht don preideacháid roimh an t-achar a fháil. Ach ní dhéantar í gcónaí é sin.
- a bhaineann úsáid as eolais breise:
    - is féidir saghas na n-aonán, bealaí na bpreideacháid, míniuithe théacs, 7 foinsí eolais eile

Aidhmeanna na gcóras seo:
- is féidir ceisteanna a fhreagairt trí córas le eolas ón ngraf eolais 7 téacws na ceiste.

Rudaí eile
- tá sé éasca go leor téacs a chur le graf eolas, agus dé ghnáth níos fearr ná a bheith gan an téacs a chur ins an áireamh.


### Biological applications of knowledge graph embedding models
Nasc: https://academic.oup.com/bib/advance-article-abstract/doi/10.1093/bib/bbaa012/5739186 (7 mar pdf anseo)
Aidhm:
- labhairt fé leabhú GE bitheolaíochta

Cáis staidéir
- ar idirghníomhacht drugaí ar réamhinsint (ar mhaith 7 ar a mhalart)
- feidhmeanna próitéiní éagsúla i gcomhthéacsanna éagsúla a réamhinsint
- dé ghnáth, tá GEanna níos fearr ná córais réamhinsinte eile
- conas foghlaim cé chomh cosúil is atá dhá rudaí (trí leabú GE)
- braisliú (cluistering) trí GE-anna
- Tá GE-anna inscálaithe den chuid is mó, agus níos fearr ná córais eile atá ann i mbitheolaíocht anois
- Tá roinnt fadhbanna acu--bithbealaí casta a chur ins an áireamh, mar shampla--ach cumasach den cuid is mó.

Nótaí
- tá liosta GE-anna bitheolaíochta deas aige! Ba cheart TEACHT THAR N-AIS chuige
- tá liosta algarataim leabaithe GE 7 foinsí cóid dóibh ann!! TEACHT THAR N-AIS


### BioKEEN: a library for learning and evaluating biological knowledge graph embeddings
Nasc: https://academic.oup.com/bioinformatics/article-abstract/35/18/3538/5320556 (7 mar pdf anseo)

A rinne siad:
- chrithaigh siad BioKEEN (córas leabaithe GE don bhitheolaíocht) agys PyKEEN (córas leabaithe GE ginearálta)
- Tá siad simplí, go dtí nach bhfuil mórán eolas ar meaisínfhoghlaim ó a lucht úsáideoirí
- Tá a chuid eolas ar fáil go huath-oibríoch, ach is féidir níos mó a chur isteach trí RDF, tsv, 7rl.


### Modern deep learning in bioinformatics
Nasc: https://academic.oup.com/jmcb/advance-article/doi/10.1093/jmcb/mjaa030/5861537?login=true

Nótaí
- gan mórán le rá ar GEanna, ach go bhfuil foghlaim siombalach in ann cabhrú leo ins an mbitheolaíocht. De ghnáth, tá an córas seo níos fearr na córais gan foghlaim siombalach.


### Evaluation of knowledge graph embedding approaches for drug-drug interaction prediction in realistic settings 
Nasc: https://pubmed.ncbi.nlm.nih.gov/31852427/
Eolas:
- ar obair gaolta 7 foinsí GE (ins an Réamhrá)
- sreabhadh oibre gnáthúil
    - gach rud a chur i RDF (leabú) trí meaisínfhoghlaim (feic ar [18])
    - ML gnáthúil (Logistic Regression, 7rl) úsáid ar na veicteoir a bhaintear amach as
    - nóta -- uaireannta is gá eolas a thógáil amach (mar shampla, ní cheart eolas ar idirghníomhú druga-druga a choinneáil más ea atá an córas ag foghlaim!)
    - nóta eile -- is féidir gach ceist i leabuithe GE a fhreagairt trí détheilgean go réamhinsint naiscs

algarataim leabaithe a d'úsáid siad
- RDF2Vec, TransE, TransD

crosbhailíochtú (chun cruinneas an chórais a fháil)
- Ní féidir seo a dhéanamh leis an algartam gnáthúil--mar atá péirí ins an ngraf, is féidir go mbeidh an réad céanna ins an dá thacar.  Mar sin, caithfidh tú seo a sheachaint.
- Uaireanta is fearr traenáil ar seansolas agus imscrúdú a dhénanamh le heolas nua, mar is amhlaidh atá an 'fíorshaol'--caithfidh tú triail a bhaint as eolas nua a réamhinsint!
- Léiriíonn siad é seo ins an Réamhrá 7 "Evalutation"

torthaí
- Bhí córais RDF2Vec (Skip-Gram 7 CBOW) i bhfad níos fearr ná TransE 7 TransD. Móide sin, tar éis na veicteoirí a leabú, bhí Random Forest an t-algartam is fearr chun idirghníomhú druga-druga a réamhinsint
- Ní raibh búntaiste aon graf eolais eile a chur le drugbank--ní dheachaigh sé ar feabhas

Nótaí ar deireadh
- ní nféidir leis an gcóras seo léiriú cén chaoi a idirghníomhaíonn dhá druga, mar atá an líonra néarach mar "bhosca dubh"


### A Review of Relational Machine Learning for Knowledge Graphs
Nasc: https://ieeexplore.ieee.org/abstract/document/7358050 (7 mar pdf anseo)
Ar dtús:
- Nuair a dier siad 'relational data', is ionann sin agus sonraí i ngraf, le naisc ('relations') ann.
- Tá an t-alt seo cosúil le roinnt cinn eile, agus nílim chun atheolas a chur anseo.
- Tá trí slite chun Foghlaim Staitistiúil Coibhneasta (Statistical Relational Learning) a dhéanamh. (Ins an gcás seo, is í foghlaim gaol idir aonán 's nasc í Foghlaim Staitistiúil Coibhneasta)
    - slí 1: trí athróga neamhfollasa ("latent ft. models")
    - slí 2: trí staitisticí díreacha ar airí / struchtúr an ghraif ("graph feature models")
    - slí 3: trí ghlacadh go bhfuil firicí spleách ar firicí eile cosúil leo ("Markov random fields")

Eolas úsáideach atá isteach ann:
- léiriú ar a lán saghas foghlaim coibhneasta, cosúil le [18] (cuid IV). Ach tá an t-alt seo níos statistiúla, go speisialta mar atá gach algartam curtha i gcomhthéacs slí 1 - 3 (thuas)

Slí 1: Samhalacha Airí Neamhfhollas
- Airí neach bhfuil ins an ngraf mar nasc is ea iad airí neamhfhollasa. Baineann na halgartaim seo triail as gach aire neamhfhollas  a fháil 7 a úsáid chun fíricí a réamhinsint. De ghnáth, níl na cinn seo éssca a léiriú mar gheall ar 'bosca dubh' na meaisínfhoghlamtha.

Slí 2: Samhalacha Airí Graif
- Baineann sé úsáid as eolas ins an ngraf chun samhailteacht a áireamh. Níl úsáideann na halgartaim seo ach eolas (fíricí) ins an ngraf.
- Mar shampla, is féidir
    - rialacha loighiciúla a fhoghlaim ón ngraf. Ach is minic go bhfuil sé deacair rialacha úsáideacha a fhoghalim
- tá siad seo níos tapaidh / níos fearr nuair is féidir fíricí a léiriú ó firicí eile áitiúla.

Is féidir 1 agus 2 a chur le chéile, agus tá sé sin a bhfad níos cumhachtaí
- tá siad níos tapaidh freisin, mar níl ar 1 a chur ins an áireamh ach nach bhfuil i samhail 2. Mar sin, tá méid níos lú athróga neamhfhollasa le foghlaim aici.
    - is féidir seo a dhéanamh trí samhail shuimitheach (ag traenáil an dá taobh ag an am céanna) ní trí samhail chomhtháthaithe (an dá shamhail a thraenáil ina n-aonar, agus a chur le chéile in diaidh sin chun fíricí a réamhinsint). "stacking"
    - ins an dara cás, tá an dá shamhail níos casta, ach tá siad níos fearr ina n-aonar. Úsáideann tú aschur iad araon (mar uimhreacha) chun algartam eile a thraenáil. Mar sin, is féidir cibé 2 shamhailma chur le chéile.`

De gnáth, is fearr AUC-PR a úsáid ná AUC-ROC.

Graif spleáchais
- is graf é ina bhfuil eolas ar athróga randamacha (mar nóid) agus a spleáchais (mar nasic).
- is minic a úsáidtear graif neamhdhírithe (chun spleáchais cioglacha a sheachaint); "Markov Random Fields / MRFs" (Réimsí Randamacha Markov; RRM-anna) is ainm dóibh súid
- De gnáth, níl an t-algartam seo ró-inscálaithe

