#!/bin/bash

# Steps: 
# 1 - Create Environment - Done
# 2 - Get Full Raw Data - Done
# 3 - Cut Data in half using python math - 
# 4 - Rename Cut Data - 
# 5 - Delete Junk Files
# 6 - Run ipyrad 




getSraAccList(){

# This method will download all the complete files from the sra analysis.

## Vars
# SraAccList - This will read the list containing all the sra Run Acc
# SraAcc - This is the entry from the previous list

SraAccList=$( cat SraAccList.txt )

for SraAcc in $SraAccList
# In this loop we will be going trough the list with the sra Run Acc
do
	fasterq-dump $SraAcc
	#echo $row
	gzip "$SraAcc.fastq" 
	mv "$SraAcc.fastq.gz" ./data-assignment02/sra-full-100/"$SraAcc.fastq.gz"
done
return
}



echo "Please note that this step might take a while..."
echo "You can check the progress on ./data-assignment02/sra-full-100/"
echo ""
echo "This will also take around 130 Gb of your memory... yikes"
echo ""


getSraAccList

echo
echo "There might have been some reads that got corrupted or that the download failed for some reason. "
echo "thankfully it shouldnt be more then 10 so I think you can do that manually cant you? Please?"
echo
echo ""
echo "**************************"
echo "****                  ****"
echo "****     WARNING      ****"
echo "****                  ****"
echo "**************************"
echo ""
echo "To go any further you need to manually get the sra samples that crashed. When you have that done please run the next script"
echo "The program will run just fine if you dont get all the data but to replicate what we did here with accuracy thats a necessary step!"
echo ""
