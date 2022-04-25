for r in runs/{bm25,ance,colbert,monot5}.msm-dev.10.run.gz
do
  for q in qrels/*
  do
    echo $r $q
    ir_measures $q <(zcat $r) RR@10 NumQ --places 3
  done
done
