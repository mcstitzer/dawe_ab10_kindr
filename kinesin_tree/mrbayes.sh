#!/bin/sh
#SBATCH -D /home/mstitzer/projects/ab10
#SBATCH -o /home/mstitzer/projects/ab10/slurm-log/mrbayes-stdout-%j.txt
#SBATCH -e /home/mstitzer/projects/ab10/slurm-log/mrbayes-stderr-%j.txt
#SBATCH -J mrbayes
set -e
set -u


export PATH=$PATH:/home/mstitzer/software/bin

#module load mrbayes/3.3.2

mb kinesin_homologs_TranslatorX_Prank_align.100m.nex 
