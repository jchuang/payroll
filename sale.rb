require 'pry'
require 'csv'

class Sale
  attr_reader :last_name, :sale_value
  @@sales = []

  def initialize(last_name, sale_value)
    @last_name = last_name
    @sale_value = sale_value
  end

  def self.sale_data(filename)
    CSV.foreach(filename, headers: true) do |row|
      sale = self.new(row[0], row[1])
      @@sales << sale
    end
  end

  def self.sales
    @@sales
  end
end

Sale.sale_data('sales.csv')
binding.pry
