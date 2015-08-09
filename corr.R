corr <- function(directory, threshold=0) {
  
  files_full<-list.files(directory,full.names=TRUE)
  combinedat <- c() 
  #df<-data.frame(i = integer(), nobs= integer())
  #files_full
  
    for(i in 1:length(files_full)){
    if (i < 10) { 
      data <- read.csv(paste0(directory,"/",0,0,i,".csv"))              
      
    } else if (i < 100) {
      data<-read.csv(paste0(directory,"/",0,i,".csv"))
    } else {
      data<-read.csv(paste0(directory, "/", i,".csv"))}
    
    #combinedat<-rbind(combinedat,data)
    dff <- na.omit(data)
    nobs <- nrow(na.omit(data))
    
    if(nobs>threshold){
    #cor_coeff <- cor(combinedat$sulfate, combinedat$nitrate)
    cor_coeff <- cor(dff$sulfate, dff$nitrate)
    combinedat <- c(combinedat, cor_coeff)
    #writeLines(paste0(i,".csv ", cor_coeff))
    
    }
    #cdf<-data.frame(id=i, nobs=nrow(na.omit(data))) #create data frame
    #df<-rbind(df,cdf) #bind dataframe nd with dataframe df
  }
    
  combinedat
}
