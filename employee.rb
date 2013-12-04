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
        employee = CommissionSales.new(row[0], row[1], row[2], row[6])
      elsif position == 'quota sales'
        employee = QuotaSales.new(row[0], row[1], row[2], row[4], row[5])
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
