import 'package:flutter/material.dart';
import 'package:random_dice/screen/home_screen.dart';
import 'package:random_dice/screen/settings_screen.dart';
import 'dart:math';
import 'package:shake/shake.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({Key? key}) : super(key: key);

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen>
    with TickerProviderStateMixin { // TickerProviderStateMixin 사용
  TabController? controller;  // 사용할 TabController 선언
  double threshold = 2.7;     // 민감도의 기본값 설정
  int number = 1;             // 주사위 숫자

  ShakeDetector? shakeDetector;

  @override
  void initState() {
    super.initState();

    // 컨트롤러 초기화(TabController를 초기화 하려면 vsync 기능이 필요)
    // vsync: this에서 this는 TickerProviderMixin
    // TickerProviderMixin는 정확히 1FPS마다 애니메이션을 실행하여 렌더링 효율을 극대화 함.
    controller = TabController(length: 2, vsync: this);

    // 컨트롤러 속성이 변경될 때마다 실행할 함수 등록
    controller!.addListener(tabListener);

    shakeDetector = ShakeDetector.autoStart( // 흔들기 감지 즉시 시작
      shakeSlopTimeMS: 100,             // 감지 주기
      shakeThresholdGravity: threshold, // 감지 민감도
      onPhoneShake: onPhoneShake,       // 흔들기 감지 후 실행할 함수
    );
  }

  void tabListener() { // 리스너로 사용할 함수
    setState(() {});
  }

  void onPhoneShake() { // 흔들기 감지 후 실행할 함수
    final rand = new Random();

    setState(() {
      number = rand.nextInt(5) + 1;
    });
  }

  @override
  dispose() {
    controller!.removeListener(tabListener);  // 리스너에 등록한 함수 등록 취소
    shakeDetector!.stopListening();           // 흔들기 감지 중지
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView( // 탭 화면을 보여줄 위젯
        controller: controller, // 컨트롤러 등록(TabBarView 위젯은 컨트롤러가 필수
        children: renderChildren(),
      ),
      bottomNavigationBar: renderBottomNavigation(), // 아래 탭 내비게이션을 구현하는 매개 변수
    );
  }

  List<Widget> renderChildren() {
    return [
      HomeScreen(number: number),
      SettingsScreen(
        threshold: threshold,
        onThresholdChange: onThresholdChange,
      ),
    ];
  }

  void onThresholdChange(double val) { // 슬라이더 값 변경 시 실행 함수
    setState(() {
      threshold = val;
    });
  }

  BottomNavigationBar renderBottomNavigation() {
    // 탭 내비게이션을 구현하는 위젯
    return BottomNavigationBar(
      currentIndex: controller!.index, // 현재 화면에 렌더링되는 탭의 인덱스
      onTap: (int index) { // 탭이 선택될 때마다 실행되는 함수
        setState(() {
          controller!.animateTo(index);
        });
      },
      items: [
        BottomNavigationBarItem( // 하단 탭바의 각 버튼을 구현
          icon: Icon(
            Icons.edgesensor_high_outlined,
          ),
          label: '주사위',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.settings,
          ),
          label: '설정',
        ),
      ],
    );
  }
}