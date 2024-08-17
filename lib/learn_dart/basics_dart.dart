void main() {
  final stu = Student(name: "John", age: 12, reg: "2123");
  print(stu.name);
  print(stu.age);
  print(stu.reg);
}

// Non-nullable class
class Person {
  String name;
  int age;

  // Make sure to use "required" with non-nullable attributes
  Person({required this.name, required this.age});
}

class Student extends Person {
  String? reg;

  // Constructor for Student, which also calls the Person constructor
  Student({required String name, required int age, this.reg})
      : super(name: name, age: age);
}
