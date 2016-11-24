#!/bin/bash

# Pack necessary stuff
if [ "$1" == "--no-pack" ]; then
    echo "no pack."
else
    python pack.py
fi

# Condor jobs
python jobify.py NoAnalyzer ElectronPt2to8_PU0_part ElectronPt2to8_PU0_part whatever 2016 100
python jobify.py NoAnalyzer ElectronPt2to8_PU200_part ElectronPt2to8_PU200_part whatever 2016 100
python jobify.py NoAnalyzer MuonPt2to8_PU0_part MuonPt2to8_PU0_part whatever 2016 100
python jobify.py NoAnalyzer MuonPt2to8_PU200_part MuonPt2to8_PU200_part whatever 2016 100
python jobify.py NoAnalyzer PionPt2to8_PU0_part PionPt2to8_PU0_part whatever 2016 100
python jobify.py NoAnalyzer PionPt2to8_PU200_part PionPt2to8_PU200_part whatever 2016 100
python jobify.py NoAnalyzer TTbar_PU0_part TTbar_PU0_part whatever 2016 100
python jobify.py NoAnalyzer TTbar_PU200_part TTbar_PU200_part whatever 2016 100

# When the condor jobs are done, do this:
#python retrieve.py
