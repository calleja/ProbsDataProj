library(plyr)
library(stringr)
library(ggplot2)
#save.image('~/Documents/CUNY/probs606/dataProject/ProbsDataProj/socialDataProject/exploration.Rmd')
load('/home/lechuza/Documents/CUNY/probs_stats/dataProject/socialDataProject/formalProposal.RData')
county<-read.csv("/home/bombero/Documents/CUNY/probs606/dataProject/ProbsDataProj/socialDataProject/dataTables/incd.csv",skip=8,strip.white = TRUE)

#remove blank, null values
county<-county[1:2908,]
tail(county)


#consider only the columns I need
county.t<-county[,1:6]
summary(county.t[,-(1:2)])

#apply the 'describeBy' function from psycho package
names(county.t)[3]<-'AAIR_100K'
#learn data type of each column
sapply(county.t,class)

#non-numeric values in each column - need to normalize
#convert factor column to numeric
test<-tryCatch(as.numeric(levels(county.t$AAIR_100K))[county.t$AAIR_100K],finall=NULL)

#spot NAs
test[is.na(test)]
#find the raw values that caused NAs during the conversion
county.t$AAIR_100K[is.na(test)]
test[is.null(test)] #ninguno... bc they are coded as NA

#ensure the string is of a certain length - prep for 'str_sub()'
county.t[county.t$AAIR_100K=='451.3 #',]
#remove all instances of ' #' to prep for string/factor to numeric conversion
test[is.na(test)]<-str_sub(county.t$AAIR_100K[is.na(test)],0,-2)

#convert all characters to numeric
ended<-as.numeric(test)
#test that all characters were converted
anyNA(ended)

#do the above for other columns in county.t

#Average.Annual.Count
test1<-tryCatch(as.numeric(levels(county.t$Average.Annual.Count))[county.t$Average.Annual.Count],finall=NULL)
test1[is.na(test1)]
#find the raw values that caused NAs during the conversion
county.t$Average.Annual.Count[is.na(test1)]
test1[is.na(test1)]<-str_sub(county.t$Average.Annual.Count[is.na(test1)],0,-2)
#convert all characters to numeric
ended1<-as.numeric(test1)


#create a new df with all pertinent data
final<-as.data.frame(cbind(county.t$County,ended,ended1),row.names = NULL)
names(final)<-c('county','AAIR_100K','avg.annual.cnt')
sapply(final,typeof)
ggplot(final,aes(x=final$AAIR_100K))+geom_histogram()

'''
analyze cancer incidence rate amongst individuals less than 15 
years of age... all cancer types... counts aggregated to county level'''
lt15<-read.csv('/home/lechuza/Documents/CUNY/probs_stats/dataProject/socialDataProject/dataTables/incd_lt15.csv',skip=10,header=FALSE,strip.white =TRUE)
names(lt15)<-c('County', 'FIPS','AAIR_100K',	'Lower 95% Confidence Interval',	'Upper 95% Confidence Interval',	'Average Annual Count',	'Recent Trend',	'Recent 5-Year Trend in Incidence Rates',	'Lower 95% Confidence Interval',	'Upper 95% Confidence Interval')
lt15.1<-lt15[1:554,]
sapply(lt15.1,class)

#create a function to process incidence data from State Cancer profiles downloads
proIncidence<-function(x,coName){
  test<-tryCatch(as.numeric(levels(x$coName))[x$coName],finally=NULL)
#remove all instances of ' #' to prep for string/factor to numeric conversion
  test[is.na(test)]<-str_sub(x$coName[is.na(test)],0,-2)
#convert all characters to numeric... 'ended' becomes the new AAIR_100K field
  ended<-as.numeric(test)
#test that all characters were converted
  final<-as.data.frame(cbind(x,ended),row.names = NULL)
  if (anyNA(ended)) "didn't work" else final}

proIncidence<-function(x,coName)
  {
  g<-subset(x,,coName)[,1]
  j<-levels(g)
  #test<-tryCatch(as.numeric(j)[g],finally=print(NA))
  tryCatch(j)
  return(test)
  }
test<-levels(lt15.1$'AAIR_100K')
ma<-lt15.1['AAIR_100K']
test<-tryCatch(as.numeric(mon)[mon],finally=NULL)

mon<-proIncidence(lt15.1,'AAIR_100K')
x<-subset(lt15.1,,AAIR_100K)[,1]

#do the above for other columns in county.t

#Average.Annual.Count
test1<-tryCatch(as.numeric(levels(incd.t$'Average Annual Count'))[incd.t$'Average Annual Count'],finally=NULL)
test1[is.na(test1)]
#find the raw values that caused NAs during the conversion
incd.t$'Average Annual Count'[is.na(test1)]
test1[is.na(test1)]<-str_sub(incd.t$'Average Annual Count'[is.na(test1)],0,-2)
#convert all characters to numeric
ended1<-as.numeric(test1)