# ASB-Assignment02
##  _High Throughput Sequencing at your fingertips_
- In this assignment we had to:
	- Search for a research paper that performed population genetics analyses.
	- Obtain the DNA reads on the paper, reduce our found dataset to a manageable size  (because we don't have super computers at home)
	- Reanalyze the data using PCA and admixture plots and compare our results with the ones they got on the original paper.
	- We also made sure that out analyses was reproductible so it will hopefully work on your computer as well!
#### What I did in this project
- This isn't the submitted assignment but rather everything I alone did. Its missing the PCA analysis and the interpretation  our results comparing them to the paper.
### How to run
For you to run this analysis you will simply need to run the scripts in order ( 1 - 6 ), wait for them to complete and follow their instructions.
### Used programs
- conda 4.13.0
-"fasterq-dump" version 2.11.0
- ipyrad 0.9.84
- Python 3.8.10
### How to run this program
1.  execute the 1_preparation.sh file
2.  activate a conda environment for sra analysis
3.  execute 2_getData.sh file
4.  execute 3_cutSecs.sh
5.  execute 4_renameCutSeqs.sh
6.  execute 5_DeleteJunk.sh 
7.  activate a conda environment for ipyrad assembly
8.  execute 6_ipyradRun.sh (takes number of cores as argument)
### What is in this repository
#### How does it work

- 1_preparation.sh - This script will check the existence of paths that will be used in the following scripts.
- 2_getData.sh - This script will be downloading and compressing the complete sra sequences. It uses fasterq-dump (v 2.11.0) program do download and gzip (v 1.10) to compress.
- 3_cutSecs.sh - this script will be cuting the sra sequences downloaded in "2_getData.sh" by half. It uses the "nRuns.py" to make some math in python (v 3.8.10) to achieve this effect.
- 4_renameCutSeqs.sh - This script will be renaming the cut files outputted from "3_cutSecs.sh" script. It creates the idList.txt and entry.xml files that contain information used for the effect of correctly renaming the sequences.
- 5_DeleteJunk.sh - This script will be deleting all the junk files left from the previous scripts aswell as some data that has some kind of problem and would mess with the assembly. It also has the option to delete all the data gathered up until this point (ipyrad files are not included) by using the "all" paramether in STDin
	< CAN take "all" as a paramether. NOT necessary >
- 6_ipyradRun.sh  - This script will simply run the ipyrad (v 0.9.84) assembly with the paramether set on "ipyrad-params-assignment02.txt" file.
	nRuns.py - python script used in "3_cutSecs.sh" 
	< Will take the number of cores as a paramether >
- paper.pdf - paper used for this assignment
- SraAccList.txt - List of all the SSR references used in our paper
- ipyrad-params-assignment02.txt - Paramethers for our ipyrad assembly in "6_ipyradRun.sh"
- data-assignment02 (Dir) - directory in wich we are saving our data downloaded in the scripts. 
- ipyrad-assembly   (Dir) - directory in wich the ipyrad assembly is performed
- README.md (This file) - README
	

