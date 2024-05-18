import 'package:flutter/material.dart';

void main() {
  runApp(SplashScreen()); // SplashScreen 위젯을 첫 화면으로 지정
}

class SplashScreen extends StatelessWidget { // StatelessWidget을 상속하여 선언
  @override
  Widget build(BuildContext context) { // 위젯의 UI 구현
    return MaterialApp( // 항상 최상단에 입력되는 위젯
      home: Scaffold( // 항상 두 번째로 입력되는 위젯
        body: Container( // 컨테이너 위젯
          decoration: BoxDecoration( // 컨테이너를 디자인하는 클래스
            color: Color(0xFFF99231),
          ),
          child: Row(
            // 가운데 정렬
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                // 가운데 정렬
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset( // 앱에 저장된 asset 파일로 이미지를 그림
                    'assets/logo.png', // 이미지 경로
                    width: 200,
                  ),
                  CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(
                      Colors.red,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}