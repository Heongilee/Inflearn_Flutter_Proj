import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'create_page.dart';

class SearchPage extends StatefulWidget {
  final FirebaseUser user;

  SearchPage(this.user);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.create),
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => CreatePage(widget.user)));
        },
        backgroundColor: Colors.blue,
        ),
      appBar: AppBar(),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return GridView.builder(
      itemCount: 5,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,      //아마도 열 갯수?
        childAspectRatio: 1.0,  //1:1 정사각형 비율로 만들기 위해 1.0
        mainAxisSpacing: 1.0,   
        crossAxisSpacing: 1.0,  //미세한 간격 조정.
        ), 
      itemBuilder: (context, index){
        return _bildContextList(context, index);
      });
  }

  Widget _bildContextList(BuildContext context, int index) {
    return Image.network('https://images.unsplash.com/photo-1506744038136-46273834b3fb?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjUxMTY3fQ&w=1000&q=80', fit: BoxFit.cover,);
  }
}