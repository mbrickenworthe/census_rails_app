#!/bin/bash

csvify () {
	filename=$1
	csvfile=$(echo $filename | sed -e 's/\.TXT/.csv/')
	echo $csvfile

	echo "state_abbr,sex,year,name,frequency" >> $csvfile

	cat -v $filename | sed -e "s/\^M//" >> $csvfile
}

insert_into_postgres () {
	csvfile=`pwd`/$1
	echo $csvfile

	psql -d my_database_development -c \
	"COPY state_birth_names (state_abbr,sex,year,name,frequency) FROM '$csvfile' WITH CSV HEADER;"
}