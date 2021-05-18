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
