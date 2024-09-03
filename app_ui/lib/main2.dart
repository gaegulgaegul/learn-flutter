import 'package:flutter/material.dart';

void main() {
  /*
   * 앱의 시작점
   * Widget 타입만 전달 가능
   * Widget은 Flutter에서 제공하는 컴포넌트 개념
   */
  runApp(App());
}

/**
 * 상태에 따라 화면이 변경될 수 있는 Widget
 *
 */
class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

/**
 * UI를 구축하는 곳
 *
 * 데이터가 변경되면 UI는 새로고침 되면서 최신 데이터를 보여준다.
 */
class _AppState extends State<App> {
  List<int> numbers = [];

  /**
   * State 클래스에게 상태가 변경되었다고 알려주는 메서드
   * State는 데이터가 변경되었으니 새로고침 한다.
   */
  void onClicked() {
    setState(() {
      numbers.add(numbers.length);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Click Count',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
              for (var num in numbers) Text(
                '$num',
                style: const TextStyle(
                  fontSize: 30,
                ),
              ),
              IconButton(
                iconSize: 40,
                onPressed: onClicked,
                icon: const Icon(
                    Icons.add_box_rounded
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}
