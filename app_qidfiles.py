from collections import Counter
import itertools
import ir_datasets

dataset = ir_datasets.load('msmarco-qna/dev')
with open('annotations/dev.survived.txt', 'wt') as fs, open('annotations/dev.discarded.txt', 'wt') as fd:
  for qid, group in itertools.groupby(dataset.qrels, lambda x: x.query_id):
    group = list(group)
    is_answered = any(q.relevance > 0 for q in group)
    if is_answered:
      fs.write(qid + '\n')
    else:
      fd.write(qid + '\n')

dataset = ir_datasets.load('msmarco-qna/train')
with open('annotations/train.survived.txt', 'wt') as fs, open('annotations/train.discarded.txt', 'wt') as fd:
  for qid, group in itertools.groupby(dataset.qrels, lambda x: x.query_id):
    group = list(group)
    is_answered = any(q.relevance > 0 for q in group)
    if is_answered:
      fs.write(qid + '\n')
    else:
      fd.write(qid + '\n')
