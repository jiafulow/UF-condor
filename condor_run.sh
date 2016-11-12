#!/bin/bash

startup() {
source /cvmfs/cms.cern.ch/cmsset_default.sh
export SCRAM_ARCH=slc6_amd64_gcc472
export CMSSW_VERSION=CMSSW_6_2_0_SLHC28_patch1
}

project() {
scramv1 project CMSSW $CMSSW_VERSION
cd $CMSSW_VERSION
eval `scramv1 runtime -sh`
tar xzf ../default.tgz
cd -
}

run() {
amsim -C -i input_SingleMuon_oc_tt25.txt -o stubs_oc_tt25_400M.root -v 2 -n 400000000 >& stubs_oc_tt25_400M.log
}

cleanup() {
ls -Al
}


echo "Job submitted on host `hostname` on `date`"
echo "System `uname -a`"

echo "startup ..."
startup

echo "project ..."
project

echo "run ..."
run

echo "cleanup ..."
cleanup

echo "Job finished on host `hostname` on `date`"
