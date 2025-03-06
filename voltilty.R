install.packages("quantmod")  # For downloading stock data
install.packages("ggplot2")   # For data visualization
install.packages("PerformanceAnalytics")  # For advanced financial analysis
# Load the libraries
library(quantmod)
library(ggplot2)
library(PerformanceAnalytics)

# Download Apple stock data
getSymbols("AAPL", src = "yahoo", from = "2020-01-01", to = "2023-10-01")

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

#Visualize

# Plot volatility over time
ggplot(AAPL, aes(x = index(AAPL), y = Volatility)) +
  geom_line(color = "blue") +
  labs(title = "30-Day Rolling Volatility of AAPL (2020-2023)",
       x = "Date",
       y = "Volatility (Annualized)") +
  theme_minimal()







