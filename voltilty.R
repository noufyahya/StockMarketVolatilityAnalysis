#install.packages("quantmod")  # For downloading stock data
#install.packages("ggplot2")   # For data visualization
# install.packages("PerformanceAnalytics")  # For advanced financial analysis
# Load the libraries
library(quantmod)
library(ggplot2)
library(PerformanceAnalytics)

# Download Apple stock data
getSymbols("AAPL", src = "yahoo", from = "2020-01-01", to = "2023-10-01")
getSymbols(c("MSFT", "AMZN", "TSLA"), src = "yahoo", from = "2020-01-01", to = "2023-10-01")

# View Apple data
head(AAPL)

####
#end of pulling & viewing symbols
#####


# Calculate daily logarithmic returns
# Calculate daily returns
AAPL$DailyReturn <- dailyReturn(AAPL$AAPL.Adjusted, type = "log")
AAPL <- na.omit(AAPL)
# Calculate rolling 30-day volatility
AAPL$Volatility <- rollapply(AAPL$DailyReturn, width = 30, FUN = sd, fill = NA, align = "right") * sqrt(252)
# Remove NA values
AAPL <- na.omit(AAPL)

# Calculate daily returns and volatility for MSFT
MSFT$DailyReturn <- dailyReturn(MSFT$MSFT.Adjusted, type = "log")
MSFT$Volatility <- rollapply(MSFT$DailyReturn, width = 30, FUN = sd, fill = NA, align = "right") * sqrt(252)
MSFT <- na.omit(MSFT)
View(MSFT)

# Calculate daily returns and volatility for AMZN
AMZN$DailyReturn <- dailyReturn(AMZN$AMZN.Adjusted, type = "log")
AMZN$Volatility <- rollapply(AMZN$DailyReturn, width = 30, FUN = sd, fill = NA, align = "right") * sqrt(252)
AMZN <- na.omit(AMZN)

# Calculate daily returns and volatility for TSLA
TSLA$DailyReturn <- dailyReturn(TSLA$TSLA.Adjusted, type = "log")
TSLA$Volatility <- rollapply(TSLA$DailyReturn, width = 30, FUN = sd, fill = NA, align = "right") * sqrt(252)
TSLA <- na.omit(TSLA)
head(TSLA)

volatility_data <- data.frame(
  Date = index(AAPL),
  AAPL = AAPL$Volatility,
  MSFT = MSFT$Volatility,
  AMZN = AMZN$Volatility,
  TSLA = TSLA$Volatility
)

# Remove NA values
volatility_data <- na.omit(volatility_data)

library(ggplot2)

ggplot(volatility_data, aes(x = Date)) +
  geom_line(aes(y = AAPL, color = "AAPL")) +
  geom_line(aes(y = MSFT, color = "MSFT")) +
  geom_line(aes(y = AMZN, color = "AMZN")) +
  geom_line(aes(y = TSLA, color = "TSLA")) +
  labs(title = "30-Day Rolling Volatility of Multiple Stocks (2020-2023)",
       x = "Date",
       y = "Volatility (Annualized)",
       color = "Stock") +
  theme_minimal()



#Visualize
# Plot volatility over time for all stocks
# ggplot(volatility_data,  mapping= aes(x = Date)) +
#   geom_line(mapping=aes(y = AAPL, color = "AAPL")) +
#   labs(title = "30-Day Rolling Volatility of Multiple Stocks (2020-2023)",
#        x = "Date",
#        y = "Volatility (Annualized)",
#        color = "Stock") +theme_minimal()




#temp fix
# Create a small example data frame
# example_data <- data.frame(
#   Date = seq(as.Date("2020-01-01"), as.Date("2020-01-10"), by = "day"),
#   AAPL = rnorm(10),
#   MSFT = rnorm(10),
#   AMZN = rnorm(10),
#   TSLA = rnorm(10)
# )
# 
# # Plot the example data
# ggplot(example_data, aes(x = Date)) +
#   geom_line(aes(y = AAPL, color = "AAPL")) +
#   geom_line(aes(y = MSFT, color = "MSFT")) +
#   geom_line(aes(y = AMZN, color = "AMZN")) +
#   geom_line(aes(y = TSLA, color = "TSLA")) +
#   labs(title = "Example Plot",
#        x = "Date",
#        y = "Value",
#        color = "Stock") +
#   theme_minimal()