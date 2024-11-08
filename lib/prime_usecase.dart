import 'dart:async';
import 'dart:isolate';

import 'package:computer/computer.dart';
import 'package:flutter/material.dart';
import 'package:future_test/prime_repo.dart';

import 'main.dart';

class PrimeUsecase {
  final PrimeRepo primeRepo = PrimeRepo();

  Future<void> init() async {}

  Future<void> calculateClass() async {
    print('Синхронный код1'); // 1
    print('Синхронный код2'); // 2
    hobaFuture1();
    print('Синхронный код9'); // 9
    print('Синхронный код10'); // 10
    hobaFuture2();
    hobaFuture3();
    print('Синхронный код17'); // 17
    print('Синхронный код18'); // 18
    // await primeRepo.printPrime(100000);
    //  Future.microtask(() => print('microtask 1'));
    //  print("");
    //  print(await Isolate.run(() => _calculate(primeRepo)));
    //  final recievePort = ReceivePort();
    //  final isolate = await Isolate.spawn(
    //      (message) => _startRemoteIsolate(message), recievePort.sendPort);
    //  recievePort.listen((message) {
    //    if (message is SendPort) {
    //      final sendPort = message;
    //      final worker = _Worker(primeRepo, computation: _calculateWithPort);
    //      sendPort.send(worker);
    //    }
    //    else{
    //    print(message);
    //    recievePort.close();
    //    isolate.kill();
    //    }
    //  });
  }
}

Future<void> hobaFuture1() async {
  print('Синхронный код3'); // 3
  print('Синхронный код4'); // 4
 await  hobaFuture5();
  print('Синхронный код6'); // 6
  hobaFuture4(); // hoba4
  print('Синхронный код8'); // 8
}

Future<void> hobaFuture2() async {
  print('Синхронный код11'); // 11
  print('Синхронный код12'); // 12
  print(await hobaFuture4()); // 13
  print('Синхронный код19'); // 19
  hobaFuture4(); // hoba4
  print('Синхронный код21'); // 21
}

Future<void> hobaFuture3() async {
  print('Синхронный код14'); // 14
  print('Синхронный код15'); // 15
  print(await hobaFuture4()); // hoba4
  print('Синхронный код22'); // 22
  hobaFuture4(); // hoba4
  print('Синхронный код24'); // 24
}

Future<String> hobaFuture4() async {
  print("hoba4");
  return "hobaReturn";
}

Future<void> hobaFuture5(){
  return Future(() => print("hoba5"));
}

Future<void> _calculate1() async {
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

Future<int> _calculate(PrimeRepo primeRepo) async {
  try {
    return await primeRepo.printPrime(100000);
  } catch (e) {
    print("ОШибка");
    return 5;
  }
}

void _startRemoteIsolate(SendPort sendPort) async {
  final receivePort = ReceivePort();
  sendPort.send(receivePort.sendPort);
  receivePort.listen((message) async {
    final worker = message as _Worker;
    sendPort.send(await worker.computation(worker.param));
  });
  //worker.sendPort.send("kek");
}

Future<int> _calculateWithPort(PrimeRepo primeRepo) async {
  try {
    return await primeRepo.printPrime(100000);
  } catch (e) {
    print("ОШибка");
    return 5;
  }
}

class _Worker<T> {
  final Function computation;
  final T param;

  _Worker(this.param, {required this.computation});
}
