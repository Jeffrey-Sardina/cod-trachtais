import sys
import os
import re

def convert_file(nq_file, iri_extended, out_file):
    with open(nq_file, 'r', encoding='utf-8', errors='ignore') as inp:
        with open(out_file, 'w') as out:
            for line in inp:
                line = line.strip()
                line = remove_iri(line,iri_extended)
                if len(line) > 0:
                    items = get_items(line)
                    line = '\t'.join(items)
                    print(line, file=out)

def find_unquoted(line, char):
    in_quote = False
    for i, c in enumerate(line):
        if c == '"':
            in_quote = not in_quote
        elif c == char:
            if not in_quote:
                return i
            if in_quote and i - 1 > 0 and line[i-1] == '"': #Cases like <http://bio2rdf.org/pharmgkb:">
                return i
    raise ValueError("could not find " + char + ' in ' + line)

def get_items(line):
    start = line.find('<http') #find_unquoted(line, '<') #line.find('<')
    if start == -1:
        start = line.find('<ftp')
    end = line.find('> <http') #find_unquoted(line, '>') #line.find('>')
    if end == -1:
        end = line.find('> <ftp')
    subject = line[start : end+1]
    line = line[end+1: ]

    start = line.find('<http') #find_unquoted(line, '<') #line.find('<')
    if start == -1:
        start = line.find('<ftp')
    end = find_unquoted(line, '>')
    if end == -1:
        end = line.find('> <ftp')
    predicate = line[start : end+1]
    object = line[end+1: ].strip().replace('\t', ' ')

    return subject, predicate, object

def remove_iri(line, iri_extended):
    return line.replace(iri_extended, '')

if __name__ == '__main__':
    nq_file = sys.argv[1]
    iri_to_rm = sys.argv[2]
    out_file = sys.argv[3]

    iri_extended = ' ' + iri_to_rm + ' .'
    convert_file(nq_file, iri_extended, out_file)
    exit(0)
