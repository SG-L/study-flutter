import 'package:flutter/material.dart';

void main() {
  // 텍스트 관련 위젯
  // runApp(TextWidgetApp());

  // 버튼 관련 위젯
  // runApp(TextButtonWidgetApp());
  // runApp(OutlineButtonWidgetApp());
  // runApp(ElevatedButtonWidgetApp());
  // runApp(IconButtonWidgetApp());
  // runApp(FloatingActionButtonWidgetApp());

  // 제스처 관련 위젯
  // runApp(GestureDetectorWidgetTapApp());
  // runApp(GestureDetectorWidgetPanApp());
  // runApp(GestureDetectorWidgetHorizontalDragApp());
  // runApp(GestureDetectorWidgetVerticalDragApp());
  // runApp(GestureDetectorWidgetScaleApp());

  // 디자인 관련 위젯
  // runApp(ContainerWidgetApp());
  // runApp(SizedBoxWidgetApp());
  // runApp(PaddingWidgetApp());
  // runApp(MarginAndPaddingWidgetApp());
  // runApp(SafeAreaWidgetApp());

  // 배치 관련 위젯
  // runApp(RowWidgetApp());
  // runApp(ColumnWidgetApp());
  // runApp(FlexibleWidgetApp());
  // runApp(ExpandedWidgetApp());
  runApp(StackWidgetApp());
}

class TextWidgetApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          // 텍스트 관련 위젯
          child: Text(
            // 작성하고 싶은 글
            'SG Flutter',
            // 글자에 스타일 적용
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w700,
              color: Colors.blue,
            ),
          ),
        ),
      ),
    );
  }
}

class TextButtonWidgetApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          // 버튼 위젯(TextButton)
          child: TextButton(
            // 클릭 시 실행
            onPressed: (){

            },
            // 스타일 지정
            style: TextButton.styleFrom(
              // 주 색상 지정
              foregroundColor: Colors.red,
            ),
            // 버튼에 넣을 위젯
            child: Text('텍스트 버튼'),
          ),
        ),
      ),
    );
  }
}

class OutlineButtonWidgetApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          // 버튼 위젯(OutlineButton)
          child: OutlinedButton(
            // 클릭 시 실행
            onPressed: (){

            },
            // 스타일 지정
            style: OutlinedButton.styleFrom(
              // 주 색상 지정
              foregroundColor: Colors.red,
            ),
            // 버튼에 넣을 위젯
            child: Text('아웃라인드 버튼'),
          ),
        ),
      ),
    );
  }
}

class ElevatedButtonWidgetApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          // 버튼 위젯(ElevatedButton)
          child: ElevatedButton(
            // 클릭 시 실행
            onPressed: (){

            },
            // 스타일 지정
            style: ElevatedButton.styleFrom(
              // 주 색상 지정
              backgroundColor: Colors.red,
            ),
            // 버튼에 넣을 위젯
            child: Text('엘리베이티드 버튼'),
          ),
        ),
      ),
    );
  }
}

class IconButtonWidgetApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          // 버튼 위젯(IconButton)
          child: IconButton(
            // 클릭 시 실행
            onPressed: (){

            },
            // 스타일 지정
            icon: Icon(
              // 플러터에서 기본으로 제공하는 아이콘
              // 제공되는 아이콘 목록은 다음 링크에서 확인 가능
              // https://fonts.google.com/icons
              Icons.home,
            ),
          ),
        ),
      ),
    );
  }
}

class FloatingActionButtonWidgetApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          // 버튼 위젯(FloaatingActionButton)
          floatingActionButton: FloatingActionButton(
            // 클릭 시 실행
            onPressed: (){

            },
            // 스타일 지정
            child: Text('클릭'),
          ),
          body: Container(),
      ),
    );
  }
}

class GestureDetectorWidgetTapApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          // 손가락으로 하는 여러 가지 입력을 인지하는 위젯
          child: GestureDetector(
            // 한 번 탭했을 때 실행할 함수
            onTap: (){
              print('on tap');
            },
            // 두 번 탭했을 때 실행할 함수
            onDoubleTap: (){
              print('on double tap');
            },
            // 길게 눌렀을 때 실행할 함수
            onLongPress: (){
              print('on long press');
            },
            // 제스처를 적용할 위젯
            child: Container(
              decoration: BoxDecoration(
                color: Colors.red,
              ),
              width: 100.0,
              height: 100.0,
            ),
          ),
        ),
      ),
    );
  }
}

class GestureDetectorWidgetPanApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          // 손가락으로 하는 여러 가지 입력을 인지하는 위젯
          child: GestureDetector(
            // 수평 또는 수직으로 드래그가 시작됐을 때 실행할 함수
            onPanStart: (dragStartDetail){
              print('on pan start: $dragStartDetail');
            },
            // 수평 또는 수직으로 드래그 하는 동안 드래그 위치가 업데이트될 때마다 실행할 함수
            onPanUpdate: (dragUpdateDetail){
              print('on pan update: $dragUpdateDetail');
            },
            // 수평 또는 수직으로 드래그가 끝났을 때 실행할 함수
            onPanEnd: (dragEndDetail){
              print('on pan end: $dragEndDetail');
            },
            // 제스처를 적용할 위젯
            child: Container(
              decoration: BoxDecoration(
                color: Colors.red,
              ),
              width: 100.0,
              height: 100.0,
            ),
          ),
        ),
      ),
    );
  }
}

class GestureDetectorWidgetHorizontalDragApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          // 손가락으로 하는 여러 가지 입력을 인지하는 위젯
          child: GestureDetector(
            // 수평으로 드래그가 시작됐을 때 실행할 함수
            onHorizontalDragStart: (dragStartDetail){
              print('on horizontalDrag start: $dragStartDetail');
            },
            // 수평으로 드래그 하는 동안 드래그 위치가 업데이트될 때마다 실행할 함수
            onHorizontalDragUpdate: (dragUpdateDetail){
              print('on horizontalDrag update: $dragUpdateDetail');
            },
            // 수평으로 드래그가 끝났을 때 실행할 함수
            onHorizontalDragEnd: (dragEndDetail){
              print('on horizontalDrag end: $dragEndDetail');
            },
            // 제스처를 적용할 위젯
            child: Container(
              decoration: BoxDecoration(
                color: Colors.red,
              ),
              width: 100.0,
              height: 100.0,
            ),
          ),
        ),
      ),
    );
  }
}

class GestureDetectorWidgetVerticalDragApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          // 손가락으로 하는 여러 가지 입력을 인지하는 위젯
          child: GestureDetector(
            // 수직으로 드래그가 시작됐을 때 실행할 함수
            onVerticalDragStart: (dragStartDetail){
              print('on vertical start: $dragStartDetail');
            },
            // 수직으로 드래그 하는 동안 드래그 위치가 업데이트될 때마다 실행할 함수
            onVerticalDragUpdate: (dragUpdateDetail){
              print('on vertical update: $dragUpdateDetail');
            },
            // 수직으로 드래그가 끝났을 때 실행할 함수
            onVerticalDragEnd: (dragEndDetail){
              print('on vertical end: $dragEndDetail');
            },
            // 제스처를 적용할 위젯
            child: Container(
              decoration: BoxDecoration(
                color: Colors.red,
              ),
              width: 100.0,
              height: 100.0,
            ),
          ),
        ),
      ),
    );
  }
}

class GestureDetectorWidgetScaleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          // 손가락으로 하는 여러 가지 입력을 인지하는 위젯
          child: GestureDetector(
            // 확대가 시작됐을 때을 때 실행할 함수
            onScaleStart: (scaleStartDetail){
              print('on scale start: $scaleStartDetail');
            },
            // 확대가 진행되는 동안 확대가 업데이트될 때마다 실행할 함수
            onScaleUpdate: (scaleUpdateDetail){
              print('on scale update: $scaleUpdateDetail');
            },
            // 확대가 끝났을 때 실행할 함수
            onScaleEnd: (scaleEndDetail){
              print('on scale end: $scaleEndDetail');
            },
            // 제스처를 적용할 위젯
            child: Container(
              decoration: BoxDecoration(
                color: Colors.red,
              ),
              width: 100.0,
              height: 100.0,
            ),
          ),
        ),
      ),
    );
  }
}

class ContainerWidgetApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          // 다른 위젯을 담는 위젯
          child: Container(
            // 높이
            height: 200.0,
            // 너비
            width: 100.0,

            // 스타일 적용
            decoration: BoxDecoration(
              // 배경 색 적용
              color: Colors.red,
              // 테두리 적용
              border: Border.all(
                // 테두리 굵기
                width: 16.9,
                // 테두리 색
                color: Colors.black,
              ),
              // 모서리 둥글게 만들기
              borderRadius: BorderRadius.circular(
                  16.0
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SizedBoxWidgetApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          // 일반적으로 일정 크기의 공간을 공백으로 두고 싶을 때 사용하는 위젯
          child: SizedBox(
            // 높이
            height: 200.0,
            // 너비
            width: 200.0,
            // SizedBox는 색상이 없으므로 크기를 확이하는 용도로 Container 추가
            child: Container(
              color: Colors.red,
            ),
          ),
        ),
      ),
    );
  }
}

class PaddingWidgetApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Container(
            color: Colors.blue,
            // child 위젯에 여백을 제공할 때 사용하는 위젯
            child: Padding(
              // 상하, 좌우로 모두 16픽셀만큼 패딩 적용
              padding: EdgeInsets.all(
                16.0,
              ),
              child: Container(
                color: Colors.red,
                width: 50.0,
                height: 50.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MarginAndPaddingWidgetApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          // 최상위 검정 컨테이너 (margin이 적용되는 대상)
          child: Container(
            color: Colors.black,

            // 중간 파란 컨테이너
            child: Container(
              color: Colors.blue,
              // 마직 적용 위치
              margin: EdgeInsets.all(
                  16.0
              ),

              // 패딩 적용
              child: Padding(
                // 상하, 좌우로 모두 16픽셀만큼 패딩 적용
                padding: EdgeInsets.all(
                  16.0,
                ),
                // 패딩이 적용된 빨간 컨테이너
                child: Container(
                  color: Colors.red,
                  width: 50.0,
                  height: 50.0,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SafeAreaWidgetApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SizedBox(
          // 노치 디자인등에 가리지 않는 안전한 화면에 위젯을 그릴 수 있게 하는 위젯
          child: SafeArea(
            // 원하는 부분만 따로 적용할 수도 있음.
            // true는 적용, false는 미적용
            top: true,
            bottom: true,
            left: true,
            right: true,
            child: Container(
              color: Colors.red,
              height: 300.0,
              width: 300.0,
            ),
          ),
        ),
      ),
    );
  }
}

class RowWidgetApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SizedBox(
          // 반대축에서 이동할 공간을 제공하기 위해 높이를 최대한으로 설정
          height: double.infinity,
          child: Row(
            // 주축 정렬 지정
            mainAxisAlignment: MainAxisAlignment.start,
            // [start, center, end, spaceBetween, spaceAround, spaceEvenly]

            // 반대축 정렬 지정
            crossAxisAlignment: CrossAxisAlignment.center,
            // [start, center, end, stretch]

            // 넣고 싶은 위젯 입력
            children: [
              Container(
                height: 50.0,
                width: 50.0,
                color: Colors.red,
              ),

              // SizedBox는 일반적으로 공백을 생성할 때 사용
              const SizedBox(width: 12.0),

              Container(
                height: 50.0,
                width: 50.0,
                color: Colors.green,
              ),

              const SizedBox(width: 12.0),

              Container(
                height: 50.0,
                width: 50.0,
                color: Colors.blue,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ColumnWidgetApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SizedBox(
          // 반대축에서 이동할 공간을 제공하기 위해 너비를 최대한으로 설정
          width: double.infinity,
          child: Column(
            // 주축 정렬 지정
            mainAxisAlignment: MainAxisAlignment.start,
            // [start, center, end, spaceBetween, spaceAround, spaceEvenly]

            // 반대축 정렬 지정
            crossAxisAlignment: CrossAxisAlignment.center,
            // [start, center, end, stretch]

            // 넣고 싶은 위젯 입력
            children: [
              Container(
                height: 50.0,
                width: 50.0,
                color: Colors.red,
              ),

              // SizedBox는 일반적으로 공백을 생성할 때 사용
              const SizedBox(width: 12.0),

              Container(
                height: 50.0,
                width: 50.0,
                color: Colors.green,
              ),

              const SizedBox(width: 12.0),

              Container(
                height: 50.0,
                width: 50.0,
                color: Colors.blue,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FlexibleWidgetApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              Flexible(
                // flex는 남은 공간을 차지할 비율을 의미
                // flex값을 제공하지 않으면 기본값은 1
                flex: 1,

                // 파란색 Container
                child: Container(
                  color: Colors.blue,
                ),
              ),
              Flexible(
                flex: 1,

                // 빨간색 Container
                child: Container(
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ExpandedWidgetApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              // 남아 있는 공간을 최대한으로 차지하는 위젯
              Expanded(
                child: Container(
                  color: Colors.blue,
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class StackWidgetApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SizedBox(
          child: Stack(
            children: [
              // 빨간색 Container
              Container(
                height: 300.0,
                width: 300.0,
                color: Colors.red,
              ),
              // 노란색 Container
              Container(
                height: 250.0,
                width: 250.0,
                color: Colors.yellow,
              ),
              // 파란색 Container
              Container(
                height: 200.0,
                width: 200.0,
                color: Colors.blue,
              ),
            ],
          ),
        ),
      ),
    );
  }
}