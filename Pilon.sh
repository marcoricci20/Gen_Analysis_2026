#!/bin/bash -l
#SBATCH -A uppmax2025-2-421
#SBATCH -M pelle
#SBATCH -c 2
#SBATCH -t 24:00:00
#SBATCH -J Ricci_Pilon
#SBATCH --mail-type=ALL
#SBATCH --mail-user marco.ricci.evobio@gmail.com
#SBATCH --output=Ricci_Pilon.out



module load Pilon/1.24
java -Xmx8G -jar $EBROOTPILON/pilon.jar --genome /home/ricci/Genome_analysis_2026/Nanopore/BWA/assembly.fasta --frags /home/ricci/Genome_analysis_2026/Nanopore/BWA/sorted_DNA_reads.bam --output /home/ricci/Genome_analysis_2026/1_polishing --changes
