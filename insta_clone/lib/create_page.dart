import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';


class CreatePage extends StatefulWidget {
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
          onPressed: (){},
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
    //<<비동기>> 사용자가 이미지를 선택할때까지(pickImage) 기다리는것(await). like Thread.
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