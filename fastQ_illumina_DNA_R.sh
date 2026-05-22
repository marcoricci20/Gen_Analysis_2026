#!/bin/bash -l
#SBATCH -A uppmax2026-1-61
#SBATCH -p pelle
#SBATCH -c 2
#SBATCH -t 00:20:00
#SBATCH -J Ricci_fastQ_DNA-F
#SBATCH --mail-type=ALL
#SBATCH --output=Ricci_fastQ-DNA_R.out



module load FastQC/0.12.1-Java-17
fastqc /proj/uppmax2026-1-61/Genome_Analysis/2_Zhou_2023/reads/genomics_chr3_data/chr3_illumina_R2.fastq.gz -o /home/ricci/Genome_analysis_2026/illumina_DNA
