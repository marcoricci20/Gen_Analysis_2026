#!/bin/bash -l
#SBATCH -A uppmax2026-1-61
#SBATCH -p pelle
#SBATCH -c 2
#SBATCH -t 00:40:00
#SBATCH -J Ricci_fastQ_RNA-3
#SBATCH --mail-type=ALL
#SBATCH --output=Ricci_fastQC-RNA_3.out



module load FastQC/0.12.1-Java-17
fastqc /proj/uppmax2026-1-61/Genome_Analysis/2_Zhou_2023/reads/transcriptomic_data/Control_3_f1.fq.gz \
/proj/uppmax2026-1-61/Genome_Analysis/2_Zhou_2023/reads/transcriptomic_data/Control_3_r2.fq.gz \
-o /home/ricci/Genome_analysis_2026/illumina_RNA
