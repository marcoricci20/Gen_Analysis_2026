#!/bin/bash -l
#SBATCH -A uppmax2026-1-61
#SBATCH --mem=15G
#SBATCH -p pelle
#SBATCH -n 1
#SBATCH -t 06:00:00
#SBATCH -J Ricci_Trimmomatic_1
#SBATCH --mail-type=ALL
#SBATCH --mail-user marco.ricci.evobio@gmail.com
#SBATCH --output=Trimmomatic_DNA_F.out

# Load required modules
module load Trimmomatic

trimmomatic PE -threads 2 \
    /proj/uppmax2026-1-61/Genome_Analysis/2_Zhou_2023/reads/genomics_chr3_data/chr3_illumina_R1.fastq.gz \
    /proj/uppmax2026-1-61/Genome_Analysis/2_Zhou_2023/reads/genomics_chr3_data/chr3_illumina_R2.fastq.gz \
    /home/ricci/Genome_analysis_2026/illumina_DNA/trimmed_DNA/paired_trimmed_1.fastq.gz \
    /home/ricci/Genome_analysis_2026/illumina_DNA/trimmed_DNA/unpaired_trimmed_1.fastq.gz \
    /home/ricci/Genome_analysis_2026/illumina_DNA/trimmed_DNA/paired_trimmed_2.fastq.gz \
    /home/ricci/Genome_analysis_2026/illumina_DNA/trimmed_DNA/unpaired_trimmed_2.fastq.gz \
    LEADING:30 TRAILING:30 SLIDINGWINDOW:10:30 MINLEN:50
