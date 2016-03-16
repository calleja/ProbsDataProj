'''
NAICS codes by county
a) county is defined by FIPS County Coude
b) NAICS code can be 3-,4-,5-
'''
library(stringr)
library(plyr);library(ggplot2)
#save.image('~/Documents/CUNY/probs_stats/dataProject/socialDataProject/naics.RData')
diry<-'~/Documents/CUNY/probs_stats/dataProject/socialDataProject/dataTables/cbp13co.txt'

test<-read.table(diry,sep=",",header=TRUE)
names(test)
sapply(test,class)
length(levels(test$naics))

'''
all those beginning with 324 - refining, oil manufacturing
325 - petro manufacturing, gas manufacturing, fertilizer, pesticide, adhesive, paint, soap, polish, plastic bags 
326 - plastic durables, tire manufacturing, rubber
all those beginning with 21  - mining
221112 - fossil fuel electric power generation
'''

# test
ma<-test[levels(test$naics)=='221112',]
ma<-subset(test,levels(naics)=='326199')

#regular expression
oil<-subset(test,grepl("^325",naics))
fert<-subset(test,grepl("^324",naics))
plastic<-subset(test,grepl("^326",naics))
mine<-subset(test,grepl("^21",naics))
fossil<-subset(test,naics=='221112')

dirty<-rbind(oil,fert,plastic,mine,fossil)

#aggregate number of establishments by county
aggd<-ddply(dirty,.(fipscty), function(x) sum(x$est))
names(aggd)<-c('fips_county','ests')

#summary statistics on 'aggd'
summary(aggd$ests)
ggplot(aggd,aes(x=ests))+geom_density()

#workspace cleanup
kinder<-ls()
rm(list=kinder[-c(1,2)])

