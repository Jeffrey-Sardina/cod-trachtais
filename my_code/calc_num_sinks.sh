#!/bin/bash

SOURCE_FILE=$1

cut $SOURCE_FILE -f1 > temp.1
cut $SOURCE_FILE -f3 > temp.2
diff -u temp.1 temp.2 | grep -E "^\+" > temp.3
SINKS=$( wc -l temp.3 )
echo $SINKS
