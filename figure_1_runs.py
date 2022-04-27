import pyterrier as pt
pt.init()
from pyterrier_t5 import MonoT5ReRanker
import argparse
import torch

BATCH_SIZE = 16


def main():
  torch.manual_seed(0)
  parser = argparse.ArgumentParser()
  parser.add_argument('dataset')
  parser.add_argument('model')
  parser.add_argument('out')
  parser.add_argument('--initial')
  parser.add_argument('--query_field')
  parser.add_argument('--passage', action='store_true')
  args = parser.parse_args()

  dataset = pt.get_dataset(args.dataset)

  reranker = MonoT5ReRanker(model=args.model, batch_size=16)
  if args.passage:
    # apply passaging
    reranker = pt.text.sliding(text_attr='text', prepend_attr=None) >> reranker >> pt.text.max_passage()
  pipeline = pt.text.get_text(dataset, 'text') >> reranker

  if args.initial == None:
    # initial ranking provided by dataset
    inp = dataset.get_results(args.query_field).sort_values(by=['qid'])
  else:
    # read initial ranking from file
    inp = pt.io.read_results(args.initial, topics=dataset.get_topics(args.query_field))

  res = pipeline(inp)

  #pt.io.write_results(res, args.model+'.dev-small.res')
  pt.io.write_results(res, args.out)


if __name__ == '__main__':
  main()
