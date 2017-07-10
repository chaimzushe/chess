class Employee

  attr_reader :name, :title, :salary
  attr_accessor :boss

  def initialize(name, salary, title, boss)
    @name = name
    @title = title
    @salary = salary
    @boss = boss

  end

  def bonus(multiplier)
    self.salary * multiplier
  end

end

class Manager < Employee

  attr_reader :employees

  def initialize(name, title, salary, boss)
    super
    @employees = []
  end

  def add_employee(employee)
    self.employees << employee
    employee.boss = self
  end

  def get_all_subordinate_sal
    sum = 0
    employees.each do |employee|
      if employee.is_a?(Manager)
        sum += employee.salary + employee.get_all_subordinate_sal
      else
        sum += employee.salary
      end
    end
    sum
  end

  def bonus(multiplier)
     get_all_subordinate_sal * multiplier
  end
end
