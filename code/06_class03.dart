main(List<String> args) {
  var p = Person('laoli',18);
  print(p);
  p.run();
}

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