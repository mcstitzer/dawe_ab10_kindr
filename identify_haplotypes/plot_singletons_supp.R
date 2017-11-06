#####################
### supp fig 6 ######
#####################

## being lazy and using same variable names

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







### get singleton snps ready
## remember my python script prints to screen the header and the output seperately, so have to put in manually!!!!
## expects you to be in identify_haplotypes dir, but here put out so you can see path
snps=read.csv('../../dawe_ab10_kindr/identify_haplotypes/singleton_ALL_UP-GENE-DOWN.csv', header=T, colClasses='character')
#colnames(snps)=paste(snps[1,], snps[2,], snps[3,], snps[4,], snps[5,], sep='')  ## convert the dumb vertical positions to actual numbers
#snps=snps[-(1:5),] #remove the vertical numbers
rownames(snps)=snps[,1]
snps=snps[,-1]

snppos=as.numeric(sub('.', '', colnames(snps)))
snps=t(snps)
snps=snps[,genenames]
snps[snps=='-']=NA
snpcol=snps
snpcol[snpcol=='C' | snpcol=='c']='blue'
snpcol[snpcol=='G' | snpcol=='g']='black'
snpcol[snpcol=='T' | snpcol=='t']='green'
snpcol[snpcol=='A' | snpcol=='a']='red'
snpcol[snpcol=='R' | snpcol=='r']=NA
snpcol[snpcol=='W' | snpcol=='w']=NA
snpcol[snpcol=='Y' | snpcol=='y']=NA
snpcol[snpcol=='N' | snpcol=='n']=NA




### final snp singleton for supplement
pdf('singleton_snps_kindr.supplement.pdf', 14,4)
plot(c(max(upos)-upos, max(upos)+gpos, max(upos)+max(gpos)+dpos), rep(-1, length(c(upos, gpos, dpos))), ylim=c(0,9), yaxt='n', xlim=c(-5000, 16000), ylab='', xlab='')
axis(2, at=1:8, labels=genenames, las=1)
for (i in 1:ncol(allTE)){
  #  points(is.na(allTE[,i])*allpos, rep(i, length(allpos)))
  segments(upmissing[,i][1], i, upmissing[,i][2], i, col='gray')
  segments(downmissing[,i][1]+gene, i, downmissing[,i][2]+gene, i, col='gray')
  segments(genemissing[,i][1], i, genemissing[,i][2], i, col='gray')
  points(snppos-up, rep(i, length(snppos)), pch='|', cex=0.8, col=snpcol[,i])
  #  points(allpos*allTE[,i], rep(i, length(allpos))+0.25, pch=25, col=tecol, bg=tecol)
}
segments(exonstart, rep(0, length(exonstart)), exonend, rep(0,length(exonend)), col='blue', lwd=2)
## then for the noncoding portions of exons
segments(dexonstart+gene, rep(0,length(dexonstart)), dexonend+gene, rep(0, length(dexonstart)), col='green', lwd=2)
segments(-150,0,0,0, col='green', lwd=2)
legend('topright', legend=c('C', 'G', 'T', 'A'), col=c('blue', 'black', 'green', 'red'), pch='|', pt.cex=1, cex=0.8, bg='white')

dev.off()
