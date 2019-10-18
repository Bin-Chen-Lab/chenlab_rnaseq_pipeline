#! /usr/bin/perl

use strict;
my $srr_id      = $ARGV[0];


my $STAR_INDEX           = "index/STAR";
my $RSEM_INDEX           = "index/RSEM/hg38.RSEM.index";

my $star_option = "--runThreadN 8  --quantMode TranscriptomeSAM  --outSAMtype BAM Unsorted --outSAMunmapped Within  --outSAMattributes NH   HI   NM   MD   AS  --outFilterType BySJout  --outFilterMultimapNmax 20 --outFilterMismatchNmax 999 --outFilterMismatchNoverReadLmax 0.04   --alignIntronMin 20  --alignIntronMax 1000000   --alignMatesGapMax 1000000 --alignSJoverhangMin 8   --alignSJDBoverhangMin 1   --sjdbScore 1  ";

my $map_cmd;
my $rsem_cmd;


`mkdir  ./tmp/${srr_id}` if (! -e "./tmp/${srr_id}");
if (-e "fastq/${srr_id}_2.fastq" ){
        $map_cmd    = "STAR --genomeDir $STAR_INDEX $star_option --outFileNamePrefix  ./tmp/${srr_id}/  --readFilesIn fastq/${srr_id}_1.fastq  fastq/${srr_id}_2.fastq";
        $rsem_cmd = "rsem-calculate-expression --no-bam-output --quiet --no-qualities -p 8 --forward-prob 0.5 --seed-length 25 --fragment-length-mean -1.0  --bam --paired-end  tmp/${srr_id}/Aligned.toTranscriptome.out.bam    $RSEM_INDEX   RSEM.output/${srr_id}" ;
    }else{
        $map_cmd    = "STAR --genomeDir $STAR_INDEX $star_option --outFileNamePrefix  ./tmp/${srr_id}/  --readFilesIn fastq/${srr_id}_1.fastq";
        $rsem_cmd = "rsem-calculate-expression --no-bam-output --quiet --no-qualities -p 8 --forward-prob 0.5 --seed-length 25 --fragment-length-mean -1.0  --bam               tmp/${srr_id}/Aligned.toTranscriptome.out.bam   $RSEM_INDEX   RSEM.output/${srr_id} " ;
    }
if(! -e "RSEM.output/$srr_id.genes.results"){
    `$map_cmd`;
    `$rsem_cmd`;
}

}
print "${srr_id} finished!\n";












