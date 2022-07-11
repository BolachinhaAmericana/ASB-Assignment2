#!/bin/bash

# Steps: 
# 1 - Create Environment - Done
# 2 - Get Full Raw Data - 
# 3 - Cut Data in half using python
# 4 - Rename Cut Data
# 5 - Delete Junk Files
# 6 - Run ipyrad



createEnv(){

# This method will set up the DIRs in wich we will be working.

if [ -d ./data-assignment02 ] && [ -d ./ipyrad-assembly-assignment02 ]; then

	echo All Check :^D
else
	echo "something is missing, creating child dir(s)"
	mkdir data-assignment02
	mkdir ipyrad-assembly-assignment02
	mkdir ./data-assignment02/sra-full-100
	mkdir ./data-assignment02/sra-half-50
	echo "ALL DONE !"
	fi
return
}	

createEnv
echo ""
echo "**************************"
echo "****                  ****"
echo "****     WARNING      ****"
echo "****                  ****"
echo "**************************"
echo ""
echo To go any further you need to manually activate your conda env for sra data gathering
echo In this script we are using fasterq-dump so make sure you have that aswell before advancing !
echo ""
echo ""

