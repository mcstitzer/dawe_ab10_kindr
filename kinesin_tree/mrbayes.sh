#!/bin/sh
#SBATCH -D /home/mstitzer/projects/ab10
#SBATCH -o /home/mstitzer/projects/ab10/slurm-log/mrbayes-stdout-%j.txt
#SBATCH -e /home/mstitzer/projects/ab10/slurm-log/mrbayes-stderr-%j.txt
#SBATCH -J mrbayes
set -e
set -u


export PATH=$PATH:/home/mstitzer/software/bin

#module load mrbayes/3.3.2


### generate tree thinking about codons as being a real part of evolutions
#mpirun -np 16 mb-mpi kindr_aln_codon.nt.nex > kindr_aln_codon.nt.mpi.log
#mb kindr_aln_codon.nt.nex

### test for positive selection at specific codon positions
#mpirun -np 16 mb-mpi kindr_aln_codon.nex > kindr_aln_codon.mpi.log
#mb kindr_aln_codon.nex


### then just do it with nt alignment
#mb kindr_aln_nt.nex

#mb Kindrlogs_only_full_length_genbank_TranslatorX_Prank_align.tandemdup2kindr.codon.nex

#mb Kindrlogs_only_full_length_genbank_TranslatorX_Prank_align.codon.10m.nex
mb Kindrlogs_only_full_length_genbank_TranslatorX_Prank_align.codon.100m.nex
