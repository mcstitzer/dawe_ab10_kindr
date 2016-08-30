#!/bin/sh
#SBATCH -D /home/mstitzer/projects/ab10/hapmap_trip
#SBATCH -o /home/mstitzer/projects/ab10/slurm-log/sratofq-stdout-%j.txt
#SBATCH -e /home/mstitzer/projects/ab10/slurm-log/sratofq-stderr-%j.txt
#SBATCH -J sratofq
set -e
set -u


# get file from sra
## -k2 from http://betascience.blogspot.com/2010/02/using-aspera-instead-of-ftp-to-download.html because getting timeouts
~/.aspera/connect/bin/ascp -i ~/.aspera/connect/etc/asperaweb_id_dsa.putty -k 2 -QTr -l 200m anonftp@ftp-private.ncbi.nlm.nih.gov:/sra/sra-instant/reads/ByExp/sra/SRX/SRX131/SRX131141/SRR447804/SRR447804.sra ./
~/.aspera/connect/bin/ascp -i ~/.aspera/connect/etc/asperaweb_id_dsa.putty -k 2 -QTr -l 200m anonftp@ftp-private.ncbi.nlm.nih.gov:/sra/sra-instant/reads/ByExp/sra/SRX/SRX131/SRX131142/SRR447805/SRR447805.sra ./
~/.aspera/connect/bin/ascp -i ~/.aspera/connect/etc/asperaweb_id_dsa.putty -k 2 -QTr -l 200m anonftp@ftp-private.ncbi.nlm.nih.gov:/sra/sra-instant/reads/ByExp/sra/SRX/SRX131/SRX131143/SRR447806/SRR447806.sra ./
~/.aspera/connect/bin/ascp -i ~/.aspera/connect/etc/asperaweb_id_dsa.putty -k 2 -QTr -l 200m anonftp@ftp-private.ncbi.nlm.nih.gov:/sra/sra-instant/reads/ByExp/sra/SRX/SRX131/SRX131144/SRR447807/SRR447807.sra ./

# convert to fq
~/software/sratoolkit.2.3.4-2-ubuntu64/bin/fastq-dump --split-files SRR447804.sra
~/software/sratoolkit.2.3.4-2-ubuntu64/bin/fastq-dump --split-files SRR447805.sra
~/software/sratoolkit.2.3.4-2-ubuntu64/bin/fastq-dump --split-files SRR447806.sra
~/software/sratoolkit.2.3.4-2-ubuntu64/bin/fastq-dump --split-files SRR447807.sra

cat SRR44780[4-7]_1.fastq > hapmaptrip_1.fq
cat SRR44780[4-7]_2.fastq > hapmaptrip_2.fq

rm SRR44780[4-7].sra
rm SRR44780[4-7]_1.fastq
rm SRR44780[4-7]_2.fastq

