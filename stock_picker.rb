stock_prices = [17, 1, 6, 9, 15, 8, 6, 3, 10]

def stock_picker(stock_prices)
  lowest_day = stock_prices.index(stock_prices.min)
  highest_day = stock_prices.index(stock_prices.max)

  if lowest_day < highest_day
    ["Buy on day #{lowest_day}", "Sell on day #{highest_day}"]
  else
    "This combo doesn't work. You need to buy before you sell."
  end
end

# Input is array of stock_prices that each index represent a day. stock_prices[0] = day 1.
# Output returns a pair of prices [buy day, sell day]
#   - buy day comes before sell day.
#   - profit (sell_price - buy_price) is the HIGHEST possible
#   - edge case: we ignore price drops that happen AFTER the last chance to sell

puts stock_picker(stock_prices)
