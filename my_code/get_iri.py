import sys

def get_iri(text):
    return text.strip().replace(' .', '').split(' ')[-1].strip()

if __name__ == '__main__':
    text = sys.argv[1]
    iri = get_iri(text)
    print(iri)
    exit(0)
