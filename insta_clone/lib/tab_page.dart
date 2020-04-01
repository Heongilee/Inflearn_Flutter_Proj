import 'package:flutter/material.dart';
import 'package:instaclone/home_page.dart';
import 'package:instaclone/account_page.dart';
import 'package:instaclone/search_page.dart';
import 'package:firebase_auth/firebase_auth.dart';


class TabPage extends StatefulWidget {
  final FirebaseUser user;

  TabPage(this.user);

  @override
  _TabPageState createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> {
  int _selectedindex = 0;
  List _pages;

  //build 전에 그리고 constructor 직후에 호출되는 메소드. 이 메소드 안에서 초기화 같은 것들을 수행할 수 있다.
  @override
  void initState() {
    super.initState();

    _pages = [
    HomePage(widget.user),
    SearchPage(widget.user),
    AccountPage(widget.user),
    ];
  }

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