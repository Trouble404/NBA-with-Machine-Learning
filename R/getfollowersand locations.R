library(twitteR)
library(ROAuth)
library(bitops)
library(RCurl)
setup_twitter_oauth(consumer_key = "",
                    consumer_secret = "",
                    access_token = "",
                    access_secret = "")
#change it by yourself
user=getUser("") 
user_follower_IDs=lookupUsers(user$getFollowerIDs(200000))
length(user_follower_IDs)
result<- sapply(user_follower_IDs, function(x) c(x$name, x$location))
write.csv(t(result),"G:\\Data.csv",row.names = FALSE)

# df <- do.call("rbind", lapply(s, as.data.frame)) 
# # extract the usernames
# users <- sapply(users, as.character)
# # make a data frame for the loop to work with 
# users.df <- data.frame(users = users, 
#                        followers = "", stringsAsFactors = FALSE)
# # loop to populate users$followers with follower 
# # count obtained from Twitter API
# for (i in 1:nrow(users.df))
# {
#   # tell the loop to skip a user if their account is protected
#   # or some other error occurs
#   result <- try(getUser(users.df$users[i])$followersCount, silent = TRUE);
#   if(class(result) == "try-error") next;
#   # get the number of followers for each user
#   users.df$followers[i] <- getUser(users.df$users[i])$followersCount
#   # tell the loop to pause for 60 s between iterations to
#   # avoid exceeding the Twitter API request limit
#   print('Sleeping for 60 seconds...')
#   Sys.sleep(60);
# }
