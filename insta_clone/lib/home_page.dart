import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';

class HomePage extends StatelessWidget {
  final FirebaseUser user;

  //Constructor 를 통해 TabPage에서 쏴주는 Firebase 객체 정보를 받음.
  HomePage(this.user);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Instagram Clone',
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
      ),
      body: _buildbody(),
    );
  }
      
  Widget _buildbody() {
    return Padding(
      padding: EdgeInsets.all(8.0),
      //아이폰X부터 생긴 노치 디자인 때문에 생긴 SafeArea : 
      child: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: <Widget>[
                Text('Instagram에 오신 것을 환영합니다!',
                style: TextStyle(fontSize: 20.0)),
                Padding(padding: EdgeInsets.all(8.0)),
                Text('사진과 동영상을 보려면 팔로우 하세요.'),
                Padding(padding: EdgeInsets.all(16.0)),
                SizedBox( //width와 height속성을 줄 수 있는 SizedBox로 Widget을 Wrapping.
                  width: 240.0,
                  child: Card(
                    //카드에 그라데이션 효과를 주기위한 elevation 속성. (default 값으로 4.0을 사용.)
                    elevation: 4.0,
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          width: 80.0,
                          height: 80.0,
                          //프로필 사진
                          child: CircleAvatar(
                            backgroundImage: NetworkImage(user.photoUrl),
                          ),
                        ),
                        Padding(padding: EdgeInsets.all(8.0)),
                        Text(user.email, style: TextStyle(fontWeight: FontWeight.bold),),
                        Text(user.displayName),
                        Padding(padding: EdgeInsets.all(8.0)),
                        Row(
                          //가운데 정렬
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            //정사각형(70.0 x 70.0)의 이미지(Image.network) child를 가지는 SizedBox. 원본 이미지를 정사각형 크기에 맞게 fitting하기 위해 fit 속성의 Boxfit.cover를 추가해준다.
                            SizedBox(
                              width: 70.0,
                              height: 70.0,
                              child: Image.network('https://images.unsplash.com/photo-1506744038136-46273834b3fb?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjUxMTY3fQ&w=1000&q=80', fit: BoxFit.cover,),
                            ),
                            Padding(padding: EdgeInsets.all(1.0)),
                            SizedBox(
                              width: 70.0,
                              height: 70.0,
                              child: Image.network('https://images.unsplash.com/photo-1506744038136-46273834b3fb?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjUxMTY3fQ&w=1000&q=80', fit: BoxFit.cover,),
                            ),
                            Padding(padding: EdgeInsets.all(1.0)),
                            SizedBox(
                              width: 70.0,
                              height: 70.0,
                              child: Image.network('https://images.unsplash.com/photo-1506744038136-46273834b3fb?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjUxMTY3fQ&w=1000&q=80', fit: BoxFit.cover,),
                            ),
                          ],
                        ),
                        Padding(padding: EdgeInsets.all(8.0)),
                        Text('Facebook 친구'),
                        RaisedButton(
                          child: Text('팔로우'),
                          color: Colors.blueAccent,
                          textColor: Colors.white,
                          onPressed: (){}
                          ),
                      ],),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}