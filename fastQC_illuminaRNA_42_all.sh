#!/bin/bash -l
#SBATCH -A uppmax2026-1-61
#SBATCH -n 1
#SBATCH -t 02:00:00
#SBATCH -J fastqc_42
#SBATCH --mail-type=ALL
#SBATCH --output=Ricci_fastQC_42_RNA.out

module load FastQC

DATASET="/proj/uppmax2026-1-61/Genome_Analysis/2_Zhou_2023/reads/transcriptomic_data/"

fastqc $DATASET/Heat_treated_42_12h_1_f1.fq.gz $DATASET/Heat_treated_42_12h_1_r2.fq.gz \
$DATASET/Heat_treated_42_12h_2_f1.fq.gz $DATASET/Heat_treated_42_12h_2_r2.fq.gz \
$DATASET/Heat_treated_42_12h_3_f1.fq.gz $DATASET/Heat_treated_42_12h_3_r2.fq.gz -o /home/ricci/Genome_analysis_2026/illumina_RNA/
