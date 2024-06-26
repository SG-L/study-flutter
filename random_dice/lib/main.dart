import 'package:flutter/material.dart';
import 'package:random_dice/screen/home_screen.dart';
import 'package:random_dice/screen/root_screen.dart';
import 'package:random_dice/const/colors.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: backgroundColor,
        sliderTheme: SliderThemeData( // Slider 위젯 관련 테마
          thumbColor: primaryColor, // 노브 색상
          activeTrackColor: primaryColor, // 노브가 이동한 트랙 색상
          inactiveTrackColor: primaryColor.withOpacity(0.3), // 노브가 아직 이동하지 않은 트랙 색상
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData( // BottomNavigationBar 위젯 관련 테마
          selectedItemColor: primaryColor, // 선택 상태 색
          unselectedItemColor: secondaryColor, // 비선택 상태 색
          backgroundColor: backgroundColor, // 배경 색
        ),
      ),
      home: RootScreen(),
    ),
  );
}
