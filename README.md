# TranslateLocally

We’re building **open machine translation** using the *Marian machine translation toolkit* that’s fast enough to run locally. Translation models have varying quality depending on the data available and abilities of the models; we can’t fix individual errors made by the model but systematic errors are interesting. We aim to improve the models with better data, training recipes, and speed optimizations.

We have a [discourse forum](https://discourse.translatelocally.com/) for general discussions and questions. Feel free to join :)

## Disclaimer
This repo is currently being used for storing the **non** reproducible training pipeline we currently use (data fetching, data preparation (filtering, augmentation), training and evaluation script, etc...). For now, we have what we can call a **Bash Hell** : a pipeline of bash script calling other bash scripts or perl/python/C scripts... The end goal is to have this pipeline reproducible, minimalist and performant in one library.

### Then, why not OpusFilter ?
Altough the OpusFilter repo has some really handy tools, it has 3 major drawbacks that avoid us to use it in this project :
- it is too slow (it's using only one single thread)
- it has an architecture too complex and too many dependencies
- it is not as light and fast to add new dataset than MTData

For this reason, we would prefer to get an end-to-end pipeline (fetching, filtering and generating marian training script) in python (>3.7).


## Collaborators and Ackownlegments
- [Marian machine translation toolkit](https://marian-nmt.github.io/)
- [Bergamot Project](https://browser.mt/)
- [Helsinki-NLP](https://github.com/Helsinki-NLP)
- [Opus Corpus](https://opus.nlpl.eu/)
- [Paracrawl](https://paracrawl.eu/)
- [Mozilla](https://www.mozilla.org/en-US/)
- [MTData](https://github.com/thammegowda/mtdata)
- [Language Reactor](https://www.languagereactor.com/) (Previously **L**earning **L**anguages with **N**etflix)