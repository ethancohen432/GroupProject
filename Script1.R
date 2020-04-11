library(seqinr)
library(Biostrings)
dna <- read.fasta("data/raw_seqs_BB.fna")

OTU_table <- read.delim("data/OTU_file.txt", header = T)


getSequence(dna$B1285_1)  # How to get just the sequence of one read from one person. 

dna$B1285

subset <- grep("B1285", myFasta)
subset

myFasta <- read.fasta(file = "data/raw_seqs_BB.fna", seqtype = "AA", as.string = TRUE, set.attributes = FALSE)
myFasta[7]
nam <- names(myFasta)
nam

indexes <- grep("B1285", nam)

sub <- rep(NA, 1170)

for (i in 1:length(indexes)){
  sub[i] <- myFasta[indexes[i]]
}

df <- data.frame(ID = indexes, Seq = sub)
names(df) <- c("ID", "Seq")

df2 <- df[!is.na(names(df))]

library(dplyr)

df2 <- select(df, ID, Seq)
