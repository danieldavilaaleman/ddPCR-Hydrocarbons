#!/bin/bash
#SBATCH --mem=4G
#SBATCH --tasks=1
#SBATCH --cpus-per-task=4
#SBATCH --time=01:00:00

####### Set environment variables ###############
module load bioconda

WORKDIR=`pwd`
SCRATCH=/scratch/$SLURM_JOBID

cd $SCRATCH 
####### Pre-processing data  ###############
for file in *.contigs.fasta
do
sample=`basename -s _final.contigs.fasta $file`
echo "Annotation with PRODIGAL for the sample assembly $sample"
prodigal -a $sample -o $sample.annotation -p meta $file
done
