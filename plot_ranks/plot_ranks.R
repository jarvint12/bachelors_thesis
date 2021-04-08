setwd("C:/Users/TimoJ/Documents/Työpaikat/Helsingin Yliopisto")

ranks <- read.csv("dendrix_oncodrive.csv") #or dendrix_oncodrivefm.csv/dendrix_muffinn.csv

ranks2<-ranks[,-1] #Leave gene name out, only two ranks per gene, ranks[1:997,-1] to filter only 997 first ranks
ranks3<-ranks2[which(ranks2[,2]<10000),] #Filter second ranks that have too large value
ranks3<-ranks3[which(ranks3[,1]<10000),] #Filter first ranks that have too large value
rownames(ranks2)<-ranks[,1] #Get rownames

getwd()

i=1
coordinates=vector()
while(i<=length(ranks3[,1])){
  coordinates[i]<-paste(c("(", ranks3[i,2], ",", ranks3[i,1], ")"), collapse = "")
  i=i+1
}

plot(ranks3[,1], ranks3[,2], xlab="Geenin sijoitus Dendrixin tuloksissa", ylab="Geenin sijoitus Oncodrive-fm:n tuloksissa", 
     main="Geenien sijoitukset Dendrix ja Oncodrive-fm", col=ifelse(abs(ranks3[,1]-ranks3[,2])<100, 'red', 'black'))# log="y")
#text(ranks3[,2], ranks3[,1],coordinates,cex=0.5, pos=3, col=ifelse(abs(ranks3[,1]-ranks3[,2])<100, 'red', 'black'))


#Dendrix has only 997 genes