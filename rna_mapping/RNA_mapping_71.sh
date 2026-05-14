#!/bin/bash -l

#SBATCH -A uppmax2026-1-61
#SBATCH -p pelle
#SBATCH -c 1
#SBATCH -t 00:40:00
#SBATCH -J RNA_mapping_71
#SBATCH --output=%x.%j.out

module load BWA
module load SAMtools

GENOME=/home/daer9945/Genome_Analysis/data/1_genome_assembly_data/efaecium.contigs.fasta
SERUMDATA=/home/daer9945/Genome_Analysis/data/5_rna_processing/RNA_Serum_Trimmed/
OUTPUTDIR=/home/daer9945/Genome_Analysis/data/6_rna_mapping

bwa mem $GENOME $SERUMDATA/ERR1797971_trimmed_1P.fastq.gz $SERUMDATA/ERR1797971_trimmed_2P.fastq.gz | samtools view -Sb - > $OUTPUTDIR/paired_71.bam

samtools sort -o $OUTPUTDIR/final_mapped_71.bam $OUTPUTDIR/paired_71.bam
samtools index $OUTPUTDIR/final_mapped_71.bam
