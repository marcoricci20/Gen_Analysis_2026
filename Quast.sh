#!/bin/bash -l
#SBATCH -A uppmax2026-1-61
#SBATCH -J Ricci_Quast
#SBATCH -c 1
#SBATCH -t 00:40:00
#SBATCH --mail-user marco.ricci.evobio@gmail.com
#SBATCH --output=Ricci_RepMasker.out
#SBATCH --mail-type=ALL
#SBATCH --error=/home/ricci/Genome_analysis_2026/Code-gen-analy-2026/Quast.err

module load QUAST/5.3.0-gfbf-2024a

quast.py /home/ricci/Genome_analysis_2026/1_polishing/1_polishing.fasta -o /home/ricci/Genome_analysis_2026/3_Quast



