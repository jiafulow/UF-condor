#!/bin/bash

# never run the whole thing!
exit 0;

jobid=1
amsim -C -i input/input_SingleMuon_oc_tt25_${jobid}.txt -o stubs_oc_tt25_200M_${jobid}.root -v 2 -n 200000000 >& stubs_oc_tt25_200M_${jobid}.log &
jobid=2
amsim -C -i input/input_SingleMuon_oc_tt25_${jobid}.txt -o stubs_oc_tt25_200M_${jobid}.root -v 2 -n 200000000 >& stubs_oc_tt25_200M_${jobid}.log &

amsim -B -i input/stubs_oc_tt25_400M.txt -o patternBank_oc_tt25_sf1_nz8_pt3_400M.root -v 2 -s sf1_nz8 --minPt 3 >& patternBank_oc_tt25_sf1_nz8_pt3_400M.log &
amsim -B -i input/stubs_oc_tt25_pt2_400M.txt -o patternBank_oc_tt25_sf1_nz8_pt2_400M.root -v 2 -s sf1_nz8 --minPt 2 >& patternBank_oc_tt25_sf1_nz8_pt2_400M.log &

amsim -P -i bank/patternBank_oc_tt25_sf1_nz8_pt3_400M.txt -o m8_patternBank_oc_tt25_sf1_nz8_pt3_400M.root -v 2 >& m8_patternBank_oc_tt25_sf1_nz8_pt3_400M.log &
amsim -P -i bank/patternBank_oc_tt25_sf1_nz8_pt2_400M.txt -o m8_patternBank_oc_tt25_sf1_nz8_pt2_400M.root -v 2 >& m8_patternBank_oc_tt25_sf1_nz8_pt2_400M.log &

amsim -R -i input/input_SingleMuonTest_PU0.txt -b bank/patternBank_oc_tt25_sf1_nz8_pt3_400M.txt -o roads_SingleMuonTest_PU0.root -v 2 -s sf1_nz8 -n 100000 >& roads_SingleMuonTest_PU0.log &
amsim -R -i input/input_SinglePionTest_PU0.txt -b bank/patternBank_oc_tt25_sf1_nz8_pt3_400M.txt -o roads_SinglePionTest_PU0.root -v 2 -s sf1_nz8 -n 100000 >& roads_SinglePionTest_PU0.log &
amsim -R -i input/input_SingleElecTest_PU0.txt -b bank/patternBank_oc_tt25_sf1_nz8_pt3_400M.txt -o roads_SingleElecTest_PU0.root -v 2 -s sf1_nz8 -n 100000 >& roads_SingleElecTest_PU0.log &
amsim -R -i input/input_TTbar_PU0.txt   -b bank/patternBank_oc_tt25_sf1_nz8_pt3_400M.txt -o roads_TTbar_PU0.root   -v 2 -s sf1_nz8 -n 30000 >& roads_TTbar_PU0.log   &
amsim -R -i input/input_TTbar_PU140.txt -b bank/patternBank_oc_tt25_sf1_nz8_pt3_400M.txt -o roads_TTbar_PU140.root -v 2 -s sf1_nz8 -n 30000 >& roads_TTbar_PU140.log &
amsim -R -i input/input_TTbar_PU200.txt -b bank/patternBank_oc_tt25_sf1_nz8_pt3_400M.txt -o roads_TTbar_PU200.root -v 2 -s sf1_nz8 -n 30000 >& roads_TTbar_PU200.log &
amsim -R -i input/input_TTbar_oc_tt25_PU0.txt   -b bank/patternBank_oc_tt25_sf1_nz8_pt3_400M.txt -o roads_TTbar_oc_tt25_PU0.root   -v 2 -s sf1_nz8 -n 100000 >& roads_TTbar_oc_tt25_PU0.log   &
amsim -R -i input/input_TTbar_oc_tt25_PU140.txt -b bank/patternBank_oc_tt25_sf1_nz8_pt3_400M.txt -o roads_TTbar_oc_tt25_PU140.root -v 2 -s sf1_nz8 -n 100000 >& roads_TTbar_oc_tt25_PU140.log &
amsim -R -i input/input_TTbar_oc_tt25_PU200.txt -b bank/patternBank_oc_tt25_sf1_nz8_pt3_400M.txt -o roads_TTbar_oc_tt25_PU200.root -v 2 -s sf1_nz8 -n 100000 >& roads_TTbar_oc_tt25_PU200.log &

amsim -Q -i output/roads_SingleMuonTest_PU0.txt -b bank/m8_patternBank_oc_tt25_sf1_nz8_pt3_400M.txt -o m8_roads_SingleMuonTest_PU0.root -v 2 >& m8_roads_SingleMuonTest_PU0.log &
amsim -Q -i output/roads_SinglePionTest_PU0.txt -b bank/m8_patternBank_oc_tt25_sf1_nz8_pt3_400M.txt -o m8_roads_SinglePionTest_PU0.root -v 2 >& m8_roads_SinglePionTest_PU0.log &
amsim -Q -i output/roads_SingleElecTest_PU0.txt -b bank/m8_patternBank_oc_tt25_sf1_nz8_pt3_400M.txt -o m8_roads_SingleElecTest_PU0.root -v 2 >& m8_roads_SingleElecTest_PU0.log &
amsim -Q -i output/roads_TTbar_PU0.txt   -b bank/m8_patternBank_oc_tt25_sf1_nz8_pt3_400M.txt -o m8_roads_TTbar_PU0.root   -v 2 >& m8_roads_TTbar_PU0.log   &
amsim -Q -i output/roads_TTbar_PU140.txt -b bank/m8_patternBank_oc_tt25_sf1_nz8_pt3_400M.txt -o m8_roads_TTbar_PU140.root -v 2 >& m8_roads_TTbar_PU140.log &
amsim -Q -i output/roads_TTbar_PU200.txt -b bank/m8_patternBank_oc_tt25_sf1_nz8_pt3_400M.txt -o m8_roads_TTbar_PU200.root -v 2 >& m8_roads_TTbar_PU200.log &
amsim -Q -i output/roads_TTbar_oc_tt25_PU0.txt   -b bank/m8_patternBank_oc_tt25_sf1_nz8_pt3_400M.txt -o m8_roads_TTbar_oc_tt25_PU0.root   -v 2 >& m8_roads_TTbar_oc_tt25_PU0.log   &
amsim -Q -i output/roads_TTbar_oc_tt25_PU140.txt -b bank/m8_patternBank_oc_tt25_sf1_nz8_pt3_400M.txt -o m8_roads_TTbar_oc_tt25_PU140.root -v 2 >& m8_roads_TTbar_oc_tt25_PU140.log &
amsim -Q -i output/roads_TTbar_oc_tt25_PU200.txt -b bank/m8_patternBank_oc_tt25_sf1_nz8_pt3_400M.txt -o m8_roads_TTbar_oc_tt25_PU200.root -v 2 >& m8_roads_TTbar_oc_tt25_PU200.log &

amsim -T -i output/roads_SingleMuonTest_PU0.txt -o tracks_SingleMuonTest_PU0.root -v 2 --maxPatterns 5532635 >& tracks_SingleMuonTest_PU0.log &
amsim -T -i output/roads_SinglePionTest_PU0.txt -o tracks_SinglePionTest_PU0.root -v 2 --maxPatterns 5532635 >& tracks_SinglePionTest_PU0.log &
amsim -T -i output/roads_SingleElecTest_PU0.txt -o tracks_SingleElecTest_PU0.root -v 2 --maxPatterns 5532635 >& tracks_SingleElecTest_PU0.log &
amsim -T -i output/roads_TTbar_PU0.txt   -o tracks_TTbar_PU0.root   -v 2 --maxPatterns 5532635 >& tracks_TTbar_PU0.log   &
amsim -T -i output/roads_TTbar_PU140.txt -o tracks_TTbar_PU140.root -v 2 --maxPatterns 5532635 >& tracks_TTbar_PU140.log &
amsim -T -i output/roads_TTbar_PU200.txt -o tracks_TTbar_PU200.root -v 2 --maxPatterns 5532635 >& tracks_TTbar_PU200.log &
amsim -T -i output/roads_TTbar_oc_tt25_PU0.txt   -o tracks_TTbar_oc_tt25_PU0.root   -v 2 --maxPatterns 5532635 >& tracks_TTbar_oc_tt25_PU0.log   &
amsim -T -i output/roads_TTbar_oc_tt25_PU140.txt -o tracks_TTbar_oc_tt25_PU140.root -v 2 --maxPatterns 5532635 >& tracks_TTbar_oc_tt25_PU140.log &
amsim -T -i output/roads_TTbar_oc_tt25_PU200.txt -o tracks_TTbar_oc_tt25_PU200.root -v 2 --maxPatterns 5532635 >& tracks_TTbar_oc_tt25_PU200.log &

amsim -T -i output/m8_roads_SingleMuonTest_PU0.txt -o m8_tracks_SingleMuonTest_PU0.root -v 2 --maxPatterns 1129402 >& m8_tracks_SingleMuonTest_PU0.log &
amsim -T -i output/m8_roads_SinglePionTest_PU0.txt -o m8_tracks_SinglePionTest_PU0.root -v 2 --maxPatterns 1129402 >& m8_tracks_SinglePionTest_PU0.log &
amsim -T -i output/m8_roads_SingleElecTest_PU0.txt -o m8_tracks_SingleElecTest_PU0.root -v 2 --maxPatterns 1129402 >& m8_tracks_SingleElecTest_PU0.log &
amsim -T -i output/m8_roads_TTbar_PU0.txt   -o m8_tracks_TTbar_PU0.root   -v 2 --maxPatterns 1129402 >& m8_tracks_TTbar_PU0.log   &
amsim -T -i output/m8_roads_TTbar_PU140.txt -o m8_tracks_TTbar_PU140.root -v 2 --maxPatterns 1129402 >& m8_tracks_TTbar_PU140.log &
amsim -T -i output/m8_roads_TTbar_PU200.txt -o m8_tracks_TTbar_PU200.root -v 2 --maxPatterns 1129402 >& m8_tracks_TTbar_PU200.log &
amsim -T -i output/m8_roads_TTbar_oc_tt25_PU0.txt   -o m8_tracks_TTbar_oc_tt25_PU0.root   -v 2 --maxPatterns 1129402 >& m8_tracks_TTbar_oc_tt25_PU0.log   &
amsim -T -i output/m8_roads_TTbar_oc_tt25_PU140.txt -o m8_tracks_TTbar_oc_tt25_PU140.root -v 2 --maxPatterns 1129402 >& m8_tracks_TTbar_oc_tt25_PU140.log &
amsim -T -i output/m8_roads_TTbar_oc_tt25_PU200.txt -o m8_tracks_TTbar_oc_tt25_PU200.root -v 2 --maxPatterns 1129402 >& m8_tracks_TTbar_oc_tt25_PU200.log &
