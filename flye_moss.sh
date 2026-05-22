#!/bin/bash -l
#SBATCH -A uppmax2026-1-61
#SBATCH -M pelle
#SBATCH -n 2
#SBATCH --mem=90G
#SBATCH -t 48:00:00
#SBATCH -J Ricci_Flye1
#SBATCH --mail-type=ALL
#SBATCH --mail-user marco.ricci.evobio@gmail.com
#SBATCH --output=/home/ricci/Genome_analysis_2026/Nanopore%j.out
#SBATCH --error=/home/ricci/Genome_analysis_2026/Nanopore%j.err
module load Flye/2.9.6

flye  --genome-size 16m /proj/uppmax2026-1-61/Genome_Analysis/2_Zhou_2023/reads/genomics_chr3_data/chr3_clean_nanopore.fq.gz --out-dir /home/ricci/Genome_analysis_2026/Nanopore
