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
Anailísíocht ar hipearpharaiméadair a dheineas: (round1)
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

## 29-05-2021
Anailísíocht ar hipearpharaiméadair a dheineas: (round2)
bioportal
- There seems to be an effect of time; as batch_size increases, the best num_batch_negs decreases. Similarly, high num_batch_negs and num_uniform_negs are disfavored wqhen they occur together.
- This makes sense: I would expect that higher numbers of samples batch should generally learn better to an extend, and since eval is on a diff dataset is is unlikely this is overfitting a lot.
- The best I could do was around 0.81, across a few different parameterizations:
    - Almost certainly overfitting:
    - batch size 500, batch_negs 500, unif_negs 10 => 0.81
    - batch size 500, batch_negs 500, unif_negs 50 => 0.807
    - batch size 500, batch_negs 500, unif_negs 100 => 0.814

    - Likely decent fit
    - batch size 1000, batch_negs 250, unif_negs 10 => 0.81
    - batch size 1000, batch_negs 50, unif_negs 100 => 0.815 **
    - batch size 1000, batch_negs 50, unif_negs 250 => 0.81

    - Likely an effect of time, not model
    - batch size 1500, batch_negs 10, unif_negs 50 => 0.80 
    - batch size 1500, batch_negs 10, unif_negs 100 => 0.80 

- Like an effect of time, not model
    - batch size 2000, batch_negs 10, unif_negs 50 => 0.807 
    - batch size 2000, batch_negs 10, unif_negs 100 => 0.815 
- Cóḋ le nótaí ann:
```
### For Bioportal
#Batch size 500
#Tends to do better on higher num_batch_negs
batch_s = 500
restricted = order_by_metric_incl(df, 'num_batch_negs', 'auc')
restricted = restricted[restricted$batch_size==batch_s, ]
restricted = restricted[restricted$num_uniform_negs==10, ]
#max when num_batch_negs = 500, 0.81
plot(restricted$num_batch_negs, restricted$auc)
restricted

restricted = order_by_metric_incl(df, 'num_batch_negs', 'auc')
restricted = restricted[restricted$batch_size==batch_s, ]
restricted = restricted[restricted$num_uniform_negs==50, ]
#max when num_batch_negs = 500, 0.807
plot(restricted$num_batch_negs, restricted$auc)
restricted

restricted = order_by_metric_incl(df, 'num_batch_negs', 'auc')
restricted = restricted[restricted$batch_size==batch_s, ]
restricted = restricted[restricted$num_uniform_negs==100, ]
#max when num_batch_negs = 500, 0.814
plot(restricted$num_batch_negs, restricted$auc)
restricted

restricted = order_by_metric_incl(df, 'num_batch_negs', 'auc')
restricted = restricted[restricted$batch_size==batch_s, ]
restricted = restricted[restricted$num_uniform_negs==250, ]
#max when num_batch_negs = 10, 0.716
#num_batch_negs = 500 also very good, 0.709
plot(restricted$num_batch_negs, restricted$auc)
restricted

restricted = order_by_metric_incl(df, 'num_batch_negs', 'auc')
restricted = restricted[restricted$batch_size==batch_s, ]
restricted = restricted[restricted$num_uniform_negs==500, ]
#max when num_batch_negs = 250, 0.775
#num_batch_negs = 500 also very good, 0.767
plot(restricted$num_batch_negs, restricted$auc)
restricted

#Batch size 1000
# Lower num_batch_negs tend to be favored
batch_s = 1000
restricted = order_by_metric_incl(df, 'num_batch_negs', 'auc')
restricted = restricted[restricted$batch_size==batch_s, ]
restricted = restricted[restricted$num_uniform_negs==10, ]
#max when num_batch_negs = 250, 0.81
plot(restricted$num_batch_negs, restricted$auc)
restricted

restricted = order_by_metric_incl(df, 'num_batch_negs', 'auc')
restricted = restricted[restricted$batch_size==batch_s, ]
restricted = restricted[restricted$num_uniform_negs==50, ]
#max when num_batch_negs = 250, 0.76
plot(restricted$num_batch_negs, restricted$auc)
restricted

restricted = order_by_metric_incl(df, 'num_batch_negs', 'auc')
restricted = restricted[restricted$batch_size==batch_s, ]
restricted = restricted[restricted$num_uniform_negs==100, ]
#max when num_batch_negs = 50, 0.815
plot(restricted$num_batch_negs, restricted$auc)
restricted

restricted = order_by_metric_incl(df, 'num_batch_negs', 'auc')
restricted = restricted[restricted$batch_size==batch_s, ]
restricted = restricted[restricted$num_uniform_negs==250, ]
#max when num_batch_negs = 50, 0.81
#num_batch_negs = 500 also very good, 0.709
plot(restricted$num_batch_negs, restricted$auc)
restricted

restricted = order_by_metric_incl(df, 'num_batch_negs', 'auc')
restricted = restricted[restricted$batch_size==batch_s, ]
restricted = restricted[restricted$num_uniform_negs==500, ]
#max when num_batch_negs = 500, 0.74
#num_batch_negs = 500 also very good, 0.767
plot(restricted$num_batch_negs, restricted$auc)
restricted


#Batch size 1500
# Lower num_batch_negs tend to be favored again!
# ^^ VERY strong trend
batch_s = 1500
restricted = order_by_metric_incl(df, 'num_batch_negs', 'auc')
restricted = restricted[restricted$batch_size==batch_s, ]
restricted = restricted[restricted$num_uniform_negs==10, ]
#max: num_batch_negs=10 => 0.79
plot(restricted$num_batch_negs, restricted$auc)
restricted

restricted = order_by_metric_incl(df, 'num_batch_negs', 'auc')
restricted = restricted[restricted$batch_size==batch_s, ]
restricted = restricted[restricted$num_uniform_negs==50, ]
#max: num_batch_negs=10 => 0.80
plot(restricted$num_batch_negs, restricted$auc)
restricted

restricted = order_by_metric_incl(df, 'num_batch_negs', 'auc')
restricted = restricted[restricted$batch_size==batch_s, ]
restricted = restricted[restricted$num_uniform_negs==100, ]
#max: num_batch_negs=10 => 0.80
plot(restricted$num_batch_negs, restricted$auc)
restricted

restricted = order_by_metric_incl(df, 'num_batch_negs', 'auc')
restricted = restricted[restricted$batch_size==batch_s, ]
restricted = restricted[restricted$num_uniform_negs==250, ]
#max: num_batch_negs=500 => 0.78 (likely outlier)
plot(restricted$num_batch_negs, restricted$auc)
restricted

restricted = order_by_metric_incl(df, 'num_batch_negs', 'auc')
restricted = restricted[restricted$batch_size==batch_s, ]
restricted = restricted[restricted$num_uniform_negs==500, ]
#max: num_batch_negs=10 => 0.73
plot(restricted$num_batch_negs, restricted$auc)
restricted

#Batch size 2000
# Lower num_batch_negs tend to be favored again!
# ^^ VERY strong trend
batch_s = 2000
restricted = order_by_metric_incl(df, 'num_batch_negs', 'auc')
restricted = restricted[restricted$batch_size==batch_s, ]
restricted = restricted[restricted$num_uniform_negs==10, ]
#max: num_batch_negs=50 => 0.744
plot(restricted$num_batch_negs, restricted$auc)
restricted

restricted = order_by_metric_incl(df, 'num_batch_negs', 'auc')
restricted = restricted[restricted$batch_size==batch_s, ]
restricted = restricted[restricted$num_uniform_negs==50, ]
#max: num_batch_negs=10 => 0.807
plot(restricted$num_batch_negs, restricted$auc)
restricted

restricted = order_by_metric_incl(df, 'num_batch_negs', 'auc')
restricted = restricted[restricted$batch_size==batch_s, ]
restricted = restricted[restricted$num_uniform_negs==100, ]
#max: num_batch_negs=10 => 0.815
plot(restricted$num_batch_negs, restricted$auc)
restricted

restricted = order_by_metric_incl(df, 'num_batch_negs', 'auc')
restricted = restricted[restricted$batch_size==batch_s, ]
restricted = restricted[restricted$num_uniform_negs==250, ]
#max: num_batch_negs=10 => 0.71
plot(restricted$num_batch_negs, restricted$auc)
restricted

restricted = order_by_metric_incl(df, 'num_batch_negs', 'auc')
restricted = restricted[restricted$batch_size==batch_s, ]
restricted = restricted[restricted$num_uniform_negs==500, ]
#max: num_batch_negs=100 => 0.78
plot(restricted$num_batch_negs, restricted$auc)
restricted
```

For dbsnp:
- Using 3d plots only (Windows, see hyperparam_analysis.r2.R), I noted:
    - A clear preference for negs (batch anfdn unif) <= 100
    - Gets near or at 0.75 AUC in that region for all batch sizes

For drugbank:
- Using 3d plots only (Windows, see hyperparam_analysis.r2.R), I noted:
    - A clear preference for negs (batch anfdn unif) <= 100
    - Gets near or at 0.80 AUC in that region for all batch sizes

For omim:
- Using 3d plots only (Windows, see hyperparam_analysis.r2.R), I noted:
    - A clear preference for negs (batch anfdn unif) <= 100
    - Gets highest AUC in that region for all batch sizes
    - Extremely low values (ie 10) of negs can be volatile and are favored at higher batch sizes--likely over-fitting and the such

For pharmgkb:
- Using 3d plots only (Windows, see hyperparam_analysis.r2.R), I noted:
    - A clear preference for negs (batch anfdn unif) <= 100
    - Gets near or at 0.75 AUC in that region for all batch sizes
     Extremely low values (ie 10) of negs can be volatile and are favored at higher batch sizes--likely over-fitting and the such

Overall:
- 100 for both negs is always decent (never terrible), although not always ideal
- 50 for both is much less consistently good at batch size = 1000
- Ideals tend to be lower, but as noted above those can be VERY volatile
- Thus I choose:
    - batch_negs = 100
    - unif_negs = 100
    - batch_suize = 1000

Aboutr epochs and the idea of round 3
- Testing epochs on subsetted data may not be idea
- However, I also need to test dimensions
- Thus, I will do round 3 with both of those to see how dims and epochs interact
- I will try this at both 4000 triples (2 splits) and 10000 triples (5 splits) to see if there is any effect of triple number.
    - That is a binary test of 'do I see a difference'; not intended to quantify that diffrerence!
    - That would take too much time

## 2-6-2021
Looked through (some, not all) nq files for the 5 datasets I am analyzing at the moment (bioportal, dbsnp, drugbank, omim, and pharmgkb). It looks like my nq => nt conversion should not be an issue, since many different files do not have overlapping entites when they have different graphs (the 4th element in the NQ).

Some cases (ie dbsnp) have only one major file that is all in one subgraph, and thus should not be an issue. In pharmgkb, some graphs have the same 4th quad, and thus would be appropriately merged.

Finished up round 3 (10000 triples) hyperpartram validation. Now it's time to analyze that and possible move on to training a real model.
- It's AUCs are a lot lower than I expected. Maybe number of partitions is having an effect here, I am going to re-run the 10000 dataset with only 2 partitions total before analysis.
- This will help me see if there is an effect of number of partitions; lower (such that each partition has more data) is likely better based on PyTorch docs, I thiink (check that).
- I'll do full analysis after all this data is in and see where to go

## 3-6-2021
I am starting to think that running all 3 rounds again, so make sure I get siilar results, is a good idea. I need to be able to vcerify all of this in my dissertation, and a sample size of 1 is never convicing. I should have the time for that, at least, maybe more.

Luckily, it should be easy to just write the batche scripts and run them as I have been. I'll do that and see where things go from there.

## 4-6-2021
Took a look at it 1 round 3 data. By inspection, time seems to relate linearly to epochs and quadtratically to dimmensions, as expected. Seconds taken and AUC have no clear correlation, ubt I still need to check dim / epochs vs AUC.

Interestingly, the difference between 50 and 100 dims for #epohs=50 in time if not clear; it is sometimes near 0 or negative! 

If it takes 1 minute to train a dataset of 4000 triples (over all epochs), then bioportal would take around 15 days to train. Thus, I want no more than 1 minute total time taken on datasets of 4000 triples, since the real datasets are so large.

Interestingly, increasing dims seems to lead to higher AUC increases (and more consistent ones) than increasing epochs. Ideas
- lack of data--it is just treating all concepts differently then (overiftting); a larger model that connects them maynot have that issue
- maybe dims do help better form better-understanding vectors

For dataset w/ 4000 triples and 2 parittions:
- anything over 100 dims seems to take far to long to train (for bioportal especially) no matter the number of epochs, and can get REALLY long. 100 seems generally in the right ballpark. There seems to be no clear advantage, oddly, of 100 epochs over 50. However, there is an advantage of 100 dims over 50.

For dataset w/ 10000 triples and 2 parittions:
- New time cutoff is 150 seconds for 10k triples (same as 60 seconds for 4000)
- Again, anything over 100 dims seems to take far t0o long to train (for bioportal especially) no matter the number of epochs, and can get REALLY long.

For dataset w/ 10000 triples and 5 parittions:
- AUCs were notably lower for bioportal, and slightly lower for drugbank (compared to 10000 triples and 2 splits).
- Training times were notably longer than when 2 splits were used
- Anything over 100 dims seems to take  to long to train
- Again, more epochs seems to have no reliable effect on AUC

NOTE: these are all point estimates. I'll est st. dev. after iteration 2, which is sitll running rightn now.

Conclusion: use 50 epochs, 100 dims as a starting point for training on a full data set.

## 6-6-2021
Smaoineamh: An ceart dom torthaí an céad babhta seo a úsáid mar bunluacha babhta eile, cosúil le Gibbs Sampler? Bheadh mé níos cinnte go bhfuil luacha mar agam mar sin féinig. Ba mhaith liom sin a déanamh, dá mb'fhéidir.

## 7-6-2021
Níl mar a shíltear a bhítear. Thóg sé i bhfad níos lú ama chun omim agus pharmgkb a thraenáil ná mar a bhíos ag súil leis. Mar sin, is dóigh liom go mbeidh mé in ann méid na toisí a chur in airde. Ach sin ráite, fuairead AUC timpeall 0.78 orthu araon, agus mar sin de níl sé chomh dona anois in aon chor.

Tá trothaí ó bhabhta eile fíordheimhniú hipearpharaiméadar tréis teacht isteach leis, agus mar sin  ba mhaith liom a bheith cinnte go bhfuil sé cosúil leis an gcéad babhta. Amach ansin, b'fhearr liom babhta eile a dhéanamh, go dtí go bhfuil trí cinn déanta agam. 

Móide sin, ba cheart dom córas analísíochta a chruthú chun rudaí a réamhinsint agus araile. Scríobhfiadh mé cód le haghaidh an córas sin freisin. Ar diereadh, toisc go bhfuil chuile rud seo i bhfad níod tapúla ná mar a bhíos ag súil leis, ba cheart dom shard_compress a chríochnú agus clinical_trials a úsáid leis. 

Things I need to look at more:
- margin param: (https://torchbiggraph.readthedocs.io/en/latest/loss_optimization.html) "This loss function is chosen by setting the loss_fn parameter to ranking, and the target margin is specified by the margin parameter."
- My AUC is very good...but r1 is VERY low. This seems bad to me. I need to check on that!! See: https://torchbiggraph.readthedocs.io/en/latest/evaluation.html

## 8-6-2021
For running on full datasets:
- in all cases 2 partitions were used, except in bioportal which used 3 (in progress)
- So far all but bioportal are done; bioportal running now
- AUC / r1 discprepancy -- possible this is due to a larger prevalance of end nodes that do not have other relations? Strings and the such.
    - Note also that in it 1, round 1, bioportal and dbsnp have FAR higher r1 than they do at the end of round 3 (it 1), as well as far higher r1 than the other datasets
- I am torn on whether AUC is the right validating metric, or r1. It really depends on which better models the needs I have wrt predictions, but r1 seems more likely to be a good metric for that?
- For now, time to get predicting

## 10-6-2021
Wrote code to analyze graph structure and answer some of the above questions. I decided to do an iteration 3 of hyper-param search, since that will fuirther increase me confidence in my results. At a brief glance, iteration 2 seems broadly similar to iteration 1.

Once that is done, I will redo validations with a basis on r1 this time, and see how the end results change after that.

Bioportal (using the full data) may be taking too long to train. Epochs are around 15 to 25 hours, and there are 50 of those. SO I might have to subset it, or manage it some other way.

## 13-06-2021
Over the last few days, I have tried to analyze whether graph structure is having a significant impactnon the difference in r1 rankings accross different datasets. So far, considering, the propotions of sinks, sources, and repeated entities (counting and not counting duplicates), I have not found a model that can explain the effect on both the randsub and the full datasets. However, using jsut the randsub datasets, a Lasso model indiacted that the protprotion of sources to the total number of triples (not counting duplicatse) was able to explain around 80% of the variation in the r1 values. In no case were AUC values explainable from these predictors.

Interestingly, the model that had r2 = 0.8 (above) anti-correlated with the data from full (not subsetted) datasets. This raises concerning in how I am subsetting to an exent WRT r1 (as mentioed before, the independence of AUC does not lead me to have such concerns for that metric). I, thus, must continue with my r1 cross-validation with great care.

Other ideas for analyzing the model:
- average in / out degree
- median in / out degree
- max and min in / out degree
- quartile or stdev in / out degree

## 15-06-2021
Ok, this graph structure data (to regerss to r1 / auc) just makes no sense. I am beginning to wonder if the subsets have different structure than the overall graphs...which wouold be a tough thing to counter. If so
- subgraph sampling?
- more triples in the samples?
- both?
I'll need to check on that. Hold on. I just found out that some of the data I had was entered wrong (AUC and r1 got flipped for the DBSNP full dataset row). I may need to re-run this analysis and see if that changes anything.

I just started off search_1, which is using r1 to select hyperparameters (seach 0 was the same but for AUC). So far, the models are (mostly) good with the same hyperparameters--which is very enocuraging. Bioportal is one exception, but it is still similar as well.

Doing an analysis of structure of subsets vs full data via inspection on metric_analusis/all_data_with_ratios.csv. Compared to the full datasets, the subsets seem to have:
- greater ratio_num_sinks
- greater ratio_num_sinks_no_dup
- greater ratio_num_sources
- MUCH greater ratio_num_sources_no_dup
- lower ratio_num_repeats
- lower ratio_num_repeats_no_dup
- much greater ratio_sink_avg, ratio_sink_min, ratio_sink_q1, ratio_sink_med, ratio_sink_q3
- generally greater ratio_sink_max (drugbank and omim are exceptions; they are similar)
- much greater ratio_source_avg, ratio_source_min, ratio_source_q1, ratio_source_med, ratio_source_q3
- similar ratio_source_max
- much greater ratio_repeat_avg, ratio_repeat_min, ratio_repeat_q1, ratio_repeat_med, ratio_repeat_q3
- similar ratio_repeat_max
I think this is largely to be expected with randomness. I'll keep this in mind as I explore the final dataset evaluations; if they give results counter to what was expected from the validation rounds, this may be (at least part of) the answer.

## 18-06-2021
Críochnaigh an dara babhta cuardaithe hipearpharaiméadar (cearch_1, it_3, round_2). Tá orm anois a fheiceáil céard é an rogha ceart dóibh, agus dul ar aghaidh ar an tríú babhta.

Ón mbabhta seo, chonaic me:
- 500 batch size best for dbsnp, drugbank, omim, pharmgkb Those tend to have their highest points (and several lower ones) at smaller numbers of batch negs and smaller numbers for uniform negs
    - batch size above 500 tended to form a 'sea of dots' at very low values, scattered randomly, and one or two unusually high values in unpredictable locations
    - 250 uniform and 100 batch seem good (often optimal) for all of these. The unif=250 subgraph even has a similar stucture in all 4.
    - Why?? There is something here, is dóigh liom
- All sizes are similar in terms of r1 for bioportal softmax and bioportal ranking
    - ranking once again consistently out-did softmax
    - For ranking, even the wostr parameterizations do well (r1 >= 0.22); the best points can be as high as 0.255-ish
    - Lower values of both negs, esp combined with each other, have no clear pattern for average r1
    - st dev on most points is 0.02 to 0.04, so distinguishing them is not easy with such a small range of values (0.22 to 0.25)
    - 1000.0 batch size, 500.0 batch negs, 100.0 uniform negs => 0.2525 r1 seems good, since:
        - 500.0 batch negs, 100.0 uniform negs not most batch sizes has high r1
        - I am suspicious of lower values, as they seem to be less reliable (for negs)
        - batch negs =/= batch size, so lower chance of overfitting

Bainfaidh mé úsáid as an eolas sin le haghaidh an chéad bhabhta eile!

## 21-06-2021
Bioportal--very oddly I saw that, even when all things were equal (all hyperparams from both rounds) ranking in bioportal orund 3 did very much worse than ranking in bioportal round 2 (.25 r1 vs .128). I can't find a reason to explain this, since I can verify the averages seem right, and since the same method was used (I did double-check). The others all got somewhat better or stayed in the beleivable range as expected.

Wait. I got it. WHen I copied the config file from seach_0, I accidentally kept some of its hyperparams suchnas the affine operator. I'nn need to re-run round 3 now. Doing that.

In the mean time I may start to write my lit. review. I am still good on time overall, on-schedule despite these setbacks.

Once this is done (likely faster than before since I am learning linear numbers of parameters rather than quadratic numbers, so maybe under 2 days) I'll have plenty of time to analyse and run on the real datasets. Remeber: run bioportal last since it will take the longest.

## 22-06-2021
Ok, realy round 3 is in, time to make final models!
Bioportal:
I notice two poosite trends. When epchs >= 200, the lowest dim num(s) are preferred. After a dip, increasing dim nums come to be more preferred.

When epochs < 200, there is a pstive correlation between dims and r1 that increases more slowly over time and may even start decreasing at the end. This can lead to very few epochs and relatively many dimensions...which I worry may overfit. It's a hard choice, and I am tempted to rerun that round on a larger dataset (say 8000 or 10000 triples) to see what happens. That said, bioportal is a alrge dataset...so more epochs and more dims will take more time, and I'ff notice that. I think I'll start with 50 epochs and 200 dims (the 2nd best point, best being 400 epochs and 50 dims). I can increase this later from the backup to use more epochs, I think, so that should not be an issue.

Other 4:
low epochs are universally bad, ezcept when dims are also low, probably an effect of time (epoch to dims ratio). Interestingly, 200 epochs and 100 dims is universally optimal or second best. It's a clear winner, as far as I am concerned.

For running on full datasets:
- in all cases 2 partitions were used, except in bioportal which used 3 (in progress) (as before)

## 23-06-2021
Notes from talk with Fabrizio Orlandi:
    take a look at dataset profiling
    if you use a lot of literals, this affects performance negatively
        I had observed this in my work so far as well
    do you read literal content? This can change things
        I do not, and should mention this in my write up
    how regular are graph patterns?
        star shapes (one node, many relations to sinks) can lower performance in generalizing. Did not meat other ML Possibly since graph structure was not used, when that is the point of KGEs
    why are max values rather than means / quartiles the best preedictors for r1?
        he was not sure what this effect occured
        worth exploring
    Analysis point: Measure diff vs no partitions?
    Metrics to take a look at (more complex)
        centrality
        page rank

## 27-06-2021
All datasets finished training; evals for bioportal is crashing, but will be really quick once I resolve that error (Git issue created already).

In the mean time, I took a look at histograms of the max repeats value (the number of times the highest-occuring entity that was neither a source or a sink occurred), and found they are very different between bioportal and all the other datasets. 

Amach anseo:
- lárnacht a áireamh ar gach nód ins na graif
- mar gheall ar a bhfuil léirithe ag [27], níl orm ach céim amháin a úsáid chun lárnacht a áireamh--ní féidir leis an algartam leabuithe ach sin a thuiscint ar aon nós!

## 29-06-2021
Turns out the eval error was causews be too-low shared memory (/dev/shm). It was at 7.8 GB; this can be seen using:
```
df -h
```

I set it to 12, which worked, via
```
sudo  mount -o remount,size=12G /dev/shm
```

Anois, níl orm ach anailísíocht a dhéanamh, is dóigh liom. Nach deas an rud é! Tá a lána ama á thógáil ag aschur na leabuithe fhéinig, ach ní dóigh liom go bhfuil siad sin ró-thábhachach don anailísíocht ar aon nós.

I hope to build a model of centrality => best embedding system. After that, I want to test in on several other datasets--all bio, but maybe not all cancer--and see if they confirm the trend.
