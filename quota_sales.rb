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
    @base_salary + bonus
  end
end
