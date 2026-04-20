#!/bin/bash -l

#SBATCH -A uppmax2026-1-61
#SBATCH -p pelle
#SBATCH -c 1
#SBATCH -t 00:05:00
#SBATCH -J Annotation
#SBATCH --output=%x.%j.out

module load prokka

INPUTFILE=/home/daer9945/Genome_Analysis/data/1_genome_assembly_data/efaecium.contigs.fasta
OUTPUTDIR=/home/daer9945/Genome_Analysis/data/3_genome_annotation


prokka --outdir $OUTPUTDIR --force --prefix efaecium $INPUTFILE
