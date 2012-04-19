#! /bin/bash

rm -rf compile
mkdir compile
cd compile
ln -s ../testcode/wave.do
ln -s ../testcode/memwave.do
ln -s ../testcode/memtest.do
ln -s ../testcode/arbitertest.do
ln -s ../testcode/controltest.do
ln -s ../testcode/controltest2.do
ln -s ../testcode/basictest.do
ln -s ../testcode/mp3-cp1.do
ln -s ../testcode/mp3-cp2.do
ln -s ../testcode/mp3-cp3.do
ln -s ../testcode/semiasynch_ff.do
ln -s ../testcode/lditest.do
ln -s ../testcode/stitest.do
cd ..

