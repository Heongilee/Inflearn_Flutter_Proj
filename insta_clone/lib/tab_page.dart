import 'package:flutter/material.dart';
import 'home_page.dart';
import 'account_page.dart';
import 'search_page.dart';


class TabPage extends StatefulWidget {
  @override
  _TabPageState createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> {
  int _selectedindex = 0;
  List _pages = [
    HomePage(),
    SearchPage(),
    AccountPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold( //머터리얼 디자인을 이용하기 때문에 Scaffold로 Wrapping 해줌.
    //_selectedindex에 해당하는 페이지를 body부분에 뿌려준다.
    body: Center(child: _pages[_selectedindex],),
    bottomNavigationBar: BottomNavigationBar(
      fixedColor: Colors.black,
      onTap: _onItemTapped,
              currentIndex: _selectedindex,
              items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('home')),
              BottomNavigationBarItem(icon: Icon(Icons.search), title: Text('search')),
              BottomNavigationBarItem(icon: Icon(Icons.account_circle), title: Text('account_circle')),
        ],
      ),
    );
  }

  void _onItemTapped(int value) {
    //탭을 누를 때 마다 setState로 호출이 되면서 해당 탭의 인덱스로 반영.
    //인자 값(value)으로 Tapping 된 인덱스가 들어옴.
    setState(() {
      _selectedindex = value;
    });
  }
}