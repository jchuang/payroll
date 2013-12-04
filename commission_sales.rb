class CommissionSales < Employee
  def initialize(first_name, last_name, base_salary, percent_commission)
    super(first_name, last_name, base_salary)
    @percent_commission = percent_commission
    @monthly_sales = 0
  end

  def add_sale(sale) # Takes a Sale object and credits it to this employee.
    @monthly_sales += sale.sale_value
  end
end
