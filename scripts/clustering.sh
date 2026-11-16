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
cat $WORKDIR/../annotation/*.faa > CArctic.faa
seqtk subseq CArtic.HDG.faa $WORKDIR/../canthyd.out/n-alkane.IDs.txt > n-alkanes.faa
mmseqs easy-linclust n-alkanes.faa clustered_proteins tmp --min-seq-id 0.9 -c 0.95 --cov-mode 1
