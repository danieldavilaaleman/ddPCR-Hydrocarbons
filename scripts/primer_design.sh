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
~/software/DeGenPrime/bin/degenprime --input_file $WORDIR/alkb.msa.fasta \
--output_file alkb_primers.csv --protein

~/software/DeGenPrime/bin/degenprime --input_file $WORDIR/cyp153.msa.fasta \
--output_file cyp153_primers.csv --protein
