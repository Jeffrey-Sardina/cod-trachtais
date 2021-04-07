from pykeen.pipeline import pipeline

pipeline_result = pipeline(dataset='Nations', model='RotatE')
model = pipeline_result.model

# Predict tails
predicted_tails_df = model.predict_tails('brazil', 'intergovorgs')

# Predict heads
predicted_heads_df = model.predict_heads('conferences', 'brazil')

print(predicted_tails_df)

# save the model
pipeline_result.save_to_directory('nations_rotate')
