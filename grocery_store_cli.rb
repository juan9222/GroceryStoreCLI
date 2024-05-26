# grocery_store_cli.rb
require_relative 'app/entities/item'
require_relative 'app/use_cases/calculate_receipt'

def get_user_input
  puts "Please enter all the items purchased separated by a comma"
  gets.chomp.split(',').map(&:strip)
end

def print_receipt(receipt)
  puts "Item     Quantity      Price"
  puts "--------------------------------------"
  receipt[:items].each do |item|
    puts "#{item[:item].ljust(9)} #{item[:quantity].to_s.ljust(13)} $#{'%.2f' % item[:total]}"
  end
  puts "--------------------------------------"
  puts "Total price : $#{'%.2f' % receipt[:total_cost]}"
  puts "You saved $#{'%.2f' % receipt[:total_savings]} today."
end

def main
  items = get_user_input

  pricing_table = {
    'milk' => { unit_price: 3.97, sale_price: { quantity: 2, price: 5.00 } },
    'bread' => { unit_price: 2.17, sale_price: { quantity: 3, price: 6.00 } },
    'banana' => { unit_price: 0.99, sale_price: nil },
    'apple' => { unit_price: 0.89, sale_price: nil }
  }

  receipt = CalculateReceipt.new(items, pricing_table).call
  print_receipt(receipt)
end

main
