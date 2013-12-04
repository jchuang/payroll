class CommissionSales < Employee
  def initialize(first_name, last_name, base_salary, percent_commission)
    super(first_name, last_name, base_salary)
    @percent_commission = percent_commission
    @monthly_sales = 0
  end

  def add_sale(sale) # Takes a Sale object and credits it to this employee.
    @monthly_sales += sale.sale_value
  end

  def commission
    @base_salary * @percent_commission / 100
  end

  def gross_salary
    @base_salary + commission
  end

  def net_pay
    super
  end

  def display
    puts "Name: #{ @first_name } #{ @last_name }"
    puts "Gross Salary: $#{ gross_salary.round(2) }"
    puts "Commission: $#{ commission.round(2) }"
    puts "Net Pay: $#{ net_pay.round(2) }"
  end
end
