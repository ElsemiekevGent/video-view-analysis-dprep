countries <- c("NL", "DE", "FR")

for (c in countries) {
  print(paste("Running churn model for", c))
}

budget <- 10000

while (budget > 0) {
  print(paste("Remaining budget:", budget))
  budget <- budget - 2000
}

campaigns <- list("SpringPromo", "SummerBlast", "WinterSale")

lapply(campaigns, nchar)
# Returns: list(11, 11, 10)
# Double brackets [[ ]] give one element
lapply(campaigns, nchar)[[1]]

# Single brackets [ ] return a sublist
lapply(campaigns, nchar)[1]
sapply(campaigns, nchar)
# Returns: c(11, 11, 10)

# Define the function
calc_discount <- function(price, discount_rate = 0.10) {
  discounted_price <- price * (1 - discount_rate)
  return(discounted_price)
}
# Call the function
calc_discount(100)      # uses default 10% discount
calc_discount(100, 0.2) # override default

customer_summary <- function(name, purchases, spend) {
  avg_spend <- spend / purchases
  return(list(
    customer = name,
    avg_spend = avg_spend
  ))
}

customer_summary("Alice", 5, 200)
# Install once (downloads the package from CRAN)
install.packages("ggplot2")

# Load it every time you need it
library(ggplot2)
# Example: plot purchases vs churn
customers <- data.frame(
  purchases = c(2, 5, 8, 1, 6),
  churned = c(TRUE, FALSE, FALSE, TRUE, FALSE)
)

ggplot(customers, aes(x = purchases, y = churned)) +
  geom_point()
install.packages("tidyverse")
library(tidyverse)

# Example: calculate churn rate by number of purchases
customers %>%
  group_by(purchases) %>%
  summarise(churn_rate = mean(churned))
 