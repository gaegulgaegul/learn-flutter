import 'package:flutter/material.dart';

void main() {
  /*
   * 앱의 시작점
   * Widget 타입만 전달 가능
   * Widget은 Flutter에서 제공하는 컴포넌트 개념
   */
  runApp(const App());
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

class _AppState extends State<App> {

  bool showTitle = true;

  void titleToggle() {
    setState(() {
      showTitle = !showTitle;
    });
  }

  /**
   * BuildContext는 위젯 트리에 대한 정보가 담겨있고
   * 먼 요소의 데이터(상위 모든 부모 위젯의 정보)를 가져올 수 있다.
   */
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            color: Colors.red,
          )
        )
      ),
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              showTitle ? const MyLargeTitle() : const Text("nothing"),
              IconButton(
                onPressed: titleToggle,
                icon: const Icon(Icons.remove_red_eye)
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MyLargeTitle extends StatefulWidget {
  const MyLargeTitle({
    super.key,
  });

  @override
  State<MyLargeTitle> createState() => _MyLargeTitleState();
}

class _MyLargeTitleState extends State<MyLargeTitle> {

  /**
   * 부모 요소에 의존하는 데이터를 초기화해야 하는 경우에 사용된다.
   * initState 메서드는 항상 build 메서드보다 먼저 호출되어야 한다.
   * initState 메서드는 한번만 호출된다.
   */
  @override
  void initState() {
    print("initState!");
    super.initState();
  }

  /**
   * 위젯이 스크린에서 제거될 때 호출되는 메서드
   * API 업데이트나 이벤트 리스너로 구독 취소하는 경우,
   * form의 리스너에서 벗어나고 싶을 때 사용할 수 있다.
   */
  @override
  void dispose() {
    print("dispose!");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("build!");
    return Text(
      'My Large Title',
      style: TextStyle(
        fontSize: 30,
        color: Theme.of(context).textTheme.titleLarge?.color
      )
    );
  }
}
