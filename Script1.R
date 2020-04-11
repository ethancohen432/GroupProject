library(seqinr)
dna <- read.fasta("data/raw_seqs_BB.fna")

OTU_table <- read.delim("data/OTU_file.txt", header = T)
