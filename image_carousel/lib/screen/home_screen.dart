import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);

    return Scaffold(
      // 여러 개의 위젯을 독단적인 페이지로 생성하고
      // 가로 또는 세로 스와이프로 페이지를 넘길 수 있게 하는 위젯
      body: PageView(
        children: [1, 2, 3, 4, 5].map((number)=>
            Image.asset(
              'asset/img/image_$number.jpeg',
              // fit: 이미지를 부모 위젯에 어떻게 채워넣을지 정의
              fit: BoxFit.cover,      // 부모 위젯 전체를 덮는 선에서 최소한 크기로 조절, 가로 또는 세로로 잘릴 수 있음
              //fit: BoxFit.contain   // 이미지가 잘리지 않는 선에서 최대한 크게 늘림
              //fit: BoxFit.fill      // 이미지의 비율을 무시하고 부모 위젯의 이미지 비율대로 이미지 크기를 조절, 이미지가 변형돼 보일 수 있음
              //fit: BoxFit.fitHeight // 이미지의 비율을 유지한 채로 부모 위젯의 높이에 이미지의 높이를 맞춤, 이미지가 잘리거나 여백이 생길 수 있음
              //fit: BoxFit.fitWidth  // 이미지의 비율을 유지한 채로 부모 위젯의 넓이에 이미지의 넓이를 맞춤, 이미지가 잘리거나 여백이 생길 수 있음
              //fit: BoxFit.none      // 원본 이미지의 크기와 비율을 그대로 사용
              //fit: BoxFit.scaleDown // BoxFit.none의 설정에 이미지를 중앙 정렬하고 부모 위젯이 이미지보다 작으면 이미지 크기를 줄여서 무모 위젯에 맞춤
            ),
        ).toList(),
      ),
    );
  }
}