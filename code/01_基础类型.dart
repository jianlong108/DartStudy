import 'dart:io';

main(List<String> args) {
  //控制台 打印
  print("hello dart");

  // 变量定义
  String name = 'xiaoli';
  int age = 18;
  double height = 1.80;
  //常量
  final bool isMan = true;
  const String familyName = "li";
  print("name:${name} age:$age height:$height isMan:$isMan familyname:$familyName");

  print('-------------10年后-----------');
  //10年后
  name = "laoli";
  age = 28;

  // A value of type 'String' can't be assigned to a variable of type 'int'.
  // age = '28周岁';

  print("name:$name age:$age height:$height isMan:$isMan");
  //类型推导
  // var/dynamic/const/final 变量名称 = 赋值;
  dynamic score = 99; //不常用
  print('score=$score type=${score.runtimeType}'); 
  // var score = 99;
// A value of type 'double' can't be assigned to a variable of type 'int'.
  score = 100.0;
  print('score=$score type=${score.runtimeType}'); 

  score = '优秀';
  print('score=$score type=${score.runtimeType}'); ;


/*
  final和const有什么区别呢?
    const在赋值时, 赋值的内容必须是在编译期间就确定下来的
    final在赋值时, 可以动态获取, 比如赋值一个函数
*/
  // final int num = getNum();
  // Const variables must be initialized with a constant value.
  // const num = getNum();
  const num = 10;
  print(num);

  final date = DateTime.now();
  // const date = DateTime.now();
  print('当前的时间 $date');

  sleep(Duration(seconds: 2));
  // final一旦被赋值后就有确定的结果, 不会再次赋值
  print('2秒后的时间 $date');


  //bool 不存在非零即真
  // Conditions must have a static type of 'bool'.
  // if (name) {
  if (isMan) {
    print("老李是男人");
  }else{
    print("老李不是男人");
  }
  //简单数据转换 int -> String
  var ageStr = age.toString();
  print("agestr:$ageStr type:${ageStr.runtimeType}");

  // double->String 注意四舍五入
  var scoreStr = 92.345.toStringAsFixed(2);
  print(scoreStr);

  // String -> int
  var goodnum = int.parse('100');
  print("goodnum:$goodnum type: ${goodnum.runtimeType}");

  //Dart字符串是UTF-16编码单元的序列。使用 '''字符串:

  var ourname = '''
      中国人👍⚽️
          阿里人👍
            小二😸
                ''';
  print(ourname);

}

//简单的函数定义
int getNum() 
{
  return 108;
}

//包含返回值 参数
int add(int a, int b)
{
  return a + b;
}