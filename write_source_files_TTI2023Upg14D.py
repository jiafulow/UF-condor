#!/usr/bin/env python

import subprocess
from dbs.apis.dbsClient import *


dbsnames = """/ElectronGunFlatPt2to8/TTI2023Upg14D-DES23_62_V1-v2/GEN-SIM-DIGI-RAW
/ElectronGunFlatPt2to8/TTI2023Upg14D-PU140_DES23_62_V1-v1/GEN-SIM-DIGI-RAW
/ElectronGunFlatPt2to8/TTI2023Upg14D-PU200_DES23_62_V1-v1/GEN-SIM-DIGI-RAW
/ElectronGunFlatPt8to100/TTI2023Upg14D-DES23_62_V1-v2/GEN-SIM-DIGI-RAW
/ElectronGunFlatPt8to100/TTI2023Upg14D-PU140_DES23_62_V1-v1/GEN-SIM-DIGI-RAW
/ElectronGunFlatPt8to100/TTI2023Upg14D-PU200_DES23_62_V1-v1/GEN-SIM-DIGI-RAW
/MuGunFlatPt2to8/TTI2023Upg14D-DES23_62_V1-v2/GEN-SIM-DIGI-RAW
/MuGunFlatPt2to8/TTI2023Upg14D-FLATBS15PU200_FLATBS15_DES23_62_V1-v3/GEN-SIM-DIGI-RAW
/MuGunFlatPt2to8/TTI2023Upg14D-PU140_DES23_62_V1-v1/GEN-SIM-DIGI-RAW
/MuGunFlatPt2to8/TTI2023Upg14D-PU200_DES23_62_V1-v1/GEN-SIM-DIGI-RAW
/MuGunFlatPt8to100/TTI2023Upg14D-DES23_62_V1-v2/GEN-SIM-DIGI-RAW
/MuGunFlatPt8to100/TTI2023Upg14D-FLATBS15PU200_FLATBS15_DES23_62_V1-v3/GEN-SIM-DIGI-RAW
/MuGunFlatPt8to100/TTI2023Upg14D-PU140_DES23_62_V1-v1/GEN-SIM-DIGI-RAW
/MuGunFlatPt8to100/TTI2023Upg14D-PU200_DES23_62_V1-v1/GEN-SIM-DIGI-RAW
/PionGunFlatPt2to8/TTI2023Upg14D-DES23_62_V1-v2/GEN-SIM-DIGI-RAW
/PionGunFlatPt2to8/TTI2023Upg14D-PU140_DES23_62_V1-v1/GEN-SIM-DIGI-RAW
/PionGunFlatPt2to8/TTI2023Upg14D-PU200_DES23_62_V1-v1/GEN-SIM-DIGI-RAW
/PionGunFlatPt8to100/TTI2023Upg14D-DES23_62_V1-v2/GEN-SIM-DIGI-RAW
/PionGunFlatPt8to100/TTI2023Upg14D-PU140_DES23_62_V1-v1/GEN-SIM-DIGI-RAW
/PionGunFlatPt8to100/TTI2023Upg14D-PU200_DES23_62_V1-v1/GEN-SIM-DIGI-RAW
/PYTHIA6_Tauola_TTbar_TuneZ2star_14TeV/TTI2023Upg14D-CoolLoopPU200_CoolingDefect_DES23_62_V1-v1/GEN-SIM-DIGI-RAW
/PYTHIA6_Tauola_TTbar_TuneZ2star_14TeV/TTI2023Upg14D-DES23_62_V1-v1/GEN-SIM-DIGI-RAW
/PYTHIA6_Tauola_TTbar_TuneZ2star_14TeV/TTI2023Upg14D-PU140_DES23_62_V1-v1/GEN-SIM-DIGI-RAW
/PYTHIA6_Tauola_TTbar_TuneZ2star_14TeV/TTI2023Upg14D-PU200_DES23_62_V1-v1/GEN-SIM-DIGI-RAW"""
dbsnames = dbsnames.split()

names = [
"ElectronPt2to8_PU0",
"ElectronPt2to8_PU140",
"ElectronPt2to8_PU200",
"ElectronPt8to100_PU0",
"ElectronPt8to100_PU140",
"ElectronPt8to100_PU200",
"MuonPt2to8_PU0",
"MuonPt2to8_FLATBS15PU200",
"MuonPt2to8_PU140",
"MuonPt2to8_PU200",
"MuonPt8to100_PU0",
"MuonPt8to100_FLATBS15PU200",
"MuonPt8to100_PU140",
"MuonPt8to100_PU200",
"PionPt2to8_PU0",
"PionPt2to8_PU140",
"PionPt2to8_PU200",
"PionPt8to100_PU0",
"PionPt8to100_PU140",
"PionPt8to100_PU200",
"TTbar_CoolLoopPU200",
"TTbar_PU0",
"TTbar_PU140",
"TTbar_PU200",
]
assert(len(names) == len(dbsnames))
assert(len(names) == 26-2)

def get_emyr_names_fun(sample, ptRange, pdgid):
  # Use this for user specific label at the end of the filename
  userLabel = ""

  # Labels for input files
  PUtypes = ["0","140","200"]
  ptRangeTypes = {
    0 : "",
    'L' : "Pt2to8",
    'H' : "Pt8to100",
  }
  pdgIdTypes = {
    0 : "",
    1 : "injet",
    2 : "injet_highpt",
    13 : "pdgid13",
    11 : "pdgid11",
    211 : "pdgid211",
  }

  # Make list of input trees
  inputFileNames = [];
  # inputFileNameTemplate = "output_Hist_{sample}_{PU}{ptRange}{pdg}_{trunc}Truncation{userLabel}.root"
  inputFileNameTemplate = "output_{sample}{ptRange}_PU{PU}_{trunc}Truncation_{pdg}{userLabel}.root"
  inputFileNames.append( inputFileNameTemplate.format(sample = sample, PU = PUtypes[0], ptRange=ptRangeTypes[ptRange], pdg=pdgIdTypes[pdgid], trunc = 'With', userLabel=userLabel ) )
  inputFileNames.append( inputFileNameTemplate.format(sample = sample, PU = PUtypes[1], ptRange=ptRangeTypes[ptRange], pdg=pdgIdTypes[pdgid], trunc = 'With', userLabel=userLabel ) )
  inputFileNames.append( inputFileNameTemplate.format(sample = sample, PU = PUtypes[2], ptRange=ptRangeTypes[ptRange], pdg=pdgIdTypes[pdgid], trunc = 'With', userLabel=userLabel ) )
  inputFileNames.append( inputFileNameTemplate.format(sample = sample, PU = PUtypes[0], ptRange=ptRangeTypes[ptRange], pdg=pdgIdTypes[pdgid], trunc = 'Without', userLabel=userLabel ) )
  inputFileNames.append( inputFileNameTemplate.format(sample = sample, PU = PUtypes[1], ptRange=ptRangeTypes[ptRange], pdg=pdgIdTypes[pdgid], trunc = 'Without', userLabel=userLabel ) )
  inputFileNames.append( inputFileNameTemplate.format(sample = sample, PU = PUtypes[2], ptRange=ptRangeTypes[ptRange], pdg=pdgIdTypes[pdgid], trunc = 'Without', userLabel=userLabel ) )
  return inputFileNames

def get_emyr_names():
  samplePdg = [
    ('Muon', 13),
    ('Electron', 11),
    ('Pion', 211),
  ]
  for sample, pdg in samplePdg:
    for ptRange in ['L','H']:
      names = get_emyr_names_fun(sample, ptRange, pdg)
      for name in names:
        print name

  samplePdg = [
    ('TTbar', 1),
    ('TTbar', 2),
    ('TTbar', 13),
  ]
  for sample, pdg in samplePdg:
    for ptRange in [0,]:
      names = get_emyr_names_fun(sample, ptRange, pdg)
      for name in names:
        print name

#get_emyr_names()

def check_names():
  for name, dbsname in zip(names, dbsnames):
    print "%-30s %s" % (name, dbsname)

check_names()

def write_source_files():

  directory = "sourceFiles/"

  for name, dbsname in zip(names, dbsnames):
    #if name != "TTbar_PU0":  continue  # test

    api=DbsApi(url='https://cmsweb.cern.ch/dbs/prod/global/DBSReader')
    output = api.listFiles(dataset=dbsname, validFileOnly=0, detail=1)
    #print len(output), type(output), output[0], type(output[0])
    output2 = [out['logical_file_name'] for out in output if out['is_file_valid']]
    filename = "%s/%s.txt" % (directory, name)
    print "Writing %s ..." % filename
    with open(filename, 'w') as outfile:
      for out2 in output2:
        outfile.write(out2+'\n')

    filename = "%s/%s_part.txt" % (directory, name)
    print "Writing %s ..." % filename
    with open(filename, 'w') as outfile:
      for out2 in output2[:100]:
        outfile.write(out2+'\n')

write_source_files()
