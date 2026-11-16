# Design of ddPCR primers for Hydrocarbon degradation genes in the Arctic microbiome
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT) 
![Static Badge](https://img.shields.io/badge/Design-ddPCR_Primers-red)

## Collection of Hydrocarbon degradation genes in Arctic samples from the GM group
First step is to collect all hydrocarbon degradation genes present in metagenomic samples from the Canadian Arctic previously assembled at the Geomicrobiology Group.

#### 1. Gene prediction
Raw reads from metagenomic sequences from Hudson Bay and Northwest Passage were assembled previously using `megahit`. The Gene prediction of the output contigs were annotated using `prodigal` - `scripts/prodigal.annotation.sh`

#### 2. Hydrocarbon degradation identification 
Genes predicted from each contig were query against the CANT-HYD Database using the trusted cutoff - `scripts/cant-hyd.sh`

#### 3. Clustering proteins
Identified proteins as hydrocarbon degrading enzymes from all the samples where subset and clustered to 90% of sequence identity and asking for the representative sequence cover at least 95% of the members using `linclust` - `scripts/clustering.sh`
