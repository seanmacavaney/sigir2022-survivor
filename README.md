# On Survivorship Bias in MS MARCO

Online appendix for **Prashansa Gupta and Sean MacAvaney. _On Survivorship Bias in MS MARCO_. SIGIR 2022.**

## Section 3: Analysis of Discarded Queries

**Can discarded queries by answered by recent ranking models?**

Annotations for this analysis are provided in `annotations/discarded_rankings_by_model.tsv`. This file is a TSV file (including a header row)
with columns for the scoring model, the query ID, relevant document ID (or _ if none found), and rank of document for the model.

You can generate the results presented in Table 2 based on the annotation file using the following command:

```bash
bash table_2.sh
```

**Distribution of unanswered queries by type.**

You can generate the results presented in Table 3 using the following command:

```bash
python table_3.py
```

(Note that if you have not yet downloaded the MS MARCO QnA dataset with the `ir_datasets` package, it will take a bit of time to download and prepare.)

## Section 4: Survivorship Bias in Evaluation

**Last-Metre Reproduction.**

If you want to double-check the values in Table 4, you can run the following command:

```bash
$ bash table_4.sh
runs/ance.10.run.gz qrels/dev-1.qrels
RR@10	0.240
NumQ	8192.000
runs/ance.10.run.gz qrels/dev-2.qrels
RR@10	0.244
NumQ	15532.000
...
```

This uses the same qrels and run files we used.

**Generating Simulated Qrels Files.**

If you want to generate the simulated qrels files at different annotation depths, you can use the following script:

```bash
python simulate_qrels.py
```

(Note that if you have not yet downloaded the MS MARCO QnA dataset with the `ir_datasets` package, it will take a bit of time to download and prepare.)

## Section 5: Survivorship Bias in Training

**Last-Metre Reproduction.**

If you want to double-check the values in Figure 1, you can run the following command:

```bash
$ bash figure_1.sh
```

**Last-Mile Reproduction.**

We release the trained models using simulated versions of MS MARCO on Huggingface, allowing the reproduction of our ranked lists.
 - [`macavaney/monot5-base-msmarco-sim1`](https://huggingface.co/macavaney/monot5-base-msmarco-sim1)
 - [`macavaney/monot5-base-msmarco-sim5`](https://huggingface.co/macavaney/monot5-base-msmarco-sim5)

These models are compatible with PyTerrier's [`MonoT5ReRanker`](https://github.com/terrierteam/pyterrier_t5):

```python
from pyterrier_t5 import MonoT5ReRanker
reranker = MonoT5ReRanker(model='macavaney/monot5-base-msmarco-sim1')
```

To generate the ranked lists we use in the paper, use the following script:
```bash
$ bash figure_1_runs.sh
```

## Appendix

The paper [A Non-Factoid Question-Answering Taxonomy](https://doi.org/10.1145/3477495.3531926) (Valeriia et al) was also published at SIGIR 2022.

As an analogue to Table 3, which demonstrated that different question types are more likely to survive in MS MARCO, we explore whether some question
categories from the above taxonomy are more likely to survive in MS MARCO's annotation process than others.

The following table can be reproduced by running `app_nfcats.py`:

| Category       |  Total | Discarded |     % |
|:---------------|-------:|----------:|------:|
| FACTOID        | 55,216 |    24,883 | 45.1% |
| EVIDENCE-BASED | 35,446 |    13,657 | 38.5% |
| INSTRUCTION    |  5,727 |     4,423 | 77.2% |
| REASON         |  2,487 |     1,429 | 57.5% |
| DEBATE         |  1,075 |       554 | 51.5% |
| NOT-A-QUESTION |    478 |       223 | 46.7% |
| COMPARISON     |    430 |       215 | 50.0% |
| EXPERIENCE     |    234 |       131 | 56.0% |

We find that instruction-based questions are far more likely to be discarded (77%) than other question types and are therefore under-represented in
MS MARCO. This might be because instruction lists are not well-captured by MS MARCO's passage technique, or that individual passages do not capture
a suffcient amount of the instructions. Meanwhile, EVIDENCE-BASED questions are far less likley to be discarded (39%) and are over-represented.
