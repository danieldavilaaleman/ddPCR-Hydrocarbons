#!/bin/bash
#SBATCH --mem=4G
#SBATCH --tasks=1
#SBATCH --cpus-per-task=2
#SBATCH --time=02:00:00
#SBATCH --output=canthyd.out

####### Set environment variables ###############
module load bioconda

WORKDIR=`pwd`
SCRATCH=/scratch/$SLURM_JOBID


hmmsearch --tblout hmmsearch_metagenome.tblout CANT-HYD.hmm metagenome_proteins.faa > hmmsearch_metagenome.out
