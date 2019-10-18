## Installations/ Requirements

R/3.5.1-X11-20180604

Perl/5.28.1

STAR/2.6.1 (http://labshare.cshl.edu/shares/gingeraslab/www-data/dobin/STAR/Releases/FromGitHub/STAR-2.6.1a/doc/STARmanual.pdf)

Generate index files for STAR and reference genome. Current pipeline uses RSEM-hg38. 
Refer https://deweylab.github.io/RSEM/README.html for the same.


##How to use it?

Your directory should contain a folder named 'fastq' containing all fastq files for samples to be processed (minimum 2 samples).
fastq files should be named as {sample_id}_[12].fastq.For example, fastq files for paired-end RNA Seq sample 'MYC' should be MYC_1.fastq and MYC_2.fastq.

Prepare a text file (usually named 'exp.txt') with each line containing a sample id. Note: line breaks need to be in Unix.

Run the pipeline: chenlab.bulk.rna.seq.pipeline.R exp.txt.
 
Processed data can be found in 'RData' folder after successful completion. 
