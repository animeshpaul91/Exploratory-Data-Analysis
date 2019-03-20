## access token method: create token and save it as an environment variable

library(rtweet)
library(data.table)
library(dplyr)

create_token(
  app = "DIC_EDA_1",
  consumer_key = "pcEvrIV5zHuvoOaCHKOomk9FE",
  consumer_secret = "6c7M5OhGT32U7YfSADVYYhwvdfOcW8gA9ZQykJoTbZhhY16yaq",
  access_token = "130485979-Tj65oVh6VBlVKIN7Rli93ZpChUVdZXQTOhGScMov",
  access_secret = "yFUW8Nup7MYK0TQAecbVB9uBgbimSGkJpR5XRJ54YhvFS")



rt <- search_tweets(
  "flu OR influenza OR fluvaccine OR fightflu OR fluseason OR flushot", geocode = lookup_coords("usa"), n = 18000, include_rts = FALSE, retryonratelimit = TRUE
) #rt will contain lot of Junk Tweets

#Data Processing
rt <- lat_lng(rt)
rt <- rt[!(is.na(rt$lat) | is.na(rt$lng)),] #Removes NA values for Lat and Lng
rt <-unique( rt[ , ] ) #Removes Duplicates
rt <- dplyr::filter(rt, grepl("flu|influenza|fluvaccine|fluseason|flushot", text)) #Fetches Tweets containing relevant words
fwrite(rt, file = "~/Part3/Tweets.csv", row.names = FALSE, col.names = FALSE, sep = ",", append = TRUE)

