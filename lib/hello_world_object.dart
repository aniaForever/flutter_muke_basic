import 'peaple.dart';

void main() {
  //1.类的属性和方法
  var peopleA = new People();
  peopleA.name = "hww";
  peopleA.age = 30;
  peopleA.work();

  //2.类的计算属性
  var rectangle = new Rectangle();
  rectangle.width = 10;
  rectangle.height = 15;
  print(rectangle.area);

  var rec2 = new Rectangle();
  rec2.area = 300;
  print(rec2.width);
}

//2.类的计算属性
class Rectangle {
  num width, height;

//  num get area {
//    return width * height;
//  }
  num get area => width * height; //计算属性的getter方法
  set area(value) {
    //计算属性的setter方法
    width = value / 5;
  }
}
