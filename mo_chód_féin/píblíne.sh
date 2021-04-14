#!/bin/bash

# $1 => ainm fillteán i "cóipeanna/" (ms dbsnp)
# $2 => samhail (ms TransE)
# $3 => scrios seancomhaid (1) nó ná scrios (0)

AM_TOSACH="$(date +%s)"

# echo 'ag fáil an IRI ab ceart a bhaint amach'
# eolas=$(cat ../cóipeanna/$1/bio2rdf-$1.nq | head -n 1)
# iri=$(python3 faigh_iri_graif.py "$eolas")
# echo 'ag baint amach an iri:' $iri

# echo 'ag lódáil sonraí'
# ./nq_go_nt-comhbrúite.sh ../cóipeanna/$1/ "$iri" $3
# mkdir ../samhlacha/$1_$2

echo 'ag rith algartaim leabaithe'
python3 leabú.py ../cóipeanna/$1/uile_comhbhrúite.tsv $2 ../samhlacha/$1_$2

echo 'ag réamhinsint triaracha nua'
python3 réamhinsint.py ../samhlacha/$1_$2/

echo 'ag díchombhrú réamhinsinstí'
python3 díchomhbhrú.py ../samhlacha/$1_$2/réamhinsintí.csv ../cóipeanna/$1/uile_tábla.tsv ../samhlacha/$1_$2/réamhinsintí_díchomhbhrúite.csv

AGA_REATHA=$[ $(date +%s) - ${AM_TOSACH} ]
echo 'críochnathe tar éis' $AGA_REATHA 'soicind'
