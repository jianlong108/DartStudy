
import 'dart:math';

main(List<String> args) {

  //级联语法
  var p = Person()
    ..name = 'laoli'
    ..height = 1.88
    ..eat()
    ..run();

  p.changeName('hanmeimei');


  Student s = Student('xiaoming');
  // s = Student();
  print(s);

  s = Student.withNameAndNum('hanmeimei', 1);
  print(s);

  var p = Point(3, 4);
  print(p);
}

class Person {
  String name;
  var height;
  bool male = true;
  run(){
    print("$name run");
  }
  eat(){
    print('$this.name eat');
  }
  study(){
    print('$this.height $name study');
  }
  //Dart的开发风格中，在方法中通常使用属性时，会省略this，
  //但是有命名冲突时，this不能省略；
  changeName(String name) {
    print('之前的名字 ${this.name}');
    this.name = name;
    print('现在的名字 ${this.name}');
  }
}

// construction
class Student {
  String name;
  int num;
  double score;
  //默认构造函数
  // Student() {
  //   print('call Student() ');
  // }

  //不能同👆 共存。因为dart不支持函数重载
  Student(String name) {
    this.name = name;
    print('call Student(name) ');
  }

  //初始化列表  等同于👆的方式
  Student(this.name) {
    print('call Student(this.name) ');
  }

  //如何实现这种方式的构造方法？
  // initWithName(String name){

  // }

  //命名构造函数
  Student.withNameAndNum(String name,int num) {
    this.name = name;
    this.num = num;
  }
  Student.initWithNameAndNum(this.name,this.num) {

  }


  //重定向构造函数
  // Redirecting constructors can't have a body.
  // Try removing the body, or not making this a redirecting 

  // Student.initWithNameAndNum(String name,int num):this(name) {
  //   this.num = num;
  // }
  Student.initWithNameAndNumAndScore(String name, var num):this(name);

  @override
  String toString() {
    return "name:$name num:$num";
  }
}

const p = point
class Point {
  // final x;
  // final y;
  // final distance;
  //初始化列表
  // Point(this.x,this.y):distance=sqrt(x*x + y*y);

  // Point(x,y) {
  //   this.x = x;
  //   this.y = y;
  // }

  // var x;
  // var y;
  // var distance;
  // Point(this.x,this.y) {
  //   distance = sqrt(x*x+y*y);
  // }

  // @override
  // String toString() {
  //   return "x:$x y:$y distance:$distance";
  // }
}
