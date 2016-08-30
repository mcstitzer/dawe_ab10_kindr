#!/bin/bash -login
#SBATCH -D /home/mstitzer/projects/ab10/hapmap_trip
#SBATCH -o /home/mstitzer/projects/ab10/slurm-log/map_trip-stdout-%j.txt
#SBATCH -e /home/mstitzer/projects/ab10/slurm-log/map_trip-stderr-%j.txt
#SBATCH -J map_trip
set -e
set -u


export PATH=$PATH:/home/mstitzer/software/bin

DAY=$(date +"%d%m%Y")

module load bamtools
module load bedtools
module load python

SAMPLENAME=hapmap_tripsacum_kin.CDS

READ1=hapmaptrip_1.fq
READ2=hapmaptrip_2.fq

if [ ! -f ${SAMPLENAME}.bam ]
then
#bwa index kindr_kin11.fa
## need to decide whether to be fancy and go for the pairs where only one read maps.
## for now, just grabbing any reads that map. 
#bwa mem -t 16 kindr_kin11.CDS.fa $READ1 $READ2 | samtools view -Su -F 4 - | samtools sort - $SAMPLENAME
bwa mem -t 16 -a kindr_kin11.CDS.fa $READ1 $READ2 | samtools view -Su - | bamtools filter -script filter_mapped_and_pairs.bamtools.json | samtools sort - $SAMPLENAME

fi

if [ -f ${SAMPLENAME}.bam ]
then

#############################
### assemble mapped reads ###
#############################

bedtools bamtofastq -i ${SAMPLENAME}.bam -fq ${SAMPLENAME}.fq
#/share/apps/qiime-1.9.1/bin/convert_fastaqual_fastq.py -f ${SAMPLENAME}.fq -c fastq_to_fastaqual
#mv ${SAMPLENAME}.qual ${SAMPLENAME}.fna.qual
python3 fq_to_fa_qual.py ${SAMPLENAME}.fq ${SAMPLENAME}.fna ${SAMPLENAME}.fna.qual
~/software/phrap_1.090518/phrap ${SAMPLENAME}.fna -vector_bound 0 -forcelevel 0 -minscore 10 -new_ace 2> ${SAMPLENAME}.phrap.stderr > ${SAMPLENAME}.phrap.stdout

fi


