#!/bin/bash -l

#SBATCH -A uppmax2026-1-61
#SBATCH -p pelle
#SBATCH -c 1
#SBATCH -t 00:15:00
#SBATCH -J Assembly_eval
#SBATCH --output=%x.%j.out

module load QUAST

INPUTFILE=/home/daer9945/Genome_Analysis/data/1_genome_assembly_data/efaecium.contigs.fasta
OUTPUTDIR=/home/daer9945/Genome_Analysis/data/2_assembly_evaluation


python /sw/arch/eb/software/QUAST/5.3.0-gfbf-2024a/bin/quast.py \
-o $OUTPUTDIR -t 1 $INPUTFILE
