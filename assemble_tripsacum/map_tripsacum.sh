#!/bin/bash -login
#SBATCH -D /home/mstitzer/projects/ab10/tripsacum
#SBATCH -o /home/mstitzer/projects/ab10/slurm-log/map_trip-stdout-%j.txt
#SBATCH -e /home/mstitzer/projects/ab10/slurm-log/map_trip-stderr-%j.txt
#SBATCH -J map_trip
set -e
set -u


export PATH=$PATH:/home/mstitzer/software/bin

DAY=$(date +"%d%m%Y")


module load bamtools

SAMPLENAME=tripsacum_kin_unmapped.CDS

READ1=5148_8491_18991_H2MYHBCXX_Pete_DNA_4-6-15C_R1.fastq.gz
READ2=5148_8491_18991_H2MYHBCXX_Pete_DNA_4-6-15C_R2.fastq.gz

#bwa index kindr_kin11.fa
## need to decide whether to be fancy and go for the pairs where only one read maps.
## for now, just grabbing any reads that map. 
#bwa mem -t 36 kindr_kin11.fa $READ1 $READ2 | tee >(samtools view -Su -F 12 - > mapped.bam) >(samtools view -Su -F 4 -f 8 > mapped.pairunmapped.bam) >(samtools view -Su -f 4 -F 8 > unmapped.pairmapped.bam)

#samtools merge - mapped.bam mapped.pairunmapped.bam unmapped.pairmapped.bam | samtools sort - $SAMPLENAME

bwa mem -t 16 kindr_kin11.CDS.fa $READ1 $READ2 | samtools view -Su - | bamtools filter -script filter_mapped_and_pairs.bamtools.json | samtools sort - $SAMPLENAME

#rm mapped.bam
#rm mapped.pairunmapped.bam
#rm unmapped.pairmapped.bam

#bwa mem -t 16 kindr_kin11.CDS.fa $READ1 $READ2 | samtools view -Su -F 4 - | samtools sort - $SAMPLENAME

