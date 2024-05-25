class CalculateReceipt
    def initialize(items, pricing_table)
      @items = items
      @pricing_table = pricing_table
    end
  
    def call
      item_counts = Hash.new(0)
      @items.each { |item| item_counts[item] += 1 }
  
      total_cost = 0
      total_savings = 0
      item_details = []
  
      item_counts.each do |item, count|
        pricing = @pricing_table[item]
        if pricing
          unit_price = pricing[:unit_price]
          sale = pricing[:sale_price]
  
          if sale
            sale_quantity = sale[:quantity]
            sale_price = sale[:price]
  
            num_sales = count / sale_quantity
            remainder = count % sale_quantity
  
            item_cost = (num_sales * sale_price) + (remainder * unit_price)
            normal_cost = count * unit_price
            savings = normal_cost - item_cost
          else
            item_cost = count * unit_price
            savings = 0
          end
  
          item_details << { item: item, quantity: count, total: item_cost.round(2) }
          total_cost += item_cost
          total_savings += savings
        end
      end
  
      {
        items: item_details,
        total_cost: total_cost.round(2),
        total_savings: total_savings.round(2)
      }
    end
  end
  