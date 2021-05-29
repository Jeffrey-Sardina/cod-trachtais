# Leabhar nótaí

## roimh 12-02-2021
PyKEEN a íoslódáil. Níl BioKEEN in úsáid a thuileadh, agus mar sin is dóight liom burb é PyKEEN ar rogha is fearr. Tá dk-ke ar fáil fresin (https://github.com/awslabs/dgl-ke) ach níl mórán algartaim isteach ann.

Oibríonn PyKEEN ar a fhoinsí eolas féin--níor chuireas m'eolas isteach ansin go fóill.

Níl PyKEN in ann mo GPU a úsáid anois. Táim ag ceapadh
- Window Insider a úsáid go dtí go mbeadh mé in ann sin a dhéanamh
- Dual Boot a chur i bhfeidhm

## 12-02-2021
Bhíos ag foghlaim faoi Winfdows Insider--cuma ann gur gá sin an t-aon slí chun ligean do WSL mo GPU a úsáid. Eolas faoi seo:
- https://insider.windows.com/en-us/getting-started#flight
- https://docs.microsoft.com/en-us/windows/wsl/install-win10
- https://docs.nvidia.com/cuda/wsl-user-guide/index.html
- https://docs.microsoft.com/en-us/windows/win32/direct3d12/gpu-cuda-in-wsl
- https://docs.microsoft.com/en-us/windows/wsl/troubleshooting#error-0x80370102-the-virtual-machine-could-not-be-started-because-a-required-feature-is-not-installed
- https://docs.nvidia.com/cuda/cuda-installation-guide-linux/index.html
- https://developer.nvidia.com/blog/announcing-cuda-on-windows-subsystem-for-linux-2/

Tosaigh mé triail a bhaint as eolas Bio2RDF a chur i bPyKEEN. A bhfuil le déanamh anois:
- aistriú ó x.nq => x.n3 => comhaid scartha ag táib (.tsv)
    - https://pykeen.readthedocs.io/en/latest/tutorial/byod.html

Tá mé ag ceapadh Apache Jena a úsáid chun an t-aistriú seo a dhéanamh.
- https://jena.apache.org/documentation/io/
- https://jena.apache.org/download/index.cgi

## 09-03-2021
Tar éis ana-mhéid ama a chaitheamh ar foinsí eolais PyKEEN, tá cuma ann go bhfuil sé chun triail a bhaint as an eolas go léir a lódaíl isteach i gcuimhne an ríomhaire. Níl a fhios agam céard a dhéanamh le seo, nó má tá slí eile chun sruth sonraí a úsáid seachas iad go léir a lódáil i gcuiomhne an ríomhaire ag an am céanna.

Feic ar:
- https://pykeen.readthedocs.io/en/latest/_modules/pykeen/triples/utils.html?highlight=load_triples#
    - an áit ina bhfuil eolas léite as comhad
- https://numpy.org/devdocs/reference/generated/numpy.loadtxt.html
    - an tslí a oibríonn np.loadtxt

## 07-04-2021
Bhíos in ann an fhadhb cuimhne a dheisiú trí córas comhbhrúite (feic ar comhbhrú.py). Tá sé in ann méid ana-mhaith spás a shábháil gan torthnaí an chóras leabaithe a athrú. Móide sin, scríobh mé cód chun an píblíne a uathoibrigh, agus na torthaí deirneacha a dhíchomhbrú.

Amach anseo, beidh mé ag iarraidh níos mó eolas chur tríb an bpíblíne, agus samhlacha éagsúla a thriail.

## 18-05-2021
Ritheas PBG leis an gcomhad seo a leanas:
```
#!/usr/bin/env python3

def load_params():
    import os

    params = {}
    for key, val in os.environ.items():
        if key == "NUM_PARTITIONS":
            params[key] = int(val)
        if key == "DATA":
            params[key] = val
    
    return params

def get_torchbiggraph_config():
    params = load_params()

    print("backup_points/" + params['DATA'])

    config = dict(
        # I/O data
        entity_path= "../copies/" + params['DATA'] + "/pbg_split",
        edge_paths=[
            "../copies/" + params['DATA'] + "/pbg_split/imported/training_data",
            "../copies/" + params['DATA'] + "/pbg_split/imported/testing_data",
            "../copies/" + params['DATA'] + "/pbg_split/imported/validation_data",
        ],
        checkpoint_path="backup_points/" + params['DATA'],

        # Graph structure
        # Ba cheart go mbeadh méid_graif_eolais / num_partitions < 8GB (cuimhne CUDA)
        entities={"all": {"num_partitions": params["NUM_PARTITIONS"]}},
        relations=[
            {
                "name": "all_edges",
                "lhs": "all",
                "rhs": "all",
                "operator": "complex_diagonal",
            }
        ],
        dynamic_relations=True,

        # Scoring model
        dimension=100,
        global_emb=False,
        comparator="dot",

        # Training
        num_epochs=50,
        batch_size=5000,
        num_uniform_negs=1000,
        loss_fn="softmax",
        lr=0.1,
        regularization_coef=1e-3,

        # Evaluation during training
        eval_fraction=0,

        # GPU
        num_gpus=1,
    )

    return config
```

Thóg sé 71322 soicind. Ar dtús, bhí ró-mhéid cuimhne á húsáid aige, agus mar sin bhí orm níos mó deighiltí a chruthú, agus "dimensions" a chur ar laghad insan gcomhad seo thuas (bhí sé ag 200 ar dtús).

Bhí all.tsv (seachas all_compressed.tsv) curtha isteach mar ionchur ann.

## 23-05-2021
Táim tréis ana-mhéid rudaí a chur chun cinn, agus hyperparam_search.sh a scríobh. Séard atá i gceist ann na roinnt paraiméadair a fháil nach bhfuil go dona ar tacar sonraí.

Tá orm amach ansan na cinn is fearr a roghnú. Tá ana-mhéid ama ag baint leis (féach ar hyperparamsearch/times.csv) fiú ar tacair sonraí fíor-bheag. Mar sin, beidh orm samplaí ana-bheaga ar fad a úsáid chun fíordheimhniú hípearpharaiméadar a chur i gcrích.

Tá níos mó na IRI amháin sa chuid is mó de na foinsí eolais; mar cin, caithfidh mé a bheith cinnte go bhfuil sé cgl a aistriú go NT mar atá mé. Níl sé sin déanta agam go fóill.

Cheartaigh mé roinnt earráidí móra:
- nach raibh IRI-anna éagsúla san áireamh
- nach raibh ach tacar hipearpharaiméadar amháin in úsáid ag an gcuardach hipearpharaiméadar

Mar sin, tá orm gach rud a ath-dhéanamh arís, tpoisc nach raibh an bhuid eile bailí. Sula leanaim ar aghadih, caithfigh mé chuile rud a fhíordheimhniú mar sin!

## 25-05-2021
Tá ana-mhéid eolais ó bioportal tar éis teacht isteach. Thug mé fé ndeara cúpla rudaí:
- caithfidh mé num_XXX_negs (sampláil diúltach) agus dimension (=toise) a úsáid mar hipearpharaiméadair, ach níl siad insan áireamh anois. Ach nílim chun iad a chur leis ach an oiread, toisc go mbeadh ró-mhéid ama ag baint leis sin (combinatoriual explosion). Mar sin, tréis na hipearpharaiméadair traenála a shocrú, táim chun na cinn a bhaineann le sampláil diúltach agus le toise a dhéanamh i ndiaidh sin.
- Táim chun meastachán amanta reatha (in aghaidh #triaracha) a thabhairt ar eolas bioportal, agus sin a úsáid amach ansin--bheadh ró-am ag baint leis sin a dhéanamh ar gach tacar eolais.

## 29-05-2021
Anailísíocht ar hipearpharaiméadair a dheineas: 
- Próiséas: féach ar hyperparam_analysis.R
- Úsáid graif as an gcód sin freisin

bioportal (randsum 4000)
- Affine, ranking, dot, lr=1e-4 => AUC=0.78

Cód nótáilte:
```
#Fix all factors and exame lr and reg
#Trans
# 0.7 ranking, l2
by_auc = order_by_metric('auc')
by_auc = by_auc[by_auc$operator=='translation', ]
by_auc = by_auc[by_auc$loss_fn=='ranking', ]
by_auc = by_auc[by_auc$comparator=='l2', ]
by_auc
plot(by_auc$lr, by_auc$auc, log='x') #1e-4
plot(by_auc$reg, by_auc$auc, log='x') #1e-1

# No good options (AUC<0.5) ranking, dot
by_auc = order_by_metric('auc')
by_auc = by_auc[by_auc$operator=='translation', ]
by_auc = by_auc[by_auc$loss_fn=='ranking', ]
by_auc = by_auc[by_auc$comparator=='dot', ]
by_auc
plot(by_auc$lr, by_auc$auc, log='x') #1e-2
plot(by_auc$reg, by_auc$auc, log='x') #none good

# 0.697541 softmax, l2
by_auc = order_by_metric('auc')
by_auc = by_auc[by_auc$operator=='translation', ]
by_auc = by_auc[by_auc$loss_fn=='softmax', ]
by_auc = by_auc[by_auc$comparator=='l2', ]
by_auc
plot(by_auc$lr, by_auc$auc, log='x') #1e-4
plot(by_auc$reg, by_auc$auc, log='x') #1e-3

# 0.702 softmax, dot
by_auc = order_by_metric('auc')
by_auc = by_auc[by_auc$operator=='translation', ]
by_auc = by_auc[by_auc$loss_fn=='softmax', ]
by_auc = by_auc[by_auc$comparator=='dot', ]
by_auc
plot(by_auc$lr, by_auc$auc, log='x') #1e-2
plot(by_auc$reg, by_auc$auc, log='x') #1e-5

#Affine
# 0.75 ranking, l2
by_auc = order_by_metric('auc')
by_auc = by_auc[by_auc$operator=='affine', ]
by_auc = by_auc[by_auc$loss_fn=='ranking', ]
by_auc = by_auc[by_auc$comparator=='l2', ]
by_auc
plot(by_auc$lr, by_auc$auc, log='x') #1e-4

# 0.78 ranking, dot
by_auc = order_by_metric('auc')
by_auc = by_auc[by_auc$operator=='affine', ]
by_auc = by_auc[by_auc$loss_fn=='ranking', ]
by_auc = by_auc[by_auc$comparator=='dot', ]
by_auc
plot(by_auc$lr, by_auc$auc, log='x') #1e-3

# 0.716 softmax, l2
by_auc = order_by_metric('auc')
by_auc = by_auc[by_auc$operator=='affine', ]
by_auc = by_auc[by_auc$loss_fn=='softmax', ]
by_auc = by_auc[by_auc$comparator=='l2', ]
by_auc
plot(by_auc$lr, by_auc$auc, log='x') #1e-3

# 0.71 softmax, dot
by_auc = order_by_metric('auc')
by_auc = by_auc[by_auc$operator=='affine', ]
by_auc = by_auc[by_auc$loss_fn=='softmax', ]
by_auc = by_auc[by_auc$comparator=='dot', ]
by_auc
plot(by_auc$lr, by_auc$auc, log='x') #1e-2

#Diagonal
# All under 0.72; not worth using since Affine beats it
by_auc = order_by_metric('auc')
by_auc = by_auc[by_auc$operator=='diagonal', ]
by_auc = by_auc[by_auc$loss_fn=='ranking', ]
by_auc = by_auc[by_auc$comparator=='l2', ]
by_auc
plot(by_auc$lr, by_auc$auc, log='x')
plot(by_auc$reg, by_auc$auc, log='x')
```

dbsnp (randsub 4000)
- Affine, ranking, dot, lr=1e-4 => AUC=0.70
- Trans, ranking, l2, reg=1e-3, lr=1e-3 => AUC=0.75

Cód nótáilte:
```
#Fix all factors and exame lr and reg
#Trans
# 0.75 ranking, l2
by_auc = order_by_metric(df, 'auc')
by_auc = by_auc[by_auc$operator=='translation', ]
by_auc = by_auc[by_auc$loss_fn=='ranking', ]
by_auc = by_auc[by_auc$comparator=='l2', ]
by_auc
plot(by_auc$lr, by_auc$auc, log='x') #1e-3
plot(by_auc$reg, by_auc$auc, log='x') #1e-3
plot3d(by_auc$lr, by_auc$reg, by_auc$auc)

# all <=0.7, not cosidering
by_auc = order_by_metric(df, 'auc')
by_auc = by_auc[by_auc$operator=='translation', ]
by_auc = by_auc[by_auc$loss_fn=='ranking', ]
by_auc = by_auc[by_auc$comparator=='dot', ]
by_auc
plot(by_auc$lr, by_auc$auc, log='x')
plot(by_auc$reg, by_auc$auc, log='x')
plot3d(by_auc$lr, by_auc$reg, by_auc$auc)

# 0.70 softmax, l2
by_auc = order_by_metric(df, 'auc')
by_auc = by_auc[by_auc$operator=='translation', ]
by_auc = by_auc[by_auc$loss_fn=='softmax', ]
by_auc = by_auc[by_auc$comparator=='l2', ]
by_auc
plot(by_auc$lr, by_auc$auc, log='x') #1e-2
plot(by_auc$reg, by_auc$auc, log='x') #1e-3

# 0.714 softmax, dot
by_auc = order_by_metric(df, 'auc')
by_auc = by_auc[by_auc$operator=='translation', ]
by_auc = by_auc[by_auc$loss_fn=='softmax', ]
by_auc = by_auc[by_auc$comparator=='dot', ]
by_auc
plot(by_auc$lr, by_auc$auc, log='x') #1e-2
plot(by_auc$reg, by_auc$auc, log='x') #1e-5

#Affine
# 0.66 ranking, l2
by_auc = order_by_metric(df, 'auc')
by_auc = by_auc[by_auc$operator=='affine', ]
by_auc = by_auc[by_auc$loss_fn=='ranking', ]
by_auc = by_auc[by_auc$comparator=='l2', ]
by_auc
plot(by_auc$lr, by_auc$auc, log='x') #1e-4

# 0.7 ranking, dot
by_auc = order_by_metric(df, 'auc')
by_auc = by_auc[by_auc$operator=='affine', ]
by_auc = by_auc[by_auc$loss_fn=='ranking', ]
by_auc = by_auc[by_auc$comparator=='dot', ]
by_auc
plot(by_auc$lr, by_auc$auc, log='x') #1e-3

# 0.65 softmax, l2
by_auc = order_by_metric(df, 'auc')
by_auc = by_auc[by_auc$operator=='affine', ]
by_auc = by_auc[by_auc$loss_fn=='softmax', ]
by_auc = by_auc[by_auc$comparator=='l2', ]
by_auc
plot(by_auc$lr, by_auc$auc, log='x') #1e-3

# 0.70 softmax, dot
by_auc = order_by_metric(df, 'auc')
by_auc = by_auc[by_auc$operator=='affine', ]
by_auc = by_auc[by_auc$loss_fn=='softmax', ]
by_auc = by_auc[by_auc$comparator=='dot', ]
by_auc
plot(by_auc$lr, by_auc$auc, log='x') #1e-2

#Diagonal
# All very low
by_auc = order_by_metric(df, 'auc')
by_auc = by_auc[by_auc$operator=='diagonal', ]
by_auc = by_auc[by_auc$loss_fn=='ranking', ]
by_auc = by_auc[by_auc$comparator=='l2', ]
by_auc
plot(by_auc$lr, by_auc$auc, log='x')
plot(by_auc$reg, by_auc$auc, log='x')
```

drugbank (randsub 4000)
- Affine, ranking, dot, lr=1e-4 => AUC=0.68
- Trans, ranking, l2, reg=1e-1, lr=1e-4 => AUC=0.72

Cód nótáilte:
```
#Fix all factors and exame lr and reg
#Trans
# 0.72 ranking, l2
by_auc = order_by_metric(df, 'auc')
by_auc = by_auc[by_auc$operator=='translation', ]
by_auc = by_auc[by_auc$loss_fn=='ranking', ]
by_auc = by_auc[by_auc$comparator=='l2', ]
by_auc
plot(by_auc$lr, by_auc$auc, log='x') #1e-4
plot(by_auc$reg, by_auc$auc, log='x') #1e-1

# All terrible, ná bac ranking, dot
by_auc = order_by_metric(df, 'auc')
by_auc = by_auc[by_auc$operator=='translation', ]
by_auc = by_auc[by_auc$loss_fn=='ranking', ]
by_auc = by_auc[by_auc$comparator=='dot', ]
by_auc
plot(by_auc$lr, by_auc$auc, log='x') #
plot(by_auc$reg, by_auc$auc, log='x') #

# 0.71 softmax, l2
by_auc = order_by_metric(df, 'auc')
by_auc = by_auc[by_auc$operator=='translation', ]
by_auc = by_auc[by_auc$loss_fn=='softmax', ]
by_auc = by_auc[by_auc$comparator=='l2', ]
by_auc
plot(by_auc$lr, by_auc$auc, log='x') #1e-4
plot(by_auc$reg, by_auc$auc, log='x') #1e-1

# 0.68 softmax, dot
by_auc = order_by_metric(df, 'auc')
by_auc = by_auc[by_auc$operator=='translation', ]
by_auc = by_auc[by_auc$loss_fn=='softmax', ]
by_auc = by_auc[by_auc$comparator=='dot', ]
by_auc
plot(by_auc$lr, by_auc$auc, log='x') #1e-3
plot(by_auc$reg, by_auc$auc, log='x') #1e-5

#Affine
# 0.67 ranking, l2
by_auc = order_by_metric(df, 'auc')
by_auc = by_auc[by_auc$operator=='affine', ]
by_auc = by_auc[by_auc$loss_fn=='ranking', ]
by_auc = by_auc[by_auc$comparator=='l2', ]
by_auc
plot(by_auc$lr, by_auc$auc, log='x') #1e-4

# 0.68 ranking, dot
by_auc = order_by_metric(df, 'auc')
by_auc = by_auc[by_auc$operator=='affine', ]
by_auc = by_auc[by_auc$loss_fn=='ranking', ]
by_auc = by_auc[by_auc$comparator=='dot', ]
by_auc
plot(by_auc$lr, by_auc$auc, log='x') #1e-3

# 0.71 softmax, l2
by_auc = order_by_metric(df, 'auc')
by_auc = by_auc[by_auc$operator=='affine', ]
by_auc = by_auc[by_auc$loss_fn=='softmax', ]
by_auc = by_auc[by_auc$comparator=='l2', ]
by_auc
plot(by_auc$lr, by_auc$auc, log='x') #1e-3

# 0.68 softmax, dot
by_auc = order_by_metric(df, 'auc')
by_auc = by_auc[by_auc$operator=='affine', ]
by_auc = by_auc[by_auc$loss_fn=='softmax', ]
by_auc = by_auc[by_auc$comparator=='dot', ]
by_auc
plot(by_auc$lr, by_auc$auc, log='x') #1e-2

#Diagonal
# No combos beat what was seen before
by_auc = order_by_metric(df, 'auc')
by_auc = by_auc[by_auc$operator=='diagonal', ]
by_auc
```

omim (randsub 4000)
- Affine, ranking, dot, lr=1e-4 => AUC=0.68
- Trans, ranking, l2, reg=1e-3, lr=1e-3 => AUC=0.77 or 0.68

Cód nótáilte:
```
#Fix all factors and exame lr and reg
#Trans
# 0.77 ranking, l2 (not confident in this, may be overfitting. Maybe 0.68)
by_auc = order_by_metric(df, 'auc')
by_auc = by_auc[by_auc$operator=='translation', ]
by_auc = by_auc[by_auc$loss_fn=='ranking', ]
by_auc = by_auc[by_auc$comparator=='l2', ]
by_auc
plot(by_auc$lr, by_auc$auc, log='x') #1e-3
plot(by_auc$reg, by_auc$auc, log='x') #1e-3

# all under 0.77 ranking, dot
by_auc = order_by_metric(df, 'auc')
by_auc = by_auc[by_auc$operator=='translation', ]
by_auc = by_auc[by_auc$loss_fn=='ranking', ]
by_auc = by_auc[by_auc$comparator=='dot', ]
by_auc
plot(by_auc$lr, by_auc$auc, log='x') #
plot(by_auc$reg, by_auc$auc, log='x') #

# all under 0.77 softmax, l2
by_auc = order_by_metric(df, 'auc')
by_auc = by_auc[by_auc$operator=='translation', ]
by_auc = by_auc[by_auc$loss_fn=='softmax', ]
by_auc = by_auc[by_auc$comparator=='l2', ]
by_auc
plot(by_auc$lr, by_auc$auc, log='x') #
plot(by_auc$reg, by_auc$auc, log='x') #

# all under 0.77 softmax, dot
by_auc = order_by_metric(df, 'auc')
by_auc = by_auc[by_auc$operator=='translation', ]
by_auc = by_auc[by_auc$loss_fn=='softmax', ]
by_auc = by_auc[by_auc$comparator=='dot', ]
by_auc
plot(by_auc$lr, by_auc$auc, log='x') #
plot(by_auc$reg, by_auc$auc, log='x') #

#Affine
# 0.57 ranking, l2
by_auc = order_by_metric(df, 'auc')
by_auc = by_auc[by_auc$operator=='affine', ]
by_auc = by_auc[by_auc$loss_fn=='ranking', ]
by_auc = by_auc[by_auc$comparator=='l2', ]
by_auc
plot(by_auc$lr, by_auc$auc, log='x') #1e-4

# 0.68 ranking, dot
by_auc = order_by_metric(df, 'auc')
by_auc = by_auc[by_auc$operator=='affine', ]
by_auc = by_auc[by_auc$loss_fn=='ranking', ]
by_auc = by_auc[by_auc$comparator=='dot', ]
by_auc
plot(by_auc$lr, by_auc$auc, log='x') #

# all <0.68 softmax, l2
by_auc = order_by_metric(df, 'auc')
by_auc = by_auc[by_auc$operator=='affine', ]
by_auc = by_auc[by_auc$loss_fn=='softmax', ]
by_auc = by_auc[by_auc$comparator=='l2', ]
by_auc
plot(by_auc$lr, by_auc$auc, log='x') #

# all <0.68 softmax, dot
by_auc = order_by_metric(df, 'auc')
by_auc = by_auc[by_auc$operator=='affine', ]
by_auc = by_auc[by_auc$loss_fn=='softmax', ]
by_auc = by_auc[by_auc$comparator=='dot', ]
by_auc
plot(by_auc$lr, by_auc$auc, log='x') #

#Diagonal
# No combos beat what was seen before
by_auc = order_by_metric(df, 'auc')
by_auc = by_auc[by_auc$operator=='diagonal', ]
by_auc

```

pharmgkb (randsub 4000)
- Affine, ranking, dot, lr=1e-3 => AUC=0.72

Cód nótáilte:
```
#Fix all factors and exame lr and reg
#Trans
# 0.68 ranking, l2 (not confident in this, may be overfitting. Maybe 0.68)
by_auc = order_by_metric(df, 'auc')
by_auc = by_auc[by_auc$operator=='translation', ]
by_auc = by_auc[by_auc$loss_fn=='ranking', ]
by_auc = by_auc[by_auc$comparator=='l2', ]
by_auc
plot(by_auc$lr, by_auc$auc, log='x') #1e-3 
plot(by_auc$reg, by_auc$auc, log='x') #1e-1

# Few good, none beat 0.68 ranking, dot
by_auc = order_by_metric(df, 'auc')
by_auc = by_auc[by_auc$operator=='translation', ]
by_auc = by_auc[by_auc$loss_fn=='ranking', ]
by_auc = by_auc[by_auc$comparator=='dot', ]
by_auc
plot(by_auc$lr, by_auc$auc, log='x') #
plot(by_auc$reg, by_auc$auc, log='x') #

# 0.71, likely by chance, softmax, l2
by_auc = order_by_metric(df, 'auc')
by_auc = by_auc[by_auc$operator=='translation', ]
by_auc = by_auc[by_auc$loss_fn=='softmax', ]
by_auc = by_auc[by_auc$comparator=='l2', ]
by_auc
plot(by_auc$lr, by_auc$auc, log='x') #1e-2
plot(by_auc$reg, by_auc$auc, log='x') #1e-3

# 0.68, likely by chance, softmax, dot
by_auc = order_by_metric(df, 'auc')
by_auc = by_auc[by_auc$operator=='translation', ]
by_auc = by_auc[by_auc$loss_fn=='softmax', ]
by_auc = by_auc[by_auc$comparator=='dot', ]
by_auc
plot(by_auc$lr, by_auc$auc, log='x') #1e-2
plot(by_auc$reg, by_auc$auc, log='x') #1e-5

#Affine
# 0.70 ranking, l2
by_auc = order_by_metric(df, 'auc')
by_auc = by_auc[by_auc$operator=='affine', ]
by_auc = by_auc[by_auc$loss_fn=='ranking', ]
by_auc = by_auc[by_auc$comparator=='l2', ]
by_auc
plot(by_auc$lr, by_auc$auc, log='x') #1e-4

# 0.72 ranking, dot
by_auc = order_by_metric(df, 'auc')
by_auc = by_auc[by_auc$operator=='affine', ]
by_auc = by_auc[by_auc$loss_fn=='ranking', ]
by_auc = by_auc[by_auc$comparator=='dot', ]
by_auc
plot(by_auc$lr, by_auc$auc, log='x') #1e-3

# all under 0.72 softmax, l2
by_auc = order_by_metric(df, 'auc')
by_auc = by_auc[by_auc$operator=='affine', ]
by_auc = by_auc[by_auc$loss_fn=='softmax', ]
by_auc = by_auc[by_auc$comparator=='l2', ]
by_auc
plot(by_auc$lr, by_auc$auc, log='x') #

# All under 0.72 softmax, dot
by_auc = order_by_metric(df, 'auc')
by_auc = by_auc[by_auc$operator=='affine', ]
by_auc = by_auc[by_auc$loss_fn=='softmax', ]
by_auc = by_auc[by_auc$comparator=='dot', ]
by_auc
plot(by_auc$lr, by_auc$auc, log='x') #

#Diagonal
# No combos beat what was seen before
by_auc = order_by_metric(df, 'auc')
by_auc = by_auc[by_auc$operator=='diagonal', ]
by_auc
```
