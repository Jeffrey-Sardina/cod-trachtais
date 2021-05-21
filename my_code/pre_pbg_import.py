import sys
import random
import os

def deterministic_split(input_file, output_dir, test_prop, validation_prop):
    test, validate = split(input_file, test_prop, validation_prop)
    write_data(input_file, output_dir, test, validate)

def random_split(input_file, output_dir, test_prop, validation_prop):
    print('ag scríobh an eolais')
    training_data_file = os.path.join(output_dir, 'training_data.tsv')
    testing_data_file = os.path.join(output_dir, 'testing_data.tsv')
    validation_data_file = os.path.join(output_dir, 'validation_data.tsv')

    with open(input_file, 'r') as ionchur: #errors='ignore'
        with open(training_data_file, 'w') as training_data:
            with open(testing_data_file, 'w') as testing_data:
                with open(validation_data_file, 'w') as validation_data:
                    for line in ionchur:
                        r = random.random()
                        if r < test_prop:
                            print(line.strip(), file=testing_data)
                        elif r < test_prop + validation_prop:
                            print(line.strip(), file=validation_data)
                        else:
                            print(line.strip(), file=training_data)

def split(input_file, test_prop, validation_prop):
    '''
    Caithfear gach rud a chur isteach trí sruth--beidh roinnt foinsí i bhfad
    níos mó ná méid na ciumhne 's agamsa é. Braitheann an cód seo ar méid
    cuimhne go leor chun uimhreacha na línte go léir a chur i dtacar, ach sin
    an méid.

    Aschuireann sé tacair sonraí tástála agus deimhnithe ina bhfuil uimhreacha
    line na sonraí sin (Níl an t-eolas díreach insna tacair sin). Más ea nach
    bhfuil uimhir i gceann ar bith acu, is mar chuid de shonraí deimhnithe é
    sin.
    '''
    print('ag fáil innéacsanna na dtacar')
    n = get_num_lines(input_file)
    test_set_size = int(n * test_prop + 1)
    if validation_prop != 0:
        validation_set_size = int(n * validation_prop + 1)
    else:
        validation_set_size = 0

    to_split = [x for x in range(n)]
    random.shuffle(to_split)
    test = set(to_split[:test_set_size])
    validate = set(to_split[test_set_size:test_set_size+validation_set_size])
    
    return test, validate

def write_data(input_file, output_dir, test, validate):
    print('ag scríobh an eolais')
    training_data_file = os.path.join(output_dir, 'training_data.tsv')
    testing_data_file = os.path.join(output_dir, 'testing_data.tsv')
    validation_data_file = os.path.join(output_dir, 'validation_data.tsv')

    with open(input_file, 'r') as inp: #errors='ignore'
        with open(training_data_file, 'w') as training_data:
            with open(testing_data_file, 'w') as testing_data:
                with open(validation_data_file, 'w') as validation_data:
                    i = 0
                    for line in inp:
                        if i in test:
                            test.remove(i)
                            print(line.strip(), file=testing_data)
                        elif i in validate:
                            validate.remove(i)
                            print(line.strip(), file=validation_data)
                        else:
                            print(line.strip(), file=training_data)
                        i += 1

def get_num_lines(input_file):
    n = 0
    with open(input_file, 'r') as inp: #errors='ignore'
        for _ in inp:
            n += 1
    return n

if __name__ == '__main__':
    input_file = sys.argv[1]
    output_dir = sys.argv[2]
    do_random_split = sys.argv[3] == '1'
    test_prop = 0.15
    validation_prop = 0

    if do_random_split:
        random_split(input_file, output_dir, test_prop, validation_prop)
    else:
        deterministic_split(input_file, output_dir, test_prop, validation_prop)
    
    exit(0)
