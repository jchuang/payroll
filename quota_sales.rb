class QuotaSales < Employee
  def initialize(first_name, last_name, base_salary, monthly_bonus, monthly_quota)
    super(first_name, last_name, base_salary)
    @monthly_bonus = monthly_bonus
    @monthly_quota = monthly_quota
    @monthly_sales = 0
  end

  def add_sale(sale) # Takes a Sale object and credits it to this employee.
    @monthly_sales += sale.sale_value
  end

  def bonus
    if @monthly_sales > @monthly_quota
      @monthly_bonus
    else
      0
    end
  end

  def gross_salary
    (@base_salary / 12) + bonus
  end

  def net_pay
    super
  end

  def display
    puts "Name: #{ @first_name } #{ @last_name }"
    puts "Gross Salary: $#{ gross_salary.round(2) }"
    puts "Bonus: $#{ bonus.round(2) }"
    puts "Net Pay: $#{ net_pay.round(2) }"
  end
end
