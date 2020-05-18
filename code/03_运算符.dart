main(List<String> args) {

  var a = 10;
  var b = 3;
  // 加减乘除，取余
  print("a=${a},b=${b},a+b=${a+b}");
  print("a=${a},b=${b},a-b=${a-b}");
  print("a=${a},b=${b},a*b=${a*b}");
  print("a=${a},b=${b},a/b=${a/b}");
  print("a=${a},b=${b},a%b=${a%b}");
  //取整
  print("a=${a},b=${b},a~/b=${a~/b}");

  if (a>b) {
    print("a>b");
  } else if (a==b) {
    print("a==b");
  } else {
    print("a<b");
  }

  for (var i = 0; i < 3; i++) {
    print("for (var i = 0; i < 3; i++) {i=${i}}");
  }

  for (var e in [1,3,5]) {
    print("for (var e in [1,3,5]) {e=${e}}");
  }

  while (b>0) {
    print("while (b>9) {b=$b}");
    b--;
  }

  // ??= 当??=左边的值为 null时，会将右侧变量或者表达式的值，赋值给左边的变量
  var company = 'A';
  var previous = null;

  company ??= 'T';
  previous ??= 'T';
  print('company=$company,previous=$previous');

  // ?? 表达式
  var flag = 2<1 ?? 1>2;
  print("var flag = 2<1 ?? 1>2; flag=$flag");

  flag = temp() ?? 2>1;
  print("flag = temp() ?? 2>1; flag=$flag");
}

temp(){
  print('函数temp 被调用');
}
