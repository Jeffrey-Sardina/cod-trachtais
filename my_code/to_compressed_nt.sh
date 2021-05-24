#!/bin/bash

FILES_LOC=$1
DEL_OLD=$2

if [[ $DEL_OLD -eq "1" ]]
then
    echo 'ag scriosadh seanchomhad'
    rm $FILES_LOC/*.tsv
else
    echo 'rabhadh: má tá eolas TSV ann cheana fhéinig, caithfear é a scriosadh sular féidir an cód seo a rith'
    if [[ -r *.tsv ]]
    then
        echo 'tá comhaid TSV ann cheana fhéinig, ní féidir leanúint ar aghaidh'
        exit 1
    fi
fi

echo 'ag aistriú gach comhaid ó NQ go TSV'
for nq_file in $FILES_LOC/*.nq;
do
    #Níl cead agam iad a léamh i gcónaí--deisigh é sin
    chmod a+r $nq_file

    #Is féidir nach bhfuil an IRI mar an gcéanna i gcónaí!
    info=$(cat $nq_file | head -n 1)
    IRI=$(python3 get_iri.py "$info")
    echo 'ag baint amach an iri:' $IRI

    # cat $nq_file | \
    #     sed -e 's| '$IRI' \.||g' | \
    #     sed -e 's| <http|	<http|g' | \
    #     sed -e 's| <ftp|	<ftp|g' | \
    #     sed -e 's| "|	"|g' \
    #     > $nq_file.nt.tsv

    python nq_to_tsv.py $nq_file $IRI $nq_file.nt.tsv
    if [[ $? -ne "0" ]]
    then
        echo 'nq_to_tsv.py error: stopping script'
        exit 1
    fi
    
    # cat $nq_file | \
    #     sed -e 's| '$IRI' \.||g' | \
    #     sed -e 's|> |>	|g' \
    #     > $nq_file.nt.tsv

    echo 'ag fíordheimhniú an .tsv'
    python numcols.py $nq_file.nt.tsv 3
    if [[ $? -ne "0" ]]
    then
        echo 'nq=>tsv error detected by numcols.py: stopping script'
        exit 1
    fi
done

echo 'ag cur an t-eolas uile isteach in "all.tsv"'
cat $FILES_LOC/*.tsv > $FILES_LOC/all.tsv

echo 'á chomhbhrú'
python3 compress.py $FILES_LOC/all.tsv $FILES_LOC/all_compressed.tsv $FILES_LOC/all_table.tsv
if [[ $? -ne "0" ]]
then
    echo 'compress.py error: stopping script'
    exit 1
fi

echo 'ag fíordheimhniú na gcomhad combhrúite'
python numcols.py $FILES_LOC/all_compressed.tsv 3
if [[ $? -ne "0" ]]
then
    echo 'compression file error detected by numcols.py: stopping script'
    exit 1
fi
python numcols.py $FILES_LOC/all_table.tsv 2
if [[ $? -ne "0" ]]
then
    echo 'compression table error detected by numcols.py: stopping script'
    exit 1
fi

exit 0
