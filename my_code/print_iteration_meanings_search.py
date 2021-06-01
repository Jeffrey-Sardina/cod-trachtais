from config.search.epochs_3 import get_val_for_iteration
import sys

if __name__ == '__main__':
    if len(sys.argv) > 1:
        i = int(sys.argv[1])
        vals = ','.join(str(x) for x in get_val_for_iteration(i))
        print(i, vals, sep=',')
    else:
        i = 0
        while True:
            try:
                vals = ','.join(str(x) for x in get_val_for_iteration(i))
                print(i, vals, sep=',')
                i += 1
            except:
                break
    exit(0)
