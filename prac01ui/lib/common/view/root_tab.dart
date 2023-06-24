import 'package:flutter/material.dart';
import 'package:prac01ui/common/const/colors.dart';
import 'package:prac01ui/common/layout/defalut_layout.dart';

class RootTab extends StatefulWidget {
  const RootTab({super.key});

  @override
  State<RootTab> createState() => _RootTabState();
}

class _RootTabState extends State<RootTab> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: '코팩 딜리버리',

      // bottom 네비게이션 바를 만드는 코드
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: PRIMARY_COLOR,
        unselectedItemColor: BODY_TEXT_COLOR,
        selectedFontSize: 10,
        unselectedFontSize: 10,
        // 기본 shifting은 누를때마다 아이콘이 확대되며 shifting됨 싫다면 fixed로 바꾸면 됨
        type: BottomNavigationBarType.shifting,
        // 네비게이션 바 탭을 클릭했을 때 index이동시키기
        onTap: (int selectedIndex) {
          setState(() {
            index = selectedIndex;
          });
        },
        // 현재 인덱스가 몇번인지 지정
        currentIndex: index,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: '홈',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fastfood_outlined),
            label: '음식',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt_long_outlined),
            label: '주문',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outlined),
            label: '프로필',
          ),
        ],
      ),
      child: const Center(
        child: Text('Root tab'),
      ),
    );
  }
}
