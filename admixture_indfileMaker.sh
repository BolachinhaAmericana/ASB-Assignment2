#!/usr/bin/bash

ids=$(cat concIdsList.txt)

for id in $(cat concIdsList.txt);
do

seq_name=$(efetch -db sra -id $id -mode txt | grep -o "Member member_name.*bases" | sed 's/spots.//' | sed 's/.accession=//' | sed 's/Member.*total_bases//' | tail -n 1 | tr -d '"' | sed 's/Member.*name=//' | cut -d ' ' -f 1 >> seq_name.txt)
loc=$(efetch -db sra -id $id -mode txt | grep -o "Member member_name.*bases" | sed 's/spots.//' | sed 's/.accession=//' | sed 's/Member.*total_bases//' | tail -n 1 | tr -d '"' | sed 's/Member.*name=//' | cut -d ' ' -f 1 | sed 's/lm.*/Lumadeng 1/' | sed 's/qn.*/Qiunatong 2/' | sed 's/gz.*/Geza 3/' | sed 's/cw.*/Changwa 4/' | sed 's/xy.*/Xiyuegu 5/' | sed 's/ph.*/Pihe 6/' | sed 's/dl.*/Denglongba 7/' | sed 's/dg.*/Denggeng 8/' | sed 's/lk.*/Liuku 9/' | sed 's/ml.*/Mangliu 10/' >> localization.txt)

paste seq_name.txt localization.txt | column -s $'\t' -t > admixture.indfile


done

#Thank you Alex :D
