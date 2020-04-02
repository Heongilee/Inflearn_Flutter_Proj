import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:instaclone/detail_post_page.dart';
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
    return StreamBuilder(
      stream: Firestore.instance.collection('post').snapshots(), //post 밑에 있는 데이터들이 변경되면 snapshots이 반응해서 stream으로 들어옴. 
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if(!snapshot.hasData){  //snapshot에 데이터가 없다면...
          return Center(
            child: CircularProgressIndicator(), // Loding status를 나타내는 progressIndicator가 가운데에서 빙글빙글 돔.
          );
        }
        
        // data?.documents : data가 NULL이 아닐 때 documents를 참조하겠다는 뜻.
        // post 밑에 있는 모든 파일들을 items에 저장.( ?? [] : 만약 documents가 NULL이면 [](빈 리스트)로 초기화 하겠다.)
        var items = snapshot.data?.documents ?? [];

        return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,      //아마도 열 갯수?
              childAspectRatio: 1.0,  //1:1 정사각형 비율로 만들기 위해 1.0
              mainAxisSpacing: 1.0,   
              crossAxisSpacing: 1.0,  //미세한 간격 조정.
            ), 
            itemCount: items.length, //아이템 갯수
            itemBuilder: (context, index){
              return _buildListItem(context, items[index]);
          });
      },  
      
    );
  }

  //Parameter 타입은 생략 가능하다.
  Widget _buildListItem(context, document) {
    return Hero(
      tag: document['photoUrl'],
      child: Material(
        child: InkWell( //InkWell 위젯으로 Wrapping한 Image를 클릭시 onTap에 명시한 기능이 수행되도록 한다. (클릭 시 물결 효과가 남.)
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return DetailPostPage(document);
            }));
          },
          child: Image.network(
            document['photoUrl'], 
            fit: BoxFit.cover,
          ),
        ),
      ), 
    );
  }
}