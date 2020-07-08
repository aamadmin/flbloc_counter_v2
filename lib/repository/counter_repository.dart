import 'dart:math';

class CounterRepository {
  Future<int> getRandomValue() async {
    return Future.delayed(Duration(seconds: 2))
        .then((value) => Random().nextInt(100));
  }
}
