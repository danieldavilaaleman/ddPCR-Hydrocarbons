#!/bin/bash
#SBATCH --mem=1G
#SBATCH --tasks=1
#SBATCH --cpus-per-task=2
#SBATCH --time=01:00:00

####### Set environment variables ###############
module load bioconda

WORKDIR=`pwd`
SCRATCH=/scratch/$SLURM_JOBID

cd $SCRATCH 
####### Pre-processing data  ###########
 ~/software/DeGenPrime/bin/degenprime --input_file:../4_align/alkB.clust \
 --output_file:alkb.default_primers.csv --min_temp:58 --max_temp:63
