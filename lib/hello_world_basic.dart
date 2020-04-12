void main() {
  //1、输出
  print("hello world");

  //2、常量&变量
  var test1;
  print(test1);

  //单引号
  var a;
  a = 'hahahh';
  a = 20;
  print(a);

  //双引号
  var str;
  str = "啦啦啦啦啦";
  print(str);

  //const
  const testhahh = 10000;
  print(testhahh);

  //3.数据类型
  //int 整型(num类型)
  int b = 10;
  print(b);

  //double(num类型)
  double lala = 1.279;
  print(lala);

  num lallla = 1.39;
  print(lallla);

  double hha = 1.2;
  print(hha.toInt());

  int hahahh = 30;
  print(hahahh.isNaN); //是否是非数字
  print(hahahh.isEven); //偶数
  print(hahahh.isOdd); //奇数

  //Boolean类型
  bool c = true;
  print(c);

  //String 类型
  String strA = 'hahah';
  var strB = "hahah111";
  print(strA);
  print(strB);
  //三个引号创建多行字符串
  var d = '''lalla
  llal''';
  print(d);
  //r输出原始字符串
  var strC = "hello \n hww";
  print(strC);
  String strD = r'hello \n hww';
  print(strD);
  //运算符+,*,==,[]
  String yunsuanA = "zhu1 ";
  String yunsuanB = "zhu2";
  print(yunsuanA + yunsuanB);
  print(yunsuanA * 5); //赋值5次
  print(yunsuanA == yunsuanB); //比较的是内容
  print(yunsuanA[2]); //相当于是取字符串 下标的字符
  //
  print(yunsuanA.isEmpty);
  print(yunsuanA.isNotEmpty);
  print(yunsuanA.length);
  // $插值表达式
  String f = "a=$b";
  print(f);

  //4.数组
  var list1 = [1, 2, 3];
  var list2 = const [10, 20, 30];
  var list = [1, 2, 3, 'string'];
  print(list);

  var listTest = new List<dynamic>();
//  listTest=[3,4,5,5];
  listTest.add(0);
  listTest.add("a");
  listTest.add(10);
  print(listTest);

  //5.Map
  Map map1 = new Map();
  map1 = {"one": "dart", "second": "zhu"};
  print(map1);

  Map map2 = const {1: 10, 2: 20}; //常量map
  print(map2);

  Map map3 = {1: "haha1", 2: "haha2"}; //key value可以是任何类型的值
  print(map3);

  Map map4 = {1: "haha1", "23": "haha2"};
  print(map4);
  print(map4.keys);
  print(map4.values);

  map4.forEach(function); //遍历

  print(list.asMap()); //转化为map

  //6.控制语句
  //for循环
  var listControl = [1, 2, 3, 4, 5, 6];
  for (var i = 0; i < listControl.length; i++) {
    print(listControl[i]);
  }
  //for...in 循环
  for (var item in listControl) {
    print(item);
  }

  //case 中continue，不经常使用
  String caseTest = "zhu";
  switch (caseTest) {
    HAHAHA:
    case "hww":
      print("hww");
      break;
    case "zhu":
      print("zhu");
      continue HAHAHA;
    case "lalala":
      print("hww");
      break;
  }
}

void function(key, value) {
  print("key=$key,value=$value");
}
