#!/bin/bash -l

#SBATCH -A uppmax2026-1-61
#SBATCH -p pelle
#SBATCH -c 4
#SBATCH -t 03:00:00
#SBATCH -J canu_assembly
#SBATCH --output=%x.%j.out

module load canu
module load SAMtools

DATADIR=/proj/uppmax2026-1-61/Genome_Analysis/1_Zhang_2017/genomics_data/PacBio
OUTPUTDIR=/home/daer9945/Genome_Analysis/data/1_genome_assembly_data

canu \
-p efaecium \
-d $OUTPUTDIR \
genomeSize=2.8m \
useGrid=false maxThreads=4 \
-pacbio $DATADIR/*.subreads.fastq.gz
