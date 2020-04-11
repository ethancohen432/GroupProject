library(seqinr)
library(ape)

myFasta <- read.fasta(file = "data/raw_seqs_BB.fna", seqtype = "AA", as.string = TRUE, set.attributes = FALSE)

nam <- names(myFasta)

indexes <- grep("B1285", nam)

sub <- rep(NA, 1170)

for (i in 1:length(indexes)){
  sub[i] <- myFasta[indexes[i]]
}

df <- data.frame(ID = indexes, Seq = sub, stringsAsFactors = FALSE)
names(df) <- c("ID", "Seq")

df2 <- df[!is.na(names(df))]

dna <- sapply(df2$Seq, strsplit, split = "")



