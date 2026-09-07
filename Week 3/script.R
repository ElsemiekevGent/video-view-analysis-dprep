library(tidyverse)
if (!file.exists("video_view.csv")) {
data_url <- paste0(
"https://raw.githubusercontent.com/hannesdatta/",
"course-dprep/refs/heads/main/material/tutorials/r-bootcamp-rev/",
"video_view.csv"
)
download.file(data_url, "video_view.csv")
}
videos <- read_csv("video_view.csv") 

#Build a baseline scatter plot:
# 1. data: videos
# 2. x-axis: impressions_n
# 3. y-axis: watch_rate
# 4. chart type: geom_point()

ggplot(data=videos, aes(x= impressions_n, y=watch_rate)) + geom_point()
#Improve your plot for a non-technical reader:
# 1. add title and axis labels
# 2. add color mapping
# 3. use a readable theme
# 4. ask AI for one improvement idea
ggplot(data=videos, aes(x= impressions_n, y=watch_rate, color=creator_id), 
main= "plot", 
xlab="number of impressions", 
ylab="watch rate") 
+ geom_point()
# with AI
ggplot(data = videos, aes(x = impressions_n, y = watch_rate, color = creator_id)) +
  geom_point(alpha = 0.6, size = 2) +
  labs(
    title = "Watch Rate vs. Impressions by Creator",
    x = "Number of Impressions",
    y = "Watch Rate",
    color = "Creator ID"
  ) +
  theme_minimal() +
  theme(
    plot.title = element_text(size = 14, face = "bold", margin = margin(b = 10)),
    axis.title = element_text(size = 11),
    axis.text = element_text(size = 10),
    legend.position = "right",
    panel.grid.major = element_line(color = "gray90"),
    panel.grid.minor = element_blank()
  )

# with AI 2

# Convert creator_id to numeric for continuous color scale
ggplot(data = videos, aes(x = impressions_n, y = watch_rate, color = as.numeric(creator_id))) +
  geom_point(alpha = 0.6, size = 2.5) +
  # Continuous color scale (gradient - easier to read with many creators)
  scale_color_viridis_c(option = "plasma", name = "Creator ID") +
  labs(
    title = "Video Watch Rate vs. Impressions",
    subtitle = "Each dot represents one video",
    x = "Number of Impressions",
    y = "Watch Rate (0 = 0%, 1 = 100%)"
  ) +
  theme_minimal() +
  theme(
    plot.title = element_text(size = 16, face = "bold", margin = margin(b = 5)),
    plot.subtitle = element_text(size = 12, color = "gray50", margin = margin(b = 15)),
    axis.title = element_text(size = 12, face = "bold"),
    axis.text = element_text(size = 10),
    legend.position = "right",
    legend.title = element_text(face = "bold", size = 11),
    panel.grid.major = element_line(color = "gray95", linewidth = 0.3),
    panel.grid.minor = element_blank()
  )