#!/bin/bash

# 1 - Create Environment - Done
# 2 - Get Full Raw Data - Done
# 3 - Cut Data in half using python - Done
# 4 - Rename Cut Data - Done
# 5 - Delete Junk Files
# 6 - Run ipyrad


CreateIdFile(){


# This method will create the "idList.txt" file. This file will contain the list of all the IDs correspondent to the run_accn from our sra sequences.

## Vars
# ids - This variable will contain the content that will be written to the output file.

ids=$(wget https://eutils.ncbi.nlm.nih.gov/entrez/eutils/esearch.fcgi\?db\=sra\&term\="SRP079503"\&usehistory\=y\&retmax=1000 -O - |grep '<Id>' | sed 's/^....//'|rev |sed 's/^.....//'|rev)

echo $ids > ./idList.txt

}

CreateIdFile

RenameFilesById(){

# This method will rename all the files from our already cut sequences, assigning the run accn with the sample name.

## Vars
# idList - This is assigning a file with the list of the ids from the sra sequences.
# entry - This will create the "entry.xml" file that contains all the information on the especific id that is currently running.
# sampleName - This will cut everything before and after the sample name from our id, giving us the sample name from said id itself
# runAccn - This will cut everything before and after the run accesion, giving us the run acession from said if itself
	idList=$(cat ./idList.txt )
	
# This for loop will be looping trough the idList file, each cycle will be refering to a expecific id from the list.
	for id in $idList
	do

	wget https://eutils.ncbi.nlm.nih.gov/entrez/eutils/efetch.fcgi/\?db\=sra\&id\=$id\&rettype\=fasta -O ./entry.xml
	entry=$( cat entry.xml) # Efetch do ID
	sampleName=$( echo $entry | sed "s/.*sample_name=\"//" | sed "s/\" spots=.*//")  #WORKING
	runAccn=$( echo $entry | sed "s/.*accession=\"SRR/SRR/" | sed "s/\" alias=.*//") #WORKING
	mv ./data-assignment02/sra-half-50/"$runAccn.fastq.gz" ./data-assignment02/sra-half-50/"$sampleName.fastq.gz"
	
	done
}
RenameFilesById

echo
echo
echo
echo ""
echo "**************************"
echo "****                  ****"
echo "****     WARNING      ****"
echo "****                  ****"
echo "**************************"
echo ""
echo please continue to run next script!
