#! /bin/bash

export SLINKERDIR=~/Desktop/Slinker;
export PATH=~/Desktop/Slinker/tools/bpipe-0.9.9.9/bin/:$PATH;


# case=$(ls /raid/bioinformatics/olik_slinker_file/test/*.bam)
case="/raid/bioinformatics/olik_slinker_file/test/19-5325_1_Aligned.sortedByCoord.out.bam"
# gene="BUD13"
gene="SUPT7L"
genome=19
# results=/raid/bioinformatics/olik_slinker_file/output
results=/raid/bioinformatics/olik_slinker_file/output/
threads=4
samples="/raid/bioinformatics/olik_slinker_file/test/*.bam"
ref_fasta=/raid/bioinformatics/olik_slinker_file/reference/hg19.p13.plusMT.no_alt_analysis_set.fa
ref_gtf=/raid/bioinformatics/olik_slinker_file/reference/hg19.ncbiRefSeq.gtf

# Needs to have set up terminal variables $SLINKERDIR and $PATH (to include slinker)
# see https://github.com/Oshlack/Slinker/wiki/1a.-Semi-automated-Installation
# also note, that slinker & canvas need to be insalled via pip: see 'dependencies_linux64.sh'

# test
# bpipe -p case_sample=$SLINKERDIR/tests/unhealthy_Aligned.sortedByCoord.out.bam -p gene=ETV6 -p genome=19 -p a_mem=20000000000 -p g_mem=20000000000 -p results=$results -p threads=4 $SLINKERDIR/workflows/slinker.groovy $SLINKERDIR/tests/*.bam
# real data
bpipe -p case_sample=$case -p gene=$gene -p a_mem=20000000000 -p g_mem=20000000000 -p results=$results -p threads=$threads -p fasta=$ref_fasta -p gtf=$ref_gtf $SLINKERDIR/workflows/slinker.groovy $samples