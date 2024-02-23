#!/bin/bash

echo 'SET PAGESIZE 0' > script.sql
echo 'SET ECHO OFF' >> script.sql
echo 'SET FEEDBACK OFF' >> script.sql
echo 'SET VERIFY OFF' >> script.sql
echo 'SELECT NAME FROM v$database;' >> script.sql
echo 'EXIT' >> script.sql

result=$(sqlplus $1/$2@$3/$4 @script.sql)

# Extract the desired output using awk
output=$(echo "$result" | awk '/^[[:space:]]*[[:alnum:]]+[[:space:]]*$/ {print $1}')

echo "$output"