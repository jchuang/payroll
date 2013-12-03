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

  def self.read_employee_data(filename)
    CSV.foreach(filename, headers: true) do |row|
      employee = self.new(row[0], row[1], row[2].to_i)
      @@employees << employee
    end
  end

  def self.employees
    @@employees
  end
end

Employee.read_employee_data('employees.csv')
binding.pry

class Owner < Employee


end

class CommissionSalesPerson < Employee


end

class QuotaSalesPerson < Employee


end
