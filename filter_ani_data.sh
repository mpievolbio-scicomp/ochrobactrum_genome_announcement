#! /bin/bash
cat FastANI_Results.csv \
  | grep -v "CCUG33852" \
  | grep -v "BU72" \
  | grep -v "NV9" \
  | sed 's/IV11/MPB25535/g' \
  | sed 's/PH15/MPB25415/g' \
  | sed 's/PH4/MPB25440/g' \
  | sed 's/NH11/MPB25488/g' \
  | sed 's/NH1/MPB25478/g' \
  | sed 's/IV4/MPB25528/g' \
  | sed 's/PH5/MPB25441/g' \
  | sed 's/Pseudochrobactrum M/M/g' \
  | sed 's/O\.pituitosum M/M/g'  \
  | sed 's/O\.pituitosum/O.pit./g' \
  | sed 's/P\.saccharolyticum/P.sac./g' \
  > FastANI_Results_clean.csv
cat FastANI_Results_clean.csv
