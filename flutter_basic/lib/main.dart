import 'package:flutter/material.dart';
import 'cupertino_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Colors.yellow,
        accentColor: Colors.green,
        canvasColor: Colors.purple,
      ),
      home: HelloPage('Hello World'));
      // home: CupertinoPage());
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
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: _changeMessage
        ),
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(_message, style: TextStyle(fontSize: 30),),
              Text('$_count', style: TextStyle(fontSize: 30)),
              RaisedButton(
                child: Text('화면 이동'),
                onPressed: (){
                  //push는 화면이 위로 하나씩 올라오는 것.
                  Navigator.push(
                    context, 
                    MaterialPageRoute(
                      builder: (context) => CupertinoPage())
                    ); 
                  //pop은 위에 있던 화면이 하나씩 빠지는 것.
                  // Navigator.pop(context);
                }),
            ],
          ),
        ),
    );
  }

    //메서드 하나를 생성해 floatingActionButton을 누르면 헬로 월드로 setState되게 바꿔보기 예제.
    void _changeMessage(){ 
      setState(() {        
        _message = '헬로 World!!';
        _count++;
      });
  }
}