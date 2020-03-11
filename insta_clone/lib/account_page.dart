import 'package:flutter/material.dart';

class AccountPage extends StatefulWidget {
  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  Widget _buildAppBar() {
    return AppBar(
      actions: <Widget>[
        //로그아웃 버튼
        IconButton(
          icon: Icon(Icons.exit_to_app), 
          onPressed: (){}),
      ],
    );
  }

  Widget _buildBody() {
    double _row_font_size = 18.0;
    double _stack_circle_width = 80.0;
    double _stack_circle_height = 80.0;

    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        //Row안에 있는 child들 끼리의 정렬상태를 spaceBetween으로 한다.
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  //프로필 사진
                  SizedBox(
                    width: _stack_circle_width,
                    height: _stack_circle_height,
                    child: CircleAvatar(
                      backgroundImage: NetworkImage('https://images.unsplash.com/photo-1506744038136-46273834b3fb?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjUxMTY3fQ&w=1000&q=80'),
                    ),
                  ),
                  //플러스 버튼 :: FloatingActionButton
                  Container(
                    width: _stack_circle_width,
                    height: _stack_circle_height,
                    alignment: Alignment.bottomRight,
                    child: Stack(
                      alignment: Alignment.center,
                      children: <Widget>[
                        SizedBox(
                        width: 28.0,
                        height: 28.0,
                        child: FloatingActionButton(
                          backgroundColor: Colors.white,
                          child: null,
                          onPressed: null),
                        ),
                        SizedBox(
                        width: 25.0,
                        height: 25.0,
                        child: FloatingActionButton(
                          backgroundColor: Colors.blue,
                          child: Icon(Icons.add),
                          onPressed: (){}),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Text('Name',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
              ),
            ],
          ),
          Text('0\n게시물',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: _row_font_size),
          ),
          Text('0\n팔로워',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: _row_font_size),
          ),
          Text('0\n팔로잉',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: _row_font_size),
          ),
        ],
      ),
    );
  }
}