class Item
    attr_accessor :name, :unit_price, :sale_price
  
    def initialize(name:, unit_price:, sale_price: nil)
      @name = name
      @unit_price = unit_price
      @sale_price = sale_price
    end
  end