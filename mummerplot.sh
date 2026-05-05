#!/bin/bash -l

#SBATCH -A uppmax2026-1-61
#SBATCH -p pelle
#SBATCH -c 1
#SBATCH -t 00:10:00
#SBATCH -J Synteny
#SBATCH --output=%x.%j.out

module load MUMmer

INPUTFILE=/home/daer9945/Genome_Analysis/data/1_genome_assembly_data/efaecium.contigs.fasta
OUTPUTDIR=/home/daer9945/Genome_Analysis/data/4_synteny_comp


mummer $OUTPUTDIR/TF51-2_reference_sequence.fasta $INPUTFILE > $OUTPUTDIR/mummer.mums
mummerplot --png -p TF51 $OUTPUTDIR/mummer.mums
