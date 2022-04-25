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

**Models**

The versions of monoT5 that were trained on simulated (smaller) versions of MS MARCO are available on huggingface:
 - [`macavaney/monot5-base-msmarco-sim1`](https://huggingface.co/macavaney/monot5-base-msmarco-sim1)
 - [`macavaney/monot5-base-msmarco-sim5`](https://huggingface.co/macavaney/monot5-base-msmarco-sim5)
