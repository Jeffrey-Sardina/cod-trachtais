from pykeen.triples import TriplesFactory
from pykeen.pipeline import pipeline

tf = TriplesFactory.from_path('triail.nt')
training, testing = tf.split()
result = pipeline(
    training=training,
    testing=testing,
    model='TransE',
    training_kwargs=dict(num_epochs=5),  # short epochs for testing - you should go higher
)
result.save_to_directory('t1')
