import sys

def faigh_iri_graif(téacs):
    return téacs.strip().replace(' .', '').split(' ')[-1].strip()

if __name__ == '__main__':
    téacs = sys.argv[1]
    iri = faigh_iri_graif(téacs)
    print(iri)