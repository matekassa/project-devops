#!/bin/bash

CURRENT_DATE=$(date +%d-%m-%Y)
mkdir ./$CURRENT_DATE
mysqldump -uudemx -pudemx udemx_db > ./$CURRENT_DATE/udemx_db-$CURRENT_DATE.sql
