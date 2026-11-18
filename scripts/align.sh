#!/bin/bash
#SBATCH --mem=1G
#SBATCH --tasks=1
#SBATCH --cpus-per-task=2
#SBATCH --time=01:00:00

####### Set environment variables ###############
module load bioconda

# First convert aa to nt using DeGenPrime
~/software/DeGenPrime/bin/degenprime --input_file:clustered_alkB_proteins_rep_seq.fasta \
--output_file:alkB_rep_seq.fna --protein

~/software/DeGenPrime/bin/degenprime --input_file:clustered_cyp153_proteins_rep_seq.fasta \
--output_file:cyp153_rep_seq.fna --protein

# Multiple sequence aligment

mafft --localpair --maxiterate 1000 --clustalout --thread 2 alkB_rep_seq.fna > alkB.clust
mafft --localpair --maxiterate 1000 --clustalout --thread 2 cyp153_rep_seq.fna > cyp153.clust
