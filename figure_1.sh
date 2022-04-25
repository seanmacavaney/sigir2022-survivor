echo ; echo "r=1 dev/small"
ir_measures msmarco-passage/dev/small <(zcat runs/monot5-sim1.msm-dev.100.run.gz) 'RR@10'
echo ; echo "r=5 dev/small"
ir_measures msmarco-passage/dev/small <(zcat runs/monot5-sim5.msm-dev.100.run.gz) 'RR@10'
echo ; echo "r=10+ dev/small"
ir_measures msmarco-passage/dev/small <(zcat runs/monot5.msm-dev.100.run.gz) 'RR@10'

echo ; echo "r=1 dl19"
ir_measures msmarco-passage/trec-dl-2019 <(zcat runs/monot5-sim1.dl19.run.gz) 'nDCG@10 AP(rel=2) RR(rel=2)'
echo ; echo "r=5 dl19"
ir_measures msmarco-passage/trec-dl-2019 <(zcat runs/monot5-sim5.dl19.run.gz) 'nDCG@10 AP(rel=2) RR(rel=2)'
echo ; echo "r=10+ dl19"
ir_measures msmarco-passage/trec-dl-2019 <(zcat runs/monot5.dl19.run.gz) 'nDCG@10 AP(rel=2) RR(rel=2)'

echo ; echo "r=1 dl20"
ir_measures msmarco-passage/trec-dl-2020 <(zcat runs/monot5-sim1.dl20.run.gz) 'nDCG@10 AP(rel=2) RR(rel=2)'
echo ; echo "r=5 dl20"
ir_measures msmarco-passage/trec-dl-2020 <(zcat runs/monot5-sim5.dl20.run.gz) 'nDCG@10 AP(rel=2) RR(rel=2)'
echo ; echo "r=10+ dl20"
ir_measures msmarco-passage/trec-dl-2020 <(zcat runs/monot5.dl20.run.gz) 'nDCG@10 AP(rel=2) RR(rel=2)'

echo ; echo "r=1 robust04"
ir_measures disks45/nocr/trec-robust-2004 <(zcat runs/monot5-sim1.robust04.run.gz) 'P@20 nDCG@20'
echo ; echo "r=5 robust04"
ir_measures disks45/nocr/trec-robust-2004 <(zcat runs/monot5-sim5.robust04.run.gz) 'P@20 nDCG@20'
echo ; echo "r=10+ robust04"
ir_measures disks45/nocr/trec-robust-2004 <(zcat runs/monot5.robust04.run.gz) 'P@20 nDCG@20'
