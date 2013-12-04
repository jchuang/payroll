class Owner < Employee
  COMPANY_QUOTA = 250_000

  def initialize(first_name, last_name, base_salary, monthly_bonus)
    super(first_name, last_name, base_salary)
    @monthly_bonus = monthly_bonus
  end

  def gross_salary(monthly_sales)
    if monthly_sales > COMPANY_QUOTA
      @base_salary + @monthly_bonus
    else
      @base_salary
    end
  end
end
