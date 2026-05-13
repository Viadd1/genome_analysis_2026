#!/bin/bash -l

#SBATCH -A uppmax2026-1-61
#SBATCH -p pelle
#SBATCH -c 1
#SBATCH -t 01:30:00
#SBATCH -J QC_after
#SBATCH --output=%x.%j.out

module load FastQC

TRIMMEDBH=/home/daer9945/Genome_Analysis/data/5_rna_processing/RNA_BH_Trimmed
TRIMMEDSERUM=/home/daer9945/Genome_Analysis/data/5_rna_processing/RNA_Serum_Trimmed
OUTPUTDIR=/home/daer9945/Genome_Analysis/data/5_rna_processing

fastqc -o $OUTPUTDIR $TRIMMEDBH/*.fastq.gz $TRIMMEDSERUM/*.fastq.gz
