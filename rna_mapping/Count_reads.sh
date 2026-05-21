#!/bin/bash -l

#SBATCH -A uppmax2026-1-61
#SBATCH -p pelle
#SBATCH -c 1
#SBATCH -t 00:30:00
#SBATCH -J Count_reads
#SBATCH --output=%x.%j.out

module load SAMtools

OUTPUTDIR=/home/daer9945/Genome_Analysis/data/6_rna_mapping

for file in $OUTPUTDIR/*.bam; do echo "=== $file ==="; samtools flagstat "$file"; done

