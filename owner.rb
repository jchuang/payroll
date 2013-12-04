class Owner < Employee
  COMPANY_QUOTA = 250_000

  def initialize(first_name, last_name, base_salary, monthly_bonus)
    super(first_name, last_name, base_salary)
    @monthly_bonus = monthly_bonus
  end

  def bonus
    company_sales = Sale.total_sales
    if company_sales > COMPANY_QUOTA
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
