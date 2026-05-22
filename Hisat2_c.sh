#!/bin/bash -l
#SBATCH --reservation uppmax2026-1-61_9
#SBATCH -A uppmax2026-1-61
#SBATCH -n 2
#SBATCH -t 15:00:00
#SBATCH -J hisat2_Ricci
#SBATCH --mail-user marco.ricci.evobio@gmail.com
#SBATCH --mail-type=ALL
#SBATCH -o /home/ricci/Genome_analysis_2026/5_gene_prediction/HiSat_RNA_mapping/logs/hisat2_%j.out
#SBATCH -e /home/ricci/Genome_analysis_2026/5_gene_prediction/HiSat_RNA_mapping/logs/hisat2_%j.err

set -e

module load HISAT2/2.2.1-gompi-2024a
module load SAMtools/1.22.1-GCC-13.3.0

ASSEMBLY="/home/ricci/Genome_analysis_2026/2_masking/1_polishing.fasta.masked"
RNA_DIR="/proj/uppmax2026-1-61/Genome_Analysis/2_Zhou_2023/reads/transcriptomic_data"
INDEX_DIR="/home/ricci/Genome_analysis_2026/5_gene_prediction/HiSat_RNA_mapping/index"
BAM_DIR="/home/ricci/Genome_analysis_2026/5_gene_prediction/HiSat_RNA_mapping/bam"
THREADS=2

mkdir -p ${INDEX_DIR} ${BAM_DIR} ${BAM_DIR}/../logs

if [ ! -f "${INDEX_DIR}/niphotrichum_chr3.1.ht2" ]; then
    echo "### Building HISAT2 index"
    hisat2-build -p ${THREADS} ${ASSEMBLY} ${INDEX_DIR}/niphotrichum_chr3
fi

SAMPLES=(
    "Control_1:${RNA_DIR}/Control_1_f1.fq.gz:${RNA_DIR}/Control_1_r2.fq.gz"
    "Control_2:${RNA_DIR}/Control_2_f1.fq.gz:${RNA_DIR}/Control_2_r2.fq.gz"
    "Control_3:${RNA_DIR}/Control_3_f1.fq.gz:${RNA_DIR}/Control_3_r2.fq.gz"
    "Heat_1:${RNA_DIR}/Heat_treated_42_12h_1_f1.fq.gz:${RNA_DIR}/Heat_treated_42_12h_1_r2.fq.gz"
    "Heat_2:${RNA_DIR}/Heat_treated_42_12h_2_f1.fq.gz:${RNA_DIR}/Heat_treated_42_12h_2_r2.fq.gz"
    "Heat_3:${RNA_DIR}/Heat_treated_42_12h_3_f1.fq.gz:${RNA_DIR}/Heat_treated_42_12h_3_r2.fq.gz"
)

for SAMPLE in "${SAMPLES[@]}"; do
    NAME=$(echo $SAMPLE | cut -d: -f1)
    R1=$(echo $SAMPLE | cut -d: -f2)
    R2=$(echo $SAMPLE | cut -d: -f3)

    echo "### Aligning ${NAME}"

    # Pipeline senza .sam
    hisat2 -p ${THREADS} --dta \
        -x ${INDEX_DIR}/niphotrichum_chr3 \
        -1 ${R1} \
        -2 ${R2} \
        2> ${BAM_DIR}/${NAME}_hisat2.log \
    | samtools sort -@ ${THREADS} -o ${BAM_DIR}/${NAME}.sorted.bam

    samtools index ${BAM_DIR}/${NAME}.sorted.bam

    echo "* ${NAME}: $(grep 'overall' ${BAM_DIR}/${NAME}_hisat2.log)"
done

echo "All jobs completed successfully!"

