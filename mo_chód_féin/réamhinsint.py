import torch
import sys
import os

if __name__ == '__main__':
    fillteán_ionchurtha = sys.argv[1]
    model = torch.load(os.path.join(fillteán_ionchurtha, 'trained_model.pkl'))
    réamhinsintí = model.get_all_prediction_df()
    réamhinsintí.to_csv(os.path.join(fillteán_ionchurtha, 'réamhinsintí.csv'))
