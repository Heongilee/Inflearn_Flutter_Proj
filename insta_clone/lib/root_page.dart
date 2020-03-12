import 'package:flutter/material.dart';
import 'package:instaclone/login_page.dart';
// import 'package:instaclone/tab_page.dart';

class RootPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text('Instagram Clone', 
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24.0,
            ),
          ),
        ],
      )
    );
  }
}