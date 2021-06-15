# File currently not in use
import sys
import pandas as pd
import numpy as np

lr_options = [1e-2, 1e-3, 1e-4]
regularization_coef_options = [1e-1, 1e-3, 1e-5]
loss_fn_options = ['ranking', 'softmax']
operator_options = ['translation', 'diagonal']
comparator_options = ['dot', 'l2']

lr_options = [1e-2, 1e-3, 1e-4]
regularization_coef_options = [None]
loss_fn_options = ['ranking', 'softmax']
operator_options = ['affine']
comparator_options = ['dot', 'l2']

def load_data_file(eval_file):
    df = pd.read_csv(eval_file)
    df['reg'] = pd.to_numeric(df['reg'], errors='coerce')  

    final_df = pd.DataFrame(columns=df.columns.values)
    for operator in operator_options:
        for comparator in comparator_options:
            for loss_fn in loss_fn_options:
                for lr in lr_options:
                    for reg in regularization_coef_options:
                        new_df = df[(df['loss_fn']==loss_fn)
                            & (df['operator']==operator)
                            & (df['comparator']==comparator)
                            & (df['lr']==lr)
                            & (df['reg']==reg)]
                        means_series = new_df.mean(axis=0)
                        final_df = final_df.append(means_series, ignore_index=True)
    print(final_df)


# def load_all_data(eval_files):
#     data = [load_data_file(eval_file) for eval_file in eval_files]
#     eval_data_mats = data[0]
#     headers = data[1][0]
#     return eval_data_mats, headers

# def average_evals(eval_data_mats):
#     sum_of_all = np.zeros(eval_data_mats[0].shape)
#     for eval_data_mat in eval_data_mats:
#         sum_of_all += eval_data_mat
#     return eval_data_mat / len(eval_data_mats)


# def average_values_lists(values_lists):
#     avg_values_list = []
#     num_vals = len(values_lists[0])
#     for i in range(num_vals):
#         vals = []
#         avg_val = None
#         stdev_val = None
#         is_text = False
#         for value_list in values_lists:
#             if type(value_list[i] == float):
#                 vals.append(value_list[i])
#             else:
#                 avg_val = value_list[i]
#                 is_text = True
        
#             if not is_text:
#                 avg_val = np.average(vals)
#                 stdev_val = np.std(vals)

#             avg_values_list.append((avg_val, stdev_val))
#     return avg_values_list

def try_floats(text_arr):
    return [try_float(text) for text in text_arr]

def try_float(text):
    try:
        return float(text)
    except:
        return text

def multi_average(lists_to_avg):
    avg_list = []
    std_list = []
    num_vals = len(lists_to_avg[0])
    for i in range(num_vals):
        vals = []
        for data_list in lists_to_avg:
            vals.append(data_list[i])
        avg_list.append(np.mean(vals))
        std_list.append(np.std(vals))
    return avg_list, std_list

def validate_identical(lists):
    last_list = lists[0]
    for l in lists[1:]:
        if l != last_list:
            raise ValueError('Not all lists are identical!')


def write_data(eval_files, avg_out_file, std_out_file, ignore_first_n):
    try:
        file_handles = []
        for eval_file in eval_files:
            file_handle = open(eval_file, 'r')
            next(file_handle) #skip first line (the header)
            file_handles.append(file_handle)
        with open(avg_out_file, 'a') as avg_out:
            with open(std_out_file, 'a') as std_out:
                while True:
                    lines = [next(file_handle, None) for file_handle in file_handles]
                    if None in lines:
                        if lines.count(None) < len(lines):
                            raise ValueError('Files have different line numbers--this should not be the case')
                        else:
                            break
                    values_lists = [try_floats(line.strip().split(',')) for line in lines]
                    no_change_lists = [vals[:ignore_first_n] for vals in values_lists]
                    validate_identical(no_change_lists)
                    no_change_list = no_change_lists[0]
                    to_average = [vals[ignore_first_n:] for vals in values_lists]
                    avg_list, std_list = multi_average(to_average)
                    print(','.join(str(x) for x in no_change_list + avg_list), file=avg_out)
                    print(','.join(str(x) for x in no_change_list + std_list), file=std_out)
    except:
        raise
    finally:
        for file_handle in file_handles:
            try:
                file_handle.close()
            except:
                pass

def write_header(eval_file, out_file):
    with open(eval_file, 'r') as out:
        header = next(out)
    with open(out_file, 'w') as out:
        print(header.strip(), file=out)

if __name__ == '__main__':
    avg_out_file = sys.argv[1]
    std_out_file = sys.argv[2]
    ignore_first_n = int(sys.argv[3])
    eval_files = sys.argv[4:]
    write_header(eval_files[0], avg_out_file)
    write_header(eval_files[0], std_out_file)
    write_data(eval_files, avg_out_file, std_out_file, ignore_first_n)
    exit(0)
