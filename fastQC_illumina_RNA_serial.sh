#!/bin/bash -l
#SBATCH -A uppmax2026-1-61
#SBATCH -p pelle
#SBATCH -c 2
#SBATCH -t 02:00:00
#SBATCH -J Ricci_fastQ_RNA-concat
#SBATCH --mail-type=ALL
#SBATCH --output=Ricci_fastQ-RNA_c_1_R.out



module load FastQC/0.12.1-Java-17
DATASET="/proj/uppmax2026-1-61/Genome_Analysis/2_Zhou_2023/reads/transcriptomic_data/"
fastqc $DATASET/Heat_treated_42_12h_1_f1.fq.gz $DATASET/Heat_treated_42_12h_1_r2.fq.gz \
$DATASET/Heat_treated_42_12h_2_f1.fq.gz $DATASET/Heat_treated_42_12h_2_r2.fq.gz \
$DATASET/Heat_treated_42_12h_3_f1.fq.gz $DATASET/Heat_treated_42_12h_3_r2.fq.gz \
$DATASET/Control_2_f1.fq.gz $DATASET/Control_2_r2.fq.gz $DATASET/Control_3_f1.fq.gz \ 
$DATASET/Control_3_r2.fq.gz -o /home/ricci/Genome_analysis_2026/illumina_RNA
