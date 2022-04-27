#python figure_1_runs.py irds:msmarco-passage/trec-dl-2019/judged macavaney/monot5-base-msmarco-sim1 runs/monot5-sim1.dl19.run
#python figure_1_runs.py irds:msmarco-passage/trec-dl-2020/judged macavaney/monot5-base-msmarco-sim1 runs/monot5-sim1.dl20.run
#python figure_1_runs.py irds:msmarco-passage/dev/small           macavaney/monot5-base-msmarco-sim1 runs/monot5-sim1.msm-dev.run
#python figure_1_runs.py irds:trec-robust04                       macavaney/monot5-base-msmarco-sim1 runs/monot5-sim1.robust04.run --initial runs/bm25.robust04.run --query_field description --passage

#python figure_1_runs.py irds:msmarco-passage/trec-dl-2019/judged macavaney/monot5-base-msmarco-sim5 runs/monot5-sim5.dl19.run
#python figure_1_runs.py irds:msmarco-passage/trec-dl-2020/judged macavaney/monot5-base-msmarco-sim5 runs/monot5-sim5.dl20.run
python figure_1_runs.py irds:msmarco-passage/dev/small           macavaney/monot5-base-msmarco-sim5 runs/monot5-sim5.msm-dev.run
#python figure_1_runs.py irds:trec-robust04                       macavaney/monot5-base-msmarco-sim5 runs/monot5-sim5.robust04.run --initial runs/bm25.robust04.run --query_field description --passage

#python figure_1_runs.py irds:msmarco-passage/trec-dl-2019/judged castorini/monot5-base-msmarco runs/monot5.dl19.run
#python figure_1_runs.py irds:msmarco-passage/trec-dl-2020/judged castorini/monot5-base-msmarco runs/monot5.dl20.run
python figure_1_runs.py irds:msmarco-passage/dev/small           castorini/monot5-base-msmarco runs/monot5.msm-dev.run
#python figure_1_runs.py irds:trec-robust04                       castorini/monot5-base-msmarco runs/monot5.robust04.run --initial runs/bm25.robust04.run --query_field description --passage
