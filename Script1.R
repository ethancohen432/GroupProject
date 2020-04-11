library(seqinr)
dna <- read.fasta("data/raw_seqs_BB.fna")

OTU_table <- read.delim("data/OTU_file.txt", header = T)


getSequence(dna$B1285_1)  # How to get just the sequence of one read from one person. 
