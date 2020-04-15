/**
await、async
理论概念理解

await、async是什么呢？

  它们是Dart中的关键字（你这不是废话吗？废话也还是要强调的，万一你用它做变量名呢，无辜脸。）

  它们可以让我们用同步的代码格式，去实现异步的调用过程。

  并且，通常一个async的函数会返回一个Future。

我们已经知道，Future可以做到不阻塞我们的线程，让线程继续执行，并且在完成某个操作时改变自己的状态，
并且回调then或者errorCatch回调。

如何生成一个Future呢？

  1、通过我们前面学习的Future构造函数，或者后面学习的Future其他API都可以。

  2、还有一种就是通过async的函数。
*/

import "dart:io";

main(List<String> args) {
  print("main function start");
  // print(getNetworkData());

  getNetworkData().then((v){
    print(v);
  });

  print("main function end");
}

// String getNetworkData() {
//   var result = Future.delayed(Duration(seconds: 3), () {
//     return "network data";
//   });

//   return  "请求到的数据：" + result;
// }

Future<String> getNetworkData() async {
  var result = await Future.delayed(Duration(seconds: 3), () {
    return "network data";
  });

  return  "请求到的数据：" + result;
}

// 认识微任务队列
// 多核CPU的利用
// Isolate的理解