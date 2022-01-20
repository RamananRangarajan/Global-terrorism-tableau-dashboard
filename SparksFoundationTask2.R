df <- as.data.frame(read.csv("D:/VIT/Sparks foundation/globalterrorismdb_0718dist.csv"))
for(i in 1:ncol(df)){
  count <-0
  for(j in 1:nrow(df)){
    if(df[[i]][[j]]=="" | is.na(df[[i]][[j]])== TRUE ){
      count<-count+1
    }
  }
  #REMOVING COLUMNS WITH MORE THAN 30% NULL VALUE
  if(count/nrow(df)>0.3){
    print(colnames(df)[[i]])
    #df<- subset(df, select = -c(colnames(df)[[i]]))
    df<-df[,!(names(df) %in% c(colnames(df)[[i]]))]
    
  }
}
#wRITING THE UPDATED DATASET INTO A NEW csv FILE
write.csv(df,file="cleaned_data.csv",col.names=TRUE,sep=",",row.names=FALSE)
