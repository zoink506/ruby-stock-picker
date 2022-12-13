def stock_picker(days) 
  new_array = []
  days.each_with_index do |day, index|
    new_array.push({ value: day, index: index })
  end

  puts "Ascending Array"
  array_ascending = new_array.sort { |a, b| a[:value] <=> b[:value] }
  #array_ascending.each { |day| p day }
  puts "\n"

  puts "Descending Array"
  array_descending = array_ascending.reverse
  #array_descending.each { |day| p day }

  puts "\n"

  result_array = []
  array_descending.each do |descend_day|
    array_ascending.each do |ascend_day|
      #puts "#{descend_day}-#{ascend_day}"
      if( descend_day[:index] > ascend_day[:index] && ascend_day[:value] < descend_day[:value] )
        result_array.push({ profit: descend_day[:value] - ascend_day[:value], sell_day: descend_day[:index], buy_day: ascend_day[:index] })
        break
      end 
    end

  end

  puts "\n"
  puts "Result Array"
  result_array.each { |thing| p thing }

  result = result_array.max { |day1, day2| day1[:profit] <=> day2[:profit] }
  greatest_profit = [result[:buy_day], result[:sell_day]]
  puts "\n"
  p greatest_profit

end

#stock_picker([17,3,6,9,15,8,6,1,10])
#stock_picker([9,75,34,8,23,19,5,3,16,53,71])
stock_picker([20,5,8,3,16,9,1])