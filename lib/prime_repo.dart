class PrimeRepo{
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
}