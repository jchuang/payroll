require 'pry'
require 'csv'

class Employee
  attr_reader :first_name, :last_name
  @@employees = []

  def initialize(first_name, last_name, base_salary)
    @first_name = first_name
    @last_name = last_name
    @base_salary = base_salary
  end

  def self.employee_data(filename)
    CSV.foreach(filename, headers: true) do |row|
      position = row[3]
      if position == 'owner'
        employee = Owner.new(row[0], row[1], row[2], row[4])
      elsif position == 'commission sales'
        employee = CommissionSalesPerson.new(row[0], row[1], row[2], row[6])
      elsif position == 'quota sales'
        employee = QuotaSalesPerson.new(row[0], row[1], row[2], row[4], row[5])
      else
        employee = self.new(row[0], row[1], row[2])
      end
      @@employees << employee
    end
  end

  def self.employees
    @@employees
  end
end

class Owner < Employee
  def initialize(first_name, last_name, base_salary, monthly_bonus)
    super(first_name, last_name, base_salary)
    @monthly_bonus = monthly_bonus
  end
end

# TODO: Consider creating a SalesPerson class to hold common instance variables
# and methods.

class CommissionSalesPerson < Employee
  def initialize(first_name, last_name, base_salary, percent_commission)
    super(first_name, last_name, base_salary)
    @percent_commission = percent_commission
    @monthly_sales = 0
  end

  def add_sale(sale) # Takes a Sale object and credits it to this employee.
    @monthly_sales += sale.sale_value.to_i
  end
end

class QuotaSalesPerson < Employee
  def initialize(first_name, last_name, base_salary, monthly_bonus, monthly_quota)
    super(first_name, last_name, base_salary)
    @monthly_bonus = monthly_bonus
    @monthly_quota = monthly_quota
    @monthly_sales = 0
  end

  def add_sale(sale) # Takes a Sale object and credits it to this employee.
    @monthly_sales += sale.sale_value.to_i
  end
end

Employee.employee_data('employees.csv')
