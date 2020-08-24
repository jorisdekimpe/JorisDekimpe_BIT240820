
##question 1
select gene_name, (seq_region_end-seq_region_start) as lenght from gene order by lenght limit 1;
##question 2
select gene_name, count(transcript_id) as number_of_transcripts from gene join transcript on gene.gene_id = transcript.gene_id group by gene_name order by number_of_transcripts desc limit 1;
##question 3
select chromosome, count(gene_id) as amount from gene where description like "%cancer%" group by chromosome order by amount DESC;
select chromosome, count(exon_id) as amount from gene join transcript on gene.gene_id = transcript.gene_id join exon_transcript on transcript.transcript_id = exon_transcript.transcript_id where chromosome like "9" group by chromosome; 
##question 4
select count(*) from exon;
select count(*) from exon_transcript;