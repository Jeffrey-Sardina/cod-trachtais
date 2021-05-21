#!/bin/bash

if [[ $3 -eq "1" ]]
then
    echo 'ag scriosadh seanchomhad'
    rm $1/*.tsv
else
    echo 'rabhadh: má tá eolas TSV ann cheana fhéinig, caithfear é a scriosadh sular féidir an cód seo a rith'
    if [[ -r *.tsv ]]
    then
        echo 'tá comhaid TSV ann cheana fhéinig, ní féidir leanúint ar aghaidh'
        exit 1
    fi
fi

echo 'ag aistriú gach comhaid ó NQ go TSV'
for nq_file in $1/*.nq;
do
    #Níl cead agam iad a léamh i gcónaí--deisigh é sin
    chmod a+r $nq_file
    cat $nq_file | \
        sed -e 's| '$2' \.||g' | \
        sed -e 's| <http|	<http|g' | \
        sed -e 's| <ftp|	<ftp|g' | \
        sed -e 's| "|	"|g' \
        > $nq_file.nt.tsv
done

echo 'ag cur an t-eolas uile isteach in "all.tsv"'
cat $1/*.tsv > $1/all.tsv

echo 'á chomhbhrú'
python3 compress.py $1/all.tsv $1/all_compressed.tsv $1/all_table.tsv

exit $?
