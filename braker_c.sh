#!/bin/bash -l
#SBATCH --reservation uppmax2026-1-61_10
#SBATCH -A uppmax2026-1-61
#SBATCH -c 8
#SBATCH --mem=96G
#SBATCH -t 50:00:00
#SBATCH -J braker3_Ricci
#SBATCH --mail-user=marco.ricci.evobio@gmail.com
#SBATCH --mail-type=ALL
#SBATCH -o /home/ricci/Genome_analysis_2026/5_gene_prediction/BRAKER/logs/braker3_%j.out
#SBATCH -e /home/ricci/Genome_analysis_2026/5_gene_prediction/BRAKER/logs/braker3_%j.err

set -euo pipefail

# -----------------------------
# PATHS
# -----------------------------
ASSEMBLY="/home/ricci/Genome_analysis_2026/2_masking/1_polishing.fasta.masked"
BAM_DIR="/home/ricci/Genome_analysis_2026/5_gene_prediction/HiSat_RNA_mapping/bam"
OUT_DIR="/home/ricci/Genome_analysis_2026/5_gene_prediction/BRAKER"
PROT_FASTA="/home/ricci/Genome_analysis_2026/5_gene_prediction/BRAKER/C_purpureus.faa"
THREADS=8

mkdir -p ${OUT_DIR} ${OUT_DIR}/logs

# -----------------------------
# RACCOLTA AUTOMATICA DEI BAM
# -----------------------------
BAM_FILES=$(ls ${BAM_DIR}/*.bam | tr '\n' ',' | sed 's/,$//')

echo "### BAM files trovati:"
echo ${BAM_FILES}

# -----------------------------
# RUN BRAKER3 inside Singularity
# -----------------------------
singularity exec \
    -B /home/ricci:/home/ricci \
    -B /proj/uppmax2026-1-61:/proj/uppmax2026-1-61 \
    /crex/proj/uppmax2026-1-61/Genome_Analysis/2_Zhou_2023/braker3.sif \
    bash -c "
        export AUGUSTUS_CONFIG_PATH=/home/ricci/bin/augustus_config

        braker.pl \
            --genome=${ASSEMBLY} \
            --bam=${BAM_FILES} \
            --prot_seq=${PROT_FASTA} \
            --species=niphotrichum_japonicum \
            --softmasking \
            --threads=${THREADS} \
            --workingdir=${OUT_DIR} \
            --gff3
    "

echo '### BRAKER3 completato'
