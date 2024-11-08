// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:future_test/main.dart';

Future<void> main() async{
  _calculate1();
  _calculate2();
  _calculate3();
  print('Fetching user order...');
}

Future<void> test() {
  return Future(() {
    print("A");
    Future(() {
      print("B");
      Future(() => print("C"));
      Future.microtask(() => print("D"));
      Future(() {
        print("E");
        return 5;
      }).then((value) => print(value)).catchError((error,s){
        print("error"+error.toString());
      });
      print("F");
    });
    print("G");
  });
}
Future<void> _calculate1() async {
  // Future(() {
  //   print("delay");
  // });
 delay();
  print("1");
}
Future<void> _calculate2() async {
  print("2");
  await Future.delayed(Duration(seconds: 2));
  print("4");
}
Future<void> _calculate3() async {
  await Future.delayed(Duration(seconds: 1));
  print("3");
}
Future<void> delay() async {
  print("delay");
}

Future<void> test1() async{

    print("A");
    await Future(() {
      print("B");
      Future(() => print("C"));
      Future.microtask(() => print("D"));
      Future(() {
        print("E");
        return 5;
      }).then((value) => print(value));
      print("F");
    });
    print("G");
}
