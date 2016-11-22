#!/bin/bash

# Pack necessary stuff
if [ "$1" == "--no-pack" ]; then
    echo "no pack."
else
    python pack.py
fi

# Condor jobs
python jobify.py NoAnalyzer TTbar_PU0_part TTbar_PU0_part whatever 2016 100

# When the condor jobs are done, do this:
#python retrieve.py
