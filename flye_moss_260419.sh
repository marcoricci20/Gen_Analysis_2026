#!/bin/bash -l
#SBATCH -A uppmax2026-1-61
#SBATCH -M pelle
#SBATCH -n 1
#SBATCH --mem=90G
#SBATCH -t 60:00:00
#SBATCH -J Ricci_Flye1
#SBATCH --mail-type=ALL
#SBATCH --mail-user marco.ricci.evobio@gmail.com
#SBATCH --output=/home/ricci/Genome_analysis_2026/Nanopore%j.out
#SBATCH --error=/home/ricci/Genome_analysis_2026/Nanopore%j.err

module load Flye/2.9.6

INDIR=/proj/uppmax2026-1-61/Genome_Analysis/2_Zhou_2023/reads/genomics_chr3_data/
OUTDIR=/home/ricci/Genome_analysis_2026/Nanopore/260419
mkdir -p $OUTDIR
THREADS=1

flye --genome-size 16m --nano-raw $INDIR/chr3_clean_nanopore.fq.gz --out-dir $OUTDIR --threads $THREADS --asm-coverage 40
