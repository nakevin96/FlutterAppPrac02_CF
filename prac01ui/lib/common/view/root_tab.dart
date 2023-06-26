import 'package:flutter/material.dart';
import 'package:prac01ui/common/const/colors.dart';
import 'package:prac01ui/common/layout/defalut_layout.dart';
import 'package:prac01ui/restaurant/view/restaurant_screen.dart';

class RootTab extends StatefulWidget {
  const RootTab({super.key});

  @override
  State<RootTab> createState() => _RootTabState();
}

// Tabcontroller를 만들기 위해 SingleTickerProviderStateMixin 사용
class _RootTabState extends State<RootTab> with SingleTickerProviderStateMixin {
  late TabController controller;
  int index = 0;

  @override
  void initState() {
    super.initState();

    // vsync는 렌더링 엔진에서 필요한 것으로
    // 컨트롤러를 선언하는 현재 state, stateful widget을 넣어주면 됩니다.
    // 이 값은 특정 기능을 가지고 있어야 합니다.
    // SingleTickerProviderStateMixin 이 값을 가지고 있는 것만 vsync에 들어갈 수 있습니다.
    // 애니메이션과 관련된 컨트롤러들의 경우 이런 세팅을 하는 경우가 종종 존재합니다.
    controller = TabController(
      length: 4,
      vsync: this,
    );

    // 컨트롤러에서 값이 변경이 될 때 마다, 특정 작업을 수행하라 라는 함수
    controller.addListener(bottomTabListener);
  }

  // dispose method는 Stateful Widget이 사라질 때 호출되는 메소드입니다.
  // 여기서 사용을 마친 리소스를 해제하여 메모리 누수를 방지할 수 있습니다.
  // 현재 TabContoller에 대한 리스너를 추가하고 있는데
  // dispose를 통해 listener를 제거하지 않으면 컨트롤러와 관련된 객체는 메모리에 계속 유지됩니다.
  @override
  void dispose() {
    super.dispose();

    controller.removeListener(bottomTabListener);
  }

  void bottomTabListener() {
    setState(() {
      index = controller.index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: '이세계 아이돌 최고',
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
          // 선택한 bottom navigator 요소의 index로 controller가 스크린을 이동시켜 줍니다.
          controller.animateTo(selectedIndex);
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
      child: TabBarView(
        // physics에 NeverScrollableScrollPhysics를 붙이지 않는다면 화면을 옆으로 스크롤 하여 화면을 넘길 수 있습니다.
        // ScrollPhysics는 Flutter의 스크롤 동작을 제어하는 물리적 규칙들의 집합입니다.
        // Flutter 스크롤 뷰 위젯들은 스스로 스크롤 동작에 대한 물리적 특성을 가질 수 있도록 ScrollPhysics를 설정할 수 있으며
        // 이를 통해 스크롤 동작의 속도, 감속, 경계 도달 등을 제어하는데 사용할 수 있습니다.
        physics: const NeverScrollableScrollPhysics(),
        controller: controller,
        children: const [
          RestaurantScreen(),
          Center(
              child: Text(
            '음식',
          )),
          Center(
              child: Text(
            '주문',
          )),
          Center(
              child: Text(
            '프로필',
          )),
        ],
      ),
    );
  }
}
