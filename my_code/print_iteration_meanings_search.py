from config.search.general import get_val_for_iteration

if __name__ == '__main__':
    i = 0
    while True:
        try:
            vals = ','.join(str(x) for x in get_val_for_iteration(i))
            print(i, vals, sep=',')
            i += 1
        except:
            break
    exit(0)
