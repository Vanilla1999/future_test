import 'package:computer/computer.dart';
import 'package:future_test/prime_repo.dart';

import 'main.dart';

class PrimeUsecase{
final PrimeRepo primeRepo = PrimeRepo();
  final computer = Computer.create(); //Or Computer.shared()

  Future<void>init()async{
    await computer.turnOn(
      workersCount: 1, // optional, default 2
      verbose: false, // optional, default false
    );
  }

  Future<void>calculateClass()async{
    computeTest();
  }

  int square(int a) => a * a;

  Future<void> computeTest() async {

    var a = await primeRepo.printPrime(100000);
    print("compute $a");
  }
}
Future<int> _calculate  (PrimeRepo primeRepo,int data) async{
  try {
    return await computer.compute(primeRepo.printPrime, param: data);
  } catch(e){
    print("ОШибка");
    return 5;
  }
}