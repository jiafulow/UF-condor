jobid=1
amsim -C -i input_SingleMuon_oc_tt25_${jobid}.txt -o stubs_oc_tt25_200M_${jobid}.root -v 2 -n 200000000 >& stubs_oc_tt25_200M_${jobid}.log

amsim -B -i input/stubs_oc_tt25_400M.txt -o patternBank_oc_tt25_sf1_nz8_pt3_400M.root -v 2 -s sf1_nz8 --minPt 3 >& patternBank_oc_tt25_sf1_nz8_pt3_400M.log

amsim -R -i input/input_TTbar_PU140.txt -b bank/patternBank_oc_tt25_sf1_nz8_pt3_400M.txt -o roads_TTbar_PU140.root -v 2 -s sf1_nz8 -n 30000 >& roads_TTbar_PU140.log

amsim -R -i input/input_TTbar_PU200.txt -b bank/patternBank_oc_tt25_sf1_nz8_pt3_400M.txt -o roads_TTbar_PU200.root -v 2 -s sf1_nz8 -n 30000 >& roads_TTbar_PU200.log
