class Person {
  String name;
  num age;

  Person(this.name, this.age);

  printInfo(){
    print("${this.name} --- ${this.age}");
  }

  void run() {
    print("Person Run");
  }
}

class A extends Object {
  String info = "This is A";

  void printA() {
    print("A");
  }
  void run() {
    print("A Run");
  }
}

class B {
  void printB() {
    print("B");
  }

  void run() {
    print("B Run");
  }
}

class C extends Person with B,A {
  C(String name, num age) : super(name, age);
}