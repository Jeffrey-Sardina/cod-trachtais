import sys
import random
import os

def scoilt_cinnteachaíoch(comhaid_ionchuir, comhadlann_aschuir, comhréir_tástála, comhréir_deimhnithe):
    tástáil, deimhnigh = scoilt(comhaid_ionchuir, comhréir_tástála, comhréir_deimhnithe)
    scríobh_eolas(comhaid_ionchuir, comhadlann_aschuir, tástáil, deimhnigh)

def scoilt_randamach(comhaid_ionchuir, comhadlann_aschuir, comhréir_tástála, comhréir_deimhnithe):
    print('ag scríobh an eolais')
    comhad_sonraí_traenála = os.path.join(comhadlann_aschuir, 'sonraí_traenála.tsv')
    comhad_sonraí_tástála = os.path.join(comhadlann_aschuir, 'sonraí_tástála.tsv')
    comhad_sonraí_deimhnithe = os.path.join(comhadlann_aschuir, 'sonraí_deimhnithe.tsv')

    with open(comhaid_ionchuir, 'r') as ionchur: #errors='ignore'
        with open(comhad_sonraí_traenála, 'w') as sonraí_traenála:
            with open(comhad_sonraí_tástála, 'w') as sonraí_tástála:
                with open(comhad_sonraí_deimhnithe, 'w') as sonraí_deimhnithe:
                    for líne in ionchur:
                        r = random.random()
                        if r < comhréir_tástála:
                            print(líne.strip(), file=sonraí_tástála)
                        elif r < comhréir_tástála + comhréir_deimhnithe:
                            print(líne.strip(), file=sonraí_deimhnithe)
                        else:
                            print(líne.strip(), file=sonraí_traenála)

def scoilt(comhaid_ionchuir, comhréir_tástála, comhréir_deimhnithe):
    '''
    Caithfear gach rud a chur isteach trí sruth--beidh roinnt foinsí i bhfad
    níos mó ná méid na ciumhne 's agamsa é. Braitheann an cód seo ar méid
    cuimhne go leor chun uimhreacha na línte go léir a chur i dtacar, ach sin
    an méid.

    Aschuireann sé tacair sonraí tástála agus deimhnithe ina bhfuil uimhreacha
    líne na sonraí sin (Níl an t-eolas díreach insna tacair sin). Más ea nach
    bhfuil uimhir i gceann ar bith acu, is mar chuid de shonraí deimhnithe é
    sin.
    '''
    print('ag fáil innéacsanna na dtacar')
    n = faigh_uimhir_línte(comhaid_ionchuir)
    méid_tacair_tástála = int(n * comhréir_tástála + 1)
    méid_tacair_deimhnithe = int(n * comhréir_deimhnithe + 1)

    le_scoilt = [x for x in range(n)]
    random.shuffle(le_scoilt)
    tástáil = set(le_scoilt[:méid_tacair_tástála])
    deimhnigh = set(le_scoilt[méid_tacair_tástála:méid_tacair_tástála+méid_tacair_deimhnithe])
    
    return tástáil, deimhnigh

def scríobh_eolas(comhaid_ionchuir, comhadlann_aschuir, tástáil, deimhnigh):
    print('ag scríobh an eolais')
    comhad_sonraí_traenála = os.path.join(comhadlann_aschuir, 'sonraí_traenála.tsv')
    comhad_sonraí_tástála = os.path.join(comhadlann_aschuir, 'sonraí_tástála.tsv')
    comhad_sonraí_deimhnithe = os.path.join(comhadlann_aschuir, 'sonraí_deimhnithe.tsv')

    with open(comhaid_ionchuir, 'r') as ionchur: #errors='ignore'
        with open(comhad_sonraí_traenála, 'w') as sonraí_traenála:
            with open(comhad_sonraí_tástála, 'w') as sonraí_tástála:
                with open(comhad_sonraí_deimhnithe, 'w') as sonraí_deimhnithe:
                    i = 0
                    for líne in ionchur:
                        if i in tástáil:
                            tástáil.remove(i)
                            print(líne.strip(), file=sonraí_tástála)
                        elif i in deimhnigh:
                            deimhnigh.remove(i)
                            print(líne.strip(), file=sonraí_deimhnithe)
                        else:
                            print(líne.strip(), file=sonraí_traenála)
                        i += 1

def faigh_uimhir_línte(comhaid_ionchuir):
    n = 0
    with open(comhaid_ionchuir, 'r') as ionchur: #errors='ignore'
        for líne in ionchur:
            n += 1
    return n

if __name__ == '__main__':
    comhaid_ionchuir = sys.argv[1]
    comhadlann_aschuir = sys.argv[2]
    déan_scoilt_randamach = sys.argv[3] == '1'
    comhréir_tástála = 0.1
    comhréir_deimhnithe = 0.05

    if déan_scoilt_randamach:
        scoilt_randamach(comhaid_ionchuir, comhadlann_aschuir, comhréir_tástála, comhréir_deimhnithe)
    else:
        scoilt_cinnteachaíoch(comhaid_ionchuir, comhadlann_aschuir, comhréir_tástála, comhréir_deimhnithe)
 