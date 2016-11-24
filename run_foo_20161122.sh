#!/bin/bash

# Pack necessary stuff
if [ "$1" == "--no-pack" ]; then
    echo "no pack."
else
    python pack.py
fi

# Condor jobs
# [analyzer] [dataset] [datasetgroup] [selection] [period] [njobs]

#python jobify.py NoAnalyzer TTbar_PU0_foo TTbar_PU0_foo pdgid13 2016 5
python jobify.py NoAnalyzer TTbar_PU200_foo TTbar_PU200_foo pdgid13 2016 5

# When the condor jobs are done, do this:
#python retrieve.py
