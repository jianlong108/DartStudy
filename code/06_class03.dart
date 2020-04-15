// main(List<String> args) {
//   var p = Person('laoli',18);
//   print(p);
//   p.run();

//   var h = Hero('laoli',58);
//   h.smoke();
// }

class Animal {
  int age;

  Animal(this.age);

  run() {
    print('在奔跑ing');
  }
}
//
//父类中的所有成员变量和方法都会被继承,，但是构造方法除外

// 子类中可以调用父类的构造方法，对某些属性进行初始化：

// 子类的构造方法在执行前，将隐含调用父类的无参默认构造方法（没有参数且与类同名的构造方法）。

// 如果父类没有无参默认构造方法，则子类的构造方法必须在初始化列表中通过super显式调用父类的某个构造方法。
class Person extends Animal {
  String name;

  // Person(String name, int age) : name=name, super(age);
  Person(this.name,int age):super(age);

  @override
  run() {
    print('$name在奔跑ing');
  }

  @override
  String toString() {
    return 'name=$name, age=$age';
  }
}

//继承是多态使用的前提。

// 定义很多通用的**调用接口**时, 我们通常会让调用者传入父类，通过多态来实现更加灵活的调用方式。

// 但是，父类本身可能并不需要对某些方法进行具体的实现，所以父类中定义的方法,，我们可以定义为抽象方法。

// 什么是 抽象方法? 在Dart中没有具体实现的方法(没有方法体)，就是抽象方法。

// 抽象方法，必须存在于抽象类中。

// 抽象类是使用abstract声明的类。

abstract class Shape {
  getArea();
}

class Circle extends Shape {
  double r;

  Circle(this.r);

  @override
  getArea() {
    return r * r * 3.14;
  }
}

class Reactangle extends Shape {
  double w;
  double h;

  Reactangle(this.w, this.h);

  @override
  getArea() {
    return w * h;
  }
}

//注意：
//抽象类不能实例化.

//抽象类中的抽象方法必须被子类实现, 抽象类中的已经被实现方法, 可以不被子类重写.


// Dart中的接口比较特殊, 没有一个专门的关键字来声明接口.

// 默认情况下，定义的每个类都相当于默认也声明了一个接口，可以由其他的类来实现(因为Dart不支持多继承)

// 在开发中，我们通常将用于给别人实现的类声明为抽象类:

abstract class Runner {
  run();
}

abstract class Flyer {
  fly();
}

class SuperMan implements Runner, Flyer {
  @override
  run() {
    print('超人在奔跑');
  }

  @override
  fly() {
    print('超人在飞');
  }
}

/* Mixin混入
在通过implements实现某个类时，类中所有的方法都必须被重新实现(无论这个类原来是否已经实现过该方法)。

但是某些情况下，一个类可能希望直接复用之前类的原有实现方案，怎么做呢?

使用继承吗？但是Dart只支持单继承，那么意味着你只能复用一个类的实现。

Dart提供了另外一种方案: Mixin混入的方式

除了可以通过class定义类之外，也可以通过mixin关键字来定义一个类。

只是通过mixin定义的类用于被其他类混入使用，通过with关键字来进行混入。
*/

mixin Smoker {
  smoke() {
    print('抽烟');
  }
}

mixin Drinker {
  drink() {
    print('喝酒');
  }
}

// implements的方式要求必须对其中的方法进行重新实现
// class SuperMan implements Runner, Flyer {}

class Hero with Smoker, Drinker {
  var name;
  var age;
  Hero(this.name,this.age);
}

/*
前面我们在类中定义的成员和方法都属于对象级别的, 在开发中, 我们有时候也需要定义类级别的成员和方法

在Dart中我们使用static关键字来定义:
*/


main(List<String> args) {
  var stu = Student();
  stu.name = 'laoli';
  stu.sno = 110;
  stu.study();

  Student.time = '早上8点';
  // stu.time = '早上9点'; 错误做法, 实例对象不能访问类成员  
  Student.attendClass();  // stu.attendClass(); 错误做法, 实现对象不能‍访问类方法

  print(Colors.red);
  print(Colors.red.index);
  print(Colors.green.index);
  print(Colors.blue.index);

  print(Colors.values);
}

class Student {
  String name;
  int sno;

  static String time;

  study() {
    print('$name在学习');
  }

  static attendClass() {
    print('去上课');
  }
}

//枚举

enum Colors {
  red,
  green,
  blue
}