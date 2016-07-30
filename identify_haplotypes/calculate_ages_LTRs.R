library(ape)
library(reshape2)
library(stringr)

### need path to where you save the files
filenames=list.files('te_alignments/dateable_LTRs/')

ages=data.frame(tename=str_split_fixed(filenames, '_', 3)[,1])
ages$ybp=NA

## need to switch for path as above
for (f in paste('te_alignments/dateable_LTRs/', filenames, sep='')){
  ltr=read.FASTA(f)
  copies=unique(gsub(".*p_", "", names(ltr)))
#  print(dist.dna(ltr, model='K80', gamma=F)/2/3.3e-8)
  d=melt(as.matrix(dist.dna(ltr, model='K80', gamma=F)/2/3.3e-8), varnames=c('row', 'col'))
  samesies=apply(sapply(copies, function(x) d$row==paste('3p', x, sep='_') & d$col==paste('5p', x, sep='_')), 1, any)
  print(copies)
  print(d[samesies,]$value)
  print(mean(d[samesies,]$value))
  ages$ybp[ages$tename==str_split_fixed(f, '_', 3)[,1]]=mean(d[samesies,]$value)
}

### this outputs a matrix for each comparison of 5 prime LTR - 3 prime LTR distance

