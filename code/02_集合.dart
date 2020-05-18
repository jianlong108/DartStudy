main(List<String> args) {

  //List Set Map

  // List定义 数组
  // 1.使用类型推导定义
  var letters = ['a', 'b', 'c', 'd'];
  print('$letters ${letters.runtimeType}');

  // 2.明确指定类型
  List<int> numbers = [1, 2, 3, 4];
  print('$numbers ${numbers.runtimeType}');

  // 3.混合类型
  List objects = [1, 2, 3, 4,'a'];
  print('$objects ${objects.runtimeType}');

  var objs = ['a', 'b', 'c', 'd', 1];
  print('$objs ${objs.runtimeType}');

  print('--------------Set---------------');
  //Set 无序集合 且不能有重复元素
  var letters_set = {'a', 'b', 'c', 'd'};
  print('$letters_set ${letters_set.runtimeType}');

  // 2.明确指定类型
  Set<int> numbers_set = {1, 2, 3, 4};
  print('$numbers_set ${numbers_set.runtimeType}');

  // 3.混合类型
  Set set_objects = {1, 2, 3, 4,'a'};
  print('$set_objects ${set_objects.runtimeType}');

  var set_objs = {'a', 'b', 'c', 'd', 1};
  print('$set_objs ${set_objs.runtimeType}');

  //Set和List最大的两个不同就是：Set是无序的，并且元素是不重复的。

  print('--------------Map---------------');
  //Map
  // 1.使用类型推导定义
  var infoMap1 = {'name': 'xiaoli', 'age': '18'};
  print('$infoMap1 ${infoMap1.runtimeType}');

  // 2.明确指定类型
  Map<String, Object> infoMap2 = {'height': 1.88, 'address': '北京市'};
  print('$infoMap2 ${infoMap2.runtimeType}');

  Map map = {'height': 1.88, 'address': '北京市', 100: 200};
  print('$map ${map.runtimeType}');

  //常见操作
  // 获取集合的长度

  // var letters = ['a', 'b', 'c', 'd'];
  print(letters.length);
  print(letters[1]);

  // var letters_set = {'a', 'b', 'c', 'd'};
  print(letters_set.length);
  // print(letters_set.any(bool ('d'){

  // }));

  // var infoMap1 = {'name': 'xiaoli', 'age': '18'};
  print(infoMap1.length);

  // 添加/删除/包含元素
  numbers.add(5);
  numbers_set.add(5);
  print('$numbers $numbers_set');

  numbers.remove(1);
  numbers_set.remove(1);
  print('$numbers $numbers_set');

  print(numbers.contains(2));
  print(numbers_set.contains(2));

  // List根据index删除元素
  numbers.removeAt(3);
  print('$numbers');

  // Map的操作
  // 1.根据key获取value
  print(infoMap1['name']); // jl

  // 2.获取所有的entries
  print('${infoMap1.entries} ${infoMap1.entries.runtimeType}'); // (MapEntry(name: jl), MapEntry(age: 18)) MappedIterable<String, MapEntry<String, Object>>

  // 3.获取所有的keys
  print('${infoMap1.keys} ${infoMap1.keys.runtimeType}'); // (name, age) _CompactIterable<String>

  // 4.获取所有的values
  print('${infoMap1.values} ${infoMap1.values.runtimeType}'); // (jl, 18) _CompactIterable<Object>

  // 5.判断是否包含某个key或者value
  print('${infoMap1.containsKey('age')} ${infoMap1.containsValue(18)}'); // true true

  // 6.根据key删除元素
  infoMap1.remove('age');
  print('${infoMap1}'); // {name: jl}
}