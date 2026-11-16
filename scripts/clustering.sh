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
cat $WORKDIR/*.HDG.faa > CArctic.HDG.faa
mmseqs easy-linclust CArctic.HDG.faa clustered_proteins tmp --min-seq-id 0.9 -c 0.95 --cov-mode 1
