echo 'ag aistriú gach comhaid ó NQ go TSV'
echo 'rabhadh: má tá eolas TSV ann cheana fhéinig, caithfear é a scriosadh sular féidir an cód seo a rith'
for comhaid_nq in $1/*.nq;
do
    #Níl cead agam iad a léamh i gcónaí--deisigh é sin
    chmod a+r $comhaid_nq

    #Beidh orm an URLK a athrú gach uair eile
    cat $comhaid_nq | \
        sed -e 's| '$2' \.||g' | \
        sed -e 's| <http|	<http|g' | \
        sed -e 's| "|	"|g' \
        > $comhaid_nq.nt.tsv
done

echo 'ag cur an t-eolas uile isteach in "uile.tsv"'
cat $1/*.tsv > $1/uile.tsv

echo 'á chomhbhrú'
python3 comhbhrú.py $1/uile.tsv $1/uile_comhbhrúite.tsv $1/uile_tábla.tsv
