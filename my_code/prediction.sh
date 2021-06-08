# embeddings_h5_file = sys.argv[1]
# entity_names_file = sys.argv[2]
# target_entity = sys.argv[3]
# top_n = sys.argv[4]
# python predictions.py \
#     nn \
#     100 \
#     backup_points/dbsnp_validated50e_100d_1/embeddings_all_1.v50.h5 \
#     ../copies.dbsnp/pbg_split/entity_names_all_1.json \
#     1VM% \
#     10



# dyn_rel_count_file = sys.argv[1]
# entity_count_file = sys.argv[2]
# model_h5_file = sys.argv[3]
# entity_names_file = sys.argv[4]
# dyn_rel_names_file = sys.argv[5]
# src_entity = sys.argv[6]
# relation = sys.argv[7]
# embeddings_h5_file = sys.argv[8]
# top_n = int(sys.srgv[9])
python predictions.py \
    ranking \
    100 \
    ../copies/dbsnp/pbg_split/dynamic_rel_count.txt \
    ../copies/dbsnp/pbg_split/entity_count_all_1.txt \
    backup_points/dbsnp_validated50e_100d_1/model.v50.h5 \
    ../copies/dbsnp/pbg_split/entity_names_all_1.json \
    ../copies/dbsnp/pbg_split/dynamic_rel_names.json \
    1VM% \
    +LG \
    backup_points/dbsnp_validated50e_100d_1/embeddings_all_1.v50.h5 \
    10
