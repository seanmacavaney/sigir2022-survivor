import json
import ir_datasets
import itertools
logger = ir_datasets.log.easy()

dataset = ir_datasets.load('msmarco-qna/dev')

files = [open(f'qrels/dev-{i+1}.qrels', 'wt') for i in range(9)]
f_all = open('qrels/dev-all.qrels', 'wt')
result = {}
for key, group in itertools.groupby(logger.pbar(dataset.qrels), key=lambda x: x.query_id):
  for i, qrel in enumerate(group):
    if qrel.relevance == 1:
      s_qrel = f'{qrel.query_id} 0 {qrel.doc_id.split("-")[0]} 1\n'
      f_all.write(s_qrel)
      for file in files[i:]:
        file.write(s_qrel)
