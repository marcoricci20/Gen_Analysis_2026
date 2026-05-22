#!/bin/bash -l
#SBATCH --reservation uppmax2026-1-61_11
#SBATCH -A uppmax2026-1-61
#SBATCH -c 4
#SBATCH --mem=64G
#SBATCH -t 24:00:00
#SBATCH -J eggNOG_Ricci
#SBATCH --mail-user=marco.ricci.evobio@gmail.com
#SBATCH --mail-type=ALL
#SBATCH -o /home/ricci/Genome_analysis_2026/5_gene_prediction/eggNOGmapper/eggnog_%j.out
#SBATCH -e /home/ricci/Genome_analysis_2026/5_gene_prediction/eggNOGmapper/eggnog_%j.err

set -euo pipefail

# -----------------------------
# MODULE
# -----------------------------
module load eggnog-mapper/2.1.13-gfbf-2024a

# -----------------------------
# THREADS
# -----------------------------
THREADS=$SLURM_CPUS_PER_TASK

# -----------------------------
# PATHS
# -----------------------------
INPUT="/home/ricci/Genome_analysis_2026/5_gene_prediction/BRAKER/C_purpureus.faa"
OUTDIR="/home/ricci/Genome_analysis_2026/5_gene_prediction/eggNOGmapper"

mkdir -p ${OUTDIR}

# -----------------------------
# RUN eggNOG-mapper
# -----------------------------
emapper.py \
    -i ${INPUT} \
    -o Cpurpureus_annotation \
    --output_dir ${OUTDIR} \
    --cpu ${THREADS} \
    --itype proteins \
    --override \
    --go_evidence non-electronic \
    --excel

echo "### eggNOG-mapper completato"

