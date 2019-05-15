#!/bin/bash
## Vars Definition for  this Script 
DB_USER=root
DB_PASSWD=admin89!
DB_NAME=emn23_demo
echo -e $DB_NAME
echo -e $DB_TABLE
#Ptn=$'\r\n'  command eval  'pstcsv=($(cat ~/StartUPScripts/SQLParse/insertPatients.csv))'
#awk -F ',' '{gsub("2","3",$1); print}' OFS="," ./insertPatient2.csv > ptn_3.csv

len=$1
cntr=$2
# echo $len
## Use bash for loop 
for (( i=1; i<=$len; i++ )); do 
echo -e "Now I am Parsing the following files loadpatientData && loaddata_studystatus!!!" 
echo -e "-----#############-----" 
tms=$i;
##########################################################-Edit FormData####

awk -v ptnID=$tms -F ',' '{gsub(2,ptnID,$3); print}' OFS="," ./loadpatientData.sql > /tmp/loadpatientData1_$tms.sql
awk  -F ',' '{gsub(/[0-9][0-9]/,"'"'NULL'"'",$1); print }' OFS=","   /tmp/loadpatientData1_$tms.sql > /tmp/loadpatientData2_$tms.sql
awk  -F ',' '{gsub(/[0-9][0-9][0-9]/,"'"'NULL'"'",$1); print }' OFS=","  /tmp/loadpatientData2_$tms.sql > /tmp/loadpatientData3_$tms.sql
#awk  -F ',' '{gsub(/[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]/,"'"'NULL'"'",$12); print }' OFS=","  /tmp/loadpatientData3_$tms.sql > /tmp/loadpatientData4_$tms.sql
#awk  -F ',' '{gsub(/[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]/,"'"'NULL'"'",$13); print }' OFS=","  /tmp/loadpatientData4_$tms.sql > /tmp/loadpatientData5_$tms.sql
#awk  -F ',' '{gsub("NULL","'"'NULL'"'",$16); print }' OFS=","  /tmp/loadpatientData5_$tms.sql > /tmp/loadpatientData6_$tms.sql

####-CleanUp Unnecessary Files -Edit FormData
rm -f /tmp/loadpatientData{1,2}_$tms.sql
echo -e "-----End of parsing 1 file the Reult is /tmp/loadpatientData5_$tms.sql -----"  
##########################################################-Endof  FormData
##########################################################-Edit Parsing  StudyStatus####

awk  -F ',' '{gsub(/[0-9]/,"'"'NULL'"'",$1); print }' OFS=","   ./loaddata_studystatus.sql > /tmp/loaddata_studystatus1_$tms.sql
awk  -F ',' '{gsub(/[0-9][0-9][0-9]/,"'"'NULL'"'",$1); print }' OFS=","  /tmp/loaddata_studystatus1_$tms.sql > /tmp/loaddata_studystatus2_$tms.sql
awk  -F ',' '{gsub(/[0-9]/,"2",$8); print }' OFS=","  /tmp/loaddata_studystatus2_$tms.sql > /tmp/loaddata_studystatus3_$tms.sql
awk -v ptnID=$tms -F ',' '{gsub("2",ptnID,$13); print }' OFS=","  /tmp/loaddata_studystatus3_$tms.sql > /tmp/loaddata_studystatus4_$tms.sql
awk  -F ',' '{gsub(/[0-9]/,"0",$17); print }' OFS=","  /tmp/loaddata_studystatus4_$tms.sql > /tmp/loaddata_studystatus5_$tms.sql
awk  -F ',' '{gsub(/[0-9]/,"0",$18); print }' OFS=","  /tmp/loaddata_studystatus5_$tms.sql > /tmp/loaddata_studystatus6_$tms.sql
awk  -F ',' '{gsub(/[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]/,"'"'NULL'"'",$9); print }' OFS=","  /tmp/loaddata_studystatus6_$tms.sql > /tmp/loaddata_studystatus7_$tms.sql
awk  -F ',' '{gsub(/[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]/,"'"'NULL'"'",$10); print }' OFS=","  /tmp/loaddata_studystatus7_$tms.sql > /tmp/loaddata_studystatus8_$tms.sql
awk -v cntrID=$cntr -F ',' '{gsub(/0-9/,cntrID,$16); print }' OFS=","  /tmp/loaddata_studystatus8_$tms.sql > /tmp/loaddata_studystatus9_$tms.sql

####-CleanUp Unnecessary Files -Edit StudyStatus
rm -f /tmp/loaddata_studystatus{1,2,3,4,5,6,7,8}_$tms.sql

echo -e "-----End of parsing 2 file the Reult is /tmp/loaddata_studystatus9_$tms.sql-----"  
##########################################################-Endof Parsing StudyStatus

##########################################################-Edit Parsing  Requests####

awk  -F ',' '{gsub(/[0-9]/,"'"'NULL'"'",$1); print }' OFS=","   ./loaddata_mgrrequest.sql > /tmp/loaddata_mgrrequest1_$tms.sql
awk -v ptnID=$tms -F ',' '{gsub(/[0-9]/,ptnID,$7); print }' OFS=","  /tmp/loaddata_mgrrequest1_$tms.sql > /tmp/loaddata_mgrrequest2_$tms.sql


# awk  -F ',' '{gsub(/[0-9]/,"'"'NULL'"'",$1); print }' OFS=","   ./loaddata_mgrrequest.sql > /tmp/loaddata_mgrrequest1_$tms.sql
# awk -F ',' '{gsub(/[0-9]/,"1",$6); print }' OFS=","  /tmp/loaddata_mgrrequest1_$tms.sql > /tmp/loaddata_mgrrequest2_$tms.sql
# awk -v ptnID=$tms -F ',' '{gsub(/[0-9]/,ptnID,$7); print }' OFS=","  /tmp/loaddata_mgrrequest2_$tms.sql > /tmp/loaddata_mgrrequest3_$tms.sql
# awk  -F ',' '{gsub(/[0-9]/,"1",$18); print }' OFS=","  /tmp/loaddata_mgrrequest3_$tms.sql > /tmp/loaddata_mgrrequest4_$tms.sql
# awk  -F ',' '{gsub(/[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]/,"'"'NULL'"'",$19); print }' OFS=","  /tmp/loaddata_mgrrequest4_$tms.sql > /tmp/loaddata_mgrrequest5_$tms.sql
# awk  -F ',' '{gsub(/[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]/,"'"'NULL'"'",$20); print }' OFS=","  /tmp/loaddata_mgrrequest5_$tms.sql > /tmp/loaddata_mgrrequest6_$tms.sql

####-CleanUp Unnecessary Files -Edit mgrrequests
rm -f /tmp/loaddata_mgrrequest{1}_$tms.sql

echo -e "-----End of parsing 2 file the Reult is /tmp/loaddata_mgrrequest2__$tms.sql-----"  
##########################################################-Endof Parsing Requests



##########################################################-Edit Parsing  Messages####
 awk  -F ',' '{gsub(/[0-9]/,"'"'NULL'"'",$1); print }' OFS=","   ./loaddata_mgrmessage.sql > /tmp/loaddata_mgrmessage1_$tms.sql

# awk  -F ',' '{gsub(/[0-9]/,"'"'NULL'"'",$1); print }' OFS=","   ./loaddata_mgrmessage.sql > /tmp/loaddata_mgrmessage1_$tms.sql
# awk  -v ptnID=$tms  -F ',' '{gsub(/[0-9]/,ptnID,$3); print }' OFS=","  /tmp/loaddata_mgrmessage1_$tms.sql > /tmp/loaddata_mgrmessage2_$tms.sql
# awk  -F ',' '{gsub(/[0-9]/,"1",$6); print }' OFS=","  /tmp/loaddata_mgrmessage2_$tms.sql > /tmp/loaddata_mgrmessage3_$tms.sql
# awk   -F ',' '{gsub(/[0-9]/,"1",$13); print }' OFS=","  /tmp/loaddata_mgrmessage3_$tms.sql > /tmp/loaddata_mgrmessage4_$tms.sql
# awk  -F ',' '{gsub(/[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]/,"'"'NULL'"'",$7); print }' OFS=","  /tmp/loaddata_mgrmessage4_$tms.sql > /tmp/loaddata_mgrmessage5_$tms.sql
# awk  -F ',' '{gsub(/[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]/,"'"'NULL'"'",$8); print }' OFS=","  /tmp/loaddata_mgrmessage5_$tms.sql > /tmp/loaddata_mgrmessage6_$tms.sql
# awk  -F ',' '{gsub(/[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]/,"'"'NULL'"'",$9); print }' OFS=","  /tmp/loaddata_mgrmessage6_$tms.sql > /tmp/loaddata_mgrmessage7_$tms.sql
####-CleanUp Unnecessary Files -Edit mgrrequests
# rm -f /tmp/loaddata_mgrmessage{1,2,3,4,5,6}_$tms.sql

echo -e "-----End of parsing 2 file the Reult is /tmp/loaddata_mgrmessage7__$tms.sql-----"  
##########################################################-Endof Parsing Messages


echo -e "-----Start of Creating New patient-----"
##########################################################-Insert In Patient Table
echo -e "-----Start of Insert in Patients Table for  New patient-----"
respid=${#tms};

if [ $respid = 1 ]; then 
pid="5599100"${tms}
echo $pid
elif [ $respid = 2 ]; then 
pid="559910"${tms}
echo $pid
else
pid="55991"${tms}
echo $pid
fi

mysql --user=$DB_USER --password=$DB_PASSWD $DB_NAME << EOF
SET @tms='${tms}';
SET @cntr='${cntr}';
--SET @ptncode=CONCAT('5599100', @tms);
SET @ptncode='${pid}';
SELECT @ptncode;
INSERT INTO tx_clinica_domain_model_patient (uid, pid, center, group_type, tstamp, crdate, cruser_id, patient_code, status, treatment) VALUES (@tms, 21, , @cntr, 1554973644, 0, 0, @ptncode, 4, 0);
EOF
##########################################################-Insert In Form Data  
echo -e "-----Start of Insert Data in Form Data  Table for  New patient-----"
mysql --user=$DB_USER --password=$DB_PASSWD --default_character_set utf8 $DB_NAME < /tmp/loadpatientData3_$tms.sql
##########################################################-Update Center Count 
echo -e "----Update Center table with the sum of Patients -----"
mysql --user=$DB_USER --password=$DB_PASSWD $DB_NAME << EOF 
SET @cntr='${cntr}';
SET @cptncount := (select patients from tx_clinica_domain_model_center where uid = @cntr);
--select @cptncount;
SET @ecptncount:= @cptncount + 1;
--select @ecptncount;
UPDATE tx_clinica_domain_model_center SET patients = @ecptncount WHERE uid =  @cntr;
EOF
##########################################################-Insert In Study Status 
echo -e "---Start of Insert Data in Study Status for  New patient------"
mysql --user=$DB_USER --password=$DB_PASSWD $DB_NAME < /tmp/loaddata_studystatus9_$tms.sql

##########################################################-Insert In mgrrequest
echo -e "---Start of Insert Data in  mgrrequest for  New patient------"
mysql --user=$DB_USER --password=$DB_PASSWD $DB_NAME < /tmp/loaddata_mgrrequest2_$tms.sql

##########################################################-Insert In mgrmessages
echo -e "---Start of Insert Data in  mgrmessages for  New patient------"
mysql --user=$DB_USER --password=$DB_PASSWD $DB_NAME < /tmp/loaddata_mgrmessage1_$tms.sql



#########################################################
echo -e "----Update  tableof requests with the form uid fro each patient -----"
mysql --user=$DB_USER --password=$DB_PASSWD $DB_NAME << EOF 
SET @tms='${tms}';
SET @getuidfrmdata := (select uid from tx_clinica_domain_model_formdata where element = 2095 and patient = @tms);
select @getuidfrmdata;
UPDATE tx_ecrfcollab_domain_model_mgrrequest SET form_data = @getuidfrmdata WHERE tx_ecrfcollab_domain_model_mgrrequest.patient = @tms;
EOF

##########################################################-End of Loop 
echo -e "---End of Importing Data !!! ------"


done

