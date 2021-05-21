#!/bin/bash

DATA=$1 
DEL_OLD_TSV=$2

echo 'ag fáil an IRI ab ceart a bhaint amach'
info=$(cat ../copies/$DATA/bio2rdf-$DATA.nq | head -n 1)
iri=$(python3 get_iri.py "$info")
echo 'ag baint amach an iri:' $iri

echo 'ag lódáil sonraí'
./to_compressed_nt.sh ../copies/$DATA/ "$iri" 1

#Ná scrios an rud seachas amháin má bhí bua ag to_compressed_nt
if [[ $? -eq 0 && DEL_OLD_TSV -eq "1" ]]
then
    echo 'ag scriosadh sonraí nach bhfuil comhbhrúite'
    mv ../copies/$DATA/all_compressed.tsv ../copies/$DATA/all_compressed.save
    mv ../copies/$DATA/all_table.tsv ../copies/$DATA/all_table.save
    rm ../copies/$DATA/*.tsv
    rm ../copies/$DATA/*.nq*
    mv ../copies/$DATA/all_compressed.save ../copies/$DATA/all_compressed.tsv
    mv ../copies/$DATA/all_table.save ../copies/$DATA/all_table.tsv
fi

exit 0
