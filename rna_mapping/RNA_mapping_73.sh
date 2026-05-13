#!/bin/bash -l

#SBATCH -A uppmax2026-1-61
#SBATCH -p pelle
#SBATCH -c 1
#SBATCH -t 00:50:00
#SBATCH -J RNA_mapping_73
#SBATCH --output=%x.%j.out

module load BWA
module load SAMtools

GENOME=/home/daer9945/Genome_Analysis/data/1_genome_assembly_data/efaecium.contigs.fasta
BHDATA=/home/daer9945/Genome_Analysis/data/5_rna_processing/RNA_BH_Trimmed/
OUTPUTDIR=/home/daer9945/Genome_Analysis/data/6_rna_mapping

bwa mem $GENOME $BHDATA/ERR1797973_trimmed_1P.fastq.gz $BHDATA/ERR1797973_trimmed_2P.fastq.gz | samtools view -Sb - > $OUTPUTDIR/paired_73.bam
cat $BHDATA/ERR1797973_trimmed_1U.fastq.gz $BHDATA/ERR1797973_trimmed_2U.fastq.gz | bwa mem $GENOME - | samtools view -Sb - > $OUTPUTDIR/unpaired_73.bam

samtools merge $OUTPUTDIR/merged_unsorted_73.bam $OUTPUTDIR/paired_73.bam $OUTPUTDIR/unpaired_73.bam
samtools sort -o $OUTPUTDIR/final_mapped_73.bam $OUTPUTDIR/merged_unsorted_73.bam
samtools index $OUTPUTDIR/final_mapped_73.bam
