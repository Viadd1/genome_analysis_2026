#!/bin/bash -l

#SBATCH -A uppmax2026-1-61
#SBATCH -p pelle
#SBATCH -c 1
#SBATCH -t 02:30:00
#SBATCH -J Trimming_BH
#SBATCH --output=%x.%j.out

module load Trimmomatic

BHDATA=/proj/uppmax2026-1-61/Genome_Analysis/1_Zhang_2017/transcriptomics_data/RNA-Seq_BH/raw
OUTPUTDIR=/home/daer9945/Genome_Analysis/data/5_rna_processing
ADAPTERS=/sw/arch/eb/software/Trimmomatic/0.39-Java-17/adapters/TruSeq3-PE.fa

trimmomatic PE -threads 1 -trimlog $OUTPUTDIR/trimmomatic_1797972.log -basein $BHDATA/ERR1797972_1.fastq.gz -baseout $OUTPUTDIR/ERR1797972_trimmed.fastq.gz ILLUMINACLIP:$ADAPTERS:2:30:10 LEADING:5 TRAILING:5 MINLEN:50
trimmomatic PE -threads 1 -trimlog $OUTPUTDIR/trimmomatic_1797973.log -basein $BHDATA/ERR1797973_1.fastq.gz -baseout $OUTPUTDIR/ERR1797973_trimmed.fastq.gz ILLUMINACLIP:$ADAPTERS:2:30:10 LEADING:5 TRAILING:5 MINLEN:50
trimmomatic PE -threads 1 -trimlog $OUTPUTDIR/trimmomatic_1797974.log -basein $BHDATA/ERR1797974_1.fastq.gz -baseout $OUTPUTDIR/ERR1797974_trimmed.fastq.gz ILLUMINACLIP:$ADAPTERS:2:30:10 LEADING:5 TRAILING:5 MINLEN:50
