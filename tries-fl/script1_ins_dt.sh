#!/bin/bash 

## Vars Definition for  this Script 
DB_USER=root
DB_PASSWD=admin89!
DB_NAME=typo3local
DB_TABLE=tx_clinica_domain_model_patient
echo -e $DB_NAME
echo -e $DB_TABLE

#retrieve Patient Data from CSV

Ptn=$'\r\n'  command eval  'pstcsv=($(cat ~/StartUPScripts/SQLParse/insertPatients.csv))'


 mysql --user=$DB_USER --password=$DB_PASSWD $DB_NAME << EOF
drop PROCEDURE if exists updateLocations;
DELIMITER //

CREATE PROCEDURE updateLocations( inserttimes INT)
BEGIN
    DECLARE i INT default 0;
    SET i=0;
    loop1: REPEAT
        SET i=i+1;
        select i;
    UNTIL i >= inserttimes
    END REPEAT;
END;
//
DELIMITER ;

call updateLocations(1);

EOF