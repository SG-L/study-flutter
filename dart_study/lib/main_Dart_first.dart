// Dart 입문

// enum
enum Status {
  approved,
  pending,
  rejected,
}

// typedef
typedef Operation = void Function(int x, int y);

void main() {
  // 한 줄 주석

  /*
   * 여러 줄 주석
   * 시작 /*
   * 종료 */
   */

  /// 문서 주석

  // 콘솔 출력
  print('hello world');

  // 값에 의한 타입 추론 변수 선언(타입이 고정 됨)
  var name = '문자열';
  //name = 1; >> 에러 발생

  // 값에 의한 타입 추론 변수 선언(타입이 고정되지 않음)
  dynamic name2 = '문자열';
  name2 = 1; // 정상 작동 함

  // 선언 후 값 변경 불가(런타임)
  final String name3 = '문자열';
  // name3 = '문자열2'; >> 에러 발생

  // 선언 후 값 변경 불가(빌드 타임)
  const String name4 = '문자열';
  // name4 = '문자열2'; >> 에러 발생

  /* final과 const의 차이
   * 런타임 함수인 DateTime.now()를 사용하여 값을 대입할 경우
   * - final String name = DateTime.now(); >> final은 런타임 시에 값이 대입되므로 정상 작동함
   * - const String name = DateTime.now(); >> const는 빌드타임 시에 값이 대입되므로 에러 발생
   * > 값이 빌드 시 확정이면 const 사용, 런타임 시 확정이면 final 사용
   */

  // 문자열
  String str = '문자열';
  // 정수
  int isInt = 10;
  // 실수
  double isDouble = 10.5;
  // 불리언
  bool isTrue = true;

  // List
  List<String> strList = ['문자1', '문자2', '문자3', '문자4'];
  print('strList: $strList');
  print('strList[0]: ${strList[0]}');
  print('strList[3]: ${strList[3]}');
  print('strList.length: ${strList.length}');

  strList[3] = '문자 3번 인덱스 값 변경';
  print('change strList[3]: $strList');

  // List.add == push
  strList = ['문자1', '문자2', '문자3', '문자4'];
  strList.add('문자5 추가');
  print('List.add: $strList');

  // List.where == filter
  strList = ['문자1', '문자2', '문자3', '문자4'];
  final Iterable<String> newStrList = strList.where((str) => str == '문자1' || str == '문자2');
  print('List.where: $newStrList');

  // List.map
  strList = ['1', '2', '3', '4'];
  final Iterable<String> newStrList2 = strList.map((str) => 'String $str');
  print('List.map: $newStrList2');

  // List.reduce
  List<int> intList = [1, 2, 3, 4, 5];
  final int sum = intList.reduce((sum, val) => sum + val);
  print('List.reduce: $sum');

  // List.fold
  strList = ['.', '..', '...', '....', '.....'];
  final String strListValue = strList.fold('', (listValue, value) => '$listValue, ${value.length}');
  print('List.fold: $strListValue');

  // Map
  Map<String, String> dictionary = {
    'Harry Potter': '해리 포터',
    'Ron Weasley': '론 위즐리',
    'Hermione Granger': '헤르미온느 그레인저',
  };
  print('dictionary[\'Harry Potter\']: ${dictionary['Harry Potter']!}');
  print('dictionary[\'Hermione Granger\']: ${dictionary['Hermione Granger']!}');

  // Map.keys
  print('dictionary.keys: ${dictionary.keys}');

  // Map.values
  print('dictionary.values: ${dictionary.values}');

  // Set(중복 제거 집합)
  Set<String> strSet = {'문자1', '문자2', '문자3', '문자3'};
  print('strSet: $strSet');

  // Set.contains
  print('Set.contains: ${strSet.contains('문자1')}');
  print('Set.contains: ${strSet.contains('문자4')}');

  // Set.toList
  print('Set.toList: ${strSet.toList()}');

  // Set.from
  strList = ['문자1', '문자2', '문자3', '문자3'];
  print('Set.from: ${Set.from(strList)}');

  // enum
  /* 상단부 선언
   * enum Status {
   *   approved,
   *   pending,
   *   rejected,
   * }
   */
  print('enum Status.values: ${Status.values}');
  print('enum Status.approved: ${Status.approved}');
  print('enum Status.pending: ${Status.pending}');
  print('enum Status.rejected: ${Status.rejected}');

  // 수치 연산자
  double number = 2;
  print('number + 2: ${(number + 2)}');
  print('number - 2: ${(number - 2)}');
  print('number * 2: ${(number * 2)}');
  print('number / 2: ${(number / 2)}');
  print('number % 3: ${(number % 3)}');
  print('number++: ${(number++)}');
  print('number--: ${(number--)}');
  print('++number: ${(++number)}');
  print('--number: ${(--number)}');
  print('number += 2: ${(number += 2)}');
  print('number -= 2: ${(number -= 2)}');
  print('number *= 2: ${(number *= 2)}');
  print('number /= 2: ${(number /= 2)}');

  // null ? 연산자(null 저장 허용)
  double? nullNumber = null;
  print('nullNumber: $nullNumber');
  // double number = null; >> 에러 발생

  // null ?? 연산자(null일 경우에만 값 대입)
  double? nullNumber2;
  print('nullNumber2: ${nullNumber2}');

  nullNumber2 ??= 3;
  print('nullNumber2 ??= 3: ${nullNumber2}');

  nullNumber2 ??= 4;
  print('nullNumber2 ??= 4: ${nullNumber2}');

  // 값 비교 연산자
  int number1 = 1;
  int number2 = 2;
  print('number1 > number2: ${(number1 > number2)}');
  print('number1 < number2: ${(number1 < number2)}');
  print('number1 >= number2: ${(number1 >= number2)}');
  print('number1 <= number2: ${(number1 <= number2)}');
  print('number1 == number2: ${(number1 == number2)}');
  print('number1 != number2: ${(number1 != number2)}');

  // 타입 비교 연산자
  int number3 = 3;
  print('number3 is int: ${(number3 is int)}');
  print('number3 is String: ${(number3 is String)}');
  print('number3 is! int: ${(number3 is! int)}');
  print('number3 is! String: ${(number3 is! String)}');

  // 논리 연산자
  bool result = 12 > 10 && 1 > 0;
  print('12 > 10 && 1 > 0: ${result}');

  bool result2 = 12 > 10 && 0 > 1;
  print('12 > 10 && 0 > 1: ${result2}');

  bool result3 = 12 > 10 || 1 > 0;
  print('12 > 10 || 1 > 0: ${result3}');

  bool result4 = 12 > 10 || 0 > 1;
  print('12 > 10 || 0 > 1: ${result4}');

  bool result5 = 12 < 10 || 0 > 1;
  print('12 <>> 10 || 0 > 1: ${result5}');

  // if
  int ifNum = 2;
  if (ifNum % 3 == 0) {
    print('if (ifNum % 3 == 0) >> 3의 배수입니다.');
  } else if (number % 3 == 1) {
    print('else if (ifNum % 3 == 1) >> 나머지가 1입니다.');
  } else {
    print('else >> 맞는 조건이 없습니다.');
  }

  // switch
  Status status = Status.approved;

  switch (status) {
    case Status.approved:
      print('switch (status): Status.approved');
      break;

    case Status.pending:
      print('switch (status): Status.pending');
      break;

    case Status.rejected:
      print('switch (status): Status.rejected');
      break;

    default:
      print('switch (status): default');
  }

  // for
  for (int i = 0; i < 3; i++) {
    print('for i: $i');
  }

  // for in
  List<int> forInList = [3, 6, 9];
  for (int num in forInList) {
    print('for in num: $num');
  }

  // while
  int total = 0;
  while (total < 10) {
    total += 1;
  }
  print('while total: $total');

  // do...while
  do {
    total += 1;
  } while (total < 10);
  print('do...while total: $total');

  // 포지셔닝 파라메터 함수
  int addNumbersByPositioningFunction(int a, int b) {
    return a + b;
  }
  print('addNumbersByPositioningFunction(1, 2): ${addNumbersByPositioningFunction(1, 2)}');

  // 네임드 파라메터 함수
  int addNumbersByNamedFunction({
    required int a,
    required int b,
  }) {
    return a + b;
  }
  print('addNumbersByNamedFunction(a: 1, b: 2): ${addNumbersByNamedFunction(a: 1, b: 2)}');

  // 포지셔닝 파라메터 함수 default value 지정
  int addNumbersByPositioningFunctionAndDefaultValue(int a, [int b = 2]) {
    return a + b;
  }
  print('addNumbersByPositioningFunctionAndDefaultValue(1): ${addNumbersByPositioningFunctionAndDefaultValue(1)}');

  // 네임드 파라메터 함수 default value 지정
  int addNumbersByNamedFunctionAndDefaultValue({
    required int a,
    int b = 2,
  }) {
    return a + b;
  }
  print('addNumbersByNamedFunctionAndDefaultValue(a: 1): ${addNumbersByNamedFunctionAndDefaultValue(a: 1)}');

  // 포지셔닝, 네임드 파라메터 혼합 함수
  int addNumbersByPositioningWithNamedFunction(
      int a,
      {
        required int b,
        int c = 4,
      }
      ) {
    return a + b + c;
  }
  print('addNumbersByPositioningWithNamedFunction(1, b: 2, c: 7): ${addNumbersByPositioningWithNamedFunction(1, b: 2, c: 7)}');

  // 익명 함수((매개변수) {함수바디})
  List<int> nums = [1, 2, 3, 4, 5];
  final int sumNums = nums.reduce((sum, val) {
    return sum + val;
  });
  print('익명 함수 sumNums: $sumNums');

  // 람다 함수((매개변수) => 하나의 스테이트먼트)
  nums = [1, 2, 3, 4, 5];
  final int sumNums2 = nums.reduce((sum, val) => sum + val);
  print('람다 함수 sumNums2: $sumNums2');

  // typedef(함수의 시그니처(함수의 선언부)를 정의)
  // 상단부 선언 typedef Operation = void Function(int x, int y);
  void add(int x, int y) {
    print('typedef Operation calculate add: ${x + y}');
  }
  void calculate(int x, int y, Operation oper) {
    oper(x, y);
  }
  calculate(1, 2, add);

  // try...catch
  try {
    final String finalName = 'SG';
    throw Exception('에러 발생');
    print('try finalName: $finalName');
  } catch(e) {
    print('catch e: $e');
  }
}