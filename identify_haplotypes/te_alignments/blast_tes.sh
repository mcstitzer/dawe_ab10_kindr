#!/bin/bash -login

for i in [gdu]*.fa  ### don't want to get the TE db!
do

blastn -query $i -db TE_12-Feb-2015_15-35.fa -outfmt 6 -max_target_seqs 1 -evalue 1e-20 -task blastn >> tophit_TEDB_kindrTE.b6.e20.out
blastn -query $i -db TE_12-Feb-2015_15-35.fa -outfmt 6 -max_target_seqs 1 -evalue 1e-10 -task blastn >> tophit_TEDB_kindrTE.b6.e10.out

done
