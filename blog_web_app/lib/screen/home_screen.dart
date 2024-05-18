import 'package:flutter/material.dart';

// 웹뷰 플러그인 임포트
import 'package:webview_flutter/webview_flutter.dart';

class HomeScreen extends StatelessWidget {
  WebViewController? webViewController; // 웹뷰 컨트롤러 변수

  HomeScreen({Key? key}) : super(key: key); // const 생성자

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( // 앱바: 앱의 최상단을 차지하는 위젯
        backgroundColor: Colors.orange,
        title: Text('SG Blog'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () { // 눌렀을 때 콜백 함수
              if (webViewController != null) {
                webViewController!.loadUrl('https://pub.dev/'); // 웹뷰에서 보여줄 사이트 실행
              }
            },
            icon: Icon( // 홈 버튼 아이콘 설정
              Icons.home,
            ),
          ),
        ],
      ),
      body: WebView( // 웹뷰
        onWebViewCreated: (WebViewController controller) {
          this.webViewController = controller; // 위젯에 컨트롤러 저장
        },
        initialUrl: 'https://pub.dev/',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}