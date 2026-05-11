#!/bin/bash -l

#SBATCH -A uppmax2026-1-61
#SBATCH -p pelle
#SBATCH -c 1
#SBATCH -t 00:25:00
#SBATCH -J QC_before
#SBATCH --output=%x.%j.out

module load FastQC

BHDATA=/proj/uppmax2026-1-61/Genome_Analysis/1_Zhang_2017/transcriptomics_data/RNA-Seq_BH/raw
SERUMDATA=/proj/uppmax2026-1-61/Genome_Analysis/1_Zhang_2017/transcriptomics_data/RNA-Seq_Serum/raw
OUTPUTDIR=/home/daer9945/Genome_Analysis/data/5_rna_processing

fastqc -o $OUTPUTDIR $BHDATA/* $SERUMDATA/*
