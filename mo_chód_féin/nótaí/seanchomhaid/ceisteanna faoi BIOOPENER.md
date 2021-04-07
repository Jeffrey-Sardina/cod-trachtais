From / for meeting with Dr. Jha Dec. 7 2020.

My current understanding is:
- LTCGA can self-update as new data is added to TCGA
- Pubmed data is also continuously updated
- The final system is split across many endpoints to make the system more scalable, and TopFed translated top-level queries to queries on all the sub-endpoints
- The Linked TCGA Dashboard site on top all of this, and provides GUI access to all the data

1) Am I missing any major points in this structure?
- not really, that sumarizes it well. Some notes are lsited below,
- domain
    - Last project was BIOOPENER, which went towards KGs. It it the latest version, and most up to date.
        - read: 
    - Dist'd endpoined by cancer types and put TopFed on top of it
    - Including other datawith diff URIis a major challenge
- CS
    - parts: query, LD, ontology
    - URI inferability and intercvhge not optimal
    - For each it used a dictionayt and trued to ID duplicates, and fill in all possible lexemes for it (not done yet)
    - Query: No query optimization alg atm. Classical LD algs not made fot this lvl of complexity. Want to quwr datafrom its native type, not uiplift all
    - Saleem woreking on KGs of ontology. Used an ML approach on the LD and tried to findsimilar terms and make the ontology.
    - Federation also needs work--optimze, be able to quwry multi URI and multi dim data.
    - ML side for queries and Linking the Data
        - ML side means 2 things: query fed, convert plain text to SPARQL; second is Link Prediction. Find all links and see which are / should be linked to others. RTank tehse with a scoring system and ise this to expand the graph (link expansion)
        - Both of these are hugely imporant

The project is currently no longer maintained, since the original authors all left the university in which it was made.
- ^ is wrong. Work is being continued at NUI Galway (keep data in native form and qury that with sparql. CUrr. JSON, CSV, RDF)
- Yasar Khan

2) Do you still have all the data needed to replicate the original system?
- If so, where can I find that? I have downloaded triple dumps from an old version, but much of the server code did not seem to be available.
- Where is the code to do the continuous updates?

3) You mentioned that you still had some ideas for the project going forwards. What were those?
- Did you ever integrate the "Genomic Wheel" visualzition into the dashboard?

4) Have you attempted to run any machine learning / algorithmic models on top of the whole dataset?
- No, but Jha is working along those lines via NLP (link rel and preduiction) / DNN, butnot exactly yhat. He is on link pred to expand graph no analsuysis of the data as I had thought