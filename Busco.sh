#!/bin/bash -l
#SBATCH -A uppmax2026-1-61
#SBATCH --reservation uppmax2026-1-61_7
#SBATCH -J Ricci_Busco
#SBATCH -c 1
#SBATCH -t 00:30:00
#SBATCH --mail-user marco.ricci.evobio@gmail.com
#SBATCH --output=Ricci_Busco.out
#SBATCH --mail-type=ALL

module load BUSCO/5.8.2-gfbf-2024a

busco -i /home/ricci/Genome_analysis_2026/2_masking/1_polishing.fasta.masked -m genome -l viridiplantae_odb10 \
 -o /home/ricci/Genome_analysis_2026/4_Busco


