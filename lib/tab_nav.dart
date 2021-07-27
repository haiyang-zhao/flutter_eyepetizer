import 'package:flutter/material.dart';
import 'package:flutter_eyepetizer/config/string.dart';
import 'package:flutter_eyepetizer/utils/toasts.dart';

class TabNavigation extends StatefulWidget {
  @override
  _TabNavigationState createState() => _TabNavigationState();
}

class _TabNavigationState extends State<TabNavigation> {
  DateTime? lastTime;
  Widget _currentBody = Container(
    color: Colors.blue,
  );
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    //
    return WillPopScope(
        child: Scaffold(
          body: _currentBody,
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _currentIndex,
            items: _getItems(),
            onTap: _onTop,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Color(0xff000000),
            unselectedItemColor: Color(0xff9a9a9a),
          ),
        ),
        onWillPop: _onWillPop);
  }

  List<BottomNavigationBarItem> _getItems() {
    return [
      _bottomNavBtn(Strings.home, 'images/ic_home_normal.png',
          'images/ic_home_selected.png'),
      _bottomNavBtn(Strings.discovery, 'images/ic_discovery_normal.png',
          'images/ic_discovery_selected.png'),
      _bottomNavBtn(Strings.hot, 'images/ic_hot_normal.png',
          'images/ic_hot_selected.png'),
      _bottomNavBtn(Strings.mine, 'images/ic_mine_normal.png',
          'images/ic_mine_selected.png'),
    ];
  }

  BottomNavigationBarItem _bottomNavBtn(
      String title, String normalIcon, String selectedIcon) {
    return BottomNavigationBarItem(
        icon: Image.asset(
          normalIcon,
          width: 24,
          height: 24,
        ),
        activeIcon: Image.asset(
          selectedIcon,
          width: 24,
          height: 24,
        ),
        label: title);
  }

  Future<bool> _onWillPop() async {
    if (lastTime == null ||
        DateTime.now().difference(lastTime!) > Duration(seconds: 2)) {
      lastTime = DateTime.now();
      Toasts.showTip(Strings.exit_tip);
      return false;
    } else {
      return true;
    }
  }

  void _onTop(int index) {
    switch (index) {
      case 0:
        _currentBody = Container(
          color: Colors.blue,
        );
        break;
      case 1:
        _currentBody = Container(
          color: Colors.brown,
        );
        break;
      case 2:
        _currentBody = Container(
          color: Colors.amber,
        );
        break;
      case 3:
        _currentBody = Container(
          color: Colors.red,
        );
        break;
    }
    setState(() {
      _currentIndex = index;
    });
  }
}
