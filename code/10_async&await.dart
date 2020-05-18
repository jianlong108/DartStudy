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
/*
认识微任务队列
在前面学习学习中，我们知道Dart中有一个事件循环（Event Loop）来执行我们的代码，
里面存在一个事件队列（Event Queue），事件循环不断从事件队列中取出事件执行。

但是如果我们严格来划分的话，在Dart中还存在另一个队列：微任务队列（Microtask Queue）。

微任务队列的优先级要高于事件队列；

也就是说事件循环都是优先执行微任务队列中的任务，再执行 事件队列 中的任务；

那么在Flutter开发中，哪些是放在事件队列，哪些是放在微任务队列呢？

所有的外部事件任务都在事件队列中，如IO、计时器、点击、以及绘制事件等；

而微任务通常来源于Dart内部，并且微任务非常少。这是因为如果微任务非常多，就会造成事件队列排不上队，会阻塞任务队列的执行（比如用户点击没有反应的情况）；

说道这里，你可能已经有点凌乱了，在Dart的单线程中，代码到底是怎样执行的呢？

1、Dart的入口是main函数，所以main函数中的代码会优先执行；

2、main函数执行完后，会启动一个事件循环（Event Loop）就会启动，启动后开始执行队列中的任务；

3、首先，会按照先进先出的顺序，执行 微任务队列（Microtask Queue）中的所有任务；

4、其次，会按照先进先出的顺序，执行 事件队列（Event Queue）中的所有任务；
*/
import "dart:async";

main(List<String> args) {
  scheduleMicrotask(() {
    print("Hello Microtask");
  });
}