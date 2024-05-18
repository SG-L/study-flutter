// material 디자인과 관련된 기능을 불러오는 코드
// material.dart 파일을 불러와야
// 플러터에서 기본 제공해주는 위젯들을 사용할 수 있다.
import 'package:flutter/material.dart';

void main() {
  runApp(
    // material 디자인 위젯(기본)
    MaterialApp(
      debugShowCheckedModeBanner: false,
      // Scaffold 위젯(기본)
      home: Scaffold(
        body: SizedBox(
          width: double.infinity,
          // child: 하나의 위젯을 SizedBox 위제에 입력 가능
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // children: 여러 위젯을 Column 위젯에 입력 가능
            children: [
              Text('SG'),
              Text('Flutter'), // 마지막 매개변수 끝에 콤마 추가
            ],
          ),
        ),
      ),
    ),
  );
}