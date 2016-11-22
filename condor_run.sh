#!/bin/bash

jobid=$1

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

#run() {
## [REQUIRE] Transfer_Input_Files    = default.tgz, input/input_SingleMuon_oc_tt25_1.txt, input/input_SingleMuon_oc_tt25_2.txt
#amsim -C -i input_SingleMuon_oc_tt25_${jobid}.txt -o stubs_oc_tt25_200M_${jobid}.root -v 2 -n 200000000 >& stubs_oc_tt25_200M_${jobid}.log
#}

run() {
# [REQUIRE] Transfer_Input_Files    = default.tgz, bank/patternBank_oc_tt25_sf1_nz8_pt3_400M.txt
amsim -P -i patternBank_oc_tt25_sf1_nz8_pt3_400M.txt -o m8_patternBank_oc_tt25_sf1_nz8_pt3_400M.root -v 2 >& m8_patternBank_oc_tt25_sf1_nz8_pt3_400M.log
}

cleanup() {
ls -Al
}


echo "Job submitted on host `hostname` on `date`"
echo "System `uname -a`"
echo ">>> arguments: $@"

echo "startup ..."
startup

echo "project ..."
project

echo "run ..."
run

echo "cleanup ..."
cleanup

echo "Job finished on host `hostname` on `date`"
