import os

params = {}
search_iteration = 0
for key, val in os.environ.items():
    if key == "SEARCH_ITERATION":
        search_iteration = val

print(search_iteration)