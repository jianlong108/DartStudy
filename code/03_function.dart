
main(List<String> args) {
  //function
  print(add(1,2));

  print(sub(1,2));

  // 调用decription函数
  decription('jl'); // name=why age=null height=null
  decription('jl', age: 18); // name=why age=18 height=null
  decription('jl', age: 18, height: 1.88); // name=why age=18 height=1.88
  decription('jl', height: 1.88); // name=why age=null height=1.88

  printInfo('jl');
  printInfo('jl',18);
  //The argument type 'double' can't be assigned to the parameter type 'int'
  // printInfo('jl',17.6);
  printer('jl',age:16);

  runApp(()=> print('箭头函数&匿名函数'));

  runApp((){
    print('匿名函数');
    return 'app running';
  });

  CompleteBlock block = getHttpCode(10);
  block(20,false);
}

// 必选参数 num1 num2
int add(int num1, int num2) {
  return num1 + num2;
}

//不支持重载
//The name 'add' is already defined.
// int add(int a,int b,int c) {
//   return a + b + c;
// }

// 命名可选参数 比较常用
decription(String name, {int age, double height}) {
  print('命名可选参数 name=$name age=$age height=$height');
}

// 定义位置可选参数
printInfo(String name, [int age, double height]) {
  print('位置可选参数 name=$name age=$age height=$height');
}

//参数默认值
//参数默认值 只存在于可选参数中
printer(String name, {String gender='man',int age}) {
  print('参数默认值 name=$name gender=$gender age=$age');
}

// 箭头函数
//如果函数中只有一个表达式, 那么可以使用箭头语法(arrow syntax)
//注意, 这里面只能是一个表达式, 不能是一个语句
int sub(int num1, int num2) => num1 - num2;

//函数作为参数

runApp(Function func){
  print('runapp invoke');
  print(func());
}

requestDataID(Function complete) {
  print('requestDataID');
  complete('100',true);
}

requestCode(complete(int code, bool success)) {
  printInfo('requesetCode');
  complete(404,false);
}

typedef CompleteBlock = void Function(int,bool);
// requestCode(CompleteBlock block) {
//   printInfo('requesetCode');
//   block(404,false);
// }

CompleteBlock getHttpCode(int a) {
  print(a);
  a++;
  return (int code, bool success) {
    print('$a $code $success');
  };
}


