void main() {
  print(func1("hww", "zhu"));
  printPerson("hww", 30);
  printPerson("zhu", "lala");
  print(func2(10, 20));
  print(getName("hww", "zhu"));

  printStudent("hww", sex: "male", age: 20);
  printStudent("hww");
  printStudent("hww", age: 23);

  printStudent2("hww");
  printStudent2("hww", "female");
  printStudent2("hww", "female", 30);

  printStudent3("hww");

  //方法可作为对象赋值给其他变量
  var func = printHello; //注意这里不需要带()括号
  func();
  //也可以直接用Function接收
  Function function = printHello;
  function();

  //5.匿名方法
  //有参数的
  Function function2= (String a,String b){
    String result=a+b;
    return result;
  };
  print(function2("hww","zhu"));
  //无参数的匿名方法
  Function function3=(){
    print("this is a niming fun");
  };
  function3();
  //简写 不推荐使用，可读性差
  (){
    print("this is a niming fun jianxie");
  }();


  var a=funcBibao();
  a();
  a();
  a();
}

//1.方法定义
//普通方法
String func1(String a, String b) {
  return a + b;
}

//返回值和参数类型都可以忽略
printPerson(name, age) {
  print("name=$name,age=$age");
}

//箭头语法
func2(a, b) => a + b;

getName(String a, String b) => b == "hww" ? a : b;

//2.可选参数
//基于名称传参数
printStudent(String name, {String sex, int age}) {
  print("printStudent:name=$name+sex=$sex+age=$age");
}

//基于位置传参数
printStudent2(String name, [String sex, int age]) {
  print("printStudent2:name=$name+sex=$sex+age=$age");
}

//3.默认参数
printStudent3(String name, {String sex = "haha", int age = 21}) {
  print("printStudent3:name=$name+sex=$sex+age=$age");
}

//4.方法对象
void printHello() {
  print("hello");
}

//5.匿名方法（见上面）

//6.闭包
funcBibao(){
  int count =1;
  printCount(){//这是一个闭包（方法）
    print(++count);
  }
  return printCount;//返回了一个闭包（方法）（对象）
}