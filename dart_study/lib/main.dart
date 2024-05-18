import 'dart:async';

void main() async {
  // 비동기
  final result1 = addNumbers(1, 1);
  print('result1: $result1');

  // 비동기 내부 async await
  final result2 = asyncAddNumbers(1, 1);
  print('result2: $result2');

  // 비동기 내부 async await
  final result3 = asyncAddNumbers(2, 2);
  print('result3: $result3');

  // 비동기 내/외부 async await
  final result4 = await asyncAddNumbers(3, 3);
  print('result4: $result4');

  // 비동기 내/외부 async await
  final result5 = await asyncAddNumbers(4, 4);
  print('result5: $result5');

  // 비동기 Stream
  final controller = StreamController();
  final stream = controller.stream;

  final streamListener1 = stream.listen((val) {
    print('stream val: $val');
  });

  controller.sink.add(1);
  controller.sink.add(2);
  controller.sink.add(3);
  controller.sink.add(4);

  // 비동기 Broadcast Stream
  final controller2 = StreamController();
  final broadcastStream = controller2.stream.asBroadcastStream();

  final broadcastStreamListener1 = broadcastStream.listen((val) {
    print('broadcast stream listening 1: $val');
  });
  final broadcastStreamListener2 = broadcastStream.listen((val) {
    print('broadcast stream listening 2: $val');
  });

  controller2.sink.add(1);
  controller2.sink.add(2);
  controller2.sink.add(3);

  // 비동기 Stream 반환 함수
  calculate(0, 5).listen((val) {
    print('Stream calculate(0, 5): $val');
  });
  calculate(5, 10).listen((val) {
    print('Stream calculate(5, 10): $val');
  });
}

int addNumbers(int number1, int number2) {
  print('addNumbers $number1 + $number2 계산 시작!');

  // Future.delayed = 일정 시간 후(비동기) 콜백 함수를 실행 하는 함수
  Future.delayed(Duration(seconds: 3), () {
    print('addNumbers $number1 + $number2 = ${number1 + number2}');
  });

  print('addNumbers $number1 + $number2 코드 실행 끝');

  return number1 + number2;
}

Future<int> asyncAddNumbers(int number1, int number2) async {
  print('asyncAddNumbers $number1 + $number2 계산 시작!');

  await Future.delayed(Duration(seconds: 3), () {
    print('asyncAddNumbers $number1 + $number2 = ${number1 + number2}');
  });

  print('asyncAddNumbers $number1 + $number2 코드 실행 끝');

  return number1 + number2;
}

Stream<String> calculate(int number1, int number2) async* {
  for (int i = number1; i < number2; i++) {
    yield 'i = $i';
    await Future.delayed(Duration(seconds: 1));
  }
}
