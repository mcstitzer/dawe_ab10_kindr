#!/bin/sh
#SBATCH -D /home/mstitzer/projects/ab10/dawe_ab10_kindr/kinesin_tree
#SBATCH -o /home/mstitzer/projects/ab10/slurm-log/mrbayes-stdout-%j.txt
#SBATCH -e /home/mstitzer/projects/ab10/slurm-log/mrbayes-stderr-%j.txt
#SBATCH -J mrbayes
set -e
set -u


export PATH=$PATH:/home/mstitzer/software/bin

#module load mrbayes/3.3.2

#mb kinesin_homologs_TranslatorX_Prank_align.100m.nex 

### I compiled mrbayes with --enable-mpi=yes --with-beagle=no
# the internet says SLURM will let mpirun know the -n, or --ntasks-per-node
# https://wiki.bils.se/wiki/Running_MrBayes_at_UPPMAX#Perform_a_parallel_simulation_using_the_MPI-version_of_MrBayes
### NOTE that you can only use as many processors as chains you are running, so if 1 run, 4 chains, only 4 CPU.
mpirun ~/software/mrbayes_3.2.2/src/mb-mpi kinesin_homologs_TranslatorX_Prank_align.100m.mpi.nex > kinesin_homologs_TranslatorX_Prank_align.100m.mpi.log 
