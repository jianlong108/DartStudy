main(List<String> args) {
  final num = 2;
  print(num);
  // var o1 = OrderDetail('1',time);
  // var o2 = OrderDetail('1', time);
  // print(identical(o1,o2));

  var o1 = OrderDetail('1');
  var o2 = OrderDetail('1');
  print(identical(o1,o2));
}

class OrderDetail {
  final orderid;
  // final orderTime;
  const OrderDetail(this.orderid);
}
