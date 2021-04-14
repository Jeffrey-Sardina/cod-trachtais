from ordered_set import OrderedSet
import sys
import string

caractair = string.printable.strip()

def comhbhrú(comhad_ionchurtha, comhad_aschurtha, comhad_tábla):
    print('ag cruthú an tábla')
    tábla = cruthaigh_tábla_comhbhrúite(comhad_ionchurtha)
    scríobh_tábla(tábla, comhad_tábla)
    print('tábla scríofa (' + str(len(tábla)) + ' líne)')
    
    print('ag scríobh an comhaid comhbhrúite')
    scríobh_comhad_comhbhrúite(tábla, comhad_ionchurtha, comhad_aschurtha)
    print('comhaid comhbhrúite scríofa')

def cruthaigh_tábla_comhbhrúite(comhad_ionchurtha):
    tábla = OrderedSet()
    áireamh = {}
    with open(comhad_ionchurtha, 'r', encoding='utf-8', errors='ignore') as ionchur:
        for líne in ionchur:
            ainmní, faisnéis, cúspóir = [teaghrán.strip() for teaghrán in líne.split('\t', 2)]

            tábla.add(ainmní)
            tábla.add(faisnéis)
            tábla.add(cúspóir)

            if not ainmní in áireamh:
                áireamh[ainmní] = 0
            if not faisnéis in áireamh:
                áireamh[faisnéis] = 0
            if not cúspóir in áireamh:
                áireamh[cúspóir] = 0
            áireamh[ainmní] += 1
            áireamh[faisnéis] += 1
            áireamh[cúspóir] += 1
            
    return OrderedSet(sorted(tábla, key=lambda x : áireamh[x], reverse=True))

def scríobh_tábla(tábla, comhad_tábla):
    with open(comhad_tábla, 'w') as aschur:
        for i, r in enumerate(tábla):
            print(go_bonn_94(i), r, sep='\t', file=aschur)

def scríobh_comhad_comhbhrúite(tábla, comhad_ionchurtha, comhad_aschurtha):
    with open(comhad_aschurtha, 'w') as aschur:
        with open(comhad_ionchurtha, 'r', encoding='utf-8', errors='ignore') as ionchur:
            for líne in ionchur:
                ainmní, faisnéis, cúspóir = [go_bonn_94(tábla.index(teaghrán.strip())) for teaghrán in líne.split('\t', 2)]
                print(ainmní, faisnéis, cúspóir, sep='\t', file=aschur)

def go_bonn_94(uimhir):
    #94, mar go bhfuil 94 caractar inphriontáilte ASCII (beart amháin)
    bonn = 94
    toradh = ''
    while True:
        toradh = caractair[uimhir % bonn] + toradh
        uimhir //= bonn
        if uimhir == 0:
            break
    if toradh == '':
        return '0'
    return toradh

if __name__ == '__main__':
    comhad_ionchurtha = sys.argv[1]
    comhad_aschurtha = sys.argv[2]
    comhad_tábla = sys.argv[3]
    comhbhrú(comhad_ionchurtha, comhad_aschurtha, comhad_tábla)
