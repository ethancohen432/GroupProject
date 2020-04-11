library(seqinr)
library(ape)

myFasta <- read.fasta(file = "data/raw_seqs_BB.fna", seqtype = "AA", as.string = TRUE, set.attributes = FALSE)

nam <- names(myFasta)

indexes <- grep("B1285", nam)

sub <- rep(NA, 1170)

for (i in 1:length(indexes)){
  sub[i] <- myFasta[indexes[i]]
}

#New (From when you left)
df <- data.frame(ID = as.factor(indexes), Seq = paste(sub), stringsAsFactors = FALSE)
dna <- sapply(df$Seq, strsplit, split = "")

#Changing the names to indices
names(dna) <- paste(1:nrow(df),df$ID,sep="_")

#Making the DNA.bin
dna_bin <- as.DNAbin(dna)

#MUSCLE alignment
dna_align <- muscle(dna_bin,quiet=F)

#Checking out some characteristics of the alignment
checkAlignment(dna_align, what = 1)
checkAlignment(dna_align,what=2)
checkAlignment(dna_align,what=3)

dnaDM<-dist.dna(dna_align, model="K80")
class(dnaDM)
length(dnaDM)

dnaDMmat<-as.matrix(dnaDM)
dim(dnaDMmat)

library(reshape2)
PDat<-melt(dnaDMmat)
dim(PDat)

library(ggplot2)
ggplot(data = PDat, aes(x=Var1, y=Var2, fill=value)) + geom_tile()

#Tree building
dnaTree<-nj(dnaDM)
str(dnaTree)

library(ggtree)
ggtree(dnaTree,branch.length='none') 

pdf(width=20,height=10)
ggtree(dnaTree, branch.length='none')
dev.off()


#Reducing the values
head(PDat[PDat$value>0.15,])
PDat2<-PDat
PDat2$value[PDat2$value>0.15]<-NA
ggplot(data = PDat, aes(x=Var1, y=Var2, fill=value)) + geom_tile()


#Everything that got deleted
df <- data.frame(ID = as.factor(indexes), Seq = paste(sub), stringsAsFactors = FALSE)
names(df) <- c("ID", "Seq")

dna <- sapply(df$Seq, strsplit, split = "")
names(dna) <- paste(1:nrow(df),df$ID,sep="_")

DNAbin<-as.DNAbin(dna)
DAlign<-muscle(DNAbin,quiet = FALSE)

checkAlignment(DAlign[1:6,1:475])

DM <- dist.dna(DAlign,model='K80')
?dist.dna

DMat<-as.matrix(DM)

library(reshape2)
library(ggplot2)
PDat<-melt(DMat)
ggplot(data = PDat, aes(x=Var1, y=Var2, fill=value)) + 
  geom_tile() 

PDat2<-PDat
PDat2$value[PDat2$value>0.2]<-NA

ggplot(data = PDat2, aes(x=Var1, y=Var2, fill=value)) + geom_tile() 

