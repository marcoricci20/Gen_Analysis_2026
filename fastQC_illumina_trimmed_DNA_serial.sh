#!/bin/bash
#SBATCH -A uppmax2026-1-61
#SBATCH -n 1
#SBATCH -t 01:20:00
#SBATCH -J fastqc_trimmed
#SBATCH --mail-type=ALL
#SBATCH --output=Ricci_fastQC_trimmed_DNA.out

module load FastQC

DATASET="/home/ricci/Genome_analysis_2026/illumina_DNA/trimmed_DNA"

fastqc $DATASET/paired_trimmed_1.fastq.gz $DATASET/paired_trimmed_2.fastq.gz \
$DATASET/unpaired_trimmed_1.fastq.gz $DATASET/unpaired_trimmed_2.fastq.gz \ -o /home/ricci/Genome_analysis_2026/illumina_DNA/trimmed_DNA
