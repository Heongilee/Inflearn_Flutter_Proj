import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:io';


class CreatePage extends StatefulWidget {
  final FirebaseUser user;

  CreatePage(this.user);

  @override
  _CreatePageState createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  final textEditingController = TextEditingController();

  File _image;  //import 'dart:io';

  //메소드 오버라이딩 :: 위에서 만든 textEditingController의 소멸자.
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    textEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildappBar(),
      body: _buildBody(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        child: Icon(Icons.add_a_photo),
        onPressed: _getImage,
        ),
    );
  }

  Widget _buildappBar() {
    return AppBar(
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.send),
          onPressed: (){
            // .\post\XXX.png 라는 이름으로 이미지를 Firestorage에 저장할 것.
            final FirebaseStorageRef = FirebaseStorage
            .instance.ref()
            .child('post')
            .child('${DateTime.now().millisecondsSinceEpoch}.png');

            final task = FirebaseStorageRef.putFile(
              _image, StorageMetadata(contentType: 'image/png')
            );

            // XX.then() : 어떠한 조건에 만족했다고 한다면...? (비동기 처리 키워드)
            task.onComplete.then((value){
              var downloadUrl = value.ref.getDownloadURL();

              downloadUrl.then((uri){
                var doc = Firestore.instance.collection('post').document();

                //setData(Map<String, Dynamic>) :: Map 형식의 데이터를 넣는데 가장 쉬운 방법은 JSON형태로 넣는 것.
                doc.setData({
                  'id' : doc.documentID,
                  'photoUrl' : uri.toString(),
                  'contents' : textEditingController.text,
                  'email' : widget.user.email,
                  'displayName' : widget.user.displayName,
                  'userPhotoUrl' : widget.user.photoUrl,
                }).then((onValue){
                  Navigator.pop(context); //이전 화면으로 넘어 감.
                });
              });
            });
          },
        ),
      ],
    );
  }

  Widget _buildBody() {
    // 사진이 너무 커서 PixelOverflow Error가 뜰 경우, SingleChildScrollView 위젯으로 Wrapping 해준다.
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          //Ternary Operator
          _image == null ? Text('No Image') : Image.file(_image),
          TextField(
            //이를 사용하기 위해 위쪽에 
            //final textEditingController = TextEditingController();
            //를 선언해줘야 사용할 수 있다. 
            controller: textEditingController,

            //내용을 입력하세요.
            decoration: InputDecoration(hintText: '내용을 입력하세요.'),
          ),
        ],
      ),
    );
  }

  Future _getImage() async {
    // <<비동기>> 사용자가 이미지를 선택할때까지(pickImage) 기다리는것(await). like Thread.
    File image = await ImagePicker.pickImage(source: ImageSource.gallery);
    //에러가 뜬다.
    //pickImage의 반환형은 Future<File>이지만, 사용자가 선택하기 전까지는 아니기 때문,
    //await 키워드를 이용하기 위해서 Future 타입 반환형의 asyc 키워드를 사용한 메소드에
    //File(dart.io를 import)형으로 받아서 사용해야 한다.
    
    //만약에 에러가 뜬다면, [프로젝트 폴더]\android\app\build.gradle로 가서
    //minSdkVersion을 21이상
    //compileSdkVersion을 28이상 써 줘야 한다.

    //SelectedImage를 이미지에 반영시켜야 하기 때문에 setState 사용.
    setState(() {
      _image = image;   
    });
  }
}