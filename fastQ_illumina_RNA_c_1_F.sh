#!/bin/bash -l
#SBATCH -A uppmax2026-1-61
#SBATCH -p pelle
#SBATCH -c 2
#SBATCH -t 00:20:00
#SBATCH -J Ricci_fastQ_RNA-F
#SBATCH --mail-type=ALL
#SBATCH --output=Ricci_fastQ-RNA_c_1_F.out



module load FastQC/0.12.1-Java-17
fastqc /proj/uppmax2026-1-61/Genome_Analysis/2_Zhou_2023/reads/transcriptomic_data/Control_1_f1.fq.gz -o /home/ricci/Genome_analysis_2026/illumina_RNA
