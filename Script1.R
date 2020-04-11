library(seqinr)
dna <- read.fasta("data/raw_seqs_BB.fna")

OTU_table <- read.delim("data/OTU_file.txt", header = T)


getSequence(dna$B1285_1)  # How to get just the sequence of one read from one person.

library(Biostrings)
library(seqinr)
library(ape)
s <- readDNAStringSet("data/raw_seqs_BB.fna")


#Attempt
myfasta <- read.fasta(file = "data/raw_seqs_BB.fna", seqtype = "AA",as.string = TRUE, set.attributes = FALSE)
myfasta_df <- as.data.frame(myfasta)

names <- names(myfasta)
B1285Sub <- grep("^B1285", names)
indexes <- grep("^B1285", names)

sub <- rep(NA, 1170)

for (i in 1:length(B1285Sub)){
  sub[i] <- myfasta[B1285Sub[i]]
}

DF <- data.frame (B1285Sub, sub)

dataF <- data.frame (ID=B1285Sub,Seq=sub,stringsAsFactors = FALSE)
colnames(dataF)<-c('ID','Sequence')

dataF<-as.DNAbin(dataF)

library(dplyr)
df <- data.frame(ID = indexes, Seq = sub)
names(df) <- c("ID", "Seq")
Blah <- transmute (df, 'NA')
df2 <- df[!is.na(names(df))]



