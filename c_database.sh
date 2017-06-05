#!/bin/bash
mysql -u root  -h localhost -pPA$$W0RD -Bse "CREATE DATABASE $1 CHARACTER SET utf8 COLLATE utf8_general_ci;"
mysql -u root -h localhost  -pPA$$W0RD -Bse "GRANT ALL ON ${1}.* to $2@localhost identified by '$3';"
