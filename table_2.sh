echo "model no_answer answer_top10 answer_top3"
awk '$1=="BM25"&&$4<=10{s+=1}$1=="BM25"&&$4<=3{t+=1}$1=="BM25"&&$4=="NA"{u+=1}END{print "BM25", u, s, t}' annotations/discarded_rankings_by_model.tsv
awk '$1=="ANCE"&&$4<=10{s+=1}$1=="ANCE"&&$4<=3{t+=1}$1=="ANCE"&&$4=="NA"{u+=1}END{print "ANCE", u, s, t}' annotations/discarded_rankings_by_model.tsv
awk '$1=="ColBERT"&&$4<=10{s+=1}$1=="ColBERT"&&$4<=3{t+=1}$1=="ColBERT"&&$4=="NA"{u+=1}END{print "ColBERT", u, s, t}' annotations/discarded_rankings_by_model.tsv
awk '$1=="monoT5"&&$4<=10{s+=1}$1=="monoT5"&&$4<=3{t+=1}$1=="monoT5"&&$4=="NA"{u+=1}END{print "monoT5", u, s, t}' annotations/discarded_rankings_by_model.tsv

echo ""
awk 'NR>1{if ($4=="NA"){a[$2]+=1}}END{c=0; for (x in a){if (a[x]==4){c+=1}}print c " queries remain unanswerable by all systems"}' annotations/discarded_rankings_by_model.tsv
