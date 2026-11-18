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
clustalo -i $WORKDIR/clustered_alkB_proteins_rep_seq.fasta \
-o alkb.msa.fasta
--threads 2
-v

clustalo -i $WORKDIR/clustered_cyp153_proteins_rep_seq.fasta \
-o cyp153.msa.fasta
--threads 2
-v
