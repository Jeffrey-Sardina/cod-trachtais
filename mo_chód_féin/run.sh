#!/bin/sh
export CLASSPATH=/mnt/e/Tráchtas/apache-jena-3.17.0/lib/*:.
echo 'compiling'
javac Go_NT.java
echo 'running'
java Go_NT
echo 'done'
