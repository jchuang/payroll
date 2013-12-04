class Owner < Employee
  def initialize(first_name, last_name, base_salary, monthly_bonus)
    super(first_name, last_name, base_salary)
    @monthly_bonus = monthly_bonus
  end
end
