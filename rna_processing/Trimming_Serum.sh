#!/bin/bash -l

#SBATCH -A uppmax2026-1-61
#SBATCH -p pelle
#SBATCH -c 1
#SBATCH -t 02:30:00
#SBATCH -J Trimming_Serum
#SBATCH --output=%x.%j.out

module load Trimmomatic

SERUMDATA=/proj/uppmax2026-1-61/Genome_Analysis/1_Zhang_2017/transcriptomics_data/RNA-Seq_Serum/raw
OUTPUTDIR=/home/daer9945/Genome_Analysis/data/5_rna_processing
ADAPTERS=/sw/arch/eb/software/Trimmomatic/0.39-Java-17/adapters/TruSeq3-PE.fa

trimmomatic PE -threads 1 -basein $SERUMDATA/ERR1797969_1.fastq.gz -baseout $OUTPUTDIR/ERR1797969_trimmed.fastq.gz ILLUMINACLIP:$ADAPTERS:2:30:10 LEADING:5 TRAILING:5 MINLEN:50
trimmomatic PE -threads 1 -basein $SERUMDATA/ERR1797970_1.fastq.gz -baseout $OUTPUTDIR/ERR1797970_trimmed.fastq.gz ILLUMINACLIP:$ADAPTERS:2:30:10 LEADING:5 TRAILING:5 MINLEN:50
trimmomatic PE -threads 1 -basein $SERUMDATA/ERR1797971_1.fastq.gz -baseout $OUTPUTDIR/ERR1797971_trimmed.fastq.gz ILLUMINACLIP:$ADAPTERS:2:30:10 LEADING:5 TRAILING:5 MINLEN:50
