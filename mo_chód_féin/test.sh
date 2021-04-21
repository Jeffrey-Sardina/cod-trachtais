#!/bin/bash

# $1 => ainm fillteán i "cóipeanna/" (ms dbsnp)
# $2 => samhail (ms TransE)
# $3 => scrios seancomhaid (1) nó ná scrios (0)
# $4 => áit tosaithe

AM_TOSACH="$(date +%s)"

if [[ $1 -gt "1" ]]
then
    echo 1
fi
