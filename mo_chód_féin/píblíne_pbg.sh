#!/bin/bash

# $1 => ainm fillteán i "cóipeanna/" (ms dbsnp)
# $2 => samhail (ms TransE)
# $3 => scrios seancomhaid (1) nó ná scrios (0)
# $4 => áit tosaithe
    # 1 : comhbhrú
    # 2 : réamh-phroiseáil
    # 3 : leabú
    # 4 : díchomhbhrú
# $5 : comhad cumraíochta

source pytorch-biggraph-gpu/bin/activate
AM_TOSACH="$(date +%s)"

if [[ $4 -lt 2 ]]
then
    echo 'ag fáil an IRI ab ceart a bhaint amach'
    eolas=$(cat ../cóipeanna/$1/bio2rdf-$1.nq | head -n 1)
    iri=$(python3 faigh_iri_graif.py "$eolas")
    echo 'ag baint amach an iri:' $iri

    echo 'ag lódáil sonraí'
    ./nq_go_nt-comhbrúite.sh ../cóipeanna/$1/ "$iri" $3
    mkdir ../samhlacha/$1_$2_pbg
fi

if [[ $4 -lt 3 ]]
then
    echo 'Ag réamh-phróiseáil na sonraí'
    mkdir ../cóipeanna/$1/scoilt_pbg/
    torchbiggraph_import_from_tsv \
        --lhs-col=0 --rel-col=1 --rhs-col=2 \
        $5 \
        ../cóipeanna/$1/scoilt_pbg/sonraí_traenála.tsv \
        ../cóipeanna/$1/scoilt_pbg/sonraí_tástála.tsv \
        ../cóipeanna/$1/scoilt_pbg/sonraí_deimhnithe.tsv
fi

if [[ $4 -lt 4 ]]
then
    echo 'ag rith algartaim leabaithe'
    torchbiggraph_train \
        $5 \
        -p edge_paths=../cóipeanna/$1/scoilt_pbg/próiseáilte/sonraí_traenála_próiseáilte
fi

AGA_REATHA=$[ $(date +%s) - ${AM_TOSACH} ]
echo 'críochnathe tar éis' $AGA_REATHA 'soicind'
