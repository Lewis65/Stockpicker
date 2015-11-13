def stockpicker(prices)
	buy_day = 0
	sell_day = 0
	max_profit = -1.0/0.0
	prices.each_with_index do |buy, buyind|
		prices.each_with_index do |sell, sellind|
			profit = sell - buy
			if profit > max_profit and sellind > buyind
				max_profit = profit
				buy_day = buyind
				sell_day = sellind
			end
		end
	end
	output = "buy on day #{buy_day} at $#{prices[buy_day]} and sell on day #{sell_day} at $#{prices[sell_day]} for a profit of $#{max_profit}"
	if max_profit <= 0
		return "Do nothing. Or, if you must do something, " + output
	else
		return output.capitalize
	end
end

puts "Please enter a series of prices, separated by commas, one per day:"
input = gets.chomp.split(', ').map { |p| p.to_i }
puts "In true programmer fashion, the first day is day 0, not day 1."
puts stockpicker(input)