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

ls annotation/*.faa | xargs -I {} -P 4 sh -c 'name=$(basename "{}" .faa)
hmmsearch --cpu 3 --cut_tc --tblout ${name}.tblout CANT-HYD.hmm "{}" > ${name}.out'

# For extracting the protein sequences of the protein IDs identified as AlkB or CYP153 for each sample
for sample in canthyd.out/*.tblout
do
name=$(basename $sample .tblout)
grep -v "^#" $sample | tr -s " " | sed "s/ /\t/g" | awk '$3 == "AlkB"' | cut -f 1 >  ${name}.alkB.IDs.txt
grep -v "^#" $sample | tr -s " " | sed "s/ /\t/g" | awk '$3 == "CYP153"' | cut -f 1 >  ${name}.cyp153.IDs.txt
seqtk subseq ../annotation/${name}.faa ${name}.alkB.IDs.txt > ${name}.alkB.faa
seqtk subseq ../annotation/${name}.faa ${name}.cyp153.IDs.txt > ${name}.cyp153.faa
done

