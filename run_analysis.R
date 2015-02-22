setwd('/Users/xiao_lisp/Downloads/UCI HAR Dataset/')
library(dplyr)


features<-read.table('features.txt',FALSE)
colu.1<-grep('mean',features[,2])
colu.2<-grep('std',features[,2])
colu<-c(colu.1,colu.2)
colu<-sort(colu)



testsets<-read.table('test/X_test.txt',FALSE)
trainsets<-read.table('train/X_train.txt',FALSE)
TotalSets<-rbind(testsets,trainsets)


TotalSets2<-TotalSets[,colu]
names(TotalSets2)<-features[colu,2]
colu.3<-grep('mean',names(TotalSets2))
TotalSets3<-TotalSets2[,colu.3]

write.table(TotalSets3,'assignment.txt',row.name=FALSE)
