genenames=c('C4', 'F6', 'B2', 'B9', 'E9', 'G11', 'B1', 'B10')

dstart=c(3183,3305,5095,6060,15431,34238,40105,49350,55292,55544,60395,67943,74660,88610)
dend=c(3183,4805,5095,13209,34225,54895,49027,50925,86856,55800,74042,70422,83610,95601)
down=9797

dexonstart=c(1,3354,3568,4309)
dexonend=c(20,3434,3969,4524)

dTE=data.frame(B2= c(T,NA,NA,NA,NA,NA,NA,NA,NA,NA,NA,NA,NA,NA),
               B10=c(F,T,T,NA,NA,NA,NA,NA,NA,NA,NA,NA,NA,NA),
               B1= c(F,F,F,T,F,F,F,F,F,F,F,F,F,F),
               C4= c(F,F,F,F,F,F,F,F,F,F,F,F,F,F),
               F6= c(F,F,F,F,F,T,F,F,T,T,T,F,F,T),
               B9= c(F,F,F,F,F,T,T,T,T,F,F,F,T,T),
               E9= c(F,F,F,F,F,T,T,T,T,F,F,T,F,T),
               G11=c(F,F,F,F,T,F,F,F,T,T,F,F,F,T)
               )
#dpos=c(3183,3305,3595,4560, 6782,6795,6795,6795,7192,7192,7192,7192,7192,8946 )
### !!! changing 7/6/16
dpos=c(3183,3305,3595,4560, 6782,6795,6795,6795,7192,7192,7192,7192,7192,8871 )
dTE=dTE[,c('C4', 'F6', 'B2', 'B9', 'E9', 'G11', 'B1', 'B10')]

plot(dpos, rep(-1,length(dpos)), ylim=c(0,9))
for (i in 1:ncol(dTE)){
  print(i)
  points(dpos*dTE[,i], rep(i, length(dpos)), pch=19, col=2)
#  points(is.na(dTE[,i])*dpos, rep(i, length(dpos)), pch=19, col='red')
  segments(downmissing[,i][1]+gene, i, downmissing[,i][2]+gene, i, col='gray')
  
}


gstart=c(887,5183,7884,10378,24286,26307)
gend=c(3032,22410,8777,19901,26066,28838)
gpos=c(887,3038,3038,3038,4914,5155) ### need to think about how to do nested~ here I just incremented the two 3038 values by 30 bp
#gpos[3]=gpos[3]+50
#gpos[4]=gpos[4]+100
### these are positions on the gene fasta
exonstart=c(1,3095,3344,3593,3825,4047,4284,4540,5006,5163,5360,5551)
exonend=c(420,3268,3415,3739,3948,4156,4445,4733,5087,5267,5464,5718)
gTE=data.frame(B2=c(F,T,T,F,F,F),
               B10=c(T,F,F,F,F,F),
               B1=c(F,T,F,F,F,F),
               C4=c(F,T,F,T,T,F),
               F6=c(NA,NA,NA,F,F,T),
               B9=c(F,T,F,F,F,F),
               E9=c(F,T,F,F,F,F),
               G11=c(F,T,F,F,F,F)
               )

row.names(gTE)=c('rearranged', 'TCACG_ltr', 'LINE_GTACGTGCAATGGT', 'CTTGG_ltr', 'GATAG_ltr', 'LINE_AAATGTACAGATGTCT')
## put in order of kindr complex
gTE=gTE[,c('C4', 'F6', 'B2', 'B9', 'E9', 'G11', 'B1', 'B10')]

plot(gpos, rep(-1,length(gpos)), ylim=c(0,9))
for (i in 1:ncol(gTE)){
  print(i)
  points(gpos*gTE[,i], rep(i, length(gpos)))
  points(is.na(gTE[,i])*gpos, rep(i, length(gpos)), pch=19, col='red')
}


gene=5718



### these are RC relative to the others - number of bp upstream of ATG of kindr
ustart=c(249,253,2072,5795,12181,12483)
uend=c(1249,1045,3277,11223,60000,60000)
upos=c(248,252,1279,3797,4750)
uTE=data.frame(B10=c(T,NA,NA,NA,NA),
               G11=c(F,T,F,NA,NA),
               B1=c(F,T,F,T,F),
               B9=c(F,F,T,F,T),
               E9=c(F,F,T,F,T),
               B2=c(F,F,T,F,T),
               C4=c(F,F,T,F,T),
               F6=c(NA,NA,NA,NA,NA)
)
row.names(uTE)=c('mutator', 'conflicting', 'GTATG_solo', 'CCGGG_ltr', 'ATAAT_ltr')
## put in order of kindr complex
uTE=uTE[,c('C4', 'F6', 'B2', 'B9', 'E9', 'G11', 'B1', 'B10')]
up=4750


## put in same orientation
ustart=60000-ustart
uend=60000-uend



plot(upos, rep(-1,length(upos)), ylim=c(0,9))
for (i in 1:ncol(uTE)){
  print(i)
  points(upos*uTE[,i], rep(i, length(upos)))
  points(is.na(uTE[,i])*upos, rep(i, length(upos)), pch=19, col='red')
}



### NA samples

genemissing=data.frame(F6=c(1,2907))
downmissing=data.frame(B2=c(3183,9797),
                     B10=c(3595,9797),
                     B9=c(8871,9797))
upmissing=data.frame(F6=c(1,4750),
                     B10=c(1,4502),
                     G11=c(1,1558))
upmissing=upmissing-up
#allTE=rbind(uTE[rev(rownames(uTE)),], gTE, dTE)
#allpos=c(upos-up, gpos, gene+dpos)
### FIXED ! ! ! 7/6/16
allTE=rbind(uTE[rev(rownames(uTE)),], gTE, dTE)
allpos=c(rev(-upos), gpos, gene+dpos)

for (i in genenames){
  if (!i %in% colnames(genemissing)){
    genemissing[,i]=c(NA,NA)
  }
  if (!i %in% colnames(downmissing)){
    downmissing[,i]=c(NA,NA)
  }
  if (!i %in% colnames(upmissing)){
    upmissing[,i]=c(NA,NA)
  }
}
genemissing=genemissing[,genenames]
downmissing=downmissing[,genenames]
upmissing=upmissing[,genenames]



### put in as missing data and don't plot NA
allTE[allTE==F]=NA

### get parsimony informative snps ready
snps=read.csv('parsimony_informative_ALL_UP-GENE-DOWN.csv', header=T, colClasses='character')

snppos=as.numeric(colnames(snps)[-1])  ## first is the sequence names
snps=t(snps)
snps=snps[,genenames]
snps[snps=='-']=NA
snpcol=snps
snpcol[snpcol=='C' | snpcol=='c']='blue'
snpcol[snpcol=='G' | snpcol=='g']='black'
snpcol[snpcol=='T' | snpcol=='t']='green'
snpcol[snpcol=='A' | snpcol=='a']='red'

plot(c(max(upos)-upos, max(upos)+gpos, max(upos)+max(gpos)+dpos), rep(-1, length(c(upos, gpos, dpos))), ylim=c(0,9), yaxt='n', xlim=c(-5000, 15000))
axis(2, at=1:8, labels=genenames, las=1)

## if positons are the same at adjacent tE sites, consider each as nested. elevate in plotting by this value
nestelev=allpos[-length(allpos)]==allpos[-1]
nestelev=nestelev/5
nestelev=c(nestelev, 0)

nestelev=c(0,0,0,0,0,
           0,0,1,1,0,0,
           0,0,0,0,0,0,1,1,0,1,1,1,1,0)
nestelev=nestelev/5

nestx=c(0,0,0,0,0,
        0,0,-50,50,0,0,
        0,0,0,0,0,0,-50,50,0,-100,-50,50,100,0)

#### solo LTRs differentiated
tetype=c('ltr', 'ltr', 'sololtr', 'unknown', 'mu', 'unknown', 'line', 'line', 'ltr', 'ltr', 'line', 'line', 'line', 'line', 'unknown', 'unknown', 'ltr', 'ltr', 'unknown', 'sololtr', 'unknown', 'unknown', 'sololtr', 'ltr', 'ltr')
tecol=tetype
tecol[tecol=='line']='darkgreen'
tecol[tecol=='mu']='blue'
tecol[tecol=='unknown']='brown'
tecol[tecol=='ltr']='red'
tecol[tecol=='sololtr']='magenta'

tecol=adjustcolor(tecol, alpha.f=0.7)
teage=c(316983.2, 475862, NA,NA,NA, NA, NA, NA, 34678.31, 227859.5, NA, NA, NA, NA, NA, NA, 71380.04, 31077.52, NA, NA, NA, NA,NA,0,355686.6)

for (i in 1:ncol(allTE)){
#  points(is.na(allTE[,i])*allpos, rep(i, length(allpos)))
  segments(upmissing[,i][1], i, upmissing[,i][2], i, col='gray')
  segments(downmissing[,i][1]+gene, i, downmissing[,i][2]+gene, i, col='gray')
  segments(genemissing[,i][1], i, genemissing[,i][2], i, col='gray')
  points(snppos-up, rep(i, length(snppos)), pch='|', cex=0.4, col=snpcol[,i])
  points(allpos*allTE[,i], rep(i, length(allpos))+0.25, pch=25, col=tecol, bg=tecol)
}


segments(exonstart, rep(0, length(exonstart)), exonend, rep(0,length(exonend)), col='blue', lwd=2)
## then for the noncoding portions of exons
segments(dexonstart+gene, rep(0,length(dexonstart)), dexonend+gene, rep(0, length(dexonstart)), col='green', lwd=2)
segments(-150,0,0,0, col='green', lwd=2)







rmin=data.frame(start=c(1,7891,11751,17377,18004,18105,18886,19364)-up, end=c(2669,8939,14606,17881,18071,18671,19175,20265)-up)
abline(v=rmin$start, col='purple', lty=2)
abline(v=rmin$end, col='orange', lty=2)





## make sure to compare only uppercase!
haps=data.frame(toupper(snps))

haps[,2]=haps[,2]==haps[,1]
haps[,3]=haps[,3]==haps[,1]
haps[,4]=haps[,4]==haps[,1]
haps[,5]=haps[,5]==haps[,1]
haps[,6]=haps[,6]==haps[,1]
haps[,7]=haps[,7]==haps[,1]
haps[,8]=haps[,8]==haps[,1]
haps[,1]=T

## kind of dumb but I'm going to hard code it by hand
## so dumb
c4f6=haps$C4==haps$F6
c4b2=haps$C4==haps$B2
c4b9=haps$C4==haps$B9
c4e9=haps$C4==haps$E9
c4g11=haps$C4==haps$G11
c4b1=haps$C4==haps$B1
c4b10=haps$C4==haps$B10
f6b2=haps$F6==haps$B2
f6b9=haps$F6==haps$B9
f6e9=haps$F6==haps$E9
f6g11=haps$F6==haps$G11
f6b1=haps$F6==haps$B1
f6b10=haps$F6==haps$B10
b2b9=haps$B2==haps$B9
b2e9=haps$B2==haps$E9
b2g11=haps$B2==haps$G11
b2b1=haps$B2==haps$B1
b2b10=haps$B2==haps$B10
b9e9=haps$B9==haps$E9
b9g11=haps$B9==haps$G11
b9b1=haps$B9==haps$B1
b9b10=haps$B9==haps$B10
e9g11=haps$E9==haps$G11
e9b1=haps$E9==haps$B1
e9b10=haps$E9==haps$B10
g11b1=haps$G11==haps$B1
g11b10=haps$G11==haps$B10
b1b10=haps$B1==haps$B10

pairwise=list(c4f6=c4f6,
              c4b2=c4b2,
              c4b9=c4b9,
              c4e9=c4e9,
              c4g11=c4g11,
              c4b1=c4b1,
              c4b10=c4b10,
              f6b2=f6b2,
              f6b9=f6b9,
              f6e9=f6e9,
              f6g11=f6g11,
              f6b1=f6b1,
              f6b10=f6b10,
              b2b9=b2b9,
              b2e9=b2e9,
              b2g11=b2g11,
              b2b1=b2b1,
              b2b10=b2b10,
              b9e9=b9e9,
              b9g11=b9g11,
              b9b1=b9b1,
              b9b10=b9b10,
              e9g11=e9g11,
              e9b1=e9b1,
              e9b10=e9b10,
              g11b1=g11b1,
              g11b10=g11b10,
              b1b10=b1b10)
## get runs
#pairwise=lapply(pairwise, rle)

pairwise=list(
  c4f6=c4f6,
  c4b2=c4b2,
  c4b9=c4b9,
  c4e9=c4e9,
  c4g11=c4g11,
  c4b1=c4b1,
  c4b10=c4b10
)


## maybe we want the tree structure on the left side?
library(ape)
tree=read.tree(file='~/Dropbox/ab10/tree_fixing_root_to12mya/kindr_cds.frombac.withkin11.notga.maizeingroup.12mya.strict.mcc.newick')
kindr=drop.tip(tree, "Sorghum_bicolor_XM_002461259")
kindr=drop.tip(kindr, "Zea_mays_Kin11_NM_001305870")
kindr$edge.length=kindr$edge.length/100000
#par(new=TRUE)


#pdf('~/Downloads/kindr_haplotype_blocks.pdf', 15,5)
#pdf('~/Downloads/kindr_haplotype_blocks.tree.pdf', 10,4)

### we want to add a tree to the left side
layout(matrix(c(0,1,0,2,2,2), nrow=3), widths=c(0.1,0.9), heights=c(0.132,0.78,0.075))
#par(mar=c(5.1,0.1,4.1,0.1))
par(mar=c(5.1,0.1,4.1,0))
plot.phylo(kindr, show.tip.label=F)
obj <- get("last_plot.phylo", envir = .PlotPhyloEnv)
x <- obj$xx[1:obj$Ntip]
y <- obj$yy[1:obj$Ntip]

par(mar=c(5.1,0,4.1,2.1))
######

#source('~/Dropbox/ab10/plot.phylo.XLIM.R')
#par(new = TRUE)
#plot.phylo.XLIM(kindr, xlimrange=c(-5000,-4000))
#plot.phylo.XLIM(kindr, xlimrange=c(0,200), y.lim=10 show.tip.label=F, add=T)

#par(new=T)

#plot.phylo(kindr, show.tip.label=F, x.lim=20000)
## plot all pairwise comparisons
plotpos=snppos-up
#plotpos=c(-up, plotpos)
#plot(c(max(upos)-upos, max(upos)+gpos, max(upos)+max(gpos)+dpos), rep(-1, length(c(upos, gpos, dpos))), ylim=c(0,length(pairwise)+1), yaxt='n', xlim=c(-5000, 15000))
plot(c(max(upos)-upos, max(upos)+gpos, max(upos)+max(gpos)+dpos), rep(-1, length(c(upos, gpos, dpos))), ylim=c(0,10), yaxt='n', xlim=c(-5000, 15000),
     bty='n', xlab='', ylab='', cex.axis=0.6, mgp = c(3, .3, 0))
#axis(2, at=1:8, labels=genenames, las=1)
## put down just the 1 C4 haplotype
segments(-up, 1, gene+down, 1, lwd=8, col='purple', lend=1)
i=0
#sapply(1:length(pairwise), function(i){
sapply(1:7, function(i){
#  print(x)
#  x=lapply(pairwise, inverse.rle)[[i]]
  x=pairwise[[i]]
#  i=i/10
  print(i)
  i=i+1
  print(i)
#### add in missing here
#  segments(plotpos[which(is.na(x))], rep(i, length(which(is.na(x)))), plotpos[which(is.na(x))+1], rep(i, length(which(is.na(x)))), lwd=4, col='gray', lend=1, lty=1)
  
#  segments(plotpos[which(is.na(x))[-1]], rep(i, length(which(is.na(x)))-1), plotpos[which(is.na(x))[-length(which(is.na(x)))]], rep(i, length(which(is.na(x)))-1), lwd=4, col='gray', lend=1, lty=1)
  
#  ((plotpos[which(is.na(x))]+plotpos[which(is.na(x))+1])/2)[2:59]==((plotpos[which(is.na(x))+1]+plotpos[which(is.na(x))+2])/2)[1:58]
### doing from previous to next
#  segments(plotpos[which(x)], rep(i, length(which(x))), plotpos[which(x)+1], rep(i, length(which(x))), lwd=8, col='purple', lend=1)
#  segments(plotpos[which(!x)], rep(i, length(which(!x))), plotpos[which(!x)+1], rep(i, length(which(!x))), lwd=8, col='orange', lend=1)
  if(which(x)[1]==1){
    startmatch=(c(-up,plotpos[(which(x)-1)[-1]])+plotpos[which(x)])/2
    endmatch=(plotpos[which(x)+1]+plotpos[which(x)])/2
  }  else{
    startmatch=(plotpos[which(x)-1]+plotpos[which(x)])/2
    endmatch=(plotpos[which(x)+1]+plotpos[which(x)])/2
  }
  if(sum(is.na(x[which(x)+1]))>0){
    endpos=which(is.na(x[which(x)+1]))
    endmatch[endpos]=downmissing[1,i]+gene
  }
  if(which(!x)[1]==1){
    startnmatch=(c(-up,plotpos[(which(!x)-1)[-1]])+plotpos[which(!x)])/2
    endnmatch=(plotpos[which(!x)+1]+plotpos[which(!x)])/2
  }  else{
    startnmatch=(plotpos[which(!x)-1]+plotpos[which(!x)])/2
    endnmatch=(plotpos[which(!x)+1]+plotpos[which(!x)])/2
  }
  if(sum(is.na(x[which(!x)+1]))>0){
    endpos=which(is.na(x[which(!x)+1]))
    endnmatch[endpos]=downmissing[1,i]+gene
  }
  segments(startmatch, rep(i, length(which(x))), endmatch, rep(i, length(which(x))), lwd=8, col='purple', lend=1)
  segments(startnmatch, rep(i, length(which(!x))), endnmatch, rep(i, length(which(!x))), lwd=8, col='orange', lend=1)
  
#  segments((plotpos[which(x)-1]+plotpos[which(x)])/2, rep(i, length(which(x))), (plotpos[which(x)+1]+plotpos[which(x)])/2, rep(i, length(which(x))), lwd=8, col='purple', lend=1)
#  segments((plotpos[which(!x)-1]+plotpos[which(!x)])/2, rep(i, length(which(!x))), (plotpos[which(!x)+1]+plotpos[which(!x)])/2, rep(i, length(which(!x))), lwd=8, col='orange', lend=1)
###### turning off july 6 2016 and trying again ABOVE
#  segments((plotpos[which(x)[-1]]+plotpos[which(x)[-1]-1])/2, rep(i, length(which(x))-1), (plotpos[which(x)[-1]+1]+plotpos[which(x)[-1]])/2, rep(i, length(which(x))-1), lwd=8, col='purple', lend=1)
#  segments((plotpos[which(!x)[-1]]+plotpos[which(!x)[-1]-1])/2, rep(i, length(which(!x)-1)), (plotpos[which(!x)[-1]+1]+plotpos[which(!x)[-1]])/2, rep(i, length(which(!x)-1)), lwd=8, col='orange', lend=1)
#### add in missing here
#  segments(plotpos[which(is.na(x))], rep(i, length(which(is.na(x)))), plotpos[which(is.na(x))+1], rep(i, length(which(is.na(x)))), lwd=4, col='gray', lend=1, lty=1)
#  ((plotpos[which(is.na(x))]+plotpos[which(is.na(x))+1])/2)[2:59]==((plotpos[which(is.na(x))+1]+plotpos[which(is.na(x))+2])/2)[1:58]
#### add in the boundaries
## extend haplotypes to missing data start
  
## extend haplotypes to terminii
  if (!is.na(x[1])){
              if (x[1]==T){
               segments(-up, i, (plotpos[1]+plotpos[2])/2, i, lwd=8, col='purple', lend=1)
              } else if (x[1]==F){
               segments(-up, i, (plotpos[1]+plotpos[2])/2, i, lwd=8, col='orange', lend=1)
              }
       }
  if (!is.na(x[length(x)])){
              if (x[length(x)]==T){
               segments((plotpos[length(x)]+plotpos[length(x)-1])/2, i, gene+down, i, lwd=8, col='purple', lend=1)
              } else if (x[length(x)]==F){
               segments((plotpos[length(x)]+plotpos[length(x)-1])/2, i, gene+down, i, lwd=8, col='orange', lend=1)
              }
       }
#    if (is.na(x[1])){
#       segments(-up, i, plotpos[1], i, lwd=4, col='gray', lend=1, lty=1)
#    }
#  if(sum(is.na(x))>0){
#    firstna=which(is.na(x))[1]
#    lastna=which(is.na(x))[length(which(is.na(x)))]
#    if (x[firstna])
#  }

    }
)

## pop in TEs
for (i in 1:ncol(allTE)){
  #  points(is.na(allTE[,i])*allpos, rep(i, length(allpos)))
  segments(upmissing[,i][1], i, upmissing[,i][2], i, col='gray', lend=1, lty=1, lwd=4)
  segments(downmissing[,i][1]+gene, i, downmissing[,i][2]+gene, i, col='gray', lend=1, lty=1, lwd=4)
  segments(genemissing[,i][1], i, genemissing[,i][2], i, col='gray', lend=1, lty=1, lwd=4)
  #  points(snppos-up, rep(i, length(snppos)), pch='|', cex=0.4, col=snpcol[,i])
  points(allpos*allTE[,i]+nestx, rep(i, length(allpos))+0.5+nestelev, pch=25, col=tecol, bg=tecol, cex=2)
  text(allpos*allTE[,i]+nestx, rep(i, length(allpos))+0.15+nestelev, labels=round(teage/1000, digits=0), pos=3, cex=0.5)
  
}



segments(exonstart, rep(0, length(exonstart)), exonend, rep(0,length(exonend)), col='blue', lwd=6, lend=1)
## then for the noncoding portions of exons
segments(dexonstart+gene, rep(0,length(dexonstart)), dexonend+gene, rep(0, length(dexonstart)), col='green', lwd=6, lend=1)
segments(-150,0,0,0, col='green', lwd=6, lend=1)


#text(allpos, rep(9, length(allpos)), labels=round(teage/1000, digits=0), pos=3, srt=90, cex=0.5)
text(rep(-5650, 8), 1:8, labels=genenames, pos=4, cex=0.8)
text(-2000, 0, 'Kindr exons', pos=4, cex=0.8)

legend(14000, 10.4, c('LTR', 'soloLTR', 'LINE', 'Mutator', 'unknown'), col=adjustcolor(c('red', 'magenta', 'darkgreen', 'blue', 'brown'), alpha.f=0.7), pch=25, pt.bg=adjustcolor(c('red', 'magenta', 'darkgreen', 'blue', 'brown'), alpha.f=0.7), cex=0.6, bty='n')

#par(new=T, yaxs='i')
#plot.phylo.XLIM(kindr, xlimrange=c(0,200), show.tip.label=F, add=T)



#############################################################################################
#############
## plot just 3kb up and 3kb down
##############
#pdf('~/Downloads/kindr_haplotype_blocks.3kbflank.pdf', 15,5)
## plot all pairwise comparisons
plotpos=snppos-up
#plotpos=c(-up, plotpos)
#plot(c(max(upos)-upos, max(upos)+gpos, max(upos)+max(gpos)+dpos), rep(-1, length(c(upos, gpos, dpos))), ylim=c(0,length(pairwise)+1), yaxt='n', xlim=c(-5000, 15000))
plot(c(max(upos)-upos, max(upos)+gpos, max(upos)+max(gpos)+dpos), rep(-1, length(c(upos, gpos, dpos))), ylim=c(0,10), yaxt='n', xlim=c(-2500, 13000),
     bty='n', xlab='', ylab='', cex.axis=0.6, mgp = c(3, .3, 0))
#axis(2, at=1:8, labels=genenames, las=1)
## put down just the 1 C4 haplotype
segments(-up, 1, gene+down, 1, lwd=8, col='purple', lend=1)
i=0
#sapply(1:length(pairwise), function(i){
sapply(1:7, function(i){
  #  print(x)
  #  x=lapply(pairwise, inverse.rle)[[i]]
  x=pairwise[[i]]
  #  i=i/10
  print(i)
  i=i+1
  print(i)
  #### add in missing here
  segments(plotpos[which(is.na(x))], rep(i, length(which(is.na(x)))), plotpos[which(is.na(x))+1], rep(i, length(which(is.na(x)))), lwd=4, col='gray', lend=1, lty=1)
  #  ((plotpos[which(is.na(x))]+plotpos[which(is.na(x))+1])/2)[2:59]==((plotpos[which(is.na(x))+1]+plotpos[which(is.na(x))+2])/2)[1:58]
  ### doing from previous to next
  #  segments(plotpos[which(x)], rep(i, length(which(x))), plotpos[which(x)+1], rep(i, length(which(x))), lwd=8, col='purple', lend=1)
  #  segments(plotpos[which(!x)], rep(i, length(which(!x))), plotpos[which(!x)+1], rep(i, length(which(!x))), lwd=8, col='orange', lend=1)
  segments((plotpos[which(x)[-1]]+plotpos[which(x)[-1]-1])/2, rep(i, length(which(x))-1), (plotpos[which(x)[-1]+1]+plotpos[which(x)[-1]])/2, rep(i, length(which(x))-1), lwd=8, col='purple', lend=1)
  segments((plotpos[which(!x)[-1]]+plotpos[which(!x)[-1]-1])/2, rep(i, length(which(!x)-1)), (plotpos[which(!x)[-1]+1]+plotpos[which(!x)[-1]])/2, rep(i, length(which(!x)-1)), lwd=8, col='orange', lend=1)
  #### add in missing here
  #  segments(plotpos[which(is.na(x))], rep(i, length(which(is.na(x)))), plotpos[which(is.na(x))+1], rep(i, length(which(is.na(x)))), lwd=4, col='gray', lend=1, lty=1)
  #  ((plotpos[which(is.na(x))]+plotpos[which(is.na(x))+1])/2)[2:59]==((plotpos[which(is.na(x))+1]+plotpos[which(is.na(x))+2])/2)[1:58]
  #### add in the boundaries
  ## extend haplotypes to missing data start
  
  ## extend haplotypes to terminii
  if (!is.na(x[1])){
    if (x[1]==T){
      segments(-up, i, plotpos[1], i, lwd=8, col='purple', lend=1)
    } else if (x[1]==F){
      segments(-up, i, plotpos[1], i, lwd=8, col='orange', lend=1)
    }
  }
  if (!is.na(x[length(x)])){
    if (x[length(x)]==T){
      segments(plotpos[length(x)], i, gene+down, i, lwd=8, col='purple', lend=1)
    } else if (x[length(x)]==F){
      segments(plotpos[length(x)], i, gene+down, i, lwd=8, col='orange', lend=1)
    }
  }
  if (is.na(x[1])){
    segments(-up, i, plotpos[1], i, lwd=4, col='gray', lend=1, lty=1)
  }
}
)

## pop in TEs
for (i in 1:ncol(allTE)){
  #  points(is.na(allTE[,i])*allpos, rep(i, length(allpos)))
  segments(upmissing[,i][1], i, upmissing[,i][2], i, col='gray')
  segments(downmissing[,i][1]+gene, i, downmissing[,i][2]+gene, i, col='gray')
  segments(genemissing[,i][1], i, genemissing[,i][2], i, col='gray')
  #  points(snppos-up, rep(i, length(snppos)), pch='|', cex=0.4, col=snpcol[,i])
  points(allpos*allTE[,i]+nestx, rep(i, length(allpos))+0.5+nestelev, pch=25, col=tecol, bg=tecol, cex=2)
}



segments(exonstart, rep(0, length(exonstart)), exonend, rep(0,length(exonend)), col='blue', lwd=6, lend=1)
## then for the noncoding portions of exons
segments(dexonstart+gene, rep(0,length(dexonstart)), dexonend+gene, rep(0, length(dexonstart)), col='green', lwd=6, lend=1)
segments(-150,0,0,0, col='green', lwd=6, lend=1)


#text(allpos, rep(9, length(allpos)), labels=teage, pos=3, srt=90, cex=0.5)
#legend(-3300, 8.4, rev(paste('      ', genenames, '         \n\n\n')), cex=0.49, box.lty=0)
rect(-3300, 0, -2300, 9, col='white', border ='white')
text(rep(-2800, 8), 1:8, labels=genenames, pos=4, cex=0.5)
text(-2000, 0, 'Kindr exons', pos=4, cex=0.5)

legend(12000, 10.4, c('LTR', 'soloLTR', 'LINE', 'Mutator', 'unknown'), col=adjustcolor(c('red', 'magenta', 'darkgreen', 'blue', 'brown'), alpha.f=0.7), pch=25, pt.bg=adjustcolor(c('red', 'magenta', 'darkgreen', 'blue', 'brown'), alpha.f=0.7), cex=0.6, bty='n')


#########

### find longest

maxlen=lapply(pairwise, function(x) max(x$lengths))
which.max(unlist(maxlen))



max(rle(com)$lengths)


### go from previous marker to present marker? as these are snps, that means non-identified sites are shared!
segments(plotpos[which(com)-1], rep(1.5, length(which(com))), plotpos[which(com)], rep(1.5, length(which(com))), lwd=3, col='purple')
segments(plotpos[which(!com)-1], rep(1.5, length(which(!com))), plotpos[which(!com)], rep(1.5, length(which(!com))), lwd=3, col='magenta')



### try polarizing by B1




########### 
# COMPLETELY REDO WITH RLE


#pdf('~/Downloads/kindr_haplotype_blocks.pdf', 15,5)
#pdf('~/Downloads/kindr_haplotype_blocks.tree.pdf', 10,4)

### we want to add a tree to the left side
layout(matrix(c(0,1,0,2,2,2), nrow=3), widths=c(0.1,0.9), heights=c(0.132,0.78,0.075))
#par(mar=c(5.1,0.1,4.1,0.1))
par(mar=c(5.1,0.1,4.1,0))
plot.phylo(kindr, show.tip.label=F)
obj <- get("last_plot.phylo", envir = .PlotPhyloEnv)
x <- obj$xx[1:obj$Ntip]
y <- obj$yy[1:obj$Ntip]

par(mar=c(5.1,0,4.1,2.1))
######

#source('~/Dropbox/ab10/plot.phylo.XLIM.R')
#par(new = TRUE)
#plot.phylo.XLIM(kindr, xlimrange=c(-5000,-4000))
#plot.phylo.XLIM(kindr, xlimrange=c(0,200), y.lim=10 show.tip.label=F, add=T)

#par(new=T)

#plot.phylo(kindr, show.tip.label=F, x.lim=20000)
## plot all pairwise comparisons
plotpos=snppos-up
#plotpos=c(-up, plotpos)
#plot(c(max(upos)-upos, max(upos)+gpos, max(upos)+max(gpos)+dpos), rep(-1, length(c(upos, gpos, dpos))), ylim=c(0,length(pairwise)+1), yaxt='n', xlim=c(-5000, 15000))
plot(c(max(upos)-upos, max(upos)+gpos, max(upos)+max(gpos)+dpos), rep(-1, length(c(upos, gpos, dpos))), ylim=c(0,10), yaxt='n', xlim=c(-5000, 15000),
     bty='n', xlab='', ylab='', cex.axis=0.6, mgp = c(3, .3, 0))
#axis(2, at=1:8, labels=genenames, las=1)
## put down just the 1 C4 haplotype
segments(-up, 1, gene+down, 1, lwd=8, col='purple', lend=1)
i=0
#sapply(1:length(pairwise), function(i){
sapply(1:7, function(i){
  #  print(x)
  #  x=lapply(pairwise, inverse.rle)[[i]]
  x=pairwise[[i]]
  #  i=i/10
  print(i)
  i=i+1
  print(i)
  
  for (n in 1:length(rle(x)$lengths)){
    if(is.na(rle(x)$values[n])){
      segments(plotpos[inverse.rle()])
    }
  }
  
  #### add in missing here
  segments(plotpos[which(is.na(x))], rep(i, length(which(is.na(x)))), plotpos[which(is.na(x))+1], rep(i, length(which(is.na(x)))), lwd=4, col='gray', lend=1, lty=1)
  
  #  segments(plotpos[which(is.na(x))[-1]], rep(i, length(which(is.na(x)))-1), plotpos[which(is.na(x))[-length(which(is.na(x)))]], rep(i, length(which(is.na(x)))-1), lwd=4, col='gray', lend=1, lty=1)
  
  #  ((plotpos[which(is.na(x))]+plotpos[which(is.na(x))+1])/2)[2:59]==((plotpos[which(is.na(x))+1]+plotpos[which(is.na(x))+2])/2)[1:58]
  ### doing from previous to next
  #  segments(plotpos[which(x)], rep(i, length(which(x))), plotpos[which(x)+1], rep(i, length(which(x))), lwd=8, col='purple', lend=1)
  #  segments(plotpos[which(!x)], rep(i, length(which(!x))), plotpos[which(!x)+1], rep(i, length(which(!x))), lwd=8, col='orange', lend=1)
  segments((plotpos[which(x)[-1]]+plotpos[which(x)[-1]-1])/2, rep(i, length(which(x))-1), (plotpos[which(x)[-1]+1]+plotpos[which(x)[-1]])/2, rep(i, length(which(x))-1), lwd=8, col='purple', lend=1)
  segments((plotpos[which(!x)[-1]]+plotpos[which(!x)[-1]-1])/2, rep(i, length(which(!x)-1)), (plotpos[which(!x)[-1]+1]+plotpos[which(!x)[-1]])/2, rep(i, length(which(!x)-1)), lwd=8, col='orange', lend=1)
  #### add in missing here
  #  segments(plotpos[which(is.na(x))], rep(i, length(which(is.na(x)))), plotpos[which(is.na(x))+1], rep(i, length(which(is.na(x)))), lwd=4, col='gray', lend=1, lty=1)
  #  ((plotpos[which(is.na(x))]+plotpos[which(is.na(x))+1])/2)[2:59]==((plotpos[which(is.na(x))+1]+plotpos[which(is.na(x))+2])/2)[1:58]
  #### add in the boundaries
  ## extend haplotypes to missing data start
  
  ## extend haplotypes to terminii
  if (!is.na(x[1])){
    if (x[1]==T){
      segments(-up, i, plotpos[1], i, lwd=8, col='purple', lend=1)
    } else if (x[1]==F){
      segments(-up, i, plotpos[1], i, lwd=8, col='orange', lend=1)
    }
  }
  if (!is.na(x[length(x)])){
    if (x[length(x)]==T){
      segments(plotpos[length(x)], i, gene+down, i, lwd=8, col='purple', lend=1)
    } else if (x[length(x)]==F){
      segments(plotpos[length(x)], i, gene+down, i, lwd=8, col='orange', lend=1)
    }
  }
  if (is.na(x[1])){
    segments(-up, i, plotpos[1], i, lwd=4, col='gray', lend=1, lty=1)
  }
  
}
)

## pop in TEs
for (i in 1:ncol(allTE)){
  #  points(is.na(allTE[,i])*allpos, rep(i, length(allpos)))
  segments(upmissing[,i][1], i, upmissing[,i][2], i, col='gray', lend=1, lty=1, lwd=4)
  segments(downmissing[,i][1]+gene, i, downmissing[,i][2]+gene, i, col='gray', lend=1, lty=1, lwd=4)
  segments(genemissing[,i][1], i, genemissing[,i][2], i, col='gray', lend=1, lty=1, lwd=4)
  #  points(snppos-up, rep(i, length(snppos)), pch='|', cex=0.4, col=snpcol[,i])
  points(allpos*allTE[,i]+nestx, rep(i, length(allpos))+0.5+nestelev, pch=25, col=tecol, bg=tecol, cex=2)
  text(allpos*allTE[,i]+nestx, rep(i, length(allpos))+0.15+nestelev, labels=round(teage/1000, digits=0), pos=3, cex=0.5)
  
}



segments(exonstart, rep(0, length(exonstart)), exonend, rep(0,length(exonend)), col='blue', lwd=6, lend=1)
## then for the noncoding portions of exons
segments(dexonstart+gene, rep(0,length(dexonstart)), dexonend+gene, rep(0, length(dexonstart)), col='green', lwd=6, lend=1)
segments(-150,0,0,0, col='green', lwd=6, lend=1)


#text(allpos, rep(9, length(allpos)), labels=round(teage/1000, digits=0), pos=3, srt=90, cex=0.5)
text(rep(-5650, 8), 1:8, labels=genenames, pos=4, cex=0.8)
text(-2000, 0, 'Kindr exons', pos=4, cex=0.8)

legend(14000, 10.4, c('LTR', 'soloLTR', 'LINE', 'Mutator', 'unknown'), col=adjustcolor(c('red', 'magenta', 'darkgreen', 'blue', 'brown'), alpha.f=0.7), pch=25, pt.bg=adjustcolor(c('red', 'magenta', 'darkgreen', 'blue', 'brown'), alpha.f=0.7), cex=0.6, bty='n')

#par(new=T, yaxs='i')
#plot.phylo.XLIM(kindr, xlimrange=c(0,200), show.tip.label=F, add=T)




