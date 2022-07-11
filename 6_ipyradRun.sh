#!/bin/bash

# 1 - Create Environment - Done
# 2 - Get Full Raw Data - Done
# 3 - Cut Data in half using python - Done
# 4 - Rename Cut Data - Done
# 5 - Run ipyrad - Done

RunIpyrad(){

# This method will simply execute ipyrad. Please mind that you need to have a proper conda env to run this.

# Will take the number of cores as argument!!!

	ipyrad -p ./ipyrad-params-assignment02.txt -s 1234567 -c $1

}

RunIpyrad $1
