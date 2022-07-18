import os
from collections import Counter
import itertools
import more_itertools
import ir_datasets

logger = ir_datasets.log.easy()

dataset = ir_datasets.load('msmarco-qna/dev')

annotations_file = 'annotations/nfcats.msmarco-dev.tsv'

if not os.path.exists(annotations_file):
  from transformers import AutoTokenizer
  from nfqa_model import RobertaNFQAClassification
  nfqa_model = RobertaNFQAClassification.from_pretrained("Lurunchik/nf-cats").cuda()
  nfqa_tokenizer = AutoTokenizer.from_pretrained("deepset/roberta-base-squad2")

  with ir_datasets.util.finialized_file(annotations_file, 'wt') as fout:
    for batch in more_itertools.chunked(logger.pbar(dataset.queries, 'nfcats api'), 100):
      output = nfqa_model(**{k: v.cuda() for k, v in nfqa_tokenizer([q.text for q in batch], return_tensors="pt", padding=True, truncation=True).items()})
      indexes = output.logits.argmax(dim=1).tolist()
      for q, i in zip(batch, indexes):
        label = nfqa_model.config.id2label[int(i)]
        fout.write(f'{q.query_id}\t{label}\n')
      fout.flush()

answered_qids = set()

for qid, group in itertools.groupby(dataset.qrels, lambda x: x.query_id):
  group = list(group)
  is_answered = any(q.relevance > 0 for q in group)
  if is_answered:
    answered_qids.add(qid)

total_by_type = Counter()
unanswered_by_type = Counter()

for line in open(annotations_file):
  qid, label = line.strip().split('\t')
  total_by_type[label] += 1
  if not qid in answered_qids:
    unanswered_by_type[label] += 1

print('total_by_type', total_by_type)
print('unanswered_by_type', unanswered_by_type)
