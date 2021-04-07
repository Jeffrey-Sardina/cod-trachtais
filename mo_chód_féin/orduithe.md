# Orduithe

## orphanet_TransE
```
$ ./nq_go_nt-comhbrúite.sh ../cóipeanna/orphanet/ "<http://bio2rdf.org/orphanet_resource:bio2rdf.dataset.orphanet.R4>"
$ python3 leabú.py ../cóipeanna/orphanet/uile_comhbhrúite.tsv TransE ../samhlacha/orphanet_TransE
$ python3 réamhinsint.py ../samhlacha/orphanet_TransE/
$ python3 díchomhbhrú.py ../samhlacha/orphanet_TransE/réamhinsintí.csv ../cóipeanna/orphanet/uile_tábla.tsv ../samhlacha/orphanet_TransE/réamhinsintí_díchomhbhrúite.csv
```

## dbsnp_TransE
```
$ ./nq_go_nt-comhbrúite.sh ../cóipeanna/dbsnp/ "<http://bio2rdf.org/dbsnp_resource:bio2rdf.dataset.dbsnp.R4>"
$ python3 leabú.py ../cóipeanna/dbsnp/uile_comhbhrúite.tsv TransE ../samhlacha/dbsnp_TransE
$ python3 réamhinsint.py ../samhlacha/dbsnp_TransE/
$ python3 díchomhbhrú.py ../samhlacha/dbsnp_TransE/réamhinsintí.csv ../cóipeanna/orphanet/uile_tábla.tsv ../samhlacha/dbsnp_TransE/réamhinsintí_díchomhbhrúite.csv
```
