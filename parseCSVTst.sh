#!/bin/bash
## Vars Definition for  this Script 
DB_USER=root
DB_PASSWD=admin89!
DB_NAME=typo3local
DB_TABLE=tx_clinica_domain_model_patient
#echo -e $DB_NAME
#echo -e $DB_TABLE
# /home/thodoris/Desktop/StartUPScripts/SQLParse/insertPatients.csv
Ptn=$'\r\n'  command eval  'pstcsv=($(cat ~/StartUPScripts/SQLParse/insertPatients.csv))'
PtnData=$'\r\n'  command eval  'pstdatacsv=($(cat ~/StartUPScripts/SQLParse/insert_ptnformdata.csv))'
# echo "${csv[0]}"
len=${#pstcsv[@]}
#echo  "Patient Count " $len

# CONST_A=`cat ~/StartUPScripts/SQLParse/insert_ptnformdata.csv | awk -F", *" '$3 == 3' | cut -d "," -f1`
# IFS=', ' read -r -a array <<< "$CONST_A"

 test="$(cut -d',' -f3 | awk -F", *" '$3 == 3'  <<<"${pstcsv[1]}")" 
 echo $test
for (( i=0; i < $len; i++ )); do 
 ptnclnA="$(cut -d',' -f1 <<<"${pstcsv[$i]}")"
 echo PatientNum $ptnclnA
 #echo $i
    #awk -F , '$3 = $i { print } '  ~/StartUPScripts/SQLParse/insert_ptnformdata.csv
#  awk -F"," '$3=$ptnclnA {print}' ~/StartUPScripts/SQLParse/insert_ptnformdata.csv 
#  unqPtnDatacnt=${#pstdatacsv[@]}
#     echo $unqPtnDatacnt
#     for (( i=0; i<$unqPtnDatacnt; i++ )); do
    
#         test="$(cut -d',' -f1 <<<"${pstcsv[$i]}")"
#         test3="$(cut -d',' -f3  <<<"${pstdatacsv[$i]}")"
#        echo $test3
#        if [[ $test3 == $ptnclnA ]];then 
           
#            echo $pstdatacsv[$i]

#        fi 
#     done

    
done

#awk -F, '!dup[$3]++' ~/StartUPScripts/SQLParse/insert_ptnformdata.csv




    



## get length of $csv array
#len=${#pstcsv[@]}
# len=1
# # echo $len
# ## Use bash for loop 
# for (( i=0; i<$len; i++ )); do 
# # echo "${csv[$i]}" 
# ptnclnA="$(cut -d',' -f1 <<<"${pstcsv[$i]}")"
# ptnclnB="$(cut -d',' -f2 <<<"${pstcsv[$i]}")"
# ptnclnC="$(cut -d',' -f3 <<<"${pstcsv[$i]}")"
# ptnclnD="$(cut -d',' -f4 <<<"${pstcsv[$i]}")"
# ptnclnE="$(cut -d',' -f5 <<<"${pstcsv[$i]}")"
# ptnclnF="$(cut -d',' -f6 <<<"${pstcsv[$i]}")"
# ptnclnG="$(cut -d',' -f7 <<<"${pstcsv[$i]}")"
# ptnclnH="$(cut -d',' -f8 <<<"${pstcsv[$i]}")"
# ptnclnI="$(cut -d',' -f9 <<<"${pstcsv[$i]}")"
# ptnclnJ="$(cut -d',' -f10 <<<"${pstcsv[$i]}")"
# ##############################################
# #  echo -e "$ptnclnA" 
# #  echo -e "$ptnclnB" 
# #  echo -e "$ptnclnC" 
# #  echo -e "$ptnclnD" 
# #  echo -e "$ptnclnE"
# #  echo -e "$ptnclnF" 
# #  echo -e "$ptnclnG" 
# #  echo -e "$ptnclnH" 
# #  echo -e "$ptnclnI" 
# #  echo -e "$ptnclnG" 
# ###############################################
# echo -e "-------##################----------------"
# ptndataclnA="$(cut -d',' -f1 <<<"${pstdatacsv[$i]}")"
# ptndataclnB="$(cut -d',' -f2 <<<"${pstdatacsv[$i]}")"
# ptndataclnC="$(cut -d',' -f3 <<<"${pstdatacsv[$i]}")"
# ptndataclnD="$(cut -d',' -f4 <<<"${pstdatacsv[$i]}")"
# ptndataclnE="$(cut -d',' -f5 <<<"${pstdatacsv[$i]}")"
# ptndataclnF="$(cut -d',' -f6 <<<"${pstdatacsv[$i]}")"
# ptndataclnG="$(cut -d',' -f7 <<<"${pstdatacsv[$i]}")"
# ptndataclnH="$(cut -d',' -f8 <<<"${pstdatacsv[$i]}")"
# ptndataclnI="$(cut -d',' -f9 <<<"${pstdatacsv[$i]}")"
# ptndataclnJ="$(cut -d',' -f10 <<<"${pstdatacsv[$i]}")"
# ptndataclnK="$(cut -d',' -f11 <<<"${pstdatacsv[$i]}")"
# ptndataclnL="$(cut -d',' -f12 <<<"${pstdatacsv[$i]}")"
# ptndataclnM="$(cut -d',' -f13 <<<"${pstdatacsv[$i]}")"
# ptndataclnN="$(cut -d',' -f14 <<<"${pstdatacsv[$i]}")"
# ptndataclnO="$(cut -d',' -f15 <<<"${pstdatacsv[$i]}")"
# echo -e "-------##################----------------"
# echo -e "-----#############-----" 
# echo -e "Now I am Inserting in Patients Table each row of CSV!!!" 
# echo -e "-----#############-----" 
#  mysql --user=$DB_USER --password=$DB_PASSWD $DB_NAME << EOF
# --########### Patient Table Loading###################
#  SET @ptnclnA='${ptnclnA}';
#  SET @ptnclnB='${ptnclnB}';
#  SET @ptnclnC='${ptnclnC}';
#  SET @ptnclnD='${ptnclnD}';
#  SET @ptnclnE='${ptnclnE}';
#  SET @ptnclnF='${ptnclnF}';
#  SET @ptnclnG='${ptnclnG}';
#  SET @ptnclnH='${ptnclnH}';
#  SET @ptnclnI='${ptnclnI}';
#  SET @ptnclnJ='${ptnclnJ}';
#  select @ptnclnA;
#  select @ptnclnB;
#  select @ptnclnC;
#  select @ptnclnD;
#  select @ptnclnE;
#  select @ptnclnF;
#  select @ptnclnG;
#  select @ptnclnH;
#  select @ptnclnI;
#  select @ptnclnJ; 

#  --########### Patient Form Data Loading###################
#  SET @ptndataclnA='${ptndataclnA}';
#  SET @ptndataclnB='${ptndataclnB}';
#  SET @ptndataclnC='${ptndataclnC}';
#  SET @ptndataclnD='${ptndataclnD}';
#  SET @ptndataclnE='${ptndataclnE}';
#  SET @ptndataclnF='${ptndataclnF}';
#  SET @ptndataclnG='${ptndataclnG}';
#  SET @ptndataclnH='${ptndataclnH}';
#  SET @ptndataclnJ='${ptndataclnJ}';
#  SET @ptndataclnK='${ptndataclnK}';
#  SET @ptndataclnL='${ptndataclnL}';
#  SET @ptndataclnM='${ptndataclnM}';
#  SET @ptndataclnN='${ptndataclnN}';
#  SET @ptndataclnO='${ptndataclnO}';
#  select @ptndataclnA;
#  select @ptndataclnB;
#  select @ptndataclnC;
#  select @ptndataclnD;
#  select @ptndataclnE;
#  select @ptndataclnF;
#  select @ptndataclnG;
#  select @ptndataclnH;
#  select @ptndataclnJ;
#  select @ptndataclnK; 
#  select @ptndataclnL; 
#  select @ptndataclnM; 
#  select @ptndataclnN; 
#  select @ptndataclnO; 

# --INSERT INTO typo3local.tx_clinica_domain_model_patient (uid, pid, center, group_type, tstamp, crdate, cruser_id, patient_code, status, treatment) VALUES (NULL, @ptnclnB, @ptnclnC, @ptnclnD, @ptnclnE, @ptnclnF, @ptnclnG, @ptnclnH, @ptnclnI, @ptnclnJ );
# EOF
# done
