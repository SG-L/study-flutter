// Dart 객체지향 프로그래밍
import 'package:intl/intl.dart';

// 추상 클래스
abstract class AbstractDoll {
  final String name;
  final int price;

  AbstractDoll(this.name, this.price);

  void sayName();
  void sayPrice();
}

// 추상 클래스를 구현하는 클래스
class Doll implements AbstractDoll {
  // static 변수
  static int seq = 0;

  // 일반 변수
  final String name;
  final int price;


  // 생성자
  Doll(String name, int price)
    : this.name = name,
      this.price = price {
    seq++;
    print('Doll seq: $seq');
  }
  // Doll(this.name, this.price); > 위와 같음

  // 생성자 fromMap
  Doll.fromMap(Map<String, dynamic> map)
    : this.name = map['name'],
      this.price = map['price'] {
    seq++;
    print('Doll seq: $seq');
  }


  // 메서드
  void sayName() {
    print('이름은 [$name]입니다.');
  }
  void sayPrice() {
    print('가격은 [$price]입니다.');
  }
}

// Doll 클래스를 상속 받는 클래스
class MyDoll extends Doll {
  // private 변수(같은 파일에서만 접근 가능 > 일반적인 개념과는 다름...)
  String _nickname = '';


  // 상속 받은 생성자
  MyDoll(String name, int price)
    : super(name, price);

  // 상속 받은 생성자 fromMap
  MyDoll.fromMap(Map<String, dynamic> map)
    : super.fromMap(map);


  // getter(private 변수 이지만 getter 함수를 이용해 다른 파일에서도 해당 변수에 접근 가능)
  String get nickname {
    return this._nickname;
  }

  // setter(최근의 객체지향 프로그래밍에서는 변수의 값을 불변성(인스턴스화 후 변경할 수 없음)으로 사용하기 때문에 거의 사용하지 않음.
  set nickname(String nickname) {
    this._nickname = nickname;
  }

  // 오버라이드 메서드
  void sayPrice() {
    final formatCurrency = new NumberFormat.simpleCurrency(locale: "ko_KR", name: "", decimalDigits: 0);
    print('가격은 [${formatCurrency.format(price)}]입니다.');
  }

  // 메서드
  void sayNickname() {
    print('애칭은 [$_nickname]입니다.');
  }
}

// Doll 클래스를 구현하는 클래스
class YourDoll implements Doll {
  // 일반 변수
  final String name;
  final int price;


  // 생성자
  YourDoll(this.name, this.price);

  // 생성자 fromMap
  YourDoll.fromMap(Map<String, dynamic> map)
    : this.name = map['name'],
      this.price = map['price'];


  // 메서드
  void sayName() {
    print('이름은 [$name]입니다.');
  }
  void sayPrice() {
    print('가격은 [$price]입니다.');
  }
}

// 믹스인
mixin DollGreetingMixin on Doll {
  void greeting() {
    print('안녕하세요. 저는 [${this.name}]이고 가격은 [${this.price}]입니다.');
  }
}

// 믹스인 적용 클래스
class MixinDoll extends Doll with DollGreetingMixin {
  MixinDoll(String name, int price)
    : super(name, price);
}

// 제네릭
class Cache<T> {
  final T data;

  Cache({
    required this.data,
  });
}

void main() {
  // 인스턴스 생성
  MyDoll doll1 = MyDoll('허그베어', 12000);

  doll1.nickname = '허그곰'; // setter 사용

  // 메서드 호출
  doll1.sayName();
  doll1.sayPrice();
  print('애칭은 [${doll1.nickname}]입니다.'); // getter 사용

  print('--------------------------------');

  MyDoll doll2 = MyDoll.fromMap({
    'name': '메탈베어',
    'price': 13000,
  });

  doll2.nickname = '메탈곰'; // setter 사용

  // 메서드 호출(케스케이드 사용)
  doll2..sayName()
    ..sayPrice()
    ..sayNickname();

  print('--------------------------------');

  YourDoll doll3 = YourDoll('빅베어', 15000);
  doll3.sayName();
  doll3.sayPrice();

  print('--------------------------------');

  MixinDoll doll4 = MixinDoll('스몰베어', 10000);
  doll4.sayName();
  doll4.sayPrice();
  doll4.greeting();

  print('--------------------------------');

  final cache = Cache<List<int>>(
    data: [1, 2, 3]
  );
  print(cache.data);
  print(cache.data.reduce((sum, val) => sum + val));

  print('--------------------------------');
}