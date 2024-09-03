import 'package:flutter/material.dart';
import 'package:toonflix/widgets/button.dart';
import 'package:toonflix/widgets/currency_card.dart';

void main() {
  /*
   * 앱의 시작점
   * Widget 타입만 전달 가능
   * Widget은 Flutter에서 제공하는 컴포넌트 개념
   */
  runApp(App());
}

/**
 * root Widget은 구글(MaterialApp), 애플(CupertinoApp) 디자인 타입을 선택해줘야 한다.
 * Widget으로 만들기 위해 flutter SDK의 3개의 core Widget 중 하나를 상속해야 한다.
 * 모든 Widget을 상속한 클래스는 build 메서드를 구현해줘야 한다.
 *
 * StatelessWidget
 */
class App extends StatelessWidget {

  /**
   * 플러터가 실행 되면 return 되는 widget을 UI로 만드는 역할을 한다.
   *
   * Scaffold 화면의 구성 및 구조에 관한 것들을 가지고 있는 widget
   *
   * context
   */
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xFF181818),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 80,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Text(
                          'Hey, Selena',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        Text(
                          'Welcome back',
                          style: TextStyle(
                              color: Colors.white.withOpacity(0.8),
                              fontSize: 18
                          ),
                        )
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                Text(
                    'Total Balance',
                  style: TextStyle(
                    fontSize: 22,
                      color: Colors.white.withOpacity(0.8)
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  '\$5 194 482',
                  style: TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Button(
                      text: 'Transfer',
                      bgColor: Color(0xFFF2B33A),
                      textColor: Colors.black
                    ),
                    Button(
                      text: 'Request',
                      bgColor: Color(0XFF1F2123),
                      textColor: Colors.white,
                    )
                  ],
                ),
                const SizedBox(
                  height: 60,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Wallets',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 36,
                        fontWeight: FontWeight.w600
                      ),
                    ),
                    Text(
                      'View All',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.8),
                        fontSize: 18,
                      )
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const CurrencyCard(
                  name: 'Euro',
                  code: 'EUR',
                  amount: '6 428',
                  icon: Icons.euro_rounded,
                  isInverted: false,
                  order: 0,
                ),
                const CurrencyCard(
                  name: 'Bitcoin',
                  code: 'BTC',
                  amount: '9 784',
                  icon: Icons.currency_bitcoin,
                  isInverted: true,
                  order: 1,
                ),
                const CurrencyCard(
                  name: 'Dollar',
                  code: 'USD',
                  amount: '428',
                  icon: Icons.attach_money,
                  isInverted: false,
                  order: 2,
                )
              ],
            ),
          ),
        )
      ),
    );
  }

}
