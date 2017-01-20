#!/bin/bash

TPL=tpl/boot.bin
COUNT=count.bin
OUTPUT=qspi_test.bin

rm -rf $COUNT
rm -rf $OUTPUT

for i in {0..255}
do
  printf "0: %.2x" $i | xxd -r -g0 >> $COUNT
done

for i in {0..65407}
do
  cat $COUNT >> $OUTPUT
done

cat $TPL >> $OUTPUT
