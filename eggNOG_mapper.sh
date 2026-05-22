#!/bin/bash -l
#SBATCH --reservation uppmax2026-1-61_10
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
# PATHS
# -----------------------------
INPUT="/home/ricci/Genome_analysis_2026/2_masking/1_polishing.fasta.masked"
OUTDIR="/home/ricci/Genome_analysis_2026/5_gene_prediction/eggNOGmapper"


mkdir -p ${OUTDIR}

# -----------------------------
# RUN eggNOG-mapper
# -----------------------------
emapper.py \
    -i ${INPUT} \
    -o niphotrichum_annotation \
    --output_dir ${OUTDIR} \
    --cpu ${THREADS} \
    --itype genome \
    --data_dir /sw/data/eggnog-mapper/2.1.13 \
    --override \
    --annotate_hits_table \
    --go_evidence non-electronic \
    --excel

echo "### eggNOG-mapper completato"
