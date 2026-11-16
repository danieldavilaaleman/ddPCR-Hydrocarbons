#!/bin/bash
#SBATCH --mem=10G
#SBATCH --tasks=1
#SBATCH --cpus-per-task=4
#SBATCH --time=01:00:00
#SBATCH --output=linclust.out

####### Set environment variables ###############
module load bioconda

WORKDIR=`pwd`
SCRATCH=/scratch/$SLURM_JOBID

cd $SCRATCH 
####### Pre-processing data  ###########
cat $WORKDIR/../canthyd.out/*.n-alkanes.faa > CArctic.n-alkanes.faa
mmseqs easy-linclust CArctic.n-alkanes.faa clustered_proteins tmp --min-seq-id 0.9 -c 0.95 --cov-mode 1
