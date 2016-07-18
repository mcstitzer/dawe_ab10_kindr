#!/bin/bash -login
#SBATCH -D /home/mstitzer/projects/ab10/tripsacum
#SBATCH -o /home/mstitzer/projects/ab10/slurm-log/tripassemble-stdout-%j.txt
#SBATCH -e /home/mstitzer/projects/ab10/slurm-log/tripassemble-stderr-%j.txt
#SBATCH -J assembletrip
set -e
set -u

module load python
module load qiime

SAMPLENAME=tripsacum_kin_unmapped.CDS

bedtools bamtofastq -i ${SAMPLENAME}.bam -fq ${SAMPLENAME}.mapped.fq
/share/apps/qiime-1.9.1/bin/convert_fastaqual_fastq.py -f ${SAMPLENAME}.mapped.fq -c fastq_to_fastaqual
mv ${SAMPLENAME}.mapped.qual ${SAMPLENAME}.mapped.fna.qual
~/software/phrap_1.090518/phrap ${SAMPLENAME}.mapped.fna -vector_bound 0 -forcelevel 0 -minscore 10 -new_ace 2> ${SAMPLENAME}.mapped.phrap.stderr > ${SAMPLENAME}.mapped.phrap.stdout

