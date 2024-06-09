import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';
import 'dart:io';
import 'package:vid_player/component/custom_icon_button.dart';

// 동영상 위젯 생성
class CustomVideoPlayer extends StatefulWidget {
  // 선택한 동영상을 저장할 변수
  // XFile은 ImagePicker로 영상 또는 이미지를 선택했을 때 반환하는 타입
  final XFile video;
  final GestureTapCallback onNewVideoPressed;

  const CustomVideoPlayer({
    required this.video,
    required this.onNewVideoPressed,
    Key? key,
  }) : super(key: key);

  @override
  State<CustomVideoPlayer> createState() => _CustomVideoPlayer();
}

class _CustomVideoPlayer extends State<CustomVideoPlayer> {
  // 동영상을 조작하는 컨트롤러
  VideoPlayerController? videoController;

  // 동영상 조작하는 아이콘의 visible 여부
  bool showControls = false;

  @override
  // covariant 키워드는 CustomVideoPlayer 클래스의 상속된 값도 허가해 줌.
  void didUpdateWidget(covariant CustomVideoPlayer oldWidget) {
    super.didUpdateWidget(oldWidget);

    // 새로 선택한 동영상이 같은 동영상이 아닐 때
    if (oldWidget.video.path != widget.video.path) {
      initializeController();
    }
  }

  @override
  void initState() {
    super.initState();

    initializeController(); // 컨트롤러 초기화
  }

  void initializeController() async { // 선택한 동영상으로 컨트롤러 초기화
    // final videoController = VideoPlayerController.asset( // asset 파일의 경로로부터 동영상을 불러옴
    // final videoController = VideoPlayerController.network( // 네트워크 URL로부터 동영상을 불러옴 
    final videoController = VideoPlayerController.file( // 파일 경로로부터 동영상을 불러옴
      File(widget.video.path),
    );

    await videoController.initialize();

    // 컨트롤러의 속성이 변경될 때마다 실행할 함수
    videoController.addListener(videoControllerListener);

    setState(() {
      this.videoController = videoController;
    });
  }

  // 동영상의 재생 상태가 변경될 때마다
  // setState()를 실행해서 build()를 재실행
  void videoControllerListener() {
    setState(() {});
  }

  // State가 폐기될 때 같이 폐기할 함수들을 실행
  @override
  void dispose() {
    // listener 삭제
    videoController?.removeListener(videoControllerListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // 동영상 컨트롤러가 준비 중일 때 로딩 표시
    if (videoController == null) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }

    return GestureDetector( // 화면 전체의 탭을 인식하기 위해 사용
      onTap: () {
        setState(() {
          showControls = !showControls;
        });
      },
      child: AspectRatio( // 동영상 비율에 따른 화면 렌더링
        aspectRatio: videoController!.value.aspectRatio,
        child: Stack( // children 위젯을 위로 쌓을 수 있는 위젯
          children: [
            VideoPlayer( // VideoPlayer 위젯을 Stack으로 이동
              videoController!,
            ),
            if (showControls)
              Container( // 아이콘 버튼을 보일 때 화면을 어둡게 변경
                color: Colors.black.withOpacity(0.5),
              ),
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  children: [
                    renderTimeTextFromDuration(
                      videoController!.value.position, // 동영상 현재 위치
                    ),
                    Expanded(
                      child: Slider( // 슬라이더가 남는 공간을 모두 차지하도록 구현
                        onChanged: (double val) { // 슬라이더가 이동할 때마다 실행할 함수
                          videoController!.seekTo(
                            Duration(seconds: val.toInt()),
                          );
                        },
                        value: videoController!.value.position.inSeconds.toDouble(), // 동영상 재생 위치를 초 단위로 표현
                        min: 0,
                        max: videoController!.value.duration.inSeconds.toDouble(),
                      ),
                    ),
                    renderTimeTextFromDuration(
                      videoController!.value.duration, // 동영상 총 길이
                    ),
                  ],
                ),
              ),
            ),
            if (showControls)
              Align( // 오른쪽 위에 새 동영상 아이콘 위치
                alignment: Alignment.topRight,
                child: CustomIconButton(
                  onPressed: widget.onNewVideoPressed,
                  iconData: Icons.photo_camera_back,
                ),
              ),
            if (showControls)
              Align( // 동영상 재생 관련 아이콘 중앙에 위치
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomIconButton( // 되감기 버튼
                      onPressed: onReversePressed,
                      iconData: Icons.rotate_left,
                    ),
                    CustomIconButton( // 재생 버튼
                      onPressed: onPlayPressed,
                      iconData: videoController!.value.isPlaying ? Icons.pause : Icons.play_arrow,
                    ),
                    CustomIconButton( // 앞으로 감기 버튼
                      onPressed: onForwardPressed,
                      iconData: Icons.rotate_right,
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }

  // 되감기 버튼 기능
  void onReversePressed() {
    final currentPosition = videoController!.value.position; // 현재 실행 중인 위치

    Duration position = Duration(); // 0초로 실행 위치 초기화

    // 현재 실행 위치가 3초보다 길 때만 3초 빼기
    if (currentPosition.inSeconds > 3) {
      position = currentPosition - Duration(seconds: 3);
    }

    videoController!.seekTo(position);
  }

  // 앞으로 감기 버튼 기능
  void onForwardPressed() {
    final maxPosition = videoController!.value.duration; // 동영상 길이
    final currentPosition = videoController!.value.position;

    Duration position = maxPosition; // 동영상 길이로 실행 위치 초기화

    // 동영상 길이에서 3초를 뺀 값보다 현재 위치가 짧을 때만 3초 더하기
    if ((maxPosition - Duration(seconds: 3)).inSeconds > currentPosition.inSeconds) {
      position = currentPosition + Duration(seconds: 3);
    }

    videoController!.seekTo(position);
  }

  // 재생 버튼을 눌렀을 때 기능
  void onPlayPressed() {
    if (videoController!.value.isPlaying) {
      videoController!.pause();
    } else {
      videoController!.play();
    }
  }

  Widget renderTimeTextFromDuration(Duration duration) {
    return Text( // Duration 값을 보기 편한 형태로 변환
      '${duration.inMinutes.toString().padLeft(2, '0')}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}',
      style: TextStyle(
        color: Colors.white,
      ),
    );
  }
}