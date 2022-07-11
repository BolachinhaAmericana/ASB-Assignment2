#!/bin/bash

# 1 - Create Environment - Done
# 2 - Get Full Raw Data - Done
# 3 - Cut Data in half using python - Done
# 4 - Rename Cut Data
# 5 - Delete Junk Files
# 6 - Run ipyrad


sraCut50(){

# This method is used to cut all sra sequences compressed in x dir, cutting them in [1.0 - 0.0]% using python for some math and getting, in this case the sequences cut by half.

## vars
# run - compressed, uncut sra sequence.
# nRows - number of rows in $run sra sequence
# nRuns - number of runs that we fill perform to make the cut.
# file - name of the cut sequence
# destination - path to cut sequences dir
# nReducedRows - number of rows related to the number of runs with the cut

	for run in ./data-assignment02/sra-full-100/*.fastq.gz;
	do
		destination=$(echo "./data-assignment02/sra-half-50/")
		#echo ficheiro: $run
		nRows=$(gunzip -c $run | wc -l)
		#echo n Linhas: $nRows
		nRuns=$(echo $nRows | python3 nRuns.py) # the % of sequence cut from file is defined in the .py script
		#echo n Runs: $nRuns
		file=$(echo "$run" | sed "s/\.fastq\.gz/\.fastq/" | sed "s/.\/data-assignment02\/sra-full-100\///")
		#echo n Fastq: $file
		nReducedRows=$(echo "$nRuns * 4" | bc)
		#echo n Linhas Reduzidas $nReducedRows
		zcat $run | head -n $nReducedRows > $destination/$file & wait
		gzip $destination/$file
	done
}
sraCut50

echo ""
echo "**************************"
echo "****                  ****"
echo "****     WARNING      ****"
echo "****                  ****"
echo "**************************"
echo ""
echo Please continue to the next step. 
echo
echo ""
echo ""




