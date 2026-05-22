#!/bin/bash -l
#SBATCH -A uppmax2026-1-61
#SBATCH -M pelle
#SBATCH -c 2
#SBATCH -t 15:00:00
#SBATCH -J Ricci_BWA_DNA
#SBATCH --mail-type=ALL
#SBATCH --mail-user marco.ricci.evobio@gmail.com
#SBATCH --output=Ricci_BWA_DNA.out
#SBATCH --error=/home/ricci/Genome_analysis_2026/bWA.err

module load bwa-mem2/2.3-GCC-13.3.0 SAMtools/1.22.1-GCC-13.3.0 

#index the long read assembly mem2 faster
bwa-mem2 index /home/ricci/Genome_analysis_2026/Nanopore/BWA/assembly.fasta

#map short reads to the assembly

bwa-mem2 mem /home/ricci/Genome_analysis_2026/Nanopore/BWA/assembly.fasta \
/home/ricci/Genome_analysis_2026/Nanopore/BWA/paired_trimmed_1.fastq.gz \
/home/ricci/Genome_analysis_2026/Nanopore/BWA/paired_trimmed_2.fastq.gz \
/home/ricci/Genome_analysis_2026/Nanopore/BWA/unpaired_trimmed_1.fastq.gz \
/home/ricci/Genome_analysis_2026/Nanopore/BWA/unpaired_trimmed_2.fastq.gz > /home/ricci/Genome_analysis_2026/Nanopore/BWA/mapped_DNA_reads.sam

# convert SAM files to BAM files

samtools view -bS mapped_DNA_reads.sam > mapped_DNA_reads.bam

# sort and index the mapped_reads_wt.bam

samtools sort mapped_DNA_reads.bam -o sorted_DNA_reads.bam
samtools index sorted_DNA_reads.bam
