from collections import Counter
import itertools
import ir_datasets

dataset = ir_datasets.load('msmarco-qna/dev')

answered_qids = set()

for qid, group in itertools.groupby(dataset.qrels, lambda x: x.query_id):
  group = list(group)
  is_answered = any(q.relevance > 0 for q in group)
  if is_answered:
    answered_qids.add(qid)

total_by_type = Counter()
unanswered_by_type = Counter()

for q in dataset.queries:
  total_by_type[q.type] += 1
  if not q.query_id in answered_qids:
    unanswered_by_type[q.type] += 1

print('total_by_type', total_by_type)
print('unanswered_by_type', unanswered_by_type)
