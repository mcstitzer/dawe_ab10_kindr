#!/bin/bash -login

for i in [gdu]*.fa  ### don't want to get the TE db!
do

blastn -query $i -db TE_12-Feb-2015_15-35.fa -outfmt 6 -max_target_seqs 1 -evalue 1e-20 -task blastn >> tophit_TEDB_kindrTE.b6.e20.out
blastn -query $i -db TE_12-Feb-2015_15-35.fa -outfmt 6 -max_target_seqs 1 -evalue 1e-10 -task blastn >> tophit_TEDB_kindrTE.b6.e10.out
## issue #1, BLAST -max_target_seqs just returns 1 good hit, not single best hit
##### so let's get them all to show that same family gets assigned
blastn -query $i -db TE_12-Feb-2015_15-35.fa -outfmt 6 -evalue 1e-20 -task blastn >> allhits_TEDB_kindrTE.b6.e20.out
blastn -query $i -db TE_12-Feb-2015_15-35.fa -outfmt 6 -evalue 1e-10 -task blastn >> allhits_TEDB_kindrTE.b6.e10.out

done



## reduce these files to best hit
sort -k1 -k3nr allhits_TEDB_kindrTE.b6.e10.out | awk '!seen[$1]++' > allhits_TEDB_kindrTE.b6.e10.best.out
sort -k1 -k3nr allhits_TEDB_kindrTE.b6.e20.out | awk '!seen[$1]++' > allhits_TEDB_kindrTE.b6.e20.best.out
## also the tophit ones
sort -k1 -k3nr tophit_TEDB_kindrTE.b6.e10.out | awk '!seen[$1]++' > tophit_TEDB_kindrTE.b6.e10.best.out
sort -k1 -k3nr tophit_TEDB_kindrTE.b6.e20.out | awk '!seen[$1]++' > tophit_TEDB_kindrTE.b6.e20.best.out

### see if there is a difference between the -max_target_seqs and the total

diff allhits_TEDB_kindrTE.b6.e10.best.out tophit_TEDB_kindrTE.b6.e10.best.out
diff allhits_TEDB_kindrTE.b6.e20.best.out tophit_TEDB_kindrTE.b6.e20.best.out


