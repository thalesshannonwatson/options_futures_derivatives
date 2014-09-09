
library(ggplot2)

LONG <- "Long"
SHORT <- "Short"
NONE <- "None"
CALL <- "Call"
PUT <- "Put"

plot_option_at_maturity <- function (position, right, premium, strike_price
                                     , RESOLUTION = 100) {
  share_value <- strike_price * seq(0, 2, length.out = 2 * RESOLUTION)
  premium <- premium * ifelse(position == LONG, -1, 1)
  payoff <- sapply(
    (share_value - strike_price) * ifelse(right == CALL, 1, -1)
    , max, 0) * ifelse(position == LONG, 1, -1)
  profit <- payoff + premium
  plot(share_value, profit, type = "n",
       , ylim = range(c(payoff, profit))
       , main = paste(position, right)
       , xlab = "Price at maturity"
       , ylab = "Profit" 
  )
  lines(share_value, profit, lwd = 2)
  lines(share_value, payoff, lwd = 2, lty = 2)
  abline(v = strike_price, lty = 3)
  abline(h = 0, lty = 1)
  abline(h = premium, lty = 3)

}

# plot_option_at_maturity("Long", "Put", 11.5, 120)