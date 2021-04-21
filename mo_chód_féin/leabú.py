from pykeen.triples import TriplesFactory
from pykeen.pipeline import pipeline
import resource
import sys
import os

# Cuir bac ar an méid cuimhne is m ó atá sé ceadaithe a úsáid
# go dtí gur féidir liom rudaí a dhéanamh ar mo ríomhaire fós
# https://stackoverflow.com/questions/41105733/limit-ram-usage-to-python-program
# https://www.geeksforgeeks.org/python-how-to-put-limits-on-memory-and-cpu-usage/
def teorannaigh_cuimhne(limit): 
    soft, hard = resource.getrlimit(resource.RLIMIT_AS)
    resource.setrlimit(resource.RLIMIT_AS, (limit, hard))
teorannaigh_cuimhne(15 * 1024 ** 3)

# Anailísíocht
comhad_ionchurtha = sys.argv[1]
samhail = sys.argv[2]
aschur = sys.argv[3]

tf = TriplesFactory.from_path(comhad_ionchurtha)
traenáil, tástáil = tf.split()
#Comhadlann cúltacuithe: /home/siothrun/.data/pykeen/checkpoints/
result = pipeline(
    training=traenáil,
    testing=tástáil,
    model=samhail,
    random_seed=42,
    training_kwargs=dict(
        num_epochs=100,
        checkpoint_name=os.path.join(os.path.basename(aschur) + '-' + samhail + '-cúltacú.pt'),
        checkpoint_frequency=0,
    ),
)
result.save_to_directory(aschur)
