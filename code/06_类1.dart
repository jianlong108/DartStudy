main(List<String> args) {
  
  // var p = Person();
  // print(p);

  // const s1 = Student(1);
  // const s2 = Student(2);
  // print(identical(s1,s2)); 

  // var s1 = Student(2);
  // var s2 = Student(3);
  // var s3 = Student.initWithNum(4);

  // print(identical(s1,s2));
  // print(identical(s2,s3));
  var dog = Dog('red');
  dog.setColor('yellow');
  print(dog._color);
  // print(object)
}

class Person {
  String name;
  study() {
    print('person study');
  }
  @override
  String toString() {
    return "Person: $name";
  }
}

// class Student {
//   final int num;
//   const Student(this.num);
//   // const Student(num){
//   //   this.num = num;
//   // }

//   // tmp(){
//   //   return instance;
//   // }
// }

//如果一个构造函数并不总是返回一个新的对象，则使用 factory 来定义 这个构造函数。
//例如，一个工厂构造函数 可能从缓存中获取一个实例并返回，或者 返回一个子类型的实例。

class Student {
  int num;
  // const Student(this.num);

  // static final Student _singleton = Student._internal();
  static Student _singleton;
  factory Student(num) {
    if (_singleton == null) {
      _singleton = Student._internal(num);
    }
    return _singleton;
  }

  // Student.initWithNum(this.num);

  Student._internal(this.num);
}

// getter setter
class Dog {
  String _color;
  Dog(this._color); 

  get getColor {
    print('Dog getter');
    return _color;
  }

  set setColor(String color) {
    print('Dog setter');
    _color = color;
  }

}



