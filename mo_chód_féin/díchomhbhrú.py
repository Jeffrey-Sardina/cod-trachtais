import sys
import os
import pandas as pd

def díchomhbhrú(comhad_réamhinsintí, tábla_comhbhrúite, aschur):
    réamhinsintí = pd.read_csv(comhad_réamhinsintí)
    tábla = {}
    with open(tábla_comhbhrúite, 'r') as ionchur:
        for líne in ionchur:
            innéacs, luach = líne.strip().split('\t')
            tábla[innéacs] = luach

    ainmní = réamhinsintí['head_label'].apply(lambda x : tábla[x])
    faisnéis = réamhinsintí['relation_label'].apply(lambda x : tábla[x])
    cuspóir = réamhinsintí['tail_label'].apply(lambda x : tábla[x])

    pd.DataFrame({'head_label':ainmní,
        'relation_label':faisnéis,
        'tail_label':cuspóir}).to_csv(aschur)

if __name__ == '__main__':
    comhad_réamhinsintí = sys.argv[1]
    tábla_comhbhrúite = sys.argv[2]
    aschur = sys.argv[3]
    díchomhbhrú(comhad_réamhinsintí, tábla_comhbhrúite, aschur)
