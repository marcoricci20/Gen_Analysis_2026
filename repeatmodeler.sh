#!/bin/bash -l
#SBATCH -A uppmax2025-2-421
#SBATCH -J Ricci_repeatmodeler
#SBATCH -c 2
#SBATCH -t 15:00:00
#SBATCH --mail-user marco.ricci.evobio@gmail.com
#SBATCH --output=Ricci_RepModeler.out
#SBATCH --mail-type=ALL
#SBATCH --error=/home/ricci/Genome_analysis_2026/RepModeler.err

module load RepeatModeler/2.0.7-foss-2024a

REF=/home/ricci/Genome_analysis_2026/1_polishing/1_polishing.fasta

# Run RepeatModeler
BuildDatabase -name $REF
RepeatModeler -database $REF $REF -LTRStruct
