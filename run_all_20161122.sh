#!/bin/bash

# Pack necessary stuff
if [ "$1" == "--no-pack" ]; then
    echo "no pack."
else
    python pack.py
fi

# Condor jobs
# [analyzer] [dataset] [datasetgroup] [selection] [period] [njobs]

### PARTIAL ###
python jobify.py NoAnalyzer MuonPt2to8_PU0_part MuonPt2to8_PU0_part pdgid13 2016 53
#python jobify.py NoAnalyzer MuonPt2to8_PU140_part MuonPt2to8_PU140_part pdgid13 2016 100
#python jobify.py NoAnalyzer MuonPt2to8_PU200_part MuonPt2to8_PU200_part pdgid13 2016 100
python jobify.py NoAnalyzer MuonPt8to100_PU0_part MuonPt8to100_PU0_part pdgid13 2016 53
#python jobify.py NoAnalyzer MuonPt8to100_PU140_part MuonPt8to100_PU140_part pdgid13 2016 100
#python jobify.py NoAnalyzer MuonPt8to100_PU200_part MuonPt8to100_PU200_part pdgid13 2016 100

python jobify.py NoAnalyzer PionPt2to8_PU0_part PionPt2to8_PU0_part pdgid211 2016 52
#python jobify.py NoAnalyzer PionPt2to8_PU140_part PionPt2to8_PU140_part pdgid211 2016 100
#python jobify.py NoAnalyzer PionPt2to8_PU200_part PionPt2to8_PU200_part pdgid211 2016 65
python jobify.py NoAnalyzer PionPt8to100_PU0_part PionPt8to100_PU0_part pdgid211 2016 49
#python jobify.py NoAnalyzer PionPt8to100_PU140_part PionPt8to100_PU140_part pdgid211 2016 100
#python jobify.py NoAnalyzer PionPt8to100_PU200_part PionPt8to100_PU200_part pdgid211 2016 100

python jobify.py NoAnalyzer ElectronPt2to8_PU0_part ElectronPt2to8_PU0_part pdgid11 2016 52
##python jobify.py NoAnalyzer ElectronPt2to8_PU140_part ElectronPt2to8_PU140_part pdgid11 2016 82
##python jobify.py NoAnalyzer ElectronPt2to8_PU200_part ElectronPt2to8_PU200_part pdgid11 2016 100
python jobify.py NoAnalyzer ElectronPt8to100_PU0_part ElectronPt8to100_PU0_part pdgid11 2016 52
##python jobify.py NoAnalyzer ElectronPt8to100_PU140_part ElectronPt8to100_PU140_part pdgid11 2016 1
##python jobify.py NoAnalyzer ElectronPt8to100_PU200_part ElectronPt8to100_PU200_part pdgid11 2016 100

python jobify.py NoAnalyzer TTbar_PU0_part TTbar_PU0_part all 2016 100
python jobify.py NoAnalyzer TTbar_PU140_part TTbar_PU140_part all 2016 200
python jobify.py NoAnalyzer TTbar_PU200_part TTbar_PU200_part all 2016 400

#python jobify.py NoAnalyzer MuonPt2to8_FLATBS15PU200_part MuonPt2to8_FLATBS15PU200_part pdgid13 2016 100
#python jobify.py NoAnalyzer MuonPt8to100_FLATBS15PU200_part MuonPt8to100_FLATBS15PU200_part pdgid13 2016 100
#python jobify.py NoAnalyzer TTbar_CoolLoopPU200_part TTbar_CoolLoopPU200_part all 2016 44

### FULL ###
#python jobify.py NoAnalyzer MuonPt2to8_PU0 MuonPt2to8_PU0 pdgid13 2016 53
#python jobify.py NoAnalyzer MuonPt2to8_PU200 MuonPt2to8_PU200 pdgid13 2016 554


# When the condor jobs are done, do this:
#python retrieve.py
