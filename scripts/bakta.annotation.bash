#!/bin/bash
#SBATCH --mem=8G
#SBATCH --tasks=1
#SBATCH --cpus-per-task=4
#SBATCH --time=01:00:00

####### Set environment variables ###############
module load bioconda

WORKDIR=`pwd`
SCRATCH=/scratch/$SLURM_JOBID

cd $SCRATCH 
####### Pre-processing data  ###############

