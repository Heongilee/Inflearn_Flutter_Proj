import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home:HelloPage('Hello World')
    );
  }
}

//StatefulWidget을 상속받은 HelloPage 클래스는 UI가 변경될 수 있는 페이지.
class HelloPage extends StatefulWidget {
  final String title;

  HelloPage(this.title);

  @override
  _HelloPageState createState() => _HelloPageState();
}

class _HelloPageState extends State<HelloPage> {
  String _message = 'Hello World...';  //변수명 앞에 언더스코어를 붙이면 private, 없으면 기본적으로 public.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //floatingActionButton 으로 우측 하단에 버튼을 생성할 수 있습니다.
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),   //child의 Icon클래스를 하나 만들어 아이콘 모양을 정할 수 있습니다.
        onPressed: _changeMessage),
      appBar: AppBar(
        title: Text(widget.title),
      ), //appBar
      body: Text(_message, style: TextStyle(fontSize: 30)),
    );
    }

    //메서드 하나를 생성해 floatingActionButton을 누르면 헬로 월드로 setState되게 바꿔보기 예제.
    void _changeMessage(){
      setState(() {
        _message = '헬로 World!!';
      });
  }
}