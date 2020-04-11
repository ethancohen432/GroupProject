library(seqinr)

myFasta <- read.fasta(file = "data/raw_seqs_BB.fna", seqtype = "AA", as.string = TRUE, set.attributes = FALSE)

nam <- names(myFasta)

indexes <- grep("B1285", nam)

sub <- rep(NA, 1170)

for (i in 1:length(indexes)){
  sub[i] <- myFasta[indexes[i]]
}
#names(sub) <- indexes
df <- data.frame(ID = indexes, Seq = paste(sub), stringsAsFactors = FALSE)
#names(df) <- c("ID", "Seq")

#df2 <- df[!is.na(names(df))]

#sub[2]


dna <- sapply(df$Seq, strsplit, split = "")

#df$Seq[1:2]
