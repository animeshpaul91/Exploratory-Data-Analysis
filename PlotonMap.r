library("ggmap")
library("ggplot2")
library("maptools")
library("maps")
library("rtweet")
library("openintro")
library("plyr")

rt_matrix <- read.csv(file="~/Part3/Tweets.csv", header=TRUE, sep=",")

#Eliminating Duplicates
rt_matrix <- lat_lng(rt_matrix)
rt_matrix <-unique( rt_matrix[ , ] ) #Removes Duplicates
#rt_matrix <- rt_matrix[1:2000,]
#rt_matrix <- rt_matrix[1:100,]

address <- do.call(rbind, lapply(1 : nrow(rt_matrix), function(i) revgeocode(as.numeric(rt_matrix[i, 90: 89]), output = "address")))
rt_matrix <- cbind(rt_matrix, address)
rt_matrix$state <-substr(address, nchar(address) - 12, nchar(address) - 11) #Extract State
rt_matrix$state <- tolower(abbr2state(rt_matrix$state))

states <- map_data("state") # Will return all lat and lng positions of all states
tc <- count(rt_matrix, "state") #Will Store State-wise Tweet Count
#tc$region <- tc$state
colnames(tc)[colnames(tc)=="state"] <- "region"

map.df = merge(states, tc, by="region", all.x = T)
ggplot(map.df, aes(x=long,y=lat, group=group))+
  geom_polygon(aes(fill=map.df$freq))+
  geom_path()+ 
  scale_fill_gradientn(colours=rev(heat.colors(20)))+
  coord_map()
