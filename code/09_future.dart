/* 程序中的耗时操作

针对如何处理耗时的操作，不同的语言有不同的处理方式。
+ 处理方式一： 多线程，比如Java、C++，我们普遍的做法是开启一个新的线程（Thread），在新的线程中完成这些异步的操作，再通过线程间通信的方式，将拿到的数据传递给主线程。
+ 处理方式二： 单线程+事件循环，比如JavaScript、Dart都是基于单线程加事件循环来完成耗时操作的处理。不过单线程如何能进行耗时的操作呢？！
*/


/*

单线程异步操作：

其实它们并不冲突：

  因为我们的一个应用程序大部分时间都是处于空闲的状态的，并不是无限制的在和用户进行交互。

  比如等待用户点击、网络请求数据的返回、文件读写的IO操作，这些等待的行为并不会阻塞我们的线程；

  这是因为类似于网络请求、文件读写的IO，我们都可以基于非阻塞调用；

阻塞式调用和非阻塞式调用

  需要知道操作系统中的阻塞式调用和非阻塞式调用的概念。

  阻塞和非阻塞关注的是程序在等待调用结果（消息，返回值）时的状态。

  阻塞式调用： 调用结果返回之前，当前线程会被挂起，调用线程只有在得到调用结果之后才会继续执行。

  非阻塞式调用： 调用执行之后，当前线程不会停止执行，只需要过一段时间来检查一下有没有结果返回即可。

我们用一个生活中的例子来模拟：

  你中午饿了，需要点一份外卖，点外卖的动作就是我们的调用，拿到最后点的外卖就是我们要等待的结果。

  阻塞式调用： 点了外卖，不再做任何事情，就是在傻傻的等待，你的线程停止了任何其他的工作。

  非阻塞式调用： 点了外卖，继续做其他事情：继续工作，你的线程没有继续执行其他事情，只需要偶尔去看一下有没有人敲门，外卖有没有送到即可。

而我们开发中的很多耗时操作，都可以基于这样的 非阻塞式调用：

  比如网络请求本身使用了Socket通信，而Socket本身提供了select模型，可以进行非阻塞方式的工作；

  比如文件读写的IO操作，我们可以使用操作系统提供的基于事件的回调机制；

这些操作都不会阻塞我们单线程的继续执行，我们的线程在等待的过程中可以继续去做别的事情：喝杯咖啡，等真正有了响应，再去进行对应的处理即可。

*/


// 单线程是如何来处理网络通信、IO操作它们返回的结果呢？答案就是事件循环（Event Loop）

/*
Dart事件循环
   什么是事件循环
单线程模型中主要就是在维护着一个事件循环（Event Loop）。

事件循环是什么呢？

  事实上事件循环并不复杂，它就是将需要处理的一系列事件（包括点击事件、IO事件、网络事件）放在一个事件队列（Event Queue）中。

  不断的从事件队列（Event Queue）中取出事件，并执行其对应需要执行的代码块，直到事件队列清空位置。

*/
// 我们来写一个事件循环的伪代码：
// 这里我使用数组模拟队列, 先进先出的原则


// 事件循环从启动的一刻，永远在执行
/*
List eventQueue = []; 
var event;
while (true) {
  if (eventQueue.length > 0) {
    // 取出一个事件
    event = eventQueue.removeAt(0);
    // 执行该事件
    event();
  }
}
*/
// 当我们有一些事件时，比如点击事件、IO事件、网络事件时，它们就会被加入到eventLoop中，
// 当发现事件队列不为空时发现，就会取出事件，并且执行。

/*
一个按钮RaisedButton，当发生点击时执行onPressed函数。

onPressed函数中，我们发送了一个网络请求，请求成功后会执行then中的回调函数。

RaisedButton(
  child: Text('Click me'),
  onPressed: () {
    //future对象
    final myFuture = http.get('https://example.com');
    myFuture.then((response) {
      if (response.statusCode == 200) {
        print('Success!');
      }
    });
  },
)

这些代码是如何放在事件循环中执行呢？

  1、当用户发生点击的时候，onPressed回调函数被放入事件循环中执行，执行的过程中发送了一个网络请求。

  2、网络请求发出去后，该事件循环不会被阻塞，而是发现要执行的onPressed函数已经结束，会将它丢弃掉。

  3、网络请求成功后，会执行then中传入的回调函数，这也是一个事件，该事件被放入到事件循环中执行，执行完毕后，事件循环将其丢弃。

  尽管onPressed和then中的回调有一些差异，但是它们对于事件循环来说，都是告诉它：我有一段代码需要执行，快点帮我完成。
*/

//Dart 异步操作： Future async await

import "dart:io";

//同步的请求
main(List<String> args) {
  print("main function start");
  // print(getNetworkData());
  // print(asyncGetNetworkData());

  // asyncGetNetworkData().then((value){
  //   print(value);
  // }).catchError((error){
  //   print(error);
  // });

  asyncGetNetworkData().then((value1) {
    print(value1);
    return "content data2";
  }).then((value2) {
    print(value2);
    return "message data3";
  }).then((value3) {
    print(value3);
  });
  print("main function end");


  
}

String getNetworkData() {
  sleep(Duration(seconds: 3));
  return "network data";
}

Future<String> asyncGetNetworkData() {
  return Future<String>(() {
    sleep(Duration(seconds: 3));
    return "network data";
    // throw Exception("抛个错误试试");
  });
}


/**
Future的使用过程：

  1、创建一个Future（可能是我们创建的，也可能是调用内部API或者第三方API获取到的一个Future，总之你需要获取到一个Future实例，Future通常会对一些异步的操作进行封装）；

  2、通过.then(成功回调函数)的方式来监听Future内部执行完成时获取到的结果；

  3、通过.catchError(失败或异常回调函数)的方式来监听Future内部执行失败或者出现异常时的错误信息；
 */


//官网： https://dart.dev/codelabs/async-await
 /**
 事实上Future在执行的整个过程中，我们通常把它划分成了两种状态：

状态一：未完成状态（uncompleted）

  执行Future内部的操作时（在上面的案例中就是具体的网络请求过程，我们使用了延迟来模拟），我们称这个过程为未完成状态

状态二：完成状态（completed）

  当Future内部的操作执行完成，通常会返回一个值，或者抛出一个异常。

这两种情况，我们都称Future为完成状态。
 */

 /**
 其他api

 main(List<String> args) {
  print("main function start");

  Future.value("哈哈哈").then((value) {
    print(value);
  });

  Future.error(Exception("错误信息")).catchError((error) {
    print(error);
  });

  //在延迟一定时间时执行回调函数，执行完回调函数后会执行then的回调
  Future.delayed(Duration(seconds: 3), () {
    return "3秒后的信息";
  }).then((value) {
    print(value);
  });
  print("main function end");

  //main function start
  //main function end
  //哈哈哈
  //错误消息

  //"3秒后的信息"



}
 */