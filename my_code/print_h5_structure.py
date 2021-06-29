import h5py
import sys

#From: https://stackoverflow.com/questions/43371438/how-to-inspect-h5-file-in-python
def scan_hdf5(path, recursive=True, tab_step=2):
    def scan_node(g, tabs=0):
        print(' ' * tabs, g.name)
        for k, v in g.items():
            if isinstance(v, h5py.Dataset):
                print(' ' * tabs + ' ' * tab_step + ' -', v.name)
            elif isinstance(v, h5py.Group) and recursive:
                scan_node(v, tabs=tabs + tab_step)
    with h5py.File(path, 'r') as f:
        scan_node(f)

embeddings_h5_file = sys.argv[1]
scan_hdf5(embeddings_h5_file)
