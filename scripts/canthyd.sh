#!/bin/bash
#SBATCH --mem=4G
#SBATCH --tasks=1
#SBATCH --cpus-per-task=2
#SBATCH --time=02:00:00
#SBATCH --output=canthyd.out

####### Set environment variables ###############
module load bioconda

####### Pre-processing data  ###############
# -I {} Replace {} with each incoming file
# -P 4 Runs 4 parallel jobs at the same time. Adjust based on available CPU cores
# --cpus 3 Prevents hmmsearch from taking extra threads
# sh -c '...' Ensures the redicrection applies individually to each parallel job rather than a single one from the xargs command

ls *.faa | xargs -I {} -P 4 sh -c 'name=$(basename "{}" .faa)
hmmsearch --cpu 3 --cut_tc --tblout ${name}.tblout CANT-HYD.hmm "{}" > ${name}.out'

# For extracting the protein sequences of the protein IDs identified as HGD 
ls *.tblout | xargs -I {} -P 4 sh -c 'name=$(basename "{}" .tblout)
cat "{}" | grep -v "^#" | sed "s/ /\t/g" | cut -f 1 > ${name}.IDs.txt
seqtk subseq ../annotation/${name}.faa ${name}.IDs.txt > ${name}.HDG.faa'
