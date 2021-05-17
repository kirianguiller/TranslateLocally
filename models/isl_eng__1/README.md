# isl_eng__1

This is the "prototype" pipeline that the Language Learning with Netflix team works on. The goal is for us (LLN) to get first more familiar with the whole pipeline and then work on making this reproducible and machine independant (at least for the data pipeline part).

## Baseline model
### Parallel data
- Paracrawl_v8 (originally 5M sentences, filtered to 1.5 million sentences)
- CCAligned
- Opensubtitles
- JW300
- TildeMODEL
After filtering and deduplication, the dataset is composed of 4.6M sentences.
### Filtering 
- Fasttext language detection (+ confidence score > 0.8)
- Marian scoring (from this Helsinki Tatoeba) : normalized score above -3 for ParaCrawl_v8 and above -5 for all other corpus (these other corpus may have been used for training the marian model, I preferred to not have a too high threshold)

### Validation
Tatoeba challenge with perplexity score (will be changed to sacrebleu)
