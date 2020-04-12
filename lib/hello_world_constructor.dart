void main() {
  var student = new Student("hww", 18, "male");
  var student2 = new Student.withName("hww", "female");

  const people = const People("zhu", 50);//常量构造方法
}

class Student {
  String name;
  int age;
  final String gender;

//  Student() {} //1.默认构造方法

//  Student(String name,int age){//2.自定义构造方法
//    this.name=name;
//    this.age=age;
//  }

  Student(
      this.name, this.age, this.gender); //3.自定义构造方法//4.使用这种方式，可以对final的属性进行赋值

  Student.withName(this.name, this.gender); //5.命名构造方法
}

class People {
  final String peopleName;
  final int peopleAge;

  const People(this.peopleName, this.peopleAge); //6.常量构造方法
}
