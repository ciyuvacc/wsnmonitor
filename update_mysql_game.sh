#!/bin/bash

TMP_FDT=/root/update_all_mysql/mysql/
DB_USER="root"
DB_PASS="jeC02GfP"



GS=`cat ./mysql/db.list | wc -l`
z=1
while [ $z -le ${GS} ]
do

        DB_HOST=`sed -n ${z}p ${TMP_FDT}db.list | awk -F' ' '{print $2}' `
        DB_PORT=`sed -n ${z}p ${TMP_FDT}db.list | awk -F' ' '{print $3}' `

#       /usr/bin/mysql -h${DB_HOST} -u${DB_USER} -p${DB_PASS} -P${DB_PORT} -e 'SHOW DATABASES;'|grep tank_. > ${TMP_FDT}mysql.name
        /usr/bin/mysql -h${DB_HOST} -u${DB_USER} -p${DB_PASS} -P${DB_PORT} -e 'SHOW DATABASES;'|grep tank_ > ${TMP_FDT}mysql.name

                        DB_NAME_NUMB=`cat /home/zhangpeidong/update_all_mysql/mysql/mysql.name |wc -l`
#                       DB_NAEM_NUMB=`cat ${TMP_FDT}mysql.name |wc -l`

                                i=1
                                while [ $i -le $DB_NAME_NUMB ]
                                        do
                                       # DB_NAME_SN=`sed -n ${i}p /tmp/ssh-zhangpeidong/update_all_S/mysql/mysql.name`
                                        DB_NAME_SN=`sed -n ${i}p ${TMP_FDT}/mysql.name`

                                        /usr/bin/mysql -h${DB_HOST} -u${DB_USER} -p${DB_PASS} -P${DB_PORT} ${DB_NAME_SN} < ${TMP_FDT}game.sql

                                        echo ${DB_NAME_SN}"更新完成"
                                       sleep 1
                                        i=$((i + 1 ))
                                done
        z=$(( z + 1 ))
done

