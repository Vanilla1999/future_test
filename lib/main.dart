import 'dart:async';
import 'package:computer/computer.dart';
import 'package:flutter/material.dart';

import 'prime_usecase.dart';

final computer = Computer.shared();
Future<void> main()async {

  await computer.turnOn(
    workersCount: 4, // optional, default 2
    verbose: true, // optional, default false
  );

  runApp(MyApp( computer: computer));
}

Future<C>calculate <T,B,C> (Function func,B data) async{
  try {
    return await computer.compute(func, param: data);
  } catch(e){
    print("ОШибка");
  return await computer.compute(func, param: data);

  }
}


class MyApp extends StatelessWidget {
  final  Computer computer;
  const MyApp({super.key, required this.computer});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home:  MyHomePage(title: 'Flutter Demo Home Page', computer: computer,),
    );
  }
}

int square(int a) => a * a;

Future<void> computeTest() async {

  var a = await calculate(printPrime,100000);
  print("compute $a");
}

Future<bool> isPrime(int n) async {
  if (n <= 1) {
    return false;
  }

  for (int i = 2; i < n; i++) {
    if (n % i == 0) {
      return false;
    }
  }

  return true;
}

Future<int> printPrime(int n) async {
  int count = 0;
  for (int i = 2; i <= n; i++) {
    if (await isPrime(i)) count++;
  }
  return count;
}
class MyHomePage extends StatefulWidget {
  final  Computer computer;
  const MyHomePage({super.key, required this.title, required this.computer});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
        final a =  PrimeUsecase();
        a.calculateClass();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
