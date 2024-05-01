# Project: Zebra Finch Xfostering 
# Date: 01/26/24

#Overview: This file contains code for calculation of d prime.

#Structure of the df at the start of this script: one row per unit-stimulus combination
#Start with firezals_sum df

#### D PRIME CALCULATION ####
#population variance formula: https://sdsclub.com/how-to-find-variance-in-r-examples-included/ 
#FORMULA FOR D PRIME: d'=2(RS_STIM_A-RS_WhiteNoise)/sqrt(pop_var_STIM_A+pop_var_WhiteNoise)

#1.Calculate mean RS (response strength) for each unit/stimulus combination
#use firezals_sum df because means are already calculated
firezals_sum$RS<- firezals_sum$stim_fr- firezals_sum$base_fr

#2.Calculate RS population variance for each unit/stimulus combination
#use frates_wide2 df because it has all the raw values for each presentation of each stimulus
frates_wide2$PresRS<-frates_wide2$stim_fr-frates_wide2$base_fr
d_unit_list<-split(frates_wide2,list(frates_wide2$Unit2,frates_wide2$Stimulus),drop=TRUE)
popvar<-lapply(d_unit_list,function(x) {
  n<-length(x$PresRS)
  popvar<-var(x$PresRS)*(n-1)/n
})
#convert popvar 'list' to dataframe
pop_var<-vector("numeric",nrow(firezals_sum))
for (i in 1:length(popvar)) {
  h<-popvar[[i]][[1]]
  pop_var[i]<-h
}
unitstimpair<-vector("character",nrow(firezals_sum))
for (i in 1:length(popvar)) {
  g<-names(popvar)[i]
  unitstimpair[i]<-g
}
popvar2<-as.data.frame(cbind(unitstimpair,pop_var))
popvar2$pop_var<-as.numeric(popvar2$pop_var)
#separate stimulus # from unit column to facilitate merging with firezals_sum
popvar2<-separate(popvar2, "unitstimpair", c("ID","Region","Trial","Letter","Stimulus")) #ignore warning message
popvar2<-unite(popvar2, Unit2,ID,Region,Trial,Letter, sep = "_")
popvar2$Stimulus<-as.numeric(popvar2$Stimulus)

#3.Calculate d' values using white noise as the comparison stimulus for all 
#NOTE: 5 stimuli cannot be analyzed because they did not hear white noise (Units from C4 trials 4 and 5)
#Merge data frames from steps 1 and 2
dprime_long<-merge(firezals_sum,popvar2,by=c("Unit2","Stimulus"))
#manipulate df so that white noise values are in same row as other stimuli (to be used as comparison in calculation)
dprime_wn<-subset(dprime_long,Species=="WN") 
colnames(dprime_wn)[47]<-'RS_WN'
colnames(dprime_wn)[48]<-'pop_var_WN'
dprime_song<-subset(dprime_long,Species!="WN")
dprime<-merge(dprime_song,dprime_wn[,c(1,47,48)],by="Unit2") #this is where we will drop those 5 units that didn't hear WN
#calculate d'
dprime$dprime<-2*(dprime$RS-dprime$RS_WN)/sqrt(dprime$pop_var+dprime$pop_var_WN)
#save to wd if desired
write.csv(dprime, file = "dprime.csv",row.names=FALSE) #saves to wd

