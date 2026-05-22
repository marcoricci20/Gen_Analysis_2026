#!/bin/bash -l
#SBATCH -A uppmax2025-2-421
#SBATCH -J Ricci_repeatmasker
#SBATCH -c 8
#SBATCH -t 10:00:00
#SBATCH --mail-user marco.ricci.evobio@gmail.com
#SBATCH --output=Ricci_RepMasker.out
#SBATCH --mail-type=ALL
#SBATCH --error=/home/ricci/Genome_analysis_2026/Code-gen-analy-2026/RepMasker.err

module load RepeatMasker/4.2.1-foss-2024a

INPUT=/home/ricci/Genome_analysis_2026/1_polishing/1_polishing.fasta
LIB=/home/ricci/Genome_analysis_2026/2_masking/myGenomeDB-families.fa
OUTDIR=/home/ricci/Genome_analysis_2026/2_masking

RepeatMasker -pa 8 -lib $LIB -xsmall -s -dir $OUTDIR $INPUT


