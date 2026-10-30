abstract class Employee {
  String name;
  String position;
  double _salary;

  Employee(this.name, this.position, this._salary);

  double get salary => _salary;

  set salary(double newSalary) {
    if (newSalary > 0) {
      _salary = newSalary;
    } else {
      print("Invalid salary amount.");
    }
  }

  void performWork();

  void displayInfo() {
    print("Employee Name: $name");
    print("Position: $position");
    print("Salary: PHP ${_salary.toStringAsFixed(2)}");
  }
}

mixin Attendance {

  void recordAttendance() {
    print("Attendance successfully recorded.");
  }
}

class Manager extends Employee with Attendance {

  Manager(String name, String position, double salary)
      : super(name, position, salary);

  @override
  void performWork() {
    print("$name is managing employees and projects.");
  }
}

class Developer extends Employee with Attendance {

  Developer(String name, String position, double salary)
      : super(name, position, salary);

  @override
  void performWork() {
    print("$name is developing and maintaining software.");
  }
}

void main() {
  List<Employee> employees = [
    Manager("Heaven", "Manager", 45000),
    Developer("Renejay", "Developer", 35000),
  ];

  print("EMPLOYEE MANAGEMENT SYSTEM");

  for (Employee employee in employees) {
    print("\n--- EMPLOYEE DETAILS ---");

    employee.displayInfo();

    employee.performWork();

    if (employee is Manager) {
      employee.recordAttendance();
    } else if (employee is Developer) {
      employee.recordAttendance();
    }
  }

  employees[0].salary = 48000;

  print("\n--- UPDATED EMPLOYEE SALARY ---");
  print(
    "Heaven's New Salary: PHP "
    "${employees[0].salary.toStringAsFixed(2)}",
  );
}