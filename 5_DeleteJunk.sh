#!/bin/bash

# Steps: 
# 1 - Create Environment - Done
# 2 - Get Full Raw Data - Done
# 3 - Cut Data in half using python - Done
# 4 - Rename Cut Data - Done
# 5 - Delete Junk Files - Done
# 6 - Run ipyrad -


echo if you wish to delete all the data and not only the junk files please add the "all" paramether! 



DeleteFiles(){

parametro=$(echo all)
	if [ $1 == $parametro ]; then
		echo Deleting all Data + Junk Files!
		rm idList.txt
		rm entry.xml
		rm ./data-assignment02/sra-full-100/*
		rm ./data-assignment02/sra-half-50/*


	else
		rm idList.txt
		rm entry.xml
		rm ./data-assignment02/sra-full-100/SRR3947751.fastq.gz
		rm ./data-assignment02/sra-half-50/qnt15.fastq.gz
		rm ./data-assignment02/sra-full-100/SRR3947730.fastq.gz
		rm ./data-assignment02/sra-half-50/ph19.fastq.gz
		rm wget*
	fi

}
DeleteFiles $1

DeleteDirs(){

parametro=$(echo all)
	if [ $1 == $parametro ]; then
		rmdir ./data-assignment02/sra-full-100
		rmdir ./data-assignment02/sra-half-50
		rmdir data-assignment02
	fi
		
	
}

DeleteDirs $1



echo
echo
echo ""
echo "**************************"
echo "****                  ****"
echo "****     WARNING      ****"
echo "****                  ****"
echo "**************************"
echo ""
echo "In order for the next step to work you will need to manually change your conda environment"
echo "for something that will be able to run ipyrad correctly."
echo



	
