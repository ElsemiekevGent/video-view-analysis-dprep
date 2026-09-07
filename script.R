getwd()
list.files()
install.packages("tidyverse")
library(tidyverse)
videos <- read_csv("video_view.csv")
head(videos)
nrow(videos)
glimpse(videos)
summary(videos$video_length_sec)
sum(is.na(videos$video_length_sec))
videos$video_id %>% is.na() %>% sum()
videos %>%
  select(video_id,creator_id,impressions_n,watched_n,watch_rate)

videos %>%
  filter(watch_rate > 0.7, impressions_n >= 20)

creator_stats <- videos %>% summarize(impressions_total = sum(impressions_n, na.rm = TRUE), watch_rate_avg = mean(watch_rate, na.rm = TRUE),.by = creator_id)
creator_stats %>% arrange(desc(impressions_total))

videos %>%
  filter(watch_rate>=0.8) %>% nrow()

#2. Show only video_id, creator_id, watch_rate
videos %>%
  select(video_id,creator_id,watch_rate)

#3. Compute average watch_rate by creator_id with summarize(..., .by =creator_id)
average_watch_rate<- videos %>% summarize(watch_rate_avg = mean(watch_rate, na.rm = TRUE),.by=creator_id)
