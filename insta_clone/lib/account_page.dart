import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:instaclone/detail_post_page.dart';
import 'package:instaclone/login_page.dart';

class AccountPage extends StatefulWidget {
  final FirebaseUser user;

  AccountPage(this.user);
  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  int _postCount = 0;

  @override
  void initState() {
    super.initState();
    Firestore.instance.collection('post')
      .where('email', isEqualTo: widget.user.email)
      .getDocuments()
      .then((snapShot){
        setState(() {
          _postCount = snapShot.documents.length;
        });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  Widget _buildAppBar() {
    return AppBar(
      centerTitle: true,
      title: Text(widget.user.email, style: TextStyle(fontSize: 16.0),),
      actions: <Widget>[
        //로그아웃 버튼
        IconButton(
          icon: Icon(Icons.exit_to_app), 
          onPressed: (){
            FirebaseAuth.instance.signOut();
            _googleSignIn.signOut();
            return LoginPage();
          }),
      ],
    );
  }

  Widget _buildBody() {
    double _row_font_size = 18.0;
    double _stack_circle_width = 80.0;
    double _stack_circle_height = 80.0;

    return Column(
      children: <Widget>[
        Padding(
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
                          //_AccountPageState에서 AccountPage에 있는 변수에 접근하려면 widget.XX 로 접근하면 된다.
                          backgroundImage: NetworkImage(widget.user.photoUrl),
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
                  Padding(padding: EdgeInsets.all(5.0)),
                  Text(widget.user.displayName,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
                  ),
                ],
              ),
              Text('$_postCount\n게시물',
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
        ),
      Expanded(
        child: StreamBuilder(
          stream: Firestore.instance.collection('post').where('email', isEqualTo: widget.user.email).snapshots(), 
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if(!snapshot.hasData){
              return Center(
                child: CircularProgressIndicator(),
              );
            } //if
            
            var items = snapshot.data?.documents ?? [];

            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,      //아마도 열 갯수?
                childAspectRatio: 1.0,  //1:1 정사각형 비율로 만들기 위해 1.0
                mainAxisSpacing: 1.0,   
                crossAxisSpacing: 1.0,  //미세한 간격 조정.
              ), 
              itemCount: items.length,
              itemBuilder: (context, index){
                return _buildListItem2(context, items[index]);
              },
            );
          },
        ),
      ),
    ],
   );
  }

  Widget _buildListItem2(context, document) {
    return Hero(
      tag: document['photoUrl'],
      child: Material(
        child: InkWell(
          onTap: (){
            // TODO : 이거 안됨... 아마 위에 Hero에서 중복 태그 문제인 듯...
            // Navigator.push(context, MaterialPageRoute(builder: (context) {
            //   return DetailPostPage(document);
            // }));
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